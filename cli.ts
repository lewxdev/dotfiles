import { $ } from "bun";
import { program } from "commander";

import packageJson from "@/package.json";

const LOCAL_PATH = "~/projects/dotfiles";
const REMOTE_PATH = packageJson.repository.url;

program
	.name("dotfiles")
	.description(`a CLI to manage ${packageJson.description}`)
	.version(packageJson.version);

program
	.command("install")
	.description("run the configurable installation script")
	.action(async () => {
		try {
			// check if local repository exists
			await $`test -d ${LOCAL_PATH}`;
		} catch {
			// create if local repository is missing
			await $`git clone ${REMOTE_PATH} ${LOCAL_PATH}`;
		}
	});

await program.parseAsync();
