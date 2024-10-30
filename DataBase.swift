//
//  DataBase.swift
//  Gestic
//
//  Created by Gabriel Walisson Alexandre Matias on 24/10/24.
//

import SwiftData

@Model
class Pessoa {
    var nome: String
    var nivel: String
    var modulos: [Modulo] // Uma pessoa pode ter vários módulos

    init(nome: String, nivel: String, modulos: [Modulo] = []) {
        self.nome = nome
        self.nivel = nivel
        self.modulos = modulos
    }
}

@Model
class Modulo {
    var progresso: Double = 0
    var ciclo: String
    var id: String
    var exameFinal: ExameFinal // Um módulo tem um exame final
    var exercicios: [Exercicio] // Um módulo tem vários exercícios

    init(progresso: Double, ciclo: String, id: String, exameFinal: ExameFinal, exercicios: [Exercicio] = []) {
        self.progresso = progresso
        self.ciclo = ciclo
        self.id = id
        self.exameFinal = exameFinal
        self.exercicios = exercicios
    }
}

@Model
class Exercicio {
    var tituloExercicio: String
//    var idModulo: [Modulo]

    init(tituloExercicio: String) {
        self.tituloExercicio = tituloExercicio
//        self.idModulo = idModulo
    }
}

@Model
class ExameFinal {
    var progressoExameFinal: Double = 0
    var id: String
    var modulo: Modulo // Chave estrangeira referenciando o módulo

    init(id: String, modulo: Modulo, progressoExameFinal: Double) {
        self.id = id
        self.progressoExameFinal = progressoExameFinal
        self.modulo = modulo // Referência ao módulo a que pertence
    }
}
