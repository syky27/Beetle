import Foundation

extension Date {
    func ISO8601String() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let ISO8601FormatedString = dateFormatter.string(from: self)
        return ISO8601FormatedString
    }

    func gitlabDueDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let ISO8601FormatedString = dateFormatter.string(from: self)
        return ISO8601FormatedString
    }
}
