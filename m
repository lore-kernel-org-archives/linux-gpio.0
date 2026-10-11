Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B80437F319;
	Sun, 11 Oct 2026 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719716; cv=fail; b=rsYQDJckCoSUk0lNSauZIN1e8ZUzlDJDOEdNY73EnKgnJltMHzbD3VeaBVY9HYDKxZpDFNevgzU+1iPlMfXfFbIHa0rrRvOibT5IIkzCkYo/EXB3t0TYlSkh2M+Y4u6127z+87Qpcm/yeE4qWts+Id/IRCsR7/0rLspVbZUTi1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719716; c=relaxed/simple;
	bh=ddaKNeT7JDR4IdpqlGFGmawkfyJgTRZodd1HEG8bAlk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FS3Jf1xVcdt9gAq1yKk6ZH0cbyBx+q6m+q5+8lVHiYKK74hG+dDrv5P+TMlfQIyW6noBgCJJMz298/tTEJkuRuiNjrPiPGMVdEOXjz1CB9DbE1lXncnJXOfKtaiD+Vb8N77thA0NNI5xbEUEBPWFmIhN6KfmfvF0iunXHMZBLCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=i6GGTx5V; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i6GGTx5V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1sI3EGsXcS6d52hUQSfIXF7yPPjIcwqp4PcV/I51PaiSfCPVAcrUhHlkUGvVsQZfv9De96UlPnn4IlOp2cj2CmYU587aBkhGOTjh3w4Ru9wprjiljtR1jjnEUeSaxYcRhuSb+Ca/RyEGuOo0nhnpmTGnO2l9p+OYtgEh9NOvliYEYdpsZ6IYM/VmrTpSLPg2etUKM/Nojss00VPr+iEHLi4Sak3kqp3UPVLzzFJywpstCN/pSYoD/qfZSv04kXaZLUj1s5Ix4xUlUTFJ7LShYjS13vmKpEzhx3agF/UJHizDar+YQF6UQB0nLz0n8G3iRcA9A5almZLJjeNSamfJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIgZ8iPyUL0hShZKGrqUlj/4UDlqwPUfP02sw/ynJKM=;
 b=oGfXbIYcA4N8Pp8f8Ue60CJT/35UzxjWn2SSaQVNL6NrulhfdIEcv1UVn0YFdoRyd7/W4XJy4QVppUGs+RSbkyK7gxWGe1VjMr1Pdlv+VtNZnkS003wGTKjeITY1Kyi+4f4quI3hSFQmC/dklrAcRhC5qyLeQY38Za8G6Dqq2k36RJrS5mjUvqW2aSEOw9VCiHG7r983uhmi+nf5uTqunol8qknidO9EvsjqOpoz2G4oBZPybetTyvOpASMPz1edapil11RzxGuKIBAI7hr+EaR0YvaY7KNsepCPYFn23PQXz6dC3JtTrMTPg+s730Woh6tQ3nA26w1c0WI1Sb4JvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIgZ8iPyUL0hShZKGrqUlj/4UDlqwPUfP02sw/ynJKM=;
 b=i6GGTx5VOnX/OygWcqGEQc4v4yc37Ax/LWripmdUitgbDdRmGKnLtDXs9Xh9cdkDSW+sNBziCY/xSpQCBgNdd1sTS6OL2jzg1Xjcn174kPVNd4JEwaqAM0m+SQApiTshZAPbBasaCIpVIwHkGLj798+tF1S6tPd4y+Bdj2aD45TpTp9Ov2+iOibOjBn1NU+EARz14RjNtv438TIhGRd65hZwnjMwX82AJr9GXWkMBqvjlFMC8HROjVMwUN5RBv8oDoRwR0Du9jv26u58EBJ4m7ADhHEkIQyD0UYw4bMawyfCVCRLK6Lo89qjsfUFuAqNgWMCypliLXLjOQb5/z/Mog==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:54:43 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:54:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Oct 2026 19:51:29 +0800
Subject: [PATCH v6 08/13] gpio: mxc: use local dev variable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-gpio-mxc-cleanup-v6-8-cb47ce2ad758@nxp.com>
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
X-ClientProxiedBy: SI3PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: dd314f47-cdbc-41e6-c8b6-08df278e7075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|261009223027099003|261009221227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	UXSbhlGwa8E19AuPP5aKx7T2BvTbk0/iwtW7ycK4OZ4X3aIJRYdt0/9GLrZVf3vyiA71GjCPSInM1/IDae/8YUUc/CoRPPUVIy2+C65hKFpe2MGK0a8I6ueF3xh4xGUqYCGYUfXoDrG8mvEHc+UYcT83Khswt3u1bES3kFLqLE9dP6QD8jFdY7GjsU7/Hg4ftR/vxBDq4jTKDbxF9UtQLSR/SLo5rD5uP5n6N2w/G9TOH/7Vv93qnVidr9dpcptHfn+xS6hf7SyPhOvv6XwRcXWd7JHpoz0CoOxfmzKt8dznO6zZUBwxJlJBm0bXIEXDAxT3l7mdzDmT9LAOwE61hPoHHv4wevsA+H6hudHoEpo0BV37oGDiebzm0lS+I5meRSbsOW7YZ8Fv5VWy8dO3Bx54omFD3z1zFCyM5JBgApH+D4yDS4YIQTzhm5HCrYhtslo+Qj8HDll6KZ96QOH2JaWj0KQ8tCjn9LWHeP5b+XynJ+Tkq3kaBEe4hOiofwIWoTLED/LEg1UevHToJ3TskpCzTcTfGflQTT3s7Q7W9a4vEGIoTqXQG3E5FrGnsoLvrRp2L18xvpA3l9YdEteif5shc6ZO6zve1Ane7izg9Tvx6PjkbDPJPROJjSdQxy2SaCRaLYH6DWDoUAsUnwWgDYowrfwh+KW+q6/kPASRdis=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(261009221227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVdiaEhMclU1bHgxdkdpU094R2N2YXJiSk9CL3Q3K3B6dDd6djExbFg3SU41?=
 =?utf-8?B?UmsvZDB1UnFWcHM1NzVYOVBVc2FMMUtndzJHdFJYWDVGZi9BR25qVjlqa2FO?=
 =?utf-8?B?S25sN01oOCtFYkljQlQxejBYZzE4M2Exa3BXbHAxMjBXZVgrdTlvaVlEbVJQ?=
 =?utf-8?B?K1lvcERxYllORmtVM2hkVzRSRmVFV1ZmK1J1YVlrY2xuSHhzL0lOTlBIUlA5?=
 =?utf-8?B?MzZVMkhVTmJjZ29hWTAydHkwN3NqMlNaWkhzTU5zdWdnR1pIaEZPY1dLcnhT?=
 =?utf-8?B?eDFsV3VLMFk4RFNiWEtNRnZySkNoY1lFVjUzQ0xORGVDMG1KT3o4bGdKazc3?=
 =?utf-8?B?c2gxaXV1TTR3a0ZXWWcyVmZxZEptdUNwRE9MSEo3UnhlMVNPTUFuNlBiZXZp?=
 =?utf-8?B?bVpDNW9mblEwdzY3S3J5Q2h4b2VXLzRDTjZCOEhxSkNaWk9oemJxYy8vMEVK?=
 =?utf-8?B?R01YVHdWeXorWjlYU2J5Kzc1cUJzWHJrL3FkeDlneGF1VktrNXY4SWhYNng5?=
 =?utf-8?B?Qk9EcStzQ0Z1UFhINTRrMW83Vk1aaCtiWFpqckFaNUJSNWhXTktSdDZyWHNN?=
 =?utf-8?B?ZTVsbnRDS3YzY0NEZ3Y5V3NJcmh4UWZGeW9HNW1xR0laaXRSSFhwV01jREQ0?=
 =?utf-8?B?NjIwRkVZeTQwVTZrYnNZODUrdmpBeG1od3NLanZ0bFBVQjlETFVERVBWN3NP?=
 =?utf-8?B?cjl0amljS0RyZEJ3RXhUbXlEYjcwaVVMaHA2bFlZZzFUcDRSZERQeVZIZVB2?=
 =?utf-8?B?T3dBbmluUitYVkRyeXR5WE1GcWd3YXZscUt2V0FrZWNRSWFZcEV1Rlh6YjF2?=
 =?utf-8?B?L3liMzVsRDJ4d1JCaEM1TU5oUDhGTVk1SzlKVER4V1VEcndRaW5oM1laUjFx?=
 =?utf-8?B?cENRYzg4VU5ScC9HT3owbFF4Wm56cGE3QXMzTWdteDZEZzk4THNEWk5qaW5B?=
 =?utf-8?B?bkJUeS9oQ0h0KzI5MVBpSFh5a0tvSDBEVStmMDluZHo0aWJRMmlpSEhMcjh5?=
 =?utf-8?B?VGJoWTYvK29uSE9mclFtVlhta3Q3REtPVWFjQnpVdUUvcUpmNmd3aWpPSTdS?=
 =?utf-8?B?aFRTU09oLzV5M0RrNUc3dEowUWJ0bm5jRFRMdXlVNjIrUThaODR3dmpyUTV4?=
 =?utf-8?B?YzZjWmhvdVU1RjFoM3BZOUJRUEMzS0VvVmt0NENQRW04VzgvcVpOMDZtanF0?=
 =?utf-8?B?N1NmM2g4MnhzaTFHYjF6SW1BbFBvYkdIZWFqd0JWRXI2RjkxNTJDTHRoV1p6?=
 =?utf-8?B?QzVrK2FGNG1jYUE0aXdwT1NyTGwxUUJhNEJkTUtZM1FOdWQ2K3lJSlB1Zngw?=
 =?utf-8?B?Yk16OHRVK2R4OGxzRUg1ZCtndXJwZmN4dWIvUXZqODRPamNNam1JTnp5WElX?=
 =?utf-8?B?N2o0OVBjUnVqZWx3OElJd3EwbWc1VktSbXdJUU5GWUh4R3Jqc0hoSUpkVEFB?=
 =?utf-8?B?ZUdsNFBKOEhGWGRWUExNL090YkdBZHoza2pjZ3FkYldNc1NxdzYxQ2loN3ZX?=
 =?utf-8?B?ZHRNWGo1bGc0RTZscExDQndGWnN0VzE2cW5JVHhPUC96emNJTktxeG8zMnJ0?=
 =?utf-8?B?ZjBmZ2RkdG16d3M0UUFaYkJPN3FQYVRVajl2OHUxQVJPaXZ3NjZqcUtCTFR5?=
 =?utf-8?B?OXFiM2VGbGlzYndVY3NSd0lYeTdFS0pkV1c2dHU5cFNaY2psTzhIUS9RL3pu?=
 =?utf-8?B?bVRIcWk1S0pDMHNIY0IwS3hkdVNDaGNUTGE3WUQxY1RaTE0wMGFYSExRZTZX?=
 =?utf-8?B?TEFSckZ5ZEFRcHM0Y0RIak1ZeHg3WWRrZkFkS1JyWXN6TnJaOUVCWCt1bzB1?=
 =?utf-8?B?OTZUK3NGSnc4UjM0dTE0SDhkN0pxS3NPNW5TM2tDWTFYWGxzalZmRU5XQU43?=
 =?utf-8?B?MDNYOXFITElHVit0bXo2R0UzZitWR08wRTc5TWgzZ0VDYklRT1BXajZuTzI1?=
 =?utf-8?B?aTlyRGR0VDZHcnBzSWQzODFBemhvM1RCYTAwYng0QkVwYnhoWVJIa1c3eTZB?=
 =?utf-8?B?NStickxJS3ZETVp6N2E3Qmx5ZWpwbjZISmY1TmhXNG5pRTEwSVlDcEp2Q0Rs?=
 =?utf-8?B?cUV1MG04QUIvS2N2dm9qWE53N0VzbTRJYk1zYitQZUM1aE42VTllOUxEVUF0?=
 =?utf-8?B?Q1Y3cXdjY09sMytVTjBjSTI1b3lRZGpoRWxmTmxSKzJRcDNCQXVUeStZTWZj?=
 =?utf-8?B?alROSUhXYXZGQUJ1allzemIvMi8vK0liWEdGYXdIMUI3Yk5VVjcxQ3I4L0hm?=
 =?utf-8?B?VVZ3U1BQL04rWm9rd082K21DUWltZk42VmJxamxwVitaODNzd3hsdzI1QTB3?=
 =?utf-8?B?Ky9oL0dBTzZ2Mm5kT3lqc3duSVZ6UjZWVXpZVWxGcG9Uejh5NTZwTG5VZks3?=
 =?utf-8?Q?BdS5f7OWh/UdXu1UlQ+JahqLefIU3W1H873ng?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd314f47-cdbc-41e6-c8b6-08df278e7075
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:54:43.6498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ns/K0Q21D5GocQlwUBQVdG6Zj1XmKc5Y+dpa/zKf9XtZTrFpPjWSiEio3yt8Qm+btt2cRbh7LbDjqqoEzrYambJIWTLyYUWbMVo6L6wd6mZUMUYlKSApDNuu8X7LgWjh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

From: Peng Fan <peng.fan@nxp.com>

Introduce a local 'struct device *dev' variable to replace repeated
'&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
readability.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 70fa139338c9..5ae9cdee6424 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -449,17 +449,18 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
 	struct mxc_gpio_port *port;
 	int irq_count;
 	int irq_base;
 	int err;
 
-	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
+	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 	if (!port)
 		return -ENOMEM;
 
-	port->dev = &pdev->dev;
-	port->hwdata = device_get_match_data(&pdev->dev);
+	port->dev = dev;
+	port->hwdata = device_get_match_data(dev);
 
 	port->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(port->base))
@@ -480,13 +481,13 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		return port->irq;
 
 	/* the controller clock is optional */
-	port->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
+	port->clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(port->clk))
 		return PTR_ERR(port->clk);
 
-	pm_runtime_get_noresume(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
 
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
@@ -503,7 +504,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	} else
 		port->mx_irq_handler = mx3_gpio_irq_handler;
 
-	config.dev = &pdev->dev;
+	config.dev = dev;
 	config.sz = 4;
 	config.dat = port->base + GPIO_PSR;
 	config.set = port->base + GPIO_DR;
@@ -526,24 +527,24 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	else /* silence boot time warning */
 		port->gen_gc.gc.base = -1;
 
-	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
+	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
 	if (err)
 		goto out_bgio;
 
-	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
+	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
 	if (irq_base < 0) {
 		err = irq_base;
 		goto out_bgio;
 	}
 
-	port->domain = irq_domain_create_legacy(dev_fwnode(&pdev->dev), 32, irq_base, 0,
+	port->domain = irq_domain_create_legacy(dev_fwnode(dev), 32, irq_base, 0,
 						&irq_domain_simple_ops, NULL);
 	if (!port->domain) {
 		err = -ENODEV;
 		goto out_bgio;
 	}
 
-	irq_domain_set_pm_device(port->domain, &pdev->dev);
+	irq_domain_set_pm_device(port->domain, dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
@@ -555,16 +556,16 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	mxc_update_irq_chained_handler(port, true);
 
 	platform_set_drvdata(pdev, port);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
 out_irqdomain_remove:
 	irq_domain_remove(port->domain);
 out_bgio:
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_put_noidle(&pdev->dev);
-	dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+	dev_info(dev, "%s failed with errno %d\n", __func__, err);
 	return err;
 }
 

-- 
2.51.0

