

import UIKit

class FirelineOnboardTrueView: UIViewController {

    let firelineBackTrue: UIImageView = {
        let view = UIImageView(image: .firelineSplashBacking)
        view.contentMode = .scaleAspectFill
        return view
    }()
    let fireDescription: UIImageView = {
        let view = UIImageView(image: .enterTheFireline)
        view.contentMode = .scaleAspectFit
        return view
    }()
    let nextFireRedline: UIButton = {
        let button = UIButton()
        button.setImage(.nextRedInferni, for: .normal)
        return button
    }()
    let backFireRedline: UIButton = {
        let button = UIButton()
        button.setImage(.backInferno, for: .normal)
        return button
    }()
    let skipFireRedline: UIButton = {
        let button = UIButton()
        button.setImage(.skipInferno, for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperPointsCalculator = 10000
        view.addSubview(firelineBackTrue)
        firelineBackTrue.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        let blackFire = UIView()
        blackFire.backgroundColor = .black
        blackFire.alpha = 0.3
        view.addSubview(blackFire)
        blackFire.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        view.addSubview(nextFireRedline)
        view.addSubview(fireDescription)
        view.addSubview(backFireRedline)
        view.addSubview(skipFireRedline)
        backFireRedline.isHidden = true
        nextFireRedline.addTarget(self, action: #selector(clickFireNext), for: .touchUpInside)
        backFireRedline.addTarget(self, action: #selector(clickFireBack), for: .touchUpInside)
        skipFireRedline.addTarget(self, action: #selector(clickFireSkip), for: .touchUpInside)
        fireDescription.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(15)
        }
        nextFireRedline.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-15)
        }
        skipFireRedline.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-15)
        }
        backFireRedline.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-15)
        }
    }
    @objc func clickFireBack() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        switch fireCurrent {
        case 2:
            backFireRedline.isHidden = true
          
            fireCurrent = 1
            fireDescription.image = .enterTheFireline
        case 3:
            fireCurrent = 2
            fireDescription.image = .playWithFire
        default:
            break
        }
    }
    @objc func clickFireSkip() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        let vc = FirelineMenuTrueView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @objc func clickFireNext() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        switch fireCurrent {
        case 1:
            backFireRedline.isHidden = false
            fireCurrent = 2
            fireDescription.image = .playWithFire
        case 2:
            fireCurrent = 3
            fireDescription.image = .becomeAHero
        case 3:
            let vc = FirelineMenuTrueView()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        default:
            break
        }
    }
    var fireCurrent = 1

}

