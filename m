From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/5] gpio: refactor of_parse_own_gpio() and of_get_named_gpiod_flags()
Date: Tue, 14 Jun 2016 19:07:02 +0900
Message-ID: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:55829 "EHLO
	conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751371AbcFNKGg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2016 06:06:36 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org


I found one bug in of_parse_own_gpio(); of_gpiochip_find_and_xlate()
fills gg_data->out_gpio with an error pointer if the .of_xlate()
callback fails, but of_parse_own_gpio() only checks whether the
out_gpio is NULL.  This is a problem because the error pointer might
be passed to the desc_to_gpio() in the failure path.

At first, I was trying to fix it with the following patch:

    @@ -165,6 +165,9 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
                return ERR_PTR(ret);

        gpiochip_find(&gg_data, of_gpiochip_find_and_xlate);
    +   if (IS_ERR(gg_data.out_gpio)){
    +           return gg_data.out_gpio;
    +   }
        if (!gg_data.out_gpio) {
                if (np->parent == np)
                        return ERR_PTR(-ENXIO);

But, after reading this code around, I thought it was more complex
than needed.  So, I decided to clean-up it instead of fix the bug.

Talking about of_parse_own_gpio(), does it need to call gpiochip_find()
in the first place?

The caller of this function, of_gpiochip_scan_gpios() already knows the
gpio_chip.  I want to make the implementation more straight-forward.



Masahiro Yamada (5):
  gpio: of: optimize "gpios" property parsing of of_parse_own_gpio()
  gpio: of: drop needless gpio_chip look-up in of_parse_own_gpio()
  gpio: of: move chip->of_gpio_n_cells checking to of_gpiochip_add()
  gpio: of: remove of_gpiochip_and_xlate() and struct gg_data
  gpio: of: factor out common code to a new helper function

 drivers/gpio/gpiolib-of.c | 126 +++++++++++++++++++++-------------------------
 1 file changed, 58 insertions(+), 68 deletions(-)

-- 
1.9.1

