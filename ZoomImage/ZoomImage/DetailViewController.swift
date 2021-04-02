//
//  DetailViewController.swift
//  ZoomImage
//
//  Created by Henrique Matheus Alves Pereira on 31/03/21.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var onOffZoom: UISwitch!
    
    var imgSelected: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.maximumZoomScale = 4
        scrollView.minimumZoomScale = 0.1
        scrollView.zoomScale = 0.1
        
        imageView.image = UIImage(named: imgSelected!)
        imageView.sizeToFit()
    }
    
    override func viewWillLayoutSubviews() {
        scrollView.contentSize = imageView.frame.size
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return imageView
    }
    
    @IBAction func changeValue(sender: UISlider) {
        scrollView.zoomScale = CGFloat(slider.value)
    }
    
    private func scrollViewDidZoom(scrollView: UIScrollView!){
        slider.setValue(Float(scrollView.zoomScale), animated: true)
    }

}
