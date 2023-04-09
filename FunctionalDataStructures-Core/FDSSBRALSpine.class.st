Class {
	#name : #FDSSBRALSpine,
	#superclass : #FDSSequenceable,
	#instVars : [
		'tree',
		'size',
		'rest'
	],
	#category : #'FunctionalDataStructures-Core'
}

{ #category : #'instance creation' }
FDSSBRALSpine class >> tree: aTree rest: aSpine [
	^ self new tree: aTree; rest: aSpine; size: aTree size + aSpine size
]

{ #category : #adding }
FDSSBRALSpine >> add: anElement [
	^ tree add: anElement to: self
]

{ #category : #adding }
FDSSBRALSpine >> add: anElement at: anIndex [
	"Adds anElement at a non-existent index by extending with placeholders. anIndex is negative or 0, signifying the negative index at which it should be placed."
	<type: #VoidC type: #(OrC negative isZero) type: #FDSSBRALSpine>
	^ ((1 to: anIndex negated) inject: self into: [ :sbral :i | 
		sbral add: FDSPlaceholder placeholder ]) add: anElement
]

{ #category : #adding }
FDSSBRALSpine >> addLeaf: anElement [
	^ self class 
		tree: (FDSSBRALLeaf new element: anElement)
		rest: self.
]

{ #category : #adding }
FDSSBRALSpine >> addLeaf: anElement to: aSpine [
	^ tree addLeaf: anElement to: aSpine
]

{ #category : #adding }
FDSSBRALSpine >> addNode: anElement [
	^ self class 
		tree: (FDSSBRALNode root: anElement left: tree right: rest tree)
		rest: rest rest.
]

{ #category : #adding }
FDSSBRALSpine >> addNode: anElement to: aSpine [
	^ tree addNode: anElement to: aSpine.
]

{ #category : #accessing }
FDSSBRALSpine >> at: nTh [
	tree size >= nTh ifTrue: [ ^ tree at: nTh ].
	^ rest at: (nTh - tree size)
]

{ #category : #accessing }
FDSSBRALSpine >> at: nTh put: anElement [
	"Inserting elements at indices not reached yet extends the list with placeholders."
	nTh < 1 ifTrue: [ ^ self add: anElement at: nTh ].
	tree size >= nTh "Index contained within tree in this segment"
		ifTrue: [ ^ self class tree: (tree at: nTh put: anElement) rest: rest ].
	^ self class tree: tree rest: (rest at: nTh - tree size put: anElement) .
]

{ #category : #enumerating }
FDSSBRALSpine >> collect: aBlock [
	^ self copy tree: (tree collect: aBlock);
		rest: (rest collect: aBlock)
		
]

{ #category : #enumerating }
FDSSBRALSpine >> do: aBlock [
	tree do: aBlock.
	rest do: aBlock.
]

{ #category : #accessing }
FDSSBRALSpine >> first [
	^ self at: 1.
]

{ #category : #testing }
FDSSBRALSpine >> isEmpty [
	^ false
]

{ #category : #contracts }
FDSSBRALSpine >> isValid [
	^ ( rest isEmpty or: [ tree size <= rest tree size ]) and: [ tree isValid ].
]

{ #category : #accessing }
FDSSBRALSpine >> rest [
	^ rest
]

{ #category : #accessing }
FDSSBRALSpine >> rest: anObject [
	rest := anObject
]

{ #category : #accessing }
FDSSBRALSpine >> size [
	^ size .
]

{ #category : #accessing }
FDSSBRALSpine >> size: anObject [
	size := anObject
]

{ #category : #accessing }
FDSSBRALSpine >> tree [
	^ tree
]

{ #category : #accessing }
FDSSBRALSpine >> tree: anObject [
	tree := anObject
]
