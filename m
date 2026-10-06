Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF3E4071E8;
	Tue,  6 Oct 2026 12:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290047; cv=fail; b=Jw/+4XRUYHQaQ2xR/XAF2RssOYlzR5KG08fF0g2jcBTAjsaVlmillJ2vJ1q6HtMC6wxb3LyytORcm/GVuIj3ppb+ZEMBdVUbV4CpaOGhLJPq7kRfKqOVIB/vvkfk/efEydPqyNt+SD5WGflveS7D78UZCCanEHqT0A9Hefm/fTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290047; c=relaxed/simple;
	bh=mQjRL9F7+MlLyR9JRkAYbk4vofYqFN2AHsUZqaZe4cE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=q7C99r8Yf21HqUMp2kpBu/qNDmTghXXSQvbN37V7ij9hmqjU6ExIThSESfqWrIfU0+igXNEg7LJW68tqkV4Vnl+VeJY2xxe3LFiw3DJq3ny2kVWlXpY2gCXEYnq2Hsh3p2qXIKx/bUHg9Ep1oOZjL362V52pJ78Fs++Ey1Nrp0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YpWYwVFy; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YpWYwVFy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJlCGjhikcJd5Yf0SX1dTo5X8pNiBlsMFYGOA3Yrs2xxQAOpiGEUk3AOIPhn1U7og7k157DurEOk/XrFINzCsPZagDyXmFBHDjCSPhiPHv8QHRT0FMsHiPyUhrA4sjEQC0n1DtWv5TouprJC4Kl0qfsoaPvkwxYQcNbLiaoucNNULC5yJLjBh5A60sN0xou8wbds54B5MjUUOfqHlS9hvB0o+pUdMKWSHp00avVhRhtjN9y1+6nJNb8cEzwTuO2/rYU+PI0qSwueIQ0/gwkLfp3oEZntxaNrnAe1xhXg//DJxdUnaUjehgaqw5W1OQqDoaEGOxKZPvIOsiriC2rLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVHyCJ4uAcDCzln8UtPn9NMnTZcZeh0H7aLRQ6pnmcU=;
 b=b4Obva7QIp3Gf42gvxOGHirXIQoqeJ21fxOGOPWlkEqwFfoOHLeKaqNJTJk5xNfk/N5HxpA2QtUH5lFJbXJl6KmJ7A8BZuactMNSY8XRV/Dcs+INXSG85C1NXRm4dwJVhac78CNZhKjEJ1B37ieKr8L+Vi0jNaL//LeREv8vHppDw7xWRKnA7HIuW5VWTgCKk/RkDaH8F/jtsQMWd/EwyVOoPN+zMVZPNZIq7L9lS2G3xN1+YAAUiF2we3ZqQAVsnvROevkCEsTs4ul507xSxCqcIJ5hha9J0q1wnzQxkGHtLRQXryA7AupoSrscJc8uMvETFwdn6v6mMyPZUga8ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVHyCJ4uAcDCzln8UtPn9NMnTZcZeh0H7aLRQ6pnmcU=;
 b=YpWYwVFyw/UWTPXgaB0bYxxBmcyIVfQAyAkoYDY5RVfY0TR/snpPfktjCVkdkNmjYcx11+SwUVJ9lnzCOlNbj2fL4tERWzbylLfZdHNPRDdeW/qTzEauiJPoN/CJ5k/3aDe11DT4PfACnNdNNmrgs5BgWEs7cMb+/p1i1VVyK36zicPcl7QP1RkZoVuyUqWY2r+zSKCTRAPVUJ5OrdfxgusCK5ntGcRV+yG+gyrflnJThpA3IsGFFcVZ/czEtTiD2Sjg1UIg3NtEGvt6QWHFLcFmKFDGikZW+3Sm5BPGeW49ignUYY70CT2BdC32kpSS/qKcyRxrvpJv74HUU0I1tw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by FRWPR04MB11246.eurprd04.prod.outlook.com (2603:10a6:d10:171::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 12:33:58 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Tue, 6 Oct 2026
 12:33:56 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 06 Oct 2026 20:31:06 +0800
Subject: [PATCH v3 1/9] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-gpio-mxc-cleanup-v3-1-129f93302a90@nxp.com>
References: <20261006-gpio-mxc-cleanup-v3-0-129f93302a90@nxp.com>
In-Reply-To: <20261006-gpio-mxc-cleanup-v3-0-129f93302a90@nxp.com>
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
X-ClientProxiedBy: MA5P287CA0136.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|FRWPR04MB11246:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c16e5e2-f79c-4039-fc0e-08df23a61704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|366016|7416014|376014|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Sy8dKfzc/NByE+o+5krYW23THXd/lQ1BMoByFGBCL1EfvavPVA+lLjzRmM0UFv+/nfkluAVH6o7TGX84NX0Ds7Sat4wtoGk73yvz4E795s5GAMe3K3mxrNzwcPFodJErITfbvmvd0Gml+RF0Mbspqox0xPE2JfxYAOvhg53paxbcUNDJajN7aDde0J1QPv/oYiRNR+TkMfyWXwKMV6MpJEknCScqB4V5c4A7CIazcSoNdqvy4VjgFdON4u66SfE/DndN14Nk3bk2XTQ8vPu37ZnE1dFksmq/pwllW6EY8CWoCbTZrWHY2tH7TERvirvKoEpSnDLvXH0m9bIrMNw2nLY/Blm9EyieIeGi8WN2k6zEY4336rGGPwYL3phvGmPPcZCP1RBLoUi6oPWYpKzj9jQJFDDB6MjC58paxNMEAfJF8p6Sk0A66J4Ie+52S7diiU6r2QwFikmeh3Cvnljfkbguk/HMiFt6SEcW68jKjKnBKC9zw0kxRAST6RZjM3hj665YmhPepqzR52G8ROxhklumi9fv1G/hVwITVJoaCZmFFqAlE3Z8yo8084Tqi3AWiW60wDYPQahpqY0CNVDz9HLNh8NCGbtgTfFGBKhz7QroGu3es1dB9n7KOPJ1kvZFs/3XAsOz9mGieAmOSJrvTj2txu7GQLUZKN8OT9QgJPg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(366016)(7416014)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmdvV0FyK0VnV3BNcVdGMHJWM0t3Q2NQdk00a1pabStuZ2QzTVpiQ0JTRklh?=
 =?utf-8?B?UmtRVGhkNTZtUFlBYk9xeUMxc0VnSGt2bC9KWHgyQ0xCVWRSV1UrZm55TU5W?=
 =?utf-8?B?enVQWUJhenVtQUlNVWhINmIwRy9FRzB6YkFmL2N1UnI2U29XWlUxc0FrdGxI?=
 =?utf-8?B?aDBDWFcrY29BL2YvaDgyYXZ0NkZWc1ZIYSs5dklPS2VTUUhjUitDSHE0YWYy?=
 =?utf-8?B?dkhaOW1wNGZlbmRCdnFGdkpyTkpVczNveWJITmpUMDA4YUsxRFJVOTE4bWxV?=
 =?utf-8?B?dHlvaWxYWTA5ZU51bDlTVzJMOVJjVjlRSG8rZFVoTUtVMXJlL2ZTSEdlbGt4?=
 =?utf-8?B?NjdndUFPdFd4dFozQzBrbkNuSkZ0SjFyMWxXN1NiTjJsS2tkT2dVRk4vUmZB?=
 =?utf-8?B?MVp0VUNtcVl3eDlIdUJlaC9RMG5NS0xoaVNSbFgxdi91TjAzQ3hCdnZYVFp2?=
 =?utf-8?B?TjBNUk1QUkU4MHNYbFhMVGRDNU1lcnk2WUhRSjdrb0VVYXJ6TkR4dDhGUFNj?=
 =?utf-8?B?STlVS2xaUWxuTnVseDN0L3BCMm9aU21rNWk2cFpmeGNLSnJPblErWUtsbzAz?=
 =?utf-8?B?OEpBRE5mN2phV3pRbmd0YWV6djF2RDVBZWJ5ZW4xakF3S2wxeVRUKy9Ea1pa?=
 =?utf-8?B?NngvV2JzNDB4cjRXRkRUZVZtZkRDRjg5TSsxaE0yK3BsUzhHalJpdE1oWlY2?=
 =?utf-8?B?a3Jpek9WWFVCV2pmc2lUYzJabjVOOW8rekZpN2xqZnhsQmVyRG1vblhDVVJ0?=
 =?utf-8?B?QjFUQkthb1h4NjJwNXZpOXFWWE9sb3c5b1piYUFOU1dyYytWUlRNMGJqdzhV?=
 =?utf-8?B?RTRBYXBnMGVHa3p4Z2ZVSG9GV0hwTlFIekRvMWxzWE1aQTNxeGtIakZIOVB0?=
 =?utf-8?B?TVVuWnFobzh6QXFGdWxIVlBBcG5oeW04bGVSQzMycys5L3kyZnNKTW9aQUhs?=
 =?utf-8?B?NHc3ZVBobjNTYnppSUV5Zlg3U2YrMzFPWDZJSVc3UitFbXpzYTRJZDNuSlBV?=
 =?utf-8?B?UVhFOFVWdnlMVjBaUjB3S3lMNThNaXNoVnNsRlh3bmwyMkZQS0lLcHFlOVV3?=
 =?utf-8?B?VlFiMWhkTWx2bGh5enJkbjh5S0RCOFZLeGdMc3M1YmdwajlFRUN2L3pqbGRK?=
 =?utf-8?B?djU4SDBRZXIrTm8zbVZKQlFNMzR4dXhGSG1pNjdXeXRMRWRVbHYwTkcvbXNs?=
 =?utf-8?B?VEtWbFRkWjVjZE5mNUhiSXVTQ0FaZXhNRFBvbnRYdHpDU2tVMGlGZHdFeml5?=
 =?utf-8?B?dW01N2hkZlQwWHBaWTlzUmVQUEJOTXcreWp6MG5Ha0thM1k1VDl6Rm1qeUlk?=
 =?utf-8?B?NGV0ZU84Y1pGZ3BDdnlhaDJCR2tEcldSV0ZLYk9XOHRPUExZZFZLMTRieW0z?=
 =?utf-8?B?c3NPQm9CTU1wOCtvcGdwYkFXeXoyNXh4UVo0eVVrL3FBRmtsSlJBTmxqazZN?=
 =?utf-8?B?MEpPRlE5NGJYbGNCR3VnWGcvRFlsWTh4QWlzZHV2elF2S1prTVhEdDdwbFRv?=
 =?utf-8?B?NXdCcmdNUGN1YXNMTmRVS2tEMEJjK3RuZmtPK1p4RU0zeGt4V1NPdkxlMER1?=
 =?utf-8?B?SUp0V0tjVUNVK0R1L2JnQVpQNVBXU2dxN2tlNnZSRmRRS1ZGNyt4LzNXRXRn?=
 =?utf-8?B?ODN2NWh5V0JLS2d5OXNsNEFZVHFyMC9SOE5yWlVSc3ppV011a2pFa0tMTVFW?=
 =?utf-8?B?RGNxWHQ5SE5FU2FteWtBaml1T05kVVBkVGx6TU1SWHBVaUlKY0dMMDh0anMy?=
 =?utf-8?B?QSthSGR5WXpRd0dBTzBkWTcvK1YxTkMyZFFTWG5Pbk5zemc0ekl1cUNUNHoy?=
 =?utf-8?B?dGhmTHYwaTZzbVNuVlp5Qk95V010SGNOdk5mTzJKK2czLzV5YlJmU2pyNVRM?=
 =?utf-8?B?d0hteGZSY0lvK0ZRZTRDcnkwYjc2MTc2V29wV28vbTU3YXM0ajZ0R3VFL3FM?=
 =?utf-8?B?MFdCOEJyZUVHSHVTQkFqQTEvV2RyOHRNZ1l0clRxeFFEQVI5clVEQzB5cjFK?=
 =?utf-8?B?cGcvazhSYzRiSkcra2cwNWdxZEZQWHJQUDZPRlAxWFNvSGFMYkUxNlo2aWMx?=
 =?utf-8?B?eDI2c2N5QTJKejhDL1Vmbko2T24xbGZDNEhKNjRIcDVPT1l5UW5qRlg2WGF2?=
 =?utf-8?B?MEE3cS9sWFlxNmUrSkJCb2RUaUVHUDFVVXl3U293WWhXaS9Ld2Q1WGxONWlj?=
 =?utf-8?B?NS9TRDd6OThDZTl3S2daZkFEVmtKcjgxOElZVnY3SjFOdUpESUozRnJBc0NS?=
 =?utf-8?B?WWd0cGFaeUtwQ1BlS29YZTB1N1NQYXB0a2VkQ05YZWl3NTFNOE8zT0NJTzJ4?=
 =?utf-8?B?WE1wcUtIRGxjbUJSWG42QmEzQlYzREpLbXpaTDRUTnNrMVFBdjRqUzlNOVFw?=
 =?utf-8?Q?Di+5QpZAHqKOb7dL9XCKvesSFX5XaI6gww1gC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c16e5e2-f79c-4039-fc0e-08df23a61704
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:33:56.8849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pc5BjqKNusqcUmc5lhmGjyW1uQAit+MCirTqa0aWmMx3e9AmLBY3wfhmfPoPAunJP4ZxTgQkAUTI8hkGSY+7gcCCekyWxsrzhypv+ivpaz9uOsjKIQ9n/+JmcdXYZQCp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11246

From: Peng Fan <peng.fan@nxp.com>

mxc_update_irq_chained_handler() is called before the IRQ domain, the
generic IRQ chip, and the port list entry are set up. If an interrupt
arrives in that window:

 - mx3_gpio_irq_handler() calls generic_handle_domain_irq() with
   port->domain still NULL.
 - mx2_gpio_irq_handler() walks mxc_gpio_ports, but the port has not
   been added to the list yet.

Additionally, if any of the subsequent probe steps
(gpio_generic_chip_init(), devm_gpiochip_add_data(),
irq_domain_create_legacy(), or mxc_gpio_init_gc()) fail, the error
paths never unregister the chained handler, leaving a dangling handler
that points at freed memory.

Move the handler installation after all its dependencies are ready and
after list_add_tail(), so the handler is never live while the data
structures it touches are incomplete, and is never installed if probe
fails.

Fixes: 5f6d1998adeb ("gpio: mxc: release the parent IRQ in runtime suspend")
Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 7e2690d92df6..e05f276a50e8 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -474,8 +474,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	} else
 		port->mx_irq_handler = mx3_gpio_irq_handler;
 
-	mxc_update_irq_chained_handler(port, true);
-
 	config.dev = &pdev->dev;
 	config.sz = 4;
 	config.dat = port->base + GPIO_PSR;
@@ -525,6 +523,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
+	mxc_update_irq_chained_handler(port, true);
+
 	platform_set_drvdata(pdev, port);
 	pm_runtime_put_autosuspend(&pdev->dev);
 

-- 
2.51.0

