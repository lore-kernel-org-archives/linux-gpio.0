From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC 3/5] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
Date: Mon, 30 Jan 2017 20:30:26 +0200
Message-ID: <5227448.uVg4OnCqZq@avalon>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org> <1485367787-8109-4-git-send-email-jacopo+renesas@jmondi.org> <CAMuHMdUmy2QkvRomf8euzB0QNkeCA=N8=rhY0GkObz8qn-UvMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUmy2QkvRomf8euzB0QNkeCA=N8=rhY0GkObz8qn-UvMQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thursday 26 Jan 2017 20:52:33 Geert Uytterhoeven wrote:
> On Wed, Jan 25, 2017 at 7:09 PM, Jacopo Mondi wrote:
> > Add dt-bindings header for Renesas RZ pincontroller.
> > The header defines macros for pin description and alternate function
> > numbers.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> > 
> >  include/dt-bindings/pinctrl/pinctrl-renesas-rz.h | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 include/dt-bindings/pinctrl/pinctrl-renesas-rz.h
> > 
> > diff --git a/include/dt-bindings/pinctrl/pinctrl-renesas-rz.h
> > b/include/dt-bindings/pinctrl/pinctrl-renesas-rz.h new file mode 100644
> > index 0000000..92816d4
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/pinctrl-renesas-rz.h
> > @@ -0,0 +1,19 @@
> > +/*
> > + * Defines macros and constants for Renesas RZ pin controller and muxer
> > + */
> > +
> > +#ifndef __DT_BINDINGS_PINCTRL_RENESAS_RZ_H
> > +#define __DT_BINDINGS_PINCTRL_RENESAS_RZ_H
> > +
> > +#define RZ_PIN(b, p) b p
> 
> And the advantage of this macro is?
> 
> > +#define ALTERNATE_FUNC_1       0
> > +#define ALTERNATE_FUNC_2       1
> > +#define ALTERNATE_FUNC_3       2
> > +#define ALTERNATE_FUNC_4       3
> > +#define ALTERNATE_FUNC_5       4
> > +#define ALTERNATE_FUNC_6       5
> > +#define ALTERNATE_FUNC_7       6
> > +#define ALTERNATE_FUNC_8       7
> 
> I have mixed feelings about these macros:
>   1. They're long to type,
>   2. They just map from n to n-1.
> 
> Why not use plain numbers 1..8 (the alternate function numbering in the
> datasheet is 1-based), and subtract 1 in the C code?

I was about to mention the same. I think you can drop this patch and use the 
numbers directly.

-- 
Regards,

Laurent Pinchart
