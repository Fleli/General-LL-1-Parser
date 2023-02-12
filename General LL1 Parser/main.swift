
var grammar = ContextFreeGrammar()

grammar = createGrammar()

let input: [Token] = [
    
    .control("{"),
    .keyword("if"),
    .symbol("exp"),
    .control("{"),
    .symbol("test"),
    .control("}"),
    .keyword("elif"),
    .symbol("exp"),
    .control("{"),
    .symbol("test"),
    .control("}"),
    .keyword("elif"),
    .symbol("exp"),
    .control("{"),
    .control("}"),
    .keyword("else"),
    .control("{"),
    .control("}"),
    .control(";"),
    .control("}")
    
    ]

let node = initParse(grammar, input)

print(node.description(0))
