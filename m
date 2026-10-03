Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011053.outbound.protection.outlook.com [52.101.70.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D4C3803D1;
	Sat,  3 Oct 2026 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029423; cv=fail; b=EPy0rgdmWKAJMx9GN5bA4zSUZUtGuur/VW883JiixqIB57ARVjmHC3OwGetHkOVzkSxSwGcWX2o5mmw4A/yuvpo767KpIuHFJQw3LvA/voqtcGbCGH2l59/ZXW3TuTh+NJdDko21mOWhRo2VFjMcBa9xmudDH2pipccZLsVcjo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029423; c=relaxed/simple;
	bh=owwF17tmPHaCMKzMYnb4p/kZcg3Fq0RxoPHyOu2cB98=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LLZ+cmbebbxIkR3Y2h79ktpP4D0l+YS85tGv1iMXubpPO6Pj17DLcVx6aHvsYTU+ra6gKA3ilpD3ubRQCNShfqUuREmEL41NmaXFyBEL764T8bvaV7UqgEOdMnfM3IYYxknFSX8rwDYZKO6SZIko9f23RNh1pqM0DkIEHQPUoAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kOR1yukV; arc=fail smtp.client-ip=52.101.70.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kOR1yukV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxxzT7smRp+s3miSs8bGmVm3rb8Z1zHI50w440T7VxD9mXy84nuVSm3R1Fj4Kzlh8pkvH/Tf6tCGBak5q0rsh1IAid+FEDStFNjqETqRWScTxcVyv618NmOxwxIM2cuFj9HCqZazkb1KiGcsun2fQUVTuVkjOejUAY436nOwyoXX9nTd0n3mbn54aYhE1sKL6TtdKiNqrilEOClTd1nSSFaUK0WD2kmkoLtqduC5HfCUJDYeSkz85RCFtZdQeAhfjubal8fqiEc1+XC7rknsZ/6nrEhycjcg/RY/BToV4RlB1uRNwoKe3+bsFtmF94kWUlLXRQ/fSOBTWz0OXwp0Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOxYYEOdp+j+rn9+bYOMbxlofd7+L0kc+Y9C3coO7oM=;
 b=bqF8PI4mEX2sLH5Nezo6kwDdoYSmlvLnunuekpsdEvBTIzg6jeYD/21PkMVjMk1k0dOX0a8V2NImhIsVpCSZ3kQ5H+IiacIoK9Y3wNrXXA6RHFKzIjtjEzZjKxQp4BUzJDg8uhUy4NA53Y1EGNWLgpg2RE79y/GAH+/y2W+yp2+8FQClWy3bPlfJ0Q4RS7gjMRBiW+vLrAZqh7HAsarlXJAmMSLw7WxojLPcYHQZjn12bsRLlaQ5wJH5wGGqsyLnxXnPZeehkrQ/UL4lQqekq1LBY+B92NtxWUjRjP2vp/eFhlZPo0qHmJj2HhJKfmwv8Gs55+PX+XUumpAuMVOryQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOxYYEOdp+j+rn9+bYOMbxlofd7+L0kc+Y9C3coO7oM=;
 b=kOR1yukV0oJKmHI2bwD4hYmCohH1v4bwGBb5OYqiA+R14mAfu9ugRPnl53qq8jM2tbwe9s9zSGM/HRB4ADaMjUWHklxuX3Pl6Qte9V7qMCehR6McnlcOhopu+cMwXpKlp2Dq5lKmGWeoof7hx5xvNAUoeY57qcBUwfgSq8nZuA/vYMonPcVD/G3oLIA0ZRyV8fkK6LebWxxcgoWpKcMmjzH5JUXMQRSbi2gph96ySmA8zvb9tIcaBSVytkEuuHD54Kgx3MaR4Cj3AkW7vC5mpSfEVfAVzU6j1N/tj0wBlSoKGzPpOEZRQ4nAVTs35BjkS9McNJbmKyahrYx1wH8YJQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9467.eurprd04.prod.outlook.com (2603:10a6:10:35b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 12:10:18 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Sat, 3 Oct 2026
 12:10:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 03 Oct 2026 20:06:49 +0800
Subject: [PATCH 7/9] gpio: mxc: introduce MXC_ICR macros and use
 field_prep/field_get
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-gpio-mxc-cleanup-v1-7-dad728ce27f2@nxp.com>
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
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
X-ClientProxiedBy: MA5P287CA0331.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b3702b0-96c2-46ab-0548-08df21474a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|6133799003|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	zjLYMFT72bD69wDUl+I0L3EpHANL0k7H2JdOLo6JGWhLT+0GLpWYLGy2Bro5yx42BTv/pPJb6E54/N2Inqx2t74Z+1jc0zmQSOMedTHlUe1ZWA3TTjI2AZH5iWz3OBwDr70645dQ9pEuFsiyw0Gv3mVxu40TGCKupqX5NIeRx3luCEGMvnxgQLkHW8D5PkZMMvRjeqib5fv3pqzpHMTu2OVLkrHjYcRA+D8+S+B/tXYUReouWMnxpJK76+ZKQfH+ScfPcVmUD8EU/1UW3G1lSnVm3AmW+/wXhdwIeoLhrr6vyN5BCQBv8JGG3mEl+VEW7g7FMDbySuzPxLB27paIjlA+OSN8bJadAoWHODk+Nun3x0XRJXywMAJ2WVbxQ9ZgYkc8OfMm+ymY8Ar6emu4bc1QQtC8TzFGy+1WtEtHDeJidJWfgPeBC9r8M9X6YMfwWyeQEzN8i9y1i/OM7eflb5KGiVRPTrjAHzhr86UaIJ+DScaCLg9xhytNl8oTsQtV8CgjixjX0cU7oG7LkkAnTPN4trhf6XIx8weYTQeudz1R37aeL+2EpzeSftVTk5UXKkrJGS/sv74wNkaxoETvGKOmmn+F9xqsNN33FMCdWftpwyvRDOPgkuAFEdfjtrwfYTkW9wE8SylbDsfdubJOxQ2bW0gOTucaCBODLEu4qLE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0ZTck1hbTg4R2UzS1F1VlhwT1pleEptSmVxOTZBcWFiaXdsaDc1K1Q1WEQw?=
 =?utf-8?B?bE5tai95Q3V3bFlpRENIWVA4ZE9MNmZEdnpEV0IxSGpUdzM5RU04TlplWW1J?=
 =?utf-8?B?anVxMWp5YlIzV1JhM1VZY3FCaXBhNFlLanJDMHRxaGpLNWl4bEUxMkdON3Vk?=
 =?utf-8?B?WlJ6QURod1A5b1ppRXZXNFE1a3FVY0l4T2hiaHNreXNMK3RtZk5pT3FYWEtu?=
 =?utf-8?B?bjVEaDVSNlJ3N2NuWURlcGdvZ2hwSWthL2NkdStlQkNoN2lnc1V5L0dYMENh?=
 =?utf-8?B?S203cVBrRVRPU1hKK0tPaGRuWFgvczFTTi9sUFNINHhwVGZ5WFBaY2IvRXFC?=
 =?utf-8?B?V3p6VmRHd01kU3V5a3JMYnVvZ29DNTcxRDMzTnRzUDFoM3NLQjFwY1ZmbzBR?=
 =?utf-8?B?MHdDbFdpWHhRZnd0alo1V3NGZHRyc2JMNEFvQ3RQT0tzcmE0WFdGdGZJMExp?=
 =?utf-8?B?b0VoN1I2K3VQSys4alNCcU9mWmNjYXBMdFY0TEF5Sm9wMElyME5yYXUxd0hp?=
 =?utf-8?B?U3lINjhodEE4Q0pLS1dVOGpmUW8rVmtYWTFtLzJIeHV1aVYzL0oyRWV1VW5v?=
 =?utf-8?B?MVZPeDRYYXVWYkh1VnprMTVFeWxkZVZFWWU1YUdEdUN6UHZFcHdMenZydWYy?=
 =?utf-8?B?eGlHNlN3TTRvbXFuWEV4blkxRTRYWXBkaHptMWNhdVpSYXVWS1o3c2hKTmF3?=
 =?utf-8?B?YVc3OEFMK2NpRXhNcFpiOGdkSWF5a1NWN2tUbnhqbFYvbkVhVWFJam5yUFlO?=
 =?utf-8?B?NDNNOUJLejhuVVhrdW9ZTUdhMDZDdVUrY3haQ2N5ckJUMHpqaitHOVpRYzRt?=
 =?utf-8?B?MndDd1hXbU9lL1NnREtYOEdlVENkbHpTR2psamR6Q3BLQXBTVjM2ZHZOVGpE?=
 =?utf-8?B?WHpJZjRMbTNJSzk5QzBtWG1HR2p3S0hlMGM2OXZaaHRJdmEyeEdFZm45NW5y?=
 =?utf-8?B?Z3J0eTYzYnR0OFlkVWhkWTlGMkdrVXh2dUtTTnZXaU5JM0ZyUWVIVVhWNHox?=
 =?utf-8?B?RnU5OXVaLzVtM2tXdHJFYktvQkhKTERwamFDSk9oQ09MSktXdkNTN0ZQSGtI?=
 =?utf-8?B?cW1CcnByd3VRQndMYVlFenhzZHZSTDFGRWFuaEF4aXA2TFlhWmt3WGxKcDI5?=
 =?utf-8?B?VVg0QzFhc21wdy8rOTAzbER5dUExdVpoVGhnQW1ZanVwQTJLenUrZEVuV1dL?=
 =?utf-8?B?ZUdFNDk3eDZIRDdwTnFNaEpsbk04Z1hJcUp1ZTdxZFEzNWxCTzZyY3BPTXBF?=
 =?utf-8?B?OUtzdVBEUXZNdGhjblF6VDBKQStvL2RtUGtSYmROU0hqV3AwMytXMzZKTzhi?=
 =?utf-8?B?QXVnZko5ZzNkbDdYQmVvOXh6Q0hiemJpS05HbjZCOVg2eHlYTTY4QkIxUVVD?=
 =?utf-8?B?eS95WnhzM2t0YWt2b1J3ZWtjVE10SHc5cmtiQ1R0OC9qTmlHakZ1L0VBOU5O?=
 =?utf-8?B?NzFQMFU5Zkd5c3p5TkxDN1R0U1RKR2NGaEJIZE9GRS9VN1g1aDFVcnZoakFQ?=
 =?utf-8?B?V0creXNYeVluZ1lrQ1FqcVFCUUFEUGdUVktHVExkV21SMkRLbFZhbjlLZ2FF?=
 =?utf-8?B?Z2IrOHVrR1JYcWVIV2lMbGQ4bnY0K1Arc0tVN245aUNyME9RVHIvLzI4bWlG?=
 =?utf-8?B?V1UvOGh1aTVTVGhMODJhUTJDclBLbFhaNm5iWFBqdmdLeXB2U2ZpSERPdzln?=
 =?utf-8?B?YnRFdkd5eElJQjJMUVoyYTBZNE0yQTZ0eTJFN2dxQkZvU01pbXlBT2xLQ2dm?=
 =?utf-8?B?SFNwSjdlNXdLS004Qnp5WTFjdXJGNEJnRDZ3Y0xLYUpNcmF2ZzFzMWhoVlZi?=
 =?utf-8?B?NFVBRnYzL3QwUXNNbFRFZ2Y0K0tXa25CSTZpSFBlcnM0azhFdkNraVdMNUEr?=
 =?utf-8?B?UlFnOGljMm81dTBrVDJPVnZkVnhTcjI5NXNidVo3L1VrSnRieWhRZWw1aURv?=
 =?utf-8?B?RW44RkpiK1pIWXpmZTNqUHJGMFdGSG1nNmVnMEF0NDBaRzJlMTVnOG5LZEpz?=
 =?utf-8?B?dGRKenJrTUxiUG1uVmZpcUYrQTZEckhVQkdZek4zbmQ2YnplbFBMbWc3anZt?=
 =?utf-8?B?TnFsRTJXZDFGbUJIanFBZzg0d2xubmhlWEJ3bEpMc25YMVFzdGg1TXV5LzFt?=
 =?utf-8?B?TjBoeEpvMGJHYmVlRTN5RHcvWGNHeVRNWUljS1lWVUtMVVMyV1pVN1Q1V1ZY?=
 =?utf-8?B?c3oyczR0c2J6MG0wQVFsTjlocmtlSjI5L2lqRGp2YVByUkllajBGRldMdGE4?=
 =?utf-8?B?QjIrSERON1F4clY5eVd0UVRpcmVid2phcFQvVVYyVGdheUJTbHFtUGpndFFx?=
 =?utf-8?B?dXVsMFFXamtzYVhLM0d4U2RDYVI0NmtuMHEzbVNmZi9LUlJUMXFPWlFUWS9R?=
 =?utf-8?Q?1LFZJXtf2s57MFCEQJFfe2n2LgVWQBsxb3UWR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3702b0-96c2-46ab-0548-08df21474a41
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 12:10:18.4543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TL0ryr2WXs0kAF7htlyiVMIZEGGV11OjUIDOdmYU5kUeog9X6mKSS/ekViItzN8p8UYItQfGtZOWlQjkRnc/sHRXqmML5j1Fh9TNA8CgbLy4u7xW1FJxgQeeJcCkB6Lc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9467

From: Peng Fan <peng.fan@nxp.com>

Both gpio_set_irq_type() and mxc_flip_edge() open-code the same ICR
register selection and 2-bit field shift/mask arithmetic with magic
numbers (0x10, 0xf, 0x3).

Introduce two macros:
  - MXC_ICR_REG(gpio):  selects ICR1 (pins 0-15) or ICR2 (pins 16-31)
  - MXC_ICR_MASK(gpio): 2-bit mask at the correct position

Use field_prep() and field_get() from linux/bitfield.h for the
shift/extract operations instead of open-coded shifts. The lowercase
variants accept runtime-computed masks.

Eliminate the intermediate 'bit' variable from both functions and
makes the register access pattern self-documenting.

No functional change.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index a3274be7126a..18ff33a0abfb 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -7,6 +7,7 @@
 // Authors: Daniel Mack, Juergen Beisert.
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
+#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
@@ -139,6 +140,9 @@ static struct mxc_gpio_hwdata imx35_gpio_hwdata = {
 #define GPIO_INT_FALL_EDGE	(port->hwdata->fall_edge)
 #define GPIO_INT_BOTH_EDGES	0x4
 
+#define MXC_ICR_REG(gpio)	(GPIO_ICR1 + (((gpio) & 0x10) >> 2))
+#define MXC_ICR_MASK(gpio)	(0x3 << (((gpio) & 0xf) << 1))
+
 static const struct of_device_id mxc_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx1-gpio", .data =  &imx1_imx21_gpio_hwdata },
 	{ .compatible = "fsl,imx21-gpio", .data = &imx1_imx21_gpio_hwdata },
@@ -165,7 +169,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
-	u32 bit, val;
+	u32 val;
 	u32 gpio_idx = d->hwirq;
 	int edge;
 	void __iomem *reg = port->base;
@@ -215,10 +219,9 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
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
@@ -231,16 +234,15 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
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
@@ -252,7 +254,7 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 		       gpio, edge);
 		return;
 	}
-	writel(val | (edge << (bit << 1)), reg);
+	writel(val | field_prep(MXC_ICR_MASK(gpio), edge), reg);
 }
 
 /* handle 32 interrupts in one status register */

-- 
2.51.0

