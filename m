From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/3] Renesas R9A06G032 PINCTRL Driver
Date: Mon, 10 Sep 2018 09:45:44 +0200
Message-ID: <CACRpkdaVXiE70Ux_-idKz6ovgGz1KEZ7qau-i_3FpN_q=w5npQ@mail.gmail.com>
References: <1535634775-19365-1-git-send-email-phil.edworthy@renesas.com>
 <20180903103358.GC20333@w540> <TY1PR01MB17697F04004A7C8CF1D21CC1F50C0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
 <20180903112517.GE20333@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903112517.GE20333@w540>
Sender: linux-kernel-owner@vger.kernel.org
To: jacopo <jacopo@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Phil Edworthy <phil.edworthy@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 3, 2018 at 1:25 PM jacopo mondi <jacopo@jmondi.org> wrote:
> On Mon, Sep 03, 2018 at 11:03:18AM +0000, Phil Edworthy wrote:
> > On 03 September 2018 11:34, jacopo mondi wrote:
> > > On Thu, Aug 30, 2018 at 02:12:52PM +0100, Phil Edworthy wrote:
> > > > This implements the pinctrl driver for the RZ/N1 family of devices,=
 including
> > > > the R9A06G032 (RZ/N1D) device.
(...)
> > > Using standard pinctroller bindings pin configuration properties:
> > >
> > >          &pinctrl {
> > >                  pinsuart0: uart0  {
> > >                         pinsuart_tx0 {
> > >                                 pinmux =3D <103, UART0_I>;  /* UART0_=
TXD */
> > >                         };
> > >
> > >                         pinsuart_rx0 {
> > >                                  pinmux =3D <104, UART0_I>; /* UART0_=
RXD */
> > >                                  bias-pull-up;
> > >                         };
> > >                  };
> > >          };
> > >
> > > Is there anything I am missing? Maybe from the interaction with
> > > "another OS/core running concurrently" you mentioned? In this case if
> > > you only have to perform pin configuration (because muxing is handled
> > > already) things are even simpler, just use the pin configuration
> > > bindings, without involving muxing at all:
> > >
> > >         &pinctrl {
> > >                 pinsuart_conf: uart0 {
> > >                         pins =3D <103, 104>;
> > >                         bias-pull-up;
> > >                  };
> > >          };
> >
> > Sorry I didn=E2=80=99t address your point.
> > The only reason we want to use new properties is so the driver can proc=
ess
> > dts files that have been generated from an existing PinMux App. That ou=
tput
> > is used by VxWorks as well as our out-of-tree Linux port. If that is no=
t a
> > good enough reason to add new properties, then I can't see any technica=
l
> > reason not to use the existing bindings.
>
> I see. I step back then and let this to be handled by the pinctrl
> subsystem people and maintainer :)

I rely on Geert Uytterhoeven and Laurent Pinchart to tell me
what is best for Renesas.

A good hint is that Geert will merge this driver when finished and
send it to me, so if he's not happy it is unlikely to get merged.
So make sure Geert is happy and I will be happy too.

Geert, as I, likely rely on the DT maintainers to tell me what is
best for DT. But with pinctrl they often pass it back to us.

Yours,
Linus Walleij
