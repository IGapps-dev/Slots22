

import UIKit

class FirelineBigImageTrueView: UIViewController {

    let firelineBackTrue: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    let arrowFireRed: UIButton = {
        let button = UIButton()
        button.setImage(.crossRedline, for: .normal)
        return button
    }()
    let fireText: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
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
        view.addSubview(fireText)
        fireText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(arrowFireRed)
        }
        switch fireValue {
        case 1:
            fireText.image = .theInfernoAwakens
            firelineBackTrue.image = .theInfernoBack
        case 2:
            fireText.image = .ashesAndShadows
            firelineBackTrue.image = .ashesAndBack
        case 3:
            fireText.image = .trialByFire
            firelineBackTrue.image = .trialByFireBack
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

