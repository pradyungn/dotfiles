import mountain.draw

# Load existing settings made via :set
config.load_autoconfig()

mountain.draw.konda(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

c.fonts.hints = '9pt Iosevka'
c.fonts.keyhint = '9pt Iosevka'
c.fonts.prompts = '9pt Iosevka'
c.fonts.downloads = '9pt Iosevka'
c.fonts.statusbar = '9pt Iosevka'
c.fonts.contextmenu = '9pt Iosevka'
c.fonts.messages.info = '9pt Iosevka'
c.fonts.debug_console = '9pt Iosevka'
c.fonts.completion.entry = '9pt Iosevka'
c.fonts.completion.category = '9pt Iosevka'
c.url.start_pages = "~/.config/qutebrowser/startpage/index.html"
c.url.default_page = "~/.config/qutebrowser/startpage/index.html"
c.editor.command = ['/usr/bin/nvim', '-f', '{}']

#  config.set("colors.webpage.darkmode.enabled", True)
config.bind(',t',
            'config-cycle content.user_stylesheets ~/.config/qutebrowser/mountain-all-sites.css ""')
