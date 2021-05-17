Trait {
	#name : #FDSAbstractLinkedList,
	#traits : 'FDSCollection',
	#classTraits : 'FDSCollection classTrait',
	#category : #'FunctionalDataStructures-Core-abstract'
}

{ #category : #'instance creation' }
FDSAbstractLinkedList classSide >> first: aFirst rest: aRest [
	^ self fullClass new first: aFirst; rest: aRest.
]

{ #category : #adding }
FDSAbstractLinkedList >> add: anElement [
	^ self class first: anElement rest: self.
]
