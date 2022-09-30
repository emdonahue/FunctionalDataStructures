Class {
	#name : #SBRALNode,
	#superclass : #Object,
	#instVars : [
		'root',
		'size',
		'left',
		'right'
	],
	#category : #'FunctionalDataStructures-Core'
}

{ #category : #'as yet unclassified' }
SBRALNode class >> root: aRoot left: leftTree right: rightTree [
	^ self new root: aRoot; left: leftTree; right: rightTree; size: leftTree size + rightTree size + 1
]

{ #category : #adding }
SBRALNode >> add: anElement to: aSpine [
	^ aSpine rest addNode: anElement to: aSpine
]

{ #category : #adding }
SBRALNode >> addLeaf: anElement to: aSpine [
	^ aSpine addLeaf: anElement
]

{ #category : #adding }
SBRALNode >> addNode: anElement to: aSpine [
	aSpine tree size = self size
		ifTrue: [ ^ aSpine addNode: anElement ].
	^ aSpine addLeaf: anElement.
]

{ #category : #accessing }
SBRALNode >> at: nTh [
	| sz |
	nTh = 1
		ifTrue: [ ^ root ].
	sz := (size+ 1) // 2.
	nTh <= sz
		ifTrue: [ ^ left at: nTh - 1 ].
	^ right at: nTh - sz.
]

{ #category : #accessing }
SBRALNode >> at: nTh put: anElement [
	| sz |
	nTh = 1
		ifTrue: [ ^ self class  root: anElement left: left right: right ].
	sz := (size + 1) // 2.
	nTh <= sz
		ifTrue: [ ^ self class root: root left: (left at: nTh - 1 put: anElement) right: right ].
	^ self class  root: root left: left right: (right at: nTh - sz put: anElement).
]

{ #category : #enumerating }
SBRALNode >> collect: aBlock [
	^ self copy
		root: (root isFDSPlaceholder ifTrue: [root] ifFalse: [ aBlock value: root ]);
		left: (left collect: aBlock);
		right: (right collect: aBlock).
]

{ #category : #enumerating }
SBRALNode >> do: aBlock [
	root isFDSPlaceholder ifFalse: [ aBlock value: root ].
	left do: aBlock.
	right do: aBlock.
]

{ #category : #contracts }
SBRALNode >> isValid [
	^ left size = right size & left isValid & right isValid
]

{ #category : #accessing }
SBRALNode >> left [
	^ left
]

{ #category : #accessing }
SBRALNode >> left: anObject [
	left := anObject
]

{ #category : #accessing }
SBRALNode >> right [
	^ right
]

{ #category : #accessing }
SBRALNode >> right: anObject [
	right := anObject
]

{ #category : #accessing }
SBRALNode >> root [
	^ root
]

{ #category : #accessing }
SBRALNode >> root: anObject [
	root := anObject
]

{ #category : #accessing }
SBRALNode >> size [
	^ size .
]

{ #category : #accessing }
SBRALNode >> size: aSize [
	size := aSize
]
