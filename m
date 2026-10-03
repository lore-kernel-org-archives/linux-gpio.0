Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648E6426408;
	Sat,  3 Oct 2026 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029401; cv=fail; b=LvS7LqfyBcEz6ukLgeg73Oex7SnClSOgNf0GEORyltbRrTCyGsvHojYQoqPHYMLMletW3Jugb40AOwJir7/piDmK9CLtAvfD9j2azqhgPAiDOp7S6i6rbqKInhCiNONPOmxm1gq2/kG0VzRx6LobyxAdpDRvfhXhzrvva77id88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029401; c=relaxed/simple;
	bh=qCDraOoVg7njrGe97Evgeb4H2Y/TWs8AYkpgnJKQqvk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LvegmkbPcd8wpsLP49mp42eFcrqdWrWWCQ6beYtQgHIzK9cDGRxkVH1zaTBb0vhmLXvLx5caHLTGleC5AwZTvYTjpdhdQxV7hsMD1hM3MvlM5AsDjeNErem4zjNf6BcNTwhgiA+cjOaTfHV0Q7Hhbt/9MqY2AGGAnoBzLcoIE5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=o6HjdiWX; arc=fail smtp.client-ip=52.101.84.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="o6HjdiWX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSXNGcxNqHruwrIT48v9t49LHRqjrDReYj6IUO7gif4Hc1Jqj99Nl+G2uVlgXK3x46SFo6ysPiv/OGheyIo2t275JN4Ee6uV/LNiH6sWbAiSWUpA/QW3UqKiKIwmfmmgNtQ1+0iBEQES2int43PxakF+R7ItucbKdOn1NJn4llws7C1fk957NxwHJbt+SOM7tXTeFGHbjavFIUs+x0109Hemdv4Z7mGC2haIXyujn7kQHtBIrppTo7UdkoCkQr58UafAkiexO72pfdPyEdGzlgffJtaehcVfVoFmPL2yPaum2HUbNr/PiX2Sg2vPyZkjsIWYMRgxJcA/wKOpkMiLDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHbUW9z6RjOZ5cDIN+T5nBtAiIegvGO4/P0suzzaoR0=;
 b=cehHjp3ilnZ+3LZjZRUBQF62I+Qn7886WH/S6lGhKwIfqv2/3AiMPZVccuRvE+IxAi0GZE0p8WscIubeMpSafwzU/iFMunD9d0JAIY9ijnrEv6xrALC1UyLknM5f7EYZup+LQlGy4EGJ+p+D6sKTPJdux6b7VoqPuQClKDP4nJlqsQYfj98OfW6novQkrxP2tctiJ39l5+WBkehCZgMgDg3d2ynRhFyxaLMvYBti83Y9xCoyQS/chh5SATzfL3qi5jJjI5Xv5RN2HuHP1FSoDHIvYIfFFXtNC2wKNrE1AykPZTK7hgWZSEUx9lGDyzxH46hUswYri810nfU5B8uKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHbUW9z6RjOZ5cDIN+T5nBtAiIegvGO4/P0suzzaoR0=;
 b=o6HjdiWXpIDW1GHNz1TX4gpPN2ejFEoHeOr1h6wYtcH3asMa2GSkL5PejRU4yVzA0Pi5ox4NFmVrCXKpFHhC70xgalVul4DY21Hm81pq2DLzL3MvjjIWrbGo2QxNBnGsLKiEWhfwXFdhBaFFl10kjsTHr+CVwdb/P/OYJzmqdg8Y6+o001x9JpZXTnVJ4RKlGWzBfp/rCjY9jpHgZYFKtJjE66uai8ipTBW0jXCQ0YKfqUI5WIJn8U2uADBGJCJbBMaJGkAnWAsgCVRVh4V/cLC4GkgQRLdYM7x19hfMkHbRgF9n9hPwOV8tkR4b26PzyevUZy32ZqLqNhggu9A7Qw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9467.eurprd04.prod.outlook.com (2603:10a6:10:35b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 12:09:57 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Sat, 3 Oct 2026
 12:09:57 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 03 Oct 2026 20:06:47 +0800
Subject: [PATCH 5/9] gpio: mxc: use devres-managed PM runtime and
 dev_err_probe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-gpio-mxc-cleanup-v1-5-dad728ce27f2@nxp.com>
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
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
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: d1aac4d3-b3d3-454c-716d-08df21473dc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|22082099003|18002099003|10067099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	/6cKRzUxKRAfFk3cAduubF3b1CaK9mc50FRbn/HZsb+EQx6xmUxG4GUFwa6UKtJGqwWYYt+ghd8wMe07f+aTs2yCC7GmgWGWUkA9V2a1QEbqcM7WNGWoEcRC/s61IWM6zQl5VumPL14IovRhFkanFS5kdrw520YljT1hctt8Wei6zrljyQe7r3XjaSIlfbRfW3xDXN++XgFTHY5qUWrRB9WiMKUORkCOtH3zsmJNUD/B7O4thOOwfVxZ9MFHcWO113YR42S7ni2fhtbXXKf4pnBnSmfpaMEzWufYRzPF+ncm3TuK8tffnK28PJWTwzFKZ3Bj9Ywi19DQ83WifUxSgXmcu7L2qb/DprFU8lAk7QSTsRQsLB6yyrfn3jcnnkjunRR4PTGD+buZJyCxOYKw/Kql2hZUIHQJg2ThaFJpy4I6+VI4lIp2EElgVEoNGpjzrXuJRElk8FyjhvZnqwM9GTXFDuu3xZfmNgEt7xemIi2/GguM76p/rn8a0/I8rDHH01gNldSyCRa8x0W/uJdweBbc5IcPINo7r5B1KxOzTewVkBuVM3QyjJFQom5WR+sJTsXd3nCX8ochTS9URlZSrn+JkS+LuiS2P3S1e35fok1icp2dFBYXLAY3613rWV+MMD5XJP7MH14YimC4qLbsMywII8YEYas2DymusPBG50o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzRtWEVjNEEwUko1NEhNZUQ3NHAyd0F4ZzhWeFdpSzU2ejZ2UVRtMDlWalVm?=
 =?utf-8?B?Tmw3dVVpK0JreGpjdjBNOFM5WVkxQXZpbGhHT0hGZk9RenZBRjRaL0Z3MVFL?=
 =?utf-8?B?OXZVY0pZSHFzWjNjMnhOZTJjRzlKbFdZMmUvSTVQNUlITi9aRlhaaTNaOXRx?=
 =?utf-8?B?cFdmb1ZVZlhORDNNdjRCbmhHOXlVTml5bUpWN2E4MzNVVjJzblJkb1U5a0cx?=
 =?utf-8?B?QnZVdm92NkJmc0graFZGWERsTHZsN3poZGp5YVFScDhuRG5rMEhmZE91M1Yx?=
 =?utf-8?B?cGpsZnJwNS9ZQmlYVnlOWjZFU2htV09iS2hydldZMmlKUmtCWnhnbTlFOWZw?=
 =?utf-8?B?MHBIUXJSSkdURk8xNkJUVmlCTTY0bTI5VFdhYWdYbjVIc3lId2pGMGJhdDhW?=
 =?utf-8?B?L1pyaklhdWF0ZE1sZXBKOEJwSk5LMzgwcjBuU3hOVmJKbG55RktSNmRHa1Vx?=
 =?utf-8?B?TjBwbURuTTBVYXVYMEZQWU5WMmFxS1lISHJ0cmc2SUM5NTZtZDc4cmJiTkFt?=
 =?utf-8?B?TEg3cWEyek1VUkZMN0g5NW1pVmJ2RXRsVDNSb0dCc2FPZXF6VUdaREVXaDNt?=
 =?utf-8?B?T1pjc0xlWFdQdVNGeGptRmJPVWdQN1N5NzhTOGNFL0JJQko2M1ZVWGdIMkZr?=
 =?utf-8?B?Zk9qcUtxZ3FxUFg2cjhGWGNOWUJyWGg0dlFEWkZ5S3JGMjJGWnVOOS9jaUJS?=
 =?utf-8?B?c0ZyVlFreUVrdTRHVzdQYmt4bEUvVUtncTcrTFRFemU0bE9lRDJLU1M4VUtF?=
 =?utf-8?B?S2QxZ0Q5QmsvTVlNYm9GelpjbFFTNGx5NENwQkVLYkREWExzUG1PbWdiUElp?=
 =?utf-8?B?cnlWR0ZRbDd1a09tdmZVQjRWZi82ZVZaL3JTTGZPRSs1V0pHeEZFQUpxWGxZ?=
 =?utf-8?B?Q2NPR0ZNZloyN0NsWFVIcHNleVFUUU5XUDgrejhvQnM4bkVXNGNBeTI5Y0lz?=
 =?utf-8?B?YkIvM08yMXlQN3UrZ2QwVG9IVGkxTHl5NzBzSnViZDR3Y2hnMWZFaytyU2ov?=
 =?utf-8?B?MkU3VlVMSDFvN2xBRTZ4UVRibHgzSzd5WWk2Ymx6UE9wNm5yWXNrcHdWaXJ0?=
 =?utf-8?B?OEhqdWlVVStUK2MxOVRFb3ZZUzRDVXc0RnUxaWoyL2dSdmVKclN0WEhvN1N3?=
 =?utf-8?B?N1M2dE80MCttYm02SG16WURSNnF5Ky9jVE9SWGt3MjQ4dWNFblE0OWVCa2dO?=
 =?utf-8?B?blNWYzJSbkdRbFVKc2NsVlV6ekpxQzZpYURLSEpSa3lYbmtjQU9GQzRoSVRs?=
 =?utf-8?B?UlNVcDRJNWhuS3lQZ1ltak51RjJuVWxKWlFXOFpJUjZ1dEJnbjFzcEJBNVQy?=
 =?utf-8?B?anVwZUU0TFlEK2E3ZjVHSnVCK1QxU2hsZjgrR21KWWhlVi82b2JQbmRLdkp5?=
 =?utf-8?B?VEFlenBUL1dXZjF1VmNOYk1GMGtSbWYrb1paSUQ1dDZSbHZBNHJWdldkcnZj?=
 =?utf-8?B?Q0FCSlhaZ01VVjNRTCtMUGprMHZoYWpiMGUrN28wYUVEc0ZIR0dCSkdLL01F?=
 =?utf-8?B?VjZ6TGlaUFZoY1ZuRS9RdGh3OE5ZK25Ma29uUXhvM2w2akx0bmpMNUV6YmE1?=
 =?utf-8?B?OWMwTk5YcmZkNTBBOWtCK3k0UVdsNUZGdEduS0pmZ0dOMituSENhK2xURjc3?=
 =?utf-8?B?MzdiZ2wrcmM4bmxjNHVaaXlNUHpHczRNMXRnZHoxV2Fsd3M5RWd5bHJYVDNE?=
 =?utf-8?B?eXIzaGZYQi8xeVhjRkpaVzNRVUQvL3dWMGg0aXdFcUtkc3dzaVhLVVBDcWY3?=
 =?utf-8?B?aEdwN3NJVUlJWFptdnBoYlo3bHJuZktDaDVPQ0NBSWVmWVdGZHZ2T2s2TGEv?=
 =?utf-8?B?bmNFcFhGM3hmSGhkdGkxZm0xVmUzcG93My9aM3JaczBIVVJaQjFNTjBCc0pP?=
 =?utf-8?B?YlNrelowMHVoM0dKd2JIVlRkaXcwNWFRZFRVaGFrbWNmeWNNNjgyNjhtUzRQ?=
 =?utf-8?B?cGhwRlJCT3BJUFF2Z1ptTCtoZkVOV2EvYlJPK09xUG93STNRUDUwS053NC9m?=
 =?utf-8?B?bWF4VEcrWDZGZ1d2TWJzeXpVdFM4UFBHTTdPWElqRlhNWFhzUjREVlBuU2Zm?=
 =?utf-8?B?VUh5ZUJ4M0NFb3lxRzBCWlF0TkRraDZOOFJzeWVaMTVoQ28zMjNZODdNcFJO?=
 =?utf-8?B?d05uay9WTDcxMmtjbVhqUWVpbStPMUNLK3ZHY2NIM3FUTlNuUkZtckFwa3l1?=
 =?utf-8?B?ZVFKZ3lJZzU1MytKMGVHVkJDdFpLTzlLTWl4L1g1YzVQZUtxT0lPbml1UmxG?=
 =?utf-8?B?cjEzaWFwdklWSzBjQ2RCZ0dLdTJJZE0yWFBTVi9BZDNpM3VreHpCWFJRekpD?=
 =?utf-8?B?ZEhJaWJaS2prM25zWmFTNlN5bEFEZnlsdERVbC9oWlNPakQvS0tENkZ4RVZT?=
 =?utf-8?Q?BsK9+fIOA/E3oKvKqny6DBs4cII2ZKnMY67iB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1aac4d3-b3d3-454c-716d-08df21473dc7
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 12:09:57.5283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZxHS9WBS/WKPtYWjuNUmhqnzXo8PfYpnTAZhgNeyXAbbmwDXITXclLFJQonSjZmhzYRfh+WAUoUTksX50s1JMSpeYcbNwm4P/gCT7tGYYix/iNt9EoFG1KIz7uA+V7E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9467

From: Peng Fan <peng.fan@nxp.com>

Switch pm_runtime_get_noresume() and pm_runtime_enable() to their
devm-managed variants so that pm_runtime_put_noidle() and
pm_runtime_disable() are handled automatically by devres on both
probe failure and device unbind.

Remove the out_bgio goto label and replacing all error paths with
direct returns using dev_err_probe(), which provides better
diagnostic output and handles -EPROBE_DEFER.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 3c395c82d7d4..73e19d2bf235 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -474,9 +474,9 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(np, "fsl,imx8qm-gpio"))
 		port->is_imx8qm = true;
 
-	pm_runtime_get_noresume(&pdev->dev);
+	devm_pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
 
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
@@ -502,7 +502,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
-		goto out_bgio;
+		return dev_err_probe(&pdev->dev, err, "Failed to init gpio chip\n");
 
 	port->gen_gc.gc.request = mxc_gpio_request;
 	port->gen_gc.gc.free = mxc_gpio_free;
@@ -518,31 +518,27 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
 	if (err)
-		goto out_bgio;
+		return dev_err_probe(&pdev->dev, err, "Failed to add gpiochip data\n");
 
 	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
-	if (irq_base < 0) {
-		err = irq_base;
-		goto out_bgio;
-	}
+	if (irq_base < 0)
+		return dev_err_probe(&pdev->dev, irq_base, "Failed to alloc irq desc\n");
 
 	port->domain = irq_domain_create_legacy(dev_fwnode(&pdev->dev), 32, irq_base, 0,
 						&irq_domain_simple_ops, NULL);
-	if (!port->domain) {
-		err = -ENODEV;
-		goto out_bgio;
-	}
+	if (!port->domain)
+		return dev_err_probe(&pdev->dev, -ENODEV, "Failed to create irq domain\n");
 
 	err = devm_add_action_or_reset(&pdev->dev, mxc_gpio_irq_domain_remove, port->domain);
 	if (err)
-		goto out_bgio;
+		return dev_err_probe(&pdev->dev, err, "Failed to add irq_domain_remove\n");
 
 	irq_domain_set_pm_device(port->domain, &pdev->dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
-		goto out_bgio;
+		return dev_err_probe(&pdev->dev, err, "Failed mxc_gpio_init_gc\n");
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
@@ -552,12 +548,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
-
-out_bgio:
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_put_noidle(&pdev->dev);
-	dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
-	return err;
 }
 
 static void mxc_gpio_save_regs(struct mxc_gpio_port *port)

-- 
2.51.0

