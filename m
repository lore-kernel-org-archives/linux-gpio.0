Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BCF4F68B2;
	Fri,  9 Oct 2026 18:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569366; cv=fail; b=suym1uhLnatNzu/+uArsvgKmd5pGEAHWALxz1/Vm8IXIL+Y8h44+5hiYea+hrpupb7Rzru5pfmpXVSxudkyJhP5HIaSA8+Ic3HXZ5b7tKzP4ublMEBZolofWVv6FxYtwN6DtVjQPDr9RLACKTcftuv1xzrpnORg2l0wypd+8i9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569366; c=relaxed/simple;
	bh=ddaKNeT7JDR4IdpqlGFGmawkfyJgTRZodd1HEG8bAlk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uFlvLhKtBskAEsf7Ut24H8osxwQdqGu0OU6ExX8Gh0n6Sl2bsXvwkCf2oqu6bI7XI1Vxlrw9hDyA4YfSr1CCSRM4Av75kvLvyvAvFZ5zuokEL/60MRO4NXK/x2n8KDm3voYqj730fd+j6fbEZOIZyYM2tuAD1rdS8peDgoAJQ5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PodfD9tK; arc=fail smtp.client-ip=52.101.69.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PodfD9tK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9c2VZ/y0hxC/XRlzrLsJAOnehwfi6WNjN30XkfxnW0wY5P74wGTip9YnRlS7ftiJ8p4uYXURwh3izY8IxA+NjkWSJbPSr4Ky0N9fEAU2SvyRgsz1ZFhOzOBDlzrylbqX6TPGF40ILx6dRmFVuhozdUa0yGlZZiza89jvXpyG0QIo5D1QrAdz1khyKw9hPNRBH7cjJ83IGgmNOVh6jTnlZXwu+fKpo8QoNECl6tah/3OK0hSIqCnxvDiIlJwnHqQwiIMseGqew+fCCZmVHtvm/KKYVepFeoRVFx20Zo/boJImDdtDxXGNd6+rwjdNqod+AwnNAT23kK/pamED5c4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIgZ8iPyUL0hShZKGrqUlj/4UDlqwPUfP02sw/ynJKM=;
 b=hnvv8RXGbHkFBHYUm8LEwZ9Hp5DRzW5oiGRnWIilarnoNTGEindI2j2DBIzpb9paBB5GpWt84Dc90L06uApS7ZV4iqJuSzPs1D5rIFXOkheCUVbLm4rJUGBBHjNVHzxM91rCnJjNWK4rrNza9pJPEc3vMufL8sHRHp4C57x9ZWSn9HWx0KEJ9sgOkspjl4RB/aCHaA4LCBnxOjXIUNspUhVmmiAjD8PX1wKvPd0LSo387dyIBXUAg12q8FU14CZY4Eh8JY8JP0hXBRtB4WkJawpU3Y6AIHKYrOgRWMJCMqcMdiCV/pMMenGe0H/j7ghRY749FW5BRbBBFJz/qCtjMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIgZ8iPyUL0hShZKGrqUlj/4UDlqwPUfP02sw/ynJKM=;
 b=PodfD9tKt6ZjhS3FBUOVTmrmS3sB6hyt2aMH6hWdjQHY6cNWCFsQ4n29VyD1ivVss5WRyk/51TS48jIYyFE+ZqhRMKMozPihIAx9zWyIICtDjM/X7jGzZD2GlsJSeuFLRl30nfExOel6LSBp+b4sz/8BYzAkVhInOQpQ95O24HuKbn5bScVu2kjoOTeovkNTBaiR7oTyDldLZ0QedZk0MQVRW44Mbgia2i6V7n1preQ0RzpA2CROuC9933BS/W7NJz1IAq1vcDpMOKFksTJo8u0JyNbH9toT/ZtuA0C8sl3taONe6cN3loK1kkv418lAIScqw3HbDfN3GyQUs16Ujw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11189.eurprd04.prod.outlook.com (2603:10a6:150:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:09:20 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 18:09:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 10 Oct 2026 02:05:29 +0800
Subject: [PATCH v5 08/13] gpio: mxc: use local dev variable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-gpio-mxc-cleanup-v5-8-1e59e6ddfa00@nxp.com>
References: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
In-Reply-To: <20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11189:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d1a033-d585-41c1-9c35-08df263070d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YSZ+vKtuSkPHGGx0C5vb4FYhMIQf0AXMZVAXKkbOvcovu3uu1IcBwMEI0U4fr26t44DDTUWwwoXLcmWZNM52GyoPa2vFumpkgzRGt3eLTc3V/y8fvMuaUWzhXhAV6JPl1LQAhcNekKw+kq1jRMjtb5lkh9IFYj39uc5D2LWU786HZiC2jVe+h1a9QhDozn4b1fw8XFtLRj7fe3N6g86+048Dv8cLy8L/LLMvZUkpjs/4JhUNxIoI2qsr5S0o8Sj2GWJklVezmK3ggJd+MI/PhZnpTzgZXr7qxkC3oPQAp8Ay63OKe3+tQYfJ26Hr0XQsO/FZCIB4MrazGuconWXNoAtsGkza88ZJkQDN54Dyb8QZwUVfnzQIBBnj3hCgOJFJ91p6NWMoHJ7fTLBahhM/L+Vt09C3SL5twNommMDINP/wJzHb1NR8IUb2XAkQRkLeOS7PG9VB5vLHe/LjiMnj+jJg8qD5lrwa+kDJyIPo24hIkTZ61GyxRx26/CKhu1rlbSFrb8ZkRw4mlnUCHlOyPvI+pNvvrk/eLkh0i1Je1bs2kwg/OzlZFoyQPEnEGJ3JbBmsu68yMmt0juU6I2oljs5HoqZGP2fcbxVuYPrYnvC0kdQFiTKv79o8yAmGdrv9MbC+IfNIyIph8WfSczwNQTfXrEzatKtEEf85fn1Ha1c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0I5VnAyU2w3cUJsRUkyNWRCTE44NEIyKzF5Mkd2dW1udUFaWTVZWmZXN0FC?=
 =?utf-8?B?ZzJxbVBtcXN6cTg5bzZGM0dEKzAyVEdtWnBkZTc5MnIxS1N2WW1EaHdyLzNG?=
 =?utf-8?B?ZTR4Z2szazY2Zkw5MVRoRlJEUy9lem9rdWxOK2MzLy9QSFVYSkorSm00a1Fv?=
 =?utf-8?B?Z1pUMGg3dWQ3aGdSM2tQU3dhV0pUYTNLUk5QdkJSWGc1Y3NPYzQrS01aUVh5?=
 =?utf-8?B?OEVkcVFKTmZPUmRnYy9VeVhTUlYrSnpxci81Q0pXaDJKdHlTdTJLQkUraGdj?=
 =?utf-8?B?UjVNS0w5SVVnY3c4SndCRzVhMjRvaU1mNDFqK0ZDZDI4WVI1RUo4cndDb3Nr?=
 =?utf-8?B?QXVkKy9BQnlnZGRlTmNRTzJ1V2NVVHhDZko5SDZoQ3pON2tvR1ltZm1ZMlY5?=
 =?utf-8?B?RHNzTHdOSlk2STlZL2ZQTjhibTFuYWh5S2dTNXdNMm5Jd1ZlVm92NStac25n?=
 =?utf-8?B?RkpwY3FNMDREN2pscCszVFFaR0Z1QW1icURuQmdsOEwwR1IybFplSHpnWmZ0?=
 =?utf-8?B?MVRPbWJCNlJIUUhURzRNQXRTK0hCaFdUVERacXdQbjF0c2QxUFZIcFI0ZVRh?=
 =?utf-8?B?Sld5amt4MnlUMGhKNk5LakZ6SEFWaE1xdHV6NElZd1JoSWIyako0V1lQU01o?=
 =?utf-8?B?MnN2Qlp6ZmZjdUhFL2Y4UHpkQ21mOUZUaGVMaHcxcDBUZDRzY1pNaUNyeEVz?=
 =?utf-8?B?VnNHemtZTDhwWVl2Qnh1bHhCa3NlSGlIYmc0aFdsREozc1VGK3RYN2wzeCtX?=
 =?utf-8?B?QlN6cG45UlBMRnR1ZFl5YkxlMWpSakxycURwMENPTWV6T1krcEFtdVFFRzRX?=
 =?utf-8?B?RTk4OHQ5SkJpajFLOW03YkxSZllmSEIrZjhPWTZCQVFxS2hwMXZBZndOSVQz?=
 =?utf-8?B?bHVhWkFpa3hoMHYxRjBhSituNmtsdE5ORTZmMnE2elVFaUszdHU3VUVDbXlC?=
 =?utf-8?B?bG5MM3BmUjV5dVEzTjVSSHV6bU9laFltNmx4eHlwcVZYamk3a213WUFyL2lZ?=
 =?utf-8?B?WlJIcEJVUVlEWFFUd0x1Zk93L1IzdlF3UFBOTm1QRGlSeTVTVHhRR2pGL2Iw?=
 =?utf-8?B?MGRIRkJPT2VpZnBDVm9HMjF2S2hxNGZNeFEyZS9OZVhBRjZwcFdiSFgvWHd0?=
 =?utf-8?B?UzY0NmVEK0kwZzJ1UEYvMHlvVTlmV1d6WTFia3R3Z2Z5ZHJzRUtrcW9oSUZl?=
 =?utf-8?B?bHVKc1ZWOUE5aXU2R1FrUGlYQ3hpVFlyM0pVcktDZ0UzaFVNK0hTdjdib3dP?=
 =?utf-8?B?SFlFZTVXZnBlVUFWa0taNHJ5SVhQNGdua0FxVmJyNkVReGVjYzkrT1NtajZa?=
 =?utf-8?B?ZktoaGFmMEJ1ay9WOGNTVy9LdzZEenNTbjVrQ2wzcUh6RUw0RjJKWFp0Y0dv?=
 =?utf-8?B?Lzd0dXUwd2ZxZ05sK1hXQUxTYjF2U1JNWkVmQ21SUlRLUjRyTndrNFlNVFJx?=
 =?utf-8?B?cTFpSE1VRXB5c0Zyc2pyMEd4TTY5ZEZRMGZjR0Vabmpac0RhVXZEY1VEOGRa?=
 =?utf-8?B?b3BZSlZvenpqQmlhRnRMRWJKNEJzNHNuQlc2UHNLRlh4QkxJZ2tLNHczOHhE?=
 =?utf-8?B?Z2dZOS9LQmNEREpsN2hqbXllbWxQeFNWQkFqaHk0VS9kemszd2FweTE5cUZP?=
 =?utf-8?B?cXVXcUcyY3NySUg5MXlhZzNPVXBvQVZXS0FmWW83OXkyVmp4V21QbzFvRjVO?=
 =?utf-8?B?NUkwY0VBTlJGMDVBbnoxQWlaZ201ZXlheGxQQmVJVXVrYzRXNFp4Q3ZSdzdU?=
 =?utf-8?B?NWFPa1NteXJDSEpvbFdacjM3RGVVVW5aTGdGRk9ucWZxWGtSb2R3NDR4OWYx?=
 =?utf-8?B?cEd1b2RveTVuanRzTXh2RTdNWXl0ZzlBRExkOTNiaTFlTDBMOWhlUldxL21p?=
 =?utf-8?B?SDVoS0dyRmxGb1MvaDAyWDEvb0FESldYSktwUzdkcWRraWg2Zk5Jb015SHBQ?=
 =?utf-8?B?MFpybjdOYXRuQ0RiTVhBTFl5TlJCOUNiQ215OGVKUXllSGtQclJtcVdwNnFs?=
 =?utf-8?B?TXRIaUZrcW5EZWc1SkZsRVR4SUdTLzh3T0d5dWxrY3FaZm5aUXY3dVZUZ2RU?=
 =?utf-8?B?dHBVTEtjVHlBeVlXU3RraFN6anMyODFINGdXMHJnbHJMYnhwT3c1TUpnTEYy?=
 =?utf-8?B?Tkh2MjFRcjBNWGZCL1Q1a1V4cVBXL3E2azNQekxpM1NmbUIxYkV5b0dzUXVP?=
 =?utf-8?B?U0lDa1VwbDVzb29RcHdCdXN1Nmd2aFhIWEZHQjJwZzVpc1RWbHFlNXpuQ0dF?=
 =?utf-8?B?blNkSmR0WUxNd3lWUVlYQldyRmd0YkllR0VTK2dnTHdsTXlYa0lxSFp5M1J1?=
 =?utf-8?B?ZmJGcm0wV0xoQWtWZC8rZmdCU3g1a0pxYUNnY0ZlZnB4eUNmbWpUN1pENTBv?=
 =?utf-8?Q?Ui+0LXlgvhwbkU1iabVSUjGwPcETJma+nuRJ8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d1a033-d585-41c1-9c35-08df263070d8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:09:20.4732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sahPrG2DMGuci+7kJe2qG5JsRDhAmpND++j6h2GyNwm8dbMyetGL6xgC2sd5aFsHGfA4GzMEJyksdqqn3SzBzSdmJweH+nh0wHffVtYguSt2dygcN3C3xbR1mPxOfLeT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11189

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

