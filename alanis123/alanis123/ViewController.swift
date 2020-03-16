//
//  ViewController.swift
//  alanis123
//  Created by Alanis Lima Santa Clara on 02/03/20.
//  Copyright © 2020 Alanis Lima Santa Clara. All rights reserved.
//

import UIKit
//import eh para pegar coisas que nao temos no nosso codigo. Estamos pegando coisas de fora, um codigo fora. Nesse caso, ele vai usar as coisas que UIKit disponibiliza. Eh em um padrao

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
 
    let arrayPodcast: [String] = ["10", "20", "30", "40", "50", "60", "70", "80"]
     

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    } //aqui em cima eh para o numero de pickers do lado do outro/colunas
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayPodcast.count
    }//adicionar o numero dos componentes que estiverem na lista para as linhas do picker
     
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        return arrayPodcast[row]
        //row(indice) eh linha. nesse contexto quer falar que vai atribuir uma linha a cada elemento (load dos dados)
    }
        
//        if row == 0{
//            return "10 minutos"
//        }
//        else if row == 1{
//            return "20 minutos"
//        }
//        else if row == 2{
//            return "30 minutos"
//        }
//        else if row == 3{
//            return "40 minutos"
//        }
//        else if row == 4{
//           return "50 minutos"
//        }
//        else if row == 5{
//           return "1 hora"
//        }else{
//            return "Acima de uma hora"
//        }
        
        
    @IBOutlet var quadradoRosa: UIImageView!
    //ver propiedades
    
    @IBOutlet var fundoBorrado: UIView!
    
    @IBOutlet var textFieldTempoDePercurso: UITextField!

    @IBOutlet var pickerPodcast: UIPickerView!
    
    @IBOutlet var labelResultado: UILabel!
    
    
    @IBOutlet var mensagemONumeroDoPodcastÉ: UIImageView!

    
    //viewDidLoad quer dizer "tela carregou" / view pode ser visao ou tela
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.fundoBorrado.isHidden = true
        self.pickerPodcast.delegate = self
        self.pickerPodcast.dataSource = self
        // esse ultimo self eh para falar que vai la para a classe viewcontroller
        
        // Do any additional setup after loading the view. (faça qualquer coisa -configuracao- que voce precise no carregamento do app)
        
    }
    @IBAction func botaoVerResultados() {
        lerEDividir()
        //funcao para executar alguma açÃo
        
    }
    
    
    @IBAction func botaoVoltar() {
        //aqui vamos retornar ao inicio
        self.fundoBorrado.isHidden = true
        self.textFieldTempoDePercurso.text = ""
        self.pickerPodcast.selectRow(0, inComponent: 0, animated: true)
        //"" para retornar zerado e nao ter numero passado
        
    }
    
    //depois dividir essa funcao em duas, ler eh o botao e dividir seria calculo na classe do objeto(ta misturado)

    func lerEDividir(){

        let tempoDePercurso = textFieldTempoDePercurso.text!
        print(tempoDePercurso)
        
        let selectedPodcast = pickerPodcast.selectedRow(inComponent: 0)
        // para saber o numero da lista escolhido no podcast
        let tempoDePodcast = arrayPodcast[selectedPodcast]
        
        print(tempoDePodcast)

        let tempoDePercursoFloat: Float? = Float(tempoDePercurso)
        let tempoDePodcastFloat: Float? = Float(tempoDePodcast)
            //convertemos acima os tempos em float
        
        if (tempoDePercursoFloat != nil && tempoDePodcastFloat != nil) {
            
            let tempo = Tempo(tempoDePercurso: tempoDePercursoFloat!, tempoDePodcast: tempoDePodcastFloat!)
            let qntdDePodcasts = tempo.soDividir()
            //esse soDividir foi feito na minha classe do outro campo
            
            print(qntdDePodcasts)

            self.fundoBorrado.isHidden = false
            //labelResultado.text = String(qntdDePodcasts) + " Podcasts"
            //podemos fazer tambem: usando uma variavel dentro de uma string: \() --> embaixo eh para mostrar o
            labelResultado.text = "\(String(qntdDePodcasts)) PODCASTS"
        }

        else{
            self.fundoBorrado.isHidden = false
            self.mensagemONumeroDoPodcastÉ.isHidden = true
            self.labelResultado.text = "Infelizmente não foi possível calcular. Insira os tempos corretamente!"

        }

    }
    
}



//depois fazer funcoes que retornam (pesquisar no google)
// coloquei fora do view controller para a gente separar melhor e entender como


