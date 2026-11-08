Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794132416;
	b=1wTvYGKleYN6FAkxUhxsUrgyJwyOo6u7zwvmCGgd7nHcwLUs76GrZTgSeTtT4oBL4knJ
	 1XvCccEcswODPyjn1eYoSL4nVu9Q3Ptut5lZg4SULNVXUfPDiUk3bfik8kPfBtpi7KH27
	 uVK1JDgdN69I0YaSMy1WZ01lAU2WwmPRuYW5tdJXPEMMPmaOdT/DdXDpHNGXe6L5NquNc
	 V/XdU932zsoY7xfp+nb3xZueXjbG3uSLf4UD/RB6ainm/a6KoFL61mD3v99GR+LgFY99B
	 5RA450AdUBA2ZXICG0jGCAMnHtCjFcf7QrfqG5B3XcNDwDfPzq96A9x3Ags3jO6aKxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794132416;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UKFC4kHDDGyiVWQsTKcJ9Dw2vTDxYCuv7HiHLK+Q5Pk=;
	b=xf3UZRV6419Y3poH+qjG0EuNdgIWQkVghn4LHLxeAyq/43vYZsAgIy+o+PyM4owan/B8
	 3V1TMkwjcgQJph7jXFAfPpzLg4NZbsdG7+jGggwFuff9BwMJhQcYBxTx6LR+enTOmPo1C
	 T8mTBS2o/nx+jn1bEsbJScpWpZjg8PWww+7bnarWK6J27ifb9iK7VQi7IyQxHiHBZ8RNo
	 6TICl6CZiAUgIhMxcfOGkCBYBf9WOB7XAbcx8PhQI9EHh51MDbUKnb/X4ii4Cbbg1U7zq
	 JQVv82hxHL2TPpH0/VPjxg0ObFpJdCvK8/T7j0hJ3vR5FUDl7qS6nVpuzwaYDm3xOcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=geq1ijcI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68330606D81C;
	Sun,  8 Nov 2026 10:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=geq1ijcI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794132416;
	b=AUZ3Oy8m9gVEGL9kYaYfcNzgBy/exNcKK/NfWOaOq+nH5sMd1PWRdsdAg+60MD4tf89W
	 NCWmSQEz9pAKa1LPalqiEu/+IwW8fLzVVPpzLQdoieidHPMvEXGO32oaQhQFadXWp/081
	 8TypdMDr/86gpkbDDp8D1BM+ayVjOCFnjk70iVuihvYOe7t1W4BgH/EqAElKt+T1+M2dA
	 D/GKARaMcv/QJh771E8kZtssnem43s7qB+U47Ki2S4X3wkDF4tGhnRrgyejOfIFxLR0zX
	 3ngcM+qQzXmfQkXxj1jJjBs5FfBq790p2mlcDJs2kvvVr8K7ylHhIFkaeOHlEIPk0gg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794132416;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UKFC4kHDDGyiVWQsTKcJ9Dw2vTDxYCuv7HiHLK+Q5Pk=;
	b=yi31HxTXw+crMlPoDEELvn7JJ40fG4CtM5yCs3XPNYinUC/OCvLI4f+NO7+J2TxMY8pQ
	 gRoqRBD3jIy0p27hC9OVQMv6DVRx1oOBITO6wTTf+mcdgXy8YXN5dvNqSyseiuQvtZzF+
	 RHxdgQVC4ybgEwQSxA0EqcLYsqqa6nn08NrUDQVYk0AilnXiHX37cipUlmFcPOlDIgoFx
	 7WeyjosZJwMRQ4Wlzrwj0GKkDx98WWMFJSSpltaPK8qgz9WP8s82Goxy3DMzHRjlwDnyB
	 +o8G9yHGD8IyQMuOXl9lfMTk18t2VcPN0B8zgSQzlGnhiOxB+ZnEFHu5j5x634jRlkQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8E041F008A5;
	Sun,  8 Nov 2026 10:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794132416;
	bh=UKFC4kHDDGyiVWQsTKcJ9Dw2vTDxYCuv7HiHLK+Q5Pk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=geq1ijcIpsRyPSdZx4z86/zepK+EClpC/N9sFY2i2yxRrhF7SQf6lASUHjm2oi8P4
	 KxQfELfjE2O5h7eA3JgBdVgN6HZui3y/TgB9M4GvwhdFNo3km0G23+lhVr39SVy9/h
	 Z7R9wcXdabwi8oeADJQIyRl4WXooZdIFHpj8idWkL9fnomMj4TQ7xu2Tw9DzEPG3dZ
	 vxGkXMgN4CX+io08sH7QXjihlVHA6VhjGciCzFX7BoXU4EnZSzQ25JXZ57X4SbnlWl
	 GsKPMHFsG4LlanhEP1yRiUsha+sL9w8uQjW3IlOQSMLQLVxJbe5ZSN0Mpvu/Wa6wzm
	 +Gh2YktvQ+IXg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3A47A47EDB;
	Sun,  8 Nov 2026 10:06:53 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Sun, 08 Nov 2026 11:06:53 +0100
Subject: [PATCH v3 5/5] arm64: dts: lx2160a: describe the pad muxes as the
 DCFG RCW override
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-5-5a0063f1da9e@free.fr>
References: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr>
In-Reply-To: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794132412; l=10975;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=iwO9Ixvxy6W69Tb6Mt+g9kgxtFLpXhRJ1viNlsFmmYQ=;
 b=WcW0kmHUysI4SGxMj2Vyau2DMKhFT137GG/kykB+2mamEcje73PCI+oNSglJJNozHydBN2uEQ
 41EVaSQRbtPBBwm3PdsWIgeIYn/QfBgv7UjKIHO1nCOAVeZdZ2xOE8j
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr
Content-Transfer-Encoding: 7bit

From: Vincent Jardin <vjardin@free.fr>

The pad muxes are fields of the RCW: read-only in RCWSR12..14, changed
at runtime through the override registers in the DCSR view of DCFG,
which read 0 until written.

pinctrl-single on those registers, since commit 8a1365c7bbc1
("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery"),
clears every other field of the word with its first pin state:
a board whose RCW programs a non-zero pad mux loses those pads at the
first I2C probe.

Describe the pad mux as a child of the dcfg node, which gains its DCSR
view and, as on the LS1028A, the addressing of its children:
the child is at its RCWSR12 to RCWSR14 window, one group per RCW field,
one function per encoding, driven by fsl,lx2160a-rcw-pinmux using
fsl-guts. Labels and pin node names stay, so no consumer changes.
The pinctrl-single node goes.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 377 ++++++++++++++------------
 1 file changed, 202 insertions(+), 175 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
index 2085362ab0ea..48e065aaafbc 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
@@ -669,9 +669,209 @@ clockgen: clock-controller@1300000 {
 		};
 
 		dcfg: syscon@1e00000 {
-			compatible = "fsl,lx2160a-dcfg", "syscon";
-			reg = <0x0 0x1e00000 0x0 0x10000>;
+			compatible = "fsl,lx2160a-dcfg", "syscon", "simple-mfd";
+			reg = <0x0 0x1e00000 0x0 0x10000>,
+			      <0x7 0x00100000 0x0 0x10000>;
+			reg-names = "dcfg_ccsr", "dcfg_dcsr";
+			ranges = <0x0 0x0 0x1e00000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			little-endian;
+
+			pinmux_i2crv: pinctrl@12c {
+				compatible = "fsl,lx2160a-rcw-pinmux";
+				reg = <0x12c 0xc>;
+
+				i2c1_pins: iic2-i2c-pins {
+					function = "i2c";
+					groups = "iic2";
+				};
+
+				gpio0_31_30_pins: iic2-gpio-pins {
+					function = "gpio";
+					groups = "iic2";
+				};
+
+				ftm0_ch10_pins: iic2-ftm-pins {
+					function = "flextimer";
+					groups = "iic2";
+				};
+
+				esdhc0_cd_wp_pins: iic2-sdhc-pins {
+					function = "sdhc";
+					groups = "iic2";
+				};
+
+				i2c2_pins: iic3-i2c-pins {
+					function = "i2c";
+					groups = "iic3";
+				};
+
+				gpio0_29_28_pins: iic3-gpio-pins {
+					function = "gpio";
+					groups = "iic3";
+				};
+
+				can0_pins: iic3-can-pins {
+					function = "can";
+					groups = "iic3";
+				};
+
+				event65_pins: iic3-event-pins {
+					function = "evt";
+					groups = "iic3";
+				};
+
+				i2c3_pins: iic4-i2c-pins {
+					function = "i2c";
+					groups = "iic4";
+				};
+
+				gpio0_27_26_pins: iic4-gpio-pins {
+					function = "gpio";
+					groups = "iic4";
+				};
+
+				can1_pins: iic4-can-pins {
+					function = "can";
+					groups = "iic4";
+				};
+
+				event87_pins: iic4-event-pins {
+					function = "evt";
+					groups = "iic4";
+				};
+
+				i2c4_pins: iic5-i2c-pins {
+					function = "i2c";
+					groups = "iic5";
+				};
+
+				gpio0_25_24_pins: iic5-gpio-pins {
+					function = "gpio";
+					groups = "iic5";
+				};
+
+				esdhc0_clksync_pins: iic5-sdhc-clk-pins {
+					function = "sdhc-clk";
+					groups = "iic5";
+				};
+
+				dspi2_miso_mosi_pins: iic5-spi3-pins {
+					function = "spi";
+					groups = "iic5";
+				};
+
+				i2c5_pins: iic6-i2c-pins {
+					function = "i2c";
+					groups = "iic6";
+				};
+
+				gpio0_23_22_pins: iic6-gpio-pins {
+					function = "gpio";
+					groups = "iic6";
+				};
+
+				esdhc1_clksync_pins: iic6-sdhc-clk-pins {
+					function = "sdhc-clk";
+					groups = "iic6";
+				};
+
+				fspi_data74_pins: xspi1-data74-pins {
+					function = "flexspi";
+					groups = "xspi1-data74";
+				};
+
+				gpio1_31_28_pins: xspi1-data74-gpio-pins {
+					function = "gpio";
+					groups = "xspi1-data74";
+				};
+
+				fspi_data30_pins: xspi1-data30-pins {
+					function = "flexspi";
+					groups = "xspi1-data30";
+				};
+
+				gpio1_27_24_pins: xspi1-data30-gpio-pins {
+					function = "gpio";
+					groups = "xspi1-data30";
+				};
+
+				fspi_dqs_sck_cs10_pins: xspi1-base-pins {
+					function = "flexspi";
+					groups = "xspi1-base";
+				};
+
+				gpio1_23_20_pins: xspi1-base-gpio-pins {
+					function = "gpio";
+					groups = "xspi1-base";
+				};
+
+				esdhc0_cmd_data30_clk_vsel_pins: sdhc1-base-sdhc-vsel-pins {
+					function = "sdhc";
+					groups = "sdhc1-base";
+				};
+
+				gpio0_21_15_pins: sdhc1-base-gpio-pins {
+					function = "gpio";
+					groups = "sdhc1-base";
+				};
+
+				dspi0_pins: sdhc1-base-spi1-pins {
+					function = "spi";
+					groups = "sdhc1-base";
+				};
+
+				esdhc0_cmd_data30_clk_dspi2_cs0_pins: sdhc1-base-sdhc-spi3-pins {
+					function = "sdhc-spi";
+					groups = "sdhc1-base";
+				};
+
+				esdhc0_cmd_data30_clk_data4_pins: sdhc1-base-sdhc-data4-pins {
+					function = "sdhc-data4";
+					groups = "sdhc1-base";
+				};
+
+				esdhc0_dir_pins: sdhc1-dir-pins {
+					function = "sdhc";
+					groups = "sdhc1-dir";
+				};
+
+				gpio0_14_12_pins: sdhc1-dir-gpio-pins {
+					function = "gpio";
+					groups = "sdhc1-dir";
+				};
+
+				dspi2_cs31_pins: sdhc1-dir-spi3-pins {
+					function = "spi";
+					groups = "sdhc1-dir";
+				};
+
+				esdhc0_data75_pins: sdhc1-dir-sdhc-pins {
+					function = "sdhc-data";
+					groups = "sdhc1-dir";
+				};
+
+				gpio1_18_15_pins: iic8-iic7-gpio-pins {
+					function = "gpio";
+					groups = "sdhc2-data74";
+				};
+
+				i2c6_i2c7_pins: iic8-iic7-i2c-pins {
+					function = "i2c";
+					groups = "sdhc2-data74";
+				};
+
+				i2c0_pins: iic1-i2c-pins {
+					function = "i2c";
+					groups = "iic1";
+				};
+
+				gpio0_3_2_pins: iic1-gpio-pins {
+					function = "gpio";
+					groups = "iic1";
+				};
+			};
 		};
 
 		sfp: efuse@1e80000 {
@@ -1531,179 +1731,6 @@ pcs18: ethernet-phy@0 {
 			};
 		};
 
-		pinmux_i2crv: pinmux@70010012c {
-			compatible = "pinctrl-single";
-			reg = <0x00000007 0x0010012c 0x0 0xc>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			#pinctrl-cells = <2>;
-			pinctrl-single,bit-per-mux;
-			pinctrl-single,register-width = <32>;
-			pinctrl-single,function-mask = <0x7>;
-
-			/* RCWSR12 */
-			i2c1_pins: iic2-i2c-pins {
-				pinctrl-single,bits = <0x0 0x0 0x7>;
-			};
-
-			gpio0_31_30_pins: iic2-gpio-pins {
-				pinctrl-single,bits = <0x0 0x1 0x7>;
-			};
-
-			ftm0_ch10_pins: iic2-ftm-pins {
-				pinctrl-single,bits = <0x0 0x2 0x7>;
-			};
-
-			esdhc0_cd_wp_pins: iic2-sdhc-pins {
-				pinctrl-single,bits = <0x0 0x6 0x7>;
-			};
-
-			i2c2_pins: iic3-i2c-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 3)>;
-			};
-
-			gpio0_29_28_pins: iic3-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 3) (0x7 << 3)>;
-			};
-
-			can0_pins: iic3-can-pins {
-				pinctrl-single,bits = <0x0 (0x2 << 3) (0x7 << 3)>;
-			};
-
-			event65_pins: iic3-event-pins {
-				pinctrl-single,bits = <0x0 (0x6 << 3) (0x7 << 3)>;
-			};
-
-			i2c3_pins: iic4-i2c-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 6)>;
-			};
-
-			gpio0_27_26_pins: iic4-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 6) (0x7 << 6)>;
-			};
-
-			can1_pins: iic4-can-pins {
-				pinctrl-single,bits = <0x0 (0x2 << 6) (0x7 << 6)>;
-			};
-
-			event87_pins: iic4-event-pins {
-				pinctrl-single,bits = <0x0 (0x6 << 6) (0x7 << 6)>;
-			};
-
-			i2c4_pins: iic5-i2c-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 9)>;
-			};
-
-			gpio0_25_24_pins: iic5-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 9) (0x7 << 9)>;
-			};
-
-			esdhc0_clksync_pins: iic5-sdhc-clk-pins {
-				pinctrl-single,bits = <0x0 (0x2 << 9) (0x7 << 9)>;
-			};
-
-			dspi2_miso_mosi_pins: iic5-spi3-pins {
-				pinctrl-single,bits = <0x0 (0x3 << 9) (0x7 << 9)>;
-			};
-
-			i2c5_pins: iic6-i2c-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 12)>;
-			};
-
-			gpio0_23_22_pins: iic6-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 12) (0x7 << 12)>;
-			};
-
-			esdhc1_clksync_pins: iic6-sdhc-clk-pins {
-				pinctrl-single,bits = <0x0 (0x2 << 12) (0x7 << 12)>;
-			};
-
-			fspi_data74_pins: xspi1-data74-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 15)>;
-			};
-
-			gpio1_31_28_pins: xspi1-data74-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 15) (0x7 << 15)>;
-			};
-
-			fspi_data30_pins: xspi1-data30-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 18)>;
-			};
-
-			gpio1_27_24_pins: xspi1-data30-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 18) (0x7 << 18)>;
-			};
-
-			fspi_dqs_sck_cs10_pins: xspi1-base-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 21)>;
-			};
-
-			gpio1_23_20_pins: xspi1-base-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 21) (0x7 << 21)>;
-			};
-
-			esdhc0_cmd_data30_clk_vsel_pins: sdhc1-base-sdhc-vsel-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 24)>;
-			};
-
-			gpio0_21_15_pins: sdhc1-base-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 24) (0x7 << 24)>;
-			};
-
-			dspi0_pins: sdhc1-base-spi1-pins {
-				pinctrl-single,bits = <0x0 (0x2 << 24) (0x7 << 24)>;
-			};
-
-			esdhc0_cmd_data30_clk_dspi2_cs0_pins: sdhc1-base-sdhc-spi3-pins {
-				pinctrl-single,bits = <0x0 (0x3 << 24) (0x7 << 24)>;
-			};
-
-			esdhc0_cmd_data30_clk_data4_pins: sdhc1-base-sdhc-data4-pins {
-				pinctrl-single,bits = <0x0 (0x4 << 24) (0x7 << 24)>;
-			};
-
-			esdhc0_dir_pins: sdhc1-dir-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 27)>;
-			};
-
-			gpio0_14_12_pins: sdhc1-dir-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 27) (0x7 << 27)>;
-			};
-
-			dspi2_cs31_pins: sdhc1-dir-spi3-pins {
-				pinctrl-single,bits = <0x0 (0x3 << 27) (0x7 << 27)>;
-			};
-
-			esdhc0_data75_pins: sdhc1-dir-sdhc-pins {
-				pinctrl-single,bits = <0x0 (0x4 << 27) (0x7 << 27)>;
-			};
-
-			/* RCWSR13 */
-			gpio1_18_15_pins: iic8-iic7-gpio-pins {
-				pinctrl-single,bits = <0x4 0x1 0x7>;
-			};
-
-			i2c6_i2c7_pins: iic8-iic7-i2c-pins {
-				pinctrl-single,bits = <0x4 0x2 0x7>;
-			};
-
-			/* RCWSR14 */
-			/*
-			 * IIC1_PMUX is a single bit at RCWSR14[10], but bit-per-mux
-			 * uses the mask for the field to clear before applying the
-			 * value.
-			 * So bits 11 and 12, which are reserved, are written as 0
-			 * on every mux switch, it is harmless.
-			 */
-			i2c0_pins: iic1-i2c-pins {
-				pinctrl-single,bits = <0x8 0x0 (0x7 << 10)>;
-			};
-
-			gpio0_3_2_pins: iic1-gpio-pins {
-				pinctrl-single,bits = <0x8 (0x1 << 10) (0x7 << 10)>;
-			};
-		};
-
 		fsl_mc: fsl-mc@80c000000 {
 			compatible = "fsl,qoriq-mc";
 			reg = <0x00000008 0x0c000000 0 0x40>,

-- 
2.43.0


