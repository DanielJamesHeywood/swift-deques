
extension Deque {
    
    @frozen
    public struct Iterator {
        
        @usableFromInline
        internal let _baseStorage: _Storage
        
        @usableFromInline
        internal var _nextIndex = 0
        
        @inlinable
        internal init(_base: Deque) {
            _baseStorage = _base._storage
        }
    }
}
