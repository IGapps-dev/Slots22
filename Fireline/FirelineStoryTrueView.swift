

import UIKit

class FirelineStoryTrueView: UIViewController {

    let firelineBackTrue: UIImageView = {
        let view = UIImageView(image: .blueBackSimple)
        view.contentMode = .scaleAspectFill
        return view
    }()
    let arrowFireRed: UIButton = {
        let button = UIButton()
        button.setImage(.arrowOkFireBack, for: .normal)
        return button
    }()
    let fireText: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    let fireDesc: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    let smallFire: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    let redLines: UIImageView = {
        let view = UIImageView(image: .twoRedLines)
        view.contentMode = .scaleAspectFit
        return view
    }()
    let openImage: UIButton = {
        let button = UIButton()
        button.setImage(.openImageOk, for: .normal)
        return button
    }()
    var fireValue = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(firelineBackTrue)
        firelineBackTrue.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        view.addSubview(arrowFireRed)
        arrowFireRed.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(15)
        }
        arrowFireRed.addTarget(self, action: #selector(clickFireRed), for: .touchUpInside)
        view.addSubview(smallFire)
        smallFire.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().offset(15)
        }
        view.addSubview(redLines)
        redLines.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(40)
            $0.centerY.equalToSuperview()
        }
        view.addSubview(fireText)
        fireText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(arrowFireRed)
        }
        view.addSubview(fireDesc)
        fireDesc.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
        }
       
        switch fireValue {
        case 1:
            fireText.image = .theInfernoAwakens
            fireDesc.image = .theInfernoDesc
            smallFire.image = .infernoSmall
        case 2:
            fireText.image = .ashesAndShadows
            fireDesc.image = .ashesAndDesc
            smallFire.image = .ashesssSmall
        case 3:
            fireText.image = .trialByFire
            fireDesc.image = .trialByDesc
            smallFire.image = .triallSmall
        default:
            break
        }
        view.addSubview(openImage)
        openImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-40)
            $0.bottom.equalToSuperview().offset(-20)
        }
        openImage.addTarget(self, action: #selector(clickOpen), for: .touchUpInside)
    }
    @objc func clickOpen() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        let vc =  FirelineBigImageTrueView()
        vc.modalPresentationStyle = .fullScreen
        vc.fireValue = fireValue
        present(vc, animated: true)
    }
    @objc func clickFireRed() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        dismiss(animated: true)
    }
}

