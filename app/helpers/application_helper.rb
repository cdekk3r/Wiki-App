module ApplicationHelper
    def markdown(text)
        extensions = { 
            fenced_code_blocks: true,
            autolink: true,
            disable_indented_code_blocks: true,
            space_after_headers: true,
            underline: true,
            highlight: true, 
            quote: true,
        }
        
        options = { hard_wrap: true }
        
        renderer = Redcarpet::Render::HTML.new(options)
        markdown = Redcarpet::Markdown.new(renderer, extensions)
        
        markdown.render(text).html_safe
    end
end
