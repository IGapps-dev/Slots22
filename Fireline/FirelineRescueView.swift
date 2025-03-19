

import UIKit

class FirelineRescueView: UIViewController {

    let firelineBackTrue: UIImageView = {
        let view = UIImageView(image: .game3BackRedline)
        view.contentMode = .scaleAspectFill
        return view
    }()
    let arrowFireRed: UIButton = {
        let button = UIButton()
        button.setImage(.arrowOkFireBack, for: .normal)
        return button
    }()
    let timerFireBack: UIImageView = {
        let view = UIImageView(image: .backTimerFire)
        view.contentMode = .scaleAspectFit
        return view
    }()
    let goalFireBack: UIImageView = {
        let view = UIImageView(image: .backGoalFire)
        view.contentMode = .scaleAspectFit
        return view
    }()
    let pointsFireBack: UIImageView = {
        let view = UIImageView(image: .backPointsFire)
        view.contentMode = .scaleAspectFit
        return view
    }()
    let timerFirelineLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font =  UIFont(name: "Oswald-DemiBold", size: 32)
        label.text = "01:00"
        return label
    }()
    let pointsFirelineLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font =  UIFont(name: "Oswald-DemiBold", size: 32)
        label.text = "0"
        return label
    }()
    var leftTimerFireline = 60
    var pointsCurrentFireline = 0
    let firelineWallet = firelineHelperPointsTableContainer()
    var fireTimering = Timer()
    var fallingItems: [UIImage] = [.falling1,.falling2,.falling3,.falling4,.falling5]
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
        view.addSubview(firelineWallet)
        firelineWallet.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-15)
        }
        view.addSubview(timerFireBack)
        view.addSubview(goalFireBack)
        view.addSubview(pointsFireBack)
        pointsFireBack.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-15)
            $0.bottom.equalToSuperview().offset(-15)
        }
        goalFireBack.snp.makeConstraints {
            $0.centerX.equalTo(pointsFireBack)
            $0.bottom.equalTo(pointsFireBack.snp.top).offset(-10)
        }
        timerFireBack.snp.makeConstraints {
            $0.centerX.equalTo(pointsFireBack)
            $0.top.equalTo(firelineWallet.snp.bottom).offset(15)
        }
        view.addSubview(timerFirelineLabel)
        view.addSubview(pointsFirelineLabel)
        timerFirelineLabel.snp.makeConstraints {
            $0.center.equalTo(timerFireBack)
        }
        pointsFirelineLabel.snp.makeConstraints {
            $0.centerX.equalTo(pointsFireBack)
            $0.bottom.equalTo(pointsFireBack.snp.bottom).offset(-3)
        }
        fireTimering = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerGoGO), userInfo: nil, repeats: true)

    }
    @objc func timerGoGO(){ 
        leftTimerFireline -= 1
        if leftTimerFireline >= 0 {
            timerFirelineLabel.text = String(format: "%02d:%02d", leftTimerFireline / 60, leftTimerFireline % 60)
            if leftTimerFireline % 1 == 0 {
                let item = UIImageView(image: fallingItems.randomElement())
                view.addSubview(item)
                item.isUserInteractionEnabled = true
                item.snp.makeConstraints {
                    $0.centerX.equalTo(CGFloat.random(in: 30...500))
                    $0.centerY.equalTo(CGFloat.random(in: 30...300))
                }
                item.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickItem(_:))))
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    UIView.animate(withDuration: 0.5) {
                        item.alpha = 0
                    } completion: { _ in
                        item.isHidden = true
                    }
                }
            }
            
            
            
            
        } else {
            if pointsCurrentFireline >= 1000 {
                finishTimerGood()
            } else {
                finishTimerBad()
            }
        }
    }
    @objc func clickItem(_ sender: UITapGestureRecognizer) {
        guard let item = sender.view as? UIImageView else { return }
        if item.image == UIImage(named: "falling1") ||   item.image == UIImage(named: "falling2") ||  item.image == UIImage(named: "falling3") {
            pointsCurrentFireline += 100
            let coins = UIImageView(image: .get100)
            view.addSubview(coins)
            coins.snp.makeConstraints {
                $0.center.equalTo(sender.view?.center ?? 5)
            }
            UIView.animate(withDuration: 0.5) {
                coins.alpha = 0
            } completion: { _ in
                coins.removeFromSuperview()
            }
        } else {
            pointsCurrentFireline -= 50
            let coins = UIImageView(image: .get50)
            view.addSubview(coins)
            coins.snp.makeConstraints {
                $0.center.equalTo(sender.view?.center ?? 5)
            }
            UIView.animate(withDuration: 0.5) {
                coins.alpha = 0
            } completion: { _ in
                coins.removeFromSuperview()
            }
        }
        sender.view?.removeFromSuperview()

        pointsFirelineLabel.text = String(pointsCurrentFireline)
    }
    func finishTimerGood() {
        fireTimering.invalidate()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineWin")
        firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperPointsCalculator += pointsCurrentFireline
        let fireBack = UIImageView(image: .game3BackRedline)
        fireBack.contentMode = .scaleAspectFill
        view.addSubview(fireBack)
        fireBack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        let blackFire = UIView()
        blackFire.backgroundColor = .black
        blackFire.alpha = 0.3
        view.addSubview(blackFire)
        blackFire.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        let firelineWallet2 = firelineHelperPointsTableContainer()
        let arrowFireRed2: UIButton = {
            let button = UIButton()
            button.setImage(.arrowOkFireBack, for: .normal)
            return button
        }()
        view.addSubview(arrowFireRed2)
        arrowFireRed2.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(15)
        }
        arrowFireRed2.addTarget(self, action: #selector(clickFireRed), for: .touchUpInside)
        view.addSubview(firelineWallet2)
        firelineWallet2.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-15)
        }
        let fireman = UIImageView(image: .firelinecool)
        view.addSubview(fireman)
        fireman.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(300)
        }
        let winBig = UIImageView(image: .bigWinFireline)
        view.addSubview(winBig)
        winBig.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(0)
        }
        let tapTo = UIButton()
        tapTo.setImage(.tapToContinue, for: .normal)
        view.addSubview(tapTo)
        tapTo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-15)
        }
        tapTo.addTarget(self, action: #selector(clickFireRed), for: .touchUpInside)
        let coinsFire = UIImageView(image: .coinFireline)
        view.addSubview(coinsFire)
        coinsFire.snp.makeConstraints {
            $0.bottom.equalTo(tapTo.snp.top).offset(-15)
            $0.trailing.equalTo(tapTo).offset(20)
        }
        let firePointsLabel: UILabel = {
           let label = UILabel()
            label.textColor = UIColor(red: 229/255, green: 176/255, blue: 0, alpha: 1)
            label.font =  UIFont(name: "Oswald-DemiBold", size: 50)
            label.text = String(pointsCurrentFireline)
            return label
        }()
        view.addSubview(firePointsLabel)
        firePointsLabel.snp.makeConstraints {
            $0.centerY.equalTo(coinsFire)
            $0.trailing.equalTo(coinsFire.snp.leading).offset(-10)
        }
    }
    func finishTimerBad() {
        fireTimering.invalidate()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineLose")
        let fireBack = UIImageView(image: .game3BackRedline)
        fireBack.contentMode = .scaleAspectFill
        view.addSubview(fireBack)
        fireBack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        let blackFire = UIView()
        blackFire.backgroundColor = .black
        blackFire.alpha = 0.3
        view.addSubview(blackFire)
        blackFire.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        let firelineWallet2 = firelineHelperPointsTableContainer()
        let arrowFireRed2: UIButton = {
            let button = UIButton()
            button.setImage(.arrowOkFireBack, for: .normal)
            return button
        }()
        view.addSubview(arrowFireRed2)
        arrowFireRed2.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(15)
        }
        arrowFireRed2.addTarget(self, action: #selector(clickFireRed), for: .touchUpInside)
        view.addSubview(firelineWallet2)
        firelineWallet2.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-15)
        }
       
        let winBig = UIImageView(image: .defeatFireline)
        view.addSubview(winBig)
        winBig.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(0)
        }
        let tapTo = UIButton()
        tapTo.setImage(.tapToContinue, for: .normal)
        view.addSubview(tapTo)
        tapTo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-15)
        }
        tapTo.addTarget(self, action: #selector(clickFireRed), for: .touchUpInside)
        let coinsFire = UIImageView(image: .coinFireline)
        view.addSubview(coinsFire)
        coinsFire.snp.makeConstraints {
            $0.bottom.equalTo(tapTo.snp.top).offset(-15)
            $0.trailing.equalTo(tapTo).offset(20)
        }
        let firePointsLabel: UILabel = {
           let label = UILabel()
            label.textColor = UIColor(red: 229/255, green: 176/255, blue: 0, alpha: 1)
            label.font =  UIFont(name: "Oswald-DemiBold", size: 50)
            label.text = String(0)
            return label
        }()
        view.addSubview(firePointsLabel)
        firePointsLabel.snp.makeConstraints {
            $0.centerY.equalTo(coinsFire)
            $0.trailing.equalTo(coinsFire.snp.leading).offset(-10)
        }
    }
    @objc func clickFireRed() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        fireTimering.invalidate()
        let vc = FirelineMenuTrueView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}

