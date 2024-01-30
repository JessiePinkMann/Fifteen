
import SwiftUI

class GameViewModel: ObservableObject {
    @Published var tokens: [Token] = []
    @Published var movesCount: Int = 0
    @Published var isAlertPresented: Bool = false
    
    init() {
        startGames()
    }
    
    func startGames() {
        tokens = (1 ... 8).map { Token(id: $0, number: $0, isEmpty: false) }
        tokens.append(Token(id: 9, number: 0, isEmpty: true))
        tokens.shuffle()
        movesCount = 0
    }

    
    
    func move(token: Token) {
        guard !token.isEmpty else {
            return
        }
        
        let empty = tokens.firstIndex { $0.isEmpty } ?? 0
        let index = tokens.firstIndex(of: token) ?? 0
        
        if isNear(first: index, second: empty) {
            tokens.swapAt(index, empty)
        }
        
        if isGameFinished() {
            isAlertPresented = true
        }
    }
    
    private func isNear(first: Int, second: Int) -> Bool {
        let diff = abs(first - second)
        return diff == 1 || diff == 3
    }
    
    private func isGameFinished() -> Bool {
        for (index, token) in tokens.enumerated() {
            if token.number != index + 1 {
                return false
            }
        }
        return true
    }
    
}

