#| flags-dest: flags.yml
#| echo: false

# dput(commandArgs())

# TODO: Warning in readLines(file, warn = readLines.warn) :
# incomplete final line found on 'flags.yml'

flags <- yaml::read_yaml("flags.yml", readLines.warn = FALSE)
cat(yaml::as.yaml(flags))
