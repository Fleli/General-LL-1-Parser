typealias Production = (nonTerminal: String, expansion: [Element])

struct ContextFreeGrammar {
    
    // Non-terminals and their corresponding productions
    var rules: [Production] = []
    
    init(_ rules: [Production] = []) {
        self.rules = rules
    }
    
    func findProduction (_ nonTerminal: String, _ nextToken: Token, _ depth: Int = 0) -> Production? {
        
        if depth > 1000 {
            fatalError("Too deep.")
        }
        
        var nullProductions: [Production] = []
        
        for production in rules {
            
            guard (production.expansion.count > 0) else {
                nullProductions.append(production)
                continue
            }
            
            let firstElement = production.expansion[0]
            
            guard (production.nonTerminal == nonTerminal) else {
                continue
            }
            
            if case .T(let token) = firstElement {
                
                if token == nextToken {
                    
                    return production
                    
                } else if case .some_int = token, case .intLiteral(_) = nextToken {
                    
                    return production
                    
                }
                
            } else if case .NT(let nt) = firstElement {
                
                for tentativeProduction in rules {
                    
                    if tentativeProduction.nonTerminal != nonTerminal {
                        continue
                    }
                    
                    if findProduction(nt, nextToken, depth + 1) != nil {
                        
                        return tentativeProduction
                        
                    }
                    
                }
                
            }
            
        }
        
        for production in nullProductions {
            
            if production.nonTerminal == nonTerminal {
                return production
            }
            
        }
        
        return nil
        
    }
    
    var mainProduction: Production {
        return rules[0]
    }
    
}

enum Element {
    case T (_ token: Token)
    case NT (_ named: String)
}
