//
//  MapController.swift
//  Taxi
//
//  Created by Katsuya Taguchi on 2017/10/22.
//  Copyright © 2017年 清野隼史. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController {
  var mylocationManager: CLLocationManager!
  let ud = UserDefaults.standard
  let myMapView = MKMapView()
  let myLocationManager = CLLocationManager()
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var rideLocation: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    mylocationManager = CLLocationManager() // インスタンスの生成
    mylocationManager.delegate = self  as! CLLocationManagerDelegate// CLLocationManagerDelegateプロトコルを実装するクラスを指定する
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

@IBAction func editProfile(_ sender: UIButton) {
}

@IBAction func selectTime(_ sender: UIDatePicker) {
}

@IBAction func customEnd(_ sender: UIButton) {
}
}

extension MapController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
            case .notDetermined:
            print("ユーザーはこのアプリケーションに関してまだ選択を行っていません")
            // 許可を求めるコードを記述する（後述）
            mylocationManager.requestWhenInUseAuthorization()
            break
            case .denied:
            print("ローケーションサービスの設定が「無効」になっています (ユーザーによって、明示的に拒否されています）")
            // 「設定 > プライバシー > 位置情報サービス で、位置情報サービスの利用を許可して下さい」を表示する
            break
            case .restricted:
            print("このアプリケーションは位置情報サービスを使用できません(ユーザによって拒否されたわけではありません)")
            // 「このアプリは、位置情報を取得できないために、正常に動作できません」を表示する
            break
            case .authorizedAlways:
            print("常時、位置情報の取得が許可されています。")
            // 位置情報取得の開始処理
            break
            case .authorizedWhenInUse:
            print("起動時のみ、位置情報の取得が許可されています。")
            mylocationManager.startUpdatingLocation()
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let myLocation = locations.last! as CLLocation
        let coordinate = myLocation.coordinate
        let span = MKCoordinateSpanMake(0.005, 0.005)
        let region = MKCoordinateRegionMake(coordinate, span)
        self.mapView.setRegion(region, animated:true)

    }
}
