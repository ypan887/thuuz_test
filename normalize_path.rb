#!/usr/bin/env ruby

# normalize dot by rejecting any dir with only .
def remove_dot_from_path(path)
  path.strip.split('/').reject { |dir| dir == '.' }
end

## normalize double dots
## double dots at the start of path should not be changed
## double dots at the middle of path will remove a parent dir
def remove_double_dots_from_path(path_array)
  while i = path_array.index('..')
    if i == 0
      path_array.shift
    else 
      path_array.delete_at(i-1)      
      path_array.delete_at(i-1)
    end
  end
end

def normalize(path)
  path_array = remove_dot_from_path(path)
  cleaned_path = remove_double_dots_from_path(path_array)
  cleaned_path.join('/')
end

def normalize_path
  puts 'Please enter a path:'
  input = $stdin.readline.strip
  puts normalize(input)
end

normalize_path