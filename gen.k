#!/usr/local/bin/minikonoha

import("dshell");
import("cstyle");

const TEMPLATE = "template.ds";

String getInput(String text) {
	echo;
	stdout.print("${text}");
	return stdin.readLine();
}

String[] getDirectories() {
	return $(ls -F | grep /).trim().replace("/", "").split("\n");
}

boolean generateFile(String type, String name, String filename) {
	echo "Generating ${type}/${filename}.ds";
	File input = new File(TEMPLATE, "r");
	File output = new File(type + "/" + filename + ".ds", "w");
	output.print(input.readAll().replace("%YourName%", name).replace("%MethodName%", filename));
	return true;
}

void main() {
	String[] types = getDirectories();
	for(int i = 0; i < types.getlength(); i++) {
		echo "[${i}]: ${types[i]}";
	}
	int type = getInput("Enter type of script: ").toint();
	String type = types[type];
	echo "type: ${type}";
	String name = getInput("Enter your name: ");
	echo "name: ${name}";
	String filename = getInput("Enter file name: ");
	echo "filename: ${filename}";
	generateFile(type, name, filename);
	echo "Finished!";
}

main();
