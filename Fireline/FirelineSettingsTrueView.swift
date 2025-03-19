

import UIKit

class FirelineSettingsTrueView: UIViewController {

    let firelineBackTrue: UIImageView = {
        let view = UIImageView(image: .backSettingsInfoRedline)
        view.contentMode = .scaleAspectFill
        return view
    }()
    let firelineWallet = firelineHelperPointsTableContainer()
    let arrowFireRed: UIButton = {
        let button = UIButton()
        button.setImage(.arrowOkFireBack, for: .normal)
        return button
    }()
    let firelinetext: UIImageView = {
        let view = UIImageView(image: .settingsLetterFire)
        view.contentMode = .scaleAspectFit
        return view
    }()
    let musicRedline: UIButton = {
        let button = UIButton()
        button.setImage(.musicFireRedLine, for: .normal)
        button.layer.opacity = firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperMusicTrue ? 1 : 0.5
        return button
    }()
    let soundRedline: UIButton = {
        let button = UIButton()
        button.setImage(.soundFIreRedLine, for: .normal)
        button.layer.opacity = firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperSoundTrue ? 1 : 0.5
        return button
    }()
    let vibroRedline: UIButton = {
        let button = UIButton()
        button.setImage(.vibroFireRedLine, for: .normal)
        button.layer.opacity = firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperVibroTrue ? 1 : 0.5
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(firelineBackTrue)
        firelineBackTrue.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        view.addSubview(firelineWallet)
        firelineWallet.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-15)
        }
        view.addSubview(arrowFireRed)
        arrowFireRed.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(15)
        }
        arrowFireRed.addTarget(self, action: #selector(clickFireRed), for: .touchUpInside)
        view.addSubview(firelinetext)
        firelinetext.snp.makeConstraints {
            $0.centerY.equalTo(arrowFireRed)
            $0.centerX.equalToSuperview()
        }
        view.addSubview(musicRedline)
        view.addSubview(soundRedline)
        view.addSubview(vibroRedline)
        vibroRedline.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        musicRedline.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(vibroRedline.snp.leading).offset(-5)
        }
        soundRedline.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(vibroRedline.snp.trailing).offset(5)
        }
        musicRedline.addTarget(self, action: #selector(musicRedlineAction), for: .touchUpInside)
        soundRedline.addTarget(self, action: #selector(soundRedlineAction), for: .touchUpInside)
        vibroRedline.addTarget(self, action: #selector(vibroRedlineAction), for: .touchUpInside)
    }
    @objc func musicRedlineAction() {
        firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperMusicTrue.toggle()
        musicRedline.layer.opacity = firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperMusicTrue ? 1 : 0.5
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        if firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperMusicTrue {
            firelineHelperMediaGenerator.shared.firelineHelperPlayMusicEffective(name: "firelineBack")
        } else {
            firelineHelperMediaGenerator.shared.stopfirelineHelperBGMusicType()
        }
    }
    @objc func soundRedlineAction() {
        firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperSoundTrue.toggle()
        soundRedline.layer.opacity = firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperSoundTrue ? 1 : 0.5
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
    }
    @objc func vibroRedlineAction() {
        firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperVibroTrue.toggle()
        vibroRedline.layer.opacity = firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperVibroTrue ? 1 : 0.5
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
    }
    @objc func clickFireRed() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        dismiss(animated: true)
    }

}


final class firelineHelperMasterMaxiLocalStorage: NSObject {
    static let sharedfirelineHelper = firelineHelperMasterMaxiLocalStorage()
    var firelineHelperVibroTrue: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "firelineHelperVibroTry")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "firelineHelperVibroTry")
        }
    }
    var firelineHelperMusicTrue: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "firelineHelperMusicTry")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "firelineHelperMusicTry")
        }
    }
    var firelineHelperSoundTrue: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "firelineHelperSoundTry")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "firelineHelperSoundTry")
        }
    }
    var firelineHelperPointsCalculator: Int {
        get {
            return UserDefaults.standard.integer(forKey: "firelineHelperPointsCalculator")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "firelineHelperPointsCalculator")
        }
    }
    private override init() {
        super.init()
        UserDefaults.standard.register(defaults:  [
            "firelineHelperVibroTry": true,
            "firelineHelperSoundTry": true,
            "firelineHelperMusicTry": true,
            "firelineHelperPointsCalculator": 0
        ])
    }
}
