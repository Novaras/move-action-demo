# Move-Action demo

Uses [modkit](https://github.com/Novaras/modkit).

Here I demonstrate a 'move-action list' system, whereby ships are given a task list and carry out these tasks in sequential order.

A move-command task is considered finished when its `finished` function returns non-nil.

In this demo we just make a multigun corvette fly to the center of the map, then perform a circle, after which it returns to the center and waits a short while before exploding and spawning a new multigun (which repeats the process).

**These are just arbitary actions intended to show the capabilities of `:moveActionQueue`!**

The script is [here](scripts/custom_code/ma_demo.lua).

Here's the live demo: https://files.catbox.moe/fb6qxw.webm
