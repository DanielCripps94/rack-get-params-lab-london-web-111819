class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif req.path.match(/cart/)
      if @@cart.empty?
        resp.write "Your cart is empty"
      else
        @@cart.each do |item|
          resp.write "#{item}\n"
        end
      end
    elsif req.path.match(/add/)
      item_to_add = req.params["item"]
      if @@items.include? item_to_add 
        @@cart << item_to_add
        resp.write "added #{item_to_add}"
      else
        resp.write "We don't have that item!"
      end
    else
      resp.write "Path Not Found"
    end
