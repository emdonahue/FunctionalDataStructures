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
	sbral := SBRAL empty.
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
	self assert: ((SBRAL empty at: 0 put: 42) at: 1) equals: 42.
]

{ #category : #tests }
SBRALTest >> testAtPut [
	| sbral |
	self assert: (((SBRAL empty add: 1) at: 1 put: #symbol) at: 1) equals: #symbol.
	self assert: (((SBRAL empty addAll: #(1 2)) at: 2 put: #symbol) at: 2) equals: #symbol.
	self assert: (((SBRAL empty addAll: #(1 2 3)) at: 3 put: #symbol) at: 3) equals: #symbol.
	sbral := SBRAL empty.
	1 to: 100 do: [ :i | 
		sbral := sbral add: i.
		1 to: i do: [ :j | self assert: ((sbral at: j put: #symbol) at: j) equals: #symbol ] ].
]
