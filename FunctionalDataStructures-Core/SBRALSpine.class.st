Class {
	#name : #SBRALSpine,
	#superclass : #FDSSequenceable,
	#instVars : [
		'tree',
		'size',
		'rest'
	],
	#category : #'FunctionalDataStructures-Core'
}

{ #category : #'instance creation' }
SBRALSpine class >> tree: aTree rest: aSpine [
	^ self new tree: aTree; rest: aSpine; size: aTree size + aSpine size
]

{ #category : #adding }
SBRALSpine >> add: anElement [
	^ tree add: anElement to: self
]

{ #category : #adding }
SBRALSpine >> add: anElement at: anIndex [
	"Adds anElement at a non-existent index by extending with placeholders. anIndex is negative or 0, signifying the negative index at which it should be placed."
	<type: #VoidC type: #(OrC negative isZero) type: #SBRALSpine>
	^ ((1 to: anIndex negated) inject: self into: [ :sbral :i | 
		sbral add: SBRALPlaceholder placeholder ]) add: anElement
]

{ #category : #adding }
SBRALSpine >> addLeaf: anElement [
	^ self class 
		tree: (SBRALLeaf new element: anElement)
		rest: self.
]

{ #category : #adding }
SBRALSpine >> addLeaf: anElement to: aSpine [
	^ tree addLeaf: anElement to: aSpine
]

{ #category : #adding }
SBRALSpine >> addNode: anElement [
	^ self class 
		tree: (SBRALNode root: anElement left: tree right: rest tree)
		rest: rest rest.
]

{ #category : #adding }
SBRALSpine >> addNode: anElement to: aSpine [
	^ tree addNode: anElement to: aSpine.
]

{ #category : #accessing }
SBRALSpine >> at: nTh [
	tree size >= nTh ifTrue: [ ^ tree at: nTh ].
	^ rest at: (nTh - tree size)
]

{ #category : #accessing }
SBRALSpine >> at: nTh put: anElement [
	"Inserting elements at indices not reached yet extends the list with placeholders."
	nTh < 1 ifTrue: [ ^ self add: anElement at: nTh ].
	tree size >= nTh "Index contained within tree in this segment"
		ifTrue: [ ^ self class tree: (tree at: nTh put: anElement) rest: rest ].
	^ self class tree: tree rest: (rest at: nTh - tree size put: anElement) .
]

{ #category : #testing }
SBRALSpine >> isEmpty [
	^ false
]

{ #category : #contracts }
SBRALSpine >> isValid [
	^ ( rest isEmpty or: [ tree size <= rest tree size ]) and: [ tree isValid ].
]

{ #category : #accessing }
SBRALSpine >> rest [
	^ rest
]

{ #category : #accessing }
SBRALSpine >> rest: anObject [
	rest := anObject
]

{ #category : #accessing }
SBRALSpine >> size [
	^ size .
]

{ #category : #accessing }
SBRALSpine >> size: anObject [
	size := anObject
]

{ #category : #accessing }
SBRALSpine >> tree [
	^ tree
]

{ #category : #accessing }
SBRALSpine >> tree: anObject [
	tree := anObject
]
