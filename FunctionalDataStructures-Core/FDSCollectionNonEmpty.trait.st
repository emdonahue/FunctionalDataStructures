Trait {
	#name : #FDSCollectionNonEmpty,
	#traits : 'FDSCollection',
	#classTraits : 'FDSCollection classTrait',
	#category : #'FunctionalDataStructures-Core-superclasses'
}

{ #category : #classes }
FDSCollectionNonEmpty classSide >> associationClass [
	^ self emptyClass associationClass.
]

{ #category : #classes }
FDSCollectionNonEmpty classSide >> fullClass [
	^ self emptyClass fullClass.
]

{ #category : #classes }
FDSCollectionNonEmpty classSide >> listClass [
	^ self emptyClass listClass.
]

{ #category : #testing }
FDSCollectionNonEmpty >> ifEmpty: aBlock ifNotEmpty: bBlock [
	^ bBlock cull: self.
]

{ #category : #testing }
FDSCollectionNonEmpty >> isEmpty [
	^ false.
]
