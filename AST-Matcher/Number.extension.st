Extension { #name : #Number }

{ #category : #'*AST-Matcher' }
Number >> asMatcher [
	^ LiteralMatcher v: self
]
