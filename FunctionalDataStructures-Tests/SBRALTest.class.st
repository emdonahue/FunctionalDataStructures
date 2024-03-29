Class {
	#name : #SBRALTest,
	#superclass : #FDSTestCase,
	#category : #'FunctionalDataStructures-Tests'
}

{ #category : #history }
SBRALTest class >> lastStoredRun [
	^ ((Dictionary new) add: (#timeStamp->(DateAndTime basicNew instVarAt: 1 put: 84663; instVarAt: 2 put: (Duration seconds: -14400 nanoSeconds: 0); instVarAt: 3 put: 2459068; instVarAt: 4 put: 320106000; yourself)); add: (#passed->((Set new) add: #testAdd; add: #testAtPut; yourself)); add: (#failures->((Set new))); add: (#errors->((Set new))); yourself)
]

{ #category : #tests }
SBRALTest >> testAdd [
	| sbral |
	sbral := FDSSBRAL empty.
	self assert: sbral size equals: 0.
	1 to: 100 do: [ :i | 
		sbral := sbral add: i.
		self assert: sbral size equals: i.
		self assert: sbral isValid.
		1 to: i do: [ :j| self assert: (sbral at: j) equals: (i - j + 1) ]
		 ].
]

{ #category : #tests }
SBRALTest >> testAddOutOfOrder [
	self assert: ((FDSSBRAL empty at: 0 put: 42) at: 1) equals: 42.
]

{ #category : #tests }
SBRALTest >> testAt [
	self assert: ((FDSSBRAL empty addAll: #(1 2 3)) at: 1) equals: 3.
	self assert: ((FDSSBRAL empty addAll: #(1 2 3)) at: 2) equals: 2.
	self assert: ((FDSSBRAL empty addAll: #(1 2 3)) at: 3) equals: 1.
]

{ #category : #tests }
SBRALTest >> testAtPut [
	| sbral |
	self assert: (((FDSSBRAL empty add: 1) at: 1 put: #symbol) at: 1) equals: #symbol.
	self assert: (((FDSSBRAL empty addAll: #(1 2)) at: 2 put: #symbol) at: 2) equals: #symbol.
	self assert: (((FDSSBRAL empty addAll: #(1 2 3)) at: 3 put: #symbol) at: 3) equals: #symbol.
	sbral := FDSSBRAL empty.
	1 to: 100 do: [ :i | 
		sbral := sbral add: i.
		1 to: i do: [ :j | self assert: ((sbral at: j put: #symbol) at: j) equals: #symbol ] ].
]

{ #category : #tests }
SBRALTest >> testCollect [
	self assert: ((FDSSBRAL empty addAll: #(1 2 3 4)) collect: [ :x | x * 2 ]) equals: (FDSSBRAL empty addAll: #(2 4 6 8)).
	self assert: ((FDSSBRAL empty at: -2 put: 1) collect: [ :x | x * 2 ]) equals: (FDSSBRAL empty at: -2 put: 2).
	
]

{ #category : #tests }
SBRALTest >> testCount [
	"Stress tests #do"
	self assert: (FDSSBRAL empty count: [ :x | true ]) equals: 0.
	self assert: ((FDSSBRAL empty addAll: #(42)) count: [ :x | true ]) equals: 1.
	self assert: ((FDSSBRAL empty addAll: #(42 42)) count: [ :x | true ]) equals: 2.
	self assert: ((FDSSBRAL empty at: -2 put: 42) count: [ :x | true ]) equals: 1.
	self assert: ((FDSSBRAL empty at: -20 put: 42) count: [ :x | true ]) equals: 1.
]

{ #category : #tests }
SBRALTest >> testDo [
	| xs |
	xs := OrderedCollection new.
	(FDSSBRAL empty addAll: #(1 2 3)) do: [ :x | xs add: x ].
	self assert: xs asArray equals: #(3 2 1).
]
