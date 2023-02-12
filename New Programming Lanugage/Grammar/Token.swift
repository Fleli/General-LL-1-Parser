
enum Token: Equatable {
    
    case symbol(_ string: String)
    case keyword(_ string: String)
    
    case stringLiteral(_ content: String)
    case intLiteral(_ value: Int)
    case control(_ string: String)
    
    case endOfFile
    
    case some_symbol
    case some_string
    case some_int
    
    var description: String {
        
        switch self {
        case .symbol(let a):
            return "Symbol: " + a
        case .keyword(let a):
            return "keyword: " + a
        case .stringLiteral(let s):
            return "\"\(s)\""
        case .intLiteral(let int):
            return "Int: \(int)"
        case .control(let a):
            return "ctrl " + a
        case .endOfFile:
            return "EOF"
        case .some_symbol:
            return "<symbol>"
        case .some_string:
            return "<string>"
        case .some_int:
            return "<int>"
        }
        
    }
    
}
