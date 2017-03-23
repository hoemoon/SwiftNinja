//
//  PhotoDetailViewController.swift
//  JSONPractice
//
//  Created by hoemoon on 23/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    var titleLabeltext = String()
    var contentLabel = String()
    var commentsLabel = String()
    var imageString = String()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleLabeltext
        content.text = contentLabel
        comments.text = commentsLabel
        movieImage.image = UIImage(named: imageString)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
