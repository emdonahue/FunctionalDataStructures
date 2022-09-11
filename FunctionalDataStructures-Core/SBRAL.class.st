"
Implementation of a Skew Binary Random-Access List from ""Efficient Representations for Triangular Substitutions: A Comparison in Minikanren""
"
Class {
	#name : #SBRAL,
	#superclass : #Object,
	#classInstVars : [
		'empty'
	],
	#category : #'FunctionalDataStructures-Core'
}

{ #category : #accessing }
SBRAL class >> empty [
	^ empty ifNil: [ empty := SBRALEmpty new ]
]

{ #category : #adding }
SBRAL >> add: anElement at: anIndex [
	"Adds anElement at a non-existent index by extending with placeholders. anIndex is negative or 0, signifying the negative index at which it should be placed."
	<type: #VoidC type: #(OrC negative isZero) type: #SBRALSpine>
	^ ((1 to: anIndex negated) inject: self into: [ :sbral :i | 
		sbral add: SBRALPlaceholder placeholder ]) add: anElement
]

{ #category : #adding }
SBRAL >> addAll: aCollection [
	^ aCollection inject: self into: [ :sbral :e | sbral add: e ]
]
