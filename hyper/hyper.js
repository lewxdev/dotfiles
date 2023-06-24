// DEST:~/.hyper.js

// @ts-check
// Configuration flags: https://hyper.is/#cfg

/** @type {Config} */
module.exports = {
  config: {
    backgroundColor: "#181a1ff0",
    bell: false,
    borderColor: "#353944",
    // source: https://hyper.is/store/hyper-one-dark/source?index.js
    colors: {
      black: "#000000",
      red: "#e06c75",
      green: "#98c379",
      yellow: "#d19a66",
      blue: "#56b6c2",
      magenta: "#c678dd",
      cyan: "#56b6c2",
      white: "#d0d0d0",
      lightBlack: "#808080",
      lightRed: "#e06c75",
      lightGreen: "#98c379",
      lightYellow: "#d19a66",
      lightBlue: "#56b6c2",
      lightMagenta: "#c678dd",
      lightCyan: "#56b6c2"
    },
    copyOnSelect: false,
    css: `
        .line {
          justify-content: center;
          padding: 1.5em 0;
          font-weight: 100;
        }
        `,
    cursorAccentColor: "#000000",
    cursorBlink: true,
    cursorColor: "#ffffffff",
    cursorShape: "BLOCK",
    defaultSSHApp: true,
    env: {},
    fontFamily: "'PowerlineSymbols', 'ProFontIIx', monospace",
    fontSize: 16,
    fontWeight: "normal",
    fontWeightBold: "bold",
    foregroundColor: "#ffffff",
    letterSpacing: 0,
    lineHeight: 1,
    macOptionSelectionMode: "vertical",
    padding: "16px",
    preserveCWD: true,
    quickEdit: false,
    scrollback: 5000,
    selectionColor: "#ffffff40",
    shell: "/bin/zsh",
    shellArgs: ["--login"],
    termCSS: "",
    uiFontFamily: "-apple-system, BlinkMacSystemFont, Segoe UI, Roboto",
    updateChannel: "stable",
    webGLRenderer: false,
    windowSize: [1200, 700],

    hyperline: {
      // Add plugins in display order (from left to right)
      plugins: [
        "spotify",
        "hostname",
        "ip",
        "network",
        "memory",
        "Uptime",
        "cpu",
        "battery"
      ]
    }
  },

  plugins: [],

  localPlugins: [],

  keymaps: {}
};

/**
 * @typedef Config
 * @property {ConfigOptions=} config
 *
 * @property {string[]=} plugins
 * a list of plugins to fetch and install from npm
 *
 * format: `"[@org/]project[#version]"`
 *
 * examples:
 * - `"hyperpower"`
 * - `"@company/project"`
 * - `"project#1.0.1"`
 *
 * @property {string[]=} localPlugins
 * in development, you can create a directory under `plugins/local/` and include
 * it here to load it and avoid it being `npm install`ed
 *
 * @see {@link https://github.com/vercel/hyper/blob/master/app/keymaps/linux.json}
 * @property {Record<string, string | string[]>=} keymaps
 * example:
 * - "window:devtools": "cmd+alt+o",
 */

/**
 * @see {@link https://github.com/vercel/hyper/blob/canary/lib/config.d.ts#L22}
 * @typedef ConfigOptions
 *
 * @property {boolean | string} autoUpdatePlugins
 * if `true` (default), Hyper will update plugins every 5 hours you can also set
 * it to a custom time e.g. `"1d"` or `"2h"`
 *
 * @property {string} backgroundColor
 * terminal background color (opacity is only supported on macOS)
 *
 * @property {"SOUND" | false} bell
 * Supported Options:
 * - `"SOUND"` enables the bell as a sound
 * - `false` turns off the bell
 *
 * @property {string | null} bellSound
 * base64 encoded string of the sound file to use for the bell if null, the
 * default bell will be used
 *
 * @property {string | null} bellSoundURL
 * An absolute file path to a sound file on the machine.
 *
 * @property {string} borderColor
 * border color (window, tabs)
 *
 * @property {ColorMap} colors
 * the full list. if you're going to provide the full color palette, including
 * the 6 x 6 color cubes and the grayscale map, just provide an array here
 * instead of a color map object
 *
 * @property {boolean} copyOnSelect
 * if `true` selected text will automatically be copied to the clipboard
 *
 * @property {string} css
 * custom CSS to embed in the main window
 *
 * @property {string} cursorAccentColor
 * terminal text color under BLOCK cursor
 *
 * @property {boolean} cursorBlink
 * set to `true` for blinking cursor
 *
 * @property {string} cursorColor
 * terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
 *
 * @property {"BEAM" | "UNDERLINE" | "BLOCK"} cursorShape
 * `"BEAM"` for |, `"UNDERLINE"` for _, `"BLOCK"` for █
 *
 * @property {boolean} defaultSSHApp
 * if `true` hyper will be set as the default protocol client for SSH
 *
 * @property {boolean} disableAutoUpdates
 * if `true` hyper will not check for updates
 *
 * @property {boolean} disableLigatures
 * if `false` Hyper will use ligatures provided by some fonts
 *
 * @property {Record<string, string>} env
 * for environment variables
 *
 * @property {string} fontFamily
 * font family with optional fallbacks
 *
 * @property {number} fontSize
 * default font size in pixels for all tabs
 *
 * @property {FontWeight} fontWeight
 * default font weight eg: `"normal"`, `"400"`, `"bold"`
 *
 * @property {FontWeight} fontWeightBold
 * font weight for bold characters eg: `"normal"`, `"600"`, `"bold"`
 *
 * @property {string} foregroundColor
 * color of the text
 *
 * @property {boolean} imageSupport
 * Whether to enable Sixel and iTerm2 inline image protocol support or not.
 *
 * @property {number} letterSpacing
 * letter spacing as a relative unit
 *
 * @property {number} lineHeight
 * line height as a relative unit
 *
 * @property {string} macOptionSelectionMode
 * choose either `"vertical"`, if you want the column mode when Option key is
 * hold during selection (default) or `"force"`, if you want to force selection
 * regardless of whether the terminal is in mouse events mode (inside tmux or
 * vim with mouse mode enabled for example).
 *
 * @property {{ altIsMeta: boolean, cmdIsMeta: boolean }=} modifierKeys
 *
 * @property {string} padding
 * custom padding (CSS format, i.e.: `top right bottom left` or `top horizontal
 * bottom` or `vertical horizontal` or `all`)
 *
 * @property {boolean} preserveCWD
 * set to true to preserve working directory when creating splits or tabs
 *
 * @property {boolean} quickEdit
 * if `true` on right click selected text will be copied or pasted if no
 * selection is present (`true` by default on Windows and disables the context
 * menu feature)
 *
 * @property {boolean} screenReaderMode
 * set to true to enable screen reading apps (like NVDA) to read the contents of
 * the terminal
 *
 * @property {number} scrollback
 *
 * @property {string} selectionColor
 * terminal selection color
 *
 * @property {string} shell
 * the shell to run when spawning a new session (e.g. /usr/local/bin/fish)
 * if left empty, your system's login shell will be used by default
 *
 * Windows
 * - Make sure to use a full path if the binary name doesn't work
 * - Remove `--login` in shellArgs
 *
 * Windows Subsystem for Linux (WSL) - previously Bash on Windows
 * - Example: `C:\\Windows\\System32\\wsl.exe`
 *
 * Git-bash on Windows
 * - Example: `C:\\Program Files\\Git\\bin\\bash.exe`
 *
 * PowerShell on Windows
 * - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
 *
 * Cygwin
 * - Example: `C:\\cygwin64\\bin\\bash.exe`
 *
 * Git Bash
 * - Example: `C:\\Program Files\\Git\\git-cmd.exe`
 * Then Add `--command=usr/bin/bash.exe` to shellArgs
 *
 * @property {string[]} shellArgs
 * for setting shell arguments (e.g. for using interactive shellArgs: `["-i"]`)
 * by default `["--login"]` will be used
 *
 * @property {boolean | ""} showHamburgerMenu
 * if you're using a Linux setup which show native menus, set to `false`
 *
 * default: `true` on Linux, `true` on Windows, ignored on macOS
 *
 * @property {boolean | "left" | ""} showWindowControls
 * set to `false` if you want to hide the minimize, maximize and close buttons
 *
 * additionally, set to `"left"` if you want them on the left, like in Ubuntu
 *
 * default: `true` on Windows and Linux, ignored on macOS
 *
 * @property {string} termCSS
 * custom CSS to embed in the terminal window
 *
 * @property {string=} uiFontFamily
 *
 * @property {"stable" | "canary"} updateChannel
 * choose either `"stable"` for receiving highly polished, or `"canary"` for
 * less polished but more frequent updates
 *
 * @property {boolean=} useConpty
 *
 * @property {boolean} webGLRenderer
 * Whether to use the WebGL renderer. Set it to false to use canvas-based
 * rendering (slower, but supports transparent backgrounds)
 *
 * @property {"ctrl" | "alt" | "meta" | "shift" | ""} webLinksActivationKey
 * keypress required for weblink activation: [ctrl | alt | meta | shift]
 *
 * @property {[number, number]=} windowSize
 * Initial window size in pixels
 *
 * @property {string} workingDirectory
 * set custom startup directory (must be an absolute path)
 */

/**
 * @see {@link https://github.com/vercel/hyper/blob/canary/lib/config.d.ts#L3}
 * @typedef ColorMap
 * @property {string} black
 * @property {string} blue
 * @property {string} cyan
 * @property {string} green
 * @property {string} lightBlack
 * @property {string} lightBlue
 * @property {string} lightCyan
 * @property {string} lightGreen
 * @property {string} lightMagenta
 * @property {string} lightRed
 * @property {string} lightWhite
 * @property {string} lightYellow
 * @property {string} magenta
 * @property {string} red
 * @property {string} white
 * @property {string} yellow
 */

/**
 * @see {@link https://github.com/xtermjs/xterm.js/blob/master/typings/xterm.d.ts#L16}
 * @typedef {"normal" | "bold" | "100" | "200" | "300" | "400" | "500" | "600" | "700" | "800" | "900" | number} FontWeight
 */
