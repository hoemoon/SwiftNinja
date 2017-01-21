class SecondViewController: UIVierController, UIImagePickerControllerDelegate, UINavigationControllDelegate {
    @IBOutlet weak var pickedImageView: UIImageView!
    @IBAction func loadPickerButton(_ sender: UIButton) {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = self
        present(imgaePickerController, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] {
            pickedImageView.image = image as? UIImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
