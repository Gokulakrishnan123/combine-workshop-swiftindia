# SwiftIndia Combine Workshop –– 08 Feb 2020

## Agenda
### Session 1: Quick intro to Combine, part 1
- What is Combine
- Building blocks of Combine
- What is a Publisher
- Different types of Publishers supported by Combine
- What is a Subscriber
- Different types of Subscribers supported by Combine
- Lifecycle of publishers & subscribers 
- How to cancel a subscription

### Session 2: Quick intro to Combine, part 2

- What is an Operator
- Different types of Operators supported by Combine

### Session 3: How to make custom publishers & subscribers?
- Publisher is a protocol
- Wrapping UserDefaults into a publisher
- Subscriber is a protocol
- Wrapping UserDefaults into a subscriber

### Session 4: Combine meets UIKit
- Add TapPublisher in UIButton (UIControl in general)
- Convert UIScrollViewDelegate into a Combine like API

### Session 5: Error handling in Combine
- What is Error in Combine
- How to model custom Error
- How does Error flow
- How to react to errors
- What is Fail publisher and how to use it
- What are the operators used to transform and handle errors (Catch, TryCatch, MapError, ReplaceError, SetFailureType)

### Session 6: Networking using Combine
- Networking without Combine
- Networkin with Combine
- What is DataTaskPublisher
- How to make an API request 
- How to handle response from server
- How to parse success response
- How to validate response to handle error
- How to parse and handle error

### Session 7: Handling multiple async tasks using Combine
- Handling multiple async tasks without Combine (GCD & OperationQueue)
- Combine operators that enable handling multiple async tasks
- Merge
- Zip
- CombineLatest
- Debounce

### Session 8: Handling threads using Combine
- Threading without Combine
- Threading with Combine
- SubscribeOn operator
- ReceiveOn operator

## Session 1: Quick intro to Combine, part 1
- **What is Combine**
	- The Combine framework provides a declarative Swift API for processing values over time. These values can represent many kinds of asynchronous events. 
	- Combine declares publishers to expose values that can change over time, and subscribers to receive those values from the publishers.
	- Customize handling of asynchronous events by combining event-processing operators.
	
	
- **Building blocks of Combine**
	- Publisher
	- Subscriber
	- Operator
	
![](./readme-assets/1.png)


- **What is a Publisher**
	- Declares that a type can transmit a sequence of values over time.
	- Source of values


- **Different types of Publishers supported by Combine**
	- Just
	- Fail
	- Future
	- Deferred
	- DataTaskPublisher
	- NotificationCenter.Publisher
	- NSObject.KeyValueObservingPublisher
	- @Published
	- PassthroughSubject
	- CurrentValueSubject
	- AnyPublisher
	- many more...
	
	
- **What is a Subscriber**
	- A Subscriber instance receives a stream of elements from a Publisher, *along with life cycle events describing changes to their relationship.*
	- Consumer of values


- **Different types of framework supported Subscribers**
	- Sink
	- Assign
	- AnySubscriber


- **Lifecycle of publishers & subscribers**

![](./readme-assets/2.png)

- **How to cancel a subscription**
	- Cancellable
	- AnyCancellable


## Session 2: Quick intro to Combine, part 2

- **What is an Operator**
	- Operators are those publishers which can't generate value on their own but rather transform the value provided by a source publisher or a previous operator
	- They are used between a publisher and a subscriber
	- Roughly 3 kinds of operators
		- ones which modify the values
		- ones which modify the thread
		- ones which modify the stream itself


- **Different types of Operators supported by Combine**
	- Map
	- FlatMap
	- Filter
	- Catch
	- MapError
	- Merge
	- Zip


## Session 3: How to make custom publishers & subscribers?
- **Publisher is a protocol**

```swift
public protocol Publisher {

    /// The kind of values published by this publisher.
    associatedtype Output

    /// The kind of errors this publisher might publish.
    associatedtype Failure : Error

    /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
    func receive<S>(subscriber: S) where S : Subscriber, Self.Failure == S.Failure, Self.Output == S.Input
}

// Self.Failure == S.Failure, Self.Output == S.Input
```

- **Wrapping UserDefaults into a publisher**


- **Subscriber is a protocol**

```swift
public protocol Subscriber : CustomCombineIdentifierConvertible {

    /// The kind of values this subscriber receives.
    associatedtype Input

    /// The kind of errors this subscriber might receive.
    associatedtype Failure : Error

    /// Tells the subscriber that it has successfully subscribed to the publisher and may request items.
    /// Use the received `Subscription` to request items from the publisher.
    func receive(subscription: Subscription)

    /// Tells the subscriber that the publisher has produced an element.
    func receive(_ input: Self.Input) -> Subscribers.Demand

    /// Tells the subscriber that the publisher has completed publishing, either normally or with an error.
    func receive(completion: Subscribers.Completion<Self.Failure>)
}
```

- **Wrapping UserDefaults into a subscriber**


## Session 4: Combine meets UIKit

- **Complete UIControl.Publisher**

- **Convert UITableView's scrollViewDidScroll method into a Publisher**

## Session 5: Error handling in Combine

- **What is Error in Combine**
	- Error is part of `Publisher` & `Subscriber` both
	- Any subscription can terminate in two ways, either via `.finished` or `.failure(Error)`
	- `.failure(Error)` is used to send errors
	- Just like value, we can also transform and observe errors


```swift
public protocol Publisher {

    /// The kind of errors this publisher might publish.
    /// Use `Never` if this `Publisher` does not publish errors.
    associatedtype Failure : Error
    ...
}

public protocol Subscriber {

    /// The kind of errors this subscriber might receive.
    /// Use `Never` if this `Subscriber` cannot receive errors.
    associatedtype Failure : Error
    ...
}

extension Subscribers {
    /// - finished: The publisher finished normally.
    /// - failure: The publisher stopped publishing due to the indicated error.
    public enum Completion<Failure> where Failure : Error {
	
        case finished
        case failure(Failure)
    }
}
```

- **How to model custom Error**


- **How does Error flow**


- **How to react to errors**


- **A note about Never**

```swift
/// Use `Never` as the return type when declaring a closure, function, or
/// method that unconditionally throws an error, traps, or otherwise does
/// not terminate.
///
///     func crashAndBurn() -> Never {
///         fatalError("Something very, very bad happened")
///     }

public enum Never {}
```

## Session 6: Networking using Combine
- **Networking without Combine**
- **Networkin with Combine**
- **What is DataTaskPublisher**
- **How to make an API request**
- **How to handle response from server**
- **How to parse success response**
- **How to validate response to handle error**
- **How to parse and handle error**

## Session 7: Handling multiple async tasks using Combine
- **Handling multiple async tasks without Combine (GCD & OperationQueue)**
- **Combine operators that enable handling multiple async tasks**
	- **Merge**
	- **Zip**
	- **CombineLatest**
	- **Debounce**

## Session 8: Handling threads using Combine
- **Threading without Combine**
- **Threading with Combine**
- **SubscribeOn operator**
- **ReceiveOn operator**
