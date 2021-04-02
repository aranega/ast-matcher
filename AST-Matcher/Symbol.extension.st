Extension { #name : #Symbol }

{ #category : #'*AST-Matcher' }
Symbol >> asMatcher [
	^ SymboleMatcher v: self
]
