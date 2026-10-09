Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4A94F4753;
	Fri,  9 Oct 2026 18:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569383; cv=fail; b=EtRrONsrF1qdeWtRiFa2g7JOjErQI3q4onY4V1xw4hYRx+qTGtePwaO3UJv8NpS486p1l1Ts5IyuvtZ/vkR6GebLvQEtqruSg0KjSTZpJD/kqOHTpS8M5oJgsFIuZUEUzM/AemhHrdYnNUGYVFJS9OWq8GpzGcyDs+lmOnomprI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569383; c=relaxed/simple;
	bh=U6hR2u0usrIhd2dIggRfRyT91q+vMDZ6fGNq3QU2Luc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=L6h2VbwdG8PBT3OEzncPaKD7Qgp5vwOIb6DKS/0SSFsDg9ccBjijmezKFZ0LzCF8MO3z5E3/fdFBKJuzLEFDM7UgJZD3LIde7y6k8dEMNm/hne4yLS4yJU3cDiJ/6CxPseuIPq45GaKxnVDfRBE2xYOhk4Pf245G/uvGFW0CjZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xoi0r7YB; arc=fail smtp.client-ip=52.101.69.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xoi0r7YB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRscl6AvrLZJ7oZjftRThosj2DkW5ba3b3p4WRPKlenP5/1tQGObl4hqLCm9abZMjbUkM3jE+HlYTh+Lt99hboS+JoWRN35VyUxLrWHohD+2clMYaZ88OJOABqD21+W9bGxYkABsR29vkNV+z6/MpXLpQ75ivvTHLJ+whtzV1RLNPWCs9kmX6UpuhFxGPObnoekrL2lPVRZc1LLcyf7QfbmlIP0JTQIhvduNZVtWn5P3r0g5Wx8ek/TLZduXWmlQ+KseW+Ab5J04zt3l+2vdknuozHFbZ+xc8EFiAFYcSAXsEFOj951WX1UAiAKmw6+8jOtARuDQa1u9sjLEWt7nAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4HMRBI5zHbeNFFoti1N28R2qezt1iOkDU6tN/kzDDc=;
 b=SVbvzEylllabkM9lhf7uHes43ykqOwG+VmX6kEYln3Hl6WxuhMDNzp3WOVgR0aUZaq3/fc2VhiTW8zwquAMI+bkZT/SmmojY+i/N8NMlCJQJbeU7KYNs/z5HdQqid+U3Wgv6Fq0xYEc/PzuENXVooM6rtVEnz5H74LYPyufnolcsab7oDkAZhaHEECmioFbVMRohXeKoEM4dL0ikKhKMN1i0M1vvs6KFQC4J2LwTVF3ei62+DVHy0FczW5S3I9TplmZ1fqoQhXK4QJoVjz8SuHoVfckzQ3fxqiv2haLUt2uJaeYQYu/39g8pU3AHQibfKd5FqF6uLbXjH2R5zMwtng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4HMRBI5zHbeNFFoti1N28R2qezt1iOkDU6tN/kzDDc=;
 b=xoi0r7YBSW73PLS/xFR5i1oOK9VtcLCw4Eo489Ud54+NCv92N4or6Xeu94EyUiCNb4hbsvqgJSJNDCL4xhasmp6ZRDI6iEeSvYSvcLgpHOTONK4vUCns6+KKdIEwmyZroZ1yzx8LxfYry5vT+iFthGpJdqMT9Z5pwiLInV7S/sgGi0I2bKaBE1/NMEA7Dys5ahEH+SMWadeYAsXD58ohnyxml+qcHsd4+ASHS5mIIUO8h5v/qZhc9CgmYLJAwU8OHjTsvC4Nbtr5xgdUuH/j+Fes+BSXSp9Tj04WEti5gTTqqxGITh/o2hpGCUaRrZPvf9f8SX7agi+iLL5XL7lqtQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB9PR04MB8282.eurprd04.prod.outlook.com (2603:10a6:10:24a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:09:39 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 18:09:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 10 Oct 2026 02:05:31 +0800
Subject: [PATCH v5 10/13] gpio: mxc: convert probe error handling to devres
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-gpio-mxc-cleanup-v5-10-1e59e6ddfa00@nxp.com>
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
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB9PR04MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 635c8272-bb46-4e3f-fb88-08df26307c0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|7416014|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	PKc7O846ZhkhFuoBqSGtXIIKfLNpbPfEN8yDO0z27qqjuDjJ/lo7vrLgpo9myVTf8GrmqrTTGETRnPZ9+xadBsZZWezMSadmxwKkemTaeH+AAOSPMjKpdTtqWo6URUmD+qqNjxVtVZe6JOKXhJP1KIwuw+V2Mjd9nuaAbbLb/D0RyZE6IxFJuKbEgjtvi8lbui/oVjq/9qlPC1WTDiL8JPs1Av4l24yYCL7gx7Zz7x2JR6qaZEvUVbOUcucIgLt6alQdfpe0n0zm4SnR8LUGsLOHtg/0h4g8rzkozVFKRM97ASAfqsoCZ9o0oc6WnYr+2VOSjGblRxKqWpnSG499Kn1ja31jWUB1Q+0D9OR+RBrFJrbs/nq06ln5O+unASNiXGV4fy0T1WezueZFDaAMLkoxQeyq4YR5m4IPck2mhVUj7jgeIjSngmNFr15C1LeETSRqrroe0cHgP5d8DPAhXpBG6A4bVdIacT3jab1R8yiwO+LNpsgsvpJ2rYbZge62ojdstXwrjkSIvvD1cD7su0mvD5+qW458NvVg127KssKlioZIPzKTevPmdjIr4VdImOIL6HJOmD3CgWf2rxzNHyvF7pizrhF3urjSsSU9Kf2F4I0CcmGcugek7npAToJ8RzN14SaW1QaYUnjGZ4+2ZeFnquA/RmVRA+u7V2lUKjY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(7416014)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjF4NmdpK0JYTTY4cXM1ZzhNTzJLVE1KYnNlTFp5RkxnSjBQZ3p5c3Y4SGIx?=
 =?utf-8?B?Ym4rQUxBMENwN09kK29tS1NRQ2Q0NGdEdlJmaTJzN2xoWXBOakU0eVc0eEJH?=
 =?utf-8?B?TVc2QXpZcDNUakJSM1RiNUNJZDlzZlRqYU9jSzkzdlB5S1NMRDVTU2hnR0pJ?=
 =?utf-8?B?aXR3eEJNREp5b1NhWE9iSmd3MW1xOUZrVjZ2eDJqOExsUHJpMm5MelR2YU1x?=
 =?utf-8?B?L1pzK1FjU3V5eWl6WEExRXRSZ3ZyREZQL3M2WERRUjk0T0Fad29kT2ZBREdT?=
 =?utf-8?B?THdFMmNCTVJIdXl6WEtoUktkZ21GZ0g2S1Y1T0JoVzZXWUhtc2NyVnE3R3lO?=
 =?utf-8?B?RUcrNWk0dDc1SXYrM045cFJRUlduMWY5TWFlUERVU0JlV1dGK0ZIeVNjdU54?=
 =?utf-8?B?c0puV2ZBZ0Nta2RTaHVKV3dYa0U5YXR5TzZuQXZKeTZ3TE1LOTVnQ1pJNjYz?=
 =?utf-8?B?S1NCOXhhYjViaFlvWWk3UTI0bkp5RGlTWEpNWTdCTGFtSzdKV2JwYnRsblFl?=
 =?utf-8?B?NTYyTTZ2OGFGK2h5dVFsbnRITHpxRWZBOW4wUjFnOUhjdjU3anV0dlNxbUEy?=
 =?utf-8?B?WUhWS3ZSeGx5QnlYRUZJc3NtQ0l1Smt1UG5HRWQxMjhSaEdDdGVKWmY2RUE2?=
 =?utf-8?B?cjRORTNycitodllLUjVyTnhCUXQ5U0I5OG93SzgvVG4ySlZ3eTQzQzczSmU3?=
 =?utf-8?B?MU5TWldZbm5VNEdMQ2dtTHJZZDRvN1VQTkpZN1JCSHV3U0xJd3VYYnhEWHFV?=
 =?utf-8?B?aHhxR0p4NmwyV3ZhTzdRYkxQWXltSExMZGdQV0hoakhmY1VpUzVROGZ0d1NY?=
 =?utf-8?B?VGQ1c3llRG0yRmtSZXZrM2ptYndaNjI3SnZPTktyVmo4WEEzT2FSQmdXVFhq?=
 =?utf-8?B?YjYyNmpWaElHUWhpZDhjS0FONC9lblZMRGZYQ2lZR0NSRTVEdVN0UUE4dElQ?=
 =?utf-8?B?YzlCb3JVcE51cVhOY2M3SlFFM3RNMmkyMTFDKzN4RGRreFJCMEZZV0p4clBz?=
 =?utf-8?B?RThEY0dZbmpzdDZxcjhLNitaeGhqbmZrdVpzYWQrVkpEaC9nUkkrWjBoREVB?=
 =?utf-8?B?WXBQVGxwWTVGVm5QcDZRem5LL3pneGNPSHRJc0lnTUx2TlJVSTIrbS9TNWUr?=
 =?utf-8?B?cnhPcXdjWHhCMUxCd3lHNWRHVGhVU0FLNmdqWFRRMmdkL1JVbnR0S2d2UHpB?=
 =?utf-8?B?ZU13UW9qaUVlcXphVHNmNElCWlNIZUFTUFlERlVyZ2MvbHJvb1hNNXJPSno5?=
 =?utf-8?B?UlJDbHlSekVSZGJsR1JZQXdJdThnYkFxYWxkUERXZERwSnhDeWpOTzZha1I3?=
 =?utf-8?B?WjJxTDMrN3lmeVZIQU1ialZyYzBVVTl1VzR6Qzd1UkcwbG5TRGhrRUUvaWVa?=
 =?utf-8?B?MmN5NVM4T3JndFZKUEpuK3NlbVVBeEd2ZmcrbDBocHBFRFBoWWZrNkd5SW9u?=
 =?utf-8?B?OHNhNU0rdHVIeGhtV2R0Q1crNDM5Q3k2RkZ2aXRJU2Nsa1E3QUNXZGxQaXpX?=
 =?utf-8?B?NmFLZkxITlRHU2RxaWNKSGdZVThVaGFIOXVpbnptTCtzazBncHV1R2xDMzEr?=
 =?utf-8?B?cGR2WHdFc0dyTUtzdGQxaER4UHR0RzBUTHNkWXdqWW13VUR4YjBhTU1pRnBU?=
 =?utf-8?B?TGR6UkRSd0NPc0RxZUxBNjlmb1daeFE3aFVacVY1Wnpydk9iSlp1K3IwL2V1?=
 =?utf-8?B?OHMvRkIvRmxhaENxUzRUTUd3TUUza3lQcHdvQWliN2kxVDJFWjlTUG1ZYnR6?=
 =?utf-8?B?SGdKamhiSjVZUkV2K294b2xRb3RVa0d1ZTMvOGF1WTBhQ1o3ZGluVDZuTlMy?=
 =?utf-8?B?NEZsQWY3dU5sS0paK2cvdlhLOHg2S3gxdjREbVUyVzAvYlhGVXNwYUpzSG44?=
 =?utf-8?B?YnJZanNlL0krVzkvaEVtUHpxT1ZZUjNBdFk2MWRkL1JrcXh6c2h4V0Vrdmw2?=
 =?utf-8?B?V21kMklJMUl0djNFRDVGblpsaWJXZnJBSGZSQXlTMWk2cUNPYlBzUzlaNVdz?=
 =?utf-8?B?MVRib0c5dWFXK0NwVWIxMUhjU2dhSUZyb1JkRFcrM2g5NkdBQnJwUk1yc29m?=
 =?utf-8?B?cE9DQ28xRWc5QVdMZyt5Ykt2OXVrNEliVkNsNUtZbTdXd1lMUGkyNUVqSUFv?=
 =?utf-8?B?RXZseCtBd2hZMjNHTWN2dzBDd0VhY2NrQWhEdXVxYWh2ZWduTzUzL1oxaURY?=
 =?utf-8?B?c1JTK01nVUdJaExHWHZNWG9XSWVaSk84TjNSRDdJVmU3RmVnWStHVHZ5SGlk?=
 =?utf-8?B?TC9IVjRXOGppM0NMTG5nUWM4MThoVDhFTjVvT1VwUnNtSWpVSEh6UzBuLzQw?=
 =?utf-8?B?ZFNkT0g1TTM2dDRFMXlOcEpEeVM2R3JhWkVUODM5Q0U4cHFWU3hCMVZ3Y0py?=
 =?utf-8?Q?UmjBsXZKuofot2wPxW73haM6IUNUkvslrC1fF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635c8272-bb46-4e3f-fb88-08df26307c0a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:09:39.4349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDg/ctdADJXpGxMEX7UrMgLHrg1ApP4H6ujxFqhUF14I5S4O0NXNTTGcQkj6YiIAsgYla/Zh3JWqBFKYy+Bli/dromRaGOCfiX/hxqP9L/gBJ+3pWLYOHLL10LUPXzXw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8282

From: Peng Fan <peng.fan@nxp.com>

Replace irq_domain_create_legacy() with devm_irq_domain_instantiate()
and the open-coded pm_runtime_set_active() + pm_runtime_enable() pair
with devm_pm_runtime_set_active_enabled(), converting the remaining
manually-unwound resources in probe to devres management.

With every allocation after the PM block now devm-managed, the
out_irqdomain_remove and out_bgio error-path labels are eliminated
entirely - probe errors simply return directly.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 3d5a6566d3f4..6074b1e3d683 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -452,6 +452,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
+	struct irq_domain_info d_info;
 	struct mxc_gpio_port *port;
 	int irq_count;
 	int irq_base;
@@ -491,8 +492,9 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	struct device *pm_guard __free(pm_runtime_put_noidle) = dev;
 
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+	err = devm_pm_runtime_set_active_enabled(dev);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to enable PM runtime\n");
 
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
@@ -518,7 +520,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
-		goto out_bgio;
+		return err;
 
 	port->gen_gc.gc.request = mxc_gpio_request;
 	port->gen_gc.gc.free = mxc_gpio_free;
@@ -534,27 +536,31 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
 	if (err)
-		goto out_bgio;
+		return err;
 
 	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
-	if (irq_base < 0) {
-		err = irq_base;
-		goto out_bgio;
-	}
+	if (irq_base < 0)
+		return irq_base;
+
+	d_info = (struct irq_domain_info) {
+		.fwnode		= dev_fwnode(dev),
+		.size		= 32,
+		.hwirq_max	= 32,
+		.virq_base	= irq_base,
+		.ops		= &irq_domain_simple_ops,
+		.dev		= dev,
+	};
 
-	port->domain = irq_domain_create_legacy(dev_fwnode(dev), 32, irq_base, 0,
-						&irq_domain_simple_ops, NULL);
-	if (!port->domain) {
-		err = -ENODEV;
-		goto out_bgio;
-	}
+	port->domain = devm_irq_domain_instantiate(dev, &d_info);
+	if (IS_ERR(port->domain))
+		return PTR_ERR(port->domain);
 
 	irq_domain_set_pm_device(port->domain, dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
-		goto out_irqdomain_remove;
+		return err;
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
@@ -566,13 +572,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
-
-out_irqdomain_remove:
-	irq_domain_remove(port->domain);
-out_bgio:
-	pm_runtime_disable(dev);
-	dev_info(dev, "%s failed with errno %d\n", __func__, err);
-	return err;
 }
 
 static void mxc_gpio_save_regs(struct mxc_gpio_port *port)

-- 
2.51.0

