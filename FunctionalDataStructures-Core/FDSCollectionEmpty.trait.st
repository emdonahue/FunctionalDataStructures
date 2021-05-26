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
FDSCollectionEmpty classSide >> associationClass [
	^ FDSAssociation.
]

{ #category : #classes }
FDSCollectionEmpty classSide >> emptyClass [
]

{ #category : #'as yet unclassified' }
FDSCollectionEmpty classSide >> fullClass [
	self explicitRequirement.
]

{ #category : #'as yet unclassified' }
FDSCollectionEmpty classSide >> listClass [
	^ FDSLinkedList.
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

{ #category : #lazy }
FDSCollectionEmpty >> append: aCollection [
	^ aCollection.
]

{ #category : #accessing }
FDSCollectionEmpty >> at: aKey ifPresent: pBlock ifAbsentPut: aBlock [ 
	^ self add: (self associationClass key: aKey val: aBlock value).
]

{ #category : #enumerating }
FDSCollectionEmpty >> collect: aBlock [ 
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

{ #category : #'as yet unclassified' }
FDSCollectionEmpty >> replace: rBlock ifFound: fBlock [
]

{ #category : #'as yet unclassified' }
FDSCollectionEmpty >> replace: rBlock ifFound: fBlock ifNone: nBlock [
	^ nBlock value.
]

{ #category : #removing }
FDSCollectionEmpty >> reverse [
]

{ #category : #enumerating }
FDSCollectionEmpty >> reverseDo: aBlock [
]

{ #category : #enumerating }
FDSCollectionEmpty >> select: aBlock [
]
