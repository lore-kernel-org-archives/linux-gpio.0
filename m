From: Sylvain Lemieux <slemieux.tyco@gmail.com>
Subject: Re: gpiolib-of: Cannot request gpio with multiple chips
Date: Fri, 21 Oct 2016 08:36:40 -0400
Message-ID: <1477053400.22861.3.camel@localhost>
References: <CAKXjFTNbWRcNfCZdCPq6e8GVDoe-5ipdtDGC8XsiX-J=yJPK8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:38415 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932428AbcJUMgo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2016 08:36:44 -0400
In-Reply-To: <CAKXjFTNbWRcNfCZdCPq6e8GVDoe-5ipdtDGC8XsiX-J=yJPK8A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Haslam <ahaslam@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, yamada.masahiro@socionext.com, Kevin Hilman <khilman@baylibre.com>, Vladimir Zapolskiy <vz@mleia.com>

Hi Alex,


On Thu, 2016-10-20 at 17:22 +0200, Axel Haslam wrote:
> Hi Linus,
> 
> I have recently started testing a omap-lcdk board which uses the
> davinci gpio driver,
> and im running into an issue when i try to request a gpio larger than 31, which
> i think might be a regression of gpiolib-of.
> 
> The davinci gpio driver, creates several chips, and relies in a single DT node.
> in other words, davinci gpio chips have a single DT entry were ngpio = 144
> but the driver internally creates multiple chips of ngpio = 32.
> 
> It used to be that gpiolib-of would iterate through all gpio chips
> calling xlate until
> xlate would match for the chip that can handle a particular gpio number.
> 
> Starting form a series sent on june:
> "gpio: refactor of_parse_own_gpio() and of_get_named_gpiod_flags()"
> https://lkml.org/lkml/2016/6/14/188
> 
> patches:
> 99468c1 gpio: of: factor out common code to a new helper function
> 762c2e4 gpio: of: remove of_gpiochip_and_xlate() and struct gg_data
> 1020dfd gpio: of: move chip->of_gpio_n_cells checking to of_gpiochip_add()
> be71534 gpio: of: drop needless gpio_chip look-up in of_parse_own_gpio()
> 3f9547e gpio: of: optimize "gpios" property parsing of of_parse_own_gpio()
> 
> 
> The gpiolib-of will fail at of_get_named_gpiod_flags the first time if the xlate
> function returns error. Which means that only the first gpio chip will be tried.
> For the davinci dirver,  for example, we are not able to use any gpio outside of
> the first gpio chip (32 gpios).
> 
> if you agree with the above, What is the best way to proceed ?
> - fix the davinci gpio driver to the new behavior of gpiolib-of
> - fix the gpiolib-of to loop all chips again?
> - revert the patches?
> 
Other GPIO drivers are also affected.

This was reported for the LPC32xx platform on Tuesday:
http://www.spinics.net/lists/linux-gpio/msg17283.html


> Regards
> Axel.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Sylvain

