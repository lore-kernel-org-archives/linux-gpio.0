Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013065.outbound.protection.outlook.com [52.101.83.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54D94F85BE;
	Fri,  9 Oct 2026 18:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569311; cv=fail; b=agvccxUn0Mzhe+F1boR9jJGqePRBtJxCKFRxZmR9PTr//eu1bgc9gSIpIioUT54sN/wiKeSfSb7HkHR0FFCH4QBjgGp9Y3HVIUDogKATtsspt1lRua6VQvivOE94uyTd2+ChJ5R4icjV98suk8qWgXJHeuYM3EOz8ZObczgq2sA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569311; c=relaxed/simple;
	bh=mQjRL9F7+MlLyR9JRkAYbk4vofYqFN2AHsUZqaZe4cE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eXX7a6jXwG1vpNqcNKTtYg8f3yxCuNnCgM85aI/gV3wfqPzuZB5y1F6zGw0AVrEei8tX3rVeTrSO9Y5tXEiHbzXDXGmalqb6YHEeHrQ/ry3C+jAHAIh0KbewoqYeyAYF4BKZBRAZyGreCRNyDn7/wy24dkqRxThjifw5cj+MGjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tTk+Epj4; arc=fail smtp.client-ip=52.101.83.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tTk+Epj4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dsa29TWuBxMky562jStV+TdJ2jDQ87fxDYV2cE5LGaUimAgqpfbN3gP0PArqj2Pavs7J8Ug4stpb4kuqH1Ptb9YztNzCfAsEssIpPti+S7fgQAVw953ppPs5yidZ10X5Yp89L6rfFFY/BfXYv0Pl3Xx7wE1YM7+68O+5jqXE7AnFn7UfA0Y++UntrgP/X51TBPX4OQpNNmoDYTtKtBSxld+DOXaPdEalkpEcef3j2YzjI7AozDLgvgXgxK2i9O963pYowdr1T/ce6hoR72xIHMvyc+If4xkN5zhaVf7VRaaLHFKTD4+tYwOLgPY8NR+/EOLkZpGpJcvNKCWHKg1F1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVHyCJ4uAcDCzln8UtPn9NMnTZcZeh0H7aLRQ6pnmcU=;
 b=WfcYYYe21TmC3RrdvjjlctYVS7VH2OInlRgAY383QTEE3RywFmyTq3V6VOsMi8g66Ey6/Z/eWkhsd6cQBXAxeU91JrRknLOP4neUX5/ZjCtxCS7zfAaaChhq5yQsUX/vZmdfPmrMzs3OQdZ/pJeo2SVZVIycUTkbwhMfjq6oLfaV+x11PcvyiW4neMIwfP9juV4usTckng0bars2EUZF78cOZGEPEcB9ehfBZDCfnDOag+R9tEXLhBh3WnnPrtToILr7WUBz2e4TVeBrwZW4g2B1Qc/mApmBjZ14ODxAvuYd27tZbBBXyPCMHEXghQRvlOpWnzz8zYgf24CKRqAC1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVHyCJ4uAcDCzln8UtPn9NMnTZcZeh0H7aLRQ6pnmcU=;
 b=tTk+Epj4Fz3Zz6CGWgTGekR4sJZj7uKo7YYHyVAsx3ooFOL4OgwbUg3G9IjpjX5/P21Ofs6qPktcy/I9b2xJNvucXRxQcOqup2susp4AeVBZ5+z7+LZTzboHAgkWcfTRcbZ3qQAYmYCRtRX/ujH/v6WE7dnBp1zKVHrOMfmjYkSjX8YW0BXCa4dmebUlqDPzC4RkZQIioqLTyPmaLnxXWf/gz3c+wFYJ5f8JH2QlY6MkWxRvBS+MkEYVTxz3I5DZp3lu2NZevSnAmpdGYn05x0qZ/zUgpoJscseZ9oGHLI8qjeuS5HQKtpqKspyBwJUPs7S1w+oi1/Mtw++vtGMw9w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11189.eurprd04.prod.outlook.com (2603:10a6:150:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:08:26 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 18:08:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 10 Oct 2026 02:05:22 +0800
Subject: [PATCH v5 01/13] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-gpio-mxc-cleanup-v5-1-1e59e6ddfa00@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11189:EE_
X-MS-Office365-Filtering-Correlation-Id: b719e2b6-347f-4cf7-6e77-08df2630509a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JJi6he9m+Nrq9sEk/9IaKFq39lOcMnDhpRVecNBf07QC3lRbDgkrDHFXngYrUQ3QMNvPcpki0GRd8TzHospL7ff/IFj/GWsM/7kF+eaZ43Uw/6KY65EYRkS9yDf3NEOudsNfTIlrkND4hgft7hHERC9uByLy9e9BeHZXaQpr8+YFGk1P9T0VydOkHM+4ER37er0VXXiKUgLtDVx/+ghbsFQMHxukBOV6EfTNxIFprXWiZeaRKMH3McSYXhqvxZ4leINU1VejwFxFY6R1cxBABYqeoXqTbyAaashTKVdkZo7EmuApOvlcbJbgOILcebIDs9LEL/mz2VT2R/d6u+2TU1G3ydRnQ5rVvfVa/H9/6MZYnCniUoIhQykqAHf/dleQeod3I6J6hqYH70dVdxFqSzJ3MqKY/wfkWa3IQsOPlSb7X+OVn1IO5Ay/8trIEtse0FTBy0PoklCs2iz1k2oXeKv/wP4ZCgcgOB7iNy4mNXYBqaFOmczDra15+pj1mqNRYCM7DPNQ7nFVvG7IASN/lzFN2kcGPOpZLHFCgM6J0DirWFy8hlnFt4rMlGYHEmomfIpb5QvJGt08JEh+8Oe2SJZgBBn4tdueXtfDVtE6iOz/k3t4TrCc4Y6fH3e/gSoSv7Wn5O2dKWP+GhFWt9Rqi9HVYWXx+5LawaLkAPyP/Fg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmZhcm01OGxtYmRjK3J5eVJzUWplb3doMzNKQVhQYXNuTk5rRWJrbmVaTXBY?=
 =?utf-8?B?TGxqQlJQam85cnNkZkJuQkdMSXlYcXhxaGtOcm50Y2IyUWcrbjJpcVl4T1VO?=
 =?utf-8?B?UzllZ0VVczcvdVNOaDVDTU02Yk5NZFA0K3lIZUZyc3lCRnR4YlZtZ2YzZnRm?=
 =?utf-8?B?blJKWGU0Ym9KekFtZDBJVFE1U2VCa2JjZ2hrd3dXNERmaGxEYWppWTZINTRF?=
 =?utf-8?B?bE1FMUI2SUpGWnAveXlxWXNuKzJvWVh5T2pXeEY2VlljNEJ4dERocVIyMDZ3?=
 =?utf-8?B?RC9aN29QRGVzK1VxZHgvMjcxNkR1M0VmaE1RL1l1YXRKUXNYUTRzemRPMVZO?=
 =?utf-8?B?am1qeEQxM2NZWU9hSEo5M3dGVGNvN2ZiZmI1MSt5c1J4bXZRQUZOOERLVElG?=
 =?utf-8?B?dFZSZGliZHBBNXB0cjlxbnpNVlNGWk4zeGNXLy9ZQXk3a1Z4L3Bxb20raVNm?=
 =?utf-8?B?SnFUN0ZPSGlhZEk3OFpla3k2RFhNdXpEZnlIeVNqb1lzVXdKYUoyUFdhNkFk?=
 =?utf-8?B?NDF0c1NYN3dqeGdqVkxCRzFadHNGd1BFZmJlOUxhZG9TZ0ord1FGN0s3dmF0?=
 =?utf-8?B?WmRmVWE0NTMrNzB4MXJFbzhzVUhIT3NGM3VtWWcxS3NFL1hyV1h3YWoyRzQy?=
 =?utf-8?B?SEJCZSsvVS81K1Y1VlhDdFNDUUVGVytBVUJIN29zSHBRZ0xVQ3VzZXA5VEY4?=
 =?utf-8?B?TUVOLzFkNzl2ZTBuc1gxMldNTy9DMWwvRkt4ZG5KS05HNlJsSURLUmxmeTZN?=
 =?utf-8?B?MnZ0QkNoMDlrVzFyVHNycWpvTDduYVNrY0QvM1pWQStubmlLMEJGZnB5Wmtm?=
 =?utf-8?B?KzNTMmQ5MkRoUjBvQTVob0M1YkNRdlAvNE4vVGQ3MmxQRjdTNk1PK0dtYlpL?=
 =?utf-8?B?VHJVQkliRXQ3WXhGUWVsYk8xN1Y2VDVKeXZWTHYrQWxJZktjdzNpVDdoZSts?=
 =?utf-8?B?Tkx6aTgwcnJnRjlkMDlLbk44eGhpd2hPU2I5c3BVTlhiOHhrdGVVTEZ2MHlC?=
 =?utf-8?B?dVUzRFgwWm54NFB5MGhwREE0WlB4UE9WS04vMzJkd0tJV2J2L0xBdGJNK2RQ?=
 =?utf-8?B?RlJ3QXkxT1AvSWozM0QyZy9vVjJ5L2NjNllWdnlub0d3cVNjWTlCVUZ5UlVF?=
 =?utf-8?B?OWtYNHJ4azRuaXJuUkpNeTEwNXNVc0VTUHphZ1lTQWdDNXJjbVI1cE5tdWFi?=
 =?utf-8?B?T2IvanAvWmZrb2lqZkw0bDVjaXFReFdOWEZyem13clowSHVNNUVqamhrSnhO?=
 =?utf-8?B?R2k5TTVIMDk3RnlLbjFiS0xJQkZ5RVFYcmxzemZGNzdkazFJRVgxM3lhNFh5?=
 =?utf-8?B?d1Z0RVFPWEtIVkhTVTErUzJHcHkvWmVmZ0lhbi9mWlNIeTcrZHY0UkRieFBj?=
 =?utf-8?B?N0ZvUVpyMHoxeEREK1hHYzZaQkxxMm1pNXJnaWVKQ0RZTHpxeWZHbFdIUGYx?=
 =?utf-8?B?emJwYXZ6Rlp3S2tmaDh3RW9MbVFsblYrQXRJOU53MVBXd1Z6L1Iwd3plejhP?=
 =?utf-8?B?N2dSZ09XdlRMVlozSGx0ME9wZ3g4cTBCWkFNaXJRbkNmcTl5anA1bHlEQUwy?=
 =?utf-8?B?cnp6T003YmhTWCs1a0NYWTRvaDRhZklPZ0lhQ25VQW1DSUxMZXJPc0FUby80?=
 =?utf-8?B?RSs3Y0QxWU1jYWgzYkpCbnR6blVHcHpQKytzZi9zNmpHOVMyWXhJY1FrSG4z?=
 =?utf-8?B?M29MZDhhaUt2QnBrR1g0RUQxUVhpbmxldk10aVlYRVIrRUlRdkZQZGc4VTJE?=
 =?utf-8?B?bEFpWHFiMXA0dzJocXRjQ3BDTUZXSzAraDZqNVNveU5XUG5oRTZYUGRCQkRG?=
 =?utf-8?B?Wkh2K0xjcWpMeklGdUFXSkRBZmcyckRhckVTTkg2ZmJTMGJBREZlYjEzQVVj?=
 =?utf-8?B?WU1JWTY3RFhncWh5dXVieFFRYm1Va0Y5ODJIb2VKRkxueUt3OFFlcXh0Ri9C?=
 =?utf-8?B?ampsTU84cmZWV3g3MGs2cEd5bENHYUdnbzQwdEYwL0ZlejBlTTdtUUJVM2E5?=
 =?utf-8?B?YjhETEE2REtEUVJicGxUbTl1TU9JaUwwU0RCeFk4dURtKzZlVjRjUGh6aXp4?=
 =?utf-8?B?YXVVUUNqTlNJRk1LU2sweG50azJUMmVyN1BhaVpJMVJ3dWVqcmFKbEJwdGl0?=
 =?utf-8?B?Wi9kTHRRRmg5OWwybFl1MWRxcldEL05VNGdGejB6aFZZRkU2dG5MM3dNOXpx?=
 =?utf-8?B?cm1LenpvR1RicVlZdVF3T1R5R01jRTg5Zmg3eXRtSStQczBsdkozV0pjR2Q0?=
 =?utf-8?B?ZVNKWGw4c01ZMVFLYnllNlEyZlJMRkZSM0hUQnhyOTJ6a1h1UmVCUFVxUlJG?=
 =?utf-8?B?Mlp1Z1lmNE1NeVp4WiswM3BFempDSjhsR3dWaFpWZVBBZkd3SWk3WnRMc21O?=
 =?utf-8?Q?2+vHJ0ugguaKZYsi7V5RPlovyXGJNqQ8vlmgs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b719e2b6-347f-4cf7-6e77-08df2630509a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:08:26.5119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTSt4yAmSIUZVVP4EzaoIJ2EAa6/zqtiZoRNWr2pH2kkUOjjc1Mg7Vpg3ccRkiTlxAeRwPvy4SVb6zR54cFD4/W0GLOtrI7ATQhhYg6/WffERf9ytibxPpj4IwkUF/9d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11189

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

