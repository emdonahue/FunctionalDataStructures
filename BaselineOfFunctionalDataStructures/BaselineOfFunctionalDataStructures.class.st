Class {
	#name : #BaselineOfFunctionalDataStructures,
	#superclass : #BaselineOf,
	#category : #BaselineOfFunctionalDataStructures
}

{ #category : #accessing }
BaselineOfFunctionalDataStructures >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec 
				package: 'FunctionalDataStructures-Core';
				package: 'FunctionalDataStructures-Tests' with: [ spec requires: #('FunctionalDataStructures-Core') ] ]
]

{ #category : #accessing }
BaselineOfFunctionalDataStructures >> projectClass [ 
	^ MetacelloCypressBaselineProject
]
