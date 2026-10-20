Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792487774;
	b=UNI9lq64eDB074kRnAv7qWUaK+UDO6KtJVQIhOnQHJtAimyHBw9Oc9QbVQLfW2hdsRUi
	 vfwYLC0FfwL3bGWfyU59eBkuLRF1fxeqMaPOXUMROsJ0rRpiQMpnTOo+6TD3bo6U+T17O
	 4jXw4TCqX5VAhekF/jZNIInVyisP8CUKqTxRNGBHV7KTsu+3UilOmmknGVDo9r2YqIdXD
	 fY0wo4FnSlVx9pd4JE68xoCiaM6/2Fcrdb2Ht7A8+Nz4kAzDYcOI6Sfjq/iPkA+9TSkEZ
	 wrbZ/o2CA4uRPbNpmvE3JmpJjXUzA/Cu45oYk9wdSsYtxFljH8MMCCLadEpJwCYqsYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487774;
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
	bh=yo2C3cmT7FHw7iYdKMioPIvkNk9tWaAPeQd9avhzI2M=;
	b=T7u/1ZCOMJDgaKaGRTvjkWx5uzRcPWUMpzGLmmQGbYqYBGLc7bFs8KazTG8vc7Vs8QHf
	 C8y6Vsgd/dpJunTrcFjJKKABtan5nwLlDOTYw0xDtpFxJhLEy86PbTAfy6ixjc4ynL4uO
	 KtivY3DQVHN0mFUvr6I4SWMiiCxq2H7MtE3HQl+arwRNTiitHLGi0H5o1JyyHSPZdZ6uh
	 JFMtgDYcRDKWdGSCQDmmw1x1BtPE78xWqi9FZpSC+LNCaHPWlXB2enPD2FJALIqs6fFAP
	 BEf2KxccMKGJdyoYE9/+1gYsj9IrsZx5czA9MSgujnRovjb1vjzBocibf8lOnWqf6SA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=dWqJUp57;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.33
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010033.outbound.protection.outlook.com [52.101.229.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967A3606A328;
	Tue, 20 Oct 2026 09:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967A3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=dWqJUp57
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hM7XvC8Cb4+24LldO7p/jiciz7vLIjjYWlcqIUWoUL3Zta1xG9a9vqCohmvepI9ZMBTfVskxkOasX9RSH8uFxjTR0vtyLvoSXRJmqB9OKIl+b4YvQ94cMyAmjD7Bi/xr5RGAN6t79yntzHg2LXTpDBdacQYA0N4/9/LXCZAQ5RH9ZpW3qvlVcd8vqLQDl3EXV5XipVC/+/TLWNqepxWc2gEJM7OK4mGGAhEV0H0VNwtfwZoiEHB4wF5+RR6ypvx3n+KyhWSpBWcMHEDRHsNHBhl6r8RLChK1sliE/ubQwO25tw93fwHHJWU5OaBE5DQN67jhqMCL9FR4+Ezn9MDWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yo2C3cmT7FHw7iYdKMioPIvkNk9tWaAPeQd9avhzI2M=;
 b=aJIJESeNE1OlVXxNzeyEyHRmRUNtUf9ggMD0zvkrVJ8OiKxkKpwEr3lYEewgUGsGKV7l1KU4+wMlGMx5FDnU7SOLtQZ2Dm4Z6fSNYsUO+4mRkRbCH+9/BqLnCe4uRfwmUQd6ODolmNrSBwXjyll+s7vxlqFAIxniZ3Nht6QQ4Twgm16GDnU7w0RAfu2hNJP18LVigaL5TQDHH4rc06Xdovg7oZk58dI92WTSJ6akjdQLVYmzFfVksQiGERhXZSMqDICgG2IHzz4Xb8kAXbuX5BuUqI8TYcYX4gr3o+eF/9I6yZigHJmW28wPT14nrVN07VQ9v8KkDV3SDDg2a+lQJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo2C3cmT7FHw7iYdKMioPIvkNk9tWaAPeQd9avhzI2M=;
 b=dWqJUp57QeGRDWCX2w4rT1c8DGdljRamIyt6AGpY+Z5rpOCDdnn5M0/jw8MvPA6qRps3dDQdYtwBeN/hIAJyLVlGxE+nrLfpss7FPtCyvODyhYW5CoqckeJRweKupTlQG8EYD1NjrR4jFdy5YFK9UxGKkBisqoCQMWFpRZ6uPoQ=
Received: from SY4P282CA0009.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:a0::19) by
 TYXPR01MB15664.jpnprd01.prod.outlook.com (2603:1096:405:2a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:16:10 +0000
Received: from TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
 (2603:10c6:10:a0:cafe::2b) by SY4P282CA0009.outlook.office365.com
 (2603:10c6:10:a0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 09:16:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD9.mail.protection.outlook.com (10.167.240.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 09:16:08 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 456073000298;
	Tue, 20 Oct 2026 18:16:01 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Tue, 20 Oct 2026 10:15:02 +0100
Subject: [PATCH 8/8] arm64: dts: renesas: r9a08g046: Add I3C support
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
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-8-30a47f25e515@renesas.com>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792487702; l=4402;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=67lz1BnDtmXvT7G4gCpGKkL2m2r/JGwJQMylhzyi064=;
 b=9bSx6NTEivqX4CVIWm+SXe6iO2Jv/APDCTUbRlPQQiWA+/PZW3kfdjT+RkvCsuyQfv3OO0FqZ
 j7LoLCnHW8tCbksgtOG1EkOozX/jUZ/kO3lJ1G+HPbTxEDPLF3Hp2+Q
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD9:EE_|TYXPR01MB15664:EE_
X-MS-Office365-Filtering-Correlation-Id: 8322dc81-abd5-4d25-8e5e-08df2e8ac6fa
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|7416014|18002099003|22082099003|921020|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CbaVQVBGCJ6Gwt+EbLLNl1ZeJDoPSr4XyhteYBgiQiNlCbBIaOwVkSbtKmxZdgJDfDoOFZT36KJsBgwyzAjwoSKxobPHYtSYrGA+eS0atyJwjXEZ7jyjo1zWP+11GfugQxWHT8ZthyiYyhcXkhYiGVW5MYrbnXKJxJIqJUr7jZte8gfT0PCVlNcWbQENQ75QXo09leqJUv616jP9BPZbSgP5cth5wRsVfvx2MvTYakAT93E96dQxgxURhBqVB6OC7t8BiFD4sOR3OWmtSqdSOhVCcSrdlFZ5EOs+aCF1Gn5ubLS8PFE4cbS4QFT6cCaaq4yEhr2yJSwKy6RYTRazgNwT6UJ0B0djSkPq5yjvKB7CW8mylucpiUd4UDUHXtq9/2lB6+F9i6OhYkH6bkN2j/X0W/UjledeUFlwEW70sNBlAWSIfsvmW5ZwKwIQKzuvaRdSN0723V1HegCOO+I2xDKmtqmniUNXqodFvPPf8LFH0KA5rLaJrq082IhCNmcnH0SbgIBb7/BppLyiG5DwelOITE1aLykUmAqSnf7EgkGXnuMcTSjauQhEnWmZYIA2BXNfbvo6zifSxfbxFkH89FNWxP5F+LwYUPCnd8BZmjTARGPs0HT3fXDl83Xo+NnsATUYTJ6oZ1Babg1RA0xGLtc4UTFECyB/e59bwtEVCix1HMTFdb8aToPKw4ZeaexXJLTE1mfF9mepVPHs4gP46flzvqrB7bkE6damsvhlQYxb//z1kefWYpemJSvtwubv
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(7416014)(18002099003)(22082099003)(921020)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3xhCsWbWFtA7z9BUK2HWuxmhnmR978VG+KwK1fyh595NL56fPOQjvcIe2bVdA3mQSJpgWeQmNVTM033Q/lp3GCJFoPE+/LALo1B4ZdHsnk68E4a1ueCHG3KAmGa5qMb0KYdSRZrOQiVXdYtjXT9C9YTXehELsrkKYseyRHNt+EuaaZqVqF952KpT1HhkiyZXcOYta6PaJpxmuzUpmLm2zZzOKB7VsWIqwWIUe1j/EFoO24zOsScnsPWqo/6bjj8ugmuZ91Jmf7ON7fU9mvfgTe76ngmr7CO4NIBhW4jeH6/+l7+K7Rd6Qy3BxyU2n5gqvu3bkoEf8/TUUF9N3R9SW0bkPH2cl/EYkerFEesA9cIUkoziSL9ijV8l7eJBoQ1xN860YIk7kvpoLxrchYVtmWg3sY1fID+GTH3yrvSIiy6enEcDD8a/dtwUDpmvHJB9
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:16:08.8076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8322dc81-abd5-4d25-8e5e-08df2e8ac6fa
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB15664

Add the I3C Bus Interface node to the RZ/G3L (R9A08G046) SoC DTSI and
enable it on the RZ/G3L SMARC EVK, together with the required pin
control.

The I3C pins are shared with RIIC3, so the controller is only enabled
when the SW_I3C_EN switch is on.

The I3C I/O voltage can be set to 1.2V or 1.8V on the board through
the SYS.3 (I3C_IOVS) switch, so configure the pin controller for the
selected voltage through the power-source property.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 35 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 21 +++++++++++++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   |  4 +++
 3 files changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index f33d5d7468ff..1b0b95b12ef8 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -620,6 +620,41 @@ canfd: can@100c0000 {
 			/* placeholder */
 		};
 
+		i3c: i3c@100e0000 {
+			compatible = "renesas,r9a08g046-i3c";
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
index 68d7b579e352..0be2936f9424 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -13,6 +13,7 @@
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
 #define SW_I3C_EN		0
+#define SW_I3C_IOVS		0
 #define SW_SER0_PMOD		1
 
 #define PMOD_GPIO4		0
@@ -174,6 +175,16 @@ pcie_pins: pcie {
 		pinmux = <RZG3L_PORT_PINMUX(G, 7, 1)>; /* PCIE_RST_OUT# */
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
 	rsci1_pins: rsci1 {
 		pinmux = <RZG3L_PORT_PINMUX(D, 4, 5)>, /* RSCI1_RXD_MISO_SCL */
 			 <RZG3L_PORT_PINMUX(D, 5, 5)>, /* RSCI1_TXD_MOSI_SDA */
@@ -250,6 +261,16 @@ &rsci3 {
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
 #if !SW_DPI_EN
 &rspi2 {
 	pinctrl-0 = <&rspi2_pins>;
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

