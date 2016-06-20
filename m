From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Add Intel Merrifield pin
 controller support
Date: Mon, 20 Jun 2016 12:20:07 +0300
Message-ID: <20160620092007.GB1739@lahna.fi.intel.com>
References: <1466351099-22282-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:2144 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753525AbcFTJVJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 20 Jun 2016 05:21:09 -0400
Content-Disposition: inline
In-Reply-To: <1466351099-22282-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Sun, Jun 19, 2016 at 06:44:59PM +0300, Andy Shevchenko wrote:
> This driver adds pinctrl support for Intel Merrifield. The IP block which is
> called Family-Level Interface Shim is a separate entity in SoC. The GPIO driver
> (gpio-intel-mid.c) will be updated accordingly to support pinctrl interface.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks pretty good already. I have couple of comments, though.

> ---
>  drivers/pinctrl/intel/Kconfig              |  11 +
>  drivers/pinctrl/intel/Makefile             |   1 +
>  drivers/pinctrl/intel/pinctrl-merrifield.c | 908 +++++++++++++++++++++++++++++
>  3 files changed, 920 insertions(+)
>  create mode 100644 drivers/pinctrl/intel/pinctrl-merrifield.c
> 
> diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
> index 1c74e03..7ad5901 100644
> --- a/drivers/pinctrl/intel/Kconfig
> +++ b/drivers/pinctrl/intel/Kconfig
> @@ -29,6 +29,17 @@ config PINCTRL_CHERRYVIEW
>  	  Cherryview/Braswell pinctrl driver provides an interface that
>  	  allows configuring of SoC pins and using them as GPIOs.
>  
> +config PINCTRL_MERRIFIELD
> +	tristate "Intel Merrifield FLIS driver"

I would not mention "FLIS" here. Nobody knows what it is. Just call it
pinctrl.

> +	depends on X86_INTEL_MID
> +	select PINMUX
> +	select PINCONF
> +	select GENERIC_PINCONF
> +	help
> +	  Merrifield Family-Level Interface Shim (FLIS) driver provides an

Here it is ok.

> +	  interface that allows configuring of SoC pins and using them as
> +	  GPIOs.
> +
>  config PINCTRL_INTEL
>  	tristate
>  	select PINMUX
> diff --git a/drivers/pinctrl/intel/Makefile b/drivers/pinctrl/intel/Makefile
> index 03bc68e..3080307 100644
> --- a/drivers/pinctrl/intel/Makefile
> +++ b/drivers/pinctrl/intel/Makefile
> @@ -2,6 +2,7 @@
>  
>  obj-$(CONFIG_PINCTRL_BAYTRAIL)		+= pinctrl-baytrail.o
>  obj-$(CONFIG_PINCTRL_CHERRYVIEW)	+= pinctrl-cherryview.o
> +obj-$(CONFIG_PINCTRL_MERRIFIELD)	+= pinctrl-merrifield.o
>  obj-$(CONFIG_PINCTRL_INTEL)		+= pinctrl-intel.o
>  obj-$(CONFIG_PINCTRL_BROXTON)		+= pinctrl-broxton.o
>  obj-$(CONFIG_PINCTRL_SUNRISEPOINT)	+= pinctrl-sunrisepoint.o
> diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
> new file mode 100644
> index 0000000..b49af3b
> --- /dev/null
> +++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
> @@ -0,0 +1,908 @@
> +/*
> + * Intel Merrifield SoC Family-Level Interface Shim (FLIS) driver

Also here call it pinctrl instead. You can mention that the underlying
hardware block is called FLIS.

> + *
> + * Copyright (C) 2016, Intel Corporation
> + * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +
> +#include "pinctrl-intel.h"
> +
> +#define MRFLD_FAMILY_NR			64
> +#define MRFLD_FAMILY_LEN		0x400
> +
> +#define SLEW_OFFSET			0x000
> +#define BUFCFG_OFFSET			0x100
> +#define MISC_OFFSET			0x300
> +
> +#define BUFCFG_PINMODE_SHIFT		0
> +#define BUFCFG_PINMODE_MASK		GENMASK(2, 0)
> +#define BUFCFG_PUPD_VAL_SHIFT		4
> +#define BUFCFG_PUPD_VAL_MASK		GENMASK(5, 4)
> +#define BUFCFG_PUPD_VAL_2K		0
> +#define BUFCFG_PUPD_VAL_20K		1
> +#define BUFCFG_PUPD_VAL_50K		2
> +#define BUFCFG_PUPD_VAL_910		3
> +#define BUFCFG_PU_EN			BIT(8)
> +#define BUFCFG_PD_EN			BIT(9)
> +#define BUFCFG_OD_EN			BIT(21)
> +
> +/**
> + * struct mrfld_family - Intel pin family description
> + * @barno: MMIO BAR number where registers for this family reside
> + * @pin_base: Starting pin of pins in this family
> + * @npins: Number of pins in this family
> + * @protected: True if family is protected by access
> + * @regs: family specific common registers
> + */
> +struct mrfld_family {
> +	unsigned barno;
> +	unsigned pin_base;
> +	size_t npins;
> +	bool protected;
> +	void __iomem *regs;
> +};
> +
> +#define MRFLD_FAMILY(b, s, e)				\
> +	{						\
> +		.barno = (b),				\
> +		.pin_base = (s),			\
> +		.npins = (e) - (s) + 1,			\
> +	}
> +
> +#define MRFLD_FAMILY_PROTECTED(b, s, e)			\
> +	{						\
> +		.barno = (b),				\
> +		.pin_base = (s),			\
> +		.npins = (e) - (s) + 1,			\
> +		.protected = true,			\
> +	}
> +
> +static const struct pinctrl_pin_desc mrfld_pins[] = {
> +	/* Family 0: OCP2SSC (0 pins) */
> +	/* Family 1: ULPI (13 pins) */
> +	PINCTRL_PIN(0, "USB_ULPI_0_CLK"),
> +	PINCTRL_PIN(1, "USB_ULPI_0_DATA_0"),
> +	PINCTRL_PIN(2, "USB_ULPI_0_DATA_1"),
> +	PINCTRL_PIN(3, "USB_ULPI_0_DATA_2"),
> +	PINCTRL_PIN(4, "USB_ULPI_0_DATA_3"),
> +	PINCTRL_PIN(5, "USB_ULPI_0_DATA_4"),
> +	PINCTRL_PIN(6, "USB_ULPI_0_DATA_5"),
> +	PINCTRL_PIN(7, "USB_ULPI_0_DATA_6"),
> +	PINCTRL_PIN(8, "USB_ULPI_0_DATA_7"),
> +	PINCTRL_PIN(9, "USB_ULPI_0_DIR"),
> +	PINCTRL_PIN(10, "USB_ULPI_0_NXT"),
> +	PINCTRL_PIN(11, "USB_ULPI_0_REFCLK"),
> +	PINCTRL_PIN(12, "USB_ULPI_0_STP"),
> +	/* Family 2: eMMC (24 pins) */
> +	PINCTRL_PIN(13, "EMMC_0_CLK"),
> +	PINCTRL_PIN(14, "EMMC_0_CMD"),
> +	PINCTRL_PIN(15, "EMMC_0_D_0"),
> +	PINCTRL_PIN(16, "EMMC_0_D_1"),
> +	PINCTRL_PIN(17, "EMMC_0_D_2"),
> +	PINCTRL_PIN(18, "EMMC_0_D_3"),
> +	PINCTRL_PIN(19, "EMMC_0_D_4"),
> +	PINCTRL_PIN(20, "EMMC_0_D_5"),
> +	PINCTRL_PIN(21, "EMMC_0_D_6"),
> +	PINCTRL_PIN(22, "EMMC_0_D_7"),
> +	PINCTRL_PIN(23, "EMMC_0_RST_B"),
> +	PINCTRL_PIN(24, "GP_EMMC_1_CLK"),
> +	PINCTRL_PIN(25, "GP_EMMC_1_CMD"),
> +	PINCTRL_PIN(26, "GP_EMMC_1_D_0"),
> +	PINCTRL_PIN(27, "GP_EMMC_1_D_1"),
> +	PINCTRL_PIN(28, "GP_EMMC_1_D_2"),
> +	PINCTRL_PIN(29, "GP_EMMC_1_D_3"),
> +	PINCTRL_PIN(30, "GP_EMMC_1_D_4"),
> +	PINCTRL_PIN(31, "GP_EMMC_1_D_5"),
> +	PINCTRL_PIN(32, "GP_EMMC_1_D_6"),
> +	PINCTRL_PIN(33, "GP_EMMC_1_D_7"),
> +	PINCTRL_PIN(34, "GP_EMMC_1_RST_B"),
> +	PINCTRL_PIN(35, "GP_28"),
> +	PINCTRL_PIN(36, "GP_29"),
> +	/* Family 3: SDIO (20 pins) */
> +	PINCTRL_PIN(37, "GP_SDIO_0_CD_B"),
> +	PINCTRL_PIN(38, "GP_SDIO_0_CLK"),
> +	PINCTRL_PIN(39, "GP_SDIO_0_CMD"),
> +	PINCTRL_PIN(40, "GP_SDIO_0_DAT_0"),
> +	PINCTRL_PIN(41, "GP_SDIO_0_DAT_1"),
> +	PINCTRL_PIN(42, "GP_SDIO_0_DAT_2"),
> +	PINCTRL_PIN(43, "GP_SDIO_0_DAT_3"),
> +	PINCTRL_PIN(44, "GP_SDIO_0_LVL_CLK_FB"),
> +	PINCTRL_PIN(45, "GP_SDIO_0_LVL_CMD_DIR"),
> +	PINCTRL_PIN(46, "GP_SDIO_0_LVL_DAT_DIR"),
> +	PINCTRL_PIN(47, "GP_SDIO_0_LVL_SEL"),
> +	PINCTRL_PIN(48, "GP_SDIO_0_POWERDOWN_B"),
> +	PINCTRL_PIN(49, "GP_SDIO_0_WP"),
> +	PINCTRL_PIN(50, "GP_SDIO_1_CLK"),
> +	PINCTRL_PIN(51, "GP_SDIO_1_CMD"),
> +	PINCTRL_PIN(52, "GP_SDIO_1_DAT_0"),
> +	PINCTRL_PIN(53, "GP_SDIO_1_DAT_1"),
> +	PINCTRL_PIN(54, "GP_SDIO_1_DAT_2"),
> +	PINCTRL_PIN(55, "GP_SDIO_1_DAT_3"),
> +	PINCTRL_PIN(56, "GP_SDIO_1_POWERDOWN_B"),
> +	/* Family 4: HSI (8 pins) */
> +	PINCTRL_PIN(57, "MHSI_ACDATA"),
> +	PINCTRL_PIN(58, "MHSI_ACFLAG"),
> +	PINCTRL_PIN(59, "MHSI_ACREADY"),
> +	PINCTRL_PIN(60, "MHSI_ACWAKE"),
> +	PINCTRL_PIN(61, "MHSI_CADATA"),
> +	PINCTRL_PIN(62, "MHSI_CAFLAG"),
> +	PINCTRL_PIN(63, "MHSI_CAREADY"),
> +	PINCTRL_PIN(64, "MHSI_CAWAKE"),
> +	/* Family 5: SSP Audio (14 pins) */
> +	PINCTRL_PIN(65, "GP_MSLIM_0_BCLK"),
> +	PINCTRL_PIN(66, "GP_MSLIM_0_BDAT"),
> +	PINCTRL_PIN(67, "GP_SSP_0_CLK"),
> +	PINCTRL_PIN(68, "GP_SSP_0_FS"),
> +	PINCTRL_PIN(69, "GP_SSP_0_RXD"),
> +	PINCTRL_PIN(70, "GP_SSP_0_TXD"),
> +	PINCTRL_PIN(71, "GP_SSP_1_CLK"),
> +	PINCTRL_PIN(72, "GP_SSP_1_FS"),
> +	PINCTRL_PIN(73, "GP_SSP_1_RXD"),
> +	PINCTRL_PIN(74, "GP_SSP_1_TXD"),
> +	PINCTRL_PIN(75, "GP_SSP_2_CLK"),
> +	PINCTRL_PIN(76, "GP_SSP_2_FS"),
> +	PINCTRL_PIN(77, "GP_SSP_2_RXD"),
> +	PINCTRL_PIN(78, "GP_SSP_2_TXD"),
> +	/* Family 6: GP SSP (22 pins) */
> +	PINCTRL_PIN(79, "GP_SSP_3_CLK"),
> +	PINCTRL_PIN(80, "GP_SSP_3_FS"),
> +	PINCTRL_PIN(81, "GP_SSP_3_RXD"),
> +	PINCTRL_PIN(82, "GP_SSP_3_TXD"),
> +	PINCTRL_PIN(83, "GP_SSP_4_CLK"),
> +	PINCTRL_PIN(84, "GP_SSP_4_FS_0"),
> +	PINCTRL_PIN(85, "GP_SSP_4_FS_1"),
> +	PINCTRL_PIN(86, "GP_SSP_4_FS_2"),
> +	PINCTRL_PIN(87, "GP_SSP_4_FS_3"),
> +	PINCTRL_PIN(88, "GP_SSP_4_RXD"),
> +	PINCTRL_PIN(89, "GP_SSP_4_TXD"),
> +	PINCTRL_PIN(90, "GP_SSP_5_CLK"),
> +	PINCTRL_PIN(91, "GP_SSP_5_FS_0"),
> +	PINCTRL_PIN(92, "GP_SSP_5_FS_1"),
> +	PINCTRL_PIN(93, "GP_SSP_5_FS_2"),
> +	PINCTRL_PIN(94, "GP_SSP_5_FS_3"),
> +	PINCTRL_PIN(95, "GP_SSP_5_RXD"),
> +	PINCTRL_PIN(96, "GP_SSP_5_TXD"),
> +	PINCTRL_PIN(97, "GP_SSP_6_CLK"),
> +	PINCTRL_PIN(98, "GP_SSP_6_FS"),
> +	PINCTRL_PIN(99, "GP_SSP_6_RXD"),
> +	PINCTRL_PIN(100, "GP_SSP_6_TXD"),
> +	/* Family 7: I2C (14 pins) */
> +	PINCTRL_PIN(101, "GP_I2C_1_SCL"),
> +	PINCTRL_PIN(102, "GP_I2C_1_SDA"),
> +	PINCTRL_PIN(103, "GP_I2C_2_SCL"),
> +	PINCTRL_PIN(104, "GP_I2C_2_SDA"),
> +	PINCTRL_PIN(105, "GP_I2C_3_SCL"),
> +	PINCTRL_PIN(106, "GP_I2C_3_SDA"),
> +	PINCTRL_PIN(107, "GP_I2C_4_SCL"),
> +	PINCTRL_PIN(108, "GP_I2C_4_SDA"),
> +	PINCTRL_PIN(109, "GP_I2C_5_SCL"),
> +	PINCTRL_PIN(110, "GP_I2C_5_SDA"),
> +	PINCTRL_PIN(111, "GP_I2C_6_SCL"),
> +	PINCTRL_PIN(112, "GP_I2C_6_SDA"),
> +	PINCTRL_PIN(113, "GP_I2C_7_SCL"),
> +	PINCTRL_PIN(114, "GP_I2C_7_SDA"),
> +	/* Family 8: UART (12 pins) */
> +	PINCTRL_PIN(115, "GP_UART_0_CTS"),
> +	PINCTRL_PIN(116, "GP_UART_0_RTS"),
> +	PINCTRL_PIN(117, "GP_UART_0_RX"),
> +	PINCTRL_PIN(118, "GP_UART_0_TX"),
> +	PINCTRL_PIN(119, "GP_UART_1_CTS"),
> +	PINCTRL_PIN(120, "GP_UART_1_RTS"),
> +	PINCTRL_PIN(121, "GP_UART_1_RX"),
> +	PINCTRL_PIN(122, "GP_UART_1_TX"),
> +	PINCTRL_PIN(123, "GP_UART_2_CTS"),
> +	PINCTRL_PIN(124, "GP_UART_2_RTS"),
> +	PINCTRL_PIN(125, "GP_UART_2_RX"),
> +	PINCTRL_PIN(126, "GP_UART_2_TX"),
> +	/* Family 9: GPIO South (19 pins) */
> +	PINCTRL_PIN(127, "GP_13"),
> +	PINCTRL_PIN(128, "GP_14"),
> +	PINCTRL_PIN(129, "GP_15"),
> +	PINCTRL_PIN(130, "GP_16"),
> +	PINCTRL_PIN(131, "GP_17"),
> +	PINCTRL_PIN(132, "GP_18"),
> +	PINCTRL_PIN(133, "GP_19"),
> +	PINCTRL_PIN(134, "GP_20"),
> +	PINCTRL_PIN(135, "GP_21"),
> +	PINCTRL_PIN(136, "GP_22"),
> +	PINCTRL_PIN(137, "GP_23"),
> +	PINCTRL_PIN(138, "GP_24"),
> +	PINCTRL_PIN(139, "GP_25"),
> +	PINCTRL_PIN(140, "GP_FAST_INT_0"),
> +	PINCTRL_PIN(141, "GP_FAST_INT_1"),
> +	PINCTRL_PIN(142, "GP_FAST_INT_2"),
> +	PINCTRL_PIN(143, "GP_FAST_INT_3"),
> +	PINCTRL_PIN(144, "GP_PWM_0"),
> +	PINCTRL_PIN(145, "GP_PWM_1"),
> +	/* Family 10: Camera Sideband (12 pins) */
> +	PINCTRL_PIN(146, "GP_CAMERASB_0"),
> +	PINCTRL_PIN(147, "GP_CAMERASB_1"),
> +	PINCTRL_PIN(148, "GP_CAMERASB_2"),
> +	PINCTRL_PIN(149, "GP_CAMERASB_3"),
> +	PINCTRL_PIN(150, "GP_CAMERASB_4"),
> +	PINCTRL_PIN(151, "GP_CAMERASB_5"),
> +	PINCTRL_PIN(152, "GP_CAMERASB_6"),
> +	PINCTRL_PIN(153, "GP_CAMERASB_7"),
> +	PINCTRL_PIN(154, "GP_CAMERASB_8"),
> +	PINCTRL_PIN(155, "GP_CAMERASB_9"),
> +	PINCTRL_PIN(156, "GP_CAMERASB_10"),
> +	PINCTRL_PIN(157, "GP_CAMERASB_11"),
> +	/* Family 11: Clock (22 pins) */
> +	PINCTRL_PIN(158, "GP_CLKPH_0"),
> +	PINCTRL_PIN(159, "GP_CLKPH_1"),
> +	PINCTRL_PIN(160, "GP_CLKPH_2"),
> +	PINCTRL_PIN(161, "GP_CLKPH_3"),
> +	PINCTRL_PIN(162, "GP_CLKPH_4"),
> +	PINCTRL_PIN(163, "GP_CLKPH_5"),
> +	PINCTRL_PIN(164, "GP_HDMI_HPD"),
> +	PINCTRL_PIN(165, "GP_INTD_DSI_TE1"),
> +	PINCTRL_PIN(166, "GP_INTD_DSI_TE2"),
> +	PINCTRL_PIN(167, "OSC_CLK_CTRL_0"),
> +	PINCTRL_PIN(168, "OSC_CLK_CTRL_1"),
> +	PINCTRL_PIN(169, "OSC_CLK_OUT_0"),
> +	PINCTRL_PIN(170, "OSC_CLK_OUT_1"),
> +	PINCTRL_PIN(171, "OSC_CLK_OUT_2"),
> +	PINCTRL_PIN(172, "OSC_CLK_OUT_3"),
> +	PINCTRL_PIN(173, "OSC_CLK_OUT_4"),
> +	PINCTRL_PIN(174, "RESETOUT_B"),
> +	PINCTRL_PIN(175, "XXPMODE"),
> +	PINCTRL_PIN(176, "XXPRDY"),
> +	PINCTRL_PIN(177, "XXPREQ_B"),
> +	PINCTRL_PIN(178, "GP_26"),
> +	PINCTRL_PIN(179, "GP_27"),
> +	/* Family 12: MSIC (15 pins) */
> +	PINCTRL_PIN(180, "I2C_0_SCL"),
> +	PINCTRL_PIN(181, "I2C_0_SDA"),
> +	PINCTRL_PIN(182, "IERR_B"),
> +	PINCTRL_PIN(183, "JTAG_TCKC"),
> +	PINCTRL_PIN(184, "JTAG_TDIC"),
> +	PINCTRL_PIN(185, "JTAG_TDOC"),
> +	PINCTRL_PIN(186, "JTAG_TMSC"),
> +	PINCTRL_PIN(187, "JTAG_TRST_B"),
> +	PINCTRL_PIN(188, "PROCHOT_B"),
> +	PINCTRL_PIN(189, "RTC_CLK"),
> +	PINCTRL_PIN(190, "SVID_ALERT_B"),
> +	PINCTRL_PIN(191, "SVID_VCLK"),
> +	PINCTRL_PIN(192, "SVID_VDIO"),
> +	PINCTRL_PIN(193, "THERMTRIP_B"),
> +	PINCTRL_PIN(194, "STANDBY"),
> +	/* Family 13: Keyboard (20 pins) */
> +	PINCTRL_PIN(195, "GP_KBD_DKIN_0"),
> +	PINCTRL_PIN(196, "GP_KBD_DKIN_1"),
> +	PINCTRL_PIN(197, "GP_KBD_DKIN_2"),
> +	PINCTRL_PIN(198, "GP_KBD_DKIN_3"),
> +	PINCTRL_PIN(199, "GP_KBD_MKIN_0"),
> +	PINCTRL_PIN(200, "GP_KBD_MKIN_1"),
> +	PINCTRL_PIN(201, "GP_KBD_MKIN_2"),
> +	PINCTRL_PIN(202, "GP_KBD_MKIN_3"),
> +	PINCTRL_PIN(203, "GP_KBD_MKIN_4"),
> +	PINCTRL_PIN(204, "GP_KBD_MKIN_5"),
> +	PINCTRL_PIN(205, "GP_KBD_MKIN_6"),
> +	PINCTRL_PIN(206, "GP_KBD_MKIN_7"),
> +	PINCTRL_PIN(207, "GP_KBD_MKOUT_0"),
> +	PINCTRL_PIN(208, "GP_KBD_MKOUT_1"),
> +	PINCTRL_PIN(209, "GP_KBD_MKOUT_2"),
> +	PINCTRL_PIN(210, "GP_KBD_MKOUT_3"),
> +	PINCTRL_PIN(211, "GP_KBD_MKOUT_4"),
> +	PINCTRL_PIN(212, "GP_KBD_MKOUT_5"),
> +	PINCTRL_PIN(213, "GP_KBD_MKOUT_6"),
> +	PINCTRL_PIN(214, "GP_KBD_MKOUT_7"),
> +	/* Family 14: GPIO North (13 pins) */
> +	PINCTRL_PIN(215, "GP_0"),
> +	PINCTRL_PIN(216, "GP_1"),
> +	PINCTRL_PIN(217, "GP_2"),
> +	PINCTRL_PIN(218, "GP_3"),
> +	PINCTRL_PIN(219, "GP_4"),
> +	PINCTRL_PIN(220, "GP_5"),
> +	PINCTRL_PIN(221, "GP_6"),
> +	PINCTRL_PIN(222, "GP_7"),
> +	PINCTRL_PIN(223, "GP_8"),
> +	PINCTRL_PIN(224, "GP_9"),
> +	PINCTRL_PIN(225, "GP_10"),
> +	PINCTRL_PIN(226, "GP_11"),
> +	PINCTRL_PIN(227, "GP_12"),
> +	/* Family 15: PTI (5 pins) */
> +	PINCTRL_PIN(228, "GP_MPTI_CLK"),
> +	PINCTRL_PIN(229, "GP_MPTI_DATA_0"),
> +	PINCTRL_PIN(230, "GP_MPTI_DATA_1"),
> +	PINCTRL_PIN(231, "GP_MPTI_DATA_2"),
> +	PINCTRL_PIN(232, "GP_MPTI_DATA_3"),
> +	/* Family 16: USB3 (0 pins) */
> +	/* Family 17: HSIC (0 pins) */
> +	/* Family 18: Broadcast (0 pins) */
> +};
> +
> +static const unsigned mrfld_pwm0_pins[] = { 144 };
> +static const unsigned mrfld_pwm1_pins[] = { 145 };
> +static const unsigned mrfld_pwm2_pins[] = { 132 };
> +static const unsigned mrfld_pwm3_pins[] = { 133 };
> +
> +static const struct intel_pingroup mrfld_groups[] = {
> +	PIN_GROUP("pwm0_grp", mrfld_pwm0_pins, 1),
> +	PIN_GROUP("pwm1_grp", mrfld_pwm1_pins, 1),
> +	PIN_GROUP("pwm2_grp", mrfld_pwm2_pins, 1),
> +	PIN_GROUP("pwm3_grp", mrfld_pwm3_pins, 1),
> +};
> +
> +static const char * const mrfld_pwm0_groups[] = { "pwm0_grp" };
> +static const char * const mrfld_pwm1_groups[] = { "pwm1_grp" };
> +static const char * const mrfld_pwm2_groups[] = { "pwm2_grp" };
> +static const char * const mrfld_pwm3_groups[] = { "pwm3_grp" };
> +
> +static const struct intel_function mrfld_functions[] = {
> +	FUNCTION("pwm0", mrfld_pwm0_groups),
> +	FUNCTION("pwm1", mrfld_pwm1_groups),
> +	FUNCTION("pwm2", mrfld_pwm2_groups),
> +	FUNCTION("pwm3", mrfld_pwm3_groups),
> +};
> +
> +static const struct mrfld_family mrfld_families[] = {
> +	MRFLD_FAMILY(1, 0, 12),
> +	MRFLD_FAMILY(2, 13, 36),
> +	MRFLD_FAMILY(3, 37, 56),
> +	MRFLD_FAMILY(4, 57, 64),
> +	MRFLD_FAMILY(5, 65, 78),
> +	MRFLD_FAMILY(6, 79, 100),
> +	MRFLD_FAMILY(7, 101, 114),
> +	MRFLD_FAMILY(8, 115, 126),
> +	MRFLD_FAMILY(9, 127, 145),
> +	MRFLD_FAMILY(10, 146, 157),
> +	MRFLD_FAMILY(11, 158, 179),
> +	MRFLD_FAMILY_PROTECTED(12, 180, 194),
> +	MRFLD_FAMILY(13, 195, 214),
> +	MRFLD_FAMILY(14, 215, 227),
> +	MRFLD_FAMILY(15, 228, 232),
> +};

This all looks nice :)

> +
> +/**
> + * struct mrfld_pinctrl_soc_data - Intel pin controller per-SoC configuration
> + * @name: Name of the family
> + * @pins: Array if pins this pinctrl controls
> + * @npins: Number of pins in the array
> + * @groups: Array of pin groups
> + * @ngroups: Number of groups in the array
> + * @functions: Array of functions
> + * @nfunctions: Number of functions in the array
> + * @families: Array of families this pinctrl handles
> + * @nfamilies: Number of families in the array
> + *
> + * The @families is used as a template by the core driver. It will make
> + * copy of all families and fill in rest of the information.
> + */
> +struct mrfld_pinctrl_soc_data {
> +	const char *name;
> +	const struct pinctrl_pin_desc *pins;
> +	size_t npins;
> +	const struct intel_pingroup *groups;
> +	size_t ngroups;
> +	const struct intel_function *functions;
> +	size_t nfunctions;
> +	const struct mrfld_family *families;
> +	size_t nfamilies;
> +};
> +
> +static const struct mrfld_pinctrl_soc_data mrfld_soc_data = {
> +	.pins = mrfld_pins,
> +	.npins = ARRAY_SIZE(mrfld_pins),
> +	.groups = mrfld_groups,
> +	.ngroups = ARRAY_SIZE(mrfld_groups),
> +	.functions = mrfld_functions,
> +	.nfunctions = ARRAY_SIZE(mrfld_functions),
> +	.families = mrfld_families,
> +	.nfamilies = ARRAY_SIZE(mrfld_families),
> +};
> +

These are pointless. There can be only one kind of SoC data in
Merrifield so please drop these. See for example pinctrl-cherryview.c.

> +/**
> + * struct mrfld_pinctrl - Intel Merrifield pinctrl private structure
> + * @dev: Pointer to the device structure
> + * @regs: FLIS registers
> + * @lock: Lock to serialize register access
> + * @pctldesc: Pin controller description
> + * @pctldev: Pointer to the pin controller device
> + * @soc: SoC/PCH specific pin configuration data
> + * @families: All families in this pin controller
> + * @nfamilies: Number of families in this pin controller
> + */
> +struct mrfld_pinctrl {
> +	struct device *dev;
> +	void __iomem *regs;
> +	spinlock_t lock;
> +	struct pinctrl_desc pctldesc;
> +	struct pinctrl_dev *pctldev;
> +	const struct mrfld_pinctrl_soc_data *soc;
> +	struct mrfld_family *families;
> +	size_t nfamilies;
> +};
> +
> +#define pin_to_bufno(f, p)		((p) - (f)->pin_base)
> +
> +static struct mrfld_family *mrfld_get_family(struct mrfld_pinctrl *mp,
> +					     unsigned pin)

I guess the preferred spelling is "unsigned int" for new stuff.

> +{
> +	struct mrfld_family *family;
> +	unsigned int i;
> +
> +	for (i = 0; i < mp->nfamilies; i++) {
> +		family = &mp->families[i];
> +		if (pin >= family->pin_base &&
> +		    pin < family->pin_base + family->npins)
> +			return family;
> +	}
> +
> +	dev_warn(mp->dev, "failed to find family for pin %u\n", pin);
> +	return NULL;
> +}
> +
> +static bool mrfld_buf_available(struct mrfld_pinctrl *mp, unsigned pin)
> +{
> +	const struct mrfld_family *family;
> +
> +	family = mrfld_get_family(mp, pin);
> +	if (!family)
> +		return false;
> +
> +	return !family->protected;
> +}
> +
> +static void __iomem *mrfld_get_bufcfg(struct mrfld_pinctrl *mp, unsigned pin)
> +{
> +	const struct mrfld_family *family;
> +	unsigned bufno;
> +
> +	family = mrfld_get_family(mp, pin);
> +	if (!family)
> +		return NULL;
> +
> +	bufno = pin_to_bufno(family, pin);
> +	return family->regs + BUFCFG_OFFSET + bufno * 4;
> +}
> +
> +static int mrfld_get_groups_count(struct pinctrl_dev *pctldev)
> +{
> +	struct mrfld_pinctrl *mp = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return mp->soc->ngroups;
> +}
> +
> +static const char *mrfld_get_group_name(struct pinctrl_dev *pctldev,
> +					unsigned group)
> +{
> +	struct mrfld_pinctrl *mp = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return mp->soc->groups[group].name;
> +}
> +
> +static int mrfld_get_group_pins(struct pinctrl_dev *pctldev, unsigned group,
> +				const unsigned **pins, unsigned *npins)
> +{
> +	struct mrfld_pinctrl *mp = pinctrl_dev_get_drvdata(pctldev);
> +
> +	*pins = mp->soc->groups[group].pins;
> +	*npins = mp->soc->groups[group].npins;
> +	return 0;
> +}
> +
> +static void mrfld_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
> +			       unsigned pin)
> +{
> +	struct mrfld_pinctrl *mp = pinctrl_dev_get_drvdata(pctldev);
> +	void __iomem *bufcfg;
> +	u32 value, mode;
> +
> +	if (!mrfld_buf_available(mp, pin))
> +		return;
> +
> +	bufcfg = mrfld_get_bufcfg(mp, pin);
> +	value = readl(bufcfg);
> +
> +	mode = (value & BUFCFG_PINMODE_MASK) >> BUFCFG_PINMODE_SHIFT;
> +	if (!mode)
> +		seq_puts(s, "GPIO ");
> +	else
> +		seq_printf(s, "mode %d ", mode);
> +
> +	seq_printf(s, "0x%08x", value);
> +}
> +
> +static const struct pinctrl_ops mrfld_pinctrl_ops = {
> +	.get_groups_count = mrfld_get_groups_count,
> +	.get_group_name = mrfld_get_group_name,
> +	.get_group_pins = mrfld_get_group_pins,
> +	.pin_dbg_show = mrfld_pin_dbg_show,
> +};
> +
> +static int mrfld_get_functions_count(struct pinctrl_dev *pctldev)
> +{
> +	struct mrfld_pinctrl *mp = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return mp->soc->nfunctions;
> +}
> +
> +static const char *mrfld_get_function_name(struct pinctrl_dev *pctldev,
> +					   unsigned function)
> +{
> +	struct mrfld_pinctrl *mp = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return mp->soc->functions[function].name;
> +}
> +
> +static int mrfld_get_function_groups(struct pinctrl_dev *pctldev,
> +				     unsigned function,
> +				     const char * const **groups,
> +				     unsigned * const ngroups)
> +{
> +	struct mrfld_pinctrl *mp = pinctrl_dev_get_drvdata(pctldev);
> +
> +	*groups = mp->soc->functions[function].groups;
> +	*ngroups = mp->soc->functions[function].ngroups;
> +	return 0;
> +}
> +
> +static int mrfld_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned function,
> +				unsigned group)
> +{
> +	struct mrfld_pinctrl *mp = pinctrl_dev_get_drvdata(pctldev);
> +	const struct intel_pingroup *grp = &mp->soc->groups[group];
> +	unsigned long flags;
> +	unsigned int i;
> +
> +	spin_lock_irqsave(&mp->lock, flags);

If you ever need to call the backing pinctrl functions from irqchip
driver, please use raw_spinlock instead.

> +
> +	/*
> +	 * All pins in the groups needs to be accessible and writable
> +	 * before we can enable the mux for this group.
> +	 */
> +	for (i = 0; i < grp->npins; i++) {
> +		if (!mrfld_buf_available(mp, grp->pins[i])) {
> +			spin_unlock_irqrestore(&mp->lock, flags);
> +			return -EBUSY;
> +		}
> +	}
> +
> +	/* Now enable the mux setting for each pin in the group */
> +	for (i = 0; i < grp->npins; i++) {
> +		void __iomem *bufcfg;
> +		u32 value;
> +
> +		bufcfg = mrfld_get_bufcfg(mp, grp->pins[i]);
> +		value = readl(bufcfg);
> +
> +		value &= ~BUFCFG_PINMODE_MASK;
> +		value |= grp->mode << BUFCFG_PINMODE_SHIFT;
> +
> +		writel(value, bufcfg);
> +	}
> +
> +	spin_unlock_irqrestore(&mp->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int mrfld_gpio_request_enable(struct pinctrl_dev *pctldev,
> +				     struct pinctrl_gpio_range *range,
> +				     unsigned pin)
> +{
> +	struct mrfld_pinctrl *mp = pinctrl_dev_get_drvdata(pctldev);
> +	void __iomem *bufcfg;
> +	unsigned long flags;
> +	u32 value;
> +
> +	spin_lock_irqsave(&mp->lock, flags);
> +
> +	if (!mrfld_buf_available(mp, pin)) {
> +		spin_unlock_irqrestore(&mp->lock, flags);
> +		return -EBUSY;
> +	}
> +
> +	bufcfg = mrfld_get_bufcfg(mp, pin);
> +	value = readl(bufcfg);
> +
> +	/* Put the pad into GPIO mode */
> +	value &= ~BUFCFG_PINMODE_MASK;
> +
> +	writel(value, bufcfg);
> +
> +	spin_unlock_irqrestore(&mp->lock, flags);
> +
> +	return 0;
> +}
> +
> +static const struct pinmux_ops mrfld_pinmux_ops = {
> +	.get_functions_count = mrfld_get_functions_count,
> +	.get_function_name = mrfld_get_function_name,
> +	.get_function_groups = mrfld_get_function_groups,
> +	.set_mux = mrfld_pinmux_set_mux,
> +	.gpio_request_enable = mrfld_gpio_request_enable,
> +};
> +
> +static int mrfld_config_get(struct pinctrl_dev *pctldev, unsigned pin,
> +			    unsigned long *config)
> +{
> +	struct mrfld_pinctrl *mp = pinctrl_dev_get_drvdata(pctldev);
> +	enum pin_config_param param = pinconf_to_config_param(*config);
> +	u32 value, term;
> +	u16 arg = 0;
> +
> +	if (!mrfld_buf_available(mp, pin))
> +		return -ENOTSUPP;
> +
> +	value = readl(mrfld_get_bufcfg(mp, pin));
> +	term = (value & BUFCFG_PUPD_VAL_MASK) >> BUFCFG_PUPD_VAL_SHIFT;
> +
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +		if (value & (BUFCFG_PU_EN | BUFCFG_PD_EN))
> +			return -EINVAL;
> +		break;
> +
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		if (!(value & BUFCFG_PU_EN))
> +			return -EINVAL;
> +
> +		switch (term) {
> +		case BUFCFG_PUPD_VAL_910:
> +			arg = 910;
> +			break;
> +		case BUFCFG_PUPD_VAL_2K:
> +			arg = 2000;
> +			break;
> +		case BUFCFG_PUPD_VAL_20K:
> +			arg = 20000;
> +			break;
> +		case BUFCFG_PUPD_VAL_50K:
> +			arg = 50000;
> +			break;
> +		}
> +
> +		break;
> +
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		if (!(value & BUFCFG_PD_EN))
> +			return -EINVAL;
> +
> +		switch (term) {
> +		case BUFCFG_PUPD_VAL_910:
> +			arg = 910;
> +			break;
> +		case BUFCFG_PUPD_VAL_2K:
> +			arg = 2000;
> +			break;
> +		case BUFCFG_PUPD_VAL_20K:
> +			arg = 20000;
> +			break;
> +		case BUFCFG_PUPD_VAL_50K:
> +			arg = 50000;
> +			break;
> +		}
> +
> +		break;
> +
> +	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +		if (!(value & BUFCFG_OD_EN))
> +			return -EINVAL;
> +		break;
> +
> +	default:
> +		return -ENOTSUPP;
> +	}
> +
> +	*config = pinconf_to_config_packed(param, arg);
> +	return 0;
> +}
> +
> +static int mrfld_config_set_pull(struct mrfld_pinctrl *mp, unsigned pin,
> +				 unsigned long config)
> +{
> +	unsigned param = pinconf_to_config_param(config);
> +	unsigned arg = pinconf_to_config_argument(config);
> +	void __iomem *bufcfg;
> +	unsigned long flags;
> +	int ret = 0;
> +	u32 value;
> +
> +	spin_lock_irqsave(&mp->lock, flags);
> +
> +	bufcfg = mrfld_get_bufcfg(mp, pin);
> +	value = readl(bufcfg);
> +
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +		value &= ~(BUFCFG_PU_EN | BUFCFG_PD_EN | BUFCFG_PUPD_VAL_MASK);
> +		break;
> +
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		value &= ~(BUFCFG_PU_EN | BUFCFG_PD_EN | BUFCFG_PUPD_VAL_MASK);
> +		value |= BUFCFG_PU_EN;
> +
> +		switch (arg) {
> +		case 50000:
> +			value |= BUFCFG_PUPD_VAL_50K << BUFCFG_PUPD_VAL_SHIFT;
> +			break;
> +		case 20000:
> +			value |= BUFCFG_PUPD_VAL_20K << BUFCFG_PUPD_VAL_SHIFT;
> +			break;
> +		case 2000:
> +			value |= BUFCFG_PUPD_VAL_2K << BUFCFG_PUPD_VAL_SHIFT;
> +			break;
> +		case 910:
> +			value |= BUFCFG_PUPD_VAL_910 << BUFCFG_PUPD_VAL_SHIFT;
> +			break;
> +		default:
> +			ret = -EINVAL;
> +		}
> +
> +		break;
> +
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		value &= ~(BUFCFG_PU_EN | BUFCFG_PD_EN | BUFCFG_PUPD_VAL_MASK);
> +		value |= BUFCFG_PD_EN;
> +
> +		switch (arg) {
> +		case 50000:
> +			value |= BUFCFG_PUPD_VAL_50K << BUFCFG_PUPD_VAL_SHIFT;
> +			break;
> +		case 20000:
> +			value |= BUFCFG_PUPD_VAL_20K << BUFCFG_PUPD_VAL_SHIFT;
> +			break;
> +		case 2000:
> +			value |= BUFCFG_PUPD_VAL_2K << BUFCFG_PUPD_VAL_SHIFT;
> +			break;
> +		case 910:
> +			value |= BUFCFG_PUPD_VAL_910 << BUFCFG_PUPD_VAL_SHIFT;
> +			break;
> +		default:
> +			ret = -EINVAL;
> +		}
> +
> +		break;
> +
> +	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +		if (arg)
> +			value |= BUFCFG_OD_EN;
> +		else
> +			value &= ~BUFCFG_OD_EN;
> +		break;
> +	}
> +
> +	if (ret == 0)
> +		writel(value, bufcfg);
> +
> +	spin_unlock_irqrestore(&mp->lock, flags);
> +	return 0;
> +}
> +
> +static int mrfld_config_set(struct pinctrl_dev *pctldev, unsigned pin,
> +			    unsigned long *configs, unsigned nconfigs)
> +{
> +	struct mrfld_pinctrl *mp = pinctrl_dev_get_drvdata(pctldev);
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < nconfigs; i++) {
> +		switch (pinconf_to_config_param(configs[i])) {
> +		case PIN_CONFIG_BIAS_DISABLE:
> +		case PIN_CONFIG_BIAS_PULL_UP:
> +		case PIN_CONFIG_BIAS_PULL_DOWN:
> +		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +			ret = mrfld_config_set_pull(mp, pin, configs[i]);
> +			if (ret)
> +				return ret;
> +			break;
> +
> +		default:
> +			return -ENOTSUPP;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct pinconf_ops mrfld_pinconf_ops = {
> +	.is_generic = true,
> +	.pin_config_get = mrfld_config_get,
> +	.pin_config_set = mrfld_config_set,
> +};
> +
> +static const struct pinctrl_desc mrfld_pinctrl_desc = {
> +	.pctlops = &mrfld_pinctrl_ops,
> +	.pmxops = &mrfld_pinmux_ops,
> +	.confops = &mrfld_pinconf_ops,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int mrfld_pinctrl_probe(struct platform_device *pdev)
> +{
> +	const struct mrfld_pinctrl_soc_data *soc = &mrfld_soc_data;
> +	struct mrfld_pinctrl *mp;
> +	struct resource *mem;
> +	void __iomem *regs;
> +	unsigned int i;
> +
> +	mp = devm_kzalloc(&pdev->dev, sizeof(*mp), GFP_KERNEL);
> +	if (!mp)
> +		return -ENOMEM;
> +
> +	mp->dev = &pdev->dev;
> +	mp->soc = soc;
> +	spin_lock_init(&mp->lock);
> +
> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	regs = devm_ioremap_resource(&pdev->dev, mem);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	/*
> +	 * Make a copy of the families which we can use to hold pointers
> +	 * to the registers.
> +	 */
> +	mp->nfamilies = mp->soc->nfamilies;
> +	mp->families = devm_kmemdup(&pdev->dev, mp->soc->families,
> +				    mp->nfamilies * sizeof(*mp->soc->families),
> +				    GFP_KERNEL);
> +	if (!mp->families)
> +		return -ENOMEM;
> +
> +	/* Splice memory resource by chunk per family */
> +	for (i = 0; i < mp->nfamilies; i++) {
> +		struct mrfld_family *family = &mp->families[i];
> +
> +		family->regs = regs + family->barno * MRFLD_FAMILY_LEN;
> +	}
> +
> +	mp->pctldesc = mrfld_pinctrl_desc;
> +	mp->pctldesc.name = dev_name(&pdev->dev);
> +	mp->pctldesc.pins = mp->soc->pins;
> +	mp->pctldesc.npins = mp->soc->npins;
> +
> +	mp->pctldev = devm_pinctrl_register(&pdev->dev, &mp->pctldesc, mp);
> +	if (IS_ERR(mp->pctldev)) {
> +		dev_err(&pdev->dev, "failed to register pinctrl driver\n");
> +		return PTR_ERR(mp->pctldev);
> +	}
> +
> +	platform_set_drvdata(pdev, mp);
> +	return 0;
> +}
> +
> +static int mrfld_pinctrl_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

Is this really needed?

> +
> +static struct platform_driver mrfld_pinctrl_driver = {
> +	.probe = mrfld_pinctrl_probe,
> +	.remove = mrfld_pinctrl_remove,
> +	.driver = {
> +		.name = "merrifield-pinctrl",
> +	},
> +};
> +
> +static int __init mrfld_pinctrl_init(void)
> +{
> +	return platform_driver_register(&mrfld_pinctrl_driver);
> +}
> +subsys_initcall(mrfld_pinctrl_init);
> +
> +static void __exit mrfld_pinctrl_exit(void)
> +{
> +	platform_driver_unregister(&mrfld_pinctrl_driver);
> +}
> +module_exit(mrfld_pinctrl_exit);
> +
> +MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
> +MODULE_DESCRIPTION("Intel Merrifield SoC FLIS driver");

pinctrl

> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:merrifield-pinctrl");
> -- 
> 2.8.1
