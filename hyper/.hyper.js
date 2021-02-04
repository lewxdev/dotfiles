// DEST: ~/Library/Application\ Support/Hyper/hyper/.hyper.js
// Configuration flags: https://hyper.is/#cfg

module.exports = {
	config: {
		// Hyper
			// The update channel to receive updates from: `"stable"` or `"canary"`.
			updateChannel: "stable",

			// If `true`, Hyper will be set as the default protocol client for SSH
			defaultSSHApp: true,

		// Font/Text
			// The default size in pixels for the terminal
			fontSize: 16,

			// The font family to use for the UI with optional fallbacks
			uiFontFamily: "-apple-system, BlinkMacSystemFont, Segoe UI, Roboto",

			// The font family to use with optional fallbacks
			fontFamily: "'PowerlineSymbols', 'ProFontIIx', monospace",

			// The default font weight: `"normal"` or `"bold"`
			fontWeight: "normal",

			// The font weight for bold characters: `"normal"` or `"bold"`
			fontWeightBold: "bold",

			// Line height as a relative unit
			lineHeight: 1,

			// Letter spacing as a relative unit
			letterSpacing: 0,

		// Text Editing
			// If `true`, selected text will automatically be copied to the clipboard
			copyOnSelect: false,

			// If true, on right click selected text will be copied or pasted if no selection is present
			quickEdit: false,

			// choose either `'vertical'`, if you want the column mode when Option key is hold during selection (Default)
			// or `'force'`, if you want to force selection regardless of whether the terminal is in mouse events mode
			// (inside tmux or vim with mouse mode enabled for example).
			macOptionSelectionMode: "vertical",

		// Cursor
			// The color of the caret in the terminal
			cursorColor: "#ffffffff",

			// The text color under BLOCK cursor
			cursorAccentColor: '#000000',

			// The shape of the caret in the terminal: `"BEAM"`, `"UNDERLINE"`, or `"BLOCK"`
			cursorShape: "BLOCK",

			// If true, cursor will blink
			cursorBlink: true,

		// View/Window
			// The default width/height in pixels of a new window
			windowSize: [1200, 700],

			// Whether to use the WebGL renderer or canvas-based rendering (slower, but supports transparent backgrounds)
			webGLRenderer: false,

			// The number of rows to be persisted in terminal buffer for scrolling
			scrollback: 5000,

		// CSS
			// Custom CSS to include in the main window
			css: "",

			// Custom CSS to include in the terminal window
			termCSS: "",

			// CSS padding values for the space around each term
			padding: "16px",

		// Colors
			// A list of overrides for the color palette.
			// The names of the keys represent the "ANSI 16".
			// Use an array instead of a color map object if providing the full color palette,
			// including the 6 x 6 color cubes and the grayscale map.
			colors: {
				black: '#000000',
				red: '#C51E14',
				green: '#1DC121',
				yellow: '#C7C329',
				blue: '#0A2FC4',
				magenta: '#C839C5',
				cyan: '#20C5C6',
				white: '#C7C7C7',
				lightBlack: '#686868',
				lightRed: '#FD6F6B',
				lightGreen: '#67F86F',
				lightYellow: '#FFFA72',
				lightBlue: '#6A76FB',
				lightMagenta: '#FD7CFC',
				lightCyan: '#68FDFE',
				lightWhite: '#FFFFFF',
			},

			// The color of the main text of the terminal
			foregroundColor: "#ffffff",

			// The color and opacity of the window and main terminal background
			backgroundColor: "#000000ff",

			// The background color/opacity of the text selection in terminal
			selectionColor: "#333333ff",

			// border color (window, tabs)
			borderColor: "#333333",

		// Shell
			// A path to a custom shell to run when Hyper starts a new session
			shell: "/bin/zsh",

			// An array of shell arguments
			shellArgs: ["--login"],

			// An object of environment variables to set before launching shell
			env: {},

		// Sound
			// set to `false` for no bell
			bell: false,

			// URL to custom bell
			// bellSoundURL: "http://example.com/bell.mp3",
	},

	// A list of plugins to fetch and install from npm
	// format: [@org/]project[#version]
	plugins: [],

	// Load indev plugins from `~/.hyper_plugins/local/`
	localPlugins: [],

	keymaps: {
		"window:devtools": "cmd+alt+i"
	},
};
