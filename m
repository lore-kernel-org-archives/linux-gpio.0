From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC 5/5] arm: dts: genmai: Add SCIF2 pin group
Date: Mon, 30 Jan 2017 20:17:41 +0200
Message-ID: <1534890.LugBLSd3dc@avalon>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org> <1485367787-8109-6-git-send-email-jacopo+renesas@jmondi.org> <4c60f795-d8af-5b3d-f632-a013a9a33be1@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33166 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753460AbdA3SRb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 13:17:31 -0500
In-Reply-To: <4c60f795-d8af-5b3d-f632-a013a9a33be1@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, geert+renesas@glider.be, linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

Hello,

On Thursday 26 Jan 2017 12:51:03 Sergei Shtylyov wrote:
> On 1/25/2017 9:09 PM, Jacopo Mondi wrote:
> > Add  TxD and RxD pin configuration for SCIF2 serial communication
> > interface on r7s72100 Genmai board.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> > 
> >  arch/arm/boot/dts/r7s72100-genmai.dts | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts
> > b/arch/arm/boot/dts/r7s72100-genmai.dts index 118a8e2..ea649c7 100644
> > --- a/arch/arm/boot/dts/r7s72100-genmai.dts
> > +++ b/arch/arm/boot/dts/r7s72100-genmai.dts
> 
> [...]
> 
> > @@ -34,6 +35,18 @@
> >  		#address-cells = <1>;
> >  		#size-cells = <1>;
> >  	};
> > +

That's not needed.

> > +};
> > +
> > +&pinctrl {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&scif2_pins>;
> > +
> > +	scif2_pins: serial2 {
> > +		/* P3_0 as TxD2; P3_2 as RxD2 */
> > +		renesas-rz,pins = <RZ_PIN(3, 0) ALTERNATE_FUNC_6>,
> 
> The comma should be after the vendor prefix ("renesas").

And the "-rz" suffix isn't needed, "renesas,pins" will do.

-- 
Regards,

Laurent Pinchart

