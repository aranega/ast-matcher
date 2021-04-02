Extension { #name : #BlockClosure }

{ #category : #'*AST-Matcher' }
BlockClosure >> matcher [
	| ast |
	ast := self sourceNode.
	^ ast body acceptVisitor: MatcherVisitor new
]
