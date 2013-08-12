###
  あかんやつ
###
fizzbuzz1 = (l)->
  p = $('#fb1 p')
  for i in [1..l]
    if i % 15 is 0
      p.append 'fizzbuzz'
    else
      if i % 3 is 0
        p.append 'fizz'
      else if i % 5 is 0
        p.append 'buzz'
      else
        p.append i
    p.append '<br>'
###
  以前Javaで書いたやつと同じ流れで書くと…
###

fizzbuzz2 = (l) ->
  p= $('#fb2 p')
  for i in [1..l]
    if i % 3 is 0
      p.append 'fizz'
    if i % 5 is 0
      p.append 'buzz'
    else if i % 3 isnt 0
      p.append i
    p.append '<br>'

###
  Coffeeぽく書くと…
###
fizzbuzz3 = (l)->
  p = $('#fb3 p')
  for i in [1..l]
    a = []
    a.push 'fizz' if i % 3 is 0
    a.push 'buzz' if i % 5 is 0
    a.push i if a.length is 0
    a.push '<br>'
    p.append a.join ''

###
  appendは一回
###
fizzbuzz4 = (l)->
  a = []
  for i in [1..l]
    a.push 'fizz' if i % 3 < 1
    a.push 'buzz' if i % 5 < 1
    a.push i if i % 3 > 0 && i % 5 > 0
    a.push '<br>'
  $('#fb4 p').append a.join ''

###
  .map()で手を抜いてみる
###
fizzbuzz5 = (l)->
  a = [1..l]
  $('#fb5 p').append a.map((i)->
    _i =  if i % 3 < 1 then 'fizz' else ''
    _i += if i % 5 < 1 then 'buzz' else if i % 3 < 1 then '' else i
  ).join '<br>'

###
  例えばswitch
###
fizzbuzz6 = (l)->
  a =[]
  for i in [1..l]
    switch i % 15
      when 0 then a.push 'fizzbuzz'
      when 3 or 6 or 9 then a.push 'fizz'
      when 5 or 10 then a.push 'buzz'
      else a.push i
  $('#fb6 p').append a.join '<br>'

###
  原始的だけど、処理的には最短のはず…
###
fizzbuzz7 = (l)->
  a = [1..l]
  $('#fb7 p').append a.map((i)->
    if i % 3 < 1
      if i % 5 < 1
        return 'fizzbuzz'
      else
        return 'fizz'
    else if i % 5 < 1
      return 'buzz'
    return i
  ).join '<br>'

###
  お約束の配列使用
###
fizzbuzz8 = (l)->
  a = [1..l]
  b = ['fizzbuzz',null,null,'fizz',null,'buzz','fizz',null,null,'fizz','buzz',null,'fizz',null,null]
  $('#fb8 p').append a.map((i)->
    _i = b[i%15] ? i
  ).join '<br>'

$ ()->
  limit = 1000
  fizzbuzz1(limit)
  fizzbuzz2(limit)
  fizzbuzz3(limit)
  fizzbuzz4(limit)
  fizzbuzz5(limit)
  fizzbuzz6(limit)
  fizzbuzz7(limit)
  fizzbuzz8(limit)