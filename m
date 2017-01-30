From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC 4/5] arm: dts: r7s1000: Add pincontroller node
Date: Mon, 30 Jan 2017 20:29:18 +0200
Message-ID: <3913852.YsQFAgHAs5@avalon>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org> <1485367787-8109-5-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1485367787-8109-5-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert+renesas@glider.be, linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wednesday 25 Jan 2017 19:09:46 Jacopo Mondi wrote:
> Add pincontroller node compatible with the new Renesas RZ/A1
> pincontroller driver.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm/boot/dts/r7s72100.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi
> b/arch/arm/boot/dts/r7s72100.dtsi index 3dd427d..764006d 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -171,6 +171,18 @@
>  		};
>  	};
> 
> +	pinctrl: pinctrl@fcfe3000 {
> +		compatible = "renesas,rza1-pinctrl";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		#pinctrl-cells = <2>;
> +
> +		reg = <0xfcfe3000 0xa30>, /* Pn, ..., PFCAEn */
> +		      <0xfcfe7000 0x230>, /* PIBCn, ..., PIPCn */

What's the reason for splitting those registers in two sets ? Maybe you can 
explain that in the DT bindings documentation that this patch series is 
missing ;-)

> +		      <0xfcfe7B00 0x430>; /* JPPR0, ..., JPIBC0 */

s/B/b/

> +	};
> +
>  	scif0: serial@e8007000 {
>  		compatible = "renesas,scif-r7s72100", "renesas,scif";
>  		reg = <0xe8007000 64>;

-- 
Regards,

Laurent Pinchart
