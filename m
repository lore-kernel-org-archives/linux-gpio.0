From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/3] arm: dts: r7s72100: Add peripherals nodes
Date: Wed, 11 Jan 2017 12:56:27 +0200
Message-ID: <1972069.iVQDXkJGnX@avalon>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org> <1483990318-26927-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1483990318-26927-4-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: magnus.damm@gmail.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Monday 09 Jan 2017 20:31:58 Jacopo Mondi wrote:
> From: Magnus Damm <damm@opensource.se>
> 
> This is a squash of several commits, adding peripherals groups
> configuration to r7s72100 device tree, and enabling some of them on
> Genmai evaluation board
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> -------------------------------------------------------------------
> 
> [REBASED] ARM: shmobile: r7s72100 GPIO and PINCTRL device nodes
> 
> Add support for r7s72100 PFC and GPIO device nodes port0 -> port11
> and jtagport0.
> 
> Signed-off-by: Magnus Damm <damm@opensource.se>
> 
> [REBASED] ARM: shmobile: Genmai SCIF2 PINCTRL configuration
> 
> Configure the r7s72100 PINCTRL hardware and select pin function
> for the SCIF2 serial console.
> 
> Signed-off-by: Magnus Damm <damm@opensource.se>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> [REBASED] ARM: shmobile: Genmai LED1 and LED2 support
> 
> Add support for Genmai board LED1 and LED2 via gpio-leds.
> 
> Signed-off-by: Magnus Damm <damm@opensource.se>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> ARM: shmobile: Genmai I2C-over-GPIO support
> 
> Add support for the Genmai I2C bus hooked up to P1_5 and P1_4 using
> the i2c-gpio driver. On the bus sits a 24c128 EEPRROM.
> 
> Signed-off-by: Magnus Damm <damm@opensource.se>
> 
> [REBASED] arm: shmobile: genmai: adapt dts to use native i2c driver
> 
> Switch from the gpio-driver to the shiny new native driver. Tested by
> accessing the eeprom on the genmai board.
> 
> Signed-off-by: Wolfram Sang <wsa@sang-engineering.com>
> Acked-by: Magnus Damm <damm@opensource.se>
> 
> [REBASED] ARM: shmobile: r7s72100: Add ethernet PFC node to DT
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> [BLOCKED] ARM: shmobile: genmai reference dts: Add pinctrl for RSPI
> 
> Add pinctrl for the existing rspi4 node on Genmai.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> [WIP] genmai sh_eth dts fixup
> ---
>  arch/arm/boot/dts/r7s72100-genmai.dts |  51 ++++++++++++
>  arch/arm/boot/dts/r7s72100.dtsi       | 151 +++++++++++++++++++++++++++++++
>  2 files changed, 202 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts
> b/arch/arm/boot/dts/r7s72100-genmai.dts index 118a8e2..59bccd3 100644
> --- a/arch/arm/boot/dts/r7s72100-genmai.dts
> +++ b/arch/arm/boot/dts/r7s72100-genmai.dts
> @@ -11,6 +11,7 @@
> 
>  /dts-v1/;
>  #include "r7s72100.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> 
>  / {
>  	model = "Genmai";
> @@ -34,6 +35,17 @@
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		led1 {
> +			gpios = <&port4 10 GPIO_ACTIVE_LOW>;
> +		};
> +		led2 {
> +			gpios = <&port4 11 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
>  };
> 
>  &extal_clk {
> @@ -59,6 +71,45 @@
>  	};
>  };
> 
> +&pfc {
> +	pinctrl-0 = <&ethernet_pins &rspi4_pins &scif2_pins>;
> +	pinctrl-names = "default";

Shouldn't you add these properties to the ethernet, spi4 and scif2 nodes 
instead ?

> +
> +	ethernet_pins: ethernet {
> +		renesas,groups = "ethernet_rxdv_p3_6",
> +				 "ethernet_rxer_p3_5",
> +				 "ethernet_rxclk_p3_4",
> +				 "ethernet_mdio_p3_3",
> +				 "ethernet_rxd3_p2_11",
> +				 "ethernet_rxd2_p2_10",
> +				 "ethernet_rxd1_p2_9",
> +				 "ethernet_rxd0_p2_8",
> +				 "ethernet_txd3_p2_7",
> +				 "ethernet_txd2_p2_6",
> +				 "ethernet_txd1_p2_5",
> +				 "ethernet_txd0_p2_4",
> +				 "ethernet_txcrs_p2_3",
> +				 "ethernet_txen_p2_2",
> +				 "ethernet_txer_p2_1",
> +				 "ethernet_txclk_p2_0",
> +				 "ethernet_mdc_p5_9",
> +				 "ethernet_col_p1_14",
> +				 "ethernet_int_p1_15";
> +		renesas,function = "ethernet";
> +	};
> +
> +	rspi4_pins: spi4 {
> +		renesas,groups = "rspi4_rspck_p4_0", "rspi4_ssl0_p4_1",
> +				 "rspi4_mosi_p4_2", "rspi4_miso_p4_3";
> +		renesas,function = "rspi4";
> +	};
> +
> +	scif2_pins: serial2 {
> +		renesas,groups = "scif2_txd_p3_0", "scif2_rxd_p3_2";
> +		renesas,function = "scif2";
> +	};
> +};
> +
>  &scif2 {
>  	status = "okay";
>  };
> diff --git a/arch/arm/boot/dts/r7s72100.dtsi
> b/arch/arm/boot/dts/r7s72100.dtsi index 3dd427d..47bfd47 100644
> --- a/arch/arm/boot/dts/r7s72100.dtsi
> +++ b/arch/arm/boot/dts/r7s72100.dtsi
> @@ -20,6 +20,19 @@
>  	#size-cells = <1>;
> 
>  	aliases {
> +		gpio0 = &port0;
> +		gpio1 = &port1;
> +		gpio2 = &port2;
> +		gpio3 = &port3;
> +		gpio4 = &port4;
> +		gpio5 = &port5;
> +		gpio6 = &port6;
> +		gpio7 = &port7;
> +		gpio8 = &port8;
> +		gpio9 = &port9;
> +		gpio10 = &port10;
> +		gpio11 = &port11;
> +		gpio12 = &jtagport0;
>  		i2c0 = &i2c0;
>  		i2c1 = &i2c1;
>  		i2c2 = &i2c2;
> @@ -359,6 +372,144 @@
>  			<0xe8202000 0x1000>;
>  	};
> 
> +	pfc: pfc@fcfe3300 {
> +		compatible = "renesas,pfc-r7s72100";
> +		reg = <0xfcfe3300 0x400>, /* PM, PMC, PFC, PFCE */
> +		  	  <0xfcfe3a00 0x100>, /* PFCAE */
> +			  <0xfcfe7000 0x300>, /* PIBC, PBDC, PIPC */
> +			  <0xfcfe7b40 0x04>, /* JPMC */
> +			  <0xfcfe7b90 0x04>, /* JPMCSR */
> +			  <0xfcfe7f00 0x04>; /* JPIBC */
> +	};
> +
> +	port0: gpio@fcfe3100 {
> +		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
> +		reg = <0xfcfe3100 0x4>, /* PSR */
> +		  	  <0xfcfe3200 0x2>, /* PPR */
> +			  <0xfcfe3800 0x4>; /* PMSR */
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		gpio-ranges = <&pfc 0 0 6>;
> +	};
> +
> +	port1: gpio@fcfe3104 {
> +		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
> +		reg = <0xfcfe3104 0x4>, /* PSR */
> +		  	  <0xfcfe3204 0x2>, /* PPR */
> +			  <0xfcfe3804 0x4>; /* PMSR */
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		gpio-ranges = <&pfc 0 16 16>;
> +	};
> +
> +	port2: gpio@fcfe3108 {
> +		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
> +		reg = <0xfcfe3108 0x4>, /* PSR */
> +		  	  <0xfcfe3208 0x2>, /* PPR */
> +			  <0xfcfe3808 0x4>; /* PMSR */
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		gpio-ranges = <&pfc 0 32 16>;
> +	};
> +
> +	port3: gpio@fcfe310c {
> +		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
> +		reg = <0xfcfe310c 0x4>, /* PSR */
> +		  	  <0xfcfe320c 0x2>, /* PPR */
> +			  <0xfcfe380c 0x4>; /* PMSR */
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		gpio-ranges = <&pfc 0 48 16>;
> +	};
> +
> +	port4: gpio@fcfe3110 {
> +		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
> +		reg = <0xfcfe3110 0x4>, /* PSR */
> +		  	  <0xfcfe3210 0x2>, /* PPR */
> +			  <0xfcfe3810 0x4>; /* PMSR */
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		gpio-ranges = <&pfc 0 64 16>;
> +	};
> +
> +	port5: gpio@fcfe3114 {
> +		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
> +		reg = <0xfcfe3114 0x4>, /* PSR */
> +		  	  <0xfcfe3214 0x2>, /* PPR */
> +			  <0xfcfe3814 0x4>; /* PMSR */
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		gpio-ranges = <&pfc 0 80 11>;
> +	};
> +
> +	port6: gpio@fcfe3118 {
> +		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
> +		reg = <0xfcfe3118 0x4>, /* PSR */
> +		  	  <0xfcfe3218 0x2>, /* PPR */
> +			  <0xfcfe3818 0x4>; /* PMSR */
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		gpio-ranges = <&pfc 0 96 16>;
> +	};
> +
> +	port7: gpio@fcfe311c {
> +		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
> +		reg = <0xfcfe311c 0x4>, /* PSR */
> +		  	  <0xfcfe321c 0x2>, /* PPR */
> +			  <0xfcfe381c 0x4>; /* PMSR */
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		gpio-ranges = <&pfc 0 112 16>;
> +	};
> +
> +	port8: gpio@fcfe3120 {
> +		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
> +		reg = <0xfcfe3120 0x4>, /* PSR */
> +		  	  <0xfcfe3220 0x2>, /* PPR */
> +			  <0xfcfe3820 0x4>; /* PMSR */
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		gpio-ranges = <&pfc 0 128 16>;
> +	};
> +
> +	port9: gpio@fcfe3124 {
> +		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
> +		reg = <0xfcfe3124 0x4>, /* PSR */
> +		  	  <0xfcfe3224 0x2>, /* PPR */
> +			  <0xfcfe3824 0x4>; /* PMSR */
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		gpio-ranges = <&pfc 0 144 8>;
> +	};
> +
> +	port10: gpio@fcfe3128 {
> +		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
> +		reg = <0xfcfe3128 0x4>, /* PSR */
> +		  	  <0xfcfe3228 0x2>, /* PPR */
> +			  <0xfcfe3828 0x4>; /* PMSR */
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		gpio-ranges = <&pfc 0 160 16>;
> +	};
> +
> +	port11: gpio@fcfe312c {
> +		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
> +		reg = <0xfcfe312c 0x4>, /* PSR */
> +		  	  <0xfcfe322c 0x2>, /* PPR */
> +			  <0xfcfe382c 0x4>; /* PMSR */
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		gpio-ranges = <&pfc 0 176 16>;
> +	};
> +
> +	jtagport0: gpio@fcfe7b20 {
> +		compatible = "renesas,gpio-r7s72100", "renesas,gpio-rz";
> +		reg = <0xfcfe7b20 0x2>; /* JPPR */
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		gpio-ranges = <&pfc 0 192 2>;
> +	};
> +
>  	i2c0: i2c@fcfee000 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;

-- 
Regards,

Laurent Pinchart
