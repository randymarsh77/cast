import Foundation

public func BindingCast<T>(_ raw: UnsafeRawPointer, _ capacity: Int) -> UnsafePointer<T> {
	return raw.bindMemory(to: T.self, capacity: capacity)
}

public func BindingCast<T>(_ raw: UnsafeMutableRawPointer, _ capacity: Int) -> UnsafeMutablePointer<T> {
	return raw.bindMemory(to: T.self, capacity: capacity)
}

public func Cast<T>(_ raw: UnsafeRawPointer) -> UnsafePointer<T> {
	return UnsafePointer<T>(OpaquePointer(raw))
}

public func Cast<T>(_ raw: UnsafeRawPointer?) -> UnsafePointer<T>? {
	return UnsafePointer<T>(OpaquePointer(raw))
}

public func Cast<T>(_ raw: UnsafeMutableRawPointer) -> UnsafeMutablePointer<T> {
	return UnsafeMutablePointer<T>(OpaquePointer(raw))
}

public func Cast<T>(_ raw: UnsafeMutableRawPointer?) -> UnsafeMutablePointer<T>? {
	return UnsafeMutablePointer<T>(OpaquePointer(raw))
}

public func Cast<T>(_ typed: UnsafeMutablePointer<T>) -> UnsafeMutableRawPointer {
	return UnsafeMutableRawPointer(OpaquePointer(typed))
}

public extension Data
{
	public func CastCopiedBytes<T>() -> T {

		var d: T? = nil
		withUnsafeMutablePointer(to: &d) { (p: UnsafeMutablePointer<T?>) in
			self.copyBytes(to: Cast(p)!, count: MemoryLayout<T>.size)
		}
		return d!
	}
}
