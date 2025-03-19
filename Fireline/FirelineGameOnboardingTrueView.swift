

import UIKit

class FirelineGameOnboardingTrueView: UIViewController {

    let firelineBackTrue: UIImageView = {
        let view = UIImageView(image: .firelineSplashBacking)
        view.contentMode = .scaleAspectFill
        return view
    }()
    let arrowFireRed: UIButton = {
        let button = UIButton()
        button.setImage(.arrowOkFireBack, for: .normal)
        return button
    }()
    var fireline = 2
    let firelineWallet = firelineHelperPointsTableContainer()
    let fireDescription: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    let fireman: UIImageView = {
        let view = UIImageView(image: .firelinecool)
        view.contentMode = .scaleAspectFit
        return view
    }()
    let playFire: UIButton = {
        let button = UIButton()
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(firelineBackTrue)
        firelineBackTrue.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        let fireBlack = UIView()
        fireBlack.backgroundColor = .black
        fireBlack.alpha = 0.3
        view.addSubview(fireBlack)
        fireBlack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        view.addSubview(arrowFireRed)
        arrowFireRed.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(15)
        }
        arrowFireRed.addTarget(self, action: #selector(clickFireRed), for: .touchUpInside)
        view.addSubview(firelineWallet)
        firelineWallet.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }

        view.addSubview(fireDescription)
        view.addSubview(playFire)
        view.addSubview(fireman)
        playFire.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-15)
        }
        playFire.addTarget(self, action: #selector(clickPlayFire), for: .touchUpInside)
        fireDescription.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
        }
        fireman.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(300)
        }
        switch fireline {
        case 1:
            firelineBackTrue.image = .game1BackRedline
            playFire.setImage(.playRedFireline, for: .normal)
            fireDescription.image = .blazingDesc
        case 2:
            firelineBackTrue.image = .game1BackRedline
            playFire.setImage(.playRedFireline, for: .normal)
            fireDescription.image = .infernoDesc
        case 3:
            firelineBackTrue.image = .game1BackRedline
            playFire.setImage(.play100Fireline, for: .normal)
            fireDescription.image = .rescueDesc
        default:
            break
        }
    }
    @objc func clickPlayFire() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        switch fireline {
        case 1:
            let vc = FirelineBlazingView()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        case 2:
            let vc = FirelineInfernoView()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        case 3:
            let vc = FirelineRescueView()
            vc.modalPresentationStyle = .fullScreen
            firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperPointsCalculator -= 100
            present(vc, animated: true)
        default:
            break
        }
    }
    @objc func clickFireRed() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        dismiss(animated: true)
    }
}

import UIKit
import AVFAudio
import SnapKit

final class firelineHelperMediaGenerator {
    static let shared = firelineHelperMediaGenerator()


    
    func stopfirelineHelperBGMusicType() {
        firelineHelperMuiscPlayerBG?.stop()
        firelineHelperMuiscPlayerBG = nil
    }
    
    
    private init() {}
    
    private var firelineHelperMuiscPlayerBG: AVAudioPlayer?
    
    
    func firelineHelperPlayMusicEffective(name: String, fileExtension: String = "wav") {
        guard firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperMusicTrue else {
            firelineHelperMuiscPlayerBG?.stop()
            firelineHelperMuiscPlayerBG = nil
            return
        }
        
        if let player = firelineHelperMuiscPlayerBG, player.isPlaying {
            return
        }
        
        DispatchQueue.global().async {
            self.retrievefirelineHelperAndPlayItfirelineHelper(musicName: name, fileExtension: fileExtension, isBackground: true)
        }
    }
    
    private func retrievefirelineHelperAndPlayItfirelineHelper(musicName: String, fileExtension: String, isBackground: Bool) {
        guard let mediaLink = Bundle.main.url(forResource: musicName, withExtension: fileExtension) else {
            return
        }
        
        do {
            let againMusicMaker = try AVAudioPlayer(contentsOf: mediaLink)
            againMusicMaker.prepareToPlay()
            againMusicMaker.play()
            
            DispatchQueue.main.async {
                if isBackground {
                    self.firelineHelperMuiscPlayerBG = againMusicMaker
                    self.firelineHelperMuiscPlayerBG?.numberOfLoops = -1
                    self.firelineHelperMuiscPlayerBG?.volume = 0.46
                } else {
                    self.firelineHelperSoundPlayerBG = againMusicMaker
                }
            }
        } catch {
            print("Failed to initialize AVAudioPlayer with error: \(error.localizedDescription)")
        }
    }
    
    private var firelineHelperSoundPlayerBG: AVAudioPlayer?
    
    func firelineHelperPlaySoundEffective(name: String, fileExtension: String = "wav") {
        guard firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperSoundTrue else {
            firelineHelperSoundPlayerBG?.stop()
            return
        }
        
        DispatchQueue.global().async {
            self.retrievefirelineHelperAndPlayItfirelineHelper(musicName: name, fileExtension: fileExtension, isBackground: false)
        }
    }
    
}
