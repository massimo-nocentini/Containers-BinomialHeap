"
A BinomialHeapTest is a test class for testing the behavior of BinomialHeap
"
Class {
	#name : #BinomialHeapTest,
	#superclass : #CTBinaryTreeAbstractTest,
	#category : #'Containers-BinomialHeap-Tests'
}

{ #category : #tests }
BinomialHeapTest >> tree: aCollection [

	^ aCollection asBinomialHeap
]
