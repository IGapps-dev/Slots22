

import UIKit

class FirelineMenuTrueView: UIViewController {

    let firelineBackTrue: UIImageView = {
        let view = UIImageView(image: .blazingBack)
        view.contentMode = .scaleAspectFill
        return view
    }()
    let chooseFireline: UIImageView = {
        let view = UIImageView(image: .chooseAGameTexting)
        view.contentMode = .scaleAspectFit
        return view
    }()
    let firelineWallet = firelineHelperPointsTableContainer()
    let settingsFireline: UIButton = {
        let button = UIButton()
        button.setImage(.settingsMenuFire, for: .normal)
        return button
    }()
    let readFireline: UIButton = {
        let button = UIButton()
        button.setImage(.readMenuFire, for: .normal)
        return button
    }()
    let infoFireline: UIButton = {
        let button = UIButton()
        button.setImage(.infoMenuFire, for: .normal)
        return button
    }()
    let playFireline: UIButton = {
        let button = UIButton()
        button.setImage(.playRedFireline, for: .normal)
        return button
    }()
    let gameButton1: UIButton = {
        let button = UIButton()
        return button
    }()
    let gameButton2: UIButton = {
        let button = UIButton()
        return button
    }()
    let gameButton3: UIButton = {
        let button = UIButton()
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
        view.addSubview(chooseFireline)
        chooseFireline.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.centerX.equalToSuperview()
        }
        if firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperMusicTrue {
            firelineHelperMediaGenerator.shared.firelineHelperPlayMusicEffective(name: "firelineBack")
        } else {
            firelineHelperMediaGenerator.shared.stopfirelineHelperBGMusicType()
        }
        view.addSubview(settingsFireline)
        view.addSubview(readFireline)
        view.addSubview(infoFireline)
        view.addSubview(playFireline)
        settingsFireline.addTarget(self, action: #selector(settingsFirelineAction), for: .touchUpInside)
        readFireline.addTarget(self, action: #selector(readFirelineAction), for: .touchUpInside)
        infoFireline.addTarget(self, action: #selector(infoFirelineAction), for: .touchUpInside)
        playFireline.addTarget(self, action: #selector(playFirelineAction), for: .touchUpInside)
        playFireline.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-15)
        }
        settingsFireline.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(15)
        }
        readFireline.snp.makeConstraints {
            $0.centerX.equalTo(settingsFireline)
            $0.top.equalTo(settingsFireline.snp.bottom).offset(10)
        }
        infoFireline.snp.makeConstraints {
            $0.centerX.equalTo(settingsFireline)
            $0.top.equalTo(readFireline.snp.bottom).offset(10)
        }
        view.addSubview(gameButton1)
        view.addSubview(gameButton2)
        view.addSubview(gameButton3)
        gameButton1.addTarget(self, action: #selector(clickGameButton1), for: .touchUpInside)
        gameButton2.addTarget(self, action: #selector(clickGameButton2), for: .touchUpInside)
        gameButton3.addTarget(self, action: #selector(clickGameButton3), for: .touchUpInside)
//        gameButton1.backgroundColor = .red
//        gameButton2.backgroundColor = .red
//        gameButton3.backgroundColor = .red
        gameButton2.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(120)
            $0.height.equalTo(170)
        }
        gameButton1.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(gameButton2.snp.leading).offset(-70)
            $0.width.equalTo(150)
            $0.height.equalTo(170)
        }
        gameButton3.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(gameButton2.snp.trailing).offset(70)
            $0.width.equalTo(150)
            $0.height.equalTo(170)
        }
    }
    @objc func clickGameButton1() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        fireLine = 1
        firelineBackTrue.image = .infernoBack
    }
    @objc func clickGameButton2() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        fireLine = 2
        firelineBackTrue.image = .blazingBack
    }
    @objc func clickGameButton3() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        fireLine = 3
        firelineBackTrue.image = .rescueBack
    }
    var fireLine = 2
    @objc func settingsFirelineAction() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        let vc = FirelineSettingsTrueView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @objc func readFirelineAction() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        let vc = FirelineFilesTrueView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @objc func infoFirelineAction() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        let vc = FirelineInfoTrueView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @objc func playFirelineAction() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        let vc = FirelineGameOnboardingTrueView()
        vc.modalPresentationStyle = .fullScreen
        vc.fireline = fireLine
        present(vc, animated: true)
    }

}

