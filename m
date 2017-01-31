From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC 2/5] pinctrl: rz-pfc: Add Renesas RZ/A1 pinctrl driver
Date: Tue, 31 Jan 2017 12:39:56 +0200
Message-ID: <5091561.JdaHPde81y@avalon>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org> <1485367787-8109-3-git-send-email-jacopo+renesas@jmondi.org> <SG2PR06MB1165C49393EAA4027B020B448A4B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1165C49393EAA4027B020B448A4B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Chris,

On Monday 30 Jan 2017 19:19:18 Chris Brandt wrote:
> On Wednesday, January 25, 2017, Jacopo Mondi wrote:
> > +	/* Port 5 */
> > +	RZ_PIN_NAME(5, 0), RZ_PIN_NAME(5, 1), RZ_PIN_NAME(5, 2),
> > +	RZ_PIN_NAME(5, 3), RZ_PIN_NAME(5, 4), RZ_PIN_NAME(5, 5),
> > +	RZ_PIN_NAME(5, 6), RZ_PIN_NAME(5, 7), RZ_PIN_NAME(5, 8),
> > +	RZ_PIN_NAME(5, 9), RZ_PIN_NAME(5, 10),
> 
> The RZ/A1L (basically a subset of RZ/A1H to reduce cost) uses
> all 16 port pins on "port 5" so I'd like to include them as well.
> 
> > +static const struct of_device_id rza1_pinctrl_of_match[] = {
> > +	{ .compatible = "renesas,rza1-pinctrl", },
> > +	{ }
> > +};
> 
> Since this PFC driver file is specifically for RZ/A1, I think a
> better compatible string would be:
> 
>   .compatible = "renesas,r7s72100-renesas-pinctrl",

Do we need to repeat "renesas" in the name ? And given that the datasheet 
names the hardware "ports", how about "renesas,r7s72100-ports" ? The IP core 
handles both pinctrl and GPIO, so "pinctrl" is a bit restrictive.

-- 
Regards,

Laurent Pinchart
