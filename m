From: jmondi <jacopo@jmondi.org>
Subject: Re: The RZ/A1 pin controller driver will be broken for 4.13
Date: Wed, 30 Aug 2017 14:01:41 +0200
Message-ID: <20170830120141.GB1863@w540>
References: <SG2PR06MB1165ADDEBA8097EA034C27D28A9F0@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdVNNX7xHjmnrLndDpKb9OfxCCVHO7wLUEiFsExk578zsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVNNX7xHjmnrLndDpKb9OfxCCVHO7wLUEiFsExk578zsg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Timur Tabi <timur@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Geert, Chris,

On Wed, Aug 30, 2017 at 10:26:30AM +0200, Geert Uytterhoeven wrote:
> CC Timur, LinusW, gpio
>
> On Tue, Aug 29, 2017 at 8:56 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> > Just FYI,
> >
> > After pulling Geert's new renesas-drivers-2017-08-29-v4.13-rc7, I tried
> > testing RZ/A1 and it hangs during boot.
> >
> > Basically...
> >
> > [  110.329579] pinctrl-rza1 fcfe3000.pin-controller: Parsed gpiochip gpio-0-0 with 6 pins
> > [  112.970056] pinctrl-rza1 fcfe3000.pin-controller: Parsed gpiochip gpio-1-1 with 16 pins
> > (hangs here forever)
> >
> >
> > After some debug, I found that this commit broke the new
> > drivers/pinctrl/pinctrl-rza1.c driver.
> >
> >  108d23e322a2 ("gpiolib: request the gpio before querying its direction")
> >
> > Looks like it was added for -rc5.
> >
> > If I revert that one patch, RZ/A1 boots fine.
> >
> > Since we're at -rc7, I probably won't have time to fix it before the
> > release.
>
> It's not in v4.13-rc5, only in -next, for v4.14.
> So v4.13 will be fine, and we still have plenty of time to fix the issue.

After some investigations, it turns out some register settings
performed during pin_reset() are invalid and hang the system BUT only
when performed on Port_9.

Specifically, setting PMC and PIPC registers to 0 (default initial state)
on Port_9, hangs the system.

There is no mention (none that I've found) in the processor manual of
specific procedures to be performed when resetting that port to its
initial state, so I guess this may either be an indication of
something else going wrong (like writing to some invalid memory
address) or it's an HW issue not yet documented.

Timur's patch does trigger a "reset" on all Ports during gpiochip
registration , while before that patch made into -next branch, reset
was only triggered when actually requesting a gpio or when performing
muxing on a pin.

Apparently, we never multiplexed any pin on Port_9 nor tested gpio
functionalities on that port before.

This:

@@ -487,8 +491,10 @@ static void rza1_pin_reset(struct rza1_port *port, unsigned int pin)
        rza1_set_bit(port, RZA1_PBDC_REG, pin, 0);

        rza1_set_bit(port, RZA1_PM_REG, pin, 1);
-       rza1_set_bit(port, RZA1_PMC_REG, pin, 0);
-       rza1_set_bit(port, RZA1_PIPC_REG, pin, 0);
+       if (port->id != 9) {
+               rza1_set_bit(port, RZA1_PMC_REG, pin, 0);
+               rza1_set_bit(port, RZA1_PIPC_REG, pin, 0);
+       }
        spin_unlock_irqrestore(&port->lock, irqflags);
 }

Fixes the issue, but I'm not that satisfied with this as I would like
to know if the same issue happens on other processors of the RZ/A1 family
other than RZ/A1H before proposing this as a proper fix.

Chris, do you have RZ/A1* devices where to test this?

Thanks
  j

>
> > Poor RZ/A1 pinctrl driver...it took so long to get into mainline, and
> > then it only worked for 1 release.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
