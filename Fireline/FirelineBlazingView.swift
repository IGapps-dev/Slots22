

import UIKit

class FirelineBlazingView: UIViewController {

    let firelineBackTrue: UIImageView = {
        let view = UIImageView(image: .game1BackRedline)
        view.contentMode = .scaleAspectFill
        return view
    }()
    let freLinee5 = UIImageView()
    let freLinee6 = UIImageView()
    let freLinee7 = UIImageView()
    let freLinee8 = UIImageView()
    let freLinee9 = UIImageView()
    let freLinee10 = UIImageView()
    let freLinee11 = UIImageView()
    let freLinee12 = UIImageView()
    let arrowFireRed: UIButton = {
        let button = UIButton()
        button.setImage(.arrowOkFireBack, for: .normal)
        return button
    }()
    var arrayOffreLinees: [UIImage] = [.fire1,.fire2,.fire3,.fire4]
    let freLinee1 = UIImageView()
    let freLinee2 = UIImageView()
    let firelineWallet = firelineHelperPointsTableContainer()
    let spinFirelinButton: UIButton = {
        let button = UIButton()
        button.setImage(.spinRedline, for: .normal)
        return button
    }()
    let plusRedline: UIButton = {
        let button = UIButton()
        button.setImage(.plusRedline, for: .normal)
        return button
    }()
    let minusRedline: UIButton = {
        let button = UIButton()
        button.setImage(.minusRedline, for: .normal)
        return button
    }()
    let firePointsLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font =  UIFont(name: "Oswald-DemiBold", size: 40)
        label.text = "50"
        return label
    }()
    var firePoints = 50
    let fireBoard1: UIImageView = {
        let view = UIImageView(image: .redlineBoard1)
        view.contentMode = .scaleAspectFit
        return view
    }()
    let fireBoard2: UIImageView = {
        let view = UIImageView(image: .redlineBoard2)
        view.contentMode = .scaleAspectFit
        return view
    }()
    let fireBoard3: UIImageView = {
        let view = UIImageView(image: .redlineBoard3)
        view.contentMode = .scaleAspectFit
        return view
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
        view.addSubview(firelineWallet)
        firelineWallet.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-15)
        }
        view.addSubview(spinFirelinButton)
        view.addSubview(plusRedline)
        view.addSubview(minusRedline)
        view.addSubview(firePointsLabel)
        spinFirelinButton.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
        }
        firePointsLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview().offset(20)
        }
        plusRedline.snp.makeConstraints {
            $0.centerX.equalTo(firePointsLabel)
            $0.bottom.equalTo(firePointsLabel.snp.top).offset(-10)
        }
        minusRedline.snp.makeConstraints {
            $0.centerX.equalTo(firePointsLabel)
            $0.top.equalTo(firePointsLabel.snp.bottom).offset(10)
        }
        spinFirelinButton.addTarget(self, action: #selector(tapFirelineSpin), for: .touchUpInside)
        plusRedline.addTarget(self, action: #selector(tapFirelinePlus), for: .touchUpInside)
        minusRedline.addTarget(self, action: #selector(tapFirelineMinus), for: .touchUpInside)
        view.addSubview(fireBoard1)
        view.addSubview(fireBoard2)
        view.addSubview(fireBoard3)
        fireBoard2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(spinFirelinButton)
        }
        fireBoard1.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(fireBoard2.snp.top).offset(-20)
        }
        fireBoard3.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(fireBoard2.snp.bottom).offset(20)
        }
        freLineesArray.append(freLinee1)
        freLineesArray.append(freLinee2)
        freLineesArray.append(freLinee3)
        freLineesArray.append(freLinee4)
        freLineesArray.append(freLinee5)
        freLineesArray.append(freLinee6)
        freLineesArray.append(freLinee7)
        freLineesArray.append(freLinee8)
        freLineesArray.append(freLinee9)
        freLineesArray.append(freLinee10)
        freLineesArray.append(freLinee11)
        freLineesArray.append(freLinee12)
     

        view.addSubview(freLinee1)
        view.addSubview(freLinee2)
        view.addSubview(freLinee3)
        view.addSubview(freLinee4)
        view.addSubview(freLinee5)
        view.addSubview(freLinee6)
        view.addSubview(freLinee7)
        view.addSubview(freLinee8)
        view.addSubview(freLinee9)
        view.addSubview(freLinee10)
        view.addSubview(freLinee11)
        view.addSubview(freLinee12)
        freLinee2.snp.makeConstraints {
            $0.centerY.equalTo(fireBoard1)
            $0.trailing.equalTo(fireBoard1.snp.centerX).offset(-10)
        }
        freLinee1.snp.makeConstraints {
            $0.centerY.equalTo(fireBoard1)
            $0.trailing.equalTo(freLinee2.snp.leading).offset(-20)
        }
        freLinee3.snp.makeConstraints {
            $0.centerY.equalTo(fireBoard1)
            $0.leading.equalTo(fireBoard1.snp.centerX).offset(10)
        }
        freLinee4.snp.makeConstraints {
            $0.centerY.equalTo(fireBoard1)
            $0.leading.equalTo(freLinee3.snp.trailing).offset(20)
        }
        
        freLinee6.snp.makeConstraints {
            $0.centerY.equalTo(fireBoard2)
            $0.trailing.equalTo(fireBoard2.snp.centerX).offset(-10)
        }
        freLinee5.snp.makeConstraints {
            $0.centerY.equalTo(fireBoard2)
            $0.trailing.equalTo(freLinee2.snp.leading).offset(-20)
        }
        freLinee7.snp.makeConstraints {
            $0.centerY.equalTo(fireBoard2)
            $0.leading.equalTo(fireBoard2.snp.centerX).offset(10)
        }
        freLinee8.snp.makeConstraints {
            $0.centerY.equalTo(fireBoard2)
            $0.leading.equalTo(freLinee3.snp.trailing).offset(20)
        }
        
        freLinee10.snp.makeConstraints {
            $0.centerY.equalTo(fireBoard3)
            $0.trailing.equalTo(fireBoard3.snp.centerX).offset(-10)
        }
        freLinee9.snp.makeConstraints {
            $0.centerY.equalTo(fireBoard3)
            $0.trailing.equalTo(freLinee2.snp.leading).offset(-20)
        }
        freLinee11.snp.makeConstraints {
            $0.centerY.equalTo(fireBoard3)
            $0.leading.equalTo(fireBoard3.snp.centerX).offset(10)
        }
        freLinee12.snp.makeConstraints {
            $0.centerY.equalTo(fireBoard3)
            $0.leading.equalTo(freLinee3.snp.trailing).offset(20)
        }
        freLineesArray.forEach { view in
            view.image = arrayOffreLinees.randomElement()
            view.snp.makeConstraints {
                $0.width.height.equalTo(60)
            }
        }
    }
    @objc func tapFirelineSpin() {
        guard    firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperPointsCalculator >= firePoints else {
            let alert = UIAlertController(title: "Sorry", message: "You don't have enough coins", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
            return
        }
        firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperPointsCalculator -= firePoints
        firelineWallet.updatefirelineHelperResultStatus()
        spinFirelinButton.isEnabled = false
        for (index, view) in freLineesArray.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15 * Double(index)) {
                UIView.animate(withDuration: 1) {
                    view.alpha = 0
                    
                } completion: { _ in
               
                            view.image = self.arrayOffreLinees.randomElement()
                        
                
                    UIView.animate(withDuration: 1) {
                        view.alpha = 1
                        
                    } completion: { _ in
                        if index == self.freLineesArray.count - 1 {
                            self.spinFirelinButton.isEnabled = true
                            self.fireCheckStatusing()
                        }
                    }
                }
            }
          
        }
    }
    func fireCheckStatusing() {
        let randomes = [50,100,150,200,0,0,0,0,300,500].shuffled()
        guard randomes[0] != 0 else {
            firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineLose")
            return
        }
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineWin")
        let pointsOk = UILabel()
        pointsOk.font = UIFont(name: "Oswald-DemiBold", size: 32)
        pointsOk.textColor = UIColor(red: 229/255, green: 176/255, blue: 0, alpha: 1)
        pointsOk.text = String(randomes[0])
        firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperPointsCalculator += randomes[0]
        firelineWallet.updatefirelineHelperResultStatus()
        view.addSubview(pointsOk)
        pointsOk.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
        }
        UIView.animate(withDuration: 2) {
            pointsOk.alpha = 0
        } completion: { _ in
            pointsOk.removeFromSuperview()
        }
    }
 
    @objc func tapFirelineMinus() {
        
        if firePoints > 50 {
            firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
            firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
            firePoints -= 50
            firePointsLabel.text = String(firePoints)
        }
    }
    @objc func tapFirelinePlus() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        if firePoints < 500 {
            firePoints += 50
            firePointsLabel.text = String(firePoints)
        }
    }
    @objc func clickFireRed() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        let vc = FirelineMenuTrueView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    var freLineesArray: [UIImageView] = []

    let freLinee3 = UIImageView()
    let freLinee4 = UIImageView()

}

