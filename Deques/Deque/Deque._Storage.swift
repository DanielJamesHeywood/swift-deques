
extension Deque {
    
    @usableFromInline
    internal final class _Storage {
        
        @usableFromInline
        internal var _capacity: Int
        
        @usableFromInline
        internal var _offset = 0
        
        @usableFromInline
        internal var _count = 0
        
        @usableFromInline
        internal var _unsafeMutablePointerToElements: UnsafeMutablePointer<Element>
        
        @usableFromInline
        internal init(capacity: Int) {
            _capacity = capacity
            _unsafeMutablePointerToElements = .allocate(capacity: capacity)
        }
        
        deinit {
            if _offset + _count <= _capacity {
                _unsafeMutablePointerToElements.advanced(by: _offset).deinitialize(count: _count)
            } else {
                let firstCount = _capacity - _offset
                _unsafeMutablePointerToElements.advanced(by: _offset).deinitialize(count: firstCount)
                _unsafeMutablePointerToElements.deinitialize(count: _count - firstCount)
            }
            _unsafeMutablePointerToElements.deallocate()
        }
    }
}

extension Deque._Storage {
    
    @inlinable
    internal var count: Int {
        return _count
    }
}
