From: Florian Vaussard <florian.vaussard@gmail.com>
Subject: [RFC] Issue with GPIO hog when using a pinctrl driver
Date: Wed, 15 Feb 2017 22:24:05 +0100
Message-ID: <1bb31d3d-ce27-76b3-34b5-87c22705d613@gmail.com>
Reply-To: florian.vaussard@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35745 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752365AbdBOVYK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2017 16:24:10 -0500
Received: by mail-wm0-f66.google.com with SMTP id u63so304745wmu.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2017 13:24:09 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>

Hi!

I recently had an issue when trying to use GPIO hog with a GPIO controller
backed by a pinctrl driver (specifically
drivers/pinctrl/sunxi/pinctrl-sun50i-a64.c but I believe that the issue may be
broader). The gpiochip is initialized in two steps, using gpiochip_add_data()
and then gpiochip_add_pin_range(). The GPIO hog is initialized during the call
to gpiochip_add_data():

gpiochip_add_data
 -> of_gpiochip_add
     -> of_gpiochip_scan_gpios
         -> gpiod_hog

But gpiod_hog will fail because the GPIO mapping is not yet initialized by
gpiochip_add_pin_range(). Thus the call to pinctrl_get_device_gpio_range() will
return EPROBE_DEFER, which in turn makes the pinctrl to fail probing and this
does not end very well for the kernel...

gpiod_hog
 -> gpiochip_request_own_desc
     -> __gpiod_request
         -> chip->request (=> gpiochip_generic_request)
            -> pinctrl_request_gpio
                -> pinctrl_get_device_gpio_range

To test, I did a ugly call to of_gpiochip_scan_gpios() from within the pinctrl's
probe, right after gpiochip_add_pin_range(). And indeed, the GPIO hog is
correctly performed this time. Obviously this is not the right fix. Thus my
question is how this can be fixed? It seems like a chicken and egg problem.
Maybe the call to of_gpiochip_scan_gpios should be performed by
gpiochip_add_pin_range in case the GPIO range is not dynamically assigned by
gpiochip_add_data? This seems rather complicated.

Best,
Florian

