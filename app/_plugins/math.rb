module Tags
    class Math < Liquid::Block
        def initialize(tag_name, image_path, tokens)
            super
            @image_path = image_path
        end
        
        def render(context)
            '<div class="math">$$' + super + '$$</div>'
        end
    end
end

Liquid::Template.register_tag("math", Tags::Math)