Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A9F4A4853;
	Mon,  5 Oct 2026 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210320; cv=fail; b=GKE1EaTJYvHNAIVBPS7xGpRizR4/B4/KMLg/aQtkWEmhcSdYYCG5HazHbYCAWeqGS17YNoyprt6wj0/sNgYoHz6jwm+V+P88fcNSiI9Plq+qWCFP5rLK5eog7GBQLryf+yeqYC6SDQFKo65beUE/WyILsy8tS0LAqVAh4XZ4kiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210320; c=relaxed/simple;
	bh=HL/czaIjhbWwRlk5BjPuF4BA5Y4JLL0i5J6pw25Kvng=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CdEDwfKPmhleFls8J3rsIK+PAZYVtJrIx01uSinOOucsTJDXzfYznBtt5F2xTUi7byfTXQe3TR3h0p8N4ADtkY2OYG+0eN8WHU/R9DCWWRV9EtLbvQvFakFvMEDJQhAqNhWdS2P+zzuif1yBerVDopsxTV7PiIwJCYtRFpfDKzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tG+Ics5I; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tG+Ics5I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTaGhPf7SJzWKZPYrD145+gSv9ppl/aLuEDE4ezVzL60a1e/Z0UURuZ0uI9RhjDc/P6UVYfhLpf5YEQOo9OOV6Yo5kLG6gZDg9uw2Y1KnZ6oZjULi2EQe98ANeAc5oB6LY01yn/DmIi98BIfUiCBjfPMPJjvHedqk1o3YxNCuMxBOqvvLHbsG/vm9xeliaPTwix/AMdA/WjSP3mhtP7jpVBBeCXBUIV38QGpIeD3DRCrATHGISjhiIODZ+2+nR/Ss6NvLtJkxRNW2v+70FVYXRJzyk2SZ7Bjpbps9QXjSjoQ0VopvSc4jbnBzL5QbOmu0seaTe6yMiaHV4dgw+Bkqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpMldLQ4Ee2vzP7DgX8JAoZwxC/Tx2RdGhYVk+bILbc=;
 b=M87tEPWBnY27rgK4zzkDM/qI/edyEc2yekuRq1GX2SnReHoS+v8Dt3D3OJjXuY+OkikgU41rNRpXggsTk/FQzT1ggt7+Y1bFz1FB7l3QQPv9rom4FWDqSQVlMZ7a7GblB9kuHI5t4q6DFNaa2nQurV+wPdKGT7ikKdNjvnDzZG/e1tkry5Ej9OmRYaNdqtVunU4fJLEEW59wlG8Z8lWN4+nAlL92rLw5NElPj4cgwR3Gw1z/8ymP6dHq1HXKAPNHpxu9ByYycPE4Ocl4Z2G2WjRPeYCXhJWa9AL/jaHYjUpsB7DiUEKDsXvKUmBjyNVI674gKe/p1gIfUOfw5G80Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpMldLQ4Ee2vzP7DgX8JAoZwxC/Tx2RdGhYVk+bILbc=;
 b=tG+Ics5IxuyPECPk7WfTWBOVXAe5pnNy/T5Os2bELrZDmSDzmEKsSMRBX52aPCPhGfLArMUzgIN4hJPOjMCxqeeCK7N6plbV7EucyOll37ZWYfj+3JpO0Wq+tgSq6gZFxPe5hl4U3VgAl9Z4uj6tPYLkHV/9qKM1MGML6cVQGyOi+VRIFrvdxu0wOsnYFoYKWprXMoW6TmT3L85DCX5jBw+pyZQhbo4sLRtffzroTqVhdClBdY7s6pGBuScfsBdV5k/UjGaK8Q8jC6Px/vXCbxSPY71Xv1NSh8zb1xcdDUzwfRm82Nmx29Z8nKOan/SPdAE1MKBuCENLrmIrDAu5Ow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9198.eurprd04.prod.outlook.com (2603:10a6:150:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 14:24:54 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 14:24:54 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 05 Oct 2026 22:21:29 +0800
Subject: [PATCH v2 8/9] gpio: mxc: introduce MXC_ICR macros and use
 field_prep/field_get
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-gpio-mxc-cleanup-v2-8-bdc3afbb35e2@nxp.com>
References: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com>
In-Reply-To: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com>
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
X-ClientProxiedBy: SG2PR02CA0123.apcprd02.prod.outlook.com
 (2603:1096:4:188::22) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 545f350b-5e8b-4dba-6d7d-08df22ec6cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oBqyGJDatKncAZyLamSn6uUCqiy7L3psqBv1XC8/WmRvhIpeGjPiAa6mXL4a3hA3dR0GpCUNG6LU9fICRFYpRKqUk2HXZ9OhGyyIcFbxWcSSQxBU+o5r1LHP0umzDBaAW8/ZE29yZxXgpxdb+N+NDIzLLS1+a9SoDSh6soAP7c6cckPuXUYonDgH98tdXmKrtAdq917/cX8mjhWmGZ13ejgPvhx2/CAvIlTsjVE0wAGP5YxxQQuEDNncs3OmsPLvMB/iDEKZxiIw83wRu+CW6jg3GTYVbAvnSalpB/3o3RujTznAdPTYEPKr1/yPdDXkrcFfHpJ/ORH/hIaX67QV8SNid9a8wfCs/TNfEB2ylIrTx8eueVJYAAaGm5M5XGGOwRKyyTfmrZk3WtyqS4BpAED6VlpZ4qV1MmJYn68/GcxsSKo828xrTFgyLMXTHeMk8blcjbkCb6joPzVGkJNevFm+agMFiiIgPMl+LhZAO2x80s9eknEUN2U0xdCZUBPUw7QV8Rs+7OV2l7HwAJOX9xDLAlg9mDeWcpF6fqS824xl410b3ZtOkdItdect7ReRyBu1u/ZcE+Hrro5kLlDP8W/JZ87QnmyfKS+16f9AQ9AGeJTmKylQoh88sTfTo7R8OsXx6uW1Ktal/kOdcquCHrj9mZfWNmc8eG7CP5OPqi0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWJZQ2lzZ0Jjdm4zZXpDdXZCVmMwQXpSUnk1d0RVR1pkTVlzUUtZMEp4UGNG?=
 =?utf-8?B?UmZSeGswTE9iOTdEallKKzlHdmNDSU9pR1RFZTIwYnZBZkovakZvZW1xT1JT?=
 =?utf-8?B?U0paanlJOFNkSXNXRm9aeFlKZ1hVbTduTzFMMS9LUHhCTGIrMTlqQ1lJOW84?=
 =?utf-8?B?czJSTGdBQVpTN0pRV1VYaUtaTnJQTjhocHBZYkVNdWFvQ0o0Ri84RHN1Kzlv?=
 =?utf-8?B?WmdSenlKOW44SmRZSndaSFdkNFB0WlpXT00xMEo3aEdWYTRyS1AzbmlPMTNu?=
 =?utf-8?B?RW9JTW5QakVXbGdaYm1LQWw0dHl0VGpmeXdIVDc1K05UNjBEY1NWWlJ0K2N2?=
 =?utf-8?B?TExoN1ZNS0NSTDFaemNxSWY0ZWszWUViUFlJaW9Ub2kwVmVZYmZ6blBZbVJq?=
 =?utf-8?B?b1Vrb2xMU1JPbjVscmhRa3VNZDlOb0VXLzFQWHkvWVN4SDNhTC9sVmhvclY5?=
 =?utf-8?B?MUUrN25yVXdCWlBDcHYxeFJFUmJyZGxDOXlNK1JFSk8rOFFQYXJLK2pNejFl?=
 =?utf-8?B?azh5ZUtUNzRsbkZVTUcxVlpuR25uUkU1NE50eG00dUpnY0doeHB1Y1hCcVBL?=
 =?utf-8?B?MUo2bmMwSWpvbk91WEFJVkxpNVkxUXMxQlhXQjd0L3BsbHhLT3BCSTV1UEV2?=
 =?utf-8?B?ck5HM25SdFQvMitKZktZQjkrV01jNXJWcXd5cnoxWFNQNHdudndUYkdNeXNN?=
 =?utf-8?B?eGRYT2ZoNXBkMkhJcnVwdXYwMEhldFNjOWFNQ3kwam9iTElNeUx1WjBaYlhx?=
 =?utf-8?B?QlY1Nk5wRVRxTGFUM09jZllTVWdFbWdVZ1hFUGhmTU5NQ0Y4UDA4cGdEcXFv?=
 =?utf-8?B?MFVLdHcvdzhoRFdPY0V4L29CZUg0Z0dSM1VON0s0MWNCYnpiRGtsT25MNjVX?=
 =?utf-8?B?aTkzUWUvU2VhRXZzSlN0QjJPSVg0anN4b09pRURyRE55M2RVT3RzNmo5MzZi?=
 =?utf-8?B?QkFsWWFLREVKUFRvTndqRk9ERVlsek81ZStQaStwQStXT0QxWHpuL2JTZ3hO?=
 =?utf-8?B?dmhEbEZSWWI1d25ITzdJcFZTRGIwZExWbWRiYTkxa1dpaDhJQWRJRnJKVmRB?=
 =?utf-8?B?b1MzTTlweFVJREZjeUo0R2R2WklrbkRwb3lWa09ldEtQbmJxSjFBTzNoUHhy?=
 =?utf-8?B?bnRJRlNQdWxrRysveDd2WHY5SmFIMStFV0VzZTlwSCt2aFFwaGY4TUVmNHVw?=
 =?utf-8?B?Tk1maWVsejFQUTBJckQwdWRvck0vc0wwTyt3c3E1bjdGSnRQcFFUOFN6dWZQ?=
 =?utf-8?B?aVVLZlpCZEFGdCtPcGhjcmNZenpzbG9qemkrWE92M2JLZVdXbHY1cmw4aUlk?=
 =?utf-8?B?UURoRzJuaVVzOWdnS1R1Nk56eEM3Qms1SGR1NWk2S01peGZ2d1RoMGpZdDdR?=
 =?utf-8?B?UW9VU1RwTTZ2SDdwOFE2WE5YZUt3dXdFazM1ZDBKZnZFNXJmakdlb1pnaUhI?=
 =?utf-8?B?TjZZZ3I1cEU0cWF4Z2xwa3kzdXJhUVJFbzNsb25DTGZORHI4UE51Q3BXTi9a?=
 =?utf-8?B?VXRYQU9pSTVqSHpMZnVPZjBtVGcyL1c5SnJzWEZ5Y3NwbVVBRzFQMGw5anpM?=
 =?utf-8?B?aHRhUFgrKy83cmZyZHdIQW5uNUtHUS9Ca0cvRkFaeWFSVC9PMldGKzUyVEl6?=
 =?utf-8?B?cHl5ZGtsWVdyTDlxK2plWXppeXE1bUtaMXZyWFA4Y1lSVUR3aGFKek45MVlL?=
 =?utf-8?B?eUJ6ajFZem44YmwwS3JxUzdKdFhOVGZhNm9vcWY5SldLdWdtclUvMmJZV3lq?=
 =?utf-8?B?TmZzczNTR3ZUMFBoSVFqaHVYMkxzMjJwcTBwdjBRVjdScklpYTJpeVJBMTMv?=
 =?utf-8?B?MlQvQ0hGTUliRjhoMjdWSjJ2THZKdkJPOFBhb1FpZHRhZTVuYi85NzJkN2t2?=
 =?utf-8?B?bm90WXI4UjNSRkZwbFpib0RNT3VRRWpxTTc4LzQxLzl5QVlGQjJuaEMxOHBq?=
 =?utf-8?B?eFpLSkVNZVJhNTJSTER4aWtRSXpqazNrbWlsaTF3azhvclpIa0V4SXJsZ1dh?=
 =?utf-8?B?QUN0ME1xa3B1UUtwbEtNU3JyVWc4RS81S2xiYitZN0VKM3g2KzEyZUVKOU1q?=
 =?utf-8?B?Qk5vVXpOalNFYmdyUTA5bitLUnBiVHdLczd6YUZ4eTEzaEEzS25JSC9UWHk2?=
 =?utf-8?B?Y1dQRXFTVmI4SUZab084UER5bXNxVU8yQjg2eEZsMzlmb2JxbG5zNVk3cGNT?=
 =?utf-8?B?dmpHb2hYZzlraDZUOUova254bFNLQmpRamNBTjg3MGdKS3RTSm5EY3IrTDhK?=
 =?utf-8?B?OGtmNnNHVmlmWjlrTnllY3U5bko0NHhVdDYzZ3FIZEdiRkFQTXk1dUk2U2hv?=
 =?utf-8?B?T0lka3B6d3JzMXFTeStVSUxPOWVMcitleEhNVHByeVFoYmNQUE1SNzVJbWtL?=
 =?utf-8?Q?a2f5O6Vr5PDCICbOuuxMxdAy0mQkknr6AkWlr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 545f350b-5e8b-4dba-6d7d-08df22ec6cae
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 14:24:54.3752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ya73cM7IwBYFy7yiHcL9X+j5ERJV6JJwFU+p8MT8h41rajxlPL5a/N0tFXaZQRCK5Tl6uYCEe7wvyA9nLrPXochm9C3KO/2lpHzqdzrA08secS9nrgBNy14DUGMXyWev
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9198

From: Peng Fan <peng.fan@nxp.com>

Both gpio_set_irq_type() and mxc_flip_edge() open-code the same ICR
register selection and 2-bit field shift/mask arithmetic with magic
numbers (0x10, 0xf, 0x3).

Introduce two macros:
  - MXC_ICR_REG(gpio):  selects ICR1 (pins 0-15) or ICR2 (pins 16-31)
  - MXC_ICR_MASK(gpio): 2-bit mask at the correct position

Use 0x3U in MXC_ICR_MASK() to avoid implementation-defined behavior
when shifting by 30 bits (pin 15 or 31).

Use field_prep() and field_get() from linux/bitfield.h for the
shift/extract operations instead of open-coded shifts. The lowercase
variants accept runtime-computed masks.

This eliminates the intermediate 'bit' variable from both functions and
makes the register access pattern self-documenting.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index d762d03c8d6a..c267727061fc 100644
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
@@ -200,7 +204,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
-	u32 bit, val;
+	u32 val;
 	u32 gpio_idx = d->hwirq;
 	int edge;
 	void __iomem *reg = port->base;
@@ -250,10 +254,9 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		}
 
 		if (edge != GPIO_INT_BOTH_EDGES) {
-			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
-			bit = gpio_idx & 0xf;
-			val = readl(reg) & ~(0x3 << (bit << 1));
-			writel(val | (edge << (bit << 1)), reg);
+			reg += MXC_ICR_REG(gpio_idx);
+			val = readl(reg) & ~MXC_ICR_MASK(gpio_idx);
+			writel(val | field_prep(MXC_ICR_MASK(gpio_idx), edge), reg);
 		}
 
 		writel(1 << gpio_idx, port->base + GPIO_ISR);
@@ -266,16 +269,15 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 {
 	void __iomem *reg = port->base;
-	u32 bit, val;
+	u32 val;
 	int edge;
 
 	guard(gpio_generic_lock_irqsave)(&port->gen_gc);
 
-	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
-	bit = gpio & 0xf;
+	reg += MXC_ICR_REG(gpio);
 	val = readl(reg);
-	edge = (val >> (bit << 1)) & 3;
-	val &= ~(0x3 << (bit << 1));
+	edge = field_get(MXC_ICR_MASK(gpio), val);
+	val &= ~MXC_ICR_MASK(gpio);
 	if (edge == GPIO_INT_HIGH_LEV) {
 		edge = GPIO_INT_LOW_LEV;
 		pr_debug("mxc: switch GPIO %d to low trigger\n", gpio);
@@ -287,7 +289,7 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 		       gpio, edge);
 		return;
 	}
-	writel(val | (edge << (bit << 1)), reg);
+	writel(val | field_prep(MXC_ICR_MASK(gpio), edge), reg);
 }
 
 /* handle 32 interrupts in one status register */

-- 
2.51.0

