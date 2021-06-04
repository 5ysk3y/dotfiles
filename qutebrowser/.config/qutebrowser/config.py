import dracula.draw

# Load existing settings made via :set
config.load_autoconfig(True)

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

c.fonts.default_family = ["Terminus"]
c.fonts.default_size = '9pt'
c.backend = 'webengine'
