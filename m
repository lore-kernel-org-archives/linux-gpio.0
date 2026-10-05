Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FFB4A43EF;
	Mon,  5 Oct 2026 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210304; cv=fail; b=rXPLHBAFexa6NHgHpCjqNCEDVnjvSUmpMtafWIsBPVoMoCfHh6TJUKV5nkGG4UF97/7dyvrFos/Nyk1LOxE6duJr+JOz84iuXWWmQHt3QjbyKjGPxC/EgIbuk9N9h/0R0WYGE/sq+zeNdYqDlHUJb+e7i9JBTFVJqAgpEkVrSp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210304; c=relaxed/simple;
	bh=Qax1YBuubWROoype0i9wxqVqSD9/Jeea7VCcJ2T90is=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Csnv4wXmYc17B9tLPuXgJPbJyt3KEPZEDNiYXa3KvKPT4nlzAHs0EXIfwPEkQOmeoBHb5riTIQvk/u2H1Ir8GMVk5D1rWfy/T0FaGV8r+H1elNETdDErQ4qGyBeW1MzkdfDezElH1bhlgdoR7TwdAzIjx/hxaUWyAeSaH4RUD0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Oo1el052; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Oo1el052"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGT3PF0TnmgNwdYD6nDKZ/qqHlDVRwZ4ZZGbxR0JT4zbHP9yIJyDj7Zqx0LYhomwbzCDzqf0kegEK0jDJjDTsYxGiOGg1rjbrC9gXEgh1dBeO8Mwm/sGIj2YC4r/8Zv/pRsh9ZNuthEr/EXsiIzmStKKTFotNHQfhrMvfACDL+S5ndzuumTmxNYtaTHY4J5DsvLgXkaWV/JJN/roR/nCXN86BnOL/K7uiZU9orUYvRSBkvgzgYwMGWoeQ9jpvj+uAFCNhZ3fi038hB2Ze6xrZQ7bJ97rZTXyYTBrXzR8na0DPH48dXbqITi3rckZzloWCGUzsotVPbczW1cUPNTsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZKArMv4Md17fTbWcpOkt8ioNhJEfO4mI7yUj5Ec9LE=;
 b=fgVytWf7nUFK1S6sC95eWzlWhRh01MRDEMxrggzqhKNMsh3oa314zC2MoDMnQHwuhygJJy0u+gXXN3TRnviWprJ35VuwNhucrwbzEkb5i3yF657JfTXDhHQAnrNtIiqupVjyQlN1V/UhzoppbZ29xs6ZU3qbJ5cEyqvlOU8scujZGF9l1UdpUoz8Vrl+ghyDMYo/eBbsg4HhVZxj2Bmovmuqg3Al2f3VcqgVwiFvU80XVgWULyXGVXpVyJtXywspxB43W/DagUrJK1961FiS0d5zvOedcrw4HYYVsaFFYV9DzSPEEvm9dAGQSI1pFPMu2qEZwe8pbLv2sFCiRTOsCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZKArMv4Md17fTbWcpOkt8ioNhJEfO4mI7yUj5Ec9LE=;
 b=Oo1el052C3Q2QQWSBlhR+OQWhkqdpeGcU7tug8rZ4A1mKqswpuk92ILm7jCgnsR2+L1ZmVn+NCw2FXZ7Iz+Zt+YaR1x/qlvYOlrSPZgKoC4+I23G7EwSklcdGgbbAAJa0ra4u5odaoH+9b3LM6zuO1BdbmdSVGI3qopU6fCL2Uuzl75jwAGS8o4YzACzo4RDCXMhCOEeNeiBLXWY8+Mh6O4CeQog1wRAa99bYwweDkdwrZR/W7lZVe5FWk1tyeeWN12FBj07ZW3r+fgOailX6xKSO2gok+PNdgeP5XbnHoIreOUKTh3xowjBrBpmDlk13hFoUVdJ6Ev3IOZST1mkuQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9198.eurprd04.prod.outlook.com (2603:10a6:150:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 14:24:41 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 14:24:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 05 Oct 2026 22:21:27 +0800
Subject: [PATCH v2 6/9] gpio: mxc: switch probe error paths to
 dev_err_probe()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-gpio-mxc-cleanup-v2-6-bdc3afbb35e2@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c3a3e1-92b1-4d11-ddb3-08df22ec64f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	og/0bcVagYOl07wOaQnyl8GZfcwDPP978TVHCie64G90z8LMyQKy6RZ7uZw5gnNmZwpKG1lHy5dRPrW6tRcLRAvfExPCSQ1Fu0xcSlrKzKVxUzgX20bOlKbWJFPfxfy1D3PucG4zNaK2QZ7azf0wdsGVtG84fjbPk34KmaPBsdos9SOlcMa6/0FLNMP8Hdti8wmV2l7lLph4+2owAwLNjV1FTDc7vL7ZMU6zo+euqOeIGwcnP5pyRfXYTTHF3djk4QrGH4xTEXeH7J03JOlSlHNSSRaEfOj6LuRCwxxYnFyfVFVTE76EriGL6wTbJgvN7oP7jJgxAK8om1OeRYXIeO7uckfsGsEq+0l8cebCaoI2/lcxyGR5LJPdiSm1seBGLV4nlBdOu28js5ZcHukkL4KDxS6NTnuq0JAxYn/BxG60BeLPjU3A2+JyBLyY2I0aWY5YGYSuay7BzkvGQbPKDP3o5D4Uj8lu8VVgkpBbNwKgkjpVWQwaANcl1Krlu1SGy754duYoOqnlkRXGxbG/IjQ/owLeqPgTz3BzvDDbOz2vRaa6WW1/Qht7EostdaHBfVw/Cc3TQt+kU/xC/B8GvFbzsAXMPJnDiEKA6f6UG6KN0gKS6k+vh8dqLoE8QYNHBH5a4QlSz3JfCBFG4zwgqtwrO4tg+3Sn/nYJNm5aJ5I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHJWODNiMFF6cVZiK0l3ZHI2bGpSRDhHazRNMzB3OTVySU9Kay9ZRm1NdDVE?=
 =?utf-8?B?bzhZTzZkZzdZRGdwWXpiQ3JJUHRINHJrQzd2bTRXZk1kT1JMV0ZKNDYyQTFE?=
 =?utf-8?B?ejNwVGZDUWl0KzAwbjZHUXlVUHVtNEdJN2FIYWIvY08yRUlSK0wvOWZDcnpS?=
 =?utf-8?B?a2cySkI1S3MxaWFsNVZ6VEJwU3VwUTdnaVl0WU9TL1J4YndvMnFLYUZzeU9y?=
 =?utf-8?B?Qklqd25kTzEweFl3S01jaXBDK0lObnZsTU1uT2RjanU1NmZjS3g5Zno0MW9v?=
 =?utf-8?B?SngzY1kvVmpNR3VuNG9nWGk0S0ttN2lMMUVHWXpYNVJWZDlQK2djcSs0UGFR?=
 =?utf-8?B?bHZBWkkwYVpqYlF1K3NvcS9ldVY5cjk0Vnh3MjVNaGlJS3hMME9UVVZBQlJS?=
 =?utf-8?B?TTZxMGxkTmFjRlVnR0RqSjJaNHRER3M2TG9PUWRwVEcvTkwwMysvZHJVNDR0?=
 =?utf-8?B?b2dIT1k4dDhzY20yRW1WaUVZVktYT01CL3ZBRFMwMmtOY0hFekRhY0NlNk9S?=
 =?utf-8?B?ZldvUEQ1c1ZNV0tndG9tb0tCOVJEUjE4ZUxjS1ZJTTlKZXdtUE5nc1dKZG1P?=
 =?utf-8?B?TkNZakRDSTlGVFpHbnJzMDZvaGEyenFaYVlpbGE5ZW1OWm4vZThoclJ6OWhJ?=
 =?utf-8?B?RTR1SUhGQ2k1aXA1SHpublJDQlVqOC9pOUs4U29jUE9kK3lDRUZTMWtnN0pK?=
 =?utf-8?B?MzNMM094NVRlUDhydTlzQXl0c1VCNG9TNkJURUtVK3FDcDJjRlY1TEtnVGsx?=
 =?utf-8?B?T29GVCtwbjNYcVB4Zy9aTjBmdFJLeUg3d3gwaFBhdy8vRU93MTJSdDlDUStB?=
 =?utf-8?B?MkprY2x1ZHo4UmVsVTJlWGNsVDRldEdFMVA2N0ZkNlF0QVZnMnFMT29sV25N?=
 =?utf-8?B?NU5JTUJ1SzMvU1BxTEoxRWpTZU1ld0l3V0Q1YTZ2a29ySjRLeUxtam9QWWhS?=
 =?utf-8?B?ZHc3Vmh5UVNVSloyQ0NEdzNvaG9qRXJvVzI2ZXRVMWJXQVNDMGUzQmZPNm9V?=
 =?utf-8?B?VDhNK1BYWEIyQ1phSWpWOXhOaVc1blRqUzRWWHRLM01CRUcvZDh2MjhEb2ZP?=
 =?utf-8?B?cjFMazlaekhZT1I5c2ZmYTZZTHB3elNFMnkrNXZTaXZpY2Q5WjJETm9uaUI1?=
 =?utf-8?B?dmFxcnZ3cHplMjg5VVlhK2NiK0Q0Tm04NElYMEFLbkFEWW1vSWpEWUN2Q1k4?=
 =?utf-8?B?RW1JZUhnbnVTemVROGx5bTRHRmhmb25kWmZId2NGOXQvTVBYWmdqRllZWEcr?=
 =?utf-8?B?bisyMmpJSE0zNDVNejgxZ0plR25lSWV5M0I2RXVhSG5lcjNGT0xEb3c5d1Vo?=
 =?utf-8?B?WElYbG1XU05RdDR5dzFqOTUrSzJGWDlSbFQ5TEtJa2dnTkxPcHUvMlRyakpl?=
 =?utf-8?B?OHViU0UzWVVsYXBmYWE0dUxZa3ZtYm1idFFYS0d5NHFKcmhnMENNTWIrNW8y?=
 =?utf-8?B?MksyMllYT24rV2hYSHZPZVJVbmJYTXRHbWxhSUZuVVg3OVRTWWNLUnJHNFQ1?=
 =?utf-8?B?bkplUEswbDYzRU4xTXJiK25OTUdBUUZDQTZFbGI0NFJrOVBBNTdKeU0zd2RF?=
 =?utf-8?B?eEpKZEhIUlA3M0ozU0N1YThFc2x6YngyTU1BaUxEbDFEMXRPUnVlRGdRbnk1?=
 =?utf-8?B?b0hLRnJKbURnZFRZV0hJSklNNUNNRmZrVFdUREhRdG5RVUNFM0ZLS0lNYUM5?=
 =?utf-8?B?RjVadHBZdDNsVnEyU24wdHNnc09KYm5XU2pvTEtYUjVTVERTWVgyN1FzVWZ5?=
 =?utf-8?B?WjZMK1RuQU9ISHFxMnY0SnYvUkhLODNVV3VreTlkRDFoalBnUVRmTkY0dVA4?=
 =?utf-8?B?MGJnQVh5V3c0U28vRGUyQ1RycnV0ZWlSOHBDeHFkcmwyc2FHMjgyVjJOV0JP?=
 =?utf-8?B?STJqRlNBNm5KUlZ3OWRLeWtkODZ2NEJnc3g0Z01PdXlMeENpaGwrS3QrSS9p?=
 =?utf-8?B?ZFBZdVpBNGJlMTRrRExTNHR1Y0ljUXl3R1BCV3hienI3R203K3FRU0VKWUNv?=
 =?utf-8?B?ZzVybzRObUROZWxVcjhWait2Ty9mNDVmbTJCV2hnckFnb1BETGdUTmV5YlJx?=
 =?utf-8?B?Qm5HKzI5R2VUMVRhMkJ4SitHczA3dlkyQlJTNDdRc3VpR0ViWCtTRUJGUy9s?=
 =?utf-8?B?OEprbjJCNmpoZjBxWmQ0TVI1VUgwSTdRNFhrUXJ4WlNPSFhGWnJxT1J0cmlN?=
 =?utf-8?B?bnI4Kzg4clViQjNYYmRIR1VGUFlzeGRjR1R1WUJjMVVMa0lzSFBWN1l3V2h1?=
 =?utf-8?B?QkxPYkpEbGlFQTJvTVVjclVxYmdGWHZJSmxzNk9oempUNDFhdWxBWVZsV0xk?=
 =?utf-8?B?U01ZRGJoTWYxcjUwVVByRUh3dGhGQ0YwSkZQSVJCVVdoL1lXdmI1SWErc2tp?=
 =?utf-8?Q?1ty/U5OXVS1GSthU83Xdfi1FlElTliRp3GjKw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c3a3e1-92b1-4d11-ddb3-08df22ec64f8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 14:24:41.2829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UV1vqlrsMjkO7QW8IIWq7rtaRVtHxiLDmr2OQvQ47ORcNUxhal32KbxaxiJfATv70ArHPNUYfvbqOEQgglHkTt6joNEhcdLi+HJhNTpJq7ITHwCkVRqLcWVB5QhxjYZG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9198

From: Peng Fan <peng.fan@nxp.com>

Replace bare return statements with dev_err_probe() across all probe
error paths for consistent diagnostics and deferred-probe support.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 871938e4cc95..c92331f192f9 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -517,7 +517,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
-		return err;
+		return dev_err_probe(&pdev->dev, err, "Failed to init gpio chip\n");
 
 	port->gen_gc.gc.request = mxc_gpio_request;
 	port->gen_gc.gc.free = mxc_gpio_free;
@@ -533,11 +533,11 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
 	if (err)
-		return err;
+		return dev_err_probe(&pdev->dev, err, "Failed to add gpiochip data\n");
 
 	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
 	if (irq_base < 0)
-		return irq_base;
+		return dev_err_probe(&pdev->dev, irq_base, "Failed to alloc irq desc\n");
 
 	d_info = (struct irq_domain_info) {
 		.fwnode		= dev_fwnode(&pdev->dev),
@@ -550,14 +550,15 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	port->domain = devm_irq_domain_instantiate(&pdev->dev, &d_info);
 	if (IS_ERR(port->domain))
-		return PTR_ERR(port->domain);
+		return dev_err_probe(&pdev->dev, PTR_ERR(port->domain),
+				     "Failed to create irq domain\n");
 
 	irq_domain_set_pm_device(port->domain, &pdev->dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
-		return err;
+		return dev_err_probe(&pdev->dev, err, "Failed to init generic irq chip\n");
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 

-- 
2.51.0

