console.log 'hello world'

###
#
# opts:
#   count: number of bokeh
#   edges: number of edges. Anything lower than 5 will default to a circle
#     ** pass in a tuple, let it be a range?
#   startRadius (optional):
#   endRadius:
#
#
#
###
bokehItUp = (canvas, opts) ->
  context = canvas.getContext '2d'
  context.strokeStyle = 'white'
  console.log 'hello'
  for index in [0...opts.count]
    console.log 'hello', index
    # generate a random x and y within
    bounds = [0,canvas.width]
    [x, y] = [Math.random() * canvas.width, Math.random() * canvas.height]
    startAngle = Math.random() * 2 * Math.PI
    angle = 2 * Math.PI / opts.edges
    radius = opts.minRadius + Math.random() * (opts.maxRadius - opts.minRadius)

    context.beginPath()
    context.save()
    context.translate(x,y)
    context.rotate(startAngle)
    context.moveTo(radius, 0)
    for edge in [0..opts.edges]
      context.lineTo(radius * Math.cos(angle * edge), radius * Math.sin(angle * edge))
    context.closePath()
    context.restore()
    context.stroke()




document.addEventListener 'DOMContentLoaded', (evt) ->

  canvas = document.getElementById('canvas')
  width = canvas.width = canvas.innerWidth = window.innerWidth
  height = canvas.height = canvas.innerHeight = window.innerHeight

  bokehItUp canvas,
    count: 10
    edges: 7
    minRadius: 5
    maxRadius: 50



