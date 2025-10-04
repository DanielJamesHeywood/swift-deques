
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
        internal init(minimumCapacity: Int) {
            let capacity = min(minimumCapacity, 1)
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
    
    internal typealias Index = Int
    
    @inlinable
    internal var startIndex: Int {
        return _offset
    }
    
    @inlinable
    internal var endIndex: Int {
        return _offset + _count
    }
    
    internal typealias Indices = Range<Int>
    
    @inlinable
    internal var indices: Range<Int> {
        return startIndex..<endIndex
    }
    
    @inlinable
    internal subscript(position: Int) -> Element {
        precondition(indices.contains(position))
        return _unsafeMutablePointerToElements[position % _capacity]
    }
}
