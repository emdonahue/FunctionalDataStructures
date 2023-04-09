Class {
	#name : #FDSTestCase,
	#superclass : #TestCase,
	#category : #'FunctionalDataStructures-Tests'
}

{ #category : #running }
FDSTestCase >> setUp [
	super setUp.
	'FunctionalDataStructures-Core' asPackage signContracts.
]

{ #category : #running }
FDSTestCase >> tearDown [
	'FunctionalDataStructures-Core' asPackage voidContracts.
]
