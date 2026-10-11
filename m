Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC4A3C0A17;
	Sun, 11 Oct 2026 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719651; cv=fail; b=YUfUzecHh3Ya/NpOD+UeenM89a2dfjlQNExPdsRumf/3mXYjhw2t4GvODzq8mRl8l4ipNabchgPl7cpLzCXAHticz8lB/u4SbzP4R8d8WBgJO/jDVXejQEP3T5wiHtZIcqKIXPGfWBg+9FL6FVZLH1ONibgDEnWuph8J63KAdA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719651; c=relaxed/simple;
	bh=C3BIh9NUo13YY8YkUh9aZDMdvk5UvTlHig6YXgBDeZI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XeDFZRsPPBJx4yXZ230maKQcm6sJSeanwR9K6iTU6Jba/P8H+K0btHf6TYdYrIYC/I43sqHlHB4QFBClkhH8R5cUWru4p0vrvElXik8PAHZokmRA9Mtzq96tTvHdk1K8i0a5vPmRNmVh7LXL/oDM50pGWktDJXlX/kYdCkRKTe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Uon7lz2u; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Uon7lz2u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCMWYK0+ywu4gcHxAMIiuGxr643T43evHYLs4FJ141l1PtTjWfjIZlt4bz1x2Ttjp89zjidWQzfXOwiiNrXut1R+ghTaQK5qk8NJdEn5N4UFimtYXY5zsJIL/IiGTWFhtnzkLh/StLZAl3wElYhBICRHDuAAxlMbLf7Tbju7GHk+8yJemjYf4T6SUEViUMbzy3fnqlANVMTx+jVzak+RTcQgnPRGJPRteGbDyPg2yaKtH9cZTYxC9ZKlAeIFRi1gQ5JTc6C56YoApo4avz86C7fTEdfbEL7IwfDozsQ0pjsfxup3CFMxdJq+Z99GdJ7gp64ybZKMjUjItSzGlTFlnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yn6Z2tEpiixfSud4+mHjQArCwyr2AvInnPP/lKF5bTU=;
 b=tUoKOfjSx07JN7iNQXHlb2bsQml3djJy5q6tQt4KLJCZ9yf9dNrnLZLuV8nrHAA949ih9DaPqDqQvtjEibMMsH4QTINsMDwnxwHLWw/uXKVlcH0VpputU8vnFl5cHfKAPdYVdE4A2Cz4YN7FH5ZvayGXvXFuM+jjsUfJUurrwlphCBA5CeRNkWNmIiiVWbmdD5dO6iTGNSxGNmg1JvnYMU0GOWQfXU65DhY/gFpafnTXqnh96LhtnVv5h/nhfeBY+Msbjduq2KCRGbnvHCRbYCn+/kIX2aQj+0AmnynXUffUoQB6cHfa6QCLDYubEmVpZbUXfSUlAHnVBYPCHmZUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yn6Z2tEpiixfSud4+mHjQArCwyr2AvInnPP/lKF5bTU=;
 b=Uon7lz2uzOzqyT3C+VMZohp3PJNDL0F+yis4/sc97fosF67nHKIuxRl7IKKr7yASjEADF+I98IyiSBbH6AlrZuGxftsWwuN7gEUK44Bwk1odYERTENq/bP5K9dNuK9lxMElU4m4J/UorL3G2CU+975TKbPKvz3oPwGkuQuHSqfIT+zLONwXZxXB/4TibFeMeb6R0HYNTiM/iqNC6X5jvn7uHAnji8+gRFmkNC0pREiM+IVL3Hc9xY73D6tXmHpmg9DTJWRbOS3/JmhNFESNZg8rsQ+JqizNcA4sY+halm3eKWt0f+Gj48VAOPi3Xs1bVqYHaUQ2FMV1KiBnr3+r1Zg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:54:05 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:54:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Oct 2026 19:51:22 +0800
Subject: [PATCH v6 01/13] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-gpio-mxc-cleanup-v6-1-cb47ce2ad758@nxp.com>
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
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: 503a24ac-2694-4e33-d6dc-08df278e59d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|261009223027099003|261009221227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	mpWPD/cjgXzoalVjyNO/Vj3rsRYFo1Q3VsyVFqXIFcEhWA9iGhQjOTyBtN1Lk4tjJTGoCQfxw6mklzCcz7+7/DKv8VF8rBAG36a8GYokuzlVHzvmaezqKiSTPbfqQ/pIXdHZTsBaBw+G8kftQ1SUYZV7XwZUcwOna+K6MLM4hAUnfjj8WDAxgbCRf7FUsBiySrYfuWKQ/wYSOvlrHKbA1ZxTMQhYQBNytWs1XvYHvxgx3ZIq/2pOai6FwGIde9yHDq1YZajykl5Z+rx77gKfV65EVDlOkODncOizzBK9IhzpPbd0Cs2q3MUTCqRd6ksefsfEmRv/LzfN7glkw/Ik0OyojfnfuNGID9rBbNL+jNKG3ss05sDQLqmRigXIFj0x3oWMJQN/Gb8Gm+i0ZlDOow5IvY+8LbCmGWOeITIeXb0gRJ7Cn8sRnEkptOWe6FUlm7zwU7S2YCVM6G7mHmYfNPtCsQTtkgxWaVdPNNUg6Pvg+bwFlRJ1GBfQqlQoezaaYs+Yc9DJGRTwk7i4fmy2HeLC+y/o1rLcmKT3puzBhQCjAdF6CZJ4648a97jTjSbZQxpBtQ5rdqWUwqWSY2tCGicXrbIRVLHpsT4jh8u8M+2vJf3iIAimtkcGLu4D/xgc1116m5DR0wJPgD4VeX944m81MjIh+xAmb5CTyq6dwx8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(261009221227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHUrbVZFcjJhNG0xa200VDJ5M090Z3oyTlpLWGs1aW9SWm52S1BlSWo4U2tt?=
 =?utf-8?B?aUJjdDJMYVJQZHNKWkNhMm1NRHBnVHV1cEx6VU1YeGNVS0VVWWZZSFVSWE1H?=
 =?utf-8?B?TkJEeFhHc1RQWVhhSzJGOC90emc4bnBtNEtFdFdKSEo0aERNSFNDSzFaUEZa?=
 =?utf-8?B?aWNDUytjL2RCeDFCRWZlOXozQ24rbDNhcHE2RUNRcnFJZUhzREgrTVZCZ0JJ?=
 =?utf-8?B?Nm5kbHhaM2ZweXp2djN0WDJqYk4rek5LWHZ0WXEyd2Nvb3p6Szg4dDF4M3JC?=
 =?utf-8?B?N25BeGYvdFgyS2hMTk5QUkRBbHN3UGN3TFVCbmc1S0R0RFRWdnVkeDlyc0lq?=
 =?utf-8?B?OVkxZDVkVUVLWkl1cjZBSE1BSUFYdTg1TE9jMW82aFZOMmVJamdtRWpRaUNO?=
 =?utf-8?B?emlFN3lpOU92c0FWMVUyMGs0L1hGY2IxWDl1aTM5eFB3dUwvcC9XdjFDd2pK?=
 =?utf-8?B?Wk12eFdMOHFleEVmRTljc3c2ODNDV1hGRlVFYXhyOG4wZk5vZkdpRnkvNlRM?=
 =?utf-8?B?VTlBMjhHdVFJcmVXUmV3dVlrbllWTHhvUTNvTDVKbStuZy92RW5FWTF6Z1pJ?=
 =?utf-8?B?T1BYd2ZESkZJUzMveU03enFQa2gzQVZENytyNlNheXpmbzM2Z2VoeG55RE1D?=
 =?utf-8?B?QjhEakhNMGhzc1dCTlN6MUE1L2Q2b1BnRDgvUmo4akJhMHZEZHdodFZwVW10?=
 =?utf-8?B?MlpRemRXZmcrcUlzUVdlSXI1U2lOTHZwSU5wdHRPeXlhM2ltRFZuWVlxVlFz?=
 =?utf-8?B?NkYzRVgvRjl3bmlmbVAvQkhSa0tnRUhNSGsxNGlEbFI3ZVNlZnY0WjRJNTh3?=
 =?utf-8?B?NVpidFNLaVB5VjFjNFh1bkdhRi9Zb09yT3UvRW9zWFRWVC9kT25UbGZUNEVR?=
 =?utf-8?B?dHRmYU5DT21nL0E2a2JnSzRod0NWRWFJREw4MUFCK29NUExwWVFGYVRWR1ZM?=
 =?utf-8?B?MEQzWHQrRmJ6clAzTGtUdTdWdUovY2duU2VuNE5DcWZ0MmMwRGdhRjMreFBM?=
 =?utf-8?B?UmtWZmJKSE9vTEY2ZlFlNTI0NTJyeGNTS2llcklUc0pQM1lLNEZqdkIvOFZa?=
 =?utf-8?B?L0UzREN2ak9lUXpXTkE3bi9wVTVKdVFQQ2hQUFdTTU1oU3pPNmh6R3RZYTli?=
 =?utf-8?B?ZHhiOCtRUUJWTXpYUXd2eVZjMU5MVmZhYzU4dGF5SjdtWE9HY3RCeUxNbFBS?=
 =?utf-8?B?SzE3cXFtRW5lZkwySHV5elBpS1dMOHZHekNHR2Q3TG9HcE56cDhBTXNBOTlO?=
 =?utf-8?B?QjVzWWlhQ0dvOS9WMGlrVUI3MFNCdjNMc1ZJd1NhOS9Xa1F3NExYRmVhU29z?=
 =?utf-8?B?RDI5cE9RZFdyZWEyczV2c0M5SnFrNVpZYmRDQWQyR1Bmb0R5S3F1aEpIdTZr?=
 =?utf-8?B?TVNnL0JvR05FZmk4OFNaTXRBVi9hblBKc1NpY3QxRzZyb2YzQ2poMDQ5MlFP?=
 =?utf-8?B?cDYvZ3ZFdkNhUkNMZVU0WGZ1eUxST01CR2UvdHdRSEs5RElTUDY3YWtjSE9k?=
 =?utf-8?B?TnhQeURVd2h6TEE0Y3RLdXNsbnBtY3dvMHNSRjQ5VVBwUlhnME5GemJjK0x0?=
 =?utf-8?B?aWJobDBVUndQaG94L2hUSFZQNWNGWDNnbm9SWHoxZ2dwclVKY3l1WGJxVmJX?=
 =?utf-8?B?cXZKMWZudWljencvTWFyMUw3bnZtMExTYzVGTmd6RE45UnZVbkVHK3d6cGhJ?=
 =?utf-8?B?dVc4ZHllYmF6RDZUV0Y2UUhNNlJlTVB0bWphalNNMitFUGU4eUNsUkhyS0t5?=
 =?utf-8?B?N21QRmxaWTI5UDEycU5PZWpnSEl2NUFWallHTElYdm5ONEovckdsc0c5SG9q?=
 =?utf-8?B?YmlMNzhvd1YxeDZPMnBQbjY0R1RkT1d0OEdtZ05SU3ZtNG9TcmRUYndibnhX?=
 =?utf-8?B?MnIzcjh3YVF0TmR6bjdNNXhjRU5INFFrMjJZcG1CcHlpdCtwZ3R3b2ZEVDRj?=
 =?utf-8?B?emp5cGpjaVNYU3VzdWY4dHo0d3FqMVJmaGNDb0djN2lTdWpJaVl3ZGF1Lyt1?=
 =?utf-8?B?MGZVVzBCSFoxN3p0Q1NNNURlZUJxMGo3eWVRSEZQUE9rZlUzZ1B4djhWQVJU?=
 =?utf-8?B?ZFdiREpibW5hSm43d3pkeVJSb3hHNTllV2R1NG5ZVUtQcUFvZVlBL3g3YmUx?=
 =?utf-8?B?d2JrTWxURGlWemxoa3NHc01SZFVxa0dScWtveVdjQng0REVwRFFjZHdKc1BY?=
 =?utf-8?B?d2hnT1BaQlhWeEdyb2tIR1ByUHdxNC9rMzJoUDkvaXFMWUd5M053UUJTcEo5?=
 =?utf-8?B?SGNyVk1OdUFQeXFJVnVBZEp2YTM3Ym5HNGM5WC9jQ2ZacTQ4L2NZRGZNeHkw?=
 =?utf-8?B?bW5GTzlGMlduZDRiSFJEZTZpdkt0Mk5Bczc5elFod0FTdzlHUVFFUkRkeUJZ?=
 =?utf-8?Q?VMS2Ry4fhnQlspImWbxmzznQ16w0a1BHMNW5R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 503a24ac-2694-4e33-d6dc-08df278e59d2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:54:05.7028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9PBqVVQAivZ0J/uRnfTItZhHqk7HtITYCxyAuGyhgBJlqJro7DXF18qqb4zYHq96ClOPz9+uNl6Sa2DoAR7XGClMdt73N8bhvYHWQ6dE6vaCMiU9b1aUoZROvZoJoCe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

