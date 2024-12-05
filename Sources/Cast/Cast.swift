import Foundation

public func bindingCast<T>(_ raw: UnsafeRawPointer, _ capacity: Int) -> UnsafePointer<T> {
	return raw.bindMemory(to: T.self, capacity: capacity)
}

public func bindingCast<T>(_ raw: UnsafeMutableRawPointer, _ capacity: Int) -> UnsafeMutablePointer<
	T
> {
	return raw.bindMemory(to: T.self, capacity: capacity)
}

public func cast<T>(_ raw: UnsafeRawPointer) -> UnsafePointer<T> {
	return UnsafePointer<T>(OpaquePointer(raw))
}

public func cast<T>(_ raw: UnsafeRawPointer?) -> UnsafePointer<T>? {
	return UnsafePointer<T>(OpaquePointer(raw))
}

public func cast<T>(_ raw: UnsafeMutableRawPointer) -> UnsafeMutablePointer<T> {
	return UnsafeMutablePointer<T>(OpaquePointer(raw))
}

public func cast<T>(_ raw: UnsafeMutableRawPointer?) -> UnsafeMutablePointer<T>? {
	return UnsafeMutablePointer<T>(OpaquePointer(raw))
}

public func cast<T>(_ typed: UnsafeMutablePointer<T>) -> UnsafeMutableRawPointer {
	return UnsafeMutableRawPointer(OpaquePointer(typed))
}

extension Data {
	public func castCopiedBytes<T>() -> T {
		var d: T?
		withUnsafeMutablePointer(to: &d) { (p: UnsafeMutablePointer<T?>) in
			self.copyBytes(to: cast(p)!, count: MemoryLayout<T>.size)
		}
		return d!
	}
}
