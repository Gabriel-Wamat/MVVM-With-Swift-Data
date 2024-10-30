//
//  ModuloViewModel.swift
//  Gestic
//
//  Created by Gabriel Walisson Alexandre Matias on 24/10/24.
//
import SwiftData
import SwiftUI

class ModuloViewModel: ObservableObject {
    @Published var modulos: [Modulo] = []
    var modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchModulos()
    }

    func fetchModulos() {
        do {
            // FetchDescriptor usado corretamente para buscar módulos
            let descriptor = FetchDescriptor<Modulo>(sortBy: [SortDescriptor(\.id)])
            modulos = try modelContext.fetch(descriptor)
        } catch {
            print("Falha ao buscar módulos")
        }
    }

    func adicionarModulo(ciclo: String, progresso: Double, exameFinal: ExameFinal) {
        let novoModulo = Modulo(progresso: progresso, ciclo: ciclo, id: UUID().uuidString, exameFinal: exameFinal)
        modelContext.insert(novoModulo)
        fetchModulos() // Atualiza os módulos após a inserção
    }
}
