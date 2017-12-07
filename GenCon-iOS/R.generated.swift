//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `eventVec.svg`.
    static let eventVecSvg = Rswift.FileResource(bundle: R.hostingBundle, name: "eventVec", pathExtension: "svg")
    
    /// `bundle.url(forResource: "eventVec", withExtension: "svg")`
    static func eventVecSvg(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.eventVecSvg
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 5 images.
  struct image {
    /// Image `add`.
    static let add = Rswift.ImageResource(bundle: R.hostingBundle, name: "add")
    /// Image `announce`.
    static let announce = Rswift.ImageResource(bundle: R.hostingBundle, name: "announce")
    /// Image `event`.
    static let event = Rswift.ImageResource(bundle: R.hostingBundle, name: "event")
    /// Image `send`.
    static let send = Rswift.ImageResource(bundle: R.hostingBundle, name: "send")
    /// Image `task`.
    static let task = Rswift.ImageResource(bundle: R.hostingBundle, name: "task")
    
    /// `UIImage(named: "add", bundle: ..., traitCollection: ...)`
    static func add(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.add, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "announce", bundle: ..., traitCollection: ...)`
    static func announce(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.announce, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "event", bundle: ..., traitCollection: ...)`
    static func event(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.event, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "send", bundle: ..., traitCollection: ...)`
    static func send(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.send, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "task", bundle: ..., traitCollection: ...)`
    static func task(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.task, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `Cell`.
    static let cell: Rswift.ReuseIdentifier<UIKit.UITableViewCell> = Rswift.ReuseIdentifier(identifier: "Cell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 1 view controllers.
  struct segue {
    /// This struct is generated for `EventViewController`, and contains static references to 1 segues.
    struct eventViewController {
      /// Segue identifier `toEditEvent`.
      static let toEditEvent: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, EventViewController, EditEventViewController> = Rswift.StoryboardSegueIdentifier(identifier: "toEditEvent")
      
      /// Optionally returns a typed version of segue `toEditEvent`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func toEditEvent(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, EventViewController, EditEventViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.eventViewController.toEditEvent, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 4 storyboards.
  struct storyboard {
    /// Storyboard `EditEvent`.
    static let editEvent = _R.storyboard.editEvent()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    /// Storyboard `NewEvent`.
    static let newEvent = _R.storyboard.newEvent()
    
    /// `UIStoryboard(name: "EditEvent", bundle: ...)`
    static func editEvent(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.editEvent)
    }
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    /// `UIStoryboard(name: "NewEvent", bundle: ...)`
    static func newEvent(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.newEvent)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
      try newEvent.validate()
      try editEvent.validate()
    }
    
    struct editEvent: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = EditEventViewController
      
      let bundle = R.hostingBundle
      let name = "EditEvent"
      
      static func validate() throws {
        if UIKit.UIImage(named: "send") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'send' is used in storyboard 'EditEvent', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UITabBarController
      
      let announce = StoryboardViewControllerResource<UIKit.UINavigationController>(identifier: "Announce")
      let announceController = StoryboardViewControllerResource<AnnounceViewController>(identifier: "AnnounceController")
      let bundle = R.hostingBundle
      let event = StoryboardViewControllerResource<UIKit.UINavigationController>(identifier: "Event")
      let eventController = StoryboardViewControllerResource<EventViewController>(identifier: "EventController")
      let mainTabBar = StoryboardViewControllerResource<UIKit.UITabBarController>(identifier: "MainTabBar")
      let name = "Main"
      let task = StoryboardViewControllerResource<UIKit.UINavigationController>(identifier: "Task")
      let taskController = StoryboardViewControllerResource<TaskViewController>(identifier: "TaskController")
      
      func announce(_: Void = ()) -> UIKit.UINavigationController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: announce)
      }
      
      func announceController(_: Void = ()) -> AnnounceViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: announceController)
      }
      
      func event(_: Void = ()) -> UIKit.UINavigationController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: event)
      }
      
      func eventController(_: Void = ()) -> EventViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: eventController)
      }
      
      func mainTabBar(_: Void = ()) -> UIKit.UITabBarController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: mainTabBar)
      }
      
      func task(_: Void = ()) -> UIKit.UINavigationController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: task)
      }
      
      func taskController(_: Void = ()) -> TaskViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: taskController)
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "announce") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'announce' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "event") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'event' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "add") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'add' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "task") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'task' is used in storyboard 'Main', but couldn't be loaded.") }
        if _R.storyboard.main().announce() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'announce' could not be loaded from storyboard 'Main' as 'UIKit.UINavigationController'.") }
        if _R.storyboard.main().mainTabBar() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'mainTabBar' could not be loaded from storyboard 'Main' as 'UIKit.UITabBarController'.") }
        if _R.storyboard.main().announceController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'announceController' could not be loaded from storyboard 'Main' as 'AnnounceViewController'.") }
        if _R.storyboard.main().event() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'event' could not be loaded from storyboard 'Main' as 'UIKit.UINavigationController'.") }
        if _R.storyboard.main().eventController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'eventController' could not be loaded from storyboard 'Main' as 'EventViewController'.") }
        if _R.storyboard.main().task() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'task' could not be loaded from storyboard 'Main' as 'UIKit.UINavigationController'.") }
        if _R.storyboard.main().taskController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'taskController' could not be loaded from storyboard 'Main' as 'TaskViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct newEvent: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "NewEvent"
      
      static func validate() throws {
        if UIKit.UIImage(named: "send") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'send' is used in storyboard 'NewEvent', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
