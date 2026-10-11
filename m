Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A3B42466D;
	Sun, 11 Oct 2026 11:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719772; cv=fail; b=KjFtYKeCMeqi0IURTNDtQSVg907r8BozILFsRABamhkcPWvvNuSXnGmXA3rAxdPeLSOshdFOLJUJluEcunXJm7mg1258yRl1NvySvlJY0A24n92xfdKvdnFqTij7gNlYhh50i0vN31kBgzONGAnrnoQdLsdW9WRC66Jm5s/fC50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719772; c=relaxed/simple;
	bh=y+o0Jv74W6MqLNR+vZPhPSeo8YJTH1yq/N6LldaW0vM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SJgRBYOlCq6PHYk4SRCaHlYXxsQ9LtuoXJoYChtru5TfF9Z/mxMYro+rit4s0MvtHR07uD7D0YYcSnJ9x3F740CzosbIAURWx0HqyCHdXPI2RBJT4pnWPY1ujSkcPirrAapMCmEp+Uap0dv/u0qPxt9GrMhQjmLb0tEWe1l3N/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KR7HxK45; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KR7HxK45"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPb2cQUOQPnxcYDAg77Lgue/XxXLKJhvNhzw2imNHWDZ3QP8L1y9djpqJqqP2RVTt7U1FjQMTxCH2JhblKn4L+YW78X94o0Dx0s06edOZlkCC6YsDHyNuM38ejPqOOW/bTBePaJoU0PuS5MnCTsbqkOsDe4JBWlVUSnDRZBTXUtiyVtrDzsFVHD3VHuQTcLV2RvX051lBmfu8wKq1C4DxCSlxJi3D6aBcKv5F1kQ3Mosvzb2ZINGBjqenxkRgJ9yLgAR1x2atcsZJEQpBVihLfkLINnD1SHE5uQfpL/u3pDTQp49oBSpsj4/Av7BibypK4Q1yRMIG9TaCU83y6+AHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6GIKAWEZ5usoHClbR8HYlOkvHtI3f/MC9UenfMH5v8=;
 b=euk6ooOHhywSZ+3SmO7MbY77OqFmYR3j5IRSJDAvQluR7UsQeD7aYxTTpEApW48C8pKVJQGXHVwFHd6TQDXwiD5zJ15U5fXG4Gg4IKPW+3XQwH6/nULwxSIjeD+rQT/JK+mh5O7MDyQZ337+YpNzLBE/iVQeagKeiKuFXqKSgR1XyP9oXzTazvx2AylrSE3jcNVXHUrBjF6ulIqGRFwoD+hthI5T2dJ+qE4LyvMgFmecHJv3Ss3KK3Pr9QdCTpebxCuL0L2zo1f5IvvQBlsD50UJoBgKSPc2HzG6rtGA7ZP9AtZuVkfHsva0ga188t9KF06iGKsMzvTZVvwj8EknpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6GIKAWEZ5usoHClbR8HYlOkvHtI3f/MC9UenfMH5v8=;
 b=KR7HxK45JR+hky5hoLsthMQkLK+5TOs38AJkXBOMAusQbuwvdcsWZgAqXK3x1PylHSBG8w31GanZe5EXgdMKPbAnKqa1NaAbTomvkr/lk8mXFEiMt1fzMshEaSP21s6WXenP7X7Vt/wWoab31wnQJISt2JdEjel0eKf7fS1th9J3s6289iSrLegfp+QHN+Sp5P9jpSOY9S/4zjef2FlBaZ793dupH4a+MB0aqvlGSUWVjqGwcLDg2CXYqMUCPIMGr/DDyJX/OG3oWqqS8+5K8A+Oi1kJsOdFitAvBp8mn87HJxp3mEKZ11r3IA46v0UJm5VG+IBgHpU+1N91d0/kqg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:55:07 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:55:07 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Oct 2026 19:51:33 +0800
Subject: [PATCH v6 12/13] gpio: mxc: introduce MXC_ICR macros and use
 field_prep/field_get
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-gpio-mxc-cleanup-v6-12-cb47ce2ad758@nxp.com>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: a9621f9e-9bed-4747-4c7e-08df278e7e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|6133799003|260925022911599003|260925021911599003|260925021311599003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	bXuSwJIPqGh4yf7vH/eXjcsdhWp4xmWdD30C9aYgatFQpY6fT0oD6KC6XGz50tkzupeDsxvFJtiN0JLeTDT8wpdCDZxhDpm7KEVuFHvAWeNVaMtRfJ7fseuNFFtw791BofK6rA6F1g5WqhJawbk4NBZ293vyEIgay56/dXPGryQW++YESUN0TdyjpX5BgwjEcA6u2rElqmFMzI3fJt22egDiCSbzz9ZxXwK32hQHBffy3bz4wYuAln+dItWzQrh6kyHjDvgR0OIbo6ryiGpjYiywwExLlbC5xOKqp1kYsGKv1x0ZR5KfL1pk9YDMmc0pmTGbLWBWplXDzV2nA8mo4aIuWL/3s5g760acJGKzJmlrLl0LE2YR5bCUJI50IkRMoSi/xkBtAkZ0a/xaJbflodaah1K4kIU8QJwEHOQkj5+Fbxb+Drh+yIyP58tSLkpZ9un5rNoJQWc5dpInyyvX/PeFljUZiHXIbuqjDgXk8T/fkvHHAqqa4uSFgk2Utf1b5CPpZ5Sd0A0rqmR5cSfs3X+vhaEl5Av4Y1cSa9I6UBPlp5OHdD5xatWW84ZY/vAvlWbWtqdyzXI8cu/B/IVPEqav3cmdSgvVG4bhsG2LRlPc94Cmdj6FzzFk4luX/ZPq+3ydJmpAeu267mmD2PxpIPtR/ULyQC6auSQvMU99tIk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzdjYkVrUnRJczgwVHMzV3JFeUtNczcxMTM1d1Z5eWhTcTdpaU4xZVZ5OURv?=
 =?utf-8?B?UzB2cDNBSE82S2FwRzc3MVVvNEJ6bjh3WE52amM3S1JWRFBzRDMrdXFRZ283?=
 =?utf-8?B?WHpMWDB0SUJOTGUwSnVyRG1CY1A5QU5ZMERWYU5iLzEyU1F2UU8yVVBuQXJh?=
 =?utf-8?B?WkZGLzB1NnlkemtPV2Nwb1NHYTh6RnRWM05RSHdzUmVlL2JHTmZkVVdhUkVN?=
 =?utf-8?B?UHlDb3JTTVJGbnd6MVdLdndSbHQvanBYeG41MW5vRHR0MzhQQ3UxSjhHNG02?=
 =?utf-8?B?azdwZDVRbVlncElUM1B3Vkx3TlUzMHd2c1JZcFF5WG1HVTNwR3BoTGZEMUY2?=
 =?utf-8?B?ZVNlK0VwdTNnY01SZktpNGhYdkxPbnZ6cDlFeStKNWlIOTU4Rk5VbERmaHFX?=
 =?utf-8?B?blVxcDJKWXB4WDJtTzZDcEVOcFZZaVFsckJwTTBWMkprQTF6djBBR2EwYUc3?=
 =?utf-8?B?SWlsREMxNjJndysxUm9ZeGlZYVN2c3ExTVBwQ3o0a2svNFpxME9oSmExVzVY?=
 =?utf-8?B?d1J5NjJLY0VTM0E2V3BOS2NLRkhwbWVVRXpyMVN0KzY2Y09xM2s0bDVMcWJJ?=
 =?utf-8?B?b0FEbW1xcDUwcHR1Z0puMmNuUkp4cm03ZlYzM08vVHVzeWZ1bm5CNi9qNDlR?=
 =?utf-8?B?S08vYzkzdVdvSHJzNU1YTEprVENsdzBJOXRDSUFDQnhocnBWYVNXUDZoNU16?=
 =?utf-8?B?UWNOQ2RMbDVCNmZLTjlEckRQN3NDRlZSU3d2UHpYNm0yVGJJQmUwVnB3dmZk?=
 =?utf-8?B?eExuS3RiN3VHOGpPajljM3V4bVFuaGhHb014bEdqclRkYXNDc0VMM21OUWhM?=
 =?utf-8?B?NGR1WU0wK05jY3lwZ2tUWHYycUFKK0xiVzZpeXQ2ckdxNUw2MDBmNUV4c09J?=
 =?utf-8?B?cFpEVENHSkl5UGlNOFdzaXJuTDBpUEdaNlBxRis0dzlFVDZjdUpsdVRkTmJa?=
 =?utf-8?B?VTFBdmJSeTJxMk1YeC85YVVXRWRHcFAyMUFrTVdnKytkc2lnVWZuWEgxUXd0?=
 =?utf-8?B?cVpIMXVjTFh3L2R6VUJMUW0zK2V0K1JLOHhnSlRQTS9mM0pHaGlVdCtUeStX?=
 =?utf-8?B?K0JPMjlBNFBKelhnaUhwOGUxalVucU9xS2g1MDN4SEk3dG92WnJsNnk2K0lC?=
 =?utf-8?B?Z2VjNVhaUG9Ec045WXlSdzJUU1dFcGNNOVR1V1dDT2d5dWVDd2hFV2plYXpQ?=
 =?utf-8?B?a2tnYUEvMmp6QjY5SU00aGJxa1BHWHgvMDJabWRoQlZHSlhyalVXSUNFTWdm?=
 =?utf-8?B?WHVRejAxZzVTZHhrQUtKcXc3YWZNTWVOdE1uSmxSL0lDNTZDc3lWcjArUVA5?=
 =?utf-8?B?bEhNMDB5a1pIcUJHMFRuVitMUFdVMW8wdmNZZ00waXE1ajU1aGJldnBIWStO?=
 =?utf-8?B?R1lUTlVvMzNkZHVDR3dUQTJqOTNsYlJobGFDUENuSkt1cWFKd1dqU1phTWFv?=
 =?utf-8?B?MTJ3djBmRnY5eGZMWmRlQ0orY3A2WXFzSm81ZWNtN0FodDRZV0JJc0RRVnZL?=
 =?utf-8?B?cmNwRFJ4TXdIR2FhSWNRNnNXb1hFYllUNDE1S0o2ZmJheVplcnRHUkJFL3cx?=
 =?utf-8?B?WW9aVHlKRzlUdUYzamFFWC9kTVUwclZWcmNKdWo5ZG0rbEdBNHJwRkFoYUZZ?=
 =?utf-8?B?dGNUZ29GS2lFSGVZcE5RTS85ZWxVMzMxUGRQMWJRYndkdmZuZDNFc245ZCtP?=
 =?utf-8?B?eXpxbjBGbGJBdGdTald5aURXSzBvMGd4OGlXeXNyQzZXS1pOQ1pTM2J5b2ht?=
 =?utf-8?B?SUduMXRYYjRuaW00eFcvcEF1QlJIaGVDMmcvME9Ua2VOSzdVV1FHYWNmRlBN?=
 =?utf-8?B?U2o3Rit2aDkrRGJPUmZ2Z1U3QSt6am1jSzF6YmlsTE1yQndWL2FxVGRFcUxZ?=
 =?utf-8?B?bGUxODY1a0swOTdndUN0UTJlYVpKcDFNN2VYRm1yYldLM0E1Zkl0N3o1Y3RT?=
 =?utf-8?B?cEZadENubFdGUWZGa056UTI3NEYyc2MxZi9rZnBCUk5iSVMxYU8yVEdPNG9m?=
 =?utf-8?B?d1NzMjFVMTlDSE12WTY3cGd5VXRJekwyRlo2RGg5MjIrRGl3R2hlT1VYdDBx?=
 =?utf-8?B?S3JCVFRrNDVCV3lIUXdKTy9FYmJXSkNVUkhBQzBUcnlPVDRjbEZyNVFxeUNF?=
 =?utf-8?B?cHVQcUhOVHNXdFgwNHVPOUNFU1d2RjJzaFMvTWpwRThaQmY5Vm5tSjYvSFEy?=
 =?utf-8?B?ZU04OVFwU0dSMnlqYnFCQTBpd1puTkNtcUNtckwxODczSlo3UjlIOXZvckRv?=
 =?utf-8?B?Q2ZqOUhOZWsxbnhITGlCRU96MDg4WXh0SlJpc2hlS285d1NhU2RmaXRBK1pm?=
 =?utf-8?B?WnlhMndicXd5eWp3NnZDQ3V4UnQvVytRUlBidGJramI1VVlpcnA0eHlNbm1y?=
 =?utf-8?Q?7fH3sZbPkjXiGxPy684dg9v7YKaPQhUDpIU3J?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9621f9e-9bed-4747-4c7e-08df278e7e4c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:55:06.9839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcspWdBjUps0uQx2NyMfYqoA8Xjn8yEw+Fbzb0xdSDpY+tGEIueatmYXq3XF/7WKPVEEXf2lhLFayfHKgZSNzkVcQn1z82El0e0cbBajRyPMYbvqYkzA1Un7/RFCCnZx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

From: Peng Fan <peng.fan@nxp.com>

Both gpio_set_irq_type() and mxc_flip_edge() open-code the same ICR
register selection and 2-bit field shift/mask arithmetic with magic
numbers (0x10, 0xf, 0x3).

Introduce two macros:
  - MXC_ICR_REG(gpio):  selects ICR1 (pins 0-15) or ICR2 (pins 16-31)
  - MXC_ICR_MASK(gpio): 2-bit mask at the correct position

Use 0x3U in MXC_ICR_MASK() to avoid implementation-defined behavior
when shifting by 30 bits (pin 15 or 31).

Extract the read-modify-write pattern into icr_update_edge()
and the edge readback into icr_get_edge(), using field_prep() and
field_get() for the shift/extract operations.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 2847304640f1..7987ea2de32c 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -7,6 +7,7 @@
 // Authors: Daniel Mack, Juergen Beisert.
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
+#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
@@ -174,6 +175,9 @@ static inline bool mxc_gpio_has_power_off(struct mxc_gpio_port *port)
 #define GPIO_INT_FALL_EDGE	(port->hwdata->fall_edge)
 #define GPIO_INT_BOTH_EDGES	0x4
 
+#define MXC_ICR_REG(gpio)	(GPIO_ICR1 + (((gpio) & 0x10) >> 2))
+#define MXC_ICR_MASK(gpio)	(0x3U << (((gpio) & 0xf) << 1))
+
 static const struct of_device_id mxc_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx1-gpio", .data =  &imx1_imx21_gpio_hwdata },
 	{ .compatible = "fsl,imx21-gpio", .data = &imx1_imx21_gpio_hwdata },
@@ -196,14 +200,28 @@ static LIST_HEAD(mxc_gpio_ports);
 
 /* Note: This driver assumes 32 GPIOs are handled in one register */
 
+static void icr_update_edge(struct mxc_gpio_port *port, u32 gpio, u32 edge)
+{
+	void __iomem *reg = port->base;
+	u32 val;
+
+	reg += MXC_ICR_REG(gpio);
+	val = readl(reg) & ~MXC_ICR_MASK(gpio);
+	writel(val | field_prep(MXC_ICR_MASK(gpio), edge), reg);
+}
+
+static u32 icr_get_edge(struct mxc_gpio_port *port, u32 gpio)
+{
+	return field_get(MXC_ICR_MASK(gpio), readl(port->base + MXC_ICR_REG(gpio)));
+}
+
 static int gpio_set_irq_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
-	u32 bit, val;
+	u32 val;
 	u32 gpio_idx = d->hwirq;
 	int edge;
-	void __iomem *reg = port->base;
 
 	clear_bit(gpio_idx, &port->both_edges);
 	switch (type) {
@@ -249,12 +267,8 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 				       port->base + GPIO_EDGE_SEL);
 		}
 
-		if (edge != GPIO_INT_BOTH_EDGES) {
-			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
-			bit = gpio_idx & 0xf;
-			val = readl(reg) & ~(0x3 << (bit << 1));
-			writel(val | (edge << (bit << 1)), reg);
-		}
+		if (edge != GPIO_INT_BOTH_EDGES)
+			icr_update_edge(port, gpio_idx, edge);
 
 		writel(1 << gpio_idx, port->base + GPIO_ISR);
 		port->pad_type[gpio_idx] = type;
@@ -265,17 +279,11 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 {
-	void __iomem *reg = port->base;
-	u32 bit, val;
-	int edge;
+	u32 edge;
 
 	guard(gpio_generic_lock_irqsave)(&port->gen_gc);
 
-	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
-	bit = gpio & 0xf;
-	val = readl(reg);
-	edge = (val >> (bit << 1)) & 3;
-	val &= ~(0x3 << (bit << 1));
+	edge = icr_get_edge(port, gpio);
 	if (edge == GPIO_INT_HIGH_LEV) {
 		edge = GPIO_INT_LOW_LEV;
 		pr_debug("mxc: switch GPIO %d to low trigger\n", gpio);
@@ -287,7 +295,7 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 		       gpio, edge);
 		return;
 	}
-	writel(val | (edge << (bit << 1)), reg);
+	icr_update_edge(port, gpio, edge);
 }
 
 /* handle 32 interrupts in one status register */

-- 
2.51.0

