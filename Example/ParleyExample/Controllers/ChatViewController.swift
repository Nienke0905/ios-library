import UIKit
import Parley

class ChatViewController: UIViewController {
    
    @IBOutlet weak var parleyView: ParleyView! {
        didSet {
            self.parleyView.appearance = ParleyViewAppearance(fontRegularName: "Montserrat-Regular", fontItalicName: "Montserrat-Italic", fontBoldName: "Montserrat-Bold")
            self.parleyView.imagesEnabled = true
            
            self.parleyView.delegate = self
        }
    }
    
    var secret: String!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("chat_title", comment: "")
    }
    
    // MARK: Actions
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: ParleyViewDelegate
extension ChatViewController: ParleyViewDelegate {
    
    func didSentMessage() {
        debugPrint("ChatViewController.didSentMessage")
    }
}
