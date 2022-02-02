Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Containers-BinomialHeap-Visualizations' }
CTSlotDescriptorsVisitor >> visitCTBinomialHeap: aHeap [

	^ (self visitObject: aHeap)
	  ,
	  (aHeap ifEmpty: [ {  } ] ifNotEmpty: [ { #min asSlotDescriptor } ])
	  , { (#asShapeForest asSlotDescriptor
			   inline;
			   quote) }
]
