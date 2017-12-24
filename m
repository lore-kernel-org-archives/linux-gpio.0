From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH] gpio: gpio-reg: fix build
Date: Sun, 24 Dec 2017 15:56:19 +0000
Message-ID: <20171224155619.GR10595@n2100.armlinux.org.uk>
References: <20171206173745.19853-1-grygorii.strashko@ti.com>
 <CAMuHMdWuHsM2TQaTsK4=XTq-Q1ea7CaNEMhWzDgt_ppqssxYpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:50448 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751992AbdLXP4i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Dec 2017 10:56:38 -0500
Content-Disposition: inline
In-Reply-To: <CAMuHMdWuHsM2TQaTsK4=XTq-Q1ea7CaNEMhWzDgt_ppqssxYpQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>

On Sun, Dec 24, 2017 at 04:49:39PM +0100, Geert Uytterhoeven wrote:
> Hi Grygorii,
> 
> On Wed, Dec 6, 2017 at 6:37 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
> > Revert changes introduced by commit f0fbe7bce733 ("gpio: Move irqdomain
> > into struct gpio_irq_chip") as they are not aplicable to this driver.
> >
> > Cc: Russell King - ARM Linux <linux@armlinux.org.uk>
> > Fixes: f0fbe7bce733 ("gpio: Move irqdomain into struct gpio_irq_chip")
> > Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> > ---
> > Sorry, for inconvenience, but this driver has no users in lkml and
> > it can't be enabled through defconfig - only selected, so builds can't
> > be verified in standard way.
> 
> Seems like we need:
> 
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -392,7 +392,7 @@ config GPIO_RCAR
>           Say yes here to support GPIO on Renesas R-Car SoCs.
> 
>  config GPIO_REG
> -       bool
> +       bool "32-bit single register GPIO fixed in/out support" if COMPILE_TEST
>         help
>           A 32-bit single register GPIO fixed in/out implementation.  This
>           can be used to represent any register as a set of GPIO signals.
> 
> Any dependencies to be added?

No need, once some patches go in, this will be selected and then it'll
get build coverage.

But the main thing is, this needs to be fixed - it's been causing build
errors for those of us carrying patches to use it, and thereby destroying
the usefulness of nightly testing.

http://www.home.armlinux.org.uk/developer/build/index.php?id=2002
http://www.home.armlinux.org.uk/developer/build/index.php?id=2004

Can we please get the fix into -rc?  Keeping the _regression_ _fix_ out
of -rc not only means that we're stuck with these build failures, but
also means that we create bisect problems for the next merge window.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
