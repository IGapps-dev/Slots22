

import UIKit

class FirelineSplashView: UIViewController {

    let firelineBackTrue: UIImageView = {
        let view = UIImageView(image: .firelineSplashBacking)
        view.contentMode = .scaleAspectFill
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(firelineBackTrue)
        firelineBackTrue.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.fireStarted()
        }
    }

    func fireStarted() {
        if !UserDefaults.standard.bool(forKey: "fireStarted") {
            UserDefaults.standard.setValue(true, forKey: "fireStarted")
            let vc = FirelineOnboardTrueView()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        } else {
            let vc = FirelineMenuTrueView()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
}

