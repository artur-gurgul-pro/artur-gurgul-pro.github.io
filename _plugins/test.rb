
# Usage: {{ site.data.tag }}
Jekyll::Hooks.register :site, :pre_render do |site|
    site.data['tag'] = "tagi"
  end
