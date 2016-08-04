import AVFoundation
import Foundation
#if !COCOAPODS
import PromiseKit
#endif

/**
 To import the `AVAudioSession` category:

    use_frameworks!
    pod "PromiseKit/AVFoundation"

 And then in your sources:

    import PromiseKit
*/
extension AVAudioSession {
    /// Requests the user’s permission for audio recording.
    public func requestRecordPermission() -> Promise<Bool> {
        return Promise { fulfill, _ in
            requestRecordPermission(fulfill)
        }
    }
}
