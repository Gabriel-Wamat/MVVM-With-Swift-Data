//
//  ExercicioViewModel.swift
//  Gestic
//
//  Created by Gabriel Walisson Alexandre Matias on 24/10/24.
//

import SwiftUI
import SwiftData

class ExercicioViewModel: ObservableObject {
    @Published var exercicios: [Exercicio] = []
    var modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchExercicios()
    }

    func fetchExercicios() {
        do {
            // FetchDescriptor usado corretamente para buscar exercícios
            let descriptor = FetchDescriptor<Exercicio>(sortBy: [SortDescriptor(\.tituloExercicio)])
            exercicios = try modelContext.fetch(descriptor)
        } catch {
            print("Falha ao buscar exercícios")
        }
    }

    func adicionarExercicio(tituloExercicio: String) {
        let novoExercicio = Exercicio(tituloExercicio: tituloExercicio)
        modelContext.insert(novoExercicio)
        fetchExercicios() // Atualiza os exercícios após a inserção
    }
}
