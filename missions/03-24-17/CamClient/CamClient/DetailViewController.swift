//
//  DetailViewController.swift
//  CamClient
//
//  Created by hoemoon on 24/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, URLSessionStreamDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var camImageView: UIImageView!

    func configureView() {
        // Update the user interface for the detail item.
        
        if let detail = self.detailItem {
            print(detail)
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let task = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.current).streamTask(withHostName: "127.0.0.1", port: 8000)
        task.readData(ofMinLength: 0, maxLength: 8, timeout: 1000) { (data, bool, error) in
            let first = Int(String(data: data!, encoding: String.Encoding.utf8)!)!
            task.readData(ofMinLength: 0, maxLength: first, timeout: 1000) { (dataInner, bool, error) in
                DispatchQueue.main.async {
                    self.camImageView.image =  UIImage(data: dataInner!)
                    task.captureStreams()
                }
            }
        }
        task.resume()
        self.configureView()
    }
    
    func urlSession(_ session: URLSession, readClosedFor streamTask: URLSessionStreamTask) {
        print("readClosedFor")
    }
    
    func urlSession(_ session: URLSession, writeClosedFor streamTask: URLSessionStreamTask) {
        print("writeClosedFor")
    }
    
    func urlSession(_ session: URLSession, betterRouteDiscoveredFor streamTask: URLSessionStreamTask) {
        print("betterRouteDiscoveredFor")
    }
    
    func urlSession(_ session: URLSession, streamTask: URLSessionStreamTask, didBecome inputStream: InputStream, outputStream: OutputStream) {
        print("didBecome")
        let data: Data = "ACK".data(using: String.Encoding.utf8)!
        data.withUnsafeBytes { (u8Ptr: UnsafePointer<UInt8>) in
            let rawPtr = UnsafePointer(u8Ptr)
            outputStream.write(rawPtr, maxLength: data.count)
        }
        self.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
}

