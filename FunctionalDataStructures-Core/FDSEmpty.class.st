Class {
	#name : #FDSEmpty,
	#superclass : #FDSCollection,
	#classVars : [
		'singleton'
	],
	#classInstVars : [
		'singleton'
	],
	#category : #'FunctionalDataStructures-Core-abstract'
}

{ #category : #classes }
FDSEmpty class >> associationClass [
	^ FDSAssociation.
]

{ #category : #'as yet unclassified' }
FDSEmpty class >> emptyClass [
]

{ #category : #classes }
FDSEmpty class >> fullClass [
	self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
FDSEmpty class >> listClass [
	^ FDSLinkedList.
]

{ #category : #requirements }
FDSEmpty class >> singleton [
	^ singleton ifNil: [ singleton := self new ].
]

{ #category : #comparing }
FDSEmpty >> = aCollection [
	^ self == aCollection.
]

{ #category : #adding }
FDSEmpty >> add: anElement [
	self subclassResponsibility.
]

{ #category : #enumerating }
FDSEmpty >> anySatisfy: aBlock [ 
	self detect: aBlock ifNone: [ ^ false ].
	^ true.
]

{ #category : #lazy }
FDSEmpty >> append: aCollection [
	^ aCollection.
]

{ #category : #converting }
FDSEmpty >> asArray [ 
	^ self inject: #() into: [ :a :e | a, {e} ].
]

{ #category : #converting }
FDSEmpty >> asLinkedList [
	^ self reverseInject: self listClass empty into: [ :l :e | l add: e ].
]

{ #category : #converting }
FDSEmpty >> asOrderedCollection [
	^ self inject: OrderedCollection new into: [ :o :e | o add: e; yourself ].
]

{ #category : #classes }
FDSEmpty >> associationClass [
	^ self class associationClass.
]

{ #category : #accessing }
FDSEmpty >> at: aKey ifPresent: pBlock ifAbsentPut: aBlock [ 
	^ self add: (self associationClass key: aKey val: aBlock value).
]

{ #category : #accessing }
FDSEmpty >> atKey: aKey ifPresent: pBlock ifAbsent: aBlock [ 
	^ aBlock value.
]

{ #category : #enumerating }
FDSEmpty >> collect: aBlock [ 
]

{ #category : #enumerating }
FDSEmpty >> collect: aBlock thenSelect: bBlock [
]

{ #category : #enumerating }
FDSEmpty >> detect: aBlock ifFound: bBlock [
	^ self detect: aBlock ifFound: bBlock ifNone: [ NotFound signalFor: aBlock ].
]

{ #category : #enumerating }
FDSEmpty >> detect: aBlock ifFound: bBlock ifNone: cBlock [
	^ self do: [ :e | (aBlock value: e) ifTrue: [ ^ (bBlock cull: e) ] ] 
		then: cBlock.
]

{ #category : #enumerating }
FDSEmpty >> detect: aBlock ifNone: bBlock [
	^ self detect: aBlock ifFound: [ :e | e ] ifNone: bBlock.
]

{ #category : #enumerating }
FDSEmpty >> do: aBlock [
]

{ #category : #'as yet unclassified' }
FDSEmpty >> do: aBlock separatedBy: bBlock [ 
	| separate |
	separate := false.
	self do: [ :e | 
		separate ifTrue: [ bBlock value ].
		aBlock value: e.
		separate := true. ].
	
]

{ #category : #ambiguous }
FDSEmpty >> do: aBlock then: bBlock [
	self do: aBlock.
	^ bBlock value.
]

{ #category : #classes }
FDSEmpty >> emptyClass [
	^ self class emptyClass.
]

{ #category : #classes }
FDSEmpty >> fullClass [
	^ self class fullClass.
]

{ #category : #comparing }
FDSEmpty >> hash [ 
	^ self inject: self class hash into: [ :h :e | e hash xor: h ].
]

{ #category : #testing }
FDSEmpty >> ifEmpty: aBlock [ 
	^ self ifEmpty: aBlock ifNotEmpty: [ self ].
]

{ #category : #testing }
FDSEmpty >> ifEmpty: aBlock ifNotEmpty: bBlock [
	^ aBlock value.
]

{ #category : #testing }
FDSEmpty >> ifNotEmpty: aBlock [ 
	^ self ifEmpty: self ifNotEmpty: aBlock.
]

{ #category : #enumerating }
FDSEmpty >> inject: aValue into: aBlock [
	| injected |
	injected := aValue.
	self do: [ :e | injected := aBlock value: injected value: e ].
	^ injected.
]

{ #category : #testing }
FDSEmpty >> isEmpty [ 	
	^ true.
]

{ #category : #testing }
FDSEmpty >> isNotEmpty [ 
	^ self isEmpty not.
]

{ #category : #printing }
FDSEmpty >> printOn: aStream [
	aStream nextPut: $(.
	self do: [ :e | e printOn: aStream ] separatedBy: [ aStream nextPut: Character space ].
	aStream nextPut: $).
]

{ #category : #removing }
FDSEmpty >> remove: rBlock ifPresent: pBlock ifAbsent: aBlock [
	aBlock value.
]

{ #category : #'as yet unclassified' }
FDSEmpty >> replace: rBlock ifFound: fBlock [
]

{ #category : #'as yet unclassified' }
FDSEmpty >> replace: rBlock ifFound: fBlock ifNone: nBlock [
	^ nBlock value.
]

{ #category : #removing }
FDSEmpty >> reverse [
]

{ #category : #enumerating }
FDSEmpty >> reverseDo: aBlock [
]

{ #category : #'as yet unclassified' }
FDSEmpty >> reverseInject: aValue into: aBlock [ 	
	| v |
	v := aValue.
	self reverseDo: [ :e | v := aBlock value: v value: e ].
	^ v.
]

{ #category : #enumerating }
FDSEmpty >> select: aBlock [
]

{ #category : #accessing }
FDSEmpty >> size [
	^ self inject: 0 into: [ :s :e | s + 1 ].
]
