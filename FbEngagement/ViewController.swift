//
//  ViewController.swift
//  FbEngagement
//
//  Created by Vishwa Raj on 05/02/17.
//  Copyright © 2017 Vishwa Raj. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var barView: BarChartView!
    @IBOutlet weak var tfValue: UITextField!
    
    dynamic var date: Date = Date()
    dynamic var count: Int = Int(0)
    var totalLikes = [Int]()
    var newLikes = [Int]()
    var Unlikes = [Int]()
    var egnagedUsers = [Int]()
    var upperLimit = Int()
    var lowerLimit = Int()
    var months = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        setChart(dataPoints: months, values: unitsSold)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    @IBAction func addBtnAction(_ sender: UIButton) {
        
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        barView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y:values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
        let chartData = BarChartData()
        chartData.addDataSet(chartDataSet)
        barView.data = chartData
    }
   
}

