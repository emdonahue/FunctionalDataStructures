Class {
	#name : #FDSLinkedListTest,
	#superclass : #TestCase,
	#category : #'FunctionalDataStructures-Tests'
}

{ #category : #tests }
FDSLinkedListTest >> testAnySatisfy [
	self assert: ((FDSLinkedList with: 1 with: 2) anySatisfy: [ :e | e = 1 ]).
	self assert: ((FDSLinkedList with: 1 with: 2) anySatisfy: [ :e | e = 2 ]).
	self deny: ((FDSLinkedList with: 1 with: 2) anySatisfy: [ :e | e = 3 ]).
]

{ #category : #tests }
FDSLinkedListTest >> testAtifPresentIfAbsentPut [
	self assert: (FDSLinkedList empty at: 1 ifPresent: [ :x | x + 2 ] ifAbsentPut: 4) equals: (FDSLinkedList with: (FDSAssociation key: 1 val: 4)).
	self assert: ((FDSLinkedList with: (FDSAssociation key: 1 val: 2)) at: 1 ifPresent: [ :x | x + 3 ] ifAbsentPut: 4) equals: (FDSLinkedList with: (FDSAssociation key: 1 val: 5)).
	self assert: ((FDSLinkedList with: (FDSAssociation key: 1 val: 2)) at: 3 ifPresent: [ :x | x + 3 ] ifAbsentPut: 4) equals: (FDSLinkedList with: (FDSAssociation key: 3 val: 4) with: (FDSAssociation key: 1 val: 2)).
]

{ #category : #tests }
FDSLinkedListTest >> testCollect [ 
	self assert: (FDSLinkedList empty collect: [ :e | e + 1 ]) equals: FDSLinkedList empty.
	self assert: ((FDSLinkedList with: 1 with: 2 with: 3) collect: [ :e | e + 1 ]) 
		equals: (FDSLinkedList with: 2 with: 3 with: 4).
]

{ #category : #tests }
FDSLinkedListTest >> testRejectOne [
	self assert: ((FDSLinkedList with: 1 with: 2 with: 3) rejectOne: [ :e | e = 2 ]) equals: (FDSLinkedList with: 1 with: 3).
]

{ #category : #tests }
FDSLinkedListTest >> testRemove [
	self assert: ((FDSLinkedList with: 1 with: 2 with: 3) remove: 2) equals: (FDSLinkedList with: 1 with: 3).
]

{ #category : #tests }
FDSLinkedListTest >> testRemoveIfAbsent [
	self assert: ((FDSLinkedList with: 1 with: 2) remove: 2 ifAbsent: 3) equals: (FDSLinkedList with: 1).
	self assert: ((FDSLinkedList with: 1 with: 2) remove: 4 ifAbsent: 3) equals: 3.
]

{ #category : #tests }
FDSLinkedListTest >> testReplaceIfFound [
	self assert: ((FDSLinkedList with: 1 with: 2) replace: [ :e | e = 2 ] ifFound: [ :e | e + 2 ]) equals: (FDSLinkedList with: 1 with: 4).
	self assert: ((FDSLinkedList with: 1 with: 2) replace: [ :e | e = 3 ] ifFound: [ :e | e + 2 ]) equals: (FDSLinkedList with: 1 with: 2).
]

{ #category : #tests }
FDSLinkedListTest >> testReplaceIfFoundIfNone [
	self assert: ((FDSLinkedList with: 1 with: 2) replace: [ :e | e = 2 ] ifFound: [ :e | e + 2 ] ifNone: 5) equals: (FDSLinkedList with: 1 with: 4).
	self assert: ((FDSLinkedList with: 1 with: 2) replace: [ :e | e = 3 ] ifFound: [ :e | e + 2 ] ifNone: 5) equals: 5.
]

{ #category : #tests }
FDSLinkedListTest >> testSelect [
	self assert: (FDSLinkedList empty select: [ :e | e ~= 2 ]) equals: FDSLinkedList empty.
	self assert: ((FDSLinkedList with: 1 with: 2 with: 3) select: [ :e | e ~= 2 ]) 
		equals: (FDSLinkedList with: 1 with: 3).
]
