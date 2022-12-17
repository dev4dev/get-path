import Foundation

@main
public struct GetPath {
    public static func main() {
        guard CommandLine.arguments.count == 2, let path = CommandLine.arguments.last else {
            writeToStdError("Error: Provide path")
        }
        let url = URL(fileURLWithPath: path)
        if url.hasDirectoryPath {
            print(path)
            exit(EXIT_SUCCESS)
        } else {
            do {
                let data = try URL.bookmarkData(withContentsOf: url)
                let values = URL.resourceValues(forKeys: [.pathKey], fromBookmarkData: data)
                if let link = values?.path {
                    print(link)
                    exit(EXIT_SUCCESS)
                } else {
                    writeToStdError("Error: Invalid link")
                }
            } catch {
                writeToStdError("Error: Unsupported file type")
            }
        }
    }
}

func writeToStdError(_ str: String) -> Never {
    let handle = FileHandle.standardError

    if let data = str.data(using: .utf8) {
        try? handle.write(contentsOf: data)
    }

    exit(EXIT_FAILURE)
}
