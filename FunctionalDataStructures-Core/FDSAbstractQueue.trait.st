Trait {
	#name : #FDSAbstractQueue,
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

{ #category : #'instance creation' }
FDSAbstractQueue classSide >> with: aElement with: bElement [
	^ (self with: aElement) add: bElement.
]

{ #category : #'instance creation' }
FDSAbstractQueue classSide >> with: aElement with: bElement with: cElement [
	^ (self with: aElement with: bElement) add: cElement.
]

{ #category : #'instance creation' }
FDSAbstractQueue classSide >> with: aElement with: bElement with: cElement with: dElement [
	^ (self with: aElement with: bElement with: cElement) add: dElement.
]

{ #category : #classes }
FDSAbstractQueue >> listClass [
	^ self class listClass.
]
