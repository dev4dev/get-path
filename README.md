# GetPath

Allow to `cd` to the MacOs Finder Alias/Bookmark in terminal.

# Example

## Build & Install

```shell
swift build -c release
cp .build/release/GetPath /opt/homebrew/bin/cl # or /usr/loca/bin/cl on Intel mac
```

Add function to the shell

```shell
cdl() {
	cd "$(cl $1)"
}
```

Then use `cdl` command to cd to the destination.
