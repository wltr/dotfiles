import platform
import os.path as p
import subprocess
import ycm_core

DIR_OF_THIS_SCRIPT = p.abspath( p.dirname( __file__ ) )

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]
HEADER_EXTENSIONS = [ '.hpp', '.hxx', '.hh', '.h' ]

flags = [
'-std=c++17',
'-Wall',
'-Wextra',
'-Werror',
'-Wno-long-long',
'-Wno-variadic-macros',
'-fexceptions',
'-DNDEBUG',
'-x',
'c++',
]

def IsHeaderFile( filename ):
  extension = p.splitext( filename )[ 1 ]
  return extension in HEADER_EXTENSIONS

def FindCorrespondingSourceFile( filename ):
  if IsHeaderFile( filename ):
    basename = p.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if p.exists( replacement_file ):
        return replacement_file
  return filename

def Settings( **kwargs ):
  language = kwargs[ 'language' ]
  if language == 'cfamily':
    filename = FindCorrespondingSourceFile( kwargs[ 'filename' ] )
    return {
      'flags': flags,
      'include_paths_relative_to_dir': DIR_OF_THIS_SCRIPT,
      'override_filename': filename
    }
  return {}
