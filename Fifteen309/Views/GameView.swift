import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()

    var body: some View {
        GeometryReader { geometry in
            VStack {
                TitleView(text: "Fifteens")
                Text(viewModel.movesCount == 0 ? "Game is not started" : "Moves made: \(viewModel.movesCount)")
                    .font(.system(size: Constants.smallTitle, weight: .regular))
                    .padding(.top, Constants.padding)
                
                Spacer()
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: Constants.spacing) {
                    ForEach(viewModel.tokens) { token in
                        Button {
                            viewModel.move(token: token)
                        } label: {
                            TokenView(token: token)
                                .frame(width: geometry.size.width / 3 - Constants.spacing, height: geometry.size.width / 3 - Constants.spacing)
                        }.disabled(token.number == 0)
                    }
                }.padding(.horizontal, Constants.padding)
                
                Spacer()
                
                ButtonView {
                    viewModel.startGames()
                }.padding()
            }
        }
        .alert(isPresented: $viewModel.isAlertPresented) {
            Alert(title: Text("Game over"), message: Text("You made \(viewModel.movesCount) moves"), dismissButton: .default(Text("OK"), action: viewModel.startGames))
        }
    }
}
