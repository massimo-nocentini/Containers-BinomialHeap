Class {
	#name : #BaselineOfContainersBinomialHeap,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersBinomialHeap
}

{ #category : #baselines }
BaselineOfContainersBinomialHeap >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Externals."
		spec
			baseline: 'ContainersEssentials'
			with: [ spec repository: 'github://massimo-nocentini/Containers-Essentials:master' ].

		spec
			baseline: 'ContainersBinaryTreeAbstract'
			with: [ spec repository: 'github://massimo-nocentini/Containers-BinaryTreeAbstract:master/src' ].

		"Packages"
		spec
			package: 'Containers-BinomialHeap'
			with: [ spec requires: #( 'ContainersEssentials' ) ];
			package: 'Containers-BinomialHeap-Visualizations'
			with: [ spec requires: #( 'Containers-BinomialHeap' ) ];
			package: 'Containers-BinomialHeap-Tests'
			with: [ spec requires: #( 'Containers-BinomialHeap' 'ContainersBinaryTreeAbstract' ) ] ]
]
