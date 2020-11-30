//
//  ViewController.swift
//  songPlayerDemo
//
//  Created by TANG,QI-RONG on 2020/10/15.
//  Copyright © 2020 Steven. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var albumCoverImageView: UIImageView!
    
    @IBOutlet weak var backGroundImageView: UIImageView!
    
    @IBOutlet weak var songNameLabel: UILabel!
        
    @IBOutlet weak var songTimeLabel: UILabel!
    
    @IBOutlet weak var listeningTimeLabel: UILabel!
    
    @IBOutlet weak var listeningSlider: UISlider!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var previousMusicButton: UIButton!
    
    @IBOutlet weak var nextMusicButton: UIButton!
    
    
    var songPlayer = AVPlayer()
    var playItem: AVPlayerItem?
    var songLength: Float64?
    
    var currentValue = 0
    var duration: CMTime?
    var isPlaying = false
    var isPause = false
    
    //讀取歌曲
    let vocalistName = ["The Verve - Bitter Sweet Symphony", "RAC - Never Let You Go", "Heavenly Star_ by Genki Rockets", "Elton John - Rocket Man", "Scarlet's theme"]
    
    //封面圖檔名稱
    let albumCoverImageAry = ["bitter-sweet-symphony", "RAC", "WILL", "rocket", "FF7RE"]
    
    
    @IBAction func playButtonPress(_ sender: Any) {
        if isPlaying {
            playSong()
            songPlayer.play()
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            isPause = true
            isPlaying = false
        }else if isPause {
            songPlayer.pause()
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            isPause = false
        }else {
            songPlayer.play()
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            isPause = true
        }
    }
    
    @IBAction func nextMusicPress(_ sender: Any) {
        if currentValue >= vocalistName.count - 1 {
            currentValue = 0
        }else {
            currentValue += 1
        }
        playSong()
        
        playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        isPause = true
        albumCoverImageView.image = UIImage(named: albumCoverImageAry[currentValue])
        backGroundImageView.image = UIImage(named: albumCoverImageAry[currentValue])
        songPlayer.play()
    }
    
    @IBAction func previousMusicPress(_ sender: Any) {
        if currentValue == 0 {
            currentValue = vocalistName.count - 1
        }else {
            currentValue -= 1
        }
        playSong()
        songPlayer.play()
        playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        isPause = true
        albumCoverImageView.image = UIImage(named: albumCoverImageAry[currentValue])
        backGroundImageView.image = UIImage(named: albumCoverImageAry[currentValue])
    }
    
    @IBAction func timeSliderValueChange(_ sender: UISlider) {
        let currentSliderValue = Int64(listeningSlider.value)
        let targetTime: CMTime = CMTimeMake(value: currentSliderValue, timescale: 1)
        //將目前Slider值設為播放時間
        songPlayer.seek(to: targetTime)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playSong()
        //songNameLabel.text = songNameAry[currentValue]
        //albumCoverImageView.image = UIImage(named: albumCoverImageAry[currentValue])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func timeFormate(songTime: Float64) -> String {
        var time = ""
        let length = Int(songTime)
        let min = Int(length / 60)
        let sec = Int(length % 60)
        
        //minutes
        time = "\(min)"
       
        //seconds
        if sec < 10 {
            time += ":0\(sec)"
        }else {
            time += ":\(sec)"
        }
        
        return time
    }
    
    func playSong() {
        songNameLabel.text = vocalistName[currentValue]
        albumCoverImageView.image = UIImage(named: albumCoverImageAry[currentValue])
        backGroundImageView.image = UIImage(named: albumCoverImageAry[currentValue])
        
        let currentSong = vocalistName[currentValue]
        let song = Bundle.main.path(forResource: currentSong, ofType: "mp3")
        playItem = AVPlayerItem(url: URL(fileURLWithPath: song!))
        songPlayer.replaceCurrentItem(with: playItem)
        
        // 抓時間
        duration = playItem!.asset.duration
        // 把 duration 轉成歌曲的總時間（秒數）。
        songLength = CMTimeGetSeconds(duration!)
        songTimeLabel.text = timeFormate(songTime: songLength!)
        // 更新slider value
        listeningSlider.minimumValue = 0
        listeningSlider.maximumValue = Float(songLength!)
        listeningSlider.isContinuous = true
        
        updateTime()
    }
    
    func updateTime() {
        self.songPlayer.addPeriodicTimeObserver(forInterval: CMTimeMake(value: 1, timescale: 1), queue: DispatchQueue.main) { (time: CMTime) in
            if self.songPlayer.currentItem?.status == .readyToPlay{
                let currentTime = CMTimeGetSeconds(time)
                self.listeningSlider.value = Float(currentTime)
                self.listeningTimeLabel.text = self.timeFormate(songTime: currentTime)
                self.songTimeLabel.text = self.timeFormate(songTime: (self.songLength! - currentTime))
                
                print(currentTime)
                print(self.songLength!)
                
                if (self.songLength! - currentTime) <= 0.1 {
                    self.currentValue += 1
                    self.currentValue = self.currentValue % self.vocalistName.count
                    self.playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
                    self.listeningSlider.value = 0.0
                    self.isPlaying = false
                    self.playSong()
                    self.songPlayer.play()
                    print("song 0:00")
                }
                
               //回到0:00（同一首）
               /* if (self.songLength! - currentTime) <= 0.1 {
                    self.playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
                    self.listeningSlider.value = 0.0
                    self.isPlayover = true
                    print("song 0:00")
                }*/
                print("success")
            }
        }
    }
    
    @IBSegueAction func viewLyricsButtonPress(_ coder: NSCoder) -> LyricsViewController? {
        let destinationController = LyricsViewController(coder: coder)
        destinationController?.songName = songNameLabel.text!
        destinationController?.currentNumber = currentValue
        return destinationController
    }
    

}

