#!/usr/bin/env bun
import { Command } from "commander";

const program = new Command();

program
  .name("verdict")
  .description("A 3-model open-source jury that judges PRs and diffs before merge")
  .version("0.1.0")
  .option("-p, --pr <url>", "GitHub Pull Request URL to judge")
  .option("-f, --fix", "Generate auto-repair patches for identified bugs")
  .action(async (options) => {
    console.log("⚖️  Verdict — Open Source PR Jury");
    console.log("---------------------------------");
    if (options.pr) {
      console.log(`Evaluating PR: ${options.pr}`);
    } else {
      console.log("Evaluating local staged git diff...");
    }
  });

program.parse(process.argv);
