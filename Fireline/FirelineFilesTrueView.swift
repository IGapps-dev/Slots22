

import UIKit

class FirelineFilesTrueView: UIViewController {

    let firelineBackTrue: UIImageView = {
        let view = UIImageView(image: .blazingBack)
        view.contentMode = .scaleAspectFill
        return view
    }()
    let arrowFireRed: UIButton = {
        let button = UIButton()
        button.setImage(.arrowOkFireBack, for: .normal)
        return button
    }()
    let firelinetext: UIImageView = {
        let view = UIImageView(image: .infernofiles)
        view.contentMode = .scaleAspectFit
        return view
    }()
    let part1: UIButton = {
        let button = UIButton()
        button.setImage(.part1Fire, for: .normal)
        return button
    }()
    let part2: UIButton = {
        let button = UIButton()
        button.setImage(.part2Fire, for: .normal)
        return button
    }()
    let part3: UIButton = {
        let button = UIButton()
        button.setImage(.part3Fire, for: .normal)
        return button
    }()
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
        view.addSubview(firelinetext)
        firelinetext.snp.makeConstraints {
            $0.centerY.equalTo(arrowFireRed)
            $0.centerX.equalToSuperview()
        }
        view.addSubview(arrowFireRed)
        arrowFireRed.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(15)
        }
        arrowFireRed.addTarget(self, action: #selector(clickFireRed), for: .touchUpInside)
        view.addSubview(part1)
        view.addSubview(part2)
        view.addSubview(part3)
        part1.addTarget(self, action: #selector(clickPart1), for: .touchUpInside)
        part2.addTarget(self, action: #selector(clickPart2), for: .touchUpInside)
        part3.addTarget(self, action: #selector(clickPart3), for: .touchUpInside)
        part2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-60)
            $0.width.height.equalTo(200)
        }
        part1.snp.makeConstraints {
            $0.trailing.equalTo(part2.snp.leading).offset(-8)
            $0.bottom.equalToSuperview().offset(-60)
            $0.width.height.equalTo(200)
        }
        part3.snp.makeConstraints {
            $0.leading.equalTo(part2.snp.trailing).offset(8)
            $0.bottom.equalToSuperview().offset(-60)
            $0.width.height.equalTo(200)
        }
    }
    @objc func clickPart1() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        let vc = FirelineStoryTrueView()
        vc.modalPresentationStyle = .fullScreen
        vc.fireValue = 1
        present(vc, animated: true)
    }
    @objc func clickPart2() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        let vc = FirelineStoryTrueView()
        vc.modalPresentationStyle = .fullScreen
        vc.fireValue = 2
        present(vc, animated: true)
    }
    @objc func clickPart3() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        let vc = FirelineStoryTrueView()
        vc.modalPresentationStyle = .fullScreen
        vc.fireValue = 3
        present(vc, animated: true)
    }
    @objc func clickFireRed() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        dismiss(animated: true)
    }


}


final class firelineHelperHapticsCreator {
    private init() {}
    func updatefirelineHelperStatusfirelineHelper() {
        guard firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperVibroTrue else { return }
        let firelineHelperMaker = UIImpactFeedbackGenerator(style: .medium)
        firelineHelperMaker.impactOccurred()
    }
    static let shared = firelineHelperHapticsCreator()
}

class firelineHelperPointsTableContainer: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(firelineHelperBackgroundContainer)
        firelineHelperBackgroundContainer.addSubview(firelineHelperPointsLabelWhite)
        firelineHelperBackgroundContainer.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        firelineHelperPointsLabelWhite.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(firelineHelperBackgroundContainer.snp.trailing).offset(-45)
        }
    }
    
    
    
    func updatefirelineHelperResultStatus() {
        firelineHelperPointsLabelWhite.text = "\(Int(firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperPointsCalculator))"
    }
  
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private lazy var firelineHelperBackgroundContainer: UIImageView = {
        let firelineHelperImageStatus = UIImageView()
        firelineHelperImageStatus.image = .firelineWalletTrue
        firelineHelperImageStatus.contentMode = .scaleAspectFill
        return firelineHelperImageStatus
    }()
    
    private lazy var firelineHelperPointsLabelWhite: UILabel = {
        let firelineHelperLabel = UILabel()
        firelineHelperLabel.text = "\(Int(firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperPointsCalculator))"
        firelineHelperLabel.backgroundColor = .clear
        firelineHelperLabel.textAlignment = .center
        firelineHelperLabel.font = UIFont(name: "Oswald-DemiBold", size: 24)
        firelineHelperLabel.textColor = UIColor(red: 229/255, green: 176/255, blue: 0, alpha: 1)
        return firelineHelperLabel
    }()
}


