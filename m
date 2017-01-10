From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/3] arm: dts: r7s72100: Add peripherals nodes
Date: Tue, 10 Jan 2017 21:58:19 +0200
Message-ID: <2351875.0S8UmoVGa8@avalon>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org> <1483990318-26927-4-git-send-email-jacopo+renesas@jmondi.org> <CAMuHMdVWVsHqdOTxeiD6zXaVJqdHPLvry9EjjPc9XvF8QsXkDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVWVsHqdOTxeiD6zXaVJqdHPLvry9EjjPc9XvF8QsXkDw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt <chris.brandt@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Geert,

On Tuesday 10 Jan 2017 16:07:01 Geert Uytterhoeven wrote:
> On Mon, Jan 9, 2017 at 8:31 PM, Jacopo Mondi wrote:
> > From: Magnus Damm <damm@opensource.se>
> > 
> > This is a squash of several commits, adding peripherals groups
> > configuration to r7s72100 device tree, and enabling some of them on
> > Genmai evaluation board
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Thanks for the rework!
> 
> >  arch/arm/boot/dts/r7s72100-genmai.dts |  51 ++++++++++++
> >  arch/arm/boot/dts/r7s72100.dtsi       | 151 +++++++++++++++++++++++++++++
>
> This path should be split in multiple parts:
>   - Add the pfc node to r7s72100.dtsi,
>   - Add the gpio nodes to r7s72100.dtsi,
>   - 4 patches for r7s72100-genmai.dts, adding support for LEDs, SCIF,
>     Ethernet, and SPI.

I can agree about the .dtsi/.dts split, but isn't this going a bit overboard ?

-- 
Regards,

Laurent Pinchart
