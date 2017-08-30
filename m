From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: The RZ/A1 pin controller driver will be broken for 4.13
Date: Wed, 30 Aug 2017 10:26:30 +0200
Message-ID: <CAMuHMdVNNX7xHjmnrLndDpKb9OfxCCVHO7wLUEiFsExk578zsg@mail.gmail.com>
References: <SG2PR06MB1165ADDEBA8097EA034C27D28A9F0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:35265 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751271AbdH3I0b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Aug 2017 04:26:31 -0400
In-Reply-To: <SG2PR06MB1165ADDEBA8097EA034C27D28A9F0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Timur Tabi <timur@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

CC Timur, LinusW, gpio

On Tue, Aug 29, 2017 at 8:56 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> Just FYI,
>
> After pulling Geert's new renesas-drivers-2017-08-29-v4.13-rc7, I tried
> testing RZ/A1 and it hangs during boot.
>
> Basically...
>
> [  110.329579] pinctrl-rza1 fcfe3000.pin-controller: Parsed gpiochip gpio-0-0 with 6 pins
> [  112.970056] pinctrl-rza1 fcfe3000.pin-controller: Parsed gpiochip gpio-1-1 with 16 pins
> (hangs here forever)
>
>
> After some debug, I found that this commit broke the new
> drivers/pinctrl/pinctrl-rza1.c driver.
>
>  108d23e322a2 ("gpiolib: request the gpio before querying its direction")
>
> Looks like it was added for -rc5.
>
> If I revert that one patch, RZ/A1 boots fine.
>
> Since we're at -rc7, I probably won't have time to fix it before the
> release.

It's not in v4.13-rc5, only in -next, for v4.14.
So v4.13 will be fine, and we still have plenty of time to fix the issue.

> Poor RZ/A1 pinctrl driver...it took so long to get into mainline, and
> then it only worked for 1 release.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
