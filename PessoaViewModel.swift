//
//  PessoaViewModel.swift
//  Gestic
//
//  Created by Gabriel Walisson Alexandre Matias on 24/10/24.
//

import SwiftData
import SwiftUI

class PessoaViewModel: ObservableObject {
    @Published var pessoas: [Pessoa] = []
    var modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchPessoas()
    }

    func fetchPessoas() {
        do {
            // FetchDescriptor usado corretamente para buscar pessoas
            let descriptor = FetchDescriptor<Pessoa>(sortBy: [SortDescriptor(\.nome)])
            pessoas = try modelContext.fetch(descriptor)
        } catch {
            print("Falha ao buscar pessoas")
        }
    }

    func adicionarPessoa(nome: String, nivel: String) {
        let novaPessoa = Pessoa(nome: nome, nivel: nivel)
        modelContext.insert(novaPessoa)
        fetchPessoas()
    }
}

