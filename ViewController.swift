//
//  ViewController.swift
//  GuessColor
//
//  Created by Milena Lima de Alcântara on 25/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sortedColor: UIView!

    @IBOutlet var changedCollor: UIView!

    @IBOutlet var SliderColorR: UISlider!

    @IBOutlet var SliderColorG: UISlider!

    @IBOutlet var SliderColorB: UISlider!

    var changedColorR: CGFloat = 0
    var changedColorG: CGFloat = 0
    var changedColorB: CGFloat = 0

    var sortedColorR: CGFloat = 0
    var sortedColorG: CGFloat = 0
    var sortedColorB: CGFloat = 0


    @IBAction func changeValueColorR(_ sender: UISlider) {
        changedColorR = CGFloat(SliderColorR.value)
        updateChangedColorView(view: changedCollor)
        print("R: \(changedColorR)")
        print("G: \(changedColorG)")
        print("B: \(changedColorB)")
    }

    @IBAction func changeValueColorG(_ sender: UISlider) {
        changedColorG = CGFloat(SliderColorG.value)
        updateChangedColorView(view: changedCollor)
        print("R: \(changedColorR)")
        print("G: \(changedColorG)")
        print("B: \(changedColorB)")
    }


    @IBAction func changeValueColorB(_ sender: UISlider) {
        changedColorB = CGFloat(SliderColorB.value)
        updateChangedColorView(view: changedCollor)
        print("R: \(changedColorR)")
        print("G: \(changedColorG)")
        print("B: \(changedColorB)")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSortedColorView()
        setupChangedColorView()
        setupSliders()
        print("sortedR: \(sortedColorR)")
        print("sortedG: \(sortedColorG)")
        print("sortedB: \(sortedColorB)")
    }

    func verifyMergedColors() {
        if (
            changedColorR == sortedColorR &&
            changedColorG == sortedColorG &&
            changedColorB == sortedColorB
        ) {
            let closedAction = generateAlertAction(
                title: "Fechar",
                style: .cancel
            )

            showAlert(title: "Parabéns!", message: "Cor correta.", actions: [closedAction])
        }
    }

    func showAlert(
        title: String,
        message: String,
        actions: [UIAlertAction]
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        actions.forEach { action in
            alert.addAction(action)
        }

        self.present(alert, animated: true, completion: nil)
    }

    func generateAlertAction(title: String, style: UIAlertAction.Style) -> UIAlertAction {
        return UIAlertAction(
            title: title,
            style: style
        )
    }

    func updateChangedColorView(view: UIView) {
        view.backgroundColor = UIColor(
            red: changedColorR/255,
            green: changedColorG/255,
            blue: changedColorB/255,
            alpha: 1.0
        )
    }

    func updateSortedColorView(view: UIView) -> UIColor {
        sortedColorR = CGFloat.random(in: 0...1) * 255
        sortedColorG = CGFloat.random(in: 0...1) * 255
        sortedColorB = CGFloat.random(in: 0...1) * 255
        return UIColor(
            red: sortedColorR,
            green: sortedColorG,
            blue: sortedColorB,
            alpha: 1.0
        )
    }

    func setupSortedColorView() {
        sortedColor.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.width/2,
            height: 180
        )
        sortedColor.backgroundColor = updateSortedColorView(view: sortedColor)
    }

    func setupChangedColorView() {
        changedCollor.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.width/2,
            height: 180
        )
        changedCollor.backgroundColor = .black
    }

    func setupSliders() {
        setStyleSlider(slider: SliderColorR, color: .red)
        setStyleSlider(slider: SliderColorG, color: .green)
        setStyleSlider(slider: SliderColorB, color: .blue)
    }

    func setStyleSlider(slider: UISlider, color: UIColor) {
        slider.thumbTintColor = color
        slider.tintColor = color.withAlphaComponent(0.5)
        slider.backgroundColor = .clear
        slider.minimumValue = 0
        slider.maximumValue = 255

    }
}

