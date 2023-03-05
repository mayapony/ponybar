# ponybar

![截图](./screenshots/2023-02-26_13-23.png)

## update

> 2023/03/05

现在有圆角了！

遇到两个坑：

1. 使用 picom 加圆角，托盘竟然是分开的，所以将托盘向左位移
2. 为了保持两边空隙大小相同，需要在左边加 margin，因为 i3-gaps 不支持使用 x-offset 需要特别使用 border-left-size

现在它是这样 ⬇️

![screenshot](./screenshots/2023-03-05_21-29.png)
