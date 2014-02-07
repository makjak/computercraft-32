load_package("turtle_movement")

function ensure_materials_available()
  if turtle.getItemCount(current_slot) < 1 then
    if current_slot < 9 then
      current_slot = current_slot + 1
    elseif turtle.getItemCount(1) > 0 then
      current_slot = 1
    else
      print("Out of materials! Please fill me up and press enter.")
      read()
    end
    turtle.select(current_slot)
    ensure_materials_available()
  end
end

function build(direction)
  direction = direction or "down"

  ensure_materials_available()

  if direction == "down" then
    turtle.placeDown()
  elseif direction == "up" then
    turtle.placeUp()
  elseif direction == "forward" then
    turtle.place()
  else
    error("invalid direction to build: " .. direction)
  end
end

function construct_once()
  forward(1)
  build()
end

function construct_back_once()
  reverse(1)
  build()
end

function construct_up_once()
  up(1)
  build()
end

function construct_up(times)
  for count = 1, times, 1 do
    construct_up_once()
  end
end

function construct_overhead(times)
  for count = 1, times, 1 do
    forward(1)
    build("up")
  end
end

function construct(times)
  for count = 1, times, 1 do
    construct_once()
  end
end

function construct_back(times)
  for count = 1, times, 1 do
    construct_back_once()
  end
end

function constructive_pivot(direction)
  turn(direction)
  construct(1)
  turn(direction)
end

function build_row(direction, length)
  constructive_pivot(direction)
  construct(length)
end

function build_expanding_row(direction, reverse_times, construct_times)
  constructive_pivot(direction)
  construct_back(reverse_times)
  construct(construct_times)
end

function build_contracting_row(reverse_times, direction, construct_times)
  construct_back(reverse_times)
  constructive_pivot(direction)
  construct(construct_times)
end