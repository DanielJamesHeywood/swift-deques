
@frozen
public struct Deque<Element> {
    
    @usableFromInline
    internal var _storage: _Storage
    
    @inlinable
    public init(minimumCapacity: Int) {
        _storage = _Storage(capacity: minimumCapacity)
    }
}
