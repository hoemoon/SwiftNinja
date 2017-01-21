// method 1 using segue
class ThirdViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSeque, sender: Any?) {
        // segue id를 정한 후 사용하는 방법
        if segue.identifier == "photoSegue" {
            let pSegueViewContorller: PhotoDetailViewController = segue.destination as! PhotoDetailViewController
            // 특정한 뷰컨트롤러의 변수를 조작할 수 있다.
            pSegueViewContorller.titleString = "HelloWorld"
        }
    }
}

class PhotoDetailViewController: UIViewController {
    var titleString: String = ""
    @IBOutlet weak var laber1: UILabel!

        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            label1.text = titleString
        }
}

// method2 using button event

class FirstViewController: UIViewController {
    // storyboard의 id 정하기, use storyboard id 체크
    @IBAction func nextViewButton(_ sender: Any) {
        let nextViewController: NextViewController = storyboard?
        .instantiateViewController(withIdentifier: "nextViewController") as! NextViewController
        nextViewController.titleString = "Hello world"
        if let navigation = navigationController {
            navigation.pushViewController(nextViewController, animated: true)
        }
    }
}

class NextViewController: UIViewController {
    var titleString: String = ""
        // 뷰를 닫는 법
        @IBAction func closeButton(_ sender: Any) {
            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil) // 이것도 가능
        }
}
