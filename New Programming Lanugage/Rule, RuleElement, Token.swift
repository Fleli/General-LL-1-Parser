struct ContextFreeRule {
    
    var lhs: RuleElement
    var rhs: [RuleElement]
    
}

indirect enum RuleElement {
    
    case terminal(_ token: Token)
    case nonTerminal(_ rule: ContextFreeRule)
    
}
