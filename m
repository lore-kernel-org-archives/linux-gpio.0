Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F2E439341;
	Sun, 11 Oct 2026 11:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719667; cv=fail; b=DPvMak55KD5AAs9vCYpgixCSYLLcLVA0zCgG78zKkeI9wxR2a2SKDXaabYbRFL1fU5KovJo/bJzeQLc3z3ZhlaG/wr/pFSRvo2rbKce3Ekp7wiexv+hQqd3J2xxC7nZRwWr5ekcqD6TqvAUPyOjd70k8E2+zC1rW0xt9yHJ0CmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719667; c=relaxed/simple;
	bh=RjrDkY5369SsU6IcSPuIJUzcUrnKEhyvXpttJT/Or7g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=g/X3fQYiKrvSwcv63gBzvMWqEsjoIV9yEAt5sNiUkL4tAdspypPuFFrUc6YFXjaT8BXRsYiXGLCkT4QR8lTlWZ8TLpU7L8L81ci041m3YstTMaiWjnTEtHFfkWiIYwlgjB+Yq83qWS68LX3qm3xT7jH52/REmv4wLSyVtJ3xUf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pMFCP2LC; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pMFCP2LC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwHF6bnRERwb4niMO+yst4gmhosSTXdurn6azoxJgvTyu0sDV6l8tB05z2Q2mO62FTYRz3glUb9nJMkoZxJwfDcB3n2wRr6kGio6sHeWXIfz7VqJwuzQt0cjtGf/D+bvgjhYyurs31PmmGbnU2D4HQLgOnc4W53+LrHOxrHWjDvFWbozOlUouRJzUGK0n2r2+7ErG/ikpiDv2SESc0Y18TKGaHsPZMWI8VAlMdFKW4E4uM0DmDjjezvKbGcFbs9MusuJY4xAVjWPfXA5q6a2l5YGU0WSMybetNs5E5shqLLcbrOEHHflUevHxA2ah8Pi3br9LFiWXgHb7LLyPaXZ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlEa5SoVF/dhk83KnbDqzxD779/c4rUxvOV9xc+9ck4=;
 b=aWMvngW+WlJCQ5JjXiVNYWHRZ9PPlOa6uglm1XW99yqiTt5jh36WXsy9xBT8Wqlh/l8Pson/u4LtuFKEs6rYlaPQ7G+7XGiQo7XZi06zzM9kiEaLQPxC6vCdhiz2QLExWmpl2abWMYxabKCjKZSD1ifT2a6X0NuBjIjq3jDxqFiAUBL1/cIak1FpGPXd1n1sMjUhOdaWHcvyDuX+koFXH5QSJockoCF/yr3NDxBxZYpQkrqGPtPfIieroMWYKVnGFNaMyYO47y2//cSLbir//47IrlFYQOTPS4IhVnYLqkPx+HCiLYBFu82voreZKZZMo7W+gWC8ZoXnMqx5n0bU4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlEa5SoVF/dhk83KnbDqzxD779/c4rUxvOV9xc+9ck4=;
 b=pMFCP2LCllMfdIqGyhtW6mWjR7wCeMW/Dj6hjRgD+6kQjPGZqy+vCFzr6eoptnzkqTu97IK4MW/JuKsgPppZiWL+uIJGzSKu6TZbOXW/yAwpAtaaJSAFRnVsXqesHAX7gAB2m0RPNiwy2ZGj2z+OJTlsrrWgNb453KtYIzBjEmUsnnLhfQihet9QgRmoYW4MaGDi6nv1opvUM1e6gjP6UbJmw9htRTfi1vg+RMNdoXOY1vauZaBHTSR8yRuBEJkLYWN6xvQf/lcnY4t2wE0q7AGiPXIRRj988lGZ6sgRq44FVFsPKyfLh1T1ldFg/Io5PUfeQDkwcWVmIS3OtWxBzg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:54:16 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:54:16 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Oct 2026 19:51:24 +0800
Subject: [PATCH v6 03/13] gpio: mxc: fix wakeup_pads bit operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cfd66fa-08c7-4a5c-0a34-08df278e604a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	w5cczdPwOsy/2Oj3kU8iPBgf6sIs0e9B9g2qVCw3QqL9Ox5OePmM4HqXMiMKT0o64E4/Jxjg6wBhwvP82UgIUdPrvA5O1dRD91DIQA3Mt+M1Mg0ICRNbzXQPa5cWQa5WaY7SEHb+67tW2HtQCyfdiY0cAZv2T3gowBapl63Pd6kvCWofzY1BZI0UIsbkGP9075UVcVC7MCcN99lbjp7GEGsI5eVeo1oupb0moSnoT2afTmm19YflzcZFkFHvsIVz+fkbqSr6FP5a73anWFGJFjvc1wkisN0lg1S5xXKlh8985C6MMiXAho4BggiyqdVhhqLgbFfaLeljG++io05Zpvw7RZYmCCNTLQLjykW4baKo0mX9L48U6Ljd9cvW0q9OjQHmaWplv/x3ewLz03KUKsXzSYKF3haqug5DtAAx5pe9CNLWW9v+kfpggjJOOjWAu8TT821EE0kP/yEQaixRkdqE8hDpEH7ApQztJcCIvA1d43KMgcNlYA1PE4DbosCDLA5UEXz2gWO605qnTIM4tueLafRdQTFso+aRwbnlpGDae6/NTQle3IaH4WEvkni7iilBwVKpGw2RYIi7Ib4D1pLQfKU6LRxDWgJ8xLTdGlP48myPB7o1brJnhkBx9GBBzWoVjvls/U+ZmZOZnlkh876U7rGhljnH1zdqBhFp6Ug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z013YWM4ejBhcThHSFhnNG9FRGFSeVB1Y0pScFJNeVN0QVB1UXF1QVVjWkNM?=
 =?utf-8?B?UEl0cnM2TFZITVlQOTRpT20veHk1a0xJWXNFakhiYnRZcXZnckpUTWFmVHF2?=
 =?utf-8?B?QlhTSEVKei9pYXZwYjkrUDlnL1lqaWhOYVMwZ2hOOGkvcTBuQmQzNlVXdXQ1?=
 =?utf-8?B?akVYYkVoVUh1WHRRdDkvK24xZ0VqUU1rY2dXOFEwK0FrVndSc3BiYTZGU0tH?=
 =?utf-8?B?TTI1UFVzbldRWXpDdzJtUGtEd3YvNlp0bXd5cnpYUm8waGlnYUd3MlgzQzMz?=
 =?utf-8?B?YXVFSzdhSFkyMmRjSFdIbGIvVTRVVUtEOUk3a202aTc5ZmFsYVhsbHZSTGxE?=
 =?utf-8?B?UXJucklSYzNhQ3FSUktWTkozZmtwMDFvNWRGbUFuOThHVW9IK3NCS09YVi82?=
 =?utf-8?B?R01VS2tPOG1OUEl1YW40NnNlT08rb0U4Y25oSzBsSHZCQk1VYzhQNlN6Rk5a?=
 =?utf-8?B?RXdZMzViRUxqSWJTLzgzTnN3VU5oOXhiYVNVQzN6cEZ4VmIzbkxYeW92VWNP?=
 =?utf-8?B?YVF5YU1BeXhkTXZQazBNSjAwSE9sc2ROUXYxd0QrVHdwUGx5cW1GVnBMa2xm?=
 =?utf-8?B?OCtkbmc5L1V5VHhZRyt2eVcrcTU4QjFmWmVaaGJhSlB6QkJIczZJSlAyQmth?=
 =?utf-8?B?cE1BOTdOTDYwNjM1UHNNK2svY25DbEplWndLblF0c1Y5Nzg2NjFJWDR2TjNm?=
 =?utf-8?B?ei9BREVCNmxOK0U2aUExZE9ZZnYrSnkvbTJKSFoxSk5CWUNLYlRaT1hlNWZ5?=
 =?utf-8?B?S0xQNUprQkRKdHZoK1d4UDgvME85R0lZdW9yZEJEdG1veXRxVzV0RkdFalNL?=
 =?utf-8?B?c29laG1jVFZnbEJUa2RuWGE1UTQwV01DKzdON1k1ZFJyWTdJTHBpbGpWMHBr?=
 =?utf-8?B?cDU2SnlRT1kwSFdNdklaS3dhNEkraWZCVVVuSksrOGl1OGNHK2ZtSHJVeEJE?=
 =?utf-8?B?R2xOMFpteVFqdk1CT3lnbjRvbDRMTTE2WUJlQkJSdTdhTHRhMTZWVzR2VFBJ?=
 =?utf-8?B?Q2xBREdxSDJNT25lb21IZTUzVnpQQXY0dGlRdmFyOWJXNHo5STErSTgvRWdn?=
 =?utf-8?B?eWxNSjFPcDRyS3lIckhIMG5tUnJFTCtQeXdNblYyUTNySlM0Ui95REk1b2Ri?=
 =?utf-8?B?L283Y2d6SmlzT1l6ZDlFTG4rbk9ZVHVCakc1N0tjNC8wMTZBS09vT0MzTkVm?=
 =?utf-8?B?S0JYcmxJa2N5aGtUTXEvRkJSdnFpdVEzOVJsandETEliNk4zdjlrRDBXNFha?=
 =?utf-8?B?MHBORXp2dGxvUXA5d0t5c1BIUlRzNzhKWlNzaG9FYWpiM2haWkFTNGhOalhy?=
 =?utf-8?B?WmdwMkRrWXNYV0VTVkg5YXlHOEVYTE1aR3JUNUYvK3ZOL1ExNmoxcVRNbnRh?=
 =?utf-8?B?NzVtbENTeFc0a0pTUnFBWE5zdlEwQWg5ZEU0amVJR2hkUnQ2R0RvVklFeTJI?=
 =?utf-8?B?MEhJcE01Y1l6eXFFMnpqMmNKUXpUVFdxYjFhZ2d2QWFTMWxTRXZQM0NpQmZj?=
 =?utf-8?B?RlhEdXRvdTF4UXpmUXJodDNzNVNRL3hVT21xeCtnMTZJSlR3STFEanJ4MlNL?=
 =?utf-8?B?WlJyZ1QxdXM2RUk1dk5CNDlZVzg1TS85MHI0UGFEV2p2RUg1bFFMV3pJK3Jp?=
 =?utf-8?B?bXZHdUsrU0N3bVRleEdKRzJYSUlpWUJQUi9ha1ZObWRUYng1dkZBUGZmZUky?=
 =?utf-8?B?WmZZRTRObk4rOWh2dEZJNTBXZUR2Zjd3MGtGd1dmNHBhaHhaSXl5bmJSdHp1?=
 =?utf-8?B?S3UvUlhLczczZWZkMkJKQ1lsQklCMzdIWVptdHByNWhxSnUrU29mZ3pEdXFJ?=
 =?utf-8?B?ZkdJWUkvSGdtSTNPbU5HUWwwck1rbEpoaGZtL096RFZIWG91SkFmSFo3MGlV?=
 =?utf-8?B?a29NR2VMbEFKTFROdS9tOURXaVRvbXNNbG9DT2dPUUtjdmwwK3QwbzV5ZTQz?=
 =?utf-8?B?MkEvRHFaU2oranhLbU5kK1pFa1AwOEhmZEswWWg1M0taT052MFhDR1lHRXgw?=
 =?utf-8?B?ajVtOWhpUlYrN3BwTE5kUnAvVzNEUmkzazM4bk5xUFZiaVgxWUJvN1N6amVa?=
 =?utf-8?B?dzZ0ZU5ReFUvZ3RqVXdHNHhnNEVDNDhtSWdxQk8xeWFGdlNSMi9IWFpFRjRZ?=
 =?utf-8?B?THBSdXI3RDUrVm1WL2NXVWM5UlJMTmp5QklwWjBOZ1FkQkpRUk9SOWppNTQ3?=
 =?utf-8?B?aVZHcEVzb0VFWFRoK2V5QnBBVDNzcmtBLzdRd2NYdjF6YkRIUjNNbHQrYytZ?=
 =?utf-8?B?ZEFBS29YVXRBSjc5YWVqSzdGYXNBa3FkaW42TnpFN1l5ZDV5d2I2RG1jZ2pj?=
 =?utf-8?B?R2hYeU4yamRYSlgrcjZQTFg1d3dSSGF4SG1ONDd2YkxZdzY5NXNlMGxQWlVz?=
 =?utf-8?Q?IfhvHWDQ6snZwZLl1iBG19x9o7xojlbrQmyOo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfd66fa-08c7-4a5c-0a34-08df278e604a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:54:16.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGNGA7230UAjRhSvZAitR5U+JH3DisLAIa1rpmN3C3bplRbg8qgRoQlLcfC+2lVqlCDsccxWXC7FMxs6A90GCPXoTZ9Zt9dLmlqN8mb+6wRzXX5tvjMMWjLKiuxV6Tp/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

From: Peng Fan <peng.fan@nxp.com>

gpio_set_wake_irq() can be called concurrently for different pins on
the same port, so use atomic bitops when modifying wakeup_pads.

wakeup_pads is a u32, while assign_bit() operates on unsigned long
pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
on a 4-byte field, corrupting the adjacent is_pad_wakeup. So change
wakeup_pads to unsigned long and reorder to avoid wasting words.

And fix the enable/disable path unconditionally sets/clears the
wakeup_pads bit even when enable_irq_wake()/disable_irq_wake() fails.
Only update the bit on success.

Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x platforms")
Assisted-by: LLM
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 2f83a0f076bf..29396135717a 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -71,8 +71,8 @@ struct mxc_gpio_port {
 	unsigned long both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
 	bool power_off;
-	u32 wakeup_pads;
 	bool is_pad_wakeup;
+	unsigned long wakeup_pads;
 	u32 pad_type[32];
 	const struct mxc_gpio_hwdata *hwdata;
 };
@@ -330,16 +330,18 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
 			ret = enable_irq_wake(port->irq_high);
 		else
 			ret = enable_irq_wake(port->irq);
-		port->wakeup_pads |= BIT(gpio_idx);
 	} else {
 		if (port->irq_high && (gpio_idx >= 16))
 			ret = disable_irq_wake(port->irq_high);
 		else
 			ret = disable_irq_wake(port->irq);
-		port->wakeup_pads &= ~BIT(gpio_idx);
 	}
+	if (ret)
+		return ret;
 
-	return ret;
+	assign_bit(gpio_idx, &port->wakeup_pads, enable);
+
+	return 0;
 }
 
 static int mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)

-- 
2.51.0

