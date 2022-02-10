//
//  AlertViewController.swift
//  pushAlertSample
//
//  Created by 木元健太郎 on 2022/02/07.
//

import UIKit

final class AlertViewController: UIViewController {
    
    private var request:UNNotificationRequest!
    
    
    @IBAction private func change(_ sender: UIDatePicker) {
        
        // 日付フォーマット
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        
        // 現在時刻の1分後に設定
        //  let date2 = Date(timeInterval: 60, since: date)
        let targetDate = Calendar.current.dateComponents(
            [.hour, .minute],
            from: sender.date)
        
        let dateString = dateFormatter.string(from: sender.date)
        print(dateString)
        
        // トリガーの作成
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: targetDate, repeats: false)
        
        // 通知コンテンツの作成
        let content = UNMutableNotificationContent()
        content.title = "Calendar Notification"
        content.body = dateString
        content.sound = UNNotificationSound.default
        
        // 通知リクエストの作成
        request = UNNotificationRequest.init(
            identifier: "CalendarNotification",
            content: content,
            trigger: trigger)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction private func button(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        center.add(request)
        print(request)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}





