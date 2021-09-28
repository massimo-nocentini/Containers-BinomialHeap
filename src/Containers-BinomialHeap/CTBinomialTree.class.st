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
