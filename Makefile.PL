use inc::Module::Install;

name     'Unicode-Properties';
all_from 'lib/Unicode/Properties.pm';
author   'Ben Kasmin Bullock <benkasminbullock@gmail.com>';

requires 'Unicode::UCD';
build_requires 'Test::More';

auto_install;

WriteAll;

