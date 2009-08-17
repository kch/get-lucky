require 'yaml'

module Shortcuts
  extend self

  def self.cached m, &b
    @cache ||= {}
    define_method(m) { |*args| @cache[m] ||= b.call *args }
  end

  cached(:yml_string)    { IO.read('shortcuts.yml')                                                               }
  cached(:original_hash) { YAML::load yml_string                                                                  }
  cached(:hash)          { original_hash.inject({}) { |h, (ks, url)| ks.scan(/\w+/).each { |k| h[k] = url }; h }  }

  def [] k
    hash[k]
  end

  def to_hostnames_s(hostname = "go")
    hash.keys.uniq.sort.inject("#{hostname}") { |acc, k| acc << " #{k}.#{hostname}" }
  end
end
