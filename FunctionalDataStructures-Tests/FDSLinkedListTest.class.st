Class {
	#name : #FDSLinkedListTest,
	#superclass : #FDSTestCase,
	#category : #'FunctionalDataStructures-Tests'
}

{ #category : #tests }
FDSLinkedListTest >> testAllSatisfy [
	self assert: (FDSLinkedList empty allSatisfy: [ :x | x even ]).
	self assert: ((FDSLinkedList with: 2) allSatisfy: [ :x | x even ]).
	self deny: ((FDSLinkedList with: 1) allSatisfy: [ :x | x even ]).
]

{ #category : #tests }
FDSLinkedListTest >> testAnySatisfy [
	self assert: ((FDSLinkedList with: 1 with: 2) anySatisfy: [ :e | e = 1 ]).
	self assert: ((FDSLinkedList with: 1 with: 2) anySatisfy: [ :e | e = 2 ]).
	self deny: ((FDSLinkedList with: 1 with: 2) anySatisfy: [ :e | e = 3 ]).
]

{ #category : #tests }
FDSLinkedListTest >> testAtKeyifPresentPutIfAbsentPut [
	self assert: (FDSLinkedList empty atKey: 1 ifPresentPut: [ :x | x + 2 ] ifAbsentPut: 4) equals: (FDSLinkedList with: (FDSAssociation key: 1 val: 4)).
]

{ #category : #tests }
FDSLinkedListTest >> testAtifPresentIfAbsent [
	self assert: (FDSLinkedList empty at: 1 ifPresent: [ :x | x + 2 ] ifAbsent: 4) equals: 4.
	self assert: ((FDSLinkedList with: 2) at: 2 ifPresent: [ :x | x + 3 ] ifAbsent: 4) equals: 4.
	self assert: ((FDSLinkedList with: 2) at: 1 ifPresent: [ :x | x + 3 ] ifAbsent: 4) equals: 5.
]

{ #category : #tests }
FDSLinkedListTest >> testCollect [ 
	self assert: (FDSLinkedList empty collect: [ :e | e + 1 ]) equals: FDSLinkedList empty.
	self assert: ((FDSLinkedList with: 1 with: 2 with: 3) collect: [ :e | e + 1 ]) 
		equals: (FDSLinkedList with: 2 with: 3 with: 4).
]

{ #category : #tests }
FDSLinkedListTest >> testCollectThenSelect [
	self assert: (FDSLinkedList empty collect: [ :e | e + 1] thenSelect: [ :e | e ~= 2 ]) equals: FDSLinkedList empty.
	self assert: ((FDSLinkedList with: 1 with: 2 with: 3) collect: [ :e | e + 1] thenSelect: [ :e | e ~= 2 ]) 
		equals: (FDSLinkedList with: 3 with: 4).
]

{ #category : #tests }
FDSLinkedListTest >> testGroupBy [
	self assert: ((FDSLinkedList with: 1 with: 2 with: 3 with: 4) groupBy: #even) equals: 
		(FDSLinkedList with: 
			(FDSAssociation key: true val: (FDSLinkedList with: 4 with: 2)) with: 
			(FDSAssociation key: false val: (FDSLinkedList with: 3 with: 1))).
]

{ #category : #tests }
FDSLinkedListTest >> testReduce [
	self assert: ((FDSLinkedList with: 1 with: 2 with: 3) reduce: [ :a :b | a + b ]) 
		equals: 6.
]

{ #category : #tests }
FDSLinkedListTest >> testRejectOne [
	self assert: ((FDSLinkedList with: 1 with: 2 with: 3) remove: [ :e | e = 2 ]) equals: (FDSLinkedList with: 1 with: 3).
]

{ #category : #tests }
FDSLinkedListTest >> testRemove [
	self assert: ((FDSLinkedList with: 1 with: 2 with: 3) remove: 2) equals: (FDSLinkedList with: 1 with: 3).
]

{ #category : #tests }
FDSLinkedListTest >> testRemoveIfAbsent [
	| success |
	success := false.
	self assert: ((FDSLinkedList with: 1 with: 2) remove: 2 ifAbsent: [ success := true ]) equals: (FDSLinkedList with: 1).
	self assert: ((FDSLinkedList with: 1 with: 2) remove: 4 ifAbsent: [ success := true ]) equals: (FDSLinkedList with: 1 with: 2).
	self assert: success.
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
