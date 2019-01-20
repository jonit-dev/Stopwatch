 
import UIKit

class ViewController: UIViewController {
    
    let stopwatch = Stopwatch()
    
    var timer: Timer?

    @IBOutlet weak var elapseTimeLabel: UILabel!
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func startButtonTapped(_ sender: UIButton) {
        print("Start Button Tapped")
        stopwatch.start()
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateElapsedTimeLabel(timer:)), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
         print("Stop Button Tapped")
        stopwatch.stop()
    }
    
    @IBAction func resetButtonTapped() {
        
       
        if stopwatch.isRunning {
            print("Watch is running, reseting watch")
                       stopwatch.reset()
        } else {
            print("Watch is stopped, setting it back to zero")
        
            //reset timer
                 timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateElapsedTimeLabel(timer:)), userInfo: nil, repeats: true)
            
            //then start over
            stopwatch.start()
         
        }
        
        

    }
    
    
    @objc func updateElapsedTimeLabel(timer: Timer){
        print("Updating elapsed time")
        if stopwatch.isRunning{
            let minutes = Int(stopwatch.elapsedTime / 60)
            let seconds = Int(stopwatch.elapsedTime.truncatingRemainder(dividingBy: 60))
            let tenths = Int((stopwatch.elapsedTime * 10).truncatingRemainder(dividingBy: 10))
            
            elapseTimeLabel.text = String(format: "%02d:%02d.%02d", minutes, seconds, tenths)
           
            
            //elapseTimeLabel.text = "\(stopwatch.elapsedTime)"
        } else {
            timer.invalidate()
        }
    }
    
    deinit{
        if  let timer = self.timer{
            timer.invalidate()
        }
    }

}

