Class {
	#name : #FDSSBRALNode,
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
FDSSBRALNode class >> root: aRoot left: leftTree right: rightTree [
	^ self new root: aRoot; left: leftTree; right: rightTree; size: leftTree size + rightTree size + 1
]

{ #category : #adding }
FDSSBRALNode >> add: anElement to: aSpine [
	^ aSpine rest addNode: anElement to: aSpine
]

{ #category : #adding }
FDSSBRALNode >> addLeaf: anElement to: aSpine [
	^ aSpine addLeaf: anElement
]

{ #category : #adding }
FDSSBRALNode >> addNode: anElement to: aSpine [
	aSpine tree size = self size
		ifTrue: [ ^ aSpine addNode: anElement ].
	^ aSpine addLeaf: anElement.
]

{ #category : #accessing }
FDSSBRALNode >> at: nTh [
	| sz |
	nTh = 1
		ifTrue: [ ^ root ].
	sz := (size+ 1) // 2.
	nTh <= sz
		ifTrue: [ ^ left at: nTh - 1 ].
	^ right at: nTh - sz.
]

{ #category : #accessing }
FDSSBRALNode >> at: nTh put: anElement [
	| sz |
	nTh = 1
		ifTrue: [ ^ self class  root: anElement left: left right: right ].
	sz := (size + 1) // 2.
	nTh <= sz
		ifTrue: [ ^ self class root: root left: (left at: nTh - 1 put: anElement) right: right ].
	^ self class  root: root left: left right: (right at: nTh - sz put: anElement).
]

{ #category : #enumerating }
FDSSBRALNode >> collect: aBlock [
	^ self copy
		root: (root isFDSPlaceholder ifTrue: [root] ifFalse: [ aBlock value: root ]);
		left: (left collect: aBlock);
		right: (right collect: aBlock).
]

{ #category : #enumerating }
FDSSBRALNode >> do: aBlock [
	root isFDSPlaceholder ifFalse: [ aBlock value: root ].
	left do: aBlock.
	right do: aBlock.
]

{ #category : #contracts }
FDSSBRALNode >> isValid [
	^ left size = right size & left isValid & right isValid
]

{ #category : #accessing }
FDSSBRALNode >> left [
	^ left
]

{ #category : #accessing }
FDSSBRALNode >> left: anObject [
	left := anObject
]

{ #category : #accessing }
FDSSBRALNode >> right [
	^ right
]

{ #category : #accessing }
FDSSBRALNode >> right: anObject [
	right := anObject
]

{ #category : #accessing }
FDSSBRALNode >> root [
	^ root
]

{ #category : #accessing }
FDSSBRALNode >> root: anObject [
	root := anObject
]

{ #category : #accessing }
FDSSBRALNode >> size [
	^ size .
]

{ #category : #accessing }
FDSSBRALNode >> size: aSize [
	size := aSize
]
