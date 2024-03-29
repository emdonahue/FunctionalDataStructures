Class {
	#name : #FDSCollection,
	#superclass : #Object,
	#category : #'FunctionalDataStructures-Core-abstract'
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

{ #category : #adding }
FDSCollection >> addAll: aCollection [
	^ aCollection inject: self into: [ :s :e | s add: e ].
]

{ #category : #enumerating }
FDSCollection >> allSatisfy: aBlock [
	self do: [ :x | (aBlock cull: x) ifFalse: [ ^ false ]].
	^ true.
]

{ #category : #enumerating }
FDSCollection >> anySatisfy: aBlock [
	self do: [ :e | (aBlock value: e) ifTrue: [ ^ true ] ].
	^ false.
]

{ #category : #converting }
FDSCollection >> asArray [ 
	^ self inject: #() into: [ :a :e | a, {e} ].
]

{ #category : #converting }
FDSCollection >> asDictionary [
	^ self inject: Dictionary new into: [ :d :e | d add: e asAssociation; yourself ].
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

{ #category : #accessing }
FDSCollection >> at: anIndex [
	^ self at: anIndex ifPresent: [ :x | x ] ifAbsent: [ SubscriptOutOfBounds signalFor: anIndex ].
]

{ #category : #accessing }
FDSCollection >> at: anIndex ifAbsent: absentBlock [
	^ self at: anIndex ifPresent: [ :x | x ] ifAbsent: absentBlock.
]

{ #category : #accessing }
FDSCollection >> at: anIndex ifPresent: presentBlock ifAbsent: absentBlock [
	"Order is undefined for non sequenceable collections but YOLO."
	| i |
	i := 1.
	self do: [ :x | i = anIndex ifTrue: [ ^ presentBlock cull: x ]. i := i + 1].
	^ absentBlock value.
]

{ #category : #accessing }
FDSCollection >> atKey: aKey [
	^ self atKey: aKey ifPresent: [ :e | e ] ifAbsent: [ KeyNotFound signalFor: aKey ].
]

{ #category : #accessing }
FDSCollection >> atKey: aKey ifAbsent: aBlock [ 
	^ self atKey: aKey ifPresent: [ :v | v ] ifAbsent: aBlock
]

{ #category : #accessing }
FDSCollection >> atKey: aKey ifPresent: pBlock ifAbsent: aBlock [ 
	self do: [ :e | aKey = e key ifTrue: [ ^ pBlock cull: e val ]].
	^ aBlock value.
]

{ #category : #accessing }
FDSCollection >> atKey: aKey ifPresentPut: aBlock ifAbsentPut: bBlock [
	^ self atKey: aKey ifPresent: [ :x | self atKey: aKey put: (aBlock cull: x) ] ifAbsent: [ self atKey: aKey put: bBlock value ]
]

{ #category : #accessing }
FDSCollection >> atKey: aKey put: aValue [
	^ (self removeKey: aKey) add: (FDSAssociation key: aKey val: aValue)
]

{ #category : #enumerating }
FDSCollection >> count: aBlock [
	^ self inject: 0 into: [ :sum :e | 
		(aBlock value: e) ifTrue: [ sum + 1 ] ifFalse: [ sum ]].
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

{ #category : #enumerating }
FDSCollection >> groupBy: aBlock [
	| groups |
	groups := FDSLinkedList empty.
	self do: [ :x | | key |
		key := aBlock value: x.
		groups := groups atKey: key ifPresentPut: [ :v | v add: x ] ifAbsentPut: [ self class empty add: x ]].
	^ groups
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

{ #category : #enumerating }
FDSCollection >> reduce: aBlock [
	| reduced started |
	started := false.
	reduced := nil.
	self do: [ :e | started 
		ifTrue: [ reduced := aBlock value: reduced value: e ] 
		ifFalse: [ reduced := e. started := true ]].
	^ reduced.
]

{ #category : #enumerating }
FDSCollection >> reject: aBlock [
	^ self select: [ :e | (aBlock value: e) not ].
]

{ #category : #removing }
FDSCollection >> remove: anElement [
	^ self remove: anElement ifPresent: [ :e | e ] ifAbsent: [ ^ self ].
]

{ #category : #removing }
FDSCollection >> remove: anElement ifAbsent: aBlock [
	^ self remove: anElement ifPresent: [ :e | e ] ifAbsent: aBlock.
]

{ #category : #removing }
FDSCollection >> remove: anElement ifPresent: pBlock ifAbsent: aBlock [
	anElement isBlock ifFalse: [ 
		^ self remove: [ :e | anElement = e ] ifPresent: pBlock ifAbsent: aBlock ].
	self subclassResponsibility.
]

{ #category : #removing }
FDSCollection >> removeKey: aKey [
	^ self remove: [ :e | e key = aKey ]
]

{ #category : #'as yet unclassified' }
FDSCollection >> reverseInject: aValue into: aBlock [ 	
	| v |
	v := aValue.
	self reverseDo: [ :e | v := aBlock value: v value: e ].
	^ v.
]

{ #category : #enumerating }
FDSCollection >> select: aBlock [
	self subclassResponsibility.
]

{ #category : #accessing }
FDSCollection >> size [
	^ self inject: 0 into: [ :s :e | s + 1 ].
]
