
extension Deque.Iterator: IteratorProtocol {
    
    @inlinable
    public mutating func next() -> Element? {
        guard _nextIndex != _baseStorage.endIndex else {
            return nil
        }
        defer {
            _nextIndex += 1
        }
        return _baseStorage[_nextIndex]
    }
}
