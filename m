From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC fixes 1/2] arm: dts: genmai: Configure RIIC2 pins
Date: Mon, 30 Jan 2017 20:49:25 +0200
Message-ID: <1616919.mJ2Z5iDMxU@avalon>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org> <1485535628-17097-1-git-send-email-jacopo+renesas@jmondi.org> <1485535628-17097-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1485535628-17097-2-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert+renesas@glider.be, linus.walleij@linaro.org, Chris.Brandt@renesas.com, wsa@the-dreams.de, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Friday 27 Jan 2017 17:47:07 Jacopo Mondi wrote:
> Add pin configuration for RIIC2 pins interface.
> The i2c2 is connected to internal eeprom.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm/boot/dts/r7s72100-genmai.dts | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts
> b/arch/arm/boot/dts/r7s72100-genmai.dts index ea649c7..0068a1a 100644
> --- a/arch/arm/boot/dts/r7s72100-genmai.dts
> +++ b/arch/arm/boot/dts/r7s72100-genmai.dts
> @@ -40,13 +40,19 @@
> 
>  &pinctrl {
>  	pinctrl-names = "default";
> -	pinctrl-0 = <&scif2_pins>;
> +	pinctrl-0 = <&scif2_pins &i2c2_pins>;

Referencing the SCIF2 and I2C2 pins nodes from the pinctrl node will result in 
the corresponding pins being configured when the pinctrl driver is probed. You 
could move this to the SCIF2 and I2C2 DT nodes, to have the pins configured as 
part of the probe sequence of the corresponding drivers. The advantage would 
be that pins would only be configured if the corresponding devices are enabled 
and get probed by a driver. This could save a bit of power if the boot loader 
configured the pins in low-power mode and the devices were unused (although in 
this very specific case I don't think it will make a difference).

> 
>  	scif2_pins: serial2 {
>  		/* P3_0 as TxD2; P3_2 as RxD2 */
>  		renesas-rz,pins = <RZ_PIN(3, 0) ALTERNATE_FUNC_6>,
>  				  <RZ_PIN(3, 2) ALTERNATE_FUNC_4>;
>  	};
> +
> +	i2c2_pins: i2c2 {
> +		/* RIIC2: P1_4 as SCL, P1_5 as SDA */
> +		renesas-rz,pins = <RZ_PIN(1, 4) ALTERNATE_FUNC_1>,
> +				  <RZ_PIN(1, 5) ALTERNATE_FUNC_1>;
> +	};
>  };
> 
>  &extal_clk {

-- 
Regards,

Laurent Pinchart
