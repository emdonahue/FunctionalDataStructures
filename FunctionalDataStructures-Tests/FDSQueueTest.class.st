Class {
	#name : #FDSQueueTest,
	#superclass : #FDSTestCase,
	#category : #'FunctionalDataStructures-Tests'
}

{ #category : #tests }
FDSQueueTest >> testAppend [ 	
	self assert: ((FDSQueue with: 1 with: 2) append: (FDSQueue with: 3 with: 4)) equals: (FDSQueue with: 1 with: 2 with: 3 with: 4).
]

{ #category : #tests }
FDSQueueTest >> testAsArray [ 	
	self assert: (FDSQueue with: 1 with: 2 with: 3) asArray equals: #(1 2 3).
]

{ #category : #tests }
FDSQueueTest >> testAsLinkedList [
	self assert: (FDSQueue with: 1 with: 2) asLinkedList equals: (FDSLinkedList with: 1 with: 2).
]

{ #category : #tests }
FDSQueueTest >> testAsOrderedCollection [ 	
	self assert: (FDSQueue with: 1 with: 2 with: 3) asOrderedCollection equals: (OrderedCollection with: 1 with: 2 with: 3).
]

{ #category : #tests }
FDSQueueTest >> testCollect [ 
	self assert: (FDSQueue empty collect: [ :e | e + 1 ]) equals: FDSQueue empty.
	self assert: ((FDSQueue with: 1 with: 2 with: 3) collect: [ :e | e + 1 ]) 
		equals: (FDSQueue with: 2 with: 3 with: 4).
]

{ #category : #tests }
FDSQueueTest >> testCollectThenSelect [
	self assert: (FDSQueue empty collect: [ :e | e + 1 ] thenSelect: [ :e | e ~= 2 ]) equals: FDSQueue empty.
	self assert: ((FDSQueue with: 1 with: 2 with: 3) collect: [ :e | e + 1 ] thenSelect: [ :e | e ~= 2 ]) equals: (FDSQueue with: 3 with: 4).
]

{ #category : #tests }
FDSQueueTest >> testRemove [ 
	self assert: ((FDSQueue with: 1) remove: 1) equals: FDSQueue empty.
	self assert: ((FDSQueue with: 1 with: 2) remove: 1) equals: (FDSQueue with: 2).
	self assert: ((FDSQueue with: 1 with: 2) remove: 2) equals: (FDSQueue with: 1).
	self assert: ((FDSQueue with: 1 with: 2 with: 3) remove: 1) equals: (FDSQueue with: 2 with: 3).
	self assert: ((FDSQueue with: 1 with: 2 with: 3) remove: 2) equals: (FDSQueue with: 1 with: 3).
	self assert: ((FDSQueue with: 1 with: 2 with: 3) remove: 3) equals: (FDSQueue with: 1 with: 2).
]

{ #category : #tests }
FDSQueueTest >> testReplaceIfFound [
	self assert: ((FDSQueue with: 1 with: 2) replace: [ :e | e = 2 ] ifFound: [ :e | e + 2 ]) equals: (FDSQueue with: 1 with: 4).
	self assert: ((FDSQueue with: 1 with: 2) replace: [ :e | e = 3 ] ifFound: [ :e | e + 2 ]) equals: (FDSQueue with: 1 with: 2).
]

{ #category : #tests }
FDSQueueTest >> testReplaceIfFoundIfNone [
	self assert: ((FDSQueue with: 1 with: 2) replace: [ :e | e = 2 ] ifFound: [ :e | e + 2 ] ifNone: 5) equals: (FDSQueue with: 1 with: 4).
	self assert: ((FDSQueue with: 1 with: 2) replace: [ :e | e = 3 ] ifFound: [ :e | e + 2 ] ifNone: 5) equals: 5.
]

{ #category : #tests }
FDSQueueTest >> testSelect [
	self assert: (FDSQueue empty select: [ :e | e ~= 2 ]) equals: FDSQueue empty.
	self assert: ((FDSQueue with: 1 with: 2 with: 3) select: [ :e | e ~= 2 ]) 
		equals: (FDSQueue with: 1 with: 3).
]

{ #category : #tests }
FDSQueueTest >> testSize [
	self assert: FDSQueue empty size equals: 0.
	self assert: (FDSQueue with: 1) size equals: 1.
	self assert: (FDSQueue with: 1 with: 2) size equals: 2.
]
