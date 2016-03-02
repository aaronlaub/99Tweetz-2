//
//  DetailViewController.swift
//  99Tweetz
//
//  Created by Laub on 3/1/16.
//  Copyright © 2016 Aaron Laub. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var retweetsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    var tweet: Tweet?

    override func viewDidLoad() {
        super.viewDidLoad()


        
        usernameLabel.text = String(tweet!.user!.name!)
        screennameLabel.text = "@\(tweet!.user!.screenname)"
        tweetLabel.text = tweet!.text as? String
        
        retweetsLabel.text = "\(String(tweet!.retweet_count)) Retweets"
        
        favoritesLabel.text = "\(String(tweet!.favorites_count)) Favorites"
        
        profileImageView.setImageWithURL(tweet!.user!.profileUrl!)
        
        timeLabel.text = calculateTimeStamp(tweet!.timestamp!.timeIntervalSinceNow)
        

        // Do any additional setup after loading the view.
    }
    
    func calculateTimeStamp(timeTweetPostedAgo: NSTimeInterval) -> String {
        // Turn timeTweetPostedAgo into seconds, minutes, hours, days, or years
        var rawTime = Int(timeTweetPostedAgo)
        var timeAgo: Int = 0
        var timeChar = ""
        
        rawTime = rawTime * (-1)
        
        // Figure out time ago
        if (rawTime <= 60) { // SECONDS
            timeAgo = rawTime
            timeChar = "s"
        } else if ((rawTime/60) <= 60) { // MINUTES
            timeAgo = rawTime/60
            timeChar = "m"
        } else if (rawTime/60/60 <= 24) { // HOURS
            timeAgo = rawTime/60/60
            timeChar = "h"
        } else if (rawTime/60/60/24 <= 365) { // DAYS
            timeAgo = rawTime/60/60/24
            timeChar = "d"
        } else if (rawTime/(3153600) <= 1) { // YEARS
            timeAgo = rawTime/60/60/24/365
            timeChar = "y"
        }
        
        return "\(timeAgo)\(timeChar)"
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
