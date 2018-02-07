From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: serial: max310x: Use HW type for gpio_chip's label
Date: Wed, 7 Feb 2018 14:36:33 +0100
Message-ID: <CACRpkdaCGmsyFGZm+2t7Vnptvi2PwFRXbq28iepDgYO0LRiUWQ@mail.gmail.com>
References: <b2421132df00569baa90af8f2d19ad75242e8c48.1516996724.git.jan.kundrat@cesnet.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:54621 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754011AbeBGNge (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Feb 2018 08:36:34 -0500
Received: by mail-it0-f65.google.com with SMTP id k131so2277398ith.4
        for <linux-gpio@vger.kernel.org>; Wed, 07 Feb 2018 05:36:34 -0800 (PST)
In-Reply-To: <b2421132df00569baa90af8f2d19ad75242e8c48.1516996724.git.jan.kundrat@cesnet.cz>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
Cc: linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Shiyan <shc_work@mail.ru>

On Fri, Jan 26, 2018 at 8:02 PM, Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz> w=
rote:

> Some debugging tools (/sys/kernel/debug/gpio, `lsgpio`) use the
> gpio_chip's label for displaying an additional context. Right now, the
> information duplicates stuff which is already available from the
> parent's device. This is how e.g. `lsgpio`'s output looks like:
>
>   GPIO chip: gpiochip2, "spi1.2", 16 GPIO lines
>
> Comparing the output of other GPIO expanders that I have available:
>
>   gpiochip4: GPIOs 464-479, parent: spi/spi1.1, mcp23s17, can sleep:
>   gpiochip5: GPIOs 448-463, parent: i2c/0-0020, pca9555, can sleep:
>   gpiochip2: GPIOs 496-511, parent: spi/spi1.2, spi1.2, can sleep:
>
> This patch ensures that the type of the real HW device is shown instead
> of duplicating the SPI path:
>
>   gpiochip2: GPIOs 496-511, parent: spi/spi1.2, MAX14830, can sleep:
>
> Signed-off-by: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Greg, pls apply this to your TTY tree.

Yours,
Linus Walleij
