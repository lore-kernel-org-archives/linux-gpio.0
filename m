From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: rzn1: Fix check for used MDIO bus
Date: Fri, 23 Nov 2018 11:16:09 +0100
Message-ID: <CAMuHMdUUjoUmA2R8=PXp-hvYvowb3L-dnP6EDcGkLZJG344Yug@mail.gmail.com>
References: <20181119161838.10610-1-phil.edworthy@renesas.com>
 <CAMuHMdU2ski3S4FhD5kOhtzxvpin8M5MoYwK7X5gqYZ+HoL0DA@mail.gmail.com> <TY1PR01MB1769DE254148618373F2918CF5D40@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <TY1PR01MB1769DE254148618373F2918CF5D40@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Phil,

On Fri, Nov 23, 2018 at 11:07 AM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> On 23 November 2018 09:41 Geert Uytterhoeven wrote:
> > Subject: Re: [PATCH] pinctrl: rzn1: Fix check for used MDIO bus
> > On Mon, Nov 19, 2018 at 5:18 PM Phil Edworthy wrote:
> > > This fixes the check for unused mdio bus setting and the following
> > > static checker warning:
> > >  drivers/pinctrl/pinctrl-rzn1.c:198 rzn1_pinctrl_mdio_select()
> > >  warn: always true condition '(ipctl->mdio_func[mdio] >= 0) => (0-u32max
> > >= 0)'
> > >
> > > It also fixes the return var when calling of_get_child_count()
> >
> > I think this should be a separate patch.
> Ok, I'll split them.

Thanks!

> > BTW, I have a question about rzn1_pinctrl_mdio_select():
> >
> > static void rzn1_pinctrl_mdio_select(struct rzn1_pinctrl *ipctl, int mdio,
> >                                      u32 func) {
> >         if (ipctl->mdio_func[mdio] >= 0 && ipctl->mdio_func[mdio] != func)
> >                 dev_warn(ipctl->dev, "conflicting setting for mdio%d!\n", mdio);
> >         ipctl->mdio_func[mdio] = func;
> >
> >         dev_dbg(ipctl->dev, "setting mdio%d to %u\n", mdio, func);
> >
> >         writel(func, &ipctl->lev2->l2_mdio[mdio]); }
> >
> > The check warns the user if it overrides an already initialized MDIO function
> > with a different value.
> > However, there is no method to uninitialize (reset to -1) mdio_func[], to
> > avoid getting the warning.
> >
> > For a use case, I was thinking about a DT overlay that would cause the MDIO
> > function to be initialized on loading, and needs to uninitialize the MDIO
> > function on removing.
> >
> > Perhaps that is very unlikely or even impossible, given the function of the
> > pins controlled by the MDIO function?
> I hadn't considered that DT overlay possibility...
> Since this MDIO muxing selects one of several different IP blocks as the
> MDIO master, I guess it could happen. However, this is pretty unlikely!
>
> I can't see any way via the pinctrl_ops or pinconf_ops to 'undo' a pin
> setting, how would this work?

Actually the pinctrl core wouldn't undo the configuration on DT overlay unload,
but would just do the new configuration when loading the new DT overlay.
Hence that would print the warning, but work regardless.
Only for GPIOs there would be an undo step (freeing the requested GPIO).

> If a DT overlay causes remove() then probe() to be called again, the driver
> resets mdio_func[] in probe(), so it'll work.

Typically a DT overlay would only control I/O devices, not the actual pinctrl
device, so the pin controller driver's .probe() wouldn't be called.

But I agree it's unlikely and rare, and would still work. And probably you do
want to keep the warning.  DT overlays are still experimental, as there's no
upstream support for loading a random DT overlay at runtime.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
