Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFA54418CB
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 09:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330066; cv=none; b=j8FA6zTwMXdGSjhKIHBKMAhOZJzb/Ms5R1R3eDwj4j/eI0W92V2E5r8Ut2dk9MweO7U428Rp4X8kyX4i4lZ75z+q0UDot4LSn4rNsPHqaap5wTmSvbT8FR3+MmILFupPwdl/4NcKzZ3ez3Snub6jBJxtRuR3uW/vXDEn/QZHwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330066; c=relaxed/simple;
	bh=5d9ceGRBtP+wdgk4Sz4L8HQilnMT1tmoVvIp2dnUCNk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Za57Od2eag8LYp0XsA++GzQwyS2v5nb+MbRSnTCnO/EXeEcxKkdItrFSfzgXQLXDlwCiWk2hTng97lMn/CFdxefSvfX+Kj05bNcIx+oBED9R7jqYfjVoWXF6VSa7rzR3D1o7dDOvHG2WIN2irzhzYvryGrSklqUCheNnOFu0k/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=S+WB3dEl; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="S+WB3dEl"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso518980f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 02:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790330059; x=1790934859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5c4SzdJ47Uber7oQpOvja6qLAZ9LLoIVffcKRUz7YtM=;
        b=S+WB3dElpWCcKnmc01OMO2gNu9dnBSuxQUjDTOgc6nmniwwxKoieHJHHe9+LEnXF1f
         pXjeXt/Ch+ILUyxE9J2r9cbu1aDhY+BkNxVV+mIw5mM9mXw4SqEzKMixbiYb7jIeME/7
         t3U4JNUxluu+BGEckdA4PUZMmcJBtRhS+Vb9W5wjql0qoF/w+2qloCzSpv3aR5Kazyu3
         7pw6tmg+h9EtTm5zmivvb83fddDtEkUj1MnVUceq3/2DYjvgFNWHAeenko9qP+KiT9uL
         TMsmgqMYvCkCS3nWcknHx0z2oeJvJdKczN+cNYdjiqrpOV6VLXo4mNsFlU+1RnA8EoAZ
         PnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790330059; x=1790934859;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5c4SzdJ47Uber7oQpOvja6qLAZ9LLoIVffcKRUz7YtM=;
        b=iyHNGRSoT7JJyd6ZzPGHoBFOKrWB0gQd3DJxk7Qvi5wlAhGQsdbyZkOtpPVJwpXKrq
         jDd93qb142c2I+nv0FnnBUWmivQzaEbhqusQPbWRvht19S1JhYwFOAHFnUtWGAjM6J2V
         o1UU6A/cyIRSi23QIxTCx54xPYY83+CelBSRsd/7F/7rbfEiK4Mi2HbnBD6iJwijK1dy
         oKv4GSHZJWJZ6hH6RkDOIXsu18pBmJIiA2U4lpsbgxx4sXw1mqxVNpoRrDKwKF0Dt4Kk
         o/vuZPZQpF+3NlvuZcQn+zs/P3WZv642XUVBT6pOfMQar2vuxe0CL8WG4SUji7SjAoEP
         w3uQ==
X-Forwarded-Encrypted: i=1; AKwUvByvGWqPrczeKYkYtxKL/pS+48IJYoRz+QhdxWyiG+eS1JGNR4/KK0QAobtYrQqXm4V2qF/FVT4dLA4/@vger.kernel.org
X-Gm-Message-State: AFuF++kW9/pqpVOI4pcjbVEVWuPScgfCnbBevFlh4EVEPwWQ7u2BPwdZ
	qgbtIS+HGjB3oDZBgPjMh8hEp6RPX/wnjDevC3hZTI8CZSoZ6o/LyrMf/iCJ2EwTWJ8=
X-Gm-Gg: AYBFou0yFWH5ErYzsx4w3xUTyMUVkybVh3LRhMpacj0AC8NH7Kg1x47Xc+HRJkYGU1t
	nwsgz1DpwFj/WU0ghqu61JoGHUlF82FY95vUYyAGzDPwfIPh7bp9M/RIuAdcnBbU4O+LOr/hako
	fE8NRw4kVanpGXH3MtpjXi4W0Rwnn9SAkYdrD4g/FlFYZf3UrAandKotlR0sDDR1rmj4W+9J74j
	dumDxoO7dde/E53+KGP0M+arG2pQKpobSYq/ZKJGzP/emBE+/o0SUD7Lo7jERTFgxFfKHWIS05R
	Ks4pGWdmMNc78Gc1rEsUQu/nfNNhYYvIgtDoYYg5fXnuhHQXYSSW+orX/TeUt9Dvcw6+OjsWMFS
	qHKe7EOwkfbsZpiZiUTmOy8WnbUCWtBScybuNCUughZhVEmv0zYQOAZPMtE68j+MaaJAoJ5kdQa
	yo+egyloAGtZhLzAL1hjrBihfFa9sQ03ssJf5AdzkIwlnquifSOWhYBoyw7YcBQdYMt15JG83/g
	rYglNLx0GwATELMKw==
X-Received: by 2002:a05:6000:4911:b0:486:f99f:8236 with SMTP id ffacd0b85a97d-48872ac74e0mr8816260f8f.44.1790330059142;
        Fri, 25 Sep 2026 02:54:19 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6470b7sm5717750f8f.27.2026.09.25.02.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:54:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome
 Brunet <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de,
 linux-gpio@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Linus
 Walleij <linusw@kernel.org>, Alvin =?utf-8?Q?=C5=A0ipraga?=
 <alvin.sipraga@analog.com>
Subject: Re: [PATCH v9 2/2] clk: add TI CDCE6214 clock driver
In-Reply-To: <20260921-clk-cdce6214-v9-2-f2ea74fd38a2@pengutronix.de>
References: <20260921-clk-cdce6214-v9-0-f2ea74fd38a2@pengutronix.de>
 <20260921-clk-cdce6214-v9-2-f2ea74fd38a2@pengutronix.de>
Date: Fri, 25 Sep 2026 11:54:17 +0200
Message-ID: <1jcxu18xme.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On lun. 21 sept. 2026 at 08:50, Sascha Hauer <s.hauer@pengutronix.de> wrote:

> The CDCE6214 is a Ultra-Low Power Clock Generator With One PLL, Four
> Differential Outputs, Two Inputs, and Internal EEPROM. This patch adds
> a common clk framework driver for this chip.
>
> - Two inputs (PRIREF and SECREF)
> - Programmable 8bit divider or x2 multiplier between input and PLL
> - 16b integer / 24bit fractional PLL
> - Two programmable /4, /5, /6 dividers after PLL (PSA/PSB)
> - Four outputs (OUT1-OUT4) with programmable 14b dividers,
>   muxable between PSA, PSB and PLL input
> - One output (OUT0) fed from PLL input
>
> - PRIREF can be configured as LVCMOS or differential input
> - SECREF can be configured as LVCMOS, differential or oscillator input
> - OUT0 is a LVCMOS output
> - OUT1 and OUT4 can be configured as LVDS, LP-HCSL or LVCMOS outputs
> - OUT2 and OUT3 can be configured as LVDS or LP-HCSL outputs
>
> All clocks are registered without parent rate propagation, so each of
> the clocks must be configured separately via device tree or consumer.
>
> Signed-off-by: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/clk/Kconfig        |    9 +
>  drivers/clk/Makefile       |    1 +
>  drivers/clk/clk-cdce6214.c | 1594 ++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 1604 insertions(+)
>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index f9592fd9ec2bb..8fd280f76e3ce 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -178,6 +178,15 @@ config COMMON_CLK_BM1880
>  	help
>  	  This driver supports the clocks on Bitmain BM1880 SoC.
>=20=20
> +config COMMON_CLK_CDCE6214
> +	tristate "Clock driver for TI CDCE6214 clock synthesizer"
> +	depends on I2C
> +	depends on PINCTRL
> +	select GENERIC_PINCONF
> +	select REGMAP_I2C
> +	help
> +	  This driver supports TI CDCE6214 programmable 1-PLL clock synthesizer.
> +
>  config COMMON_CLK_CDCE706
>  	tristate "Clock driver for TI CDCE706 clock synthesizer"
>  	depends on I2C
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index b18af485d7f03..29eab6ca75851 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -61,6 +61,7 @@ obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN)	+=3D clk-axi-clkgen=
.o
>  obj-$(CONFIG_ARCH_AXXIA)		+=3D clk-axm5516.o
>  obj-$(CONFIG_COMMON_CLK_BD718XX)	+=3D clk-bd718x7.o
>  obj-$(CONFIG_COMMON_CLK_BM1880)		+=3D clk-bm1880.o
> +obj-$(CONFIG_COMMON_CLK_CDCE6214)	+=3D clk-cdce6214.o
>  obj-$(CONFIG_COMMON_CLK_CDCE706)	+=3D clk-cdce706.o
>  obj-$(CONFIG_COMMON_CLK_CDCE925)	+=3D clk-cdce925.o
>  obj-$(CONFIG_ARCH_CLPS711X)		+=3D clk-clps711x.o
> diff --git a/drivers/clk/clk-cdce6214.c b/drivers/clk/clk-cdce6214.c
> new file mode 100644
> index 0000000000000..583862fd24898
> --- /dev/null
> +++ b/drivers/clk/clk-cdce6214.c
> @@ -0,0 +1,1594 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Driver for the TI CDCE6214 clock generator
> + *
> + * datasheet available at https://www.ti.com/lit/gpn/cdce6214
> + *
> + * Copyright (c) 2023 Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> + * Copyright (c) 2025 Sascha Hauer <s.hauer@pengutronix.de>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/of.h>
> +#include <linux/clk-provider.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/bitfield.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <dt-bindings/clock/ti,cdce6214.h>
> +
> +#define R0	0
> +#define RO_I2C_A0			BIT(15)
> +#define RO_PDN_INPUT_SEL		BIT(14)
> +#define RO_GPIO4_DIR_SEL		BIT(13)
> +#define RO_GPIO1_DIR_SEL		BIT(12)
> +#define RO_ZDM_CLOCKSEL			BIT(10)
> +#define RO_ZDM_EN			BIT(8)
> +#define RO_SYNC				BIT(5)
> +#define RO_RECAL			BIT(4)
> +#define RO_RESETN_SOFT			BIT(3)
> +#define RO_SWRST			BIT(2)
> +#define RO_POWERDOWN			BIT(1)
> +#define RO_MODE				BIT(0)
> +
> +#define R1	1

I don't really get the point of those defines=20

> +#define R1_GPIO4_INPUT_SEL		GENMASK(15, 12)
> +#define R1_GPIO3_INPUT_SEL		GENMASK(11, 8)
> +#define R1_GPIO2_INPUT_SEL		GENMASK(7, 4)
> +#define R1_GPIO1_INPUT_SEL		GENMASK(3, 0)
> +
> +#define R2	2
> +#define R2_GPIO4_OUTPUT_SEL		GENMASK(9, 6)
> +#define R2_GPIO1_OUTPUT_SEL		GENMASK(5, 2)
> +#define R2_REFSEL_SW			GENMASK(1, 0)
> +#define R2_REFSEL_SW_SECREF		2
> +#define R2_REFSEL_SW_PRIREF		3
> +
> +#define R3	3
> +#define R3_DISABLE_CRC			BIT(13)
> +#define R3_UPDATE_CRC			BIT(12)
> +#define R3_NVMCOMMIT			BIT(11)
> +#define R3_REGCOMMIT			BIT(10)
> +#define R3_REGCOMMIT_PAGE		BIT(9)
> +#define R3_FREQ_DEC_REG			BIT(6)
> +#define R3_FREQ_INC_REG			BIT(5)
> +#define R3_FREQ_INC_DEC_REG_MODE	BIT(4)
> +#define R3_FREQ_INC_DEC_EN		BIT(3)
> +
> +#define R4	4
> +#define R4_CH4_PD			BIT(7)
> +#define R4_CH3_PD			BIT(6)
> +#define R4_CH2_PD			BIT(5)
> +#define R4_CH1_PD			BIT(4)
> +#define R4_POST_EE_DLY			GENMASK(3, 0)
> +
> +#define R5	5
> +#define R5_PLL_VCOBUFF_LDO_PD		BIT(8)
> +#define R5_PLL_VCO_LDO_PD		BIT(7)
> +#define R5_PLL_VCO_BUFF_PD		BIT(6)
> +#define R5_PLL_CP_LDO_PD		BIT(5)
> +#define R5_PLL_LOCKDET_PD		BIT(4)
> +#define R5_PLL_PSB_PD			BIT(3)
> +#define R5_PLL_PSA_PD			BIT(2)
> +#define R5_PLL_PFD_PD			BIT(1)
> +
> +#define R7	7
> +#define R7_NVMCRCERR			BIT(5)
> +#define R7_LOCK_DET_S			BIT(1)
> +#define R7_LOCK_DET			BIT(0)
> +
> +#define R9	9
> +#define R9_NVMLCRC			GENMASK(15, 0)
> +
> +#define R10	10
> +#define R10_NVMSCRC			GENMASK(15, 0)
> +
> +#define R11	11
> +#define R11_NVM_RD_ADDR			GENMASK(5, 0)
> +
> +#define R12	12
> +#define R12_NVM_RD_DATA			GENMASK(15, 0)
> +
> +#define R13	13
> +#define R13_NVM_WR_ADDR			GENMASK(5, 0)
> +
> +#define R14	14
> +#define R14_NVM_WR_DATA			GENMASK(15, 0)
> +
> +#define R15	15
> +#define R15_EE_LOCK			GENMASK(15, 12)
> +#define R15_CAL_MUTE			BIT(5)
> +
> +#define R24	24
> +#define R24_IP_PRIREF_BUF_SEL		BIT(15)
> +#define R24_IP_XO_CLOAD			GENMASK(12, 8)
> +#define R24_IP_BIAS_SEL_XO		GENMASK(5, 2)
> +#define R24_IP_SECREF_BUF_SEL		GENMASK(1, 0)
> +#define R24_IP_SECREF_BUF_SEL_XTAL	0
> +#define R24_IP_SECREF_BUF_SEL_LVCMOS	1
> +#define R24_IP_SECREF_BUF_SEL_DIFF	2
> +
> +#define R25	25
> +#define R25_IP_REF_TO_OUT4_EN		BIT(14)
> +#define R25_IP_REF_TO_OUT3_EN		BIT(13)
> +#define R25_IP_REF_TO_OUT2_EN		BIT(12)
> +#define R25_IP_REF_TO_OUT1_EN		BIT(11)
> +#define R25_IP_BYP_OUT0_EN		BIT(10)
> +#define R25_REF_CH_MUX			BIT(9)
> +#define R25_IP_RDIV			GENMASK(7, 0)
> +
> +#define R27	27
> +#define R27_MASH_ORDER			GENMASK(1, 0)
> +
> +#define R30	30
> +#define R30_PLL_NDIV			GENMASK(14, 0)
> +
> +#define R31	31
> +#define R31_PLL_NUM_15_0		GENMASK(15, 0)
> +
> +#define R32	32
> +#define R32_PLL_NUM_23_16		GENMASK(7, 0)
> +
> +#define R33	33
> +#define R33_PLL_DEN_15_0		GENMASK(15, 0)
> +
> +#define R34	34
> +#define R34_PLL_DEN_23_16		GENMASK(7, 0)
> +
> +#define R41	41
> +#define R41_SSC_EN			BIT(15)
> +
> +#define R42	42
> +#define R42_SSC_TYPE			BIT(5)
> +#define R42_SSC_SEL			GENMASK(3, 1)
> +
> +#define R43	43
> +#define R43_FREQ_INC_DEC_DELTA		GENMASK(15, 0)
> +
> +#define R47	47
> +#define R47_PLL_CP_DN			GENMASK(12, 7)
> +#define R47_PLL_PSB			GENMASK(6, 5)
> +#define R47_PLL_PSA			GENMASK(4, 3)
> +
> +#define R48	48
> +#define R48_PLL_LF_RES			GENMASK(14, 11)
> +#define R48_PLL_CP_UP			GENMASK(5, 0)
> +
> +#define R49	49
> +#define R49_PLL_LF_ZCAP			GENMASK(4, 0)
> +
> +#define R50	50
> +#define R50_PLL_LOCKDET_WINDOW		GENMASK(10, 8)
> +
> +#define R51	51
> +#define R51_PLL_PFD_DLY_EN		BIT(10)
> +#define R51_PLL_PFD_CTRL		BIT(6)
> +
> +#define R52	52
> +#define R52_PLL_NCTRL_EN		BIT(6)
> +#define R52_PLL_CP_EN			BIT(3)
> +
> +#define R55	55
> +#define R55_PLL_LF_3_PCTRIM		GENMASK(9, 8)
> +#define R55_PLL_LF_3_PRTRIM		GENMASK(7, 6)
> +
> +#define R56	56
> +#define R56_CH1_MUX			GENMASK(15, 14)
> +#define R56_CH1_DIV			GENMASK(13, 0)
> +
> +#define R57	57
> +#define R57_CH1_LPHCSL_EN		BIT(14)
> +#define R57_CH1_1P8VDET			BIT(12)
> +#define R57_CH1_GLITCHLESS_EN		BIT(9)
> +#define R57_CH1_SYNC_DELAY		GENMASK(8, 4)
> +#define R57_CH1_SYNC_EN			BIT(3)
> +#define R57_CH1_MUTE_SEL		BIT(1)
> +#define R57_CH1_MUTE			BIT(0)
> +
> +#define R59	59
> +#define R59_CH1_LVDS_EN			BIT(15)
> +#define R59_CH1_CMOSN_EN		BIT(14)
> +#define R59_CH1_CMOSP_EN		BIT(13)
> +#define R59_CH1_CMOSN_POL		BIT(12)
> +#define R59_CH1_CMOSP_POL		BIT(11)
> +
> +#define R60	60
> +#define R60_CH1_DIFFBUF_IBIAS_TRIM	GENMASK(15, 12)
> +#define R60_CH1_LVDS_CMTRIM_INC		GENMASK(11, 10)
> +#define R60_CH1_LVDS_CMTRIM_DEC		GENMASK(5, 4)
> +#define R60_CH1_CMOS_SLEW_RATE_CTRL	GENMASK(3, 0)
> +
> +#define R62	62
> +#define R62_CH2_MUX			GENMASK(15, 14)
> +#define R62_CH2_DIV			GENMASK(13, 0)
> +
> +#define R63	63
> +#define R63_CH2_LPHCSL_EN		BIT(13)
> +#define R63_CH2_1P8VDET			BIT(12)
> +#define R63_CH2_GLITCHLESS_EN		BIT(9)
> +#define R63_CH2_SYNC_DELAY		GENMASK(8, 4)
> +#define R63_CH2_SYNC_EN			BIT(3)
> +#define R63_CH2_MUTE_SEL		BIT(1)
> +#define R63_CH2_MUTE			BIT(0)
> +
> +#define R65	65
> +#define R65_CH2_LVDS_CMTRIM_DEC		GENMASK(14, 13)
> +#define R65_CH2_LVDS_EN			BIT(11)
> +
> +#define R66	66
> +#define R66_CH2_LVDS_CMTRIM_IN		GENMASK(5, 4)
> +#define R66_CH2_DIFFBUF_IBIAS_TRIM	GENMASK(3, 0)
> +
> +#define R67	67
> +#define R67_CH3_MUX			GENMASK(15, 14)
> +#define R67_CH3_DIV			GENMASK(13, 0)
> +
> +#define R68	68
> +#define R68_CH3_LPHCSL_EN		BIT(13)
> +#define R68_CH3_1P8VDET			BIT(12)
> +#define R68_CH3_GLITCHLESS_EN		BIT(9)
> +#define R68_CH3_SYNC_DELAY		GENMASK(8, 4)
> +#define R68_CH3_SYNC_EN			BIT(3)
> +#define R68_CH3_MUTE_SEL		BIT(1)
> +#define R68_CH3_MUTE			BIT(0)
> +
> +#define R70	70
> +#define R70_CH3_LVDS_EN			BIT(11)
> +
> +#define R71	71
> +#define R71_CH3_LVDS_CMTRIM_DEC		GENMASK(10, 9)
> +#define R71_CH3_LVDS_CMTRIM_INC		GENMASK(5, 4)
> +#define R71_CH3_DIFFBUF_IBIAS_TR	GENMASK(3, 0)
> +
> +#define R72	72
> +#define R72_CH4_MUX			GENMASK(15, 14)
> +#define R72_CH4_DIV			GENMASK(13, 0)
> +
> +#define R73	73
> +#define R73_CH4_LPHCSL_EN		BIT(13)
> +#define R73_CH4_1P8VDET			BIT(12)
> +#define R73_CH4_GLITCHLESS_EN		BIT(9)
> +#define R73_CH4_SYNC_DELAY		GENMASK(8, 4)
> +#define R73_CH4_SYNC_EN			BIT(3)
> +#define R73_CH4_MUTE_SEL		BIT(1)
> +#define R73_CH4_MUTE			BIT(0)
> +
> +#define R75	75
> +#define R75_CH4_LVDS_EN			BIT(15)
> +#define R75_CH4_CMOSP_EN		BIT(14)
> +#define R75_CH4_CMOSN_EN		BIT(13)
> +#define R75_CH4_CMOSP_POL		BIT(12)
> +#define R75_CH4_CMOSN_POL		BIT(11)
> +
> +#define R76	76
> +#define R76_CH4_DIFFBUF_IBIAS_TRIM	GENMASK(9, 6)
> +#define R76_CH4_LVDS_CMTRIM_IN		GENMASK(5, 4)
> +#define R76_CH4_CMOS_SLEW_RATE_CTRL	GENMASK(3, 0)
> +
> +#define R77	77
> +#define R77_CH4_LVDS_CMTRIM_DEC		GENMASK(1, 0)
> +
> +#define R78	78
> +#define R78_CH0_EN			BIT(12)
> +
> +#define R79	79
> +#define R79_SAFETY_1P8V_MODE		BIT(9)
> +#define R79_CH0_CMOS_SLEW_RATE_CTRL	GENMASK(3, 0)
> +
> +#define R81	81
> +#define R81_PLL_LOCK_MASK		BIT(3)
> +
> +#define CDCE6214_VCO_MIN 2335000000
> +#define CDCE6214_VCO_MAX 2625000000
> +#define CDCE6214_PLL_NDIV_MIN 24
> +#define CDCE6214_DENOM_DEFAULT 0x1000000
> +
> +#define CDCE6214_CLK_PRIREF	0
> +#define CDCE6214_CLK_SECREF	1
> +
> +static const char * const clk_names[] =3D {
> +	[CDCE6214_CLK_PRIREF] =3D "priref",
> +	[CDCE6214_CLK_SECREF] =3D "secref",
> +	[CDCE6214_CLK_OUT0] =3D "out0",
> +	[CDCE6214_CLK_OUT1] =3D "out1",
> +	[CDCE6214_CLK_OUT2] =3D "out2",
> +	[CDCE6214_CLK_OUT3] =3D "out3",
> +	[CDCE6214_CLK_OUT4] =3D "out4",
> +	[CDCE6214_CLK_PLL] =3D "pll",
> +	[CDCE6214_CLK_PSA] =3D "psa",
> +	[CDCE6214_CLK_PSB] =3D "psb",
> +};
> +
> +#define CDCE6214_NUM_CLOCKS	ARRAY_SIZE(clk_names)
> +
> +struct cdce6214;
> +
> +struct cdce6214_clock {
> +	struct clk_hw hw;
> +	struct cdce6214 *priv;
> +	unsigned int index;
> +};
> +
> +struct cdce6214 {
> +	struct i2c_client *client;
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct gpio_desc *reset_gpio;
> +	struct cdce6214_clock clk[CDCE6214_NUM_CLOCKS];
> +};
> +
> +static inline struct cdce6214_clock *hw_to_cdce6214_clk(struct clk_hw *h=
w)
> +{
> +	return container_of(hw, struct cdce6214_clock, hw);
> +}
> +
> +static struct clk_hw *cdce6214_of_clk_get(struct of_phandle_args *clkspe=
c,
> +					  void *data)
> +{
> +	struct cdce6214 *priv =3D data;
> +	unsigned int idx =3D clkspec->args[0];
> +
> +	if (idx >=3D CDCE6214_NUM_CLOCKS)
> +		return ERR_PTR(-EINVAL);
> +	if (idx <=3D CDCE6214_CLK_SECREF)
> +		return ERR_PTR(-EINVAL);
> +
> +	return &priv->clk[idx].hw;
> +}
> +
> +static const struct regmap_config cdce6214_regmap_config =3D {
> +	.reg_bits =3D 16,
> +	.val_bits =3D 16,
> +	.reg_stride =3D 1,
> +	.max_register =3D 0x0055,
> +};
> +
> +static int cdce6214_configure(struct cdce6214 *priv)
> +{
> +	regmap_update_bits(priv->regmap, R2, R2_REFSEL_SW,
> +			   FIELD_PREP(R2_REFSEL_SW, R2_REFSEL_SW_SECREF));
> +
> +	return 0;
> +}
> +
> +static unsigned long cdce6214_clk_out0_recalc_rate(struct clk_hw *hw,
> +						   unsigned long parent_rate)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned int val, div;
> +
> +	regmap_read(priv->regmap, R25, &val);
> +
> +	div =3D FIELD_GET(R25_IP_RDIV, val);
> +
> +	if (!div)
> +		return parent_rate * 2;
> +
> +	return DIV_ROUND_UP_ULL((u64)parent_rate, div);
> +}
> +
> +static int cdce6214_clk_out0_determine_rate(struct clk_hw *hw,
> +					    struct clk_rate_request *req)
> +{
> +	unsigned long parent_rate =3D req->best_parent_rate;
> +	unsigned int div;
> +
> +	if (!parent_rate)
> +		return -EINVAL;
> +
> +	/* Use the doubler when it is closer than a divider of 1 */
> +	if (req->rate > parent_rate + parent_rate / 2) {
> +		req->rate =3D parent_rate * 2;
> +		return 0;
> +	}
> +
> +	div =3D DIV_ROUND_CLOSEST(parent_rate, max(req->rate, 1UL));
> +	div =3D clamp_t(unsigned int, div, 1, R25_IP_RDIV);
> +
> +	req->rate =3D DIV_ROUND_UP_ULL((u64)parent_rate, div);
> +
> +	return 0;
> +}
> +
> +static int cdce6214_clk_out0_set_rate(struct clk_hw *hw, unsigned long r=
ate,
> +				      unsigned long parent_rate)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned int div;
> +
> +	if (rate > parent_rate) {
> +		regmap_update_bits(priv->regmap, R25, R25_IP_RDIV, FIELD_PREP(R25_IP_R=
DIV, 0));
> +		return 0;
> +	}
> +
> +	div =3D DIV_ROUND_CLOSEST(parent_rate, rate);
> +	if (div > R25_IP_RDIV)
> +		div =3D R25_IP_RDIV;
> +
> +	regmap_update_bits(priv->regmap, R25, R25_IP_RDIV, FIELD_PREP(R25_IP_RD=
IV, div));
> +
> +	return 0;
> +}
> +
> +static u8 cdce6214_clk_out0_get_parent(struct clk_hw *hw)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned int val;
> +
> +	regmap_read(priv->regmap, R2, &val);
> +
> +	/*
> +	 * REFSEL_SW values 0 and 1 leave the selection to the REFSEL pin, which
> +	 * we cannot read back. cdce6214_configure() switches to register
> +	 * control, so this is not expected here.
> +	 */
> +	if (FIELD_GET(R2_REFSEL_SW, val) =3D=3D R2_REFSEL_SW_SECREF)
> +		return 1;
> +
> +	return 0;
> +}
> +
> +static int cdce6214_clk_out0_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned int sel =3D index ? R2_REFSEL_SW_SECREF : R2_REFSEL_SW_PRIREF;
> +
> +	return regmap_update_bits(priv->regmap, R2, R2_REFSEL_SW,
> +				  FIELD_PREP(R2_REFSEL_SW, sel));
> +}
> +
> +static const struct clk_ops cdce6214_clk_out0_ops =3D {
> +	.recalc_rate =3D cdce6214_clk_out0_recalc_rate,
> +	.determine_rate =3D cdce6214_clk_out0_determine_rate,
> +	.set_rate =3D cdce6214_clk_out0_set_rate,
> +	.get_parent =3D cdce6214_clk_out0_get_parent,
> +	.set_parent =3D cdce6214_clk_out0_set_parent,
> +};
> +
> +static unsigned int cdce6214_clk_out_mask(unsigned int index)
> +{
> +	switch (index) {
> +	case CDCE6214_CLK_OUT1:
> +		return R4_CH1_PD;
> +	case CDCE6214_CLK_OUT2:
> +		return R4_CH2_PD;
> +	case CDCE6214_CLK_OUT3:
> +		return R4_CH3_PD;
> +	case CDCE6214_CLK_OUT4:
> +		return R4_CH4_PD;
> +	default:
> +		return 0;
> +	};
> +}
> +
> +static int cdce6214_clk_out_prepare(struct clk_hw *hw)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned int mask =3D cdce6214_clk_out_mask(clock->index);
> +
> +	if (!mask)
> +		return -EINVAL;
> +
> +	return regmap_clear_bits(priv->regmap, R4, mask);
> +}
> +
> +static void cdce6214_clk_out_unprepare(struct clk_hw *hw)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned int mask =3D cdce6214_clk_out_mask(clock->index);
> +
> +	if (!mask)
> +		return;
> +
> +	regmap_set_bits(priv->regmap, R4, mask);
> +}
> +
> +static int cdce6214_clk_out_is_prepared(struct clk_hw *hw)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned int mask =3D cdce6214_clk_out_mask(clock->index);
> +	unsigned int val;
> +
> +	if (!mask)
> +		return -EINVAL;
> +
> +	regmap_read(priv->regmap, R4, &val);
> +
> +	return !(val & mask);
> +}
> +
> +static unsigned long cdce6214_clk_out_recalc_rate(struct clk_hw *hw,
> +						  unsigned long parent_rate)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned int val, div;
> +	unsigned long r;
> +
> +	switch (clock->index) {
> +	case CDCE6214_CLK_OUT1:
> +		regmap_read(priv->regmap, R56, &val);
> +		div =3D FIELD_GET(R56_CH1_DIV, val);
> +		break;
> +	case CDCE6214_CLK_OUT2:
> +		regmap_read(priv->regmap, R62, &val);
> +		div =3D FIELD_GET(R62_CH2_DIV, val);
> +		break;
> +	case CDCE6214_CLK_OUT3:
> +		regmap_read(priv->regmap, R67, &val);
> +		div =3D FIELD_GET(R67_CH3_DIV, val);
> +		break;
> +	case CDCE6214_CLK_OUT4:
> +		regmap_read(priv->regmap, R72, &val);
> +		div =3D FIELD_GET(R72_CH4_DIV, val);
> +		break;
> +	};
> +
> +	if (!div)
> +		div =3D 1;
> +
> +	r =3D DIV_ROUND_UP_ULL((u64)parent_rate, div);
> +
> +	return r;
> +}
> +
> +static unsigned int cdce6214_get_out_div(unsigned long rate, unsigned lo=
ng parent_rate)
> +{
> +	unsigned int div;
> +
> +	div =3D divider_get_val(max(rate, 1UL), parent_rate, NULL, 14, CLK_DIVI=
DER_ONE_BASED);
> +
> +	if (div < 1)
> +		div =3D 1;
> +
> +	return div;
> +}
> +
> +static int cdce6214_clk_out_determine_rate(struct clk_hw *hw,
> +					   struct clk_rate_request *req)
> +{
> +	unsigned int div =3D cdce6214_get_out_div(req->rate, req->best_parent_r=
ate);
> +
> +	req->rate =3D DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
> +
> +	return 0;
> +}
> +
> +static int cdce6214_clk_out_set_rate(struct clk_hw *hw, unsigned long ra=
te,
> +				     unsigned long parent_rate)
> +{
> +	unsigned int div =3D cdce6214_get_out_div(rate, parent_rate);
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +
> +	switch (clock->index) {
> +	case CDCE6214_CLK_OUT1:
> +		regmap_update_bits(priv->regmap, R56, R56_CH1_DIV,
> +				   FIELD_PREP(R56_CH1_DIV, div));
> +		break;
> +	case CDCE6214_CLK_OUT2:
> +		regmap_update_bits(priv->regmap, R62, R62_CH2_DIV,
> +				   FIELD_PREP(R62_CH2_DIV, div));
> +		break;
> +	case CDCE6214_CLK_OUT3:
> +		regmap_update_bits(priv->regmap, R67, R67_CH3_DIV,
> +				   FIELD_PREP(R67_CH3_DIV, div));
> +		break;
> +	case CDCE6214_CLK_OUT4:
> +		regmap_update_bits(priv->regmap, R72, R72_CH4_DIV,
> +				   FIELD_PREP(R72_CH4_DIV, div));
> +		break;
> +	};
> +
> +	return 0;
> +}
> +
> +static u8 cdce6214_clk_out_get_parent(struct clk_hw *hw)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned int val, idx;
> +
> +	switch (clock->index) {
> +	case CDCE6214_CLK_OUT1:
> +		regmap_read(priv->regmap, R56, &val);
> +		idx =3D FIELD_GET(R56_CH1_MUX, val);
> +		break;
> +	case CDCE6214_CLK_OUT2:
> +		regmap_read(priv->regmap, R62, &val);
> +		idx =3D FIELD_GET(R62_CH2_MUX, val);
> +		break;
> +	case CDCE6214_CLK_OUT3:
> +		regmap_read(priv->regmap, R67, &val);
> +		idx =3D FIELD_GET(R67_CH3_MUX, val);
> +		break;
> +	case CDCE6214_CLK_OUT4:
> +		regmap_read(priv->regmap, R72, &val);
> +		idx =3D FIELD_GET(R72_CH4_MUX, val);
> +		break;
> +	};
> +
> +	return idx;
> +}
> +
> +static int cdce6214_clk_out_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +
> +	switch (clock->index) {
> +	case CDCE6214_CLK_OUT1:
> +		regmap_update_bits(priv->regmap, R56, R56_CH1_MUX, FIELD_PREP(R56_CH1_=
MUX, index));
> +		break;
> +	case CDCE6214_CLK_OUT2:
> +		regmap_update_bits(priv->regmap, R62, R62_CH2_MUX, FIELD_PREP(R62_CH2_=
MUX, index));
> +		break;
> +	case CDCE6214_CLK_OUT3:
> +		regmap_update_bits(priv->regmap, R67, R67_CH3_MUX, FIELD_PREP(R67_CH3_=
MUX, index));
> +		break;
> +	case CDCE6214_CLK_OUT4:
> +		regmap_update_bits(priv->regmap, R72, R72_CH4_MUX, FIELD_PREP(R72_CH4_=
MUX, index));
> +		break;

Can you properly describe your clock rather than doing this sort of
matching ?

> +	};
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops cdce6214_clk_out_ops =3D {
> +	.prepare =3D cdce6214_clk_out_prepare,
> +	.unprepare =3D cdce6214_clk_out_unprepare,
> +	.is_prepared =3D cdce6214_clk_out_is_prepared,
> +	.recalc_rate =3D cdce6214_clk_out_recalc_rate,
> +	.determine_rate =3D cdce6214_clk_out_determine_rate,
> +	.set_rate =3D cdce6214_clk_out_set_rate,
> +	.get_parent =3D cdce6214_clk_out_get_parent,
> +	.set_parent =3D cdce6214_clk_out_set_parent,
> +};
> +
> +static int pll_calc_values(unsigned long parent_rate, unsigned long out,
> +			   unsigned long *ndiv, unsigned long *num, unsigned long *den)
> +{
> +	u64 a;
> +
> +	if (!parent_rate || out < CDCE6214_VCO_MIN || out > CDCE6214_VCO_MAX)
> +		return -EINVAL;
> +
> +	*den =3D 10000000;
> +	*ndiv =3D out / parent_rate;
> +	a =3D out % parent_rate;
> +	a *=3D *den;
> +	do_div(a, parent_rate);
> +	*num =3D a;
> +
> +	return 0;
> +}
> +
> +static unsigned long cdce6214_clk_pll_recalc_rate(struct clk_hw *hw,
> +						  unsigned long parent_rate)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned long ndiv, num, den;
> +	unsigned int val;
> +
> +	regmap_read(priv->regmap, R30, &val);
> +	ndiv =3D FIELD_GET(R30_PLL_NDIV, val);
> +
> +	regmap_read(priv->regmap, R31, &val);
> +	num =3D FIELD_GET(R31_PLL_NUM_15_0, val);
> +
> +	regmap_read(priv->regmap, R32, &val);
> +	num |=3D FIELD_GET(R32_PLL_NUM_23_16, val) << 16;
> +
> +	regmap_read(priv->regmap, R33, &val);
> +	den =3D FIELD_GET(R33_PLL_DEN_15_0, val);
> +
> +	regmap_read(priv->regmap, R34, &val);
> +	den |=3D FIELD_GET(R34_PLL_DEN_23_16, val) << 16;
> +
> +	if (!den)
> +		den =3D CDCE6214_DENOM_DEFAULT;
> +
> +	return parent_rate * ndiv + DIV_ROUND_CLOSEST_ULL((u64)parent_rate * nu=
m, den);
> +}
> +
> +static int cdce6214_clk_pll_determine_rate(struct clk_hw *hw,
> +					   struct clk_rate_request *req)
> +{
> +	if (!req->best_parent_rate)
> +		return -EINVAL;
> +
> +	req->rate =3D clamp(req->rate, CDCE6214_VCO_MIN, CDCE6214_VCO_MAX);
> +
> +	if (req->rate < req->best_parent_rate * CDCE6214_PLL_NDIV_MIN)
> +		return -EINVAL;
> +
> +	req->min_rate =3D CDCE6214_VCO_MIN;
> +	req->max_rate =3D CDCE6214_VCO_MAX;
> +
> +	return 0;
> +}
> +
> +static bool cdce6214_pll_locked(struct cdce6214 *priv)
> +{
> +	unsigned int val;
> +
> +	regmap_read(priv->regmap, R7, &val);
> +
> +	return val & R7_LOCK_DET;
> +}
> +
> +static int cdce6214_wait_pll_lock(struct cdce6214 *priv)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_read_poll_timeout(priv->regmap, R7, val,
> +				       val & R7_LOCK_DET, 1000, 20000);
> +	if (ret)
> +		dev_err(priv->dev, "Timeout waiting for PLL lock\n");
> +
> +	return ret;
> +}
> +
> +#define R5_PLL_POWER_BITS (R5_PLL_VCOBUFF_LDO_PD | \
> +			   R5_PLL_VCO_LDO_PD | \
> +			   R5_PLL_VCO_BUFF_PD)
> +
> +static int cdce6214_clk_pll_prepare(struct clk_hw *hw)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +
> +	regmap_clear_bits(priv->regmap, R5, R5_PLL_POWER_BITS);
> +
> +	regmap_set_bits(priv->regmap, R0, RO_RECAL);
> +
> +	return cdce6214_wait_pll_lock(priv);
> +}
> +
> +static void cdce6214_clk_pll_unprepare(struct clk_hw *hw)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +
> +	regmap_set_bits(priv->regmap, R5, R5_PLL_POWER_BITS);
> +}
> +
> +static bool cdce6214_clk_pll_powered(struct cdce6214 *priv)
> +{
> +	unsigned int val;
> +
> +	regmap_read(priv->regmap, R5, &val);
> +
> +	return (val & R5_PLL_POWER_BITS) =3D=3D 0;
> +}
> +
> +static int cdce6214_clk_pll_is_prepared(struct clk_hw *hw)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +
> +	return cdce6214_pll_locked(priv);
> +}
> +
> +static int cdce6214_clk_pll_set_rate(struct clk_hw *hw, unsigned long ra=
te,
> +				     unsigned long parent_rate)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned long ndiv, num, den;
> +	int ret;
> +
> +	ret =3D pll_calc_values(parent_rate, rate, &ndiv, &num, &den);
> +	if (ret < 0)
> +		return ret;
> +
> +	regmap_update_bits(priv->regmap, R34, R34_PLL_DEN_23_16,
> +			   FIELD_PREP(R34_PLL_DEN_23_16, den >> 16));
> +	regmap_update_bits(priv->regmap, R33, R33_PLL_DEN_15_0,
> +			   FIELD_PREP(R33_PLL_DEN_15_0, den & 0xffff));
> +	regmap_update_bits(priv->regmap, R32, R32_PLL_NUM_23_16,
> +			   FIELD_PREP(R32_PLL_NUM_23_16, num >> 16));
> +	regmap_update_bits(priv->regmap, R31, R31_PLL_NUM_15_0,
> +			   FIELD_PREP(R31_PLL_NUM_15_0, num & 0xffff));
> +	regmap_update_bits(priv->regmap, R30, R30_PLL_NDIV,
> +			   FIELD_PREP(R30_PLL_NDIV, ndiv));
> +
> +	regmap_update_bits(priv->regmap, R3, R3_FREQ_INC_DEC_REG_MODE | R3_FREQ=
_INC_DEC_EN,
> +			   R3_FREQ_INC_DEC_REG_MODE | R3_FREQ_INC_DEC_EN);
> +
> +	if (cdce6214_clk_pll_powered(priv)) {
> +		regmap_set_bits(priv->regmap, R0, RO_RECAL);
> +		ret =3D cdce6214_wait_pll_lock(priv);
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct clk_ops cdce6214_clk_pll_ops =3D {
> +	.prepare =3D cdce6214_clk_pll_prepare,
> +	.unprepare =3D cdce6214_clk_pll_unprepare,
> +	.is_prepared =3D cdce6214_clk_pll_is_prepared,
> +	.recalc_rate =3D cdce6214_clk_pll_recalc_rate,
> +	.determine_rate =3D cdce6214_clk_pll_determine_rate,
> +	.set_rate =3D cdce6214_clk_pll_set_rate,
> +};
> +
> +static unsigned int cdce6214_clk_psx_mask(int index)
> +{
> +	switch (index) {
> +	case CDCE6214_CLK_PSA:
> +		return R5_PLL_PSA_PD;
> +	case CDCE6214_CLK_PSB:
> +		return R5_PLL_PSB_PD;
> +	default:
> +		return 0;
> +	};
> +}
> +
> +static int cdce6214_clk_psx_prepare(struct clk_hw *hw)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned int mask =3D cdce6214_clk_psx_mask(clock->index);
> +
> +	if (!mask)
> +		return -EINVAL;
> +
> +	return regmap_clear_bits(priv->regmap, R5, mask);
> +}
> +
> +static void cdce6214_clk_psx_unprepare(struct clk_hw *hw)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned int mask =3D cdce6214_clk_psx_mask(clock->index);
> +
> +	if (!mask)
> +		return;
> +
> +	regmap_set_bits(priv->regmap, R5, mask);
> +}
> +
> +static int cdce6214_clk_psx_is_prepared(struct clk_hw *hw)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	unsigned int mask =3D cdce6214_clk_psx_mask(clock->index);
> +	unsigned int val;
> +
> +	if (!mask)
> +		return -EINVAL;
> +
> +	regmap_read(priv->regmap, R5, &val);
> +
> +	return !(val & mask);
> +}

feels like a regular gate

> +
> +static unsigned long cdce6214_clk_psx_recalc_rate(struct clk_hw *hw,
> +						  unsigned long parent_rate)
> +{
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +	const unsigned int psx[] =3D { 4, 5, 6, 6 };
> +	unsigned int val, div;
> +
> +	regmap_read(priv->regmap, R47, &val);
> +
> +	switch (clock->index) {
> +	case CDCE6214_CLK_PSA:
> +		div =3D psx[FIELD_GET(R47_PLL_PSA, val)];
> +		break;
> +	case CDCE6214_CLK_PSB:
> +		div =3D psx[FIELD_GET(R47_PLL_PSB, val)];
> +		break;
> +	};
> +
> +	return DIV_ROUND_UP_ULL((u64)parent_rate, div);
> +}
> +
> +static int cdce6214_get_psx_div(unsigned long rate, unsigned long parent=
_rate)
> +{
> +	unsigned int div =3D DIV_ROUND_CLOSEST(parent_rate, max(rate, 1UL));
> +
> +	return clamp(div, 4, 6);
> +}

Can't you just use a regular divider operation ? split you clocks in
different entities ?

> +
> +static int cdce6214_clk_psx_determine_rate(struct clk_hw *hw,
> +					   struct clk_rate_request *req)
> +{
> +	unsigned int div =3D cdce6214_get_psx_div(req->rate, req->best_parent_r=
ate);
> +
> +	req->rate =3D DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
> +
> +	return 0;
> +}
> +
> +static int cdce6214_clk_psx_set_rate(struct clk_hw *hw, unsigned long ra=
te,
> +				     unsigned long parent_rate)
> +{
> +	unsigned int div =3D cdce6214_get_psx_div(rate, parent_rate);
> +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> +	struct cdce6214 *priv =3D clock->priv;
> +
> +	switch (clock->index) {
> +	case CDCE6214_CLK_PSA:
> +		regmap_update_bits(priv->regmap, R47, R47_PLL_PSA,
> +				   FIELD_PREP(R47_PLL_PSA, div - 4));
> +		break;
> +	case CDCE6214_CLK_PSB:
> +		regmap_update_bits(priv->regmap, R47, R47_PLL_PSB,
> +				   FIELD_PREP(R47_PLL_PSB, div - 4));
> +		break;
> +	};
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops cdce6214_clk_psx_ops =3D {
> +	.prepare =3D cdce6214_clk_psx_prepare,
> +	.unprepare =3D cdce6214_clk_psx_unprepare,
> +	.is_prepared =3D cdce6214_clk_psx_is_prepared,
> +	.recalc_rate =3D cdce6214_clk_psx_recalc_rate,
> +	.determine_rate =3D cdce6214_clk_psx_determine_rate,
> +	.set_rate =3D cdce6214_clk_psx_set_rate,
> +};
> +
> +static int cdce6214_clk_register(struct cdce6214 *priv)
> +{
> +	struct clk_init_data init[CDCE6214_NUM_CLOCKS] =3D { 0 };
> +	struct clk_parent_data pdata_out0[2] =3D {};
> +	struct clk_parent_data pdata_out[4] =3D {};
> +	struct clk_parent_data pdata_pll =3D {};
> +	struct clk_parent_data pdata_psx =3D {};
> +	int i, ret;
> +
> +	pdata_out0[0].fw_name =3D "priref";
> +	pdata_out0[1].fw_name =3D "secref";
> +
> +	init[CDCE6214_CLK_OUT0].ops =3D &cdce6214_clk_out0_ops;
> +	init[CDCE6214_CLK_OUT0].num_parents =3D ARRAY_SIZE(pdata_out0);
> +	init[CDCE6214_CLK_OUT0].parent_data =3D pdata_out0;
> +	init[CDCE6214_CLK_OUT0].flags =3D CLK_SET_RATE_NO_REPARENT;
> +
> +	pdata_out[0].hw =3D &priv->clk[CDCE6214_CLK_PSA].hw;
> +	pdata_out[1].hw =3D &priv->clk[CDCE6214_CLK_PSB].hw;
> +	pdata_out[2].index =3D -1;
> +	pdata_out[3].hw =3D &priv->clk[CDCE6214_CLK_OUT0].hw;
> +
> +	for (i =3D CDCE6214_CLK_OUT1; i <=3D CDCE6214_CLK_OUT4; i++) {
> +		init[i].ops =3D &cdce6214_clk_out_ops;
> +		init[i].num_parents =3D ARRAY_SIZE(pdata_out);
> +		init[i].parent_data =3D pdata_out;
> +		init[i].flags =3D CLK_SET_RATE_NO_REPARENT;
> +	}
> +
> +	init[CDCE6214_CLK_PLL].ops =3D &cdce6214_clk_pll_ops;
> +	init[CDCE6214_CLK_PLL].num_parents =3D 1;
> +	pdata_pll.hw =3D &priv->clk[CDCE6214_CLK_OUT0].hw;
> +	init[CDCE6214_CLK_PLL].parent_data =3D &pdata_pll;
> +
> +	pdata_psx.hw =3D &priv->clk[CDCE6214_CLK_PLL].hw;
> +	for (i =3D CDCE6214_CLK_PSA; i <=3D CDCE6214_CLK_PSB; i++) {
> +		init[i].ops =3D &cdce6214_clk_psx_ops;
> +		init[i].num_parents =3D 1;
> +		init[i].parent_data =3D &pdata_psx;
> +	}
> +
> +	for (i =3D 0; i < CDCE6214_NUM_CLOCKS; i++) {
> +		struct cdce6214_clock *clk =3D &priv->clk[i];
> +		char name[128];
> +
> +		if (!init[i].ops)
> +			continue;
> +
> +		snprintf(name, sizeof(name), "%s_%s", dev_name(priv->dev), clk_names[i=
]);
> +		init[i].name =3D name;
> +		clk->hw.init =3D &init[i];
> +		clk->priv =3D priv;
> +		clk->index =3D i;
> +		ret =3D devm_clk_hw_register(priv->dev, &clk->hw);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +enum cdce6214_pin_name {
> +	NONE,
> +	PRIREF,
> +	SECREF,
> +	OUT0,
> +	OUT1,
> +	OUT2,
> +	OUT3,
> +	OUT4,
> +};
> +
> +static const struct pinctrl_pin_desc cdce6214_pinctrl_pins[] =3D {
> +	PINCTRL_PIN(PRIREF, "priref"),
> +	PINCTRL_PIN(SECREF, "secref"),
> +	PINCTRL_PIN(OUT0, "out0"),
> +	PINCTRL_PIN(OUT1, "out1"),
> +	PINCTRL_PIN(OUT2, "out2"),
> +	PINCTRL_PIN(OUT3, "out3"),
> +	PINCTRL_PIN(OUT4, "out4"),
> +};
> +
> +enum cdce6214_io_standards {
> +	cdce6214_iostd_min,
> +	cdce6214_iostd_cmos,
> +	cdce6214_iostd_lvds,
> +	cdce6214_iostd_lp_hcsl,
> +	cdce6214_iostd_xtal,
> +	cdce6214_iostd_diff,
> +	cdce6214_iostd_max
> +};
> +
> +#define PIN_CONFIG_IOSTANDARD		(PIN_CONFIG_END + 1)
> +#define PIN_CONFIG_CMOSN_MODE		(PIN_CONFIG_END + 2)
> +#define PIN_CONFIG_CMOSP_MODE		(PIN_CONFIG_END + 3)
> +#define PIN_CONFIG_XO_CLOAD		(PIN_CONFIG_END + 4)
> +#define PIN_CONFIG_XO_BIAS		(PIN_CONFIG_END + 5)
> +
> +static const struct pinconf_generic_params cdce6214_dt_params[] =3D {
> +	{"ti,io-standard", PIN_CONFIG_IOSTANDARD, cdce6214_iostd_min},
> +	{"ti,cmosn-mode", PIN_CONFIG_CMOSN_MODE, CDCE6214_CMOS_MODE_LOW},
> +	{"ti,cmosp-mode", PIN_CONFIG_CMOSP_MODE, CDCE6214_CMOS_MODE_HIGH},
> +	{"ti,xo-cload-femtofarads", PIN_CONFIG_XO_CLOAD, 0},
> +	{"ti,xo-bias-microamp", PIN_CONFIG_XO_BIAS, 0},
> +};
> +
> +static const struct pin_config_item cdce6214_conf_items[] =3D {
> +	PCONFDUMP(PIN_CONFIG_IOSTANDARD, "IO-standard", NULL, true),
> +	PCONFDUMP(PIN_CONFIG_CMOSN_MODE, "CMOS-N mode", NULL, true),
> +	PCONFDUMP(PIN_CONFIG_CMOSP_MODE, "CMOS-P mode", NULL, true),
> +	PCONFDUMP(PIN_CONFIG_XO_CLOAD, "XO cload", "fF", true),
> +	PCONFDUMP(PIN_CONFIG_XO_BIAS, "XO bias", "uA", true),
> +};
> +
> +static int cdce6214_pinconf_get_iostd(struct cdce6214 *priv, unsigned in=
t pin)
> +{
> +	struct regmap *reg =3D priv->regmap;
> +	unsigned int r24, r57, r59, r63, r65, r68, r70, r73, r75;
> +
> +	switch (pin) {
> +	case OUT0:
> +		return cdce6214_iostd_cmos;
> +	case OUT1:
> +		regmap_read(reg, R57, &r57);
> +		regmap_read(reg, R59, &r59);
> +		if (r59 & R59_CH1_LVDS_EN)
> +			return cdce6214_iostd_lvds;
> +		if (r57 & R57_CH1_LPHCSL_EN)
> +			return cdce6214_iostd_lp_hcsl;
> +		return cdce6214_iostd_cmos;
> +	case OUT2:
> +		regmap_read(reg, R63, &r63);
> +		regmap_read(reg, R65, &r65);
> +		if (r65 & R65_CH2_LVDS_EN)
> +			return cdce6214_iostd_lvds;
> +		if (r63 & R63_CH2_LPHCSL_EN)
> +			return cdce6214_iostd_lp_hcsl;
> +		return -EINVAL;
> +	case OUT3:
> +		regmap_read(reg, R68, &r68);
> +		regmap_read(reg, R70, &r70);
> +		if (r70 & R70_CH3_LVDS_EN)
> +			return cdce6214_iostd_lvds;
> +		if (r68 & R68_CH3_LPHCSL_EN)
> +			return cdce6214_iostd_lp_hcsl;
> +		return -EINVAL;
> +	case OUT4:
> +		regmap_read(reg, R73, &r73);
> +		regmap_read(reg, R75, &r75);
> +		if (r75 & R75_CH4_LVDS_EN)
> +			return cdce6214_iostd_lvds;
> +		if (r73 & R73_CH4_LPHCSL_EN)
> +			return cdce6214_iostd_lp_hcsl;
> +		return cdce6214_iostd_cmos;
> +	case PRIREF:
> +		regmap_read(reg, R24, &r24);
> +		if (r24 & R24_IP_PRIREF_BUF_SEL)
> +			return cdce6214_iostd_diff;
> +		else
> +			return cdce6214_iostd_cmos;
> +	case SECREF:
> +		regmap_read(reg, R24, &r24);
> +		switch (FIELD_GET(R24_IP_SECREF_BUF_SEL, r24)) {
> +		case R24_IP_SECREF_BUF_SEL_XTAL:
> +			return cdce6214_iostd_xtal;
> +		case R24_IP_SECREF_BUF_SEL_LVCMOS:
> +			return cdce6214_iostd_cmos;
> +		default:
> +			return cdce6214_iostd_diff;
> +		}
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +/*
> + * OUT1 and OUT4 have the CMOS enable and polarity bits at the same posi=
tions,
> + * but with N and P swapped.
> + */
> +static int cdce6214_cmos_fields(unsigned int pin, bool p, unsigned int *=
reg,
> +				unsigned int *en, unsigned int *pol)
> +{
> +	switch (pin) {
> +	case OUT0:
> +	case OUT2:
> +	case OUT3:
> +	case PRIREF:
> +	case SECREF:
> +		return -EOPNOTSUPP;
> +	case OUT1:
> +		*reg =3D R59;
> +		*en =3D p ? R59_CH1_CMOSP_EN : R59_CH1_CMOSN_EN;
> +		*pol =3D p ? R59_CH1_CMOSP_POL : R59_CH1_CMOSN_POL;
> +		return 0;
> +	case OUT4:
> +		*reg =3D R75;
> +		*en =3D p ? R75_CH4_CMOSP_EN : R75_CH4_CMOSN_EN;
> +		*pol =3D p ? R75_CH4_CMOSP_POL : R75_CH4_CMOSN_POL;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int cdce6214_pinconf_get_cmos_mode(struct cdce6214 *priv, unsigne=
d int pin,
> +					  bool p)
> +{
> +	unsigned int reg, en, pol, val;
> +	int ret;
> +
> +	ret =3D cdce6214_cmos_fields(pin, p, &reg, &en, &pol);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read(priv->regmap, reg, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (!(val & en))
> +		return CDCE6214_CMOS_MODE_DISABLED;
> +	if (val & pol)
> +		return CDCE6214_CMOS_MODE_HIGH;
> +	else
> +		return CDCE6214_CMOS_MODE_LOW;
> +}
> +
> +static const unsigned short ip_xo_cload[] =3D {
> +	/* index is the register value */
> +	3000, 3200, 3400, 3600, 3800, 4000, 4200, 4400,
> +	4600, 4800, 5000, 5200, 5400, 5600, 5800, 6000,
> +	6200, 6400, 6500, 6700, 6900, 7100, 7300, 7500,
> +	7700, 7900, 8100, 8300, 8500, 8700, 8900, 9000
> +};
> +
> +static int cdce6214_pinconf_get_xo_cload(struct cdce6214 *priv, unsigned=
 int pin)
> +{
> +	unsigned int val;
> +
> +	if (pin !=3D SECREF)
> +		return -EOPNOTSUPP;
> +
> +	regmap_read(priv->regmap, R24, &val);
> +
> +	val =3D FIELD_GET(R24_IP_XO_CLOAD, val);
> +
> +	if (val >=3D ARRAY_SIZE(ip_xo_cload))
> +		return -EINVAL;
> +
> +	return ip_xo_cload[val];
> +}
> +
> +static const unsigned short ip_bias_sel_xo[] =3D {
> +	/* index is the register value */
> +	0, 14, 29, 44,
> +	59, 148, 295, 443,
> +	591, 884, 1177, 1468, 1758
> +};
> +
> +static int cdce6214_pinconf_get_xo_bias(struct cdce6214 *priv, unsigned =
int pin)
> +{
> +	unsigned int val;
> +
> +	if (pin !=3D SECREF)
> +		return -EOPNOTSUPP;
> +
> +	regmap_read(priv->regmap, R24, &val);
> +
> +	val =3D FIELD_GET(R24_IP_BIAS_SEL_XO, val);
> +
> +	if (val >=3D ARRAY_SIZE(ip_bias_sel_xo))
> +		return -EINVAL;
> +
> +	return ip_bias_sel_xo[val];
> +}
> +
> +static int cdce6214_pinconf_get(struct pinctrl_dev *pctldev, unsigned in=
t pin,
> +				unsigned long *config)
> +{
> +	struct cdce6214 *priv =3D pinctrl_dev_get_drvdata(pctldev);
> +	unsigned int param =3D pinconf_to_config_param(*config);
> +	int arg =3D 0;
> +
> +	switch (param) {
> +	case PIN_CONFIG_IOSTANDARD:
> +		arg =3D cdce6214_pinconf_get_iostd(priv, pin);
> +		break;
> +	case PIN_CONFIG_CMOSN_MODE:
> +		arg =3D cdce6214_pinconf_get_cmos_mode(priv, pin, false);
> +		break;
> +	case PIN_CONFIG_CMOSP_MODE:
> +		arg =3D cdce6214_pinconf_get_cmos_mode(priv, pin, true);
> +		break;
> +	case PIN_CONFIG_XO_CLOAD:
> +		arg =3D cdce6214_pinconf_get_xo_cload(priv, pin);
> +		break;
> +	case PIN_CONFIG_XO_BIAS:
> +		arg =3D cdce6214_pinconf_get_xo_bias(priv, pin);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (arg < 0)
> +		return arg;
> +
> +	*config =3D pinconf_to_config_packed(param, arg);
> +
> +	return 0;
> +}
> +
> +static int cdce6214_pinconf_set_iostd(struct cdce6214 *priv, unsigned in=
t pin,
> +				      unsigned int param)
> +{
> +	struct regmap *reg =3D priv->regmap;
> +
> +	switch (pin) {
> +	case OUT0:
> +		if (param =3D=3D CDCE6214_IOSTD_CMOS)
> +			break;
> +		goto err_illegal_fmt;
> +	case OUT1:
> +		switch (param) {
> +		case CDCE6214_IOSTD_CMOS:
> +			regmap_clear_bits(reg, R59, R59_CH1_LVDS_EN);
> +			regmap_clear_bits(reg, R57, R57_CH1_LPHCSL_EN);
> +			break;
> +		case CDCE6214_IOSTD_LVDS:
> +			regmap_clear_bits(reg, R57, R57_CH1_LPHCSL_EN);
> +			regmap_set_bits(reg, R59, R59_CH1_LVDS_EN);
> +			break;
> +		case CDCE6214_IOSTD_LP_HCSL:
> +			regmap_clear_bits(reg, R59, R59_CH1_LVDS_EN);
> +			regmap_set_bits(reg, R57, R57_CH1_LPHCSL_EN);
> +			break;
> +		default:
> +			goto err_illegal_fmt;
> +		}
> +		break;
> +	case OUT2:
> +		switch (param) {
> +		case CDCE6214_IOSTD_LVDS:
> +			regmap_set_bits(reg, R65, R65_CH2_LVDS_EN);
> +			regmap_clear_bits(reg, R63, R63_CH2_LPHCSL_EN);
> +			break;
> +		case CDCE6214_IOSTD_LP_HCSL:
> +			regmap_set_bits(reg, R63, R63_CH2_LPHCSL_EN);
> +			regmap_clear_bits(reg, R65, R65_CH2_LVDS_EN);
> +			break;
> +		default:
> +			goto err_illegal_fmt;
> +		}
> +		break;
> +	case OUT3:
> +		switch (param) {
> +		case CDCE6214_IOSTD_LVDS:
> +			regmap_set_bits(reg, R70, R70_CH3_LVDS_EN);
> +			regmap_clear_bits(reg, R68, R68_CH3_LPHCSL_EN);
> +			break;
> +		case CDCE6214_IOSTD_LP_HCSL:
> +			regmap_set_bits(reg, R68, R68_CH3_LPHCSL_EN);
> +			regmap_clear_bits(reg, R70, R70_CH3_LVDS_EN);
> +			break;
> +		default:
> +			goto err_illegal_fmt;
> +		}
> +		break;
> +	case OUT4:
> +		switch (param) {
> +		case CDCE6214_IOSTD_CMOS:
> +			regmap_clear_bits(reg, R75, R75_CH4_LVDS_EN);
> +			regmap_clear_bits(reg, R73, R73_CH4_LPHCSL_EN);
> +			break;
> +		case CDCE6214_IOSTD_LVDS:
> +			regmap_clear_bits(reg, R73, R73_CH4_LPHCSL_EN);
> +			regmap_set_bits(reg, R75, R75_CH4_LVDS_EN);
> +			break;
> +		case CDCE6214_IOSTD_LP_HCSL:
> +			regmap_clear_bits(reg, R75, R75_CH4_LVDS_EN);
> +			regmap_set_bits(reg, R73, R73_CH4_LPHCSL_EN);
> +			break;
> +		default:
> +			goto err_illegal_fmt;
> +		}
> +		break;
> +	case PRIREF:
> +		switch (param) {
> +		case CDCE6214_IOSTD_CMOS:
> +			regmap_clear_bits(reg, R24, R24_IP_PRIREF_BUF_SEL);
> +			break;
> +		case CDCE6214_IOSTD_DIFF:
> +			regmap_set_bits(reg, R24, R24_IP_PRIREF_BUF_SEL);
> +			break;
> +		default:
> +			goto err_illegal_fmt;
> +		}
> +		break;
> +	case SECREF:
> +		switch (param) {
> +		case CDCE6214_IOSTD_CMOS:
> +			regmap_update_bits(reg, R24, R24_IP_SECREF_BUF_SEL,
> +					   R24_IP_SECREF_BUF_SEL_LVCMOS);
> +			break;
> +		case CDCE6214_IOSTD_XTAL:
> +			regmap_update_bits(reg, R24, R24_IP_SECREF_BUF_SEL,
> +					   R24_IP_SECREF_BUF_SEL_XTAL);
> +			break;
> +		case CDCE6214_IOSTD_DIFF:
> +			regmap_update_bits(reg, R24, R24_IP_SECREF_BUF_SEL,
> +					   R24_IP_SECREF_BUF_SEL_DIFF);
> +			break;
> +		default:
> +			goto err_illegal_fmt;
> +		}
> +
> +		break;
> +	}
> +
> +	return 0;
> +
> +err_illegal_fmt:
> +
> +	return -EINVAL;
> +}
> +
> +static int cdce6214_pinconf_set_cmos_mode(struct cdce6214 *priv, unsigne=
d int pin,
> +					  bool p, unsigned int param)
> +{
> +	unsigned int reg, en, pol, val;
> +	int ret;
> +
> +	ret =3D cdce6214_cmos_fields(pin, p, &reg, &en, &pol);
> +	if (ret)
> +		return -EINVAL;
> +
> +	switch (param) {
> +	case CDCE6214_CMOS_MODE_LOW:
> +		val =3D en;
> +		break;
> +	case CDCE6214_CMOS_MODE_HIGH:
> +		val =3D pol | en;
> +		break;
> +	case CDCE6214_CMOS_MODE_DISABLED:
> +		val =3D 0;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return regmap_update_bits(priv->regmap, reg, pol | en, val);
> +}
> +
> +static int cdce6214_pinconf_set_xo_cload(struct cdce6214 *priv, unsigned=
 int pin,
> +					 unsigned int param)
> +{
> +	int i;
> +
> +	if (pin !=3D SECREF)
> +		return -EINVAL;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(ip_xo_cload); i++)
> +		if (param <=3D ip_xo_cload[i])
> +			break;
> +
> +	if (i >=3D ARRAY_SIZE(ip_xo_cload))
> +		i =3D ARRAY_SIZE(ip_xo_cload) - 1;
> +
> +	regmap_update_bits(priv->regmap, R24, R24_IP_XO_CLOAD,
> +			   FIELD_PREP(R24_IP_XO_CLOAD, i));
> +
> +	return 0;
> +}
> +
> +static int cdce6214_pinconf_set_xo_bias(struct cdce6214 *priv, unsigned =
int pin,
> +					unsigned int param)
> +{
> +	int i;
> +
> +	if (pin !=3D SECREF)
> +		return -EINVAL;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(ip_bias_sel_xo); i++)
> +		if (param <=3D ip_bias_sel_xo[i])
> +			break;
> +
> +	if (i >=3D ARRAY_SIZE(ip_bias_sel_xo))
> +		i =3D ARRAY_SIZE(ip_bias_sel_xo) - 1;
> +
> +	regmap_update_bits(priv->regmap, R24, R24_IP_BIAS_SEL_XO,
> +			   FIELD_PREP(R24_IP_BIAS_SEL_XO, i));
> +
> +	return 0;
> +}
> +
> +static int cdce6214_pinconf_set_one(struct cdce6214 *priv,
> +			unsigned int pin, unsigned long config)
> +{
> +	unsigned int param;
> +	u32 param_val;
> +	int ret;
> +
> +	param =3D pinconf_to_config_param(config);
> +	param_val =3D pinconf_to_config_argument(config);
> +
> +	switch (param) {
> +	case PIN_CONFIG_IOSTANDARD:
> +		ret =3D cdce6214_pinconf_set_iostd(priv, pin, param_val);
> +		break;
> +	case PIN_CONFIG_CMOSN_MODE:
> +		ret =3D cdce6214_pinconf_set_cmos_mode(priv, pin, false, param_val);
> +		break;
> +	case PIN_CONFIG_CMOSP_MODE:
> +		ret =3D cdce6214_pinconf_set_cmos_mode(priv, pin, true, param_val);
> +		break;
> +	case PIN_CONFIG_XO_CLOAD:
> +		ret =3D cdce6214_pinconf_set_xo_cload(priv, pin, param_val);
> +		break;
> +	case PIN_CONFIG_XO_BIAS:
> +		ret =3D cdce6214_pinconf_set_xo_bias(priv, pin, param_val);
> +		break;
> +	default:
> +		dev_err(priv->dev, "Property %u not supported\n", param);
> +		ret =3D -EOPNOTSUPP;
> +	}
> +
> +	return ret;
> +}
> +
> +static int cdce6214_pinconf_set(struct pinctrl_dev *pctldev,
> +			unsigned int pin, unsigned long *configs,
> +			unsigned int num_configs)
> +{
> +	struct cdce6214 *priv =3D pinctrl_dev_get_drvdata(pctldev);
> +	int ret, i;
> +
> +	for (i =3D 0; i < num_configs; i++) {
> +		ret =3D cdce6214_pinconf_set_one(priv, pin, configs[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rtc_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
> +{
> +	return 0;
> +}
> +
> +static const char *rtc_pinctrl_get_group_name(struct pinctrl_dev *pctlde=
v,
> +					      unsigned int group)
> +{
> +	return NULL;
> +}
> +
> +static const struct pinctrl_ops rtc_pinctrl_ops =3D {
> +	.get_groups_count =3D rtc_pinctrl_get_groups_count,
> +	.get_group_name =3D rtc_pinctrl_get_group_name,
> +	.dt_node_to_map =3D pinconf_generic_dt_node_to_map_pin,
> +	.dt_free_map =3D pinconf_generic_dt_free_map,
> +};
> +
> +static const struct pinconf_ops cdce6214_pinconf_ops =3D {
> +	.is_generic =3D true,
> +	.pin_config_get =3D cdce6214_pinconf_get,
> +	.pin_config_set =3D cdce6214_pinconf_set,
> +};
> +
> +static struct pinctrl_desc cdce6214_pdesc =3D {
> +	.name =3D "cdce6214-pinctrl",
> +	.pins =3D cdce6214_pinctrl_pins,
> +	.npins =3D ARRAY_SIZE(cdce6214_pinctrl_pins),
> +	.pctlops =3D &rtc_pinctrl_ops,
> +	.owner =3D THIS_MODULE,
> +	.confops =3D &cdce6214_pinconf_ops,
> +	.num_custom_params =3D ARRAY_SIZE(cdce6214_dt_params),
> +	.custom_params =3D cdce6214_dt_params,
> +	.custom_conf_items =3D cdce6214_conf_items,
> +};
> +
> +static int cdce6214_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct cdce6214 *priv;
> +	struct pinctrl_dev *pctl;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->client =3D client;
> +	priv->dev =3D dev;
> +	i2c_set_clientdata(client, priv);
> +	dev_set_drvdata(dev, priv);
> +
> +	priv->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LO=
W);
> +	if (IS_ERR(priv->reset_gpio)) {
> +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> +				     "failed to get reset gpio\n");
> +	}
> +
> +	priv->regmap =3D devm_regmap_init_i2c(client, &cdce6214_regmap_config);
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "failed to init regmap\n");
> +
> +	ret =3D cdce6214_configure(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_pinctrl_register_and_init(dev, &cdce6214_pdesc, priv, &pct=
l);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "pinctrl register failed");
> +
> +	ret =3D pinctrl_enable(pctl);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "pinctrl enable failed");

It feels like it should an MFD driver. half the driver belong in pinctrl

> +
> +	ret =3D cdce6214_clk_register(priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register clocks\n");
> +
> +	return devm_of_clk_add_hw_provider(dev, cdce6214_of_clk_get, priv);
> +}
> +
> +static const struct of_device_id cdce6214_ids[] =3D {
> +	{ .compatible =3D "ti,cdce6214" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, cdce6214_ids);
> +
> +static struct i2c_driver cdce6214_driver =3D {
> +	.driver =3D {
> +		.name =3D "cdce6214",
> +		.of_match_table =3D cdce6214_ids,
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.probe =3D cdce6214_probe,
> +};
> +module_i2c_driver(cdce6214_driver);
> +
> +MODULE_AUTHOR("Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>");
> +MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
> +MODULE_DESCRIPTION("TI CDCE6214 driver");
> +MODULE_LICENSE("GPL");
>
> --=20
> 2.47.3
>

--=20
Jerome
