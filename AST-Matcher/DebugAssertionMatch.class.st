Class {
	#name : #DebugAssertionMatch,
	#superclass : #Object,
	#category : #'AST-Matcher'
}

{ #category : #'typing/selecting keys' }
DebugAssertionMatch >> search: methodNode [
	 
	^ (self stmtSequenceMatch: methodNode) ifNotNil: [ methodNode ] 
]

{ #category : #'typing/selecting keys' }
DebugAssertionMatch >> stmtMatch: node [
	^ ((MatchSwitch node: node)
		imatch: [ _v := #'@assign' ] => [ :assign | self stmtMatch: assign ];
		imatch: [ #'@var' halt ] => [ ^ true ];
		imatch:
			[ #'@left' @* #'@right' ]
				=>
					[ :left :right | (self stmtMatch: left) or: [ self stmtMatch: right ] ];
		imatch:
			KeywordMessageMatcher everything
				=> [ :receiver :arguments | 
					(self stmtMatch: receiver)
						or: [ arguments anySatisfy: [ :each | self stmtMatch: each ] ] ];
		imatch:
			[ [ #'*insts' ] ] => [ :insts | self stmtSequenceMatch: insts ];
		imatch: [ #_ ] => [ ^ false ]) execute
]

{ #category : #'typing/selecting keys' }
DebugAssertionMatch >> stmtSequenceMatch: aSequence [
	^ ((MatchSwitch node: aSequence)
		match: [  ] => [ false ];
		match:
			[ #'@inst'.
			#'*stmts' ] => [ :inst :stmts | (self stmtMatch: inst) and: [ self stmtSequenceMatch: stmts ] ]) execute
]
