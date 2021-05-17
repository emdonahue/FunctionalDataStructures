Trait {
	#name : #FDSCollectionEmpty,
	#classInstVars : [
		'singleton'
	],
	#traits : 'FDSCollection',
	#classTraits : 'FDSCollection classTrait',
	#category : #'FunctionalDataStructures-Core-superclasses'
}

{ #category : #classes }
FDSCollectionEmpty classSide >> emptyClass [
]

{ #category : #'as yet unclassified' }
FDSCollectionEmpty classSide >> fullClass [
	self explicitRequirement.
]

{ #category : #requirements }
FDSCollectionEmpty classSide >> singleton [
	singleton ifNil: [ singleton := self new ].
	^ singleton.
]

{ #category : #comparing }
FDSCollectionEmpty >> = aCollection [
	^ self == aCollection.
]

{ #category : #enumerating }
FDSCollectionEmpty >> do: aBlock [
]

{ #category : #testing }
FDSCollectionEmpty >> ifEmpty: aBlock ifNotEmpty: bBlock [
	^ aBlock value.
]

{ #category : #testing }
FDSCollectionEmpty >> isEmpty [ 	
	^ true.
]

{ #category : #lazy }
FDSCollectionEmpty >> rejectOne: aBlock [
	
]

{ #category : #removing }
FDSCollectionEmpty >> reverse [
]

{ #category : #enumerating }
FDSCollectionEmpty >> reverseDo: aBlock [
]
