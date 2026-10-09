Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0EB4F4725;
	Fri,  9 Oct 2026 18:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569389; cv=fail; b=VL3XS24VepVmn/x/XAk8hdF/uBmGzBHJZTWFD+uFF3y98wPnhhGVuf/Hz6wOewxQH30ij7L+mnRR4Zfc8wPx/iq0YW5S+VFD9oA5zpWqTIfZcEJxWAEqHtY6RqYlzkPXs0thK79uKm0ZKJryuLUAH2Fsbg9nqKQp/zDqrKYMeMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569389; c=relaxed/simple;
	bh=h6kpP3e3/+DrGqyppeBTrstNzYDJV5n4Rdy2JCoK7xA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=k9FfN9H9eJcUY8yEVs/YqE3gJzjnNwjBlbYAE8FuK0sFS7zZEZ71Dts3KE1BrzsJbBWDIGFpt5K5CbGpmsYUdXwLYALv8k4orGiwRQ07RQuT5zl32H8h09rhchoYEczT4WciJ21D6gvK7iOKvTfwOYc4aEBOnhsP3RavLq+fX78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fLf+0Qr3; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fLf+0Qr3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQEKjSBf4PUpF4ClgCQgs3LLCFRfQUn/y9SdUnNfNxLNZSfI5ucE27zS4v1Pmr2poMVlXmT7tn7oC6Q69EQiiSITEjPf8zOb6SQJSBOpPblXnP3Km+ONUZt3D3J/mT8neGcLrFeKnRVNlOAZRwNz9s9Xy1Mn9WJ8XqpJMTHk+DpLrWE0bz9evpZqHGDed0CWB5d3bIYL8YMnY3LJaqxyy0h5o+PGD4gdp/j3gjKJTQv9NYNhCE+OAQvD3w9tjLybf3/IATwM05CnzXnuVVF5NEBoIAGS0n8TFMhbSb09OjrnRv0sy9OQhXnju66AzVpNCaaOpscuTmSnu8kTKK0OXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeDiy3pUVl/PV8AoXW4pMOaP6D6p5ePFvjTi14Xzqc4=;
 b=f1LsXuyCKsxY7n/9pVZaDwsubI4Umk6IDMK+nN7Nhgczqg9cVTSiPALPlCe9UTHQTEPoKrzWhSE+aIWbd/YB4oqkUDUGlE5WzBxzJzTtzGajuw178IkuoG94Z7gED3J518SA1F8/xnnczosev0SqH8tJN3yBBjQBQ6nk9r8JjhnCfHIkt8Mlgc127mkeeILeDS+Tc6BVLjtM+Df4nVVhMN+WFmXbOyW6aqxQ6BJvZTbNYDjb58vCTCMKBMrsBTrNLtiVy3f6WvS5DNWrAfhcik+CVpROEED4yzoV5SaZpRHNmlctVKNLAD3QvZUi40nonFjrMLjt/IycH83B4iHXag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeDiy3pUVl/PV8AoXW4pMOaP6D6p5ePFvjTi14Xzqc4=;
 b=fLf+0Qr3Ppig53IZixXQDWl2kYnHTMKuQXCMB0gOZO9/zlOaedgV7bSyZq+wqOxILWa3aS4+rzNxdmAiIno+ktR25Nn+vLbrJJU7oJXj+lYVoIKUtLLGH+nNTvIvGJxKoEOvENUfh1FEPNhUAS6h+CVGGcBfQGD3/mEKD1lF/KlDVZsLeW451dpUL56qgj8q2kCxUZNF7MBb2XE7wy+iW+H0376O0E6D6ucTh41tApPA8a7KAgeL+2vuRoPFdjfnXnarMrPhURxd4OjxEw1XDOEaRRBr8z5qEmMl1Y89QmiluDoYT85T8vNETpMYoq8yvIe4HieCzVMa0cCcP4Uekw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB9PR04MB8282.eurprd04.prod.outlook.com (2603:10a6:10:24a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:09:45 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 18:09:45 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 10 Oct 2026 02:05:32 +0800
Subject: [PATCH v5 11/13] gpio: mxc: switch probe error paths to
 dev_err_probe()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-gpio-mxc-cleanup-v5-11-1e59e6ddfa00@nxp.com>
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
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB9PR04MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: de01f3fd-3014-4974-e4c7-08df26307fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|7416014|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	+/5+lOmsmIWx4h2cY94yOoP1pBpqPzOrpxdWwoIRR38+5gSluwDEUdq4A18RPkGrREp5SETmICuhI4Hx+wRpC+GodTKbZtKgmEZk44eEsKsbiYXZ9ElRVcP0xdS18pfo/380tmL24SWTzImboSEnBHyAfrmw5RDIAFe6hdCpjKizA9HRkwHCxGECM34yiq2fbXZgz7v9jazr7TISaibSsO6Uixe2TTHxce6Ql3EmVIDkgz2RAhoG5Vu66YREL0f7qR7VAl1QORE9kpd3yObQ/2dm6Uf3G4AL3mr5m7LqqHwc8qcTnsnv/u5pb8v0lnuaNXxp7Tavgc8iUu2czvwTc7CLaAKMCteQV81QD8Q9CYLuDVEiGfvC6LbC4N0HdffpInqx/WZFCj6kRkTkp0SEcbrI5jT+QXYa7WK9CHjpgQvrxI8Wg1v7n3UgGL4T5NDIu37118hVoRTjj6wBDEF3Ea41sJiqkLdKMY3qrPK6JV6fCc9EVxFGiQb2g7FCAPtHxxmEjqmegwJWj6kRy9JD6GmZkTTSqD6uCWsRtUrCqNmiSniU+SLTZLw5JHfb33rfKxNTBjQwjOjsCfuX77zWfGJzIxVN6s1NssEYsQTQSaEx/DFwEdgNlVHbP3o32CRUHRAFjE/OUTo8v3M2mR3EX5I5Th79b0dBzi/pX2dCdQc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(7416014)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0lDcFpwMGROWlRRazVPcngrOGt0ZmV3a1dpemU2R0xMRFVpVC8rQ05mS0o0?=
 =?utf-8?B?TmlxVm9LSVF6OHA5eUhRZzMxWmp3M1NkR284Qmh1REE2VHF2cGR2Y1VYWGlD?=
 =?utf-8?B?SVdDekZoU3Bldk9tLzVxTmdwR28vYVQxWmFQZWtsb1dwNU5wVy9SZ1JPNWx5?=
 =?utf-8?B?dkc2MFJwbnJBeHdSbnNuSDY1VUdZYkFtRmRZVTIxOFlvRzVkZlZLOVk1M1Zi?=
 =?utf-8?B?MU9YcElIU0o3K3hsZUx6c3FtVHZxR2RUdmtvRExkQnlzU2RWcGtVTFNDZDlL?=
 =?utf-8?B?TFl0YXY4ZTBsaTV1aDZMMVdxR2YwUWhtSk5NYnJDMkl2azJGTGNLYUsrZXB3?=
 =?utf-8?B?SkhYdEpxbTFDOGNpcXAwOWtuK1BWa2IzNWZGbHVJVnZJQWNFM0Rabm4rODhQ?=
 =?utf-8?B?emJXdlU0a0ZwNlIzb3NyTk8yUkFrMko4angwak1FYkFTRUVEUnYxREl4K2lt?=
 =?utf-8?B?MlZOQnpvRmxrSDNXVXJuOGJaUi91NGl3eHl2dURwZFp2d29OOG1wTi9hZ2tN?=
 =?utf-8?B?Njk1Z2xJOWxIWFRjMkp3VnBMU3VyeEQwQ2NWdVNybFA1QVJXenA1NGk0dXZ4?=
 =?utf-8?B?cFZscDhFVDdKNWE0dUhKZVhuMk13a05sbkIxa3BCRGMvemFPNkVzK1M0YzBp?=
 =?utf-8?B?dWVYQy9DTFVtN1BxUFVmUGs2MlBtZ2J2cndLbmlhU2M3elduUEZTY09DeTc0?=
 =?utf-8?B?YllTa2svUzUvd2tBdTVqaDVucUNXaUxiVm9vVGY1VWxXSTVFUFdiQnJ3MzJP?=
 =?utf-8?B?YjhKeVlNZzkxajF0UzFUN3UycUlzcmN2Q3Q5d3lYQzExbEhML3lubkVaK01x?=
 =?utf-8?B?a3dDVHZ6d0s0Z2lDV2xzVGVVb01LbVVpY3E4RmhqNkEyWjFMSGNOTVdNcTcy?=
 =?utf-8?B?ai9yYjJrTlRGM1NiOXVEc2dKSkxPcGc3bExXb2J0U0xXbThUQjd2TmErbHdv?=
 =?utf-8?B?WjloZTJORDI0ZTAvbEpFdEYwWXFLVXUrSDVyWDBJMjg1Y2pNZENQR2d1K3lm?=
 =?utf-8?B?UnZiYXB0U0tFUE5PMTkwNkQxWjRtVnVEZlkvT1BsS2t1NXh3elQrZzhoYk9q?=
 =?utf-8?B?bUdQV0lBcmxVbEZPUlloNEkwWHpmb2RHelJ5U08vY2ltY1pSdDk0NmtnL3hM?=
 =?utf-8?B?blJxbDBlZXhZVENBenZsMzFwVmtVejNQU1VyNzk2bEpuMk9JWFg0SGc3cWYy?=
 =?utf-8?B?SEM5Y29JT2VPck9JMG1WS3hYTTYzQmQxUnFOWEsvM1phdXA0cUI1VkZwNzhv?=
 =?utf-8?B?dXhaZk44TFBsdDNOOGs0bnIzTlBpU0pJTlVEelpZamdiVkhaZmk1ZTU3TU5N?=
 =?utf-8?B?YU9CYkdlOUdmUWJBZEdzTXlYR0drM2tBdUhOOHJyQ0NaeFdGT3ZkZmhhb2xy?=
 =?utf-8?B?MUE4azF6Mm1ySVFad1AvR0Y5Y1R4eGowYUZnMGY0cjA1UWFDWldIV3FHUDYw?=
 =?utf-8?B?cGtPbGxNMjFXcFFyOWpJb3BNYVNxSTkzM0pIcHo1NlNVOUlMUkdaaG1UeDRR?=
 =?utf-8?B?dUI4M1ViTzBoR3YyYitRaEFBaktQb2UrT29qVGNoREJtRDhsSnB2YVJXYUZx?=
 =?utf-8?B?djVtc3NTRWVMN0JXVitSR0V2cmEzSCtucWV2VVkxRGFicUgrcDMwbld4enhh?=
 =?utf-8?B?RWdxVGlaVnc4YXIzVVRvdE5mcXNLc1FmV1JJNzNYN2twSGdVQlkzOC8xemg4?=
 =?utf-8?B?dlNFVzJYbVhFeXZ2VnkycmFaMDJ5UXA5UWtzVTJjVmlEcDhrVVVuTlVvVWsw?=
 =?utf-8?B?dGNMMzNEdEM2a1B0QUxpYjhkQkZQU3FOTDhBM0NsTjRNTm1KSU95WFpIa0ZC?=
 =?utf-8?B?Zk1tLzVnZ2tRb2h3Z1FKZS9jMHQrVGRXM3MrN25EVHU5eSs4Y01XSUREREg5?=
 =?utf-8?B?VjE4TGM2cktkbmtKNFdEZUozRmhkREIvZDJMV3VKNWZUYWJuZHlVckNRN0Yr?=
 =?utf-8?B?cFFRdDl5L1hpS2JkS3oxc2RPSlV2WjR3alhWWWdsVkR5czg0VGxEYnpXNmFO?=
 =?utf-8?B?ZmphaHJ4cHJqVUJ5dGh2TlJmVDJpTGtwV05Eckx6UGxEellXVzVDRzMvVUND?=
 =?utf-8?B?ZWZheHhPdHpJT3FIUU91S1dUNVVpR2ZZRytoM1RmNGlxbVJ6cmZsT2xLWnp2?=
 =?utf-8?B?bkRWRE9KTGhvYUhTVHlFUG1uRWxpVlhWOFprbzlaeGxTblRmOE9UaWR0cHRu?=
 =?utf-8?B?aVlJTjBYZE1rOWdJSE5lM1FMMXNiUjEzOHprL0NSeTBYNTNoaG02SXdGQ1FC?=
 =?utf-8?B?MUp0dHV5V3R1Vy95UkRXY3I3bHhvTFYzODRmTnpnRzV4eEtEZVlCYkZHeUM3?=
 =?utf-8?B?bUN3bWNoZU1ISDlScm1BSHNnQ0JGOGV3SGhHRitJN1ArRWNTWXBoMW5lUE9s?=
 =?utf-8?Q?j4+YrwUgOD7MX7a1hCj1co5nv0OvRbLZaqSY7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de01f3fd-3014-4974-e4c7-08df26307fd8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:09:45.6015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtRAvZ6RnQXDgwVKslwMWhgVM8pzu5DEiQ5IK0G46eKz0vUvSMp4XQnPTrN6PO3DMsFTO5WbRsY4Mr2g5GFksz+Ke9LZX9nywhPLgH0arJ1/na9YnBi+k/8fo5U2cLzK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8282

From: Peng Fan <peng.fan@nxp.com>

Replace bare return statements with dev_err_probe() across all probe
error paths for consistent diagnostics and deferred-probe support.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 6074b1e3d683..1eb5cd148c28 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -520,7 +520,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
-		return err;
+		return dev_err_probe(dev, err, "Failed to init gpio chip\n");
 
 	port->gen_gc.gc.request = mxc_gpio_request;
 	port->gen_gc.gc.free = mxc_gpio_free;
@@ -536,11 +536,11 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
 	if (err)
-		return err;
+		return dev_err_probe(dev, err, "Failed to add gpiochip data\n");
 
 	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
 	if (irq_base < 0)
-		return irq_base;
+		return dev_err_probe(dev, irq_base, "Failed to alloc irq desc\n");
 
 	d_info = (struct irq_domain_info) {
 		.fwnode		= dev_fwnode(dev),
@@ -553,14 +553,15 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	port->domain = devm_irq_domain_instantiate(dev, &d_info);
 	if (IS_ERR(port->domain))
-		return PTR_ERR(port->domain);
+		return dev_err_probe(dev, PTR_ERR(port->domain),
+				     "Failed to create irq domain\n");
 
 	irq_domain_set_pm_device(port->domain, dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
-		return err;
+		return dev_err_probe(dev, err, "Failed to init generic irq chip\n");
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 

-- 
2.51.0

