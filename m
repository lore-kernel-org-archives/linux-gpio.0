Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028DC4973AD;
	Wed,  7 Oct 2026 10:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370183; cv=fail; b=YKEPJmImJtL++BP18Kw6eZzcbrPv7Z2TQv7XdJyzcNzx5zyQ4I7CCvPn3ex6n8OVRFs1uveie2gONZ5PTEUh3LtHmFg8ISYMYzkbqBgF8HmBzaQiZSg5xW1009zBbk+472onhwRWkahR+XISNGcbbRc8ScB/5Hi0HSTPRki54kQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370183; c=relaxed/simple;
	bh=qKBvrnL1eDZvDOdNTSOZUsiGZrS8PByPlRJildGC+u0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YWLzqsil6uPxmWQzdOXjbcR7z88xjdO+PQk5TVhlBck8HBlk8j4UoqRXYcSptVNeaVZnhDi1ypVtmUa8f0D0nBuzXSXVL3w9QCFeoDsg5Ccyp3P42qDyQwTSBq6sbdHb7TL96zXQ9FAR+QSyhOCaxfTq0pzTl98v3P+G3JPkcsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=d1PFU0sY; arc=fail smtp.client-ip=52.101.69.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="d1PFU0sY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCjXd2VFM5SKGEb2xCF/lh9/NMW01j/XxsDDuwSvJll0MSGbZfdrTWhe2vLkriR1eUbOB4C0kl8LaJHOZlTaf3vlEypM4rm2fhabwqzBN1YtwI0j0BU8ogXpaGaCZRbutrivPmpM4Lu1AeMH+h+b7dPgzNNCnDDC5NwJcVaU+ah2eaQ5u1WVGsphR5BnelVPny6CO8kYVbUJ8P4GrxJfzHI3+Iv0Fofhln1/uvJ6RrvY60R9/X3NvQSwQSPy1YibYiDR1+9yhgc/vYiUqen5yuALQGFRKVDQthmRTODbC5cBHZquRydhZXUe8T7cYNwHks9o275oGdTKMM6RxIcEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hY7tCljgF0ElwmToTD1PQXbI9WPBzSwWJeSbmpdoxH0=;
 b=HVTCo9+b9HfTn5h1PUOsMH+s39MNQAG/9VrOIKQL3qxyFpRmj5/JL2ervIn1kDH0zoxhWogu3MgY1ShHVGhBWa4EcKEErcL1ad7t2H4eBZ0cTy0sVzQX1kP/u8l5e1ZE6rUqZC91xHNN1q1Z1ON5/JoStWO2zhPV20IHtE9c6Ce4kVTAfsrjOpQReY1aKdNAx5jWseCkumtVI1Q0BhECicktG3s8HJdR+5618Jf8jbAxvZuwox7UdULW2IeVXShVn8bC/lfxJMXVW57JXUvMed9+1J4hBBtYIX3OlY2C5roA0kXgdXTsrwvPSfcxnKoZ4CFigttUbAwf0vlK3UlXNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY7tCljgF0ElwmToTD1PQXbI9WPBzSwWJeSbmpdoxH0=;
 b=d1PFU0sYX8HvFUx79F/HfoBkyBAcqD/i1l61WXwe+QY9omAAhgNyrPrEzMuLmBDwPzXND6AXAm62hygNHuBTGCnmhPqHgESBMntZhsH+TtDw37Rbc+21nEmkK0thKJ54WOEyCRxhPXlldug/g4E41a/5ncs6Zd7cs2voYEVKrY9qRIBNgEWwx8R0MZR9Vh+yQRCv/6tzEuyhNR6s4SUHjA/L1wrsZVPUkFfoHVID5K9SndQgK3J93bYlwxaPp9TZP9hCxAKn3LQAX+IZPNCJS8bRkeFYZxZgYEtSUnyozQUVTXgPamUM/HC6t2ATeqH4GDgPasJXMZe2Mn8wY5qkaA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11738.eurprd04.prod.outlook.com (2603:10a6:150:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 10:47:41 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 10:47:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 18:44:21 +0800
Subject: [PATCH v4 06/10] gpio: mxc: convert probe error handling to devres
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-gpio-mxc-cleanup-v4-6-c9f5a8b50df9@nxp.com>
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
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11738:EE_
X-MS-Office365-Filtering-Correlation-Id: dadc5515-4be4-4261-8c1e-08df2460694c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|19092799006|366016|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LH0E8tYjUnSTENZDJe8vPfTa/YLPt2ZnuhQNpeFTrUTtzxtQbidN1Z03f2Dv1ha2PsXC9oSKYx/2dG7m9KspXVSDU2USwdPA1niIbPUQOOawFOuDgBLO+e9Yo6n1ahEV1+4dGnK9hOlCorW6uS47OkY5vDr3BM/voYnv2qxDBrqIYwGKJ5HlWzA0IMjRpRvBMTfP79BSyc3WYl65Ce6DuHMg+WWgvg0lQxWtx3+R2xT3GvEDCDZPiC1jCq4SO8zYeymM8RrvSiFltRyWcDGE2hNJ3Ody9ieZc1JdgfRcGUcuw2gcIIr23H8+/G8T5xMkef576nQ8hxnrruMQWJDu3krvekw0/o7johhhFxD70P6TGA71xImqZBod4hxLdk85OMhygsm8x1CBUW3iKc1Fd3K2ewA2e1b4nheBjZ4zU/t2OLfonlr2jPqRBR5xNXNh8PGshYI7h//kXJwGKDJZ54UYYQsMggAKlQTIQKDZ4t16PiYaSYpg65TSAQXU9X6A4i8HWsssINFoOBgUEWlEdUZy0hSwNjJ3r9ug20E6CbBuSPKvUcVui5U1GwZ1xmRs6a0OLhxYeKMfc9yvtLvF1LNDSerkbGNQ2LYWZUyHCP+r6nUt8ooQAaam3lGPHRJ8WEiXnya9fxfdxwgkyWc/kTeQGKiNM5fzimsP/q5HXCY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(19092799006)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0RESUxieGF0aGxTb09jOTNsNXZ6OWY5NlNucW1kVXZORlI2dGtrQjFOa0py?=
 =?utf-8?B?VWdBMDdKejA3aDJwK0VDSWoxMUY0eGsrdGVXczgrbklZbDc5NmdCMUZKQ0xy?=
 =?utf-8?B?ODR6amFIenZVeHJkNEhDa1R0cFlEdFJoQUtPNU0vMittbFdlLzd5WmJzaDZD?=
 =?utf-8?B?MXFVenFEMDR2YUJteTdERnFrckpKb1dOaVFnWisyRUVUNjVkRi8wcU9CK096?=
 =?utf-8?B?aDJyYkl4RHpRY1E0NldzaXFEblZoR1hVWHg5azVTaG9IaG1RVDkvTXppRU1m?=
 =?utf-8?B?Z3EyTFNyNjBIdC9LVmJaWHhJRHRaR0RXMWF0d2tGcCtnTXRUU0ZDNEErTjU4?=
 =?utf-8?B?ZjN6aFFXUG5rVWZZYUxzaXVpT1JENFFFcXpTQXE2dENKSXhpai9YMXJoekNM?=
 =?utf-8?B?QUY4MWZOS1JHemtXd25rME1sVzIvaWtGS3MzSFg5bVJ4MlRoRFh6Q3RoN0VL?=
 =?utf-8?B?UkgzcDEwMUhoQ1hON0VmZndUSEtqQWpMUjJON01NSVl6NEI2bjI5TVBmMkRG?=
 =?utf-8?B?NHBHWGVjc1lCYlppK2w2eDNDOWNXc0t4cXpXai9BOUJMd0VMTGRiNU9qT1F4?=
 =?utf-8?B?V0lhQ1U0ZmMwQ0FVNFRaTHJmTXMzVGlSdmZPY1R5STI0U2NkeFBDd1FZQUFI?=
 =?utf-8?B?SFp4S0VHWTRxYTBjcytxeGNuUkpyMjloVlVhUVVXRmVNZEMxRFdoUzY1cWw0?=
 =?utf-8?B?V1BUNlRsY1RpYW02Unh1dEJUZHpnOVVrL0FCUGJGZXoxNThwLzlBOWVaeGZ0?=
 =?utf-8?B?ZEZ5UjF0VDB0UjJ0eEkxZnF3UHg5NUdpMmlzZ28rQ1M3UUFYc0lLSEhFR0tV?=
 =?utf-8?B?bE5mVFFXRnFGU0dEOU1hN3A2ejh4WEIzYVptMS9pWVFPVkt2Y0JKT044T3ZG?=
 =?utf-8?B?aSt4QkNXWUdyQTgyNWtDRy8xRnlsQWUzMk85ZHBKUlpOYkUyY2ZET215d1NP?=
 =?utf-8?B?QmVkNmdraVkvMUxTenpqSVQvMmtITTJCZzNNVGI2MUplVkYvMHRmYUovR0pU?=
 =?utf-8?B?TnBHOVhtWUJ4RWI0b0xDNXhJM2F4ZWNScGNqUHc3TDRlWHRHanpTbURNc3Z2?=
 =?utf-8?B?d2RoV0FYMG1uYnZ5ampBS2NFQjZ3VlZJd0ZSTUVOQnVpMHRPSDNkNFI2Tndn?=
 =?utf-8?B?YUUwdUpyY0MvWHU4My9raFBxdTd5bU54S1dtTFNsVlpHNzlESE1YWWhTN0dR?=
 =?utf-8?B?OWxEdlZoK2hBTHpGVkg0Vm9Wb2ZJeUVuS3dhZTl3Y28xTWkzSkZ5THh5Y3pM?=
 =?utf-8?B?VUxmQ2NZRGhPbzZMZVJjU2c4dyszcEt2UGplaytxV1ZLNVVUSFB2WmNjVEw2?=
 =?utf-8?B?L0g4NEtkT3VPcmFVUnZZNEx4MHlTWlNXbmNwUTdYNG1zU1NFSDRObnVPNkdQ?=
 =?utf-8?B?enlIK3VtS2RpcTJDRVJPdnpqL202SkRoSk9maW1wMUJYaVlvTC9sM2U0Yjdw?=
 =?utf-8?B?K1FHbWMxZGpWRW1nT3dmSmJsTStrRjNTeFdJQVZHMlUxZ0pKNlpHMmFDaVFE?=
 =?utf-8?B?dGo0UEZoVWtyeC92bFM5YXBWT0J1cDdZLzJWZldlb1VUZjVlZjRvN1dva21p?=
 =?utf-8?B?QzJWd2ZkQ0xXWHZsMGVpZGZHcnloYzFZNDdIbWVneEhZYW0yeU9mTGxncENn?=
 =?utf-8?B?eHFqaGI0Yk0yOWUxQ0o1YU53WEpCLzM1WldReCtuTVZBaTIwZEl0NlAxdXR5?=
 =?utf-8?B?RHZrdUlFemtZN2ZSZkZIRjdLQ3JzWnI0SHBYbTRCRm1ld2xERHg3RVdMVEZT?=
 =?utf-8?B?Mk9PK1AvUEIxdGNQMExsV2JjaGFOM2JRb3FtWHNObExLY3FRcHNWL3BzY2ZZ?=
 =?utf-8?B?K3Vad0QrMGJkLzNESFduTlVCSjlpZUFMVTRwUG94UTJoZ3gySXBvcWw0eStE?=
 =?utf-8?B?b3dzSkV1YzFsODcwNFdIN3R1bDRBU3ozVUgvUDF2MHlvWDdNdC9oTHhlRmhG?=
 =?utf-8?B?bW4xQjE0bFZMMDVNaXI4RXVXckxsMEdObWVQT0UwVFNhcWxkUzVxVUo2Z0tX?=
 =?utf-8?B?T1ZxeFFUUVJXMzdxY0tEOVIydllwVVRjd2l6NU9vZDhtREpQRjRVNHVWdkhy?=
 =?utf-8?B?MWc4ODlkZW1PKzdYbzdoeUUrZEZUOXZqaVcvTUVCWmtWdUw2Y1FmMVdhNUVN?=
 =?utf-8?B?MUo3SzB0Z3hSYkxQcTEzVXcxVko1Z3lVMmdYQWRzMVlnYzZsWkUwYk0vUjVy?=
 =?utf-8?B?cXdxYVY2akRjTkhuMzVSUjdqVGlRbGdMa29kTnhQQ1d3bGt2OVR3bHo0eVF0?=
 =?utf-8?B?QXJTSjYybUJGMWFrMWdjTExUK1I2SFlXdHY2ZStNZVAyaDF0a0c5VVJaSUdU?=
 =?utf-8?B?cUZTK1hXQUFmODJ0aWNKZXgxSDdNZEVJWDEwcjMzbmx3dGd4cE5iNVJCdFcw?=
 =?utf-8?Q?dYu1LxWgD6R6JPR1G27UYKtb5uT3ENLjDJ+Fx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dadc5515-4be4-4261-8c1e-08df2460694c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:47:41.3224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnkpmrGbM5PPRfvptsp8TdlRMYCpX6sTXrPzMkmYM7m+NpOGz7efErLlnRRtXEo/JPEnEv4FYhHieUNmatkJ14aXmLfsVJ+LmFXzROR139qEIEtdbPGhiDUwLIwt2e/5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11738

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
 drivers/gpio/gpio-mxc.c | 49 +++++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 5da603569d88..54b09f1a4b50 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -449,6 +449,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
+	struct irq_domain_info d_info;
 	struct mxc_gpio_port *port;
 	int irq_count;
 	int irq_base;
@@ -484,9 +485,13 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(port->clk))
 		return PTR_ERR(port->clk);
 
-	pm_runtime_get_noresume(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+	err = devm_pm_runtime_get_noresume(&pdev->dev);
+	if (err)
+		return dev_err_probe(&pdev->dev, err, "Failed to get PM runtime\n");
+
+	err = devm_pm_runtime_set_active_enabled(&pdev->dev);
+	if (err)
+		return dev_err_probe(&pdev->dev, err, "Failed to enable PM runtime\n");
 
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
@@ -512,7 +517,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
-		goto out_bgio;
+		return err;
 
 	port->gen_gc.gc.request = mxc_gpio_request;
 	port->gen_gc.gc.free = mxc_gpio_free;
@@ -528,27 +533,31 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
 	if (err)
-		goto out_bgio;
+		return err;
 
 	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
-	if (irq_base < 0) {
-		err = irq_base;
-		goto out_bgio;
-	}
+	if (irq_base < 0)
+		return irq_base;
+
+	d_info = (struct irq_domain_info) {
+		.fwnode		= dev_fwnode(&pdev->dev),
+		.size		= 32,
+		.hwirq_max	= 32,
+		.virq_base	= irq_base,
+		.ops		= &irq_domain_simple_ops,
+		.dev		= &pdev->dev,
+	};
 
-	port->domain = irq_domain_create_legacy(dev_fwnode(&pdev->dev), 32, irq_base, 0,
-						&irq_domain_simple_ops, NULL);
-	if (!port->domain) {
-		err = -ENODEV;
-		goto out_bgio;
-	}
+	port->domain = devm_irq_domain_instantiate(&pdev->dev, &d_info);
+	if (IS_ERR(port->domain))
+		return PTR_ERR(port->domain);
 
 	irq_domain_set_pm_device(port->domain, &pdev->dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
-		goto out_irqdomain_remove;
+		return err;
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
@@ -558,14 +567,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
-
-out_irqdomain_remove:
-	irq_domain_remove(port->domain);
-out_bgio:
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_put_noidle(&pdev->dev);
-	dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
-	return err;
 }
 
 static void mxc_gpio_save_regs(struct mxc_gpio_port *port)

-- 
2.51.0

