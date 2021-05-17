Trait {
	#name : #FDSAbstractQueueEmpty,
	#traits : 'FDSAbstractQueue + FDSCollectionEmpty',
	#classTraits : 'FDSAbstractQueue classTrait + FDSCollectionEmpty classTrait',
	#category : #'FunctionalDataStructures-Core-abstract'
}

{ #category : #adding }
FDSAbstractQueueEmpty >> add: anElement [
	^ self fullClass new head: (FDSLinkedList with: anElement); tail: FDSLinkedList empty.
	
]
