
import SwiftUI

struct ButtonView: View {
    private let buttonClicked: () -> Void
    
    init(buttonClicked: @escaping () -> Void) {
        self.buttonClicked = buttonClicked
    }
    
    var body: some View {
        Button(action: buttonClicked) {
            HStack(alignment: .center) {
                Text("Restart")
                    .foregroundColor(.black)
                    .font(.system(size: Constants.smallTitle, weight: .medium))
                Image(systemName: "chevron.right.2")
                    .foregroundColor(.black)
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonClicked: aaa)
    }
}

func aaa() -> Void {
    
}
