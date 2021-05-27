Trait {
	#name : #FDSAbstractLinkedList,
	#category : #'FunctionalDataStructures-Core-abstract'
}

{ #category : #'instance creation' }
FDSAbstractLinkedList classSide >> first: aFirst rest: aRest [
	^ self fullClass new first: aFirst; rest: aRest.
]

{ #category : #'instance creation' }
FDSAbstractLinkedList classSide >> with: aElement with: bElement [
	^ (self with: bElement) add: aElement.
]

{ #category : #'instance creation' }
FDSAbstractLinkedList classSide >> with: aElement with: bElement with: cElement [
	^ (self with: bElement with: cElement) add: aElement.
]

{ #category : #'instance creation' }
FDSAbstractLinkedList classSide >> with: aElement with: bElement with: cElement with: dElement [
	^ (self with: bElement with: cElement with: dElement) add: aElement.
]

{ #category : #adding }
FDSAbstractLinkedList >> add: anElement [
	^ self class first: anElement rest: self.
]
