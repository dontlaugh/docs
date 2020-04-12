+++
title = "Writing and Releasing Code"
+++

Over the years I've collected some guidelines that help teams (myself included)
keep code quality high. This is the kind of stuff you might put in a 
**CONTRIBUTING.md** document.

## Tests

Code should be submitted with a reasonable suite of tests, and code should be 
designed with testability in mind.

## Commit Messages

Commit messages should explain **why** code is changing, configuration is added,
or new types or packages are introduced. Prefer a declarative style, like 

_Pass a dictionary to reduce the number of parameters_

## Code Review

All code needs code review and at least one "thumbs up" from a colleague. After
the thumbs up **the person who submitted the merge/pull request should click
the merge button**. Always choose "delete branch" when merging to keep the 
number of old branches low on the server.

If an implementation is tricky, document your design and hop on a call with a 
colleague.

If code requires special local testing, provide a test plan in a PR comment (not 
the commit message or merge request description). Step by step instructions or
a script are ideal.

Overall, you should strive to make reviewing efficient for your colleagues.

## Merge Frequently

Merge frequently. Deploy to "lower" environments (qa/stage) frequently. 
Integrate with your colleages' work frequently.

## Changelog

The changelog is a valuable resource. It is maintained in **CHANGELOG.md**. Most
MRs should include edits to the changelog to describe bug fixes, API changes,
or new features added.

When submitting an MR, document your changes under one or more of the following 
section headers in the `Unreleased` section.

* `Added` for new features.
* `Changed` for changes in existing functionality.
* `Deprecated` for soon-to-be removed features.
* `Removed` for now removed features.
* `Fixed` for any bug fixes. Add a link to any relevant Clubhouse issues.
* `Security` in case of vulnerabilities. Add a link to CVEs or public announcements.

When we're ready to cut a release, change the `Unreleased` header to the next
appropriate version, and tidy up the contents that have been added since the
previous release.

Our changelog style is adapted from [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## Style Guide

Functions should take as few parameters as possible. If many parameters are 
required, consider introducing a new type that logically groups the data.

Large blocks of commented out code should not be checked in.

Avoid the use of global variables. Prefer a dependency injection style that
uses a mix of interfaces and concrete types.

## Sprints and Milestones

All work should be documented in issues and collected into a sprint.
Sprints map to two-week periods of time. At the beginning of a sprint, we discuss
work we want to do and make sure all of it is documented in issues. Bugs and hot
fixes can be added to the middle of the sprint, but not without discussion.

## Releases and Tagging

Only versioned releases go to production. Every versioned release is listed in
the changelog.

To create a release, do the following:

1. Pick a version number for the release. Our example below is **0.1.0**
2. Change the latest `Unreleased` header in CHANGELOG.md to a versioned release.
   The new header will contains the version and the release date. It will look 
   something like this:

   ```
   ## [0.1.0] - 2017-06-20
   ```

3. MR that update to CHANGELOG.md to **master** branch. This MR represents
   the commit we will tag. 
4. When the MR of changes is accepted, **one team member** does the following
   from the command line:

   ```
   git fetch origin
   git checkout master
   git tag -a 0.1.0 -m 'version 0.1.0'
   git push origin --tags
   ```

A CI workflow that runs on tag pushes should kick off and build your
deployment artifact. That CI workflow should use a regular expression to 
ensure that your tag has a well-formed name.

If you ever need to delete a tag (maybe you made a typo), you can do this:

```
git tag -d 1.0.4
git push origin :refs/tags/1.0.4
```

