Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2091.outbound.protection.partner.outlook.cn [139.219.146.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551753B83F9;
	Thu, 10 Sep 2026 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034693; cv=fail; b=n04cCNoVruitgmPbg5sDK++SOISk5jjIOOiNRWRHAZwzHCqc8XK/5lLIbk8YjiMgEdS55kaRV0DTeWOR8QHwbBzQEcWjn3UWE9SLSKn03mqZ7c/4uYmg+Nk7BkdKu/FYK7ecodUStvidkYXDGOK0yfLq8e+7DEurHl9qoc6VD8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034693; c=relaxed/simple;
	bh=Nt40+2nFcx5lkAH2IkPvTcH0itxL8RBwCjBzPHlpkVk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mZGqgdXuO4tvr7SDurc3qyFKxcutcBgJUdJphc6HSnSDxnUjwgwTiclx4cH4rDb+uM9H36XdIa+pFf6B6eh3VIw4jbtV7ECcHGyHMkoy+61IOxArJtmluK34qZv98lJsgtY88HIq5InQ5aC7dhBYzlKpYhPb8SCO0Vcl4teJLZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRVIEvRl5pcIqHZLFY4ZgXSCrdnMTkfvwSesiYpHBIg4MeaQ0jEb+l3wsL7BXqQ4KOao4WS9ON6W24kk5L6ykcgGvnxYDEf+Ae9Oaz1nIxYBlRxV/pPrDRcBYYHuUHvKwpmK9WB5H94Lqx9dvEN13hFQBe60LoZh2VtVtAKwvAlEA+lAflodb+f7lw4uNo9QCj3qvXiMQu6jRND6hhW0hSxt1JQz3ooxieLuUoii6TxecIzPFT3+SSCFUAFlmM1qsEGJCtAa1ZU2aTZWwMvoKq00VGn8vtBCpyM9PjGAxTM6ZgtffiKaNO+tssXTJonlTU+OYmP5gOTGNwCg/xImpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwTSph3PNX22SC/kHKsVP7FF7zPdsFUKWH4xEwSEm/0=;
 b=SnHXi+44mXYA9KXF0i+i3clXgCUHcG2c2w9BFnBkZmK8kAVcfn7OuYFUGfI4mGfnta+8d8wc2JvZzu11HYTAdqbiP7yU6svEtVAzHWIl4qYJMHK7dowa0Z4flSklUTVUW1VAiJdXGldeRKnqMQ12pUHVcbnKtE4w8GMGJWH+JDDrgC2GqV1Ums3UO1NgfihiXuPRDCLjAjJ7TCescb4NJ7R4bHem13bj8ytrIHgf/oKJsziOU7sX8aR03yv/PUH39AaZgLbmxXVvEIdOzw/oChaQByUmLdCSrgUV7fRCaMhzBd3A3P4UIa9HaMWrZ7gEOsyePFJ4i1jSXIFGpTwuSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.18; Thu, 10 Sep
 2026 10:04:31 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:31 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v8 21/22] riscv: dts: starfive: Add JHB100 pinctrl pad number header
Date: Thu, 10 Sep 2026 03:03:56 -0700
Message-Id: <20260910100357.130134-22-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::21) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1170:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f939ac-d164-4c43-3e88-08df0f22e8a5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|1800799024|376014|52116014|10067099003|18002099003|22082099003|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	5G+Q2mBe0RvRnhHkkyjt7lzuPGA1CzYo46edJWwueLmu4GTvqW3EqjEsWoOqaqujlL+nJZ5Z+02N403O8LVU9LZCNSDa/F46GKrA1UAo7naJGBEb1l7yYhShRLg5/PEgdO3RoyWzKBTAKoqNg8WDpsRRY5mBGDHQaDegHTAMp9/HY+6F63Lh+W3h6us5ugXUJ0hzjRU/nJWOCnlj8EULOY4fMXi3CxjigxqIoOMlTs6pYYJzD6AXUxmkDxabRS2azAjMWpNoLX42hKX5Wb1QBTxz7BEc8bxZOf7Jl6WUzuoCQ0RqQFBPaheN+9m02w3C+q5OD9WseB/p9wVG1I3dV+J+jTEIKwPWWAr/J3pOgDIxTeHzBl40g9Uf69rrCg1w7maLAn/tg7+4egcVNv0bvbwIGBc6aIMC3LuQeM001BsNd8KZ5m0wsUGuZmHF/rDD3gTCisJYSxDBpmUTw1YrdwiA+OctwPVMe3PoEmt79IuZrC2qrHilO1v2hxZ9yKvu4NqVtaLF2e7fB+4k5TmrYHWM6H/YsHZAxgzTwRCnhOXVpAPDrX561J9A8Ekiz//dOuk9CMk2nc9zoy7Yn0bh1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(1800799024)(376014)(52116014)(10067099003)(18002099003)(22082099003)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AfMylZ/gFVSfhFyjdxwBW0Ya2vVMGVlAUo+RHa7S9oScUJ4DZi4zbuc3WAKd?=
 =?us-ascii?Q?l/7vbHrNw1aqjViV1hYwMUUzEBPmTyUpgEeTrBWs/4bQHkGWQxSihcL+0uah?=
 =?us-ascii?Q?prkFiMUAI9B9E3VLQTU+dsxHYp5URj2IiJPVDNzojVorVNGjbt/VCtw23xuH?=
 =?us-ascii?Q?adJ4p/ALlpwXl2XvM/ufExJ9osatRVBF3mzBeGGM8s69sHyc0gQRkUj2J2xk?=
 =?us-ascii?Q?ZU0AeaDzZTs3BsyDAa6F/OMbVVazGb5KuQnisg2cj/edhxx6H+3kcq0mc8dk?=
 =?us-ascii?Q?lpg4/3oBMq7n9ytpgeyM+JmyirycoktlqVbJaFi86tbBLou2PhVXfYmd0T66?=
 =?us-ascii?Q?WBkBKaRgyKHw9ihCOzCUqXSp9VoFiElK7CB9UtIgZQVHUJCZdYvUBquzu2+w?=
 =?us-ascii?Q?JXGapZdoqh82bNBoaz7+6YTUoQ2ndvBd/2Xb6Zw+wE8uQqxpscb47FpdxZtJ?=
 =?us-ascii?Q?6S3ApPr5R+p1nH2co96BTM3wDKnev3pnp8lbIFSFRZUlsDa9g5DvBGdytGsk?=
 =?us-ascii?Q?eXGHNTzjNWEQQK3/M+IxSRImzXeWQpbTOig7Y/43ApvznCD6eKy0O9xKFZYl?=
 =?us-ascii?Q?haMHhWnm4DfRfMdNONFwAROCVw3oD3elP1z8K9eiFU3sSgrjdNRq9S8k/C0v?=
 =?us-ascii?Q?KsfDErlC+Ke3ih47oQfgSSS8bu2X4yWeXtJ8biEiBmFmJ9+o2GbLaRv2l7Di?=
 =?us-ascii?Q?ngonKLQfX3+8HhMPagREUTWOQ1/vbhldw0N6P22WOxb3NL5nrRWOvABRJnJw?=
 =?us-ascii?Q?UKLbMSBauhZKI2VWPlRHmukq2X9vgMXPuQAmxgwijNNL+QHdZYUzt5yvMpgQ?=
 =?us-ascii?Q?ApshreX30xvqAQEN8tfweNifRD4QKBv7UiRjvbRgj40O9CJNk1MN3t0uU4WT?=
 =?us-ascii?Q?TUnkOJd6TcLjFkqVXyzyph3LOsWR8fdnXdi9I3LS0Kt5m1KVnrQHwgfJie7t?=
 =?us-ascii?Q?Wrmw1zPG1LlZ5TlgXxNmoyNB4Y+F061CQPNXF4S0FojxA25a7GdMFqPvu7hX?=
 =?us-ascii?Q?cseR3TZXpeVBiIdFZLofviKscL8Zq8GxbhV6IDUCQjdjfOngTapunStozDFr?=
 =?us-ascii?Q?dw1O/8hQ/42l9ymlMWI9k1n69Al+y54y+3viuh/skWRtQbx1w7DZCgvTGaGC?=
 =?us-ascii?Q?/2pbz7S1WFgCzIM2T9IKO03axECK2hzDJdWsJVWa6xslqxJlKrgAQTCha2ot?=
 =?us-ascii?Q?TepqXiay9GDItD1QUX8vLuGy0aHv8sJuIIzANerdo/5JznmfDEEdXE4Cj0HH?=
 =?us-ascii?Q?EiuU57BzjuNx4WBrfv3sne/gL9EnfoQZvr5QvL3CpkF0BXroKJ6lXlwXxgDi?=
 =?us-ascii?Q?SK+ucCMsuXQ9f5b1FvqegF1K+46p3nEgKdbyEuLOocFD8692UJe/V1YaGZK3?=
 =?us-ascii?Q?b/SQk8LU+J9MqtFozEuyniLn8vL/Gj4ZkrWpG2q72pYmv1jVRc97Km2voQ7S?=
 =?us-ascii?Q?oSeNrrl4wUKbt/gKK5bsd940jR+07aMRct9JYt6qIFg6n49ZYpWlDz41S+0C?=
 =?us-ascii?Q?KmbH19IRX53RFjc8s31ZD8kWobwRkPIxrf52qko+3n6g72YFvaFQTnQv9QU0?=
 =?us-ascii?Q?6e2GLHohMbtx7KcJ9pJyJBW+1JgP8HkvQPISnPlJyVivOEiW7Zt6tE9CQ7Lr?=
 =?us-ascii?Q?J154oUQJow2DpU2JUBt2Dpd6AeP7oPV+lvn+P82uYREZ0Ke8026zXrHRwMEr?=
 =?us-ascii?Q?Uo3mvfFN2GhGExDu68ULFNieSoAzCym+JuerqWZTpTuBeZ59ORc+wHFfN6HM?=
 =?us-ascii?Q?Cp7bN19gqCUca9L1gshxYFNaJ2p/JpG/TnTUCS2C8clQ+NXs3Ggb?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f939ac-d164-4c43-3e88-08df0f22e8a5
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:31.6926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZprib4NwoHZccb1aqaQrCveSblZAIwImVTsQD1xOKNvhXcwiMsZAevJB1Vi7GlsoR13DGLiosqet3//hN+NsWe6AAZNPLF6KGyFjEiUti+OXIiIcXPEI/VatqIceM5d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170

Add the pad number definitions used by the JHB100 pinctrl device tree
nodes. The pad numbers are a property of the SoC pin controllers and are
only consumed by the StarFive JHB100 device trees.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                   |   1 +
 .../dts/starfive/starfive,jhb100-pinctrl.h    | 247 ++++++++++++++++++
 2 files changed, 248 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/starfive,jhb100-pinctrl.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 08201752d14a..f1a867babf85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25903,6 +25903,7 @@ M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/boot/dts/starfive/jhb100*
+F:	arch/riscv/boot/dts/starfive/starfive,jhb100-pinctrl.h
 
 STARFIVE JHB100 EXTERNAL INTERRUPT CONTROLLER DRIVER
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
diff --git a/arch/riscv/boot/dts/starfive/starfive,jhb100-pinctrl.h b/arch/riscv/boot/dts/starfive/starfive,jhb100-pinctrl.h
new file mode 100644
index 000000000000..a645ddc836ff
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/starfive,jhb100-pinctrl.h
@@ -0,0 +1,247 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
+#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
+
+/* sys0 pad numbers */
+#define PADNUM_SYS0_GPIO_A0				0
+#define PADNUM_SYS0_GPIO_A1				1
+#define PADNUM_SYS0_GPIO_A2				2
+#define PADNUM_SYS0_GPIO_A3				3
+
+/* sys0h pad numbers */
+#define PADNUM_SYS0H_GPIO_A4				0
+#define PADNUM_SYS0H_GPIO_A5				1
+#define PADNUM_SYS0H_GPIO_A6				2
+#define PADNUM_SYS0H_GPIO_A7				3
+#define PADNUM_SYS0H_GPIO_A8				4
+#define PADNUM_SYS0H_GPIO_A9				5
+#define PADNUM_SYS0H_GPIO_A10				6
+#define PADNUM_SYS0H_GPIO_A11				7
+#define PADNUM_SYS0H_GPIO_A12				8
+#define PADNUM_SYS0H_GPIO_A13				9
+#define PADNUM_SYS0H_GPIO_A14				10
+#define PADNUM_SYS0H_GPIO_A15				11
+
+/* sys1 pad numbers */
+#define PADNUM_SYS1_GPIO_A16				0
+#define PADNUM_SYS1_GPIO_A17				1
+#define PADNUM_SYS1_GPIO_A18				2
+#define PADNUM_SYS1_GPIO_A19				3
+#define PADNUM_SYS1_GPIO_A20				4
+#define PADNUM_SYS1_GPIO_A21				5
+#define PADNUM_SYS1_GPIO_A22				6
+#define PADNUM_SYS1_GPIO_A23				7
+
+/* sys2 pad numbers */
+#define PADNUM_SYS2_GPIO_A24				0
+#define PADNUM_SYS2_GPIO_A25				1
+#define PADNUM_SYS2_GPIO_A26				2
+#define PADNUM_SYS2_GPIO_A27				3
+#define PADNUM_SYS2_GPIO_A28				4
+#define PADNUM_SYS2_GPIO_A29				5
+#define PADNUM_SYS2_GPIO_A30				6
+#define PADNUM_SYS2_GPIO_A31				7
+#define PADNUM_SYS2_GPIO_A32				8
+#define PADNUM_SYS2_GPIO_A33				9
+#define PADNUM_SYS2_GPIO_A34				10
+#define PADNUM_SYS2_GPIO_A35				11
+#define PADNUM_SYS2_GPIO_A36				12
+#define PADNUM_SYS2_GPIO_A37				13
+#define PADNUM_SYS2_GPIO_A38				14
+#define PADNUM_SYS2_GPIO_A39				15
+#define PADNUM_SYS2_GPIO_A40				16
+#define PADNUM_SYS2_GPIO_A41				17
+#define PADNUM_SYS2_GPIO_A42				18
+#define PADNUM_SYS2_GPIO_A43				19
+#define PADNUM_SYS2_GPIO_A44				20
+#define PADNUM_SYS2_GPIO_A45				21
+#define PADNUM_SYS2_GPIO_A46				22
+#define PADNUM_SYS2_GPIO_A47				23
+#define PADNUM_SYS2_GPIO_A48				24
+#define PADNUM_SYS2_GPIO_A49				25
+#define PADNUM_SYS2_GPIO_A50				26
+#define PADNUM_SYS2_GPIO_A51				27
+#define PADNUM_SYS2_GPIO_A52				28
+#define PADNUM_SYS2_GPIO_A53				29
+#define PADNUM_SYS2_GPIO_A54				30
+#define PADNUM_SYS2_GPIO_A55				31
+#define PADNUM_SYS2_GPIO_A56				32
+#define PADNUM_SYS2_GPIO_A57				33
+#define PADNUM_SYS2_GPIO_A58				34
+#define PADNUM_SYS2_GPIO_A59				35
+#define PADNUM_SYS2_GPIO_A60				36
+
+/* per0 pad numbers */
+#define PADNUM_PER0_GPIO_B0				0
+#define PADNUM_PER0_GPIO_B1				1
+#define PADNUM_PER0_GPIO_B2				2
+#define PADNUM_PER0_GPIO_B3				3
+#define PADNUM_PER0_GPIO_B4				4
+#define PADNUM_PER0_GPIO_B5				5
+#define PADNUM_PER0_GPIO_B6				6
+#define PADNUM_PER0_GPIO_B7				7
+#define PADNUM_PER0_GPIO_B8				8
+#define PADNUM_PER0_GPIO_B9				9
+#define PADNUM_PER0_GPIO_B10				10
+#define PADNUM_PER0_GPIO_B11				11
+#define PADNUM_PER0_GPIO_B12				12
+#define PADNUM_PER0_GPIO_B13				13
+#define PADNUM_PER0_GPIO_B14				14
+#define PADNUM_PER0_GPIO_B15				15
+#define PADNUM_PER0_GPIO_B16				16
+#define PADNUM_PER0_GPIO_B17				17
+#define PADNUM_PER0_GPIO_B18				18
+#define PADNUM_PER0_GPIO_B19				19
+#define PADNUM_PER0_GPIO_B20				20
+#define PADNUM_PER0_GPIO_B21				21
+#define PADNUM_PER0_GPIO_B22				22
+#define PADNUM_PER0_GPIO_B23				23
+#define PADNUM_PER0_GPIO_B24				24
+#define PADNUM_PER0_GPIO_B25				25
+#define PADNUM_PER0_GPIO_B26				26
+#define PADNUM_PER0_GPIO_B27				27
+#define PADNUM_PER0_GPIO_B28				28
+#define PADNUM_PER0_GPIO_B29				29
+#define PADNUM_PER0_GPIO_B30				30
+#define PADNUM_PER0_GPIO_B31				31
+#define PADNUM_PER0_GPIO_B32				32
+#define PADNUM_PER0_GPIO_B33				33
+#define PADNUM_PER0_GPIO_B34				34
+#define PADNUM_PER0_GPIO_B35				35
+#define PADNUM_PER0_GPIO_B36				36
+#define PADNUM_PER0_GPIO_B37				37
+#define PADNUM_PER0_GPIO_B38				38
+#define PADNUM_PER0_GPIO_B39				39
+#define PADNUM_PER0_GPIO_B40				40
+#define PADNUM_PER0_GPIO_B41				41
+#define PADNUM_PER0_GPIO_B42				42
+#define PADNUM_PER0_GPIO_B43				43
+#define PADNUM_PER0_GPIO_B44				44
+#define PADNUM_PER0_GPIO_B45				45
+#define PADNUM_PER0_GPIO_B46				46
+#define PADNUM_PER0_GPIO_B47				47
+#define PADNUM_PER0_GPIO_B48				48
+#define PADNUM_PER0_GPIO_B49				49
+#define PADNUM_PER0_GPIO_B50				50
+#define PADNUM_PER0_GPIO_B51				51
+#define PADNUM_PER0_GPIO_B52				52
+#define PADNUM_PER0_GPIO_B53				53
+#define PADNUM_PER0_GPIO_B54				54
+#define PADNUM_PER0_GPIO_B55				55
+#define PADNUM_PER0_GPIO_B56				56
+#define PADNUM_PER0_GPIO_B57				57
+#define PADNUM_PER0_GPIO_B58				58
+#define PADNUM_PER0_GPIO_B59				59
+
+/* per1 pad numbers */
+#define PADNUM_PER1_GPIO_C0				0
+#define PADNUM_PER1_GPIO_C1				1
+#define PADNUM_PER1_GPIO_C2				2
+#define PADNUM_PER1_GPIO_C3				3
+#define PADNUM_PER1_GPIO_C4				4
+#define PADNUM_PER1_GPIO_C5				5
+#define PADNUM_PER1_GPIO_C6				6
+#define PADNUM_PER1_GPIO_C7				7
+#define PADNUM_PER1_GPIO_C8				8
+#define PADNUM_PER1_GPIO_C9				9
+#define PADNUM_PER1_GPIO_C10				10
+#define PADNUM_PER1_GPIO_C11				11
+#define PADNUM_PER1_GPIO_C12				12
+#define PADNUM_PER1_GPIO_C13				13
+#define PADNUM_PER1_GPIO_C14				14
+#define PADNUM_PER1_GPIO_C15				15
+#define PADNUM_PER1_GPIO_C16				16
+#define PADNUM_PER1_GPIO_C17				17
+#define PADNUM_PER1_GPIO_C18				18
+#define PADNUM_PER1_GPIO_C19				19
+#define PADNUM_PER1_GPIO_C20				20
+#define PADNUM_PER1_GPIO_C21				21
+#define PADNUM_PER1_GPIO_C22				22
+#define PADNUM_PER1_GPIO_C23				23
+#define PADNUM_PER1_GPIO_C24				24
+#define PADNUM_PER1_GPIO_C25				25
+#define PADNUM_PER1_GPIO_C26				26
+#define PADNUM_PER1_GPIO_C27				27
+#define PADNUM_PER1_GPIO_C28				28
+#define PADNUM_PER1_GPIO_C29				29
+#define PADNUM_PER1_GPIO_C30				30
+#define PADNUM_PER1_GPIO_C31				31
+#define PADNUM_PER1_GPIO_C32				32
+#define PADNUM_PER1_GPIO_C33				33
+#define PADNUM_PER1_GPIO_C34				34
+#define PADNUM_PER1_GPIO_C35				35
+
+/* per2 pad numbers */
+#define PADNUM_PER2_GPIO_D0				0
+#define PADNUM_PER2_GPIO_D1				1
+#define PADNUM_PER2_GPIO_D2				2
+#define PADNUM_PER2_GPIO_D3				3
+#define PADNUM_PER2_GPIO_D4				4
+#define PADNUM_PER2_GPIO_D5				5
+#define PADNUM_PER2_GPIO_D6				6
+#define PADNUM_PER2_GPIO_D7				7
+#define PADNUM_PER2_GPIO_D8				8
+#define PADNUM_PER2_GPIO_D9				9
+#define PADNUM_PER2_GPIO_D10				10
+#define PADNUM_PER2_GPIO_D11				11
+#define PADNUM_PER2_GPIO_D12				12
+#define PADNUM_PER2_GPIO_D13				13
+#define PADNUM_PER2_GPIO_D14				14
+#define PADNUM_PER2_GPIO_D15				15
+#define PADNUM_PER2_GPIO_D16				16
+#define PADNUM_PER2_GPIO_D17				17
+#define PADNUM_PER2_GPIO_D18				18
+#define PADNUM_PER2_GPIO_D19				19
+#define PADNUM_PER2_GPIO_D20				20
+#define PADNUM_PER2_GPIO_D21				21
+#define PADNUM_PER2_GPIO_D22				22
+#define PADNUM_PER2_GPIO_D23				23
+#define PADNUM_PER2_GPIO_D24				24
+#define PADNUM_PER2_GPIO_D25				25
+#define PADNUM_PER2_GPIO_D26				26
+#define PADNUM_PER2_GPIO_D27				27
+#define PADNUM_PER2_GPIO_D28				28
+#define PADNUM_PER2_GPIO_D29				29
+#define PADNUM_PER2_GPIO_D30				30
+
+/* per2pok pad numbers */
+#define PADNUM_PER2POK_GPIO_D31				0
+#define PADNUM_PER2POK_GPIO_D32				1
+#define PADNUM_PER2POK_GPIO_D33				2
+#define PADNUM_PER2POK_GPIO_D34				3
+#define PADNUM_PER2POK_GPIO_D35				4
+#define PADNUM_PER2POK_GPIO_D36				5
+#define PADNUM_PER2POK_GPIO_D37				6
+#define PADNUM_PER2POK_GPIO_D38				7
+#define PADNUM_PER2POK_GPIO_D39				8
+#define PADNUM_PER2POK_GPIO_D40				9
+#define PADNUM_PER2POK_GPIO_D41				10
+#define PADNUM_PER2POK_GPIO_D42				11
+#define PADNUM_PER2POK_GPIO_D43				12
+#define PADNUM_PER2POK_GPIO_D44				13
+#define PADNUM_PER2POK_GPIO_D45				14
+#define PADNUM_PER2POK_GPIO_D46				15
+#define PADNUM_PER2POK_GPIO_D47				16
+#define PADNUM_PER2POK_GPIO_D48				17
+
+/* per3 pad numbers */
+#define PADNUM_PER3_GPIO_E0				0
+#define PADNUM_PER3_GPIO_E1				1
+#define PADNUM_PER3_GPIO_E2				2
+#define PADNUM_PER3_GPIO_E3				3
+#define PADNUM_PER3_GPIO_E4				4
+#define PADNUM_PER3_GPIO_E5				5
+#define PADNUM_PER3_GPIO_E6				6
+#define PADNUM_PER3_GPIO_E7				7
+#define PADNUM_PER3_GPIO_E8				8
+#define PADNUM_PER3_GPIO_E9				9
+#define PADNUM_PER3_GPIO_E10				10
+#define PADNUM_PER3_GPIO_E11				11
+
+#endif
-- 
2.25.1

