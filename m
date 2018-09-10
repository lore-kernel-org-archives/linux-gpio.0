From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 0/3] Renesas R9A06G032 PINCTRL Driver
Date: Mon, 10 Sep 2018 11:42:10 +0200
Message-ID: <CAMuHMdUX2Bq+t0yaVYsz6VzX7ZNw_gf_EHc2BuaR9bZcZ=jV7Q@mail.gmail.com>
References: <1535634775-19365-1-git-send-email-phil.edworthy@renesas.com>
 <20180903103358.GC20333@w540> <TY1PR01MB17697F04004A7C8CF1D21CC1F50C0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
 <CAMuHMdU-CcckKueeT5r9-jCoNr0H5KhzrAMbL4LeFta_fAqWuA@mail.gmail.com>
 <TY1PR01MB17697A2D3BCA85B3BFC1FE21F5020@TY1PR01MB1769.jpnprd01.prod.outlook.com>
 <CACRpkdad=U5YACQ6k86A4BJo9-U4bC61A0kJ8kONSHu+u3BPyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdad=U5YACQ6k86A4BJo9-U4bC61A0kJ8kONSHu+u3BPyA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Phil Edworthy <phil.edworthy@renesas.com>, Jacopo Mondi <jacopo@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 10, 2018 at 9:49 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Sep 5, 2018 at 11:59 AM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> > On 05 September 2018 10:37, Geert Uytterhoeven wrote:
>
> > > Have the VxWorks DT bindings been submitted for review to the devicetree
> > > mailing list?
>
> > I'm not involved with the VxWorks port, but I am pretty sure that they have
> > not been submitted for review.
>
> We have had other cases where deployments on other OSes have been
> establishing bindings (even not very pretty ones).
>
> Examples include typically the Power MacIntosh and the original SPARC
> bindings.

Which predated FDT support in Linux by more than a decade, with the
latter predating even p1275?

While I see merit in compatibility with other existing OSes, I prefer not
to deviate from standard DT bindings, if they exist.

Over time, we've even migrated from Renesas-specific DT bindings to
standard DT bindings, in already upstreamed SoC support.

If needed, I guess a script can be written to convert DTS files from the
old to the new syntax?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
