// jsonParsing
var jsonString2 = "{\"A\":100, \"B\":200}"
var jsonData2 = jsonString2.data(using: String.Encoding.utf8)
do {
    var array = try JSONSerialization
             .jsonObject(with: jsonString2!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
    print(array)
} catch {
    print("error")
}

// usingSafafi
import UIKit
import SafariServices

class ViewController: UIViewController, SFSafafiViewControllerDelegate {
    @IBAction func tapBtn() {
        if let url = URL(string: "http://apple.com") {
            let vc = SFSafariViewController(url: url)
            vc.delegate = self
            present(vc, animated: true, completion: nil)
        }
    }

    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        print("Close")
    }
}

// usingWebImage
@IBOutlet weak var myImageView: UIImageView!

@IBAction func tapLoadImage() {
    let stringURL = "https://image.jpg"
    if let url = URL(string: stringURL) {
        if let data = NSData(contentOf: url) {
            myImageView.image = UIImage(data: data as Data)
        }
    }
}

// usingWebText
@IBAction func tapLoadText2() {
    if let url = URL(string: "https://text.txt") {
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: url, completionHandler: onFinish)
        task.resume()
    }
}

func onFinish(data: Data?, response: URLResponse?, error: NSError?) {
    if let nsstr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
        let str = String(nsstr)
        print(str)
    }
}

// usingSocial
import Social

class ViewController: UIViewController {
    @IBAction func tapTwitterBtn() {
        let cv = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        cv.setInitialText("write!"
        self.present(cv!, animated: true, completion: nil)
    }
}

// usingActionSheet
class ViewController: UIViewController {
    @IBAction func tapSharBtn() {
        let shareText = "write!"
        let shareItems = [shareText]
        let avc = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        avc.excludeActivityTypes = [
            UIActivityType.saveToCameraRoll,
            UIActivityType.airDrop,
            UIActivityType.assignToContact,
            UIActivityType.addToReadingList
        ]
        present(avc, animated: true, completion: nil)
    }
}
