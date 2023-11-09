
class << Jekyll::Site
    #public attr_accessor :category

    public def test() 
        puts "works"
    end
end


Jekyll::Hooks.register :site, :pre_render do |site|
    # code to call after Jekyll renders a page

    #site.test()
    #site.category = "okokokoko"
    #puts site.pages
    puts site.posts
  end

