Class {
	#name : #BaselineOfContainersUniqueOrdered,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersUniqueOrdered
}

{ #category : #baselines }
BaselineOfContainersUniqueOrdered >> baseline: spec [
	<baseline>

	spec 
		for: #pharo 
		do: [		
			spec package: 'Containers-UniqueOrdered'.
			spec
				package: 'Containers-UniqueOrdered-Tests'
				with: [ spec requires: #( 'Containers-UniqueOrdered') ].
		] 
	
]
