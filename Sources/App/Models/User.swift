
import Foundation
import Vapor
import FluentPostgreSQL

final class User: Codable {
  var id: UUID?
  var apiKey: String
  var secretKey: String
    
  init(apiKey: String, secretKey: String) {
    self.apiKey = apiKey
    self.secretKey = secretKey
  }
}

extension User: PostgreSQLUUIDModel {}
extension User: Content {}
extension User: Migration {}
extension User: Parameter {}
