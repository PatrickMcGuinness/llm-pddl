

(define (problem painting-problem)
  (:domain painting-robots)
  (:objects
    tile_0-1 tile_0-2 tile_0-3
    tile_1-1 tile_1-2 tile_1-3
    tile_2-1 tile_2-2 tile_2-3
    tile_3-1 tile_3-2 tile_3-3
    tile_4-1 tile_4-2 tile_4-3
    robot1 robot2 - robot
    white black - color
  )
  (:init
    (at robot1 tile_3-2)
    (at robot2 tile_4-1)
    (color tile_0-1 white)
    (color tile_0-2 black)
    (color tile_0-3 white)
    (color tile_1-1 black)
    (color tile_1-2 white)
    (color tile_1-3 black)
    (color tile_2-1 white)
    (color tile_2-2 black)
    (color tile_2-3 white)
    (color tile_3-1 black)
    (color tile_3-2 white)
    (color tile_3-3 black)
    (color tile_4-1 white)
    (color tile_4-2 black)
    (color tile_4-3 white)
    (up tile_0-1 tile_1-1)
    (up tile_0-2 tile_1-2)
    (up tile_0-3 tile_1-3)
    (up tile_1-1 tile_2-1)
    (up tile_1-2 tile_2-2)
    (up tile_1-3 tile_2-3)
    (up tile_2-1 tile_3-1)
    (up tile_2-2 tile_3-2)
    (up tile_2-3 tile_3-3)
    (up tile_3-1 tile_4-1)
    (up tile_3-2 tile_4-2)
    (up tile_3-3 tile_4-3)
    (down tile_1-1 tile_0-1)
    (down tile_1-2 tile_0-2)
    (down tile_1-3 tile_0-3)
    (down tile_2-1 tile_1-1)
    (down tile_2-2 tile_1-2)
    (down tile_2-3 tile_1-3)
    (down tile_3-1 tile_2-1)
    (down tile_3-2 tile_2-2)
    (down tile_3-3 tile_2-3)
    (down tile_4-1 tile_3-1)
    (down tile_4-2 tile_3-2)
    (down tile_4-3 tile_3-3)
    (left tile_0-1 tile_0-2)
    (left tile_0-2 tile_0-3)
    (left tile_1-1 tile_1-2)
    (left tile_1-2 tile_1-3)
    (left tile_2-1 tile_2-2)
    (left tile_2-2 tile_2-3)
    (left tile_3-1 tile_3-2)
    (left tile_3-2 tile_3-3)
    (left tile_4-1 tile_4-2)
    (left tile_4-2 tile_4-3)
    (right tile_0-2 tile_0-1)
    (right tile_0-3 tile_0-2)
    (right tile_1-2 tile_1-1)
    (right tile_1-3 tile_1-2)
    (right tile_2-2 tile_2-1)
    (right tile_2-3 tile_2-2)
    (right tile_3-2 tile_3-1)
    (right tile_3-3 tile_3-2)
    (right tile_4-2 tile_4-1)
    (right tile_4-3 tile_4-2)
    (color-gun robot1 white)
    (color-gun robot2 black)
  )
  (:goal (and
    (color tile_1-1 white)
    (color tile_1-2 black)
    (color tile_1-3 white)
    (color tile_2-1 black)
    (color tile_2-2 white)
    (color tile_2-3 black)
    (color tile_3-1 white)
    (color tile_3-2 black)
    (color tile_3-3 white)
    (color tile_4-1 black)
    (color tile_4-2 white)
    (color tile_4-3 black)
  ))
)