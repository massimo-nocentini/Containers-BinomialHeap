"
I am a tree of a `CTBinomialHeap`: a `content` and my `children`, which is the first of a chain of links to other trees, or nil when I am a leaf. I do not know my rank, the heap keeps it.

`linkBinomialTree:` answers a new tree out of me and another one: the greater of the two contents becomes the root of the first child of the other. When they are equal, the argument is the root.

```smalltalk
((CTBinomialTree leaf: 3) linkBinomialTree:
	(CTBinomialTree leaf: 1)) content ""1""
```
"
Class {
	#name : #CTBinomialTree,
	#superclass : #Object,
	#instVars : [
		'content',
		'children'
	],
	#category : #'Containers-BinomialHeap'
}

{ #category : #creating }
CTBinomialTree class >> leaf: anObject [
	^ self node: anObject children: nil
]

{ #category : #creating }
CTBinomialTree class >> node: anObject children: children [
	^ self new
		content: anObject;
		children: children;
		yourself
]

{ #category : #accessing }
CTBinomialTree >> children [
	^ children
]

{ #category : #accessing }
CTBinomialTree >> children: anObject [
	children := anObject
]

{ #category : #accessing }
CTBinomialTree >> content [
	^ content
]

{ #category : #accessing }
CTBinomialTree >> content: anObject [
	content := anObject
]

{ #category : #'as yet unclassified' }
CTBinomialTree >> linkBinomialTree: aTree [
	| x |
	x := aTree content.
	^ content < x
		ifTrue: [ self class node: content children: aTree ~~> children ]
		ifFalse: [ self class node: x children: self ~~> aTree children ]
]
