From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: gpio-reg: fix build
Date: Sun, 24 Dec 2017 16:49:39 +0100
Message-ID: <CAMuHMdWuHsM2TQaTsK4=XTq-Q1ea7CaNEMhWzDgt_ppqssxYpQ@mail.gmail.com>
References: <20171206173745.19853-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:42641 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750923AbdLXPtk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Dec 2017 10:49:40 -0500
In-Reply-To: <20171206173745.19853-1-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Russell King - ARM Linux <linux@armlinux.org.uk>

Hi Grygorii,

On Wed, Dec 6, 2017 at 6:37 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> Revert changes introduced by commit f0fbe7bce733 ("gpio: Move irqdomain
> into struct gpio_irq_chip") as they are not aplicable to this driver.
>
> Cc: Russell King - ARM Linux <linux@armlinux.org.uk>
> Fixes: f0fbe7bce733 ("gpio: Move irqdomain into struct gpio_irq_chip")
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
> Sorry, for inconvenience, but this driver has no users in lkml and
> it can't be enabled through defconfig - only selected, so builds can't
> be verified in standard way.

Seems like we need:

--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -392,7 +392,7 @@ config GPIO_RCAR
          Say yes here to support GPIO on Renesas R-Car SoCs.

 config GPIO_REG
-       bool
+       bool "32-bit single register GPIO fixed in/out support" if COMPILE_TEST
        help
          A 32-bit single register GPIO fixed in/out implementation.  This
          can be used to represent any register as a set of GPIO signals.

Any dependencies to be added?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
