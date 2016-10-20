From: Axel Haslam <ahaslam@baylibre.com>
Subject: gpiolib-of: Cannot request gpio with multiple chips
Date: Thu, 20 Oct 2016 17:22:59 +0200
Message-ID: <CAKXjFTNbWRcNfCZdCPq6e8GVDoe-5ipdtDGC8XsiX-J=yJPK8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, gnurou@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, yamada.masahiro@socionext.com, Kevin Hilman <khilman@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

I have recently started testing a omap-lcdk board which uses the
davinci gpio driver,
and im running into an issue when i try to request a gpio larger than 31, which
i think might be a regression of gpiolib-of.

The davinci gpio driver, creates several chips, and relies in a single DT node.
in other words, davinci gpio chips have a single DT entry were ngpio = 144
but the driver internally creates multiple chips of ngpio = 32.

It used to be that gpiolib-of would iterate through all gpio chips
calling xlate until
xlate would match for the chip that can handle a particular gpio number.

Starting form a series sent on june:
"gpio: refactor of_parse_own_gpio() and of_get_named_gpiod_flags()"
https://lkml.org/lkml/2016/6/14/188

patches:
99468c1 gpio: of: factor out common code to a new helper function
762c2e4 gpio: of: remove of_gpiochip_and_xlate() and struct gg_data
1020dfd gpio: of: move chip->of_gpio_n_cells checking to of_gpiochip_add()
be71534 gpio: of: drop needless gpio_chip look-up in of_parse_own_gpio()
3f9547e gpio: of: optimize "gpios" property parsing of of_parse_own_gpio()


The gpiolib-of will fail at of_get_named_gpiod_flags the first time if the xlate
function returns error. Which means that only the first gpio chip will be tried.
For the davinci dirver,  for example, we are not able to use any gpio outside of
the first gpio chip (32 gpios).

if you agree with the above, What is the best way to proceed ?
- fix the davinci gpio driver to the new behavior of gpiolib-of
- fix the gpiolib-of to loop all chips again?
- revert the patches?

Regards
Axel.
