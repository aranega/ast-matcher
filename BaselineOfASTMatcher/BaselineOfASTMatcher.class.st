Class {
	#name : #BaselineOfASTMatcher,
	#superclass : #BaselineOf,
	#category : #BaselineOfASTMatcher
}

{ #category : #baselines }
BaselineOfASTMatcher >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'AST-Matcher' ]
]
