struct Node {
    
    var identifier: String
    var children: [Node] = []
    
    func description(_ indent: Int) -> String {
        
        if (children.count == 0) {
            
            return "\n" + String(repeating: " ", count: indent) + identifier
            
        } else if (children.count == 1) {
            
            return children[0].description(indent)
            
        } else {
            
            var string = "\n" + String(repeating: " ", count: indent) + identifier + ":"
            
            for child in children {
                string += child.description(indent + 4)
            }
            
            return string
            
        }
        
    }
    
}
