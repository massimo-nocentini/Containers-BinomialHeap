Class {
	#name : #CTBinomialHeap,
	#superclass : #Object,
	#instVars : [
		'representation'
	],
	#category : #'Containers-BinomialHeap'
}

{ #category : #requirements }
CTBinomialHeap class >> empty [

	^ self new
		  representation: nil;
		  yourself
]

{ #category : #adding }
CTBinomialHeap >> ifEmpty: eBlock ifNotEmpty: neBlock [
	^ representation ifNil: eBlock ifNotNil: neBlock
]

{ #category : #'as yet unclassified' }
CTBinomialHeap >> isEmpty [
	^ self ifEmpty: [ true ] ifNotEmpty: [ false ]
]

{ #category : #adding }
CTBinomialHeap >> merge: trees with: otherTrees [
	^ trees
		ifNil: [ otherTrees ]
		ifNotNil: [ otherTrees
				ifNil: [ trees ]
				ifNotNil:
					[ | aTree anotherTree allButFirstTrees allButFirstOtherTrees aRank anotherRank |
					"Getting rests of both collections of trees to merge."
					allButFirstTrees := trees nextLink.
					allButFirstOtherTrees := otherTrees nextLink.

					"Getting current topmost trees."
					aTree := trees value.
					anotherTree := otherTrees value.

					"Getting ranks."
					aRank := aTree key.
					anotherRank := anotherTree key.

					"Rank comparison via `#key`."
					aRank < anotherRank
						ifTrue: [ aTree ~~> (self merge: allButFirstTrees with: otherTrees) ]
						ifFalse: [ anotherRank < aRank
								ifTrue: [ anotherTree ~~> (self merge: trees with: allButFirstOtherTrees) ]
								ifFalse: [ | binomialTree mergedTrees |
									"Invariant: both `aTree` and `anotherTree` have the *same* rank."
									binomialTree := aTree value
										linkBinomialTree: anotherTree value.
									mergedTrees := self
										merge: allButFirstTrees
										with: allButFirstOtherTrees.
									self pushTree: aRank + 1 -> binomialTree onTrees: mergedTrees ] ] ] ]
]

{ #category : #adding }
CTBinomialHeap >> min [
	^ self
		ifEmpty: [ CollectionIsEmpty signal ]
		ifNotEmpty: [ :trees | (self min: trees) first value content ]
]

{ #category : #adding }
CTBinomialHeap >> min: trees [
	| tree |
	tree := trees value.
	^ trees nextLink
		ifNil: [ Array with: tree with: nil ]
		ifNotNil: [ :nl | 
			| tuple anotherTree |
			tuple := self min: nl.
			anotherTree := tuple first.
			tree value content <= anotherTree value content
				ifTrue: [ Array with: tree with: nl ]
				ifFalse: [ Array with: anotherTree with: tree ~~> tuple second ] ]
]

{ #category : #adding }
CTBinomialHeap >> pop [

	^ self ifEmpty: [ CollectionIsEmpty signal ] ifNotEmpty: [ :trees | 
		  | tuple tree min |
		  tuple := self min: trees.
		  tree := tuple first.
		  min := tree value content.
		  representation := self
			                    merge:
				                    ((tree key - 1 to: 0 by: -1) asValueLink
					                     with: tree value children
					                     collect: #->) reversed
			                    with: tuple second.
		  min ]
]

{ #category : #adding }
CTBinomialHeap >> push: x [

	representation := self
		                  pushTree: 0 -> (CTBinomialTree leaf: x)
		                  onTrees: representation
]

{ #category : #adding }
CTBinomialHeap >> pushTree: anAssociation onTrees: trees [
	^ trees
		ifNil: [ anAssociation ~~> trees ]
		ifNotNil: [ | carAssociation rank |
			rank := anAssociation key.
			carAssociation := trees value.
			rank < carAssociation key
				ifTrue: [ anAssociation ~~> trees ]
				ifFalse: [ self
						pushTree:
							rank + 1
								-> (anAssociation value linkBinomialTree: carAssociation value)
						onTrees: trees nextLink ] ]
]

{ #category : #accessing }
CTBinomialHeap >> representation: anObject [
	representation := anObject
]
