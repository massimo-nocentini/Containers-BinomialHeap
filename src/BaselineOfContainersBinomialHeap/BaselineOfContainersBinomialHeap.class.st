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
			with: [ 
			spec repository: 'github://massimo-nocentini/Containers-Essentials' ].

		"Packages"
		spec
			package: 'Containers-BinomialHeap';
			package: 'Containers-BinomialHeap-Visualizations';
			package: 'Containers-BinomialHeap-Tests' ]
]
