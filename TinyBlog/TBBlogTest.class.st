Class {
	#name : #TBBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first'
	],
	#category : #'TinyBlog-Tests'
}

{ #category : #initialization }
TBBlogTest >> setUp [
	blog := TBBlog current.
	blog removeAllPosts.
	first := TBPost title: 'A title' text: 'A text' category: 'First Category'.
	blog writeBlogPost: first.
	
	post := (TBPost title: 'Another title' text: 'Another text' category: 'Second Category') beVisible
]

{ #category : #initialization }
TBBlogTest >> tearDown [
	TBBlog reset
]

{ #category : #initialization }
TBBlogTest >> testAddBlogPost [
	blog writeBlogPost: post.
	self assert: blog size equals: 2
]

{ #category : #initialization }
TBBlogTest >> testAllBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allBlogPosts size equals: 2
]

{ #category : #initialization }
TBBlogTest >> testAllBlogPostsFromCategory [
	self assert: (blog allBlogPostsFromCategory: 'First Category') size equals: 1
]

{ #category : #tests }
TBBlogTest >> testAllCategories [
	blog writeBlogPost: post.
	self assert: blog allCategories size equals: 2
]

{ #category : #initialization }
TBBlogTest >> testAllVisibleBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allVisibleBlogPosts size equals: 1
]

{ #category : #initialization }
TBBlogTest >> testAllVisibleBlogPostsFromCategory [
	blog writeBlogPost: post.
	self assert: (blog allVisibleBlogPostsFromCategory: 'First Category') size equals: 0.
	self assert: (blog allVisibleBlogPostsFromCategory: 'Second Category') size equals: 1
	
]

{ #category : #initialization }
TBBlogTest >> testRemoveAllBlogPosts [
	blog removeAllPosts.
	self assert: blog size equals: 0
]

{ #category : #initialization }
TBBlogTest >> testSize [
	self assert: blog size equals: 1
]

{ #category : #tests }
TBBlogTest >> testUnclassifiedBlogPosts [
	self assert: (blog allBlogPosts select: [:p | p isUnclassified ]) size equals: 0
]
