Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303840;
	b=k8jfZawhvMif4uzoQCMwF+28bv7I+7npYpKLT28AnMslqGQfSWQmEeh+OCM/HzA5eZim
	 VT5v5heqwb5pO6rYyFrokYhgZ7wBG91ZPLVA4KqOBoZNUMNYueuWQHGrwiXt27bfx8wgY
	 tx8yOmcsPMhpuyPnMUuVsXdDF1Js/e5ro9Lc7MyUxI2Bx0jMzuT+S2+NTUioVnWdSpdRM
	 MO1ywDZnOl18PHnEnErg4Ydlxj5TLRKNOV5HJOV6NOtw8/02MgZwZ93pe6cu2JKkY83EM
	 UMTBYgpxK1uGX6ATctdYt5DerdKeIQWLLExbvEmfBxDkTywmu60ojtrOY1m1P5YxgpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303840;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=hbmn7hKLMXrocivXVlyaHukCB3sGYGhuEEFr1F0i+6M=;
	b=jttRSn7RV2Euh/RPznCIBSBVT1BXB7ygvAMBiaNrHP5xFeFqnz0eBSiXUy9K1gD9A7W+
	 qDMWNGoLdWXKKJR9VjWzHhmGgptbra69Y9Qy8ubWD2YX8jjluYzKttAhC5F5wn9UipnLX
	 U4+64q2SAtBJsKIZsvKTkjrGDaGW0RzEpakhIAml70++4Hoi+dUGikAIBsHxMTRYnmNVg
	 StiqyazMvAwsqVooDdYwpB+JErnBVoKvr+uWl2dJmx0bCauceoriCRpkxO2GIhgqpyjXd
	 e6aIZol478KOQ3CbrbXevV3lMXZ1AppgiftmG97rXYR+mfHexFbrIOIHRbbNHca0Dkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airoha.com;
	spf=pass smtp.mailfrom=airoha.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=RWb5eDUV;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EA5606C653;
	Tue, 10 Nov 2026 09:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63EA5606C653
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airoha.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airoha.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=RWb5eDUV
X-UUID: 3c91e900dceb11f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hbmn7hKLMXrocivXVlyaHukCB3sGYGhuEEFr1F0i+6M=;
	b=RWb5eDUVfErKCztbwc2mi/oZfxsAUDn6ufDUPvWX6XD1/CVaI62DJddxgRil8p6n6vqjzjdtktHAnuG2PN6U+0VrjIDaoJsnOrsVPEfJzn1wol0YxlD+49Ouhy/RJyT20OGRzO9+vbwXiuM1HD5yAG7MAsuWne9tGqFdbDOYAfU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:6052c3b9-6e8a-40e5-96dd-f3efe9e507ec,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:1b7d1357-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3c91e900dceb11f1b1788b6acf885367-20261110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 835175819; Tue, 10 Nov 2026 17:43:51 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 17:43:50 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Tue, 10 Nov 2026 17:43:50 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: <linusw@kernel.org>, <lorenzo@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<brgl@kernel.org>, <mikhail.kshevetskiy@iopsys.eu>, <naseefkm@gmail.com>,
	<benjamin.larsson@genexis.eu>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <lei.dong@airoha.com>,
	<ansuelsmth@gmail.com>, Zhengping Zhang <zhengping.zhang@airoha.com>
Subject: [PATCH 11/12] pinctrl: airoha: en7523: use force GPIO mode for GPIO requests
Date: Tue, 10 Nov 2026 17:43:38 +0800
Message-ID: <20261110094339.749110-12-zhengping.zhang@airoha.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110094339.749110-1-zhengping.zhang@airoha.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

GPIO requests can leave pads controlled by alternate functions selected
by the bootloader. Extend the GPIO mux groups to GPIO0-29 and enable
the shared GPIO request handling and mux conflict checks. GPIO consumers
and explicit GPIO pinctrl states then use the same configuration tables.

Use per-pad force GPIO overrides without disabling shared peripheral
modes on other pads. Select GPIO mode using the following SCU register
bits, where n is the GPIO number:

  - GPIO0-29: set bit n in register 0x224
    (GPIO0 -> bit 0, ..., GPIO29 -> bit 29).
  - GPIO28: also set the PCIe reset0 GPIO selector at register
    0x218, bit 9.
  - GPIO29: also set the PCIe reset1 GPIO selector at register
    0x218, bit 10.

Unlike AN7581 and AN7583, EN7523 provides a force GPIO bit for GPIO0.
Clear the requested pad's PWM selection when selecting GPIO.

When selecting a peripheral function, clear the corresponding force
GPIO overrides so an earlier GPIO configuration does not prevent
peripheral operation. Enable the overrides when selecting PWM output.

Exclude the software-controlled TX_DIS/RX_DIS pads (GPIO16/21) from the
hardware PON mux group. These signals serve the PON interface but are
intended to be requested as GPIOs by the PON PHY driver and controlled
through the GPIO API rather than driven by the PON hardware. This
avoids ownership conflicts between PON mux selection and GPIO requests.

Correct the 128-pin PCM SPI CS2 group to use GPIO29 (pinctrl pin 41)
instead of GPIO27. The share-pin table assigns GPIO29 to CS2 in the
128-pin package and GPIO27 to CS2 in the 156-pin package. Keep the
156-pin group unchanged, and clear GPIO29's PCIe GPIO selector when
selecting its PCM SPI CS2 function.

Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 drivers/pinctrl/airoha/pinctrl-en7523.c | 579 +++++++++++++++++++-----
 1 file changed, 473 insertions(+), 106 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
index b0c5e60f0aeb9..041536790fd8b 100644
--- a/drivers/pinctrl/airoha/pinctrl-en7523.c
+++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
@@ -211,7 +211,7 @@
 	}
 
 /* PWM */
-#define AIROHA_PINCTRL_PWM(gpio, mux_val)			\
+#define AIROHA_PINCTRL_PWM(gpio, mux_val, force_reg, force_mask) \
 	{							\
 		.name = (gpio),					\
 		.regmap[0] = {					\
@@ -220,10 +220,14 @@
 			(mux_val),				\
 			(mux_val)				\
 		},						\
-		.regmap_size = 1,				\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX, (force_reg),		\
+			(force_mask), (force_mask)			\
+		},						\
+		.regmap_size = 2,				\
 	}
 
-#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)			\
+#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val, force_reg, force_mask) \
 	{							\
 		.name = (gpio),					\
 		.regmap[0] = {					\
@@ -232,10 +236,14 @@
 			(mux_val),				\
 			(mux_val)				\
 		},						\
-		.regmap_size = 1,				\
+		.regmap[1] = {					\
+			AIROHA_FUNC_MUX, (force_reg),		\
+			(force_mask), (force_mask)			\
+		},						\
+		.regmap_size = 2,				\
 	}
 
-#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)	\
+#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val, force_reg, force_mask) \
 	{							\
 		.name = (gpio),					\
 		.regmap[0] = {					\
@@ -250,10 +258,14 @@
 			(smux_val),				\
 			(smux_val)				\
 		},						\
-		.regmap_size = 2,				\
+		.regmap[2] = {					\
+			AIROHA_FUNC_MUX, (force_reg),		\
+			(force_mask), (force_mask)			\
+		},						\
+		.regmap_size = 3,				\
 	}
 
-#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)	\
+#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val, force_reg, force_mask) \
 	{								\
 		.name = (gpio),						\
 		.regmap[0] = {						\
@@ -268,10 +280,14 @@
 			(map_mask),					\
 			(map_val),					\
 		},							\
-		.regmap_size = 2,					\
+		.regmap[2] = {					\
+			AIROHA_FUNC_MUX, (force_reg),		\
+			(force_mask), 0			\
+		},						\
+		.regmap_size = 3,					\
 	}
 
-#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)	\
+#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val, force_reg, force_mask) \
 	{								\
 		.name = (gpio),						\
 		.regmap[0] = {						\
@@ -286,7 +302,11 @@
 			(map_mask),					\
 			(map_val),					\
 		},							\
-		.regmap_size = 2,					\
+		.regmap[2] = {					\
+			AIROHA_FUNC_MUX, (force_reg),		\
+			(force_mask), 0			\
+		},						\
+		.regmap_size = 3,					\
 	}
 
 static struct pinctrl_pin_desc pinctrl_pins[] = {
@@ -330,7 +350,8 @@ static struct pinctrl_pin_desc pinctrl_pins[] = {
 	PINCTRL_PIN(41, "pcie_reset1"),
 };
 
-static const int pon_pins[] = { 28, 29, 30, 31, 32, 33 };
+/* TX_DIS (GPIO16) and RX_DIS (GPIO21) are software GPIOs. */
+static const int pon_pins[] = { 29, 30, 31, 32 };
 static const int pon_tod_1pps_pins[] = { 21 };
 static const int gsw_tod_1pps_pins[] = { 21 };
 static const int sipo_pins[] = { 13, 38 };
@@ -352,7 +373,7 @@ static const int pcm_spi_pins[] = { 16, 17, 18, 19, 24, 25, 26, 27 };
 static const int pcm_spi_int_pins[] = { 15 };
 static const int pcm_spi_rst_pins[] = { 14 };
 static const int pcm_spi_cs1_pins[] = { 22 };
-static const int pcm_spi_cs2_p128_pins[] = { 39 };
+static const int pcm_spi_cs2_p128_pins[] = { 41 };
 static const int pcm_spi_cs2_p156_pins[] = { 39 };
 static const int pcm_spi_cs3_pins[] = { 20 };
 static const int pcm_spi_cs4_pins[] = { 23 };
@@ -466,7 +487,13 @@ static const char *const pcm_spi_groups[] = {
 	"pcm_spi_cs2_p156", "pcm_spi_cs2_p128", "pcm_spi_cs3", "pcm_spi_cs4"
 };
 static const char *const i2s_groups[] = { "i2s" };
-static const char *const gpio_groups[] = { "gpio28", "gpio29" };
+static const char *const gpio_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5",
+	"gpio6", "gpio7", "gpio8", "gpio9", "gpio10", "gpio11",
+	"gpio12", "gpio13", "gpio14", "gpio15", "gpio16", "gpio17",
+	"gpio18", "gpio19", "gpio20", "gpio21", "gpio22", "gpio23",
+	"gpio24", "gpio25", "gpio26", "gpio27", "gpio28", "gpio29",
+};
 static const char *const pcie_reset_groups[] = {
 	"pcie_reset0", "pcie_reset1"
 };
@@ -511,7 +538,16 @@ static const struct airoha_pinctrl_func_group pon_func_group[] = {
 			GPIO_PON_MODE_MASK,
 			GPIO_PON_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(17) |
+			BIT(18) |
+			BIT(19) |
+			BIT(20),
+			0
+		},
+		.regmap_size = 2,
 	},
 };
 
@@ -524,7 +560,13 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 			PON_TOD_1PPS_MODE_MASK,
 			PON_TOD_1PPS_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(9),
+			0
+		},
+		.regmap_size = 2,
 	}, {
 		.name = "gsw_tod_1pps",
 		.regmap[0] = {
@@ -533,7 +575,13 @@ static const struct airoha_pinctrl_func_group tod_1pps_func_group[] = {
 			GSW_TOD_1PPS_MODE_MASK,
 			GSW_TOD_1PPS_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(9),
+			0
+		},
+		.regmap_size = 2,
 	},
 };
 
@@ -546,7 +594,14 @@ static const struct airoha_pinctrl_func_group sipo_func_group[] = {
 			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
 			GPIO_SIPO_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(1) |
+			BIT(26),
+			0
+		},
+		.regmap_size = 2,
 	}, {
 		.name = "sipo_rclk",
 		.regmap[0] = {
@@ -555,7 +610,15 @@ static const struct airoha_pinctrl_func_group sipo_func_group[] = {
 			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK,
 			GPIO_SIPO_MODE_MASK | SIPO_RCLK_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(1) |
+			BIT(18) |
+			BIT(26),
+			0
+		},
+		.regmap_size = 2,
 	},
 };
 
@@ -568,7 +631,14 @@ static const struct airoha_pinctrl_func_group mdio_func_group[] = {
 			GPIO_SGMII_MDIO_MODE_MASK,
 			GPIO_SGMII_MDIO_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(8) |
+			BIT(9),
+			0
+		},
+		.regmap_size = 2,
 	},
 };
 
@@ -581,7 +651,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 			GPIO_UART2_MODE_MASK,
 			GPIO_UART2_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(8) |
+			BIT(9),
+			0
+		},
+		.regmap_size = 2,
 	}, {
 		.name = "npu_uart",
 		.regmap[0] = {
@@ -590,7 +667,14 @@ static const struct airoha_pinctrl_func_group uart_func_group[] = {
 			NPU_UART_EN_MASK,
 			NPU_UART_EN_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(1) |
+			BIT(26),
+			0
+		},
+		.regmap_size = 2,
 	}
 };
 
@@ -603,7 +687,14 @@ static const struct airoha_pinctrl_func_group i2c_func_group[] = {
 			GPIO_2ND_I2C_MODE_MASK,
 			GPIO_2ND_I2C_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(2) |
+			BIT(3),
+			0
+		},
+		.regmap_size = 2,
 	},
 };
 
@@ -616,7 +707,17 @@ static const struct airoha_pinctrl_func_group jtag_func_group[] = {
 			JTAG_UDI_EN_MASK,
 			JTAG_UDI_EN_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(22) |
+			BIT(23) |
+			BIT(24) |
+			BIT(25) |
+			BIT(26),
+			0
+		},
+		.regmap_size = 2,
 	}, {
 		.name = "jtag_dfd",
 		.regmap[0] = {
@@ -625,7 +726,17 @@ static const struct airoha_pinctrl_func_group jtag_func_group[] = {
 			JTAG_DFD_EN_MASK,
 			JTAG_DFD_EN_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(22) |
+			BIT(23) |
+			BIT(24) |
+			BIT(25) |
+			BIT(26),
+			0
+		},
+		.regmap_size = 2,
 	},
 };
 
@@ -638,7 +749,16 @@ static const struct airoha_pinctrl_func_group pcm_func_group[] = {
 			GPIO_PCM1_MODE_MASK,
 			GPIO_PCM1_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(12) |
+			BIT(13) |
+			BIT(14) |
+			BIT(15),
+			0
+		},
+		.regmap_size = 2,
 	}, {
 		.name = "pcm2",
 		.regmap[0] = {
@@ -647,7 +767,16 @@ static const struct airoha_pinctrl_func_group pcm_func_group[] = {
 			GPIO_PCM2_MODE_MASK,
 			GPIO_PCM2_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(4) |
+			BIT(5) |
+			BIT(6) |
+			BIT(7),
+			0
+		},
+		.regmap_size = 2,
 	},
 };
 
@@ -660,7 +789,14 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
 			GPIO_SPI_QUAD_MODE_MASK,
 			GPIO_SPI_QUAD_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(2) |
+			BIT(3),
+			0
+		},
+		.regmap_size = 2,
 	}, {
 		.name = "spi_cs1",
 		.regmap[0] = {
@@ -669,7 +805,13 @@ static const struct airoha_pinctrl_func_group spi_func_group[] = {
 			GPIO_SPI_CS1_MODE_MASK,
 			GPIO_SPI_CS1_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(9),
+			0
+		},
+		.regmap_size = 2,
 	},
 };
 
@@ -682,7 +824,20 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 			GPIO_PCM_SPI_MODE_MASK,
 			GPIO_PCM_SPI_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(4) |
+			BIT(5) |
+			BIT(6) |
+			BIT(7) |
+			BIT(12) |
+			BIT(13) |
+			BIT(14) |
+			BIT(15),
+			0
+		},
+		.regmap_size = 2,
 	}, {
 		.name = "pcm_spi_int",
 		.regmap[0] = {
@@ -691,7 +846,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 			GPIO_PCM_INT_MODE_MASK,
 			GPIO_PCM_INT_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(3),
+			0
+		},
+		.regmap_size = 2,
 	}, {
 		.name = "pcm_spi_rst",
 		.regmap[0] = {
@@ -700,7 +861,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 			GPIO_PCM_RESET_MODE_MASK,
 			GPIO_PCM_RESET_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(2),
+			0
+		},
+		.regmap_size = 2,
 	}, {
 		.name = "pcm_spi_cs1",
 		.regmap[0] = {
@@ -709,7 +876,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 			GPIO_PCM_SPI_CS1_MODE_MASK,
 			GPIO_PCM_SPI_CS1_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(10),
+			0
+		},
+		.regmap_size = 2,
 	}, {
 		.name = "pcm_spi_cs2_p128",
 		.regmap[0] = {
@@ -718,7 +891,19 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 			GPIO_PCM_SPI_CS2_MODE_P128_MASK,
 			GPIO_PCM_SPI_CS2_MODE_P128_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(29),
+			0
+		},
+		.regmap[2] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			GPIO_PCIE_RESET1_MASK,
+			0
+		},
+		.regmap_size = 3,
 	}, {
 		.name = "pcm_spi_cs2_p156",
 		.regmap[0] = {
@@ -727,7 +912,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 			GPIO_PCM_SPI_CS2_MODE_P156_MASK,
 			GPIO_PCM_SPI_CS2_MODE_P156_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(27),
+			0
+		},
+		.regmap_size = 2,
 	}, {
 		.name = "pcm_spi_cs3",
 		.regmap[0] = {
@@ -736,7 +927,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 			GPIO_PCM_SPI_CS3_MODE_MASK,
 			GPIO_PCM_SPI_CS3_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(8),
+			0
+		},
+		.regmap_size = 2,
 	}, {
 		.name = "pcm_spi_cs4",
 		.regmap[0] = {
@@ -745,7 +942,13 @@ static const struct airoha_pinctrl_func_group pcm_spi_func_group[] = {
 			GPIO_PCM_SPI_CS4_MODE_MASK,
 			GPIO_PCM_SPI_CS4_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(11),
+			0
+		},
+		.regmap_size = 2,
 	},
 };
 
@@ -758,15 +961,104 @@ static const struct airoha_pinctrl_func_group i2s_func_group[] = {
 			GPIO_I2S_MODE_MASK,
 			GPIO_I2S_MODE_MASK
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(4) |
+			BIT(5) |
+			BIT(6) |
+			BIT(7),
+			0
+		},
+		.regmap_size = 2,
 	},
 };
 
+/* Force overrides select individual pads without disabling shared buses. */
+#define EN7523_GPIO_GROUP(n, pwm_mask, force_reg, force_mask)	\
+	{								\
+		.name = "gpio" #n,					\
+		.regmap[0] = {						\
+			AIROHA_FUNC_PWM_MUX,				\
+			(n) < 16 ? REG_GPIO_FLASH_MODE_CFG :		\
+			REG_GPIO_FLASH_MODE_CFG_EXT,			\
+			(pwm_mask), 0					\
+		},							\
+		.regmap[1] = {						\
+			AIROHA_FUNC_MUX, (force_reg),			\
+			(force_mask), (force_mask)			\
+		},							\
+		.regmap[2] = {						\
+			AIROHA_FUNC_MUX, REG_GPIO_PON_MODE,		\
+			(n) == 28 ? GPIO_PCIE_RESET0_MASK :		\
+			(n) == 29 ? GPIO_PCIE_RESET1_MASK : 0,		\
+			(n) == 28 ? GPIO_PCIE_RESET0_MASK :		\
+			(n) == 29 ? GPIO_PCIE_RESET1_MASK : 0		\
+		},							\
+		.regmap_size = 3,					\
+	}
+
 static const struct airoha_pinctrl_func_group gpio_func_group[] = {
-	AIROHA_PINCTRL_GPIO_EXT("gpio28", GPIO28_FLASH_MODE_CFG,
-				GPIO_PCIE_RESET0_MASK),
-	AIROHA_PINCTRL_GPIO_EXT("gpio29", GPIO29_FLASH_MODE_CFG,
-				GPIO_PCIE_RESET1_MASK),
+	EN7523_GPIO_GROUP(0, GPIO0_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(0)),
+	EN7523_GPIO_GROUP(1, GPIO1_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(1)),
+	EN7523_GPIO_GROUP(2, GPIO2_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(2)),
+	EN7523_GPIO_GROUP(3, GPIO3_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(3)),
+	EN7523_GPIO_GROUP(4, GPIO4_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(4)),
+	EN7523_GPIO_GROUP(5, GPIO5_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(5)),
+	EN7523_GPIO_GROUP(6, GPIO6_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(6)),
+	EN7523_GPIO_GROUP(7, GPIO7_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(7)),
+	EN7523_GPIO_GROUP(8, GPIO8_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(8)),
+	EN7523_GPIO_GROUP(9, GPIO9_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(9)),
+	EN7523_GPIO_GROUP(10, GPIO10_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(10)),
+	EN7523_GPIO_GROUP(11, GPIO11_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(11)),
+	EN7523_GPIO_GROUP(12, GPIO12_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(12)),
+	EN7523_GPIO_GROUP(13, GPIO13_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(13)),
+	EN7523_GPIO_GROUP(14, GPIO14_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(14)),
+	EN7523_GPIO_GROUP(15, GPIO15_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(15)),
+	EN7523_GPIO_GROUP(16, GPIO16_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(16)),
+	EN7523_GPIO_GROUP(17, GPIO17_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(17)),
+	EN7523_GPIO_GROUP(18, GPIO18_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(18)),
+	EN7523_GPIO_GROUP(19, GPIO19_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(19)),
+	EN7523_GPIO_GROUP(20, GPIO20_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(20)),
+	EN7523_GPIO_GROUP(21, GPIO21_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(21)),
+	EN7523_GPIO_GROUP(22, GPIO22_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(22)),
+	EN7523_GPIO_GROUP(23, GPIO23_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(23)),
+	EN7523_GPIO_GROUP(24, GPIO24_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(24)),
+	EN7523_GPIO_GROUP(25, GPIO25_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(25)),
+	EN7523_GPIO_GROUP(26, GPIO26_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(26)),
+	EN7523_GPIO_GROUP(27, GPIO27_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(27)),
+	EN7523_GPIO_GROUP(28, GPIO28_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(28)),
+	EN7523_GPIO_GROUP(29, GPIO29_FLASH_MODE_CFG,
+			    REG_FORCE_GPIO_EN, BIT(29)),
 };
 
 static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
@@ -778,7 +1070,13 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			GPIO_PCIE_RESET0_MASK,
 			0
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(28),
+			0
+		},
+		.regmap_size = 2,
 	}, {
 		.name = "pcie_reset1",
 		.regmap[0] = {
@@ -787,131 +1085,199 @@ static const struct airoha_pinctrl_func_group pcie_reset_func_group[] = {
 			GPIO_PCIE_RESET1_MASK,
 			0
 		},
-		.regmap_size = 1,
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			BIT(29),
+			0
+		},
+		.regmap_size = 2,
 	},
 };
 
 static const struct airoha_pinctrl_func_group pwm_func_group[] = {
-	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG),
-	AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG),
+	AIROHA_PINCTRL_PWM("gpio0", GPIO0_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(0)),
+	AIROHA_PINCTRL_PWM("gpio1", GPIO1_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(1)),
+	AIROHA_PINCTRL_PWM("gpio2", GPIO2_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(2)),
+	AIROHA_PINCTRL_PWM("gpio3", GPIO3_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(3)),
+	AIROHA_PINCTRL_PWM("gpio4", GPIO4_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(4)),
+	AIROHA_PINCTRL_PWM("gpio5", GPIO5_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(5)),
+	AIROHA_PINCTRL_PWM("gpio6", GPIO6_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(6)),
+	AIROHA_PINCTRL_PWM("gpio7", GPIO7_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(7)),
+	AIROHA_PINCTRL_PWM("gpio8", GPIO8_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(8)),
+	AIROHA_PINCTRL_PWM("gpio9", GPIO9_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(9)),
+	AIROHA_PINCTRL_PWM("gpio10", GPIO10_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(10)),
+	AIROHA_PINCTRL_PWM("gpio11", GPIO11_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(11)),
+	AIROHA_PINCTRL_PWM("gpio12", GPIO12_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(12)),
+	AIROHA_PINCTRL_PWM("gpio13", GPIO13_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(13)),
+	AIROHA_PINCTRL_PWM("gpio14", GPIO14_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(14)),
+	AIROHA_PINCTRL_PWM("gpio15", GPIO15_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(15)),
+	AIROHA_PINCTRL_PWM_EXT("gpio16", GPIO16_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(16)),
+	AIROHA_PINCTRL_PWM_EXT("gpio17", GPIO17_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(17)),
+	AIROHA_PINCTRL_PWM_EXT("gpio18", GPIO18_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(18)),
+	AIROHA_PINCTRL_PWM_EXT("gpio19", GPIO19_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(19)),
+	AIROHA_PINCTRL_PWM_EXT("gpio20", GPIO20_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(20)),
+	AIROHA_PINCTRL_PWM_EXT("gpio21", GPIO21_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(21)),
+	AIROHA_PINCTRL_PWM_EXT("gpio22", GPIO22_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(22)),
+	AIROHA_PINCTRL_PWM_EXT("gpio23", GPIO23_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(23)),
+	AIROHA_PINCTRL_PWM_EXT("gpio24", GPIO24_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(24)),
+	AIROHA_PINCTRL_PWM_EXT("gpio25", GPIO25_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(25)),
+	AIROHA_PINCTRL_PWM_EXT("gpio26", GPIO26_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(26)),
+	AIROHA_PINCTRL_PWM_EXT("gpio27", GPIO27_FLASH_MODE_CFG,
+				REG_FORCE_GPIO_EN, BIT(27)),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio28", GPIO28_FLASH_MODE_CFG,
-				   GPIO_PCIE_RESET0_MASK),
+				   GPIO_PCIE_RESET0_MASK,
+				REG_FORCE_GPIO_EN, BIT(28)),
 	AIROHA_PINCTRL_PWM_EXT_SEC("gpio29", GPIO29_FLASH_MODE_CFG,
-				   GPIO_PCIE_RESET1_MASK),
+				   GPIO_PCIE_RESET1_MASK,
+				REG_FORCE_GPIO_EN, BIT(29)),
 };
 
 static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED0("gpio22", GPIO_LAN0_LED0_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0),
+				REG_FORCE_GPIO_EN, BIT(22)),
 	AIROHA_PINCTRL_PHY_LED0("gpio23", GPIO_LAN1_LED0_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0),
+				REG_FORCE_GPIO_EN, BIT(23)),
 	AIROHA_PINCTRL_PHY_LED0("gpio24", GPIO_LAN2_LED0_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0),
+				REG_FORCE_GPIO_EN, BIT(24)),
 	AIROHA_PINCTRL_PHY_LED0("gpio25", GPIO_LAN3_LED0_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0),
+				REG_FORCE_GPIO_EN, BIT(25)),
 };
 
 static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED0("gpio22", GPIO_LAN0_LED0_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1),
+				REG_FORCE_GPIO_EN, BIT(22)),
 	AIROHA_PINCTRL_PHY_LED0("gpio23", GPIO_LAN1_LED0_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1),
+				REG_FORCE_GPIO_EN, BIT(23)),
 	AIROHA_PINCTRL_PHY_LED0("gpio24", GPIO_LAN2_LED0_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1),
+				REG_FORCE_GPIO_EN, BIT(24)),
 	AIROHA_PINCTRL_PHY_LED0("gpio25", GPIO_LAN3_LED0_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1),
+				REG_FORCE_GPIO_EN, BIT(25)),
 };
 
 static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED0("gpio22", GPIO_LAN0_LED0_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2),
+				REG_FORCE_GPIO_EN, BIT(22)),
 	AIROHA_PINCTRL_PHY_LED0("gpio23", GPIO_LAN1_LED0_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2),
+				REG_FORCE_GPIO_EN, BIT(23)),
 	AIROHA_PINCTRL_PHY_LED0("gpio24", GPIO_LAN2_LED0_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2),
+				REG_FORCE_GPIO_EN, BIT(24)),
 	AIROHA_PINCTRL_PHY_LED0("gpio25", GPIO_LAN3_LED0_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2),
+				REG_FORCE_GPIO_EN, BIT(25)),
 };
 
 static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED0("gpio22", GPIO_LAN0_LED0_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3),
+				REG_FORCE_GPIO_EN, BIT(22)),
 	AIROHA_PINCTRL_PHY_LED0("gpio23", GPIO_LAN1_LED0_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3),
+				REG_FORCE_GPIO_EN, BIT(23)),
 	AIROHA_PINCTRL_PHY_LED0("gpio24", GPIO_LAN2_LED0_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3),
+				REG_FORCE_GPIO_EN, BIT(24)),
 	AIROHA_PINCTRL_PHY_LED0("gpio25", GPIO_LAN3_LED0_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3),
+				REG_FORCE_GPIO_EN, BIT(25)),
 };
 
 static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio7", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0),
+				REG_FORCE_GPIO_EN, BIT(7)),
 	AIROHA_PINCTRL_PHY_LED1("gpio6", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0),
+				REG_FORCE_GPIO_EN, BIT(6)),
 	AIROHA_PINCTRL_PHY_LED1("gpio5", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0),
+				REG_FORCE_GPIO_EN, BIT(5)),
 	AIROHA_PINCTRL_PHY_LED1("gpio4", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0),
+				REG_FORCE_GPIO_EN, BIT(4)),
 };
 
 static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio7", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1),
+				REG_FORCE_GPIO_EN, BIT(7)),
 	AIROHA_PINCTRL_PHY_LED1("gpio6", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1),
+				REG_FORCE_GPIO_EN, BIT(6)),
 	AIROHA_PINCTRL_PHY_LED1("gpio5", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1),
+				REG_FORCE_GPIO_EN, BIT(5)),
 	AIROHA_PINCTRL_PHY_LED1("gpio4", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1),
+				REG_FORCE_GPIO_EN, BIT(4)),
 };
 
 static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio7", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2),
+				REG_FORCE_GPIO_EN, BIT(7)),
 	AIROHA_PINCTRL_PHY_LED1("gpio6", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2),
+				REG_FORCE_GPIO_EN, BIT(6)),
 	AIROHA_PINCTRL_PHY_LED1("gpio5", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2),
+				REG_FORCE_GPIO_EN, BIT(5)),
 	AIROHA_PINCTRL_PHY_LED1("gpio4", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2),
+				REG_FORCE_GPIO_EN, BIT(4)),
 };
 
 static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio7", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3),
+				REG_FORCE_GPIO_EN, BIT(7)),
 	AIROHA_PINCTRL_PHY_LED1("gpio6", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3),
+				REG_FORCE_GPIO_EN, BIT(6)),
 	AIROHA_PINCTRL_PHY_LED1("gpio5", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3),
+				REG_FORCE_GPIO_EN, BIT(5)),
 	AIROHA_PINCTRL_PHY_LED1("gpio4", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3),
+				REG_FORCE_GPIO_EN, BIT(4)),
 };
 
 static const struct airoha_pinctrl_func pinctrl_funcs[] = {
@@ -926,7 +1292,7 @@ static const struct airoha_pinctrl_func pinctrl_funcs[] = {
 	PINCTRL_FUNC_DESC("spi", spi),
 	PINCTRL_FUNC_DESC("pcm_spi", pcm_spi),
 	PINCTRL_FUNC_DESC("i2s", i2s),
-	PINCTRL_FUNC_DESC("gpio", gpio),
+	PINCTRL_GPIO_FUNC_DESC("gpio", gpio),
 	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
 	PINCTRL_FUNC_DESC("pwm", pwm),
 	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
@@ -1104,6 +1470,7 @@ static const struct airoha_pinctrl_conf pinctrl_drive_e4_conf[] = {
 };
 
 static const struct airoha_pinctrl_match_data pinctrl_match_data = {
+	.check_mux_conflicts = true,
 	.chip_scu_compatible = "airoha,en7523-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
-- 
2.43.0

