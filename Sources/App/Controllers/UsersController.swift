

import Vapor

struct UsersController: RouteCollection {
    
    func boot(router: Router) throws {
        
        let usersRoute = router.grouped("api", "users")
        
        usersRoute.post(User.self, use: createHandler)
        usersRoute.get(use: getAllHandler)
        usersRoute.get(User.parameter, use: getHandler)
//        usersRoute.get(User.parameter, "acronyms", use: getAcronymsHandler) //connects an HTTP GET request to /api/users/<USER ID>/acronyms to getAcronymsHandler(_:).
    }
    
    func createHandler(_ req: Request, user: User) throws -> Future<User> {
        return user.save(on: req)
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[User]> {
      return User.query(on: req).all()
    }

    func getHandler(_ req: Request) throws -> Future<User> {
      return try req.parameters.next(User.self)
        
    }
    
//    func getAcronymsHandler(_ req: Request)
//      throws -> Future<[Acronym]> {
//      // 2
//      return try req
//        .parameters.next(User.self)
//        .flatMap(to: [Acronym].self) { user in
//    // 3
//          try user.acronyms.query(on: req).all()
//      }
//    }
}
