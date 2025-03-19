

import UIKit

class FirelineInfernoView: UIViewController {

    let firelineBackTrue: UIImageView = {
        let view = UIImageView(image: .game2BackRedline)
        view.contentMode = .scaleAspectFill
        return view
    }()
    let arrowFireRed: UIButton = {
        let button = UIButton()
        button.setImage(.arrowOkFireBack, for: .normal)
        return button
    }()
    let firelineWallet = firelineHelperPointsTableContainer()
    let spin50: UIButton = {
        let button = UIButton()
        button.setImage(.spin50Ok, for: .normal)
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
        view.addSubview(firelineWallet)
        firelineWallet.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-15)
        }
        view.addSubview(spin50)
        spin50.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-15)
        }
        spin50.addTarget(self, action: #selector(spinClickingFire), for: .touchUpInside)
    }
    var maxValue = 0
    @objc func spinClickingFire() {
        guard    firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperPointsCalculator >= 50 else {
            let alert = UIAlertController(title: "Sorry", message: "You don't have enough coins", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
            return
        }
        
        firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperPointsCalculator -= 50
        firelineWallet.updatefirelineHelperResultStatus()
        spin50.isEnabled = false
        let pointsOk = UILabel()
        pointsOk.font = UIFont(name: "Oswald-DemiBold", size: 36)
        pointsOk.textColor = .white
        pointsOk.text = String(100)
    
        view.addSubview(pointsOk)
        pointsOk.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-2)
            $0.centerX.equalToSuperview().offset(5)
        }
        let possiblesValues = [0,50,100,150,200,250,50,300,0].shuffled()
        let random1 = possiblesValues[0]
        let random2 = possiblesValues[1]
        let random3 = possiblesValues[2]
        let random4 = possiblesValues[3]
        let random5 = possiblesValues[4]
        let random6 = possiblesValues[5]
        let random7 = possiblesValues[6]
        let random8 = possiblesValues[7]
        let random9 = possiblesValues[8]
        maxValue = random9
        UIView.animate(withDuration: 0.3) {
            pointsOk.alpha = 0
        } completion: { _ in
            pointsOk.text = String(random1)
            UIView.animate(withDuration: 0.3) {
                pointsOk.alpha = 1
            } completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    pointsOk.alpha = 0
                } completion: { _ in
                    pointsOk.text = String(random2)
                    UIView.animate(withDuration: 0.3) {
                        pointsOk.alpha = 1
                    } completion: { _ in
                        UIView.animate(withDuration: 0.3) {
                            pointsOk.alpha = 0
                        } completion: { _ in
                            pointsOk.text = String(random3)
                            UIView.animate(withDuration: 0.3) {
                                pointsOk.alpha = 1
                            } completion: { _ in
                                UIView.animate(withDuration: 0.3) {
                                    pointsOk.alpha = 0
                                } completion: { _ in
                                    pointsOk.text = String(random4)
                                    UIView.animate(withDuration: 0.3) {
                                        pointsOk.alpha = 1
                                    } completion: { _ in
                                        UIView.animate(withDuration: 0.3) {
                                            pointsOk.alpha = 0
                                        } completion: { _ in
                                            pointsOk.text = String(random5)
                                            UIView.animate(withDuration: 0.3) {
                                                pointsOk.alpha = 1
                                            } completion: { _ in
                                                UIView.animate(withDuration: 0.3) {
                                                    pointsOk.alpha = 0
                                                } completion: { _ in
                                                    pointsOk.text = String(random6)
                                                    UIView.animate(withDuration: 0.3) {
                                                        pointsOk.alpha = 1
                                                    } completion: { _ in
                                                        UIView.animate(withDuration: 0.3) {
                                                            pointsOk.alpha = 0
                                                        } completion: { _ in
                                                            pointsOk.text = String(random7)
                                                            UIView.animate(withDuration: 0.3) {
                                                                pointsOk.alpha = 1
                                                            } completion: { _ in
                                                                UIView.animate(withDuration: 0.3) {
                                                                    pointsOk.alpha = 0
                                                                } completion: { _ in
                                                                    pointsOk.text = String(random9)
                                                                    UIView.animate(withDuration: 0.3) {
                                                                        pointsOk.alpha = 1
                                                                    } completion: { _ in
                                                                        UIView.animate(withDuration: 0.3) {
                                                                            pointsOk.alpha = 0
                                                                        } completion: { _ in
                                                                            pointsOk.text = String(random9)
                                                                            UIView.animate(withDuration: 0.3) {
                                                                                pointsOk.alpha = 1
                                                                            } completion: { _ in
                                                                                self.goFire()
                                                                                UIView.animate(withDuration: 3) {
                                                                                    pointsOk.alpha = 0
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    func goFire() {
        spin50.isEnabled  = true
        guard maxValue != 0 else {
            firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineLose")
            return
        }
 
        firelineHelperMasterMaxiLocalStorage.sharedfirelineHelper.firelineHelperPointsCalculator += maxValue
        firelineWallet.updatefirelineHelperResultStatus()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineWin")
        let pointsOk = UILabel()
        pointsOk.font = UIFont(name: "Oswald-DemiBold", size: 32)
        pointsOk.textColor = UIColor(red: 229/255, green: 176/255, blue: 0, alpha: 1)
        pointsOk.text = "+\(maxValue)"

        view.addSubview(pointsOk)
        pointsOk.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.centerX.equalToSuperview()
        }
        UIView.animate(withDuration: 2) {
            pointsOk.alpha = 0
        } completion: { _ in
            pointsOk.removeFromSuperview()
        }
    }
    @objc func clickFireRed() {
        firelineHelperHapticsCreator.shared.updatefirelineHelperStatusfirelineHelper()
        firelineHelperMediaGenerator.shared.firelineHelperPlaySoundEffective(name: "firelineTap")
        let vc = FirelineMenuTrueView()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}

