Class {
	#name : #BaselineOfASTMatcher,
	#superclass : #Object,
	#category : #'BaselineOfAST-Matcher'
}

{ #category : #baselines }
BaselineOfASTMatcher >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'AST-Matcher' ]
]
