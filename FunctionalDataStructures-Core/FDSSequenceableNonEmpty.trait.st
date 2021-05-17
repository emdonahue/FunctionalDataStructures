Trait {
	#name : #FDSSequenceableNonEmpty,
	#traits : 'FDSCollectionNonEmpty',
	#classTraits : 'FDSCollectionNonEmpty classTrait',
	#category : #'FunctionalDataStructures-Core-superclasses'
}

{ #category : #comparing }
FDSSequenceableNonEmpty >> = aCollection [
	self class = aCollection class ifFalse: [ ^ false ].
	self first = aCollection first ifFalse: [ ^ false ].
	^ self rest = aCollection rest.
]
