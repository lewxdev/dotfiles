// Generated from https://hyper.is/
// Last Update: 2021-02-04 00:56:37.503237

config = {
	// The update channel to receive updates from
	updateChannel: "stable",

	// The default size in pixels for the terminal
	fontSize: 12,

	// The font family to use with optional fallbacks
	fontFamily: "Menlo, DejaVu Sans Mono, Lucida Console, monospace",

	// The font family to use for the UI with optional fallbacks
	uiFontFamily: "-apple-system, BlinkMacSystemFont, Segoe UI, Roboto, ...",

	// The default font weight: "normal" or "bold"
	fontWeight: "normal",

	// The font weight for bold characters: "normal" or "bold"
	fontWeightBold: "bold",

	// The color of the caret in the terminal
	cursorColor: "rgba(248,28,229,0.8)",

	// The text color under BLOCK cursor
	cursorAccentColor: "#000",

	// The shape of the caret in the terminal. Available options are: 'BEAM', 'UNDERLINE', 'BLOCK'
	cursorShape: "BLOCK",

	// If true, cursor will blink
	cursorBlink: "false",

	// The color of the main text of the terminal
	foregroundColor: "#fff",

	// The color and opacity of the window and main terminal background
	backgroundColor: "#000",

	// The background color/opacity of the text selection in terminal
	selectionColor: "rgba(248,28,229,0.3)",

	// The color of the main window border and tab bar
	borderColor: "#333",

	// Custom CSS to include in the main window
	css: "",

	// CSS padding values for the space around each term
	padding: "12px 14px",

	// A list of overrides for the color palette. The names of the keys represent the "ANSI 16", which can all be seenin the default config.
	colors: {black: "#000000", red: "#ff0000"},

	// A path to a custom shell to run when Hyper starts a new session
	shell: "",

	// An array of shell arguments
	shellArgs: "['--login']",

	// An object of environment variables to set before launching shell
	env: {},

	// The default width/height in pixels of a new window
	windowSize: [540, 380],

	// The number of rows to be persisted in terminal buffer for scrolling
	scrollback: 1000,

	// If true, selected text will automatically be copied to the clipboard
	copyOnSelect: false,

	// If true, on right click selected text will be copied or pasted if no selection is present (true by default on Windows)
	quickEdit: false,

	// If true, Hyper will be set as the default protocol client for SSH
	defaultSSHApp: true,

	// Change the behaviour of modifier keys to act as meta key
	modifierKeys: {altIsMeta: false},

	// Change the visibility of the hamburger menu. Available options are: true, false
	showHamburgerMenu: false,

	// Change the position/visibility of the window controls. Available options are: true, false, "left"
	showWindowControls: ""
}