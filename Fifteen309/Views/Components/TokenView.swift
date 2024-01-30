import SwiftUI

struct TokenView: View {
    private let token: Token
    private var number: String = ""
    
    init(token: Token) {
        self.token = token
        if token.number != 0 {
            number = String(token.number)
        }
    }
    
    var body: some View {
        Text(number)
            .font(.largeTitle)
            .frame(width: Constants.tokenSize, height: Constants.tokenSize)
            .foregroundColor(token.isEmpty ? .white : .black)
            .background(token.isEmpty ? .black : .white)
            .cornerRadius(Constants.cornerRadius)
            .border(Color.gray, width: 2)
    }
}

// Примеры для предварительного просмотра
struct TokenView_Previews: PreviewProvider {
    static var previews: some View {
        TokenView(token: Token(id: 15, number: 15, isEmpty: true))
    }
}
