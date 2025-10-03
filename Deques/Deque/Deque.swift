
@frozen
public struct Deque<Element> {
    
    @usableFromInline
    internal var _storage: _Storage
    
    @inlinable
    public init() {
        _storage = _Storage()
    }
}
