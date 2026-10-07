Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5AF493621;
	Wed,  7 Oct 2026 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370243; cv=fail; b=KgpNPmMeOeSsJQQASCvknH6gti0fZWycRfy9TI+hdN0sf/wiQwyNMm6JsZHgD4FxmdLb2vhHoNBgzhA4bqli1v/Sx29GAuJNHaNcVzcdAl5w4gN5Jr4RjOPkIT4lzlh5S/+43Ghk8diWfRqtH7rEwZPTh9Moj69xO4FT4QVCigE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370243; c=relaxed/simple;
	bh=PRWJ2ki4K9kRvAxxoUA5nwxi54ZzS4ETypemTkZSrE4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hJr+E3vfpMiuBND41aFQqF3eZ8IugCvhoIj0xSQR85uz8UCCIStLfwZZuqHGNarEOXr0v55zIXqnYHk9etXtGXY7IMJyNyL1GVago90OuPlJz3D7LvH8QXnSIGjEqxNaWE8Lf+cla/ttyNMOspfXlpsrATaiJegst0Y678OgcV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hnliw9Xd; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hnliw9Xd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OyNdp1QF42plXe7/F3rL/HEYfo02SyyZ0dp0L1mpyvbhYDGxk5FskPXTPPjzu7QPwfFni5AKP+rkWONPY3tGodulDoTTfAbKBa9dCi2TSGMDTiDsY3lqZorZ2fZyNSjy/ogb5FNEgTFWtMGfCaGh5GyJufmhaBzGCYlt1pO5j6eVi96lYxpD7Fz7GqanzI8753w/KKfFYOqsWdas96M0SQTFIZ0wpN2H/XH4Sb8pp5QsmIlYve1Z4QetmYj3n3DVQS1SJds4PX/Pve2Mj7Qv8H+855wjbWIlrIHm4qZFItZNYX+prpvzC3kS8UDuXhq0u4lhnQrfGNB6aZVuEKczGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJyMx7alhHQas0qR2FUpt6mXFl2mH2bCYTtwr4BnL0k=;
 b=GmPzexm+8DZFnngaUyHa1MZzZeqwNIRSbfVyokOShWW5GYTCYL7qGklEne6d6s3AWXkWrsUYpskgmA2/wfdQqRm+ykIIevRgwubpM/aO8dv8UsLpuyMEzHcSsh+olf+XbUb2C2evoN/S8+oiKPyt7KWyPYb3PuVMinmeXENOe4cgmzBNoKPB1AWzs2mAfNQ2UHSVIWlcvGZuezkF6vpuzlgoMjytTwNJAIBhhUYNYYeg2QlMDMxivHJIQUIZxvqBAFAhuVgDVRRz6iESVPVe2xqm2TeATws7WbTxj9q4cgrn3F0hWXdkxbrjoBiGeCSduAzFRsEBJ92C4xbe/Ns5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJyMx7alhHQas0qR2FUpt6mXFl2mH2bCYTtwr4BnL0k=;
 b=hnliw9XdThw7EqDUmgVXZVYy0keuvo3BsvP2b5FQDh+IAOF++J8uJYVgXfIfSKECcmIhP2ijz3yPxNl8iRlcPX0CsLL5XadJ5TM4n4j+PoSyI7eDCwgil+38uarakaWxjR+vlPVPy/jSQkrByFpsGkhdjLP+x4iR2XP152KComvr0ROY4GUVRGLoCy2ovHrQwxSWvsyQIWhJBimV2p7KDPJF2aFiTg55X7xO2uLOK86xwTG69IfZljXX6BxU/GrOoo0c7VkkUrMm/8Uu+haG3iImK82N/aHqoMh0wn8fjSpvFMMJlMGveGn9Zq0R1Pi1tCyqGAKQuNwlcrwGAfGpGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11738.eurprd04.prod.outlook.com (2603:10a6:150:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 10:48:01 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 10:48:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 18:44:24 +0800
Subject: [PATCH v4 09/10] gpio: mxc: introduce MXC_ICR macros and use
 field_prep/field_get
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-gpio-mxc-cleanup-v4-9-c9f5a8b50df9@nxp.com>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
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
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11738:EE_
X-MS-Office365-Filtering-Correlation-Id: ab24f4e4-4d43-468c-b77a-08df246074f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|19092799006|366016|11063799006|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lviSIEjvrfF8/VLHLcJZAzByYoyNCMNeniKtElH2f+PuivRi+abaWI0e2BavgJeP/4dI6r0rgiNdYb+2nQzDnLeKMxRczl0s6H050BmkSTj5s2LxvjD2+kDfHsBGFDZxXAjXUuXZH/LB9lhWPUrSiDpaixIol82jD7eKZgaxZEBfVcvgD0jfSA1/Tk9Izy6iZLXbMsoB/vbjPVxpdGWSB8tnoi2ia2zS3yWXvuxkGnnz7IWW/Zc+aANYFB52v9TGqCY62F5za5/QZQ4x7tPAS8d+saj5wtpsL+Gg5/t8gpHI+5ZaC7mDfGyT+p1xrl8w45Hw2fJQdkMGImI12gb4DAnqukq8B3CS1c5d0yOxjQwW2V3dC6DXUVDk0814/NVeg1Ts2hCqDf3jwCaEIGcLNGHYX38RmMil1BWtHguD1xY7sSE8xnAXqmrsDphZ32++1JaKWG+pRjMV595X673d8KnoO2l2Y1P6Fp/BqXzMrPbZfqLH1DEHqQgMZvSxpnf917Yw9uwVpNmy2JfLclgboEqi8zpHAokEPEvZMfZPTplzuq7slIZvKqT4qSoyBkQaUw92H75/kBbfpMBFwZgdWkQRDxyV7DSjxdEfhIaEWrTatjTCJi8ygtJpvUI9XNOVD9EWfHPcGuwVAP4zA7TfEtx2vuMQ1NxrWJLT6OMM4L4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(19092799006)(366016)(11063799006)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm4wY0ozSTZtVE9yTVIzaVgwalVhblQyWE92RDRQSk5QOUx3M2ptc1ZNQW56?=
 =?utf-8?B?cThjSEVvNXNpOXRlQUtOeDFNbURrdEo2YnhGVG5VOUtDNVJOWlFHdSsrV1Nh?=
 =?utf-8?B?TUtkZFRRZmNnR1N3cVVOU3JRY1V0OC9tOWhFekNqWW0wdkVmOHNGSWMvZTVV?=
 =?utf-8?B?NWw5b1lGTWJDZFNUdjVONVNUWTJld01oQTZMSVZiQ2J6cVhaaU9MSWRJbnVN?=
 =?utf-8?B?c25BRlZYMzVCUXRnZGtXd0ZNY0lHekxiTEpKZHkrYnkxam5QM1poZ2xPU0U1?=
 =?utf-8?B?a0pscWlYZytoWWwzWXlDU3JaRzQwWm15ZEcwelFMLzBFdlVNM3NpT0FkczJk?=
 =?utf-8?B?aC9HSGlJZEtVREwyUU41c3czaTVQek4yV3dsSHBCZFBDaXI5MGRiVTVPV2NI?=
 =?utf-8?B?RHBDWHZjWmEzMjhiMGlTWmR0MHJkNXlEMzFyTXR6dkdUSXhuQ2RHRVorRnJ1?=
 =?utf-8?B?RlNsQ3pwc2dxT1FwZkdJdVhFMUtaaklSbFBlTVUxUXdOd3h5SUNkZStqTFRn?=
 =?utf-8?B?bUtzR0dlMVp1Z2FLQk55NmNrK3ZLbmFuVHRtdXZPMVQ4YUhsaGQzTlorUkdZ?=
 =?utf-8?B?ODlTT05lUFUyNXpmaUt5MDRGZnRCN3pQTVVvRWZFb2VwenJTQmxHOEpyY3pE?=
 =?utf-8?B?OXFDVzl5V0NHS2dJZGljREhDTy85U2xvZ1hTQ25xUjRrSkR1N2RmVjFtNnZa?=
 =?utf-8?B?MXlFNjBGbWMvVVFIYVBiRVgyY0NvSUhQMnBGU2FteHd6ajRDVXoxY295RVlr?=
 =?utf-8?B?a1BDcThZZUZKSkpZOTkrMjdQNHI1VlhyODc3NWVFRXh4ZTJQUTZZN2lRN2xn?=
 =?utf-8?B?RDhSN25KODQ1ZGFCUzVXeVBtVkJHOTlXSHhNcG9XbkJGL1lDem1yUzhJemRo?=
 =?utf-8?B?WS94Wm1yMVc1T0VtMzB3UWhmZEMwRXhJdnVseDdFRmtmbTFRMEw1eVF3eVd0?=
 =?utf-8?B?ZkZjWi8zR3YyT1hXK2d1c0taTDdHZzYxMHIvMlJEUkRjTWMrbE1GcnRIQzlm?=
 =?utf-8?B?Sk9nRVlCYitGZlhQNGNVdnRrYjFqa1VaYTVBZHZwWllIMkhxaW14VVVtRmIz?=
 =?utf-8?B?bXh4SVlJalhJWWdORVgyeW1sMDlWK2MzTTVXTmxSNVNzU1VESXA1alN2cGhD?=
 =?utf-8?B?N09WWFFPWFhNTGxkQS9sbkZOQ1dZMGxZY3lFTGVGZU9BRWgwVlFna0p2R1FR?=
 =?utf-8?B?K1JjV09sN25jYXBSVjdLbjhTZ09ieGJScWEyUjZMbEJJOWRuMFhWYkRqZHdZ?=
 =?utf-8?B?b1hjWnhaTURKZyt3Y0hYbTRJOEVEMzNZZDVSY1F3bnBFQnl5NGZjZVB3Nm9I?=
 =?utf-8?B?U3psKzFuTzY2NXdJT21seDkxT09EV3N4WmpTRkhibnJXaUxCNGs0YzRoaDRo?=
 =?utf-8?B?OGcydDdWOWh0TTdyWEU2dUp2VWlITkRTK1VVdUttTkZKSUMxSmRGT0VicFdh?=
 =?utf-8?B?azZaSStJTmswcjAvN0JlOTE2MnBzY0dYaXNrNjM2bzYrbjBSSC9MU1plYTNV?=
 =?utf-8?B?dCtFeGxFRlZVRnczNHp2d1kzdUxFZkxheWtpVlhiRW4wRkpUVzFrSGpVTVRz?=
 =?utf-8?B?NXFYN1VqdUM2bkkxdG4xRmRiU2hWdFdMblE2YjlCWTFmbHFLRlpKYVd1VUdZ?=
 =?utf-8?B?QjgxTy9hWVlaNUozVnVLcG5hSDV0OW5ib09raXRzeWpGVnpLZ3AvT0h5NFhs?=
 =?utf-8?B?bFR1akhqQnIzblNGUXkzMlhsbEttQXZwUlRFczZzcThsYVN1WGE1QldOMEVK?=
 =?utf-8?B?VUlqTkFMY3Frb2UzVFZPOGpzcDl6TGpGMEx1c3lRV1lBVW9MMW13UDVreE1B?=
 =?utf-8?B?WG92NGNDYXEzU3I4UDRGSytLZjZGUHdjK0hiSXZ3NW50ZlFHRGt5RmRzU0xV?=
 =?utf-8?B?RlJ1NFJlRGRXZWw5bGhwalRIdE5xZjJieE1SNGhFZWEySVRKaDBKZGZGcDFC?=
 =?utf-8?B?VGFFTlgwQ1VDNnU0RVZVSmV0VDJJeTJmSFczSkFjNTJjUTBqQ1NnU2NSTGxH?=
 =?utf-8?B?NENwcHpsM1dISSt1eWtFTEJJNGcrdlRoRVZRMzlOR1B4QWw1RjJjTG96bFJw?=
 =?utf-8?B?T0twU1hzNXBSVENEY2VwSmp2WG9iV2t4TlZqaHFZa2lOZFhkNkdERC9XZGM2?=
 =?utf-8?B?a3BCaWJjYTY1M0RncWl0N3NHbFNpRjlhY2h2R2JHWTdrOWczaGU5RVpZNkRY?=
 =?utf-8?B?RW9ZSXlrbnZhdW9MN3lmQWVLbEU3NXRBZnNUR0wzR2pnWTZXZWJCeW94Wi80?=
 =?utf-8?B?dGtHdVNkZDAzU3ZXdlZvMFpvTExIb3AxclRkTU1zMFlVenBzMCs3NFVCSzVs?=
 =?utf-8?B?OXFEZVVZZXV6ZUpXZmJkbkx6SHRwbGE0d09UeS9kT2VlUG0ydHBvWWJhd2c0?=
 =?utf-8?Q?Xn2W1JKkaWRj4l2ge6VPjBMTPr8UfqwIZKZjb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab24f4e4-4d43-468c-b77a-08df246074f1
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:48:01.0096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KKQ6xhH4jvjI8DDrG/BMQvR95qP8ZLHlX1LKPETkHaheEyB555VrhUd2Kf6z7tHERSRuGP+CZFPasJ3JoZYPMoW8N1zS8NT5piRocL1HPWLASewODuTbiYGUg8hGwYI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11738

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
index 9d69524e06db..39de616cd434 100644
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

