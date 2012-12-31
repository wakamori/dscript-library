#!/usr/local/bin/minikonoha

import("dshell");
import("cstyle");

const TEMPLATE = "template.ds";

String getInput(String text) {
	stdout.println();
	stdout.print(text);
	return stdin.readLine();
}

String[] getDirectories() {
	return $(ls -F | grep /).trim().replace("/", "").split("\n");
}

boolean generateFile(String type, String name, String filename) {
	File input = new File(TEMPLATE, "r");
	File output = new File(type + "/" + filename + ".ds", "w");
	output.print(input.readAll().replace("%YourName%", name).replace("%MethodName%", filename));
	return true;
}

void main() {
	String[] types = getDirectories();
	for(int i = 0; i < types.getlength(); i++) {
		stdout.println("[${i}]: ${types[i]}");
	}
	int type = getInput("Enter type of script: ").toint();
	String type = types[type];
	stdout.println("type: " + type);
	String name = getInput("Enter your name: ");
	stdout.println("name: " + name);
	String filename = getInput("Enter file name: ");
	stdout.println("filename: " + filename);
	generateFile(type, name, filename);
	stdout.println("Finished!");
}

main();
