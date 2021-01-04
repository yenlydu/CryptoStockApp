//
//  ViewController.swift
//  IOSBasicProject
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import UIKit
import Charts

class HomeViewController: UIViewController, ChartViewDelegate, UIScrollViewDelegate {
    lazy var presenter = HomePresenter(with: self)
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!

    var movies: [String] = ["bad_boys","joker","hollywood"]
    var frame = CGRect.zero

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.setTitle()
        pageControl.numberOfPages = movies.count
        setupScreens()

        scrollView.delegate = self

    }
    
    func setupScreens() {
        for index in 0..<movies.count {
            // 1.
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            // 2.
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: movies[index])

            self.scrollView.addSubview(imgView)
        }

        // 3.
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(movies.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
}
