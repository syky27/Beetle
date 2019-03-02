public struct GitLabIssue {
    let title: String
    let description: String?
    let confidental: Bool?
    let assigneeIds: [Int]?
    let milestoneId: Int?
    let labels: String?
    let createdAt: Date?
    let dueDate: Date?
    let weight: Int?

    public init(title: String, description: String? = nil, confidental: Bool? = false, assigneeIds: [Int]? = nil, milestoneId: Int? = nil, labels: String? = nil, createdAt: Date? = nil, dueDate: Date? = nil, weight: Int? = nil) {
        self.title = title
        self.description = description
        self.confidental = confidental
        self.assigneeIds = assigneeIds
        self.milestoneId = milestoneId
        self.labels = labels
        self.createdAt = createdAt
        self.dueDate = dueDate
        self.weight = weight
    }

    func params() -> [String: Any] {
        return [
            "title": title,
            "description": description as Any,
            "confidental": confidental as Any,
            "assignee_ids": assigneeIds as Any,
            "milestone_id": milestoneId as Any,
            "labels": labels as Any,
            "createdAt": createdAt?.ISO8601String() as Any,
            "dueDate": dueDate?.gitlabDueDateFormat() as Any,
            "weight": weight as Any,
        ]
    }
}
