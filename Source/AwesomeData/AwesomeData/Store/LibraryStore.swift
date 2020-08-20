import Foundation

public class LibraryStore {
    
    public static let shared = {
        return LibraryStore()
    }()
    
    private var libraries = Libraries.allLibraries()
    
    private init() {
    }
    
    public func allLibraries() -> [Library] {
        return Array(self.libraries)
            .sorted { (left, right) -> Bool in
                return left.name.lowercased() < right.name.lowercased()
            }
    }
    
    public func libraries(forSearchQuery query: String) -> [Library] {
        return Array(self.libraries)
            .filter { (library) -> Bool in
                var textCollection: [String] = [
                    library.name,
                    library.description.short,
                    library.description.full ?? "",
                    library.preview.title,
                    library.preview.subtitle
                ]
                
                library.developers.forEach { (developer) in
                    textCollection.append(developer.name)
                    textCollection.append(developer.contactInformation?.email ?? "")
                    textCollection.append(developer.contactInformation?.website ?? "")
                }
                
                return textCollection.first { (text) -> Bool in
                    return text.lowercased().contains(
                        query.lowercased()
                    )
                } != nil
            }
            .sorted { (left, right) -> Bool in
                return left.name.lowercased() < right.name.lowercased()
            }
    }
}
