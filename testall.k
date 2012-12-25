#!/usr/local/bin/minikonoha

import("dshell");
import("konoha.foreach");

String[] getDirectories() {
	return $(ls -F | grep /).trim().split("\n");
}

void main() {
	String[] dirs = getDirectories();
	for(String dir in dirs) {
		System.p(dir);
	}
}

main();
