From: Ian Pilcher <arequipeno@gmail.com>
Subject: How to ensure other module/driver is initialized?
Date: Thu, 15 Dec 2016 13:50:55 -0600
Message-ID: <180b9075-7db0-1708-50f4-622333de2049@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:32959 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752131AbcLOTu5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Dec 2016 14:50:57 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

I maintain an out-of-tree kernel module that enables the front-panel
LEDs on the Thecus N5550 NAS.

   https://github.com/ipilcher/n5550/blob/master/modules/n5550_board.c

The drive activity LEDs are connected to GPIO pins on the ICH10R, so
the gpio_ich driver must be loaded and initialized before my module is
loaded.  Unfortunately, the "and initialized" part is giving me trouble
after a recent CentOS kernel update.

My modprobe configuration includes:

   install n5550_board /sbin/modprobe gpio_ich; /sbin/modprobe i2c_i801;
       /sbin/modprobe --ignore-install n5550_board

But although the gpio_ich module does get loaded, it apparently hasn't
finished initializing when my module is loaded.  The result looks like
this:

  [    2.049217] leds-pca953x 0-0064: setting platform data
  [    2.051756] leds-gpio leds-gpio: pins are not configured from the 
driver
  [    2.051886] ------------[ cut here ]------------
  [    2.052004] WARNING: at drivers/gpio/gpiolib.c:176 
gpio_to_desc+0x94/0xd0()
  [    2.052120] invalid GPIO 195
  [    2.052273] Modules linked in: leds_gpio(+) leds_pca9532(+) 
dm_mirror dm_region_hash dm_log dm_mod it87 hwmon_vid n5550_board(OE) 
i2c_i801 gpio_ich i2c_core
  ...
  [    2.055171] Call Trace:
  ...
  [    2.060439] ---[ end trace d53e8e3ea852c413 ]---
  [    2.060589] gpiod_request: invalid GPIO
  [    2.060767] leds-pca953x 0-0062: setting platform data
  [    2.062718] leds-gpio: probe of leds-gpio failed with error -22
  [    2.066156] leds-pca953x 0-0062: gpios 16...31
  ...
  [    2.265708] gpio_ich: GPIO from 195 to 255 on gpio_ich

You can see that gpio_ich does appear on the "Modules linked in" line,
but it hasn't finished initializing until more that 1/10th of a
second after my module tries to use its GPIOs (indirectly through
leds_gpio).

I can work around this by adding a sleep to my modprobe configuration,
but that feels hacky and fragile.

What is the "right" way to do this?

-- 
========================================================================
Ian Pilcher                                         arequipeno@gmail.com
-------- "I grew up before Mark Zuckerberg invented friendship" --------
========================================================================
