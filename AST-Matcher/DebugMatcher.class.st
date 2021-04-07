Class {
	#name : #DebugMatcher,
	#superclass : #Matcher,
	#category : #'AST-Matcher'
}

{ #category : #accessing }
DebugMatcher >> match: aValue withContext: aContext [
	self halt
]
