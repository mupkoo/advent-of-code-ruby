guard :rspec, cmd: 'rspec', spec_paths: %w[spec 2023] do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^20.*/.+_spec\.rb$})
  watch(%r{^(20.*)/solution\.rb$}) { |m| "#{m[1]}/solution_spec.rb" }
end
