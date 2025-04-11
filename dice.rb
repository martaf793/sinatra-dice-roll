require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
#   "<h1>Let's play</h1>
#   <ul>
#     <li><a href=\"https://turbo-computing-machine-r4j4ppvpv9q25jq-4567.app.github.dev/dice/2/6\" target=\"_blank\">Roll two 6-sided dice</a></li>
#     <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
#   <li><a href=\"/dice/1/20\">Roll one 20-sided dice</a></li>
#   <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
# </ul>
#   "
  erb(:lion)
end 

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this works"
end

get("/dice/2/6") do
  @rolls=[]
  2.times do 
    n1=rand(1..6)
    @rolls.push(n1)
  end
  # n1=rand(1..6)
  # n2=rand(1..6)
  sum=@rolls.sum
  @outcome="You got #{@rolls}, adding #{sum}"
  # "<h1>2d6</h1>
  # <p>#{outcome}</p>"
  erb(:two_six)
end

get("/dice/2/10") do
    @rolls=[]
    2.times do 
      n1=rand(1..10)
      @rolls.push(n1)
    end
    sum=@rolls.sum
    @outcome="You got #{@rolls}, adding #{sum}"
    # "<h1>2d10</h1>
    # <p>#{outcome}<p/>"
    erb(:two_ten)
end

get("/dice/1/20") do
  @die=rand(1..20)
  @outcome="You got #{@die}"
  # "<h1>1d20</h1
  # <p>#{outcome}</p>"
  erb(:one_twenty)
end

get("/dice/5/4") do
  @rolls=[]
  5.times do
    n1=rand(1..4)
    @rolls.push(n1)
  end
  # sum=n1+n2+n3+n4+n5
  # @outcome="You got #{n1}, #{n2}, #{n3}, #{n4} and #{n5}, adding #{sum}"
# "<h1>5d4</h1>
# <p>#{outcome}</p1>"
  erb(:five_four)
end

get("/dice/100/6") do
  @rolls=[]
  100.times do 
    n1=rand(1..6)
    @rolls.push(n1)
  end
  sum=@rolls.sum
  @outcome="You got #{@rolls}, adding #{sum}"
  erb(:one_hundred_six)
end
