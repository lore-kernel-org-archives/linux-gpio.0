From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: r9a06g032: Add pinctrl node
Date: Wed, 19 Sep 2018 11:23:42 +0200
Message-ID: <CAMuHMdXhDcfXe7ohuO2s4MKHFPc-Z4TRjaTJv-MG0MHga=2viQ@mail.gmail.com>
References: <20180917163609.30457-1-phil.edworthy@renesas.com>
 <20180917163609.30457-4-phil.edworthy@renesas.com> <20180919091524.rgbk4m6ht34idkpd@verge.net.au>
 <TY1PR01MB17690D4C023EB9B4A5164A2AF51C0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <TY1PR01MB17690D4C023EB9B4A5164A2AF51C0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Phil,

On Wed, Sep 19, 2018 at 11:18 AM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> On 19 September 2018 10:15 Simon Horman wrote:
> > On Mon, Sep 17, 2018 at 05:36:09PM +0100, Phil Edworthy wrote:
> > > This provides a pinctrl driver for the Renesas R9A06G032 SoC
> > >
> > > Based on a patch originally written by Michel Pollet at Renesas.
> > >
> > > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> >
> > Thanks Phil, I will defer this patch pending acceptance of the bindings.
> > Please continue to repost this patch with updates to the bindings or
> > otherwise ping me once they have been accepted.
> Thanks, however I will send a new version of this patch to remove the
> clock-names prop as it is not needed.

I haven't reviewed the bindings patch yet, but it's a good idea to have
clock-names, even for a single clock.
It makes life easier if the same module is reused or enhanced in a later SoC,
with more clock inputs.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
