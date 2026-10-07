Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C4B48A8B4;
	Wed,  7 Oct 2026 10:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370223; cv=fail; b=nPNZw6ViSPXd9jWGjJE29GBnqG0iVci7q8rfb0qOCmMmPDtEl5YKyx687ZRdMjcRsgS6oeokxHGCgxm3MMxm1kZ4NgKzd7D+Du4JAwvI4CF5LKIybJc82DoXqo10L12gMkM7yOmnjq6BFZG03HTuWOobpzm7CS7SRQXS1fm90p8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370223; c=relaxed/simple;
	bh=H832nN+140Cg9061ZPOrfzTRiuQBcsmTS71C2VGc7PY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RAZ5hy/U8WjftAZ1sTjrYzz3viG53gETbh9ACKKJV6qhqp8fE+oR8rAzPWgvtsgEV0fRhlnlVFZsj430a0LnnSdNFwebbseJfByGna87KcHYs3OKvQP8DYrJhBj9KlTExIDdpL2SdyYupNhQ1aU9L6GS+Bis3j3SRufDYtGfpvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=orLvLDqY; arc=fail smtp.client-ip=52.101.69.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="orLvLDqY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5d7UGka4qFCq+SghU7uipp+5QrZcWSzQTxiQq4GhHcXh5IgmGYucMqJw0YxK6nygvuMcJXPG8xOp8I96EpUWDt++wlN+OAnYGZMPwSm1m4Ie7X9FZtNCDqsKtG9w0iad/xbtX3PjKdFgo5v2s2WjtNrgXIc6BoNR5WmpqzMts553i7r40P1c7Fdi48PxXz9+CX817TVPJypwkXNk0gkU9KsBT8HD3zR0Qfd12b62fZnlqvkS5Uj1s6blW4KOTkAS+03hiQZlSbvAiWkkkvPIcbxAS0Y+DB0bBAeS1HHa3/xnlf4O9mAzE7BDiABFYEWvWD8gnQMOIzHjpl8xCcNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=789ocHpMBh1mNVZfB6MFCR0x/R8ZAvnJn8YkNq1LlPE=;
 b=YqBmoBLaE8F854bc1gge4RBZkkuBZ49TZlz8hN6jI3/QstVdjskVMLQg9mjoc60Hy1vixpQnV28BzkABDMtRs5buFka8I9idPalblPSDRpC5X/dGv8SDSveubTK8vIkj5ees7lZfvGOhnt5QOhPDE8QltSG1+ZZVaOCI+J6mFCK/g1gf5bnmOPSRFB9Ms5Zl9XuBr1IQo7i5HEZ18I37ERn6JKlH2MMpre2SY86XnUTUlexSM2fhHCRKZehmJ53Ir7bnDK9glh6m8oKIQuaF1gZCvXNvOeYEVjTFDuCvvKqaJh4Z/XKRgZnaTmS4X1SHOZKBswW2t10DUmXgg7YTrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=789ocHpMBh1mNVZfB6MFCR0x/R8ZAvnJn8YkNq1LlPE=;
 b=orLvLDqY3xSzxSgcVvtX6bgl6E0+JZLPyoG72+0dHCYFQ5y0FtyKa7Of7F5LOK8gQYNSFAHQVdZHrO4Rxmcycm9fWgg+3kA1TZAYk+SEAcZkdK63OUBRt7BdP55Tm5FdVjsvzPSZEEB9PXfAzJtIJ1lYezWFzoJw2gKWPKRGVyL89MvJQTxT2TF1jSL9Xkwgc7nlOw5REvo/AQKbt8GwI73oMnadwbqpmyMrgwc2xPjpy6kceN/tu+9WlSxtkMJPoLuAxu6cpkLUrBPXas1RO5JuoetrtVwB67llilDCQNNHVGtUcPtij4sM3PaFEsyHDUDAj4wFHnKYdH5HEwlhkw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11738.eurprd04.prod.outlook.com (2603:10a6:150:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 10:47:54 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 10:47:53 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 18:44:23 +0800
Subject: [PATCH v4 08/10] gpio: mxc: use local dev variable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-gpio-mxc-cleanup-v4-8-c9f5a8b50df9@nxp.com>
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
X-ClientProxiedBy: MA5P287CA0225.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11738:EE_
X-MS-Office365-Filtering-Correlation-Id: 809e1720-16ca-4c5a-8b1c-08df246070b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|19092799006|366016|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+ByaeTP5WrZvdTfqiomXoMESrX/8ThJukdcQjTrRTI14cTzKtK/049K7vpO+oqItK2+k2bif9AZ4WiHXOgvaGmwHD+bWMHruv2ezqp8Z0Hwaol+WOF0c0llsE/LS2qzbXxQZoezED0jCfzYdRWpJVquFTRYYv+z76LvE4SE87lK9AreRZyNICSZTWuxpPlmfHXv40yKNzkWjTkFN+0Q7ZZpPZPIZjQei5YaT+IBjDTwgPP2pujB5i1jGRS8Oe1hd2ghemeEXN74XMBUdaL/mMgunyZC0FIUpZK20ooIpiuyg4t/x2wui4y4qskHOBOoJ972Hhaxa/JQhNHbaBtCRNfBS88eifz4tYoHOBFEltz5VKSGj7SkJdQMk+EV/QrOGLucK/4TLWP7Ez3X4BdHdUwcCgz9R3ZTFx4gpAHE2cr9IjeUeX1KSm95oWq2E/pJRbQ84UeThbEcbtGhSTdk7q/07vqpkP7+N3b6gSabMG4mhGckQ3ukphtwWBwQSBXilTZhxiUcytz2p05vGlmgnbZ8qipXpFMnpGJdDz34HAUjskzT6W0nRw6Ghs+yM2hC6calAW+Zz3sMvhBTWvNN9c7/BIbB3YtZMbGbMNBzLHFO12i8+LHDOSREjCP/rxR2TglVrW92twXeW8hwyPaLSReepNuciPo7jGVkjNFDBB7E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(19092799006)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDBBakhlOEJwRXh2ZE9YWTJxa2svenhseXRaZWFEYkhGMDU5NDdpc2VtNzh4?=
 =?utf-8?B?NGpnUC85VlpUeFlmcDZ0aDdpQzBqS3psM2llbm9mOHN5YWlJeUZaYU4rMmZq?=
 =?utf-8?B?YTRST1lHZWJlTDBnNGx5UUp3cFNOUlRsb0NBd3hYQjlXb1djbnM4YjdPam1R?=
 =?utf-8?B?QVB5OWZ0dUNTSC9mMitpbElLU2wyMko0R2M0UlZpTnJwWVREb0dqam85Unpl?=
 =?utf-8?B?OUtFOUdkUDhNenh0ZjRERVV4UVp5VmZNa3RMV2JDZk4rL1JGRnp2REthR0p3?=
 =?utf-8?B?RHp6VlBBUmcwZk9kbVFVelNCSFVIM3U1bGw3Z3hscnp5VGxJN2NlanRKMDFl?=
 =?utf-8?B?dU43RkZ0T1Bub2xTa2Y1NjFtUkFHckZNckRXcVRpaDNMZjRZYnVJWC9qelE3?=
 =?utf-8?B?bDRhb1lmbU5OVitHM0hLaU1OWUtMb2tYUWhKdWJ1MmlPa2VGMk9tQWcrR2l4?=
 =?utf-8?B?bXpmNGl1dTlBT3RjcTlxQTYvUWlsNS9oQ1NJaGtqdTF5NnZ0REhkcE5iRWlV?=
 =?utf-8?B?NklPSTZ6b1dkaXBZMkY1c0dseHlSdEtHdUR5RElIZ3QwOVEranVwd0VZckZX?=
 =?utf-8?B?SWtPcElPMGJxSDZUck9DanFjT3Jiem5KWXh5UjBsa2VObUJwWU5MNHdaOEJY?=
 =?utf-8?B?NmdqSSt4RFJLRTl4a20xOWgwWk83bkhLSHpuT2NBM3N0Z3ZYMU10eEt3aEV0?=
 =?utf-8?B?Y290dTh5WEFjVUpwSnNrN0Rja0JUc25naVk1THlUM0ZKcjhyV213TkRsZnp4?=
 =?utf-8?B?NGF2Zy8vemxuUFBZNXhPTmh6ZDhEczUwaXduc2hZcXlhMTVVUTFmTWtvbGJL?=
 =?utf-8?B?eVRUQWk4S0JrSkwxbVNwSXZQeDZIMW93RVFCOGJRTkRDM004eEZGVFJVVVV6?=
 =?utf-8?B?RTFRWURXbEgxSjZ1UjVSaVRnVE5LTmZydm1NNXlYbmxYWGpqUUpKTFZjMENy?=
 =?utf-8?B?eCtZbUQ5U1NCdFhEU1dlS0gwQWxFcFhjeFdtMjB3dW1uYmhaay9YMllLZVZI?=
 =?utf-8?B?VThWZHdiVzdFTU1jMi9sY2ZNakdLUEdZcGs4THVvQ3RNYjU0dUlmUEh2c2dN?=
 =?utf-8?B?RnBZZWlJVXhESFM2RzlVY3RJaDZ4QVJjbFg1OFlmcytiN0VjcWZZVnQ4OG8r?=
 =?utf-8?B?Q1h5YXBaQ2VsazQ4NVg4NmRqcUtpbFg3djBmOWVwZjBpd1cvQ1lZWHBaWmoy?=
 =?utf-8?B?eVpPbmJWR3VmTGJZelZKMWx1QVJkU1VaaW5ZWG5mSUxNcmdhdUpuNzZoZ2li?=
 =?utf-8?B?TG1idzRqQllteVdURnY3QW9FTGpYNVZoVzdqUGRHcS9jVmh5TUxKL0xqb0th?=
 =?utf-8?B?WFp1bjNWcklRRGthZml2WDdQVVFkaWlUSmNiUkZRZTVIWklRSlJzR0pKU2gy?=
 =?utf-8?B?cUdRQW5pNytPUWxDR3ltMUxXZVFlNVVBWEIyQWxESVgwTEZ0SVFKZ3ZTdkFT?=
 =?utf-8?B?TjIweGlSeWdKMjRWc0RNS2QrVjhDVVY2aWszak1iMGw4QkF3NjN3NGFmOTZT?=
 =?utf-8?B?QUVrVXJuT3RaQWxUVW1lRklpeWFyR0JnMEVraWN5TTVwU0p6Z0dnMExicm9p?=
 =?utf-8?B?aHU5K0FmYVZSeGliRVBVTW9VVE1SNW9qeXF4a3p5NGQ4bEVZamE4R2xLT1Rj?=
 =?utf-8?B?VHlWY05lUVQ5bFRIc1FUdHdpYVFpMkQ5Y1VMSzRwV0hhTkhleHM0eVM3SE9z?=
 =?utf-8?B?N2NmN3p5TUhYc21EY2NnU25aUTRXOXIybm1PSW9BN1JkaXZ5Vm5hUncxSW05?=
 =?utf-8?B?YXJnVG96ME1BdGdaSXVqZ2IrY3BZMXYzVWhKZUVBL3lMdys0cjRSU1ArV1I0?=
 =?utf-8?B?WXhXRklmOHdJbWw2aXUvUE53dWc2RmsvUGlqOWpwTTcyc01teWxSM2FMV211?=
 =?utf-8?B?SWkvZE0zWlpkckUzcHdRVTJmRnpkSHM0aGNsN1JLTjlJb0FCWXhjNzhYRG1B?=
 =?utf-8?B?TFBTL1l4WnJXc2JDSVlFTXl5SXVTa2NyTnJBWXROSklGQkp6MkNMY0J5RkRr?=
 =?utf-8?B?YUlwcWJBc2l6NUc3SUl3N0kvVTd5eGFJUURSbDNQS0dpdjFJOVpOWkYwUmN6?=
 =?utf-8?B?MDNaZzluelRxblpmUldkNGRsM3UrOWFhN0U0WHlFRTZLZ0Qwanc2bE9xZVlC?=
 =?utf-8?B?cnJ0U3R0MTVuRlVQNVBLM0phMlRtZ01zNy93ZnRVTWo2YXBMdEF4S1Z4Uzly?=
 =?utf-8?B?b3lNVGVtS0Y1b0gvZitDMEVncElSUm9xSjZHSHdxdzliOXJhWkpEN1lsZDlh?=
 =?utf-8?B?MHNHV1VHRCtNWnoxTlNQNzdXeWx4R0VJdkZQUlEwUjhiTkdNcHIzY0szSitQ?=
 =?utf-8?B?OFo2dW9wcVZPenNwbDFmYy9LMmdwSTU0WnRzTHFzS05qdGlUTUJZVkRZMFpa?=
 =?utf-8?Q?HEH4eMgTHv3xV/jgKazcw6s+JS3mE7OsYDolA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809e1720-16ca-4c5a-8b1c-08df246070b0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:47:53.8767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTkGN51gbp9BL2PCfj7bjMGvw5ASxOYuZuqgSOAM1B/7FTXys1kAVZca9PxHnO2b2dXgj2EEw8EBhVjHyudaTU8iXrV2HGbhVSIdXaf6QwQGqvkTqSaCw4sneRfxW0J2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11738

From: Peng Fan <peng.fan@nxp.com>

Introduce a local 'struct device *dev' variable to replace repeated
'&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
readability.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 43 ++++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index f5f9ef1564cd..9d69524e06db 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -449,18 +449,19 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
 	struct irq_domain_info d_info;
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
@@ -481,17 +482,17 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		return port->irq;
 
 	/* the controller clock is optional */
-	port->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
+	port->clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(port->clk))
 		return PTR_ERR(port->clk);
 
-	err = devm_pm_runtime_get_noresume(&pdev->dev);
+	err = devm_pm_runtime_get_noresume(dev);
 	if (err)
-		return dev_err_probe(&pdev->dev, err, "Failed to get PM runtime\n");
+		return dev_err_probe(dev, err, "Failed to get PM runtime\n");
 
-	err = devm_pm_runtime_set_active_enabled(&pdev->dev);
+	err = devm_pm_runtime_set_active_enabled(dev);
 	if (err)
-		return dev_err_probe(&pdev->dev, err, "Failed to enable PM runtime\n");
+		return dev_err_probe(dev, err, "Failed to enable PM runtime\n");
 
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
@@ -508,7 +509,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	} else
 		port->mx_irq_handler = mx3_gpio_irq_handler;
 
-	config.dev = &pdev->dev;
+	config.dev = dev;
 	config.sz = 4;
 	config.dat = port->base + GPIO_PSR;
 	config.set = port->base + GPIO_DR;
@@ -517,7 +518,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
-		return dev_err_probe(&pdev->dev, err, "Failed to init gpio chip\n");
+		return dev_err_probe(dev, err, "Failed to init gpio chip\n");
 
 	port->gen_gc.gc.request = mxc_gpio_request;
 	port->gen_gc.gc.free = mxc_gpio_free;
@@ -531,41 +532,41 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	else /* silence boot time warning */
 		port->gen_gc.gc.base = -1;
 
-	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
+	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
 	if (err)
-		return dev_err_probe(&pdev->dev, err, "Failed to add gpiochip data\n");
+		return dev_err_probe(dev, err, "Failed to add gpiochip data\n");
 
-	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
+	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
 	if (irq_base < 0)
-		return dev_err_probe(&pdev->dev, irq_base, "Failed to alloc irq desc\n");
+		return dev_err_probe(dev, irq_base, "Failed to alloc irq desc\n");
 
 	d_info = (struct irq_domain_info) {
-		.fwnode		= dev_fwnode(&pdev->dev),
+		.fwnode		= dev_fwnode(dev),
 		.size		= 32,
 		.hwirq_max	= 32,
 		.virq_base	= irq_base,
 		.ops		= &irq_domain_simple_ops,
-		.dev		= &pdev->dev,
+		.dev		= dev,
 	};
 
-	port->domain = devm_irq_domain_instantiate(&pdev->dev, &d_info);
+	port->domain = devm_irq_domain_instantiate(dev, &d_info);
 	if (IS_ERR(port->domain))
-		return dev_err_probe(&pdev->dev, PTR_ERR(port->domain),
+		return dev_err_probe(dev, PTR_ERR(port->domain),
 				     "Failed to create irq domain\n");
 
-	irq_domain_set_pm_device(port->domain, &pdev->dev);
+	irq_domain_set_pm_device(port->domain, dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
-		return dev_err_probe(&pdev->dev, err, "Failed to init generic irq chip\n");
+		return dev_err_probe(dev, err, "Failed to init generic irq chip\n");
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
 	mxc_update_irq_chained_handler(port, true);
 
 	platform_set_drvdata(pdev, port);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 }

-- 
2.51.0

