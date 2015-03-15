mousedown = false

# paths will contain an array of "paths", which will be arrays of x,y coordinates.
window.paths = []

document.addEventListener 'DOMContentLoaded', (evt) ->
  # setup canvas
  canvas = document.getElementById('canvas')
  context = canvas.getContext('2d')
  context.canvas.width = document.body.offsetWidth
  context.canvas.height = document.body.offsetHeight
  # default color is black
  context.strokeStyle = 'black'

  currentPath =
    color: context.strokeStyle
    path: []


  # setup event listeners
  canvas.addEventListener 'mousedown', (evt) ->
    if evt.which is 1
      mousedown = true
      context.lineWidth = 3.0
      context.beginPath()
      context.moveTo evt.clientX, evt.clientY

      context.lineTo evt.clientX, evt.clientY
      context.stroke()

      # set the color at the beginning of the path
      currentPath.color = context.strokeStyle
      currentPath.path.push
        x: evt.clientX
        y: evt.clientY
    return

  canvas.addEventListener 'mousemove', (evt) ->
    if mousedown

      context.lineTo evt.clientX, evt.clientY
      context.stroke()
      currentPath.path.push
        x: evt.clientX
        y: evt.clientY
    return

# setup event listeners
  canvas.addEventListener 'mouseup', (evt) ->
    if evt.which is 1
      mousedown = false
      context.closePath()
      window.paths.push currentPath
      currentPath =
        color: context.strokeStyle
        path: []
    return

  canvas.addEventListener 'mouseleave', (evt) ->
    if evt.which is 1
      mousedown = false
      context.closePath()
      window.paths.push currentPath
      currentPath =
        color: context.strokeStyle
        path: []
    return

  palette = document.getElementById('palette')
  palette.addEventListener 'click', (evt) ->
    context.strokeStyle = evt.target.getAttribute 'data-color'
