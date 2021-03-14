easypass_sources = [
  'main.vala',
  'crypto.vala',
  'window.vala',
]

easypass_deps = [
  dependency('gee-0.8'),
    dependency ('gtk4', version: '>= 4.0.0'),
    dependency('gio-2.0', version: '>= 2.50'),
    declare_dependency (dependencies: [
        meson.get_compiler ('c').find_library ('libgcrypt'),
        meson.get_compiler ('vala').find_library ('gcrypt', dirs: join_paths (meson.current_source_dir (), 'vapi'))
    ])
]

gnome = import('gnome')

easypass_sources += gnome.compile_resources('easypass-resources',
  'easypass.gresource.xml',
  c_name: 'easypass'
)

executable('easypass', easypass_sources,
  vala_args: '--target-glib=2.50',  dependencies: easypass_deps,
  install: true,
)
