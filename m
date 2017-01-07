From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: pca953x: lockdep warning since 4.10
Date: Sat, 7 Jan 2017 21:54:10 +0100
Message-ID: <20170107205410.GA11574@archie.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi,

I observed the following lockdep warning when booting an i.MX6Q board
with several PCAL9555A gpio expanders connected over I2C. They are
connected to 3 separate busses, there is no i2c-mux in use.

This warning appears with the latest mainline Linux kernel 4.10-rc2:

[    0.671336] WARNING: CPU: 1 PID: 1 at kernel/locking/lockdep.c:3124 gpiochip_irq_map+0x44/0xa4
[    0.671347] DEBUG_LOCKS_WARN_ON(!key)
[    0.671359] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.10.0-rc2-00292-g7d08ba50fe02 #634
[    0.671372] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[    0.671403] [<8010ec90>] (unwind_backtrace) from [<8010bcf8>] (show_stack+0x10/0x14)
[    0.671427] [<8010bcf8>] (show_stack) from [<803bb6cc>] (dump_stack+0x98/0xc4)
[    0.671450] [<803bb6cc>] (dump_stack) from [<80128288>] (__warn+0xe0/0xfc)
[    0.671467] [<80128288>] (__warn) from [<801282e8>] (warn_slowpath_fmt+0x44/0x68)
[    0.671484] [<801282e8>] (warn_slowpath_fmt) from [<803ee848>] (gpiochip_irq_map+0x44/0xa4)
[    0.671504] [<803ee848>] (gpiochip_irq_map) from [<80191178>] (irq_domain_associate+0x74/0x1d4)
[    0.671523] [<80191178>] (irq_domain_associate) from [<801918e8>] (irq_create_mapping+0x64/0xc8)
[    0.671541] [<801918e8>] (irq_create_mapping) from [<803ef9d4>] (_gpiochip_irqchip_add+0xdc/0x1a4)
[    0.671562] [<803ef9d4>] (_gpiochip_irqchip_add) from [<803f54c0>] (pca953x_probe+0x45c/0x614)
[    0.671585] [<803f54c0>] (pca953x_probe) from [<804e22bc>] (i2c_device_probe+0x14c/0x1e0)
[    0.671608] [<804e22bc>] (i2c_device_probe) from [<8043e368>] (really_probe+0x1c8/0x260)
[    0.671625] [<8043e368>] (really_probe) from [<8043cf74>] (bus_for_each_drv+0x74/0xb8)
[    0.671642] [<8043cf74>] (bus_for_each_drv) from [<8043e6dc>] (__device_attach+0xc0/0x104)
[    0.671658] [<8043e6dc>] (__device_attach) from [<8043d1c0>] (bus_probe_device+0x88/0x90)
[    0.671675] [<8043d1c0>] (bus_probe_device) from [<8043b80c>] (device_add+0x410/0x598)
[    0.671692] [<8043b80c>] (device_add) from [<804e1364>] (i2c_new_device+0x164/0x1c0)
[    0.671707] [<804e1364>] (i2c_new_device) from [<804e1830>] (i2c_register_adapter+0x280/0x58c)
[    0.671727] [<804e1830>] (i2c_register_adapter) from [<804e6178>] (i2c_imx_probe+0x33c/0x568)
[    0.671747] [<804e6178>] (i2c_imx_probe) from [<8043f848>] (platform_drv_probe+0x34/0x6c)
[    0.671764] [<8043f848>] (platform_drv_probe) from [<8043e368>] (really_probe+0x1c8/0x260)
[    0.671779] [<8043e368>] (really_probe) from [<8043e4cc>] (__driver_attach+0xcc/0xd0)
[    0.671796] [<8043e4cc>] (__driver_attach) from [<8043ca34>] (bus_for_each_dev+0x7c/0xc0)
[    0.671812] [<8043ca34>] (bus_for_each_dev) from [<8043d3d8>] (bus_add_driver+0x108/0x208)
[    0.671830] [<8043d3d8>] (bus_add_driver) from [<8043ee28>] (driver_register+0x78/0xf4)
[    0.671851] [<8043ee28>] (driver_register) from [<80900e20>] (do_one_initcall+0xc4/0x184)
[    0.671868] [<80900e20>] (do_one_initcall) from [<8090103c>] (kernel_init_freeable+0x15c/0x1ec)
[    0.671886] [<8090103c>] (kernel_init_freeable) from [<806e4c8c>] (kernel_init+0x8/0x10c)
[    0.671905] [<806e4c8c>] (kernel_init) from [<801079d0>] (ret_from_fork+0x14/0x24)
[    0.671922] ---[ end trace f719aac79da5d26a ]---

Is this a false positive?

Regards,
Clemens
