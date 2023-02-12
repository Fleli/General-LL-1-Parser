func initParse(_ grammar: ContextFreeGrammar, _ tokens: [Token]) -> Node {
    
    var node = Node(identifier: "main")
    
    var index = 0
    
    parse (grammar, tokens, &index, grammar.mainProduction, &node)
    
    return node
    
}

func parse (_ grammar: ContextFreeGrammar, _ tokens: [Token], _ index: inout Int, _ production: Production, _ node: inout Node, _ depth: Int = 0) {
    
    if depth > 1000 {
        fatalError()
    }
    
    for element in production.expansion {
        
        if case .T(let token) = element {
            
            let newNode: Node
            
            if case .some_int = token, case .intLiteral(let value) = tokens[index] {
                newNode = Node(identifier: "int(\(value))")
            } else if tokens[index] == token {
                newNode = Node(identifier: "leaf: \(token.description)")
            } else {
                newNode = Node(identifier: "error (expected \(token), found \(tokens[index]))")
            }
            
            node.children.append(newNode)
            index += 1
            
        } else if case .NT(let string) = element {
            
            var subNode = Node(identifier: "\(string)")
            
            guard let production = grammar.findProduction(string, tokens[index]) else {
                node = Node(identifier: "No such production")
                return
            }
            
            parse (grammar, tokens, &index, production, &subNode, depth + 1)
            
            node.children.append(subNode)
            
        }
        
    }
    
}
