module Tags
    class TurtleExample < Liquid::Block
        def initialize(tag_name, image_path, tokens)
            super
            @image_path = image_path.strip
        end
        
        def render(context)
            site      = context.registers[:site]
            converter = site.getConverterImpl(Jekyll::Converters::Markdown)

            lines = super.rstrip.split(/\r\n|\r|\n/).select { |line| line.size > 0 }
            indentation = lines.map do |line|
                match = line.match(/^(\s+)[^\s]+/)
                match ? match[1].size : 0
            end
            indentation = indentation.min

            content = indentation ? super.gsub(/^#{' |\t' * indentation}/, '') : super
            content = converter.convert(content)
            content = content.strip # Strip again to avoid "\n"

            '<div class="row turtle-example"><div class="code col-sm-8"><h3>Code</h3>' + content + '</div><div class="output col-sm-4"><h3>Expected Output</h3><p><img class="img-responsive" src="/_assets/media/turtle-examples/' + @image_path + '.png" /></p></div></div>'
        end
    end
end

Liquid::Template.register_tag("turtle", Tags::TurtleExample)