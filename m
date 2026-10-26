Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793014623;
	b=eIR6v6YZIwDxoIkyYOybdkxqAL+jjpM2JNmaZjSJkcJ/BXDAlLip7pWGMxUw693DpuQz
	 LrMsuj6Os1blyELtnVaI+frH7aZlML1/8kI7D3A4nxXOymarpJXpaCIMxdFlojwEAs6LM
	 smSi9+IuZ/2IcFmy5AiUB9QWAsy7NnFpXcCF0hbI2Yv0bRVRheotEdHDUOpMV4AgVLJpc
	 RzqxGdnFIzHWj349fdEMhB8BbcMFC68aC0Y33OROQMI6Iw9JdfrWdn7u1r56BdHP5IzX4
	 OvnM7LPBYI7jOFOAuYWTSb6HznUAoGvve6+00GkfIaeXOfIRQWvCxuBj9Cud+W9jkJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014623;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=/q+cu0IMhbkUSyO2IVNcOzMWw31ny4dUBrb6tlnrqCE=;
	b=ynqAyszbylXkW4Taf51Yof9e4/Q7uOnSvYDVJttCrxwAU2WvM9WJVVLZ0Y8kvcpwXlDL
	 WrEYWKsBL5u5OzFXugTXD898iNlMLlkthp3PiKmE4u1tVdSiQr+MqiXBL3YrWT1pkkMSi
	 4fIH+PVQ2KyuzbZMw3Joh9LbAg9GZL+PBu3vIex93vEKQmd4WTLpfeeK4SCMSYqHVJsnZ
	 lusIvf18kO6WDI2yAww4zUAhJ0Cbu3qH2SV+cyl+cmMczWweKMAujG6u9OiJSzqqhNjcM
	 tAOfvh+4ouJLlWmhbvxszHh06pKTQJrOjiZB9fCrvvLz2Yye1udlL5+pKtgOhXo4Apg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=a8NOeXYi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.1
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF8460A260E;
	Mon, 26 Oct 2026 11:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DF8460A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=a8NOeXYi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJMNgDD1xiK/81UyeWoh/cB4e9LmAPeAJBM95/GRrIZyMPq6xVxQ9i1Kyo2CrDPwLnao8IPEOmECE26nD8ksE00Wzn0Y+b1Zn6YVXGN+iFefv+EWlpfL+95kg8XI5EYviqgCFlwlV6w0ynjcWnUXJI67B5JUsywDaHh3WdLUO8TKJOCt/Hbrn4/MSo30PozoR9X4swOnHCX6gvyGjuQ/5kqkA1BFjo3wojBseARnyIhoFRWyjczPFl70Q4XcS9wg31cg1vAB9INEYf0YIaJj2FTV/T6jTjXfoajgF0S3lnKtgWBOl5TFYfUuI6dsdK7z93KNhMTJXPwM/aekd0jRdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/q+cu0IMhbkUSyO2IVNcOzMWw31ny4dUBrb6tlnrqCE=;
 b=u97568RYIGILvnuUowWe007CIrydUl3wNyExMBM4k1tR3b6A0EQnA936f7t0BkLqU6lHm4KnTugEcjWDRGxWfAlg5X7BuBnVL31cqh71NcF+vGGcXb1de1OPK4rXdD98QOJfq945y81DwWt4GKrOse85uK8O6RxL9iDWyZ1ZKJmZrDtTySyl/2qzIJRmGjJfW589oWcFYnKW/dv+5Bv3TkoCqDDvo8aypYIFkyTy5+dvE4M7J84yx7exMWgSsYS0miTiaYC5H9/iExM3FgJAuvhuUfTwV7w3TqRNi1SMyZ0cJq6PR3t5/yK4OUSU41rk0R0GbvCds3cP8xcrinb98g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q+cu0IMhbkUSyO2IVNcOzMWw31ny4dUBrb6tlnrqCE=;
 b=a8NOeXYiLKDZXO16qPjodrRwoLxvUT8e3Whz9P6hNlZ68wYUtG2ni/7cpk9eNam2TUDV7MD8SNl0wXUUbBYhebFDk9xll0DAwCGwNIjO9CQUPw/Wn37YM7nSBecn5JJOf7yOXL7okR6vta2Qni04wWWmg6EpxtUrgRGduDhtIdk=
Received: from OS3PR01CA0036.jpnprd01.prod.outlook.com (2603:1096:604:db::23)
 by TYYPR01MB13352.jpnprd01.prod.outlook.com (2603:1096:405:1c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 11:37:00 +0000
Received: from OS1PEPF0000D216.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:db:cafe::82) by OS3PR01CA0036.outlook.office365.com
 (2603:1096:604:db::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 11:37:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D216.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Mon, 26 Oct 2026 11:37:00 +0000
Received: from [192.168.1.82] (unknown [10.226.92.223])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 2AD523000253;
	Mon, 26 Oct 2026 20:36:51 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Mon, 26 Oct 2026 11:35:50 +0000
Subject: [PATCH v2 7/7] arm64: dts: renesas: r9a08g046: Add I3C support
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-7-2e76b87209bb@renesas.com>
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Diogo Ivo <diogo.ivo.sx@renesas.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793014549; l=4789;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=KxAZw+LJvuR5A3VLM7tEpFJpnpPJOciCtYDezW1GNNc=;
 b=rfxprELImaGLr6EQkDKC8WdOkK1hk2aqmBghW9ZIjNS+lDr2BnqhHYYhdhG8A/Gf5c3y8xWvQ
 IaNad9+kuEtAdWCVrwtBVhX8OirdfUeRZhV1uinMf8zoAvay5vFUm0J
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D216:EE_|TYYPR01MB13352:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc4f507-4794-4c26-7af8-08df335572c8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|23010399003|1800799024|921020|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MMjLnfwsJKXWuQjmVmwFyTT9CEXOsBEGsYHiqTamAKseX4kN2Y7N0QSnuYr6gMw7gd5vb9QjM55vZBTkx2jNJrSGVeRYKgTwBGinzrxp4A4rD4RWEPXemAvEFiIVrSsYNRyEUSYz2huufoBVHrcVojwzaJBnXOdGXmXiUNN4vCV19nlq5EDKrerbokLuzeOfWvvnxUEfypaiuS1aM42Hx8qQEYGeUesW0XnfiJwENoCz/z/+gyShK0D9KyaJfqJwMRbyuOjQbn0Nv+YL99Acn5CWbsCspH/0yz2igrJmmpP/ojXHxTGgn3BUVe9+vVe4mBE6xTF9ZBVJC85KkxqMiVK33IMsqNVNlvq8AwizwlBrOzPn8aiIk/9cAu1uoPoQYnG0qmV0FQT+n3VQMD8rkO/VZtTFtaBI+HobRslRqNCBWgANX5R4TOuNB2hPOoA2a8jzLwCeEWdomp4riJgHkFRSbjJlUaf1PdAz8YVApwBOdHcv6svJwfZ4n3WRlIl9LMO/roeQk9zn32ROuQ1nebgDj75xAb+hPY1Qw0moAxGAkGhZr4DQHsxH5YufcjePkyyfEp2cHGHtyVRZ1HmwFhjFpmDX9c9ox/hMOVmFb2DL3o72DZYfb189HHio9FArAF12Bou15Y9h+RTz51CCgCtjeweM9aa1WpNouoA08TB1M0AtpGLaBnGGh5yHio8gzv3QBWVuYwvLLjTilLFsx597/29xNchCtoJcSrhsTaZDoN1vbwgYK4PTPW10xIe7
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(921020)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UV8Mkk1jtzmtcQkFasvaOPfyki/mv/mVosYE9iJ2AvQBoqI6xIunsDmxslCuBUSCjcBNi5Gwbz7Cnu1DnY/kZ3Se/atroM8BUKBnaje5nTBqQnj9EJbUojBDHdHY0trKiJVZeEsjEBlZU7AS5fgwNfXVaZrdxbUVyrdH6OxBk4E+tivqqUzsvtPo2dbbasNW0N1YcWwhrnjk2XRGVg+mbvRAopgYzwG0Kh7xuZvEYwpyoTkJ57GImoB+0ZHFmKPFZPVB51aj3ZEyRnYWTgsNAXrVVVqRuDVCK6O16fqAWUwo4A4ArdwmKSE5bOExzPZ584er9B8GSae+OuYzA9QCE7XgfAtHYbSF66ekqVV4RjWCCniIsvKJnH5P6CEs8a6JSdEj1pOv7He68qVpiL3RRCrBoziFSvNejPg8rPFJhg/zG+SA+5Xc3GnECrBjWEZ5
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:37:00.0240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc4f507-4794-4c26-7af8-08df335572c8
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D216.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13352

Add the I3C Bus Interface node to the RZ/G3L (R9A08G046) SoC DTSI and
enable it on the RZ/G3L SMARC EVK, together with the required pin
control.

The driver only consumes resources that are common to the RZ/G3L and
the RZ/G3S (R9A08G045), so the node uses the SoC-specific
renesas,r9a08g046-i3c compatible with a fallback to the
renesas,r9a08g045-i3c compatible of the RZ/G3S, following the bindings.

The I3C pins are shared with RIIC3, so the controller is only enabled
when the SW_I3C_EN switch is on.

The I3C I/O voltage can be set to 1.2V or 1.8V on the board through
the SYS.3 (I3C_IOVS) switch, so configure the pin controller for the
selected voltage through the power-source property.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
Changes in v2:
 - Declare compatible with G3S fallback
 - Sort the &i3c and i3c_pins nodes alphabetically in
   r9a08g046l48-smarc.dts
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 35 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 21 +++++++++++++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   |  4 +++
 3 files changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index f33d5d7468ff..fccfe8d7faf5 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -620,6 +620,41 @@ canfd: can@100c0000 {
 			/* placeholder */
 		};
 
+		i3c: i3c@100e0000 {
+			compatible = "renesas,r9a08g046-i3c", "renesas,r9a08g045-i3c";
+			reg = <0 0x100e0000 0 0x1000>;
+			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 361 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 362 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 363 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 364 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ierr", "terr", "abort", "resp",
+					  "cmd", "ibi", "rx", "tx", "rcv",
+					  "st", "sp", "tend", "nack", "al",
+					  "tmo", "wu";
+			clocks = <&cpg CPG_MOD R9A08G046_I3C_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_I3C_TCLK>;
+			clock-names = "pclk", "tclk";
+			resets = <&cpg R9A08G046_I3C_PRESETN>,
+				 <&cpg R9A08G046_I3C_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			power-domains = <&cpg>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		ssi0: ssi@100e4000 {
 			compatible = "renesas,r9a08g046-ssi", "renesas,rz-ssi";
 			reg = <0 0x100e4000 0 0x400>;
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 68d7b579e352..a713d63b4510 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -13,6 +13,7 @@
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
 #define SW_I3C_EN		0
+#define SW_I3C_IOVS		0
 #define SW_SER0_PMOD		1
 
 #define PMOD_GPIO4		0
@@ -120,6 +121,16 @@ da7212: codec@1a {
 };
 #endif
 
+#if SW_I3C_EN
+&i3c {
+	pinctrl-0 = <&i3c_pins>;
+	pinctrl-names = "default";
+	i2c-scl-hz = <400000>;
+	i3c-scl-hz = <12500000>;
+	status = "okay";
+};
+#endif
+
 &keys {
 #if !RZ_BOOT_MODE3 || !SW_GPIO4 || PMOD_GPIO4
 	/delete-node/ key-1;
@@ -163,6 +174,16 @@ i2c3_pins: i2c3 {
 			 <RZG3L_PORT_PINMUX(2, 1, 4)>; /* RIIC3_SDA */
 	};
 
+	i3c_pins: i3c {
+		pinmux = <RZG3L_PORT_PINMUX(2, 0, 2)>, /* I3C_SCL */
+			 <RZG3L_PORT_PINMUX(2, 1, 2)>; /* I3C_SDA */
+#if SW_I3C_IOVS
+		power-source = <1800>;
+#else
+		power-source = <1200>;
+#endif
+	};
+
 	pcie-clkreq-n-hog {
 		gpio-hog;
 		gpios = <RZG3L_GPIO(G, 6) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 91b2d0d43104..5959e62ad7ed 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -13,6 +13,10 @@
  *      0 - SMARC_I2C_GP is enabled
  *      1 - I3C is enabled
  *
+ * Switch position SYS.3, Macro SW_I3C_IOVS:
+ *      0 - I3C voltage is 1.2V (when SW_I3C_EN == 1)
+ *      1 - I3C voltage is 1.8V
+ *
  * Switch position SYS.4, Macro SW_SD2_EN:
  *      0 - Select I2S0
  *      1 - Select SD2

-- 
2.56.0

