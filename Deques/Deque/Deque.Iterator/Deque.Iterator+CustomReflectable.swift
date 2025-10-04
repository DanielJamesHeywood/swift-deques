
extension Deque.Iterator: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: EmptyCollection()) }
}
