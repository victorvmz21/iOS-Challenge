// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetMoviesQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetMoviesQuery {
      movies {
        __typename
        title
        genres
        voteAverage
        posterPath
        overview
        cast {
          __typename
          name
          profilePath
        }
        director {
          __typename
          name
        }
      }
    }
    """

  public let operationName: String = "GetMoviesQuery"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("movies", type: .list(.object(Movie.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(movies: [Movie?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "movies": movies.flatMap { (value: [Movie?]) -> [ResultMap?] in value.map { (value: Movie?) -> ResultMap? in value.flatMap { (value: Movie) -> ResultMap in value.resultMap } } }])
    }

    public var movies: [Movie?]? {
      get {
        return (resultMap["movies"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Movie?] in value.map { (value: ResultMap?) -> Movie? in value.flatMap { (value: ResultMap) -> Movie in Movie(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Movie?]) -> [ResultMap?] in value.map { (value: Movie?) -> ResultMap? in value.flatMap { (value: Movie) -> ResultMap in value.resultMap } } }, forKey: "movies")
      }
    }

    public struct Movie: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Movie"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("genres", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
          GraphQLField("voteAverage", type: .nonNull(.scalar(Double.self))),
          GraphQLField("posterPath", type: .scalar(String.self)),
          GraphQLField("overview", type: .nonNull(.scalar(String.self))),
          GraphQLField("cast", type: .nonNull(.list(.nonNull(.object(Cast.selections))))),
          GraphQLField("director", type: .nonNull(.object(Director.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: String, genres: [String], voteAverage: Double, posterPath: String? = nil, overview: String, cast: [Cast], director: Director) {
        self.init(unsafeResultMap: ["__typename": "Movie", "title": title, "genres": genres, "voteAverage": voteAverage, "posterPath": posterPath, "overview": overview, "cast": cast.map { (value: Cast) -> ResultMap in value.resultMap }, "director": director.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var genres: [String] {
        get {
          return resultMap["genres"]! as! [String]
        }
        set {
          resultMap.updateValue(newValue, forKey: "genres")
        }
      }

      public var voteAverage: Double {
        get {
          return resultMap["voteAverage"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "voteAverage")
        }
      }

      public var posterPath: String? {
        get {
          return resultMap["posterPath"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "posterPath")
        }
      }

      public var overview: String {
        get {
          return resultMap["overview"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "overview")
        }
      }

      public var cast: [Cast] {
        get {
          return (resultMap["cast"] as! [ResultMap]).map { (value: ResultMap) -> Cast in Cast(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Cast) -> ResultMap in value.resultMap }, forKey: "cast")
        }
      }

      public var director: Director {
        get {
          return Director(unsafeResultMap: resultMap["director"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "director")
        }
      }

      public struct Cast: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Cast"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("profilePath", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, profilePath: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Cast", "name": name, "profilePath": profilePath])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profilePath: String? {
          get {
            return resultMap["profilePath"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePath")
          }
        }
      }

      public struct Director: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Director"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "Director", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}
