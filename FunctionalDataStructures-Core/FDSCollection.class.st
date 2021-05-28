Class {
	#name : #FDSCollection,
	#superclass : #Object,
	#category : #'FunctionalDataStructures-Core-superclasses'
}

{ #category : #classes }
FDSCollection class >> associationClass [
	^ self emptyClass associationClass.
]

{ #category : #requirements }
FDSCollection class >> empty [
	^ self emptyClass singleton.
]

{ #category : #classes }
FDSCollection class >> emptyClass [
	self subclassResponsibility.
]

{ #category : #classes }
FDSCollection class >> fullClass [
	self emptyClass fullClass.
]

{ #category : #classes }
FDSCollection class >> listClass [
	^ self emptyClass listClass.
]

{ #category : #'instance creation' }
FDSCollection class >> with: anElement [
	^ self empty add: anElement.
]

{ #category : #adding }
FDSCollection >> add: anElement [
	self subclassResponsibility.
]

{ #category : #enumerating }
FDSCollection >> anySatisfy: aBlock [ 
	self detect: aBlock ifNone: [ ^ false ].
	^ true.
]

{ #category : #converting }
FDSCollection >> asArray [ 
	^ self inject: #() into: [ :a :e | a, {e} ].
]

{ #category : #converting }
FDSCollection >> asLinkedList [
	^ self reverseInject: self listClass empty into: [ :l :e | l add: e ].
]

{ #category : #converting }
FDSCollection >> asOrderedCollection [
	^ self inject: OrderedCollection new into: [ :o :e | o add: e; yourself ].
]

{ #category : #classes }
FDSCollection >> associationClass [
	^ self class associationClass.
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
	self subclassResponsibility.
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
FDSCollection >> ifEmpty: aBlock ifNotEmpty: bBlock [
	^ bBlock cull: self.
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
FDSCollection >> isEmpty [
	^ false.
]

{ #category : #testing }
FDSCollection >> isNotEmpty [ 
	^ self isEmpty not.
]

{ #category : #classes }
FDSCollection >> listClass [
	^ self emptyClass listClass.
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

{ #category : #removing }
FDSCollection >> remove: anElement ifAbsent: aBlock [
	| present r |
	present := false.
	r := self rejectOne: [ :e | present := present | (anElement = e) ].
	^ present ifTrue: r ifFalse: aBlock.
]

{ #category : #'as yet unclassified' }
FDSCollection >> reverseInject: aValue into: aBlock [ 	
	| v |
	v := aValue.
	self reverseDo: [ :e | v := aBlock value: v value: e ].
	^ v.
]

{ #category : #accessing }
FDSCollection >> size [
	^ self inject: 0 into: [ :s :e | s + 1 ].
]