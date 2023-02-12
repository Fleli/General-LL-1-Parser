
/// Generates the specified contect-free grammar
func createGrammar() -> ContextFreeGrammar {
    
    var rules: [Production] = []
    
    rules.append((  "BODY"          ,   [   .T(.control("{"))   ,   .NT("STATEMENTS")   ,   .T(.control("}"))                                   ]))
    
    rules.append((  "STATEMENTS"    ,   [   .NT("STATEMENT")    ,   .NT("STATEMENTS")                                                           ]))
    rules.append((  "STATEMENTS"    ,   [                                                                                                       ]))
    
    rules.append((  "STATEMENT"     ,   [   .T(.keyword("if"))   ,   .NT("EXPRESSION")  ,    .NT("BODY")             ,   .NT("IFCOMP")          ]))
    rules.append((  "STATEMENT"     ,   [   .T(.symbol("test"))                                                                                  ]))
    
    // .
    // .
    // .
    
    rules.append((  "IFCOMP"        ,   [   .T(.control(";"))                                                                                   ]))
    rules.append((  "IFCOMP"        ,   [   .T(.keyword("elif")) ,   .NT("EXPRESSION")   ,   .NT("BODY")             ,   .NT("IFCOMP")          ]))
    rules.append((  "IFCOMP"        ,   [   .T(.keyword("else")) ,   .NT("BODY")         ,   .T(.control(";"))                                  ]))
    
    rules.append((  "EXPRESSION"    ,   [   .T(.symbol("exp"))                                                                                  ]))
    
    return ContextFreeGrammar(rules)
    
}
