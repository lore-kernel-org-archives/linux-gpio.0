From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] gpio: reflect base and ngpio into gpio_device
Date: Fri, 13 Oct 2017 00:08:24 +0300
Message-ID: <20171012210824.33pc7gme3shvubn7@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:20654 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751496AbdJLVIe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2017 17:08:34 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org

Hello Linus Walleij,

The patch fdeb8e1547cb: "gpio: reflect base and ngpio into
gpio_device" from Feb 10, 2016, leads to the following static checker
warning:

	drivers/gpio/gpiolib.c:2350 gpiod_direction_output()
	warn: 'desc' isn't an ERR_PTR

drivers/gpio/gpiolib.c
  2345  int gpiod_direction_output(struct gpio_desc *desc, int value)
  2346  {
  2347          struct gpio_chip *gc = desc->gdev->chip;
  2348          int ret;
  2349  
  2350          VALIDATE_DESC(desc);

I'm not a huge fan of the VALIDATE_DESC() macro because it has hidden
returns in it...  But actually it's the earlier desc->gdev->chip
dereference which is wrong.  We should probably move that below the
checks for NULL.

  2351          if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
  2352                  value = !value;
  2353          else
  2354                  value = !!value;
  2355  
  2356          /* GPIOs used for IRQs shall not be set as output */
  2357          if (test_bit(FLAG_USED_AS_IRQ, &desc->flags)) {
  2358                  gpiod_err(desc,
  2359                            "%s: tried to set a GPIO tied to an IRQ as output\n",
  2360                            __func__);
  2361                  return -EIO;
  2362          }

See also:

drivers/gpio/gpiolib.c:2105 gpiod_request() warn: 'desc' isn't an ERR_PTR
drivers/gpio/gpiolib.c:2428 gpiod_is_active_low() warn: 'desc' isn't an ERR_PTR
drivers/gpio/gpiolib.c:2481 gpiod_get_raw_value() warn: 'desc' isn't an ERR_PTR
drivers/gpio/gpiolib.c:2666 gpiod_set_raw_value() warn: 'desc' isn't an ERR_PTR

regards,
dan carpenter
