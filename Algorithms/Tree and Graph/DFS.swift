//
//  DFS.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/29/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func depthFirstSearch(graph: AdjancencyListGraph<String> , source: Vertex<String>) -> [Vertex<String>]? {
    
    var stack = Stack<Vertex<String>>()
    var visited = { () -> [Vertex<String> : Bool] in
        var visited: [Vertex<String>: Bool] = [:]
        
        for (key, _) in graph.adjacencyDict {
            visited[key] = false
        }
        return visited
    }()

    var path: [Vertex<String>]? = []
    
    stack.push(source)
    visited[source] = true
    
    while !stack.isEmpty {
        let topElement = stack.pop()
        path?.append(topElement!)

        
        guard let neigbhours = graph.edges(from: topElement!) else {
            return path
        }
        
        for neigbhour in neigbhours {
            let destinationVertex = neigbhour.destination
            if visited[destinationVertex] == false {
                stack.push(destinationVertex)
                visited[destinationVertex] = true
            }
        }
    }
    return path
}

func depthFirstSearchTest() {
    
    let (graph, source) = initialiseAdjacencyListGraph()
    let path = depthFirstSearch(graph: graph, source: source)
    
    print(path!)
}
