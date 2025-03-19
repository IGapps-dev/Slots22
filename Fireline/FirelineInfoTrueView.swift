

import UIKit
import StoreKit
import SafariServices
class FirelineInfoTrueView: UIViewController {

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
        let view = UIImageView(image: .infoLetterFire)
        view.contentMode = .scaleAspectFit
        return view
    }()
    let firelineShare: UIButton = {
        let button = UIButton()
        button.setImage(.shareRedline, for: .normal)
        return button
    }()
    let firelineRate: UIButton = {
        let button = UIButton()
        button.setImage(.rateRedline, for: .normal)
        return button
    }()
    let firelinePrivacy: UIButton = {
        let button = UIButton()
        button.setImage(.privacyRedline, for: .normal)
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
        view.addSubview(firelineShare)
        view.addSubview(firelineRate)
        view.addSubview(firelinePrivacy)
        firelineRate.addTarget(self, action: #selector(firelineRateClick), for: .touchUpInside)
        firelineShare.addTarget(self, action: #selector(firelineShareClick), for: .touchUpInside)
        firelinePrivacy.addTarget(self, action: #selector(firelinePrivacyClick), for: .touchUpInside)
        firelineRate.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        firelineShare.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(firelineRate.snp.leading).offset(-5)
        }
        firelinePrivacy.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(firelineRate.snp.trailing).offset(5)
        }
    }
    @objc func firelineRateClick() {
        SKStoreReviewController.requestReview()
    }
    @objc func firelineShareClick() {
        if let link = NSURL(string: "https://apps.apple.com/app/id6743442065")
        {
            let objectsToShare = [link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    @objc func firelinePrivacyClick() {
        guard let url = URL(string: "https://www.termsfeed.com/live/7272f9b8-2e60-4ec1-b81a-6138c6bc9631") else { return }
        let controller = SFSafariViewController(url: url)
        self.present(controller, animated: true)
    }
    @objc func clickFireRed() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        dismiss(animated: true)
    }


}

