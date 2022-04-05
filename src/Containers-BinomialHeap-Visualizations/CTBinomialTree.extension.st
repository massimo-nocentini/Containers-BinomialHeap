Extension { #name : #CTBinomialTree }

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialTree >> asShapeTree [

	| shapes associations lines edgeBuilder |
	shapes := Dictionary new.
	associations := OrderedCollection new.

	self shapes: shapes edges: associations.

	edgeBuilder := RSLineBuilder horizontalBezier
		               attachPoint: (RSHorizontalAttachPoint new
				                startOffset: Float goldenRatio;
				                endOffset: Float goldenRatio negated;
				                yourself);
		               yourself.

	lines := associations collect: [ :each | 
		         edgeBuilder
			         edgeFrom: (shapes at: each key)
			         to: (shapes at: each value) ].

	RSHorizontalVanDerPloegTreeLayout on: shapes edges: lines.

	^ RSComposite new
		  model: self;
		  shapes: shapes , lines;
		  yourself
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialTree >> edges [
	^ self edges: content -> content ~~> nil
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialTree >> edges: incomingEdges [
	^ children asLinkedList
		foldr: [ :each :acc | each edges: content -> each content ~~> acc ]
		init: incomingEdges
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialTree >> nodes [
	| subtreeChildren |
	subtreeChildren := children asLinkedList flatCollect: [ 
		                   :aBinomialTree | aBinomialTree nodes ].
	^ Array with: self withAll: subtreeChildren
]

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTBinomialTree >> shapes: shapes edges: associations [

	| aShape |
	aShape := RSLabel new
		          model: self content;
		          fontName: 'Source Code Pro';
		          yourself.

	shapes at: self put: aShape.

	self children do: [ :each | 
		associations add: self -> each.
		each shapes: shapes edges: associations ]
]
