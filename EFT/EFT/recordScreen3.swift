import UIKit
import AVFoundation

var counter2 = 0
var soundPlayer2 : AVAudioPlayer!


class recordScreen3: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (counter2 == 0){
            setupRecorder()
            playBtn3.isEnabled = false
        }
        let url = getFileURL()
        do{
            soundPlayer2 = try AVAudioPlayer(contentsOf : url as URL)
        }catch{
            print(error)
        }
        if (soundPlayer2 == nil){
            playBtn3.isEnabled = false
        }else{
            playBtn3.isEnabled = true
        }
        counter2 += 1
    }
        // Do any additional setup after loading the view.
    
    
    var fileName2 = "audioFile2.aac"

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var recordBtn3: UIButton!
    @IBOutlet weak var playBtn3: UIButton!
    @IBOutlet weak var nextBtn3: UIButton!
    
    var soundRecorder : AVAudioRecorder!
    
    
    func setupRecorder(){
        let recordSettings = [ AVFormatIDKey : kAudioFormatMPEG4AAC, AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue, AVEncoderBitRateKey : 320000, AVNumberOfChannelsKey : 2, AVSampleRateKey : 44100.0 ] as [String : Any]
        let _ : NSError?
        let audioSession = AVAudioSession.sharedInstance()
        do{
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
        }catch{
            print(error)
        }
        
        do{
            soundRecorder = try AVAudioRecorder(url : getFileURL() as URL, settings : recordSettings)
        }catch{
            print("Something went wrong")
        }
        soundRecorder.delegate = self
        soundRecorder.prepareToRecord()
    }
    
    func getCacheDirectory() -> String{
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        return paths[0]
    }
    
    open func getFileURL() -> NSURL{
        let pathURL = NSURL(fileURLWithPath : getCacheDirectory()).appendingPathComponent(fileName2)
        let pathString = pathURL?.path
        let filePath = NSURL(fileURLWithPath : pathString!)
        return filePath
    }
    
    
    @IBAction func record3(_ sender: UIButton) {
        if sender.titleLabel?.text == "Record"{
            setupRecorder()
            soundRecorder.deleteRecording()
            soundRecorder.record()
            sender.setTitle("Stop", for : .normal)
            playBtn3.isEnabled = false
            nextBtn3.isEnabled = false
        }else{
            soundRecorder.stop()
            sender.setTitle("Record", for : .normal)
            playBtn3.isEnabled = false
        }
    }
    
    
    @IBAction func playSound3(_ sender: UIButton) {
        if sender.titleLabel?.text == "Play"{
            recordBtn3.isEnabled = false
            sender.setTitle("Stop", for : .normal)
            preparePlayer()
            soundPlayer2.play()
            nextBtn3.isEnabled = false
        }else{
            soundPlayer2.stop()
            sender.setTitle("Play", for : .normal)
        }
    }
    
    
    
    func preparePlayer(){
        let _ : NSError?
        do{
            soundPlayer2 = try AVAudioPlayer(contentsOf : getFileURL() as URL)
        }catch{
            print(error)
        }
        soundPlayer2.delegate = self
        soundPlayer2.prepareToPlay()
        soundPlayer2.volume = 10.0
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        playBtn3.isEnabled = true
        nextBtn3.isEnabled = true
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        recordBtn3.isEnabled = true
        nextBtn3.isEnabled = true
        playBtn3.setTitle("Play", for : .normal)
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
