From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC 4/5] arm: dts: r7s1000: Add pincontroller node
Date: Tue, 31 Jan 2017 12:35:11 +0200
Message-ID: <1875374.id8cHbqMxX@avalon>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org> <3913852.YsQFAgHAs5@avalon> <SG2PR06MB11651F027332E4A764567CF68A4B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB11651F027332E4A764567CF68A4B0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Chris,

On Monday 30 Jan 2017 19:39:33 Chris Brandt wrote:
> On Monday, January 30, 2017, Laurent Pinchart wrote:
> >> +	pinctrl: pinctrl@fcfe3000 {
> >> +		compatible = "renesas,rza1-pinctrl";
> >> +		#address-cells = <1>;
> >> +		#size-cells = <0>;
> >> +
> >> +		#pinctrl-cells = <2>;
> >> +
> >> +		reg = <0xfcfe3000 0xa30>, /* Pn, ..., PFCAEn */
> >> +		      <0xfcfe7000 0x230>, /* PIBCn, ..., PIPCn */
> > 
> > What's the reason for splitting those registers in two sets ? Maybe you
> > can explain that in the DT bindings documentation that this patch series
> > is missing ;-)
> 
> I left this out of my review comments, but even though the chip designers
> left a BIG HOLE in the memory map of the PFC controller, I don't think it
> will 'cost' you anything by just mapping the whole area (dead space and
> all) and getting rid of the "high and low" memory indexing thing that you
> are doing in the driver.
> There is nothing mapped in that dead area anyway.

For the first two areas, I agree. The third area is a separate pin controller 
for the JTAG port, not multiplexed with the GPIO ports. I even wonder whether 
it should be split in a separate DT node.

-- 
Regards,

Laurent Pinchart
