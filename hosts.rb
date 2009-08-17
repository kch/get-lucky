require 'shortcuts'

module Hosts
  extend self
  PATH = '/etc/hosts'
  HOST = 'go'
  SIG  = '# <<< Added by Get Lucky; Do not touch.'

  def lucky_hosts_line
    "127.0.0.1       #{Shortcuts.to_hostnames_s(HOST)}  #{SIG}\n"
  end

  def string
    IO.read(PATH)
  end

  def lines(clear = false)
    return string.lines unless clear
    lines.reject { |line| line.include? SIG }
  end

  def spiced
    lines = lines(:clear)
    lines.last =~ /\n\z/ or lines.last << "\n"
    lines << lucky_hosts_line
  end

  def outdated?
    ! string.include? lucky_hosts_line
  end

  def write
    write! if outdated?
  end

  def write!
    # run this before #open, so #string can read it before the file is opened for writing
    s = spiced.to_s
    open(PATH, 'w') { |f| f.write s }
  end

  def writable?
    File.writable? PATH
  end

end
