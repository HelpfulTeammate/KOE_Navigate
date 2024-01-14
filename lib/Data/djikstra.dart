// ignore_for_file: prefer_typing_uninitialized_variables, prefer_collection_literals

class Dijkstra {
static Map singleSourceShortestPaths(graph, s, end) {
  var predecessors = {};
  var costs = {s: 0};
  var open = PriorityQueue();
  open.add(s, 0);

  var closest, u, costOfSToU, adjacentNodes, costOfE, costOfSToUPlusCostOfE, costOfSToV, firstVisit;

  while (!open.empty()) {
    closest = open.pop();
    u = closest?["value"];
    costOfSToU = closest["cost"];
    adjacentNodes = graph[u] ?? {};

    (adjacentNodes as Map).forEach((v, value) {
      if (adjacentNodes?[v] != null) {
        costOfE = adjacentNodes[v];
        costOfSToUPlusCostOfE = costOfSToU + costOfE;
        costOfSToV = costs[v];
        firstVisit = costs[v] == null;

        if (firstVisit || costOfSToV > costOfSToUPlusCostOfE) {
          costs[v] = costOfSToUPlusCostOfE;
          open.add(v, costOfSToUPlusCostOfE);
          predecessors[v] = u;
        }
      }
    });
  }

  if (end != null && costs[end] == null) {
    // Handle the case when a path to 'end' is not found.
  }

  return predecessors;
}

  /// Extract shortest path from predecessor list
  static List extractShortestPathFromPredecessorList(predecessors, end) {
    var nodes = [];
    var u = end;
    while (u != null) {
      nodes.add(u);
      u = predecessors[u];
    }
    if (nodes.length == 1) return [];
    return nodes.reversed.toList();
  }

  static List findPath(Map graph, dynamic start, dynamic end) {
    var predecessors = singleSourceShortestPaths(graph, start, end);

    return extractShortestPathFromPredecessorList(predecessors, end);
  }

    static int findCost(graph, s, end) {
    var predecessors = singleSourceShortestPaths(graph, s, end);

    // If there is no path from s to end, return an indicator (e.g., -1) to
    // signify that there is no valid path.
    if (predecessors[end] == null) {
      return -1;
    }

    var totalCost = 0;
    var u = end;
    while (u != null) {
      var predecessor = predecessors[u];
      if (predecessor != null) {
        totalCost += (graph[predecessor][u] as num).toInt();
      }
      u = predecessor;
    }

    return totalCost;
  }
}

class PriorityQueue {
  List queue = [];
  PriorityQueue();

  add(value, cost) {
    var item = {"value": value, "cost": cost};
    queue.add(item);
    queue.sort((a, b) {
      return a["cost"] - b["cost"];
    });
  }

  pop() {
    return queue.removeAt(0);
  }

  bool empty() {
    return queue.isEmpty;
  }
}
