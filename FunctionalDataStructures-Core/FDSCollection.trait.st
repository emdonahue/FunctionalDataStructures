Trait {
	#name : #FDSCollection,
	#category : #'FunctionalDataStructures-Core-superclasses'
}

{ #category : #requirements }
FDSCollection classSide >> empty [
	^ self emptyClass singleton.
]

{ #category : #classes }
FDSCollection classSide >> emptyClass [
	self explicitRequirement.
]

{ #category : #'instance creation' }
FDSCollection classSide >> with: anElement [
	^ self empty add: anElement.
]

{ #category : #'instance creation' }
FDSCollection classSide >> with: aElement with: bElement [
	^ (self with: aElement) add: bElement.
]

{ #category : #'instance creation' }
FDSCollection classSide >> with: aElement with: bElement with: cElement [
	^ (self with: aElement with: bElement) add: cElement.
]

{ #category : #'instance creation' }
FDSCollection classSide >> with: aElement with: bElement with: cElement with: dElement [
	^ (self with: aElement with: bElement with: cElement) add: dElement.
]

{ #category : #adding }
FDSCollection >> add: anElement [
	self explicitRequirement.
]

{ #category : #enumerating }
FDSCollection >> detect: aBlock ifFound: bBlock [
	^ self detect: aBlock ifFound: bBlock ifNone: [ NotFound signalFor: aBlock ].
]

{ #category : #enumerating }
FDSCollection >> detect: aBlock ifFound: bBlock ifNone: cBlock [
	^ self do: [ :e | (aBlock value: e) ifTrue: [ ^ (bBlock cull: e) ] ] 
		then: cBlock.
]

{ #category : #enumerating }
FDSCollection >> detect: aBlock ifNone: bBlock [
	^ self detect: aBlock ifFound: [ :e | e ] ifNone: bBlock.
]

{ #category : #enumerating }
FDSCollection >> do: aBlock [
	self explicitRequirement.
]

{ #category : #'as yet unclassified' }
FDSCollection >> do: aBlock separatedBy: bBlock [ 
	| separate |
	separate := false.
	self do: [ :e | 
		separate ifTrue: [ bBlock value ].
		aBlock value: e.
		separate := true. ].
	
]

{ #category : #ambiguous }
FDSCollection >> do: aBlock then: bBlock [
	self do: aBlock.
	^ bBlock value.
]

{ #category : #classes }
FDSCollection >> emptyClass [
	^ self class emptyClass.
]

{ #category : #classes }
FDSCollection >> fullClass [
	^ self class fullClass.
]

{ #category : #comparing }
FDSCollection >> hash [ 
	^ self inject: self class hash into: [ :h :e | e hash xor: h ].
]

{ #category : #testing }
FDSCollection >> ifEmpty: aBlock [ 
	^ self ifEmpty: aBlock ifNotEmpty: [ self ].
]

{ #category : #testing }
FDSCollection >> ifNotEmpty: aBlock [ 
	^ self ifEmpty: self ifNotEmpty: aBlock.
]

{ #category : #enumerating }
FDSCollection >> inject: aValue into: aBlock [
	| injected |
	injected := aValue.
	self do: [ :e | injected := aBlock value: injected value: e ].
	^ injected.
]

{ #category : #testing }
FDSCollection >> isNotEmpty [ 
	^ self isEmpty not.
]

{ #category : #printing }
FDSCollection >> printOn: aStream [
	aStream nextPut: $(.
	self do: [ :e | e printOn: aStream ] separatedBy: [ aStream nextPut: Character space ].
	aStream nextPut: $).
]

{ #category : #removing }
FDSCollection >> remove: anElement [
	^ self rejectOne: [ :e | anElement = e ].
]
