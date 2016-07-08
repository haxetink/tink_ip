package tink.ip;

abstract IpAddress(String) from String to String {
	
}

enum IpVersion {
	V4;
	V6;
}