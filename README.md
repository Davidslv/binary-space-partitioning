# BSP - Binary Space Partitioning Algorithm

References:

- https://www.youtube.com/watch?v=S5y3ES4Rvkk
- https://www.youtube.com/watch?v=oSWTXtMglKE
- https://eskerda.com/bsp-dungeon-generation/


```ruby
  # Walkthrough
  parent = Node.new(x: 10, y: 10, width: 100, height: 50)
  parent.left = Node.new(x: 10, y: 10, width: (parent.width / 2), height: (parent.height / 2))
  parent.right = Node.new(x: 10, y: 10, width: (parent.width / 2), height: (parent.height / 2))

  parent.left.parent = parent
  parent.right.parent = parent

  parent.left.sisters << parent.right
  parent.right.sisters << parent.left

  parent.leaf?
  parent.left.leaf?
  parent.right.leaf?
```
