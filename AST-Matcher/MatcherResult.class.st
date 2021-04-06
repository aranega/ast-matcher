Class {
	#name : #MatcherResult,
	#superclass : #Object,
	#instVars : [
		'context',
		'isMatch'
	],
	#category : #'AST-Matcher'
}

{ #category : #accessing }
MatcherResult >> at: index [ 
	^ context at: index 
]

{ #category : #'as yet unclassified' }
MatcherResult >> at: aString ifAbsent: aBlockClosure [ 
	^ context at: aString ifAbsent: aBlockClosure 
]

{ #category : #'as yet unclassified' }
MatcherResult >> at: aString ifAbsentPut: aBlockClosure [ 
	^ context at: aString ifAbsentPut: aBlockClosure 
]

{ #category : #accessing }
MatcherResult >> at: index put: value [
	^ context at: index put: value
]

{ #category : #accessing }
MatcherResult >> initialize [
	context := Dictionary new.
	isMatch := false.
]

{ #category : #accessing }
MatcherResult >> isMatch [
	^ isMatch
]

{ #category : #accessing }
MatcherResult >> isMatch: anObject [
	isMatch := anObject
]

{ #category : #accessing }
MatcherResult >> isPartial [
	^ isMatch not and: [ context isNotEmpty ]
]

{ #category : #accessing }
MatcherResult >> printString [
	^ '{1}(match? {2}, matched={3})'
		format:
			{super printString.
			isMatch.
			context}
]
