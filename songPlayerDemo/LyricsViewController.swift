//
//  LyricsViewController.swift
//  songPlayerDemo
//
//  Created by TANG,QI-RONG on 2020/10/15.
//  Copyright © 2020 Steven. All rights reserved.
//

import UIKit

class LyricsViewController: UIViewController {

    var currentNumber = Int()
    var songName = String()
    
    @IBOutlet weak var songLabel: UILabel!
        
    @IBOutlet weak var lyricsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        songLabel.text = songName
        lyricsTextView.text = lyricsTextAry[currentNumber]
    }
    
    let lyricsTextAry = ["Cause it's a bittersweet symphony this life\n Trying to make ends meet, you're a slave to the money then you die\n I'll take you down the only road I've ever been down\n You know the one that takes you to the places where all the veins meet, yeah\n No change, I can't change, I can't change, I can't change\n but I'm here in my mold, I am here in my mold\n But I'm a million different people from one day to the next\n I can't change my mold, no, no, no, no, no, no, no\n Well I never pray,\n But tonight I'm on my knees, yeah.\n I need to hear some sounds that recognize the pain in me, yeah.\n I let the melody shine, let it cleanse my mind, I feel free now.\n But the airwaves are clean and there's nobody singing to me now.\n No change, I can't change, I can't change, I can't change,\n But I'm here in my mold, I am here in my mold.\n And I'm a million different people from one day to the next\n I can't change my mold, no, no, no, no, no, no, no\n\n Cause it's a bittersweet symphony this life.\n Trying to make ends meet, trying to find some money then you die.\n I'll take you down the only road I've ever been down\n You know the one that takes you to the places where all the veins meet, yeah.\n No change, I can't change, I can't change, I can't change,\n but I'm here in my mold, I am here in my mold.\n But I'm a million different people from one day to the next\n I can't change my mold, no, no, no, no, no, no, no (x3)\n It justs sex and violence melody and silence\n It justs sex and violence melody and silence\n  (I'll take you down the only road I've ever been down)",
                         
        "There's every good reason\n For letting you go\n She's sneaky and smoked out\n And it's starting to show\n I'll never let you go (x3)\n I'll never let you\n Turn around our back on each other\n That's a good idea, break a promise to your mother\n Turn around your back on each other\n You say that I've changed\n Well maybe I did\n But even if I changed\n What's wrong with it?\n I'll never let you go (x3)\n I'll never let you\n Turn around, our back on each other\n That's a good idea, break a promise to your mother\n Turn around your back on each other\n All our friends are gone and gone\n And all the time moves on and on\n And all I know is it's wrong, it's wrong\n And all I know is it's wrong, it's wrong\n If there's a reason\n It's lost on me\n Maybe we'll be friends\n I guess we'll see\n I'll never let you go (x4)\n Turn around, our back on each other\n It's a good idea, break a promise to your mother\n Turn around, let's turn on each other\n Good idea, break a promise to your mother\n Turn around your back on each other\n That's a good idea, break a promise to your mother\n Turn around your back on each other\n What a good idea\n I remember the stupid things, the mood rings\n The bracelets and the beads\n Nickels and dimes, yours and mine\n Did you cash in all your dreams?\n You don't dream for me, no (goodbye, goodbye)\n you don't dream for me, no\n But I still feel you're pulsing like sonar\n from the days in the waves\n That girl is like a sunburn, I would like to say\n That girl is like a sunburn\n I would like to say\n She's like a sunburn\n (I'll never let you go) She's like a sunburn\n She's like a sunburn",
        
        "I hear you whispering surrounded in silence\n Blue vibration\n I hear the waves singing in the distance\n Pure isolation\n I smile into the distance faraway from you\n Were in resolution\n Im Dreaming, touching, breathing side by side, yeh\n Dive into the sky\n\n Lets get away, fly away\n I found the path to paradise\n Shining spiral of gold\n Take my hand, find our way out\n Heavenly stars above\n Just believe whats in your heart\n No border between us\n I can always feel you inside\n Where ever we are\n\n I see you, feel you, Im your creation\n Ever lasting affection\n Lifes an endless spiral going round\n Yes, we are in love\n Lets get away, fly away\n I found the path to paradise\n Shining spiral of gold\n Take my hand, find our way out\n Heavenly stars above\n Just believe whats in your heart\n No border between us\n I can always feel you inside\n Where ever we are\n\n Lets get away, fly away\n Im feeling raindrops on my face\n Sun shines through the clouds yeh\n Rainbow all around us\n I spread my wings, fly away\n The wind sweeps me off my feet\n Blowing me away yeh\n Trees whispering to me\n Im feeling free now\n\n Lets get away, fly away\n I found the path to paradise\n Shining spiral of gold\n Take my hand, find our way out\n Heavenly stars above\n Just believe whats in your heart\n No border between us\n Nothing can divide us\n Where ever we are",
        
        "She packed my bags last night pre-flight\n Zero hour nine AM\n And I'm gonna be high as a kite by then\n I miss the earth so much I miss my wife\n It's lonely out in space\n On such a timeless flight\n And I think it's gonna be a long long time\n Till touch down brings me round again to find\n I'm not the man they think I am at home\n Oh no no no I'm a rocket man\n Rocket man burning out his fuse up here alone\n And I think it's gonna be a long long time\n Till touch down brings me round again to find\n I'm not the man they think I am at home\n Oh no no no I'm a rocket man\n Rocket man burning out his fuse up here alone\n Mars ain't the kind of place to raise your kids\n In fact it's cold as hell\n And there's no one there to raise them if you did\n And all this science I don't understand\n It's just my job five days a week\n A rocket man, a rocket man\n And I think it's gonna be a long long time\n Till touch down brings me round again to find\n I'm not the man they think I am at home\n Oh no no no I'm a rocket man\n Rocket man burning out his fuse up here alone\n And I think it's gonna be a long long time\n Till touch down brings me round again to find\n I'm not the man they think I am at home\n Oh no no no I'm a rocket man\n Rocket man burning out his fuse up here alone\n And I think it's gonna be a long long time(x8)",
        
        "Fireworks to light up your night sky,\n In a flash life & love can go awry,\n Let me take you higher, fulfill your desires,\n Stilettos & lingerie both compliment, supplement,\n In my grandeur I'm all-natural beneath this crimson dress,\n In my splendor I'm all-natural beneath jewels & finesse & elegance\n\n What you see is what you get,\n Only passion, no regrets,\n Only triumph, I've got nothing to hide,\n So, sit back & enjoy the ride"]

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
