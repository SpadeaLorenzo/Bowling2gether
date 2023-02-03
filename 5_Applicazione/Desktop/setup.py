from setuptools import setup

#run "python setup.py build_apps" for build the application
setup(
    name='Bowling2gether',
    options={
        'build_apps': {
            # Build asteroids.exe as a GUI application
            'gui_apps': {
                'Bowling2gether': 'Bowling2gether.py',
            },

            # Set up output logging, important for GUI apps!
            'log_filename': '$USER_APPDATA/Bowling2gether/output.log',
            'log_append': False,

            # Specify which files are included with the distribution
            'include_patterns': [
                '**/*.png',
                '**/*.jpg',
                '**/*.egg',
                '**/*.ttf',
                '**/*.tiff',
            ],

            # Include the OpenGL renderer and OpenAL audio plug-in
            'plugins': [
                'pandagl',
                'p3openal_audio',
            ],
        }
    }
)