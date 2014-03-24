require 'haml'
require 'pygments'
require 'sass'
require 'tomparse'

# Load all files
docs = Dir["Asterism/Asterism/AST*.h"].map do |filename|
    file = File.read filename

    blocks = file.scan(/((\/\/.*\n?)+\nASTERISM_OVERLOADABLE.+) \{/).map { |c| c[0] }

    # Parse all tomdoc blocks
    blocks.map do |block|
        signature = block.lines.to_a[-1]
        name = signature.scan(/(AST[\w]+)\(/).flatten[0]
        tomdoc = TomParse.parse(block.lines.to_a[0..-2].join.gsub(/^\/\/?/, ''))

        {
            :name => name,
            :signature => signature,
            :tomdoc => tomdoc,
        }
    end
end

index = Haml::Engine.new(File.read 'index.haml')

puts index.render Object.new, :docs => docs
