Class {
	#name : #TBPostTest,
	#superclass : #TestCase,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #'TinyBlog-Tests'
}

{ #category : #tests }
TBPostTest >> testPostIsCreatedCorrectly [
| post | 
post := TBPost 
	title: 'Welcome to TinyBlog' 
	text:  'TinyBlog is a small blog engine made with Pharo.'
	category: 'TinyBlog'.
	self assert: post title equals: 'Welcome to TinyBlog'.
	self assert: post text equals: 'TinyBlog is a small blog engine made with Pharo.' .
]

{ #category : #tests }
TBPostTest >> testWithoutCategoryIsUnclassified [
| post | 
post := TBPost 
	title: 'Welcome to TinyBlog' 
	text:  'TinyBlog is a small blog engine with Pharo.'.
	self assert: post title equals: 'Welcome to TinyBlog'.
	self assert: post category equals: TBPost unclassifiedTag .
	self deny: post isVisible 
]
