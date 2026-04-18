#!/usr/bin/env bash
set -euo pipefail

ruby - <<'RUBY'
require "yaml"

def load_yaml(path)
  YAML.safe_load(File.read(path))
end

def assert_subset(expected, actual, path)
  case expected
  when Hash
    raise "expected #{path.join(".")} to be a map" unless actual.is_a?(Hash)
    expected.each do |key, value|
      raise "missing #{(path + [key]).join(".")}" unless actual.key?(key)
      assert_subset(value, actual[key], path + [key])
    end
  when Array
    raise "expected #{path.join(".")} to be a list" unless actual.is_a?(Array)
    expected.each do |value|
      raise "missing #{value.inspect} in #{path.join(".")}" unless actual.include?(value)
    end
  else
    raise "expected #{path.join(".")} == #{expected.inspect}, got #{actual.inspect}" unless actual == expected
  end
end

prompt_path = "tests/scenarios/checkout-reliability.prompt.md"
expected_path = "tests/scenarios/checkout-reliability.expected.yaml"
actual_path = "tests/scenarios/checkout-reliability.actual.yaml"

prompt = File.read(prompt_path)
raise "prompt does not invoke skill" unless prompt.include?("$reliability-engineering")
raise "prompt does not preserve observability boundary" unless prompt.include?("$observability-engineering")
raise "prompt does not require rollback evidence" unless prompt.include?("rollback path")

expected = load_yaml(expected_path)
actual = load_yaml(actual_path).fetch("artifacts")

expected.fetch("expected_artifacts").each do |artifact|
  raise "missing artifact #{artifact}" unless actual.key?(artifact)
end

assert_subset(expected.fetch("required_contents"), actual, ["artifacts"])

puts "exercise prompt: #{prompt_path}"
puts "expected artifacts: #{expected_path}"
puts "actual artifacts: #{actual_path}"
puts "expected contents satisfied"
puts "exercise validation ok"
RUBY
