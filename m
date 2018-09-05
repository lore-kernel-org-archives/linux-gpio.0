From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 0/3] Renesas R9A06G032 PINCTRL Driver
Date: Wed, 5 Sep 2018 11:36:40 +0200
Message-ID: <CAMuHMdU-CcckKueeT5r9-jCoNr0H5KhzrAMbL4LeFta_fAqWuA@mail.gmail.com>
References: <1535634775-19365-1-git-send-email-phil.edworthy@renesas.com>
 <20180903103358.GC20333@w540> <TY1PR01MB17697F04004A7C8CF1D21CC1F50C0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <TY1PR01MB17697F04004A7C8CF1D21CC1F50C0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Phil,

On Mon, Sep 3, 2018 at 1:03 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 03 September 2018 11:34, jacopo mondi wrote:
> > On Thu, Aug 30, 2018 at 02:12:52PM +0100, Phil Edworthy wrote:
> > > This implements the pinctrl driver for the RZ/N1 family of devices, including
> > > the R9A06G032 (RZ/N1D) device.
> > >
> > > One area that is likely to be contentious is the use of 'virtual pins' for the
> > > MDIO pinmuxing. The driver uses two pins (170 and 171) that don't exist on
> > the
> > > device to configure the MDIO source within the RZ/N1 devices. On these
> > devices,
> > > there are two Ethernet MACs, a 5-Port Switch, numerous industrial
> > Ethernet
> > > peripherals, any of which can be the MDIO source. Configuring the MDIO
> > source
> > > could be done without the virtual pins, e.g. by extending the functions to
> > > cover all MDIO variants (a total of 32 additional functions), but this would
> > > allow users to misconfigure individual MDIO pins, rather than assign all
> > MDIO
> > > pins to a MDIO source. The choice of how to implement this will affect the
> > > DT bindings.
> > >
> > > This series was originally written by Michel Pollet whilst at Renesas, and I
> > > have taken over this work.
> > >
> > > One point from Michel's v1 series:
> > > "Note, I used renesas,rzn1-pinmux node to specify the pinmux constants,
> > > and I also don't use some of the properties documented in
> > > pinctrl-bindings.txt on purpose, as they are too limited for my use
> > > (I need to be able to set, clear, ignore or reset level, pull up/down
> > > and function as the pinmux might be set by another OS/core running
> > > concurently)."
> > >
> >
> > I start by saying that I don't know this HW pin controller well, so
> > I might be missing something, but as commented on the original series from
> > Micheal, I still don't see why you need a custom property here...
> >
> > My understanding, looking at this comment and the header provided by
> > patch [1/3] (include/dt-bindings/pinctrl/rzn1-pinctrl.h) is that
> > basically need to control pull-up/down and the output driver strength.
> >
> > Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt reports
> > a set of generic pin configuration properties to be applied to a pin
> > configuration (and multiplexing) pin controller child node that fully
> > express all (most?) of your needs.
> >
> > Eg. a pin configuration with pull up applied, using examples from your
> > cover letter should be expressed as
> >
> > Your example:
> >          &pinctrl {
> >                  pinsuart0: pinsuart0 {
> >                          renesas,rzn1-pinmux-ids = <
> >                                  RZN1_MUX(103, UART0_I)  /* UART0_TXD */
> >                                  RZN1_MUX_PUP(104, UART0_I)      /* UART0_RXD */
> >                          >;
> >                  };
> >          };
> >
> > Using standard pinctroller bindings pin configuration properties:
> >
> >          &pinctrl {
> >                  pinsuart0: uart0  {
> >                         pinsuart_tx0 {
> >                                 pinmux = <103, UART0_I>;  /* UART0_TXD */
> >                         };
> >
> >                         pinsuart_rx0 {
> >                                  pinmux = <104, UART0_I>; /* UART0_RXD */
> >                                  bias-pull-up;
> >                         };
> >                  };
> >          };
> >
> > Is there anything I am missing? Maybe from the interaction with
> > "another OS/core running concurrently" you mentioned? In this case if
> > you only have to perform pin configuration (because muxing is handled
> > already) things are even simpler, just use the pin configuration
> > bindings, without involving muxing at all:
> >
> >         &pinctrl {
> >                 pinsuart_conf: uart0 {
> >                         pins = <103, 104>;
> >                         bias-pull-up;
> >                  };
> >          };
>
> Sorry I didn’t address your point.
> The only reason we want to use new properties is so the driver can process
> dts files that have been generated from an existing PinMux App. That output
> is used by VxWorks as well as our out-of-tree Linux port. If that is not a
> good enough reason to add new properties, then I can't see any technical
> reason not to use the existing bindings.
> The use with another OS running on a different core should not be a barrier
> as it must not use the same pins as Linux.

Have the VxWorks DT bindings been submitted for review to the devicetree
mailing list?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
