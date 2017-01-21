//
//  PhotoDetailViewController.swift
//  day8
//
//  Created by hoemoon on 18/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    var titleString: String = ""
    var contentString: String = ""
    var numberOfComment:String = ""
    var imageName: String = ""
    var dataDictionary: [String:Any] = [:]
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        label1.text = titleString
        label2.text = contentString
        label3.text = numberOfComment
        imageView1.image = UIImage(named: imageName)
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
