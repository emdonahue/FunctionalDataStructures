Trait {
	#name : #FDSAbstractQueue,
	#traits : 'FDSCollection',
	#classTraits : 'FDSCollection classTrait',
	#category : #'FunctionalDataStructures-Core-abstract'
}

{ #category : #'instance creation' }
FDSAbstractQueue classSide >> head: aHead [
	^ aHead 
		ifEmpty: self empty
		ifNotEmpty: [ self head: aHead tail: self listClass empty ].
]

{ #category : #'instance creation' }
FDSAbstractQueue classSide >> head: aHead tail: aTail [
	^ aHead 
		ifEmpty: [ self head: aTail reverse ]
		ifNotEmpty: [ self new head: aHead; tail: aTail ].
]

{ #category : #classes }
FDSAbstractQueue classSide >> listClass [
	^ FDSLinkedList.
]

{ #category : #classes }
FDSAbstractQueue >> listClass [
	^ self class listClass.
]
