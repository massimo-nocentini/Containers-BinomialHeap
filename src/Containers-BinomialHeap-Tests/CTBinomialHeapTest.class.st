"
A BinomialHeapTest is a test class for testing the behavior of BinomialHeap
"
Class {
	#name : #CTBinomialHeapTest,
	#superclass : #CTBinaryTreeAbstractTest,
	#category : #'Containers-BinomialHeap-Tests'
}

{ #category : #tests }
CTBinomialHeapTest >> tree: aCollection [

	^ aCollection asBinomialHeap
]
