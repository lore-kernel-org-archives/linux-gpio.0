Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836456;
	b=luqg7pkci8XZR3Y2DjrgKwYABaS7wKW2ScmjsQME4BqSdgBnwG/xRtKsUBZFtWHgutK4
	 WwdevusHHcDL8/VMRC+A+dWE1rprH3PqIBCkAXaHrxtB5BB3UIPL856+k9I3YpALdYv5X
	 F7Wi6Vt5rud464vBGt5T8pMpqwxx6py6qmbtY9njez1H7We1tibrEQUQrn0YHDz7s4MNW
	 AQ8ybSwRjNmJoOViu7bzETdZO5bNu3JTBr6Q+qV9cD55ShK7G41GHxO2IyQ4qc2Oyc9HO
	 rgrRnUX5XCnnC0yrQj6YIg0daURVG9PYwchw7XQ6CdfEtm85dfIAFxYzcEdrWke734w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836456;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=04usRo0p49e4xN5z8BV5OvbA00WkHq0yeYyd9e555E8=;
	b=3JzPSFYRGGs5yfC+wUeNk9xoxssDWZ6s7n835kAc1b6lIngDfNYxoRbBqzuE8cD1aIDD
	 7DfIZzspbG1w/YQ5HiVwslHqfuz8iWK4Fp3VJDgs/FhK5z1lPex/8H4FwdIhkl9DlEOyx
	 k/egzMZT+JMbw1YflbZGrP2N1OFzKTL8ZAa5NS3cGE7wu+skN+iM3H0fyLKmD9MuDBDj/
	 j/+S4oSIkZvw4jY0lPKIP1tcy3nUuDO8a5UHATWh7+RVdZXwtT8GfSFmapzDkZ66G0z+U
	 PuzpR9Jy9g5aSqK3F0+fe3ZcKcP+ei2NQxEw7Jhb2zYY2FX4d0T8S0J5UjfmL4Hyx8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mse1He3b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2539606A326;
	Wed,  4 Nov 2026 23:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mse1He3b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36801F000C1;
	Wed,  4 Nov 2026 23:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793836455;
	bh=04usRo0p49e4xN5z8BV5OvbA00WkHq0yeYyd9e555E8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mse1He3bUoT86UfMRRBd8ZbS1HTVq9lfaIofv1y6s3vQ5naFNU+VD/dgd+0QraQOC
	 A570DM+2UcClbev/G/+m+v7aamThIZzFcGraumDPtKtkZeY0oWEkvhQbKWV1uZ8DBA
	 syVsH9Nh93UkWfgev4xB2BPK1hXgyeRJSVCUMqkxPFyAN6WUqviP/hpvWScPsxyi5P
	 pv0nQLkqCJbCErswqACbIkD9tOTHQ55K+fhOY0NjZtELMHQxR+gy/gb5stXng5Fd8l
	 G5ODjv6f15p3W9SY288gSn15EJKtruKUalgstWbMJPfN9+P3eB1RU0yupnJDr85THM
	 tNjplY3/TsOMg==
Date: Wed, 4 Nov 2026 23:54:11 +0000
From: Conor Dooley <conor@kernel.org>
To: joseph@telaak.dev
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
Message-ID: <20261104-geiger-handler-f6688647819c@spud>
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BcSoKk5UO7VHsm1e"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev>

--BcSoKk5UO7VHsm1e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 02:21:18AM -0500, Joseph Telaak via B4 Relay wrote:
> From: Joseph Telaak <joseph@telaak.dev>
>=20
> Add a driver for the pin controller of the Siflower SF19A2890. Each pin
> is a group of its own. The functions are named after the peripheral
> they connect, and each lists the pins it can use with the mux mode that
> selects it there. The function tables cover what the vendor firmware and
> the OpenWrt port use; the rest of the modes are undocumented.
>=20
> Based on the OpenWrt driver by Chuanhong Guo, which exposed the mux
> modes as functions "func0" to "func3". That driver was itself based on
> the BCM2835 pin controller driver.
>=20
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  drivers/pinctrl/Kconfig             |  14 +
>  drivers/pinctrl/Makefile            |   1 +
>  drivers/pinctrl/pinctrl-sf19a2890.c | 536 ++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 551 insertions(+)
>=20
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index dc7138302..1321eb679 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -562,6 +562,20 @@ config PINCTRL_SCMI
>  	  It uses SCMI Message Protocol to interact with the
>  	  firmware providing all the pinctrl controls.
> =20
> +config PINCTRL_SF19A2890
> +	tristate "Siflower SF19A2890 pin controller"
> +	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
> +	depends on OF
> +	default MACH_SIFLOWER_MIPS
> +	select PINMUX
> +	select PINCONF
> +	select GENERIC_PINCONF
> +	help
> +	  Support for the pin controller of the Siflower SF19A2890 SoC. It
> +	  selects the function of each pin and sets its bias, input enable,
> +	  Schmitt trigger and drive strength. The SoC's GPIO controller uses
> +	  it to switch pins to GPIO.
> +
>  config PINCTRL_SINGLE
>  	tristate "One-register-per-pin type device tree based pinctrl driver"
>  	depends on OF
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index ce0825f4f..2cb2c229c 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -57,6 +57,7 @@ obj-$(CONFIG_PINCTRL_RK805)	+=3D pinctrl-rk805.o
>  obj-$(CONFIG_PINCTRL_ROCKCHIP)	+=3D pinctrl-rockchip.o
>  obj-$(CONFIG_PINCTRL_RP1)       +=3D pinctrl-rp1.o
>  obj-$(CONFIG_PINCTRL_SCMI)	+=3D pinctrl-scmi.o
> +obj-$(CONFIG_PINCTRL_SF19A2890)	+=3D pinctrl-sf19a2890.o
>  obj-$(CONFIG_PINCTRL_SINGLE)	+=3D pinctrl-single.o
>  obj-$(CONFIG_PINCTRL_ST) 	+=3D pinctrl-st.o
>  obj-$(CONFIG_PINCTRL_STMFX) 	+=3D pinctrl-stmfx.o
> diff --git a/drivers/pinctrl/pinctrl-sf19a2890.c b/drivers/pinctrl/pinctr=
l-sf19a2890.c
> new file mode 100644
> index 000000000..dbc8ac34b
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-sf19a2890.c
> @@ -0,0 +1,536 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Siflower SF19A2890 pin controller
> + *
> + * Based on the OpenWrt driver by Chuanhong Guo <gch981213@gmail.com>,
> + * which was based on the Broadcom BCM2835 GPIO unit driver:
> + * Copyright (C) 2012 Chris Boot, Simon Arlott, Stephen Warren
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/seq_file.h>
> +
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +
> +#define SF19A2890_NUM_PINS	49
> +
> +/* Pad configuration */
> +#define REG_PC(pin)		((pin) * 0x8)
> +#define  PC_OEN			BIT(7)
> +#define  PC_ST			BIT(6)
> +#define  PC_IE			BIT(5)
> +#define  PC_PD			BIT(4)
> +#define  PC_PU			BIT(3)
> +#define  PC_DS			GENMASK(2, 0)
> +
> +#define DRIVE_MIN_MA		6
> +#define DRIVE_STEP_MA		3
> +
> +/*
> + * Pin mux. With FUNC_SW clear, the pad's output enable is forced by
> + * PC_OEN; with it set, the GPIO or the function drives it. FMUX_SEL pic=
ks
> + * the GPIO, and MODE the function, when FMUX_SEL is clear.
> + */
> +#define REG_PMX(pin)		((pin) * 0x8 + 0x4)
> +#define  PMX_FUNC_SW		BIT(3)
> +#define  PMX_FMUX_SEL		BIT(2)
> +#define  PMX_MODE		GENMASK(1, 0)
> +
> +struct sf19a2890_pinctrl {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct pinctrl_dev *pctl;
> +};
> +
> +static const struct pinctrl_pin_desc sf19a2890_pins[] =3D {
> +	PINCTRL_PIN(0, "JTAG_TDO"),
> +	PINCTRL_PIN(1, "JTAG_TDI"),
> +	PINCTRL_PIN(2, "JTAG_TMS"),
> +	PINCTRL_PIN(3, "JTAG_TCK"),
> +	PINCTRL_PIN(4, "JTAG_RST"),
> +	PINCTRL_PIN(5, "SPI_TXD"),
> +	PINCTRL_PIN(6, "SPI_RXD"),
> +	PINCTRL_PIN(7, "SPI_CLK"),
> +	PINCTRL_PIN(8, "SPI_CSN"),
> +	PINCTRL_PIN(9, "UART_TX"),
> +	PINCTRL_PIN(10, "UART_RX"),
> +	PINCTRL_PIN(11, "I2C_DAT"),
> +	PINCTRL_PIN(12, "I2C_CLK"),
> +	PINCTRL_PIN(13, "RGMII_GTX_CLK"),
> +	PINCTRL_PIN(14, "RGMII_TXCLK"),
> +	PINCTRL_PIN(15, "RGMII_TXD0"),
> +	PINCTRL_PIN(16, "RGMII_TXD1"),
> +	PINCTRL_PIN(17, "RGMII_TXD2"),
> +	PINCTRL_PIN(18, "RGMII_TXD3"),
> +	PINCTRL_PIN(19, "RGMII_TXCTL"),
> +	PINCTRL_PIN(20, "RGMII_RXCLK"),
> +	PINCTRL_PIN(21, "RGMII_RXD0"),
> +	PINCTRL_PIN(22, "RGMII_RXD1"),
> +	PINCTRL_PIN(23, "RGMII_RXD2"),
> +	PINCTRL_PIN(24, "RGMII_RXD3"),
> +	PINCTRL_PIN(25, "RGMII_RXCTL"),
> +	PINCTRL_PIN(26, "RGMII_COL"),
> +	PINCTRL_PIN(27, "RGMII_CRS"),
> +	PINCTRL_PIN(28, "RGMII_MDC"),
> +	PINCTRL_PIN(29, "RGMII_MDIO"),
> +	PINCTRL_PIN(30, "HB0_PA_EN"),
> +	PINCTRL_PIN(31, "HB0_LNA_EN"),
> +	PINCTRL_PIN(32, "HB0_SW_CTRL0"),
> +	PINCTRL_PIN(33, "HB0_SW_CTRL1"),
> +	PINCTRL_PIN(34, "HB1_PA_EN"),
> +	PINCTRL_PIN(35, "HB1_LNA_EN"),
> +	PINCTRL_PIN(36, "HB1_SW_CTRL0"),
> +	PINCTRL_PIN(37, "HB1_SW_CTRL1"),
> +	PINCTRL_PIN(38, "LB0_PA_EN"),
> +	PINCTRL_PIN(39, "LB0_LNA_EN"),
> +	PINCTRL_PIN(40, "LB0_SW_CTRL0"),
> +	PINCTRL_PIN(41, "LB0_SW_CTRL1"),
> +	PINCTRL_PIN(42, "LB1_PA_EN"),
> +	PINCTRL_PIN(43, "LB1_LNA_EN"),
> +	PINCTRL_PIN(44, "LB1_SW_CTRL0"),
> +	PINCTRL_PIN(45, "LB1_SW_CTRL1"),
> +	PINCTRL_PIN(46, "CLK_OUT"),
> +	PINCTRL_PIN(47, "EXT_CLK_IN"),
> +	PINCTRL_PIN(48, "DRVVBUS0"),
> +};
> +
> +static_assert(ARRAY_SIZE(sf19a2890_pins) =3D=3D SF19A2890_NUM_PINS);
> +
> +/* A pin that a function can use, and the mux mode that selects it */
> +struct sf19a2890_func_pin {
> +	unsigned int pin;
> +	u8 mode;
> +};
> +
> +struct sf19a2890_function {
> +	const char *name;
> +	const char * const *groups;
> +	const struct sf19a2890_func_pin *pins;
> +	unsigned int npins;
> +};
> +
> +/*
> + * Each pin is a group of its own, named after the pin. A function's gro=
up
> + * list names the pins it can use, in the same order as its pin table.
> + */
> +#define SF19A2890_FUNCTION(_name, ...)					\
> +	static const struct sf19a2890_func_pin sf19a2890_##_name##_pins[] =3D {=
 \
> +		__VA_ARGS__						\
> +	}
> +
> +#define PIN_MODE(_pin, _mode)	{ .pin =3D (_pin), .mode =3D (_mode) }
> +
> +SF19A2890_FUNCTION(jtag, PIN_MODE(0, 0), PIN_MODE(1, 0), PIN_MODE(2, 0),
> +		   PIN_MODE(3, 0), PIN_MODE(4, 0));
> +static const char * const sf19a2890_jtag_groups[] =3D {
> +	"JTAG_TDO", "JTAG_TDI", "JTAG_TMS", "JTAG_TCK", "JTAG_RST",
> +};
> +
> +SF19A2890_FUNCTION(uart1, PIN_MODE(0, 1), PIN_MODE(1, 1), PIN_MODE(2, 1),
> +		   PIN_MODE(3, 1));
> +static const char * const sf19a2890_uart1_groups[] =3D {
> +	"JTAG_TDO", "JTAG_TDI", "JTAG_TMS", "JTAG_TCK",
> +};
> +
> +SF19A2890_FUNCTION(pwm0, PIN_MODE(3, 3));
> +static const char * const sf19a2890_pwm0_groups[] =3D { "JTAG_TCK" };
> +
> +SF19A2890_FUNCTION(pwm1, PIN_MODE(4, 2));
> +static const char * const sf19a2890_pwm1_groups[] =3D { "JTAG_RST" };
> +
> +SF19A2890_FUNCTION(spi, PIN_MODE(5, 0), PIN_MODE(6, 0), PIN_MODE(7, 0),
> +		   PIN_MODE(8, 0));
> +static const char * const sf19a2890_spi_groups[] =3D {
> +	"SPI_TXD", "SPI_RXD", "SPI_CLK", "SPI_CSN",
> +};
> +
> +/* UART0's CTS and RTS are on the I2C pins */
> +SF19A2890_FUNCTION(uart0, PIN_MODE(9, 0), PIN_MODE(10, 0), PIN_MODE(11, =
0),
> +		   PIN_MODE(12, 0));
> +static const char * const sf19a2890_uart0_groups[] =3D {
> +	"UART_TX", "UART_RX", "I2C_DAT", "I2C_CLK",
> +};
> +
> +SF19A2890_FUNCTION(uart2, PIN_MODE(11, 1), PIN_MODE(12, 1));
> +static const char * const sf19a2890_uart2_groups[] =3D { "I2C_DAT", "I2C=
_CLK" };
> +
> +SF19A2890_FUNCTION(i2c0, PIN_MODE(11, 2), PIN_MODE(12, 2));
> +static const char * const sf19a2890_i2c0_groups[] =3D { "I2C_DAT", "I2C_=
CLK" };
> +
> +SF19A2890_FUNCTION(rgmii, PIN_MODE(14, 0), PIN_MODE(15, 0), PIN_MODE(16,=
 0),
> +		   PIN_MODE(17, 0), PIN_MODE(18, 0), PIN_MODE(19, 0),
> +		   PIN_MODE(20, 0), PIN_MODE(21, 0), PIN_MODE(22, 0),
> +		   PIN_MODE(23, 0), PIN_MODE(24, 0), PIN_MODE(25, 0));
> +static const char * const sf19a2890_rgmii_groups[] =3D {
> +	"RGMII_TXCLK", "RGMII_TXD0", "RGMII_TXD1", "RGMII_TXD2",
> +	"RGMII_TXD3", "RGMII_TXCTL", "RGMII_RXCLK", "RGMII_RXD0",
> +	"RGMII_RXD1", "RGMII_RXD2", "RGMII_RXD3", "RGMII_RXCTL",
> +};
> +
> +SF19A2890_FUNCTION(mdio, PIN_MODE(28, 0), PIN_MODE(29, 0));
> +static const char * const sf19a2890_mdio_groups[] =3D {
> +	"RGMII_MDC", "RGMII_MDIO",
> +};
> +
> +/* The power amplifier, LNA and antenna switch controls of the radios */
> +SF19A2890_FUNCTION(wlan, PIN_MODE(30, 0), PIN_MODE(31, 0), PIN_MODE(32, =
0),
> +		   PIN_MODE(33, 0), PIN_MODE(34, 0), PIN_MODE(35, 0),
> +		   PIN_MODE(36, 0), PIN_MODE(37, 0), PIN_MODE(38, 0),
> +		   PIN_MODE(39, 0), PIN_MODE(40, 0), PIN_MODE(41, 0),
> +		   PIN_MODE(42, 0), PIN_MODE(43, 0), PIN_MODE(44, 0),
> +		   PIN_MODE(45, 0));
> +static const char * const sf19a2890_wlan_groups[] =3D {
> +	"HB0_PA_EN", "HB0_LNA_EN", "HB0_SW_CTRL0", "HB0_SW_CTRL1",
> +	"HB1_PA_EN", "HB1_LNA_EN", "HB1_SW_CTRL0", "HB1_SW_CTRL1",
> +	"LB0_PA_EN", "LB0_LNA_EN", "LB0_SW_CTRL0", "LB0_SW_CTRL1",
> +	"LB1_PA_EN", "LB1_LNA_EN", "LB1_SW_CTRL0", "LB1_SW_CTRL1",
> +};
> +
> +#define FUNCTION(_name)							\
> +	{								\
> +		.name =3D #_name,						\
> +		.groups =3D sf19a2890_##_name##_groups,			\
> +		.pins =3D sf19a2890_##_name##_pins,			\
> +		.npins =3D ARRAY_SIZE(sf19a2890_##_name##_pins),		\
> +	}
> +
> +static const struct sf19a2890_function sf19a2890_functions[] =3D {
> +	FUNCTION(i2c0),
> +	FUNCTION(jtag),
> +	FUNCTION(mdio),
> +	FUNCTION(pwm0),
> +	FUNCTION(pwm1),
> +	FUNCTION(rgmii),
> +	FUNCTION(spi),
> +	FUNCTION(uart0),
> +	FUNCTION(uart1),
> +	FUNCTION(uart2),
> +	FUNCTION(wlan),
> +};
> +
> +static u32 sf19a2890_pinctrl_read(struct sf19a2890_pinctrl *pc, u32 reg)
> +{
> +	return readl(pc->base + reg);
> +}
> +
> +static void sf19a2890_pinctrl_write(struct sf19a2890_pinctrl *pc, u32 re=
g,
> +				    u32 val)
> +{
> +	writel(val, pc->base + reg);
> +}
> +
> +static void sf19a2890_pinctrl_rmw(struct sf19a2890_pinctrl *pc, u32 reg,
> +				  u32 clr, u32 set)
> +{
> +	u32 val =3D sf19a2890_pinctrl_read(pc, reg);
> +
> +	sf19a2890_pinctrl_write(pc, reg, (val & ~clr) | set);
> +}
> +
> +static int sf19a2890_get_groups_count(struct pinctrl_dev *pctldev)
> +{
> +	return SF19A2890_NUM_PINS;
> +}
> +
> +static const char *sf19a2890_get_group_name(struct pinctrl_dev *pctldev,
> +					    unsigned int selector)
> +{
> +	return sf19a2890_pins[selector].name;
> +}
> +
> +static int sf19a2890_get_group_pins(struct pinctrl_dev *pctldev,
> +				    unsigned int selector,
> +				    const unsigned int **pins,
> +				    unsigned int *num_pins)
> +{
> +	*pins =3D &sf19a2890_pins[selector].number;
> +	*num_pins =3D 1;
> +
> +	return 0;
> +}
> +
> +static void sf19a2890_pin_dbg_show(struct pinctrl_dev *pctldev,
> +				   struct seq_file *s, unsigned int offset)
> +{
> +	struct sf19a2890_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
> +	u32 conf =3D sf19a2890_pinctrl_read(pc, REG_PC(offset));
> +	u32 mux =3D sf19a2890_pinctrl_read(pc, REG_PMX(offset));
> +
> +	if (!(mux & PMX_FUNC_SW))
> +		seq_printf(s, "forced %s", conf & PC_OEN ? "input" : "output");
> +	else if (mux & PMX_FMUX_SEL)
> +		seq_puts(s, "gpio");
> +	else
> +		seq_printf(s, "mode %lu", FIELD_GET(PMX_MODE, mux));
> +
> +	seq_printf(s, "%s%s%s%s drive %lu mA",
> +		   conf & PC_IE ? " input" : "",
> +		   conf & PC_ST ? " schmitt" : "",
> +		   conf & PC_PU ? " pull-up" : "",
> +		   conf & PC_PD ? " pull-down" : "",
> +		   DRIVE_MIN_MA + FIELD_GET(PC_DS, conf) * DRIVE_STEP_MA);
> +}
> +
> +static const struct pinctrl_ops sf19a2890_pctl_ops =3D {
> +	.get_groups_count =3D sf19a2890_get_groups_count,
> +	.get_group_name =3D sf19a2890_get_group_name,
> +	.get_group_pins =3D sf19a2890_get_group_pins,
> +	.pin_dbg_show =3D sf19a2890_pin_dbg_show,
> +	.dt_node_to_map =3D pinconf_generic_dt_node_to_map_all,
> +	.dt_free_map =3D pinconf_generic_dt_free_map,
> +};

Can you just use pinctrl_generic_pins_function_dt_node_to_map here and
dynamically create the groups at runtime (and also make use of the
generic get_groups_* implementations)?

--BcSoKk5UO7VHsm1e
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauvFowAKCRB4tDGHoIJi
0o0DAQCiMejiCw3pagDiI5Ajn4H28DJQ/+flLq13G9hW22+NLAEAsjGgjKLZqkvL
Exk1AS9yzT3O13WBHuNbrApCsa6EHgI=
=cQCD
-----END PGP SIGNATURE-----

--BcSoKk5UO7VHsm1e--
