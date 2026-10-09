Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120524FB9CF;
	Fri,  9 Oct 2026 18:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569336; cv=fail; b=NuC0EV+yPIFRbuRKbSTIjCk3Pmvd+YGjlNmlYJUCZWF0PHwimmOAKVqjn4n4lTMuB964yeFdcFWEt6Ul6gy09230/oVkhTO9HLF6Wl/J499zsgxLrSVY1oJE1wVf+ccNA76+peLZyujZyPEVTgPq8Q6lumHJDYnRR5knSXLBWu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569336; c=relaxed/simple;
	bh=0TqTprBOTNKthri+sbHz8zHJiJ4k9YWToNy7yiWcgP8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Jchyf03ccp1mz7V/Jp6yYvKNZRKX1DsUhZ0t58BJJs2RpqWKsgQQFewC/Tj2hndg5lpsp+zb123HxlxJP2TLkUniCg1Mq0XU2hHBUD92Sxevj1taYK7LUFsG/JaceXNslsVd75BrtDPeFy9h3S/Kfrpkt7p7HP2oiJoOPEVSVnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Znxw+nw2; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Znxw+nw2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqFmZ0l9WoqW9Kf+JUoGkB5s6Cbbd6keWiv56pzjuZzfu/qSqiMfBmpN4Pu5DyoyIdGrVpXOAdVaq72h6kc51XyXmob57YfyIcIV4S2OLBiriqv7yAl5k4SrTgFZZe5cDeiyBy/YjzqbDzH/PCXZe1uksAwu8aZslPBqZjqHP/avKLYSeYzRulEj+xd9RHDtkkeCZ/eY1QkpNi5SXG/IjAfLob8HbFsFhptYIPrE7GWjbagnqLRurCPFHka0pupqzFoJXyj83tmKDn4i6J7OaXMsa4UT/B0le0CJYCAPfFpPlkaLwp9b5YAwN6GPZOQxwRlRa/U2obrWZdvOf3GxKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GY1N5GP+Xs7DgF1tJekp/gUq3g7BSbhbCeNWyGmhTic=;
 b=CzmaI8tYY/QubafikMILuX0QLEeyQYFk3PycqsLwAUJ3mTqLtNPlXkloJo0uOikZrdeNydI0wQP3d+ydVZnFnCrkA8X/Q3XU0Z++OQWaNRWY9Q4jFtqrJQZdBfbz0JWMOsKzOUYbWe2C/AYJoP2d0ccp7povb5Y4p1KN6xxCvXkim9jSPkLLi1oV/VPDrvhQenOaGviEn7Etl4HFwIbtuvn2dUQAWg4MZa9LjzATVDzSh4TyWsp2XUdtopOOwLKyYionsixM6wBcAKLqWRUbeBgyFGwWQs/OJjjgPSRVkUqEen1fZlqfPRNT3qqaNUsnV8vtJKAVCeQMRP/MJ07JJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GY1N5GP+Xs7DgF1tJekp/gUq3g7BSbhbCeNWyGmhTic=;
 b=Znxw+nw2mg2qjTUS59M8FOWJvDGi2oGIjbOrboqynjiWExGiMcBB661A6rGXsJWdx1AQze8HSfeJ/XHQXccZHmOEkDIhiGi1CDUzR2pi7PXUkN7Jppsenb4ISZLisiykvarwiXecZuzJlP0yYQmB3fA3AF5621Oq/Lj8Rk5Mz5uzUm8Zn+7dsLE/rw8aGmPkz6kJl3mREQZctfIcLDyjlDa6kqzB4JPkYIeNMhR00qcxrygiAXHZsbLvTe+84Ber67Xk+U6yKQVtWf0qurQ8W578c+2Azo9++rf6jOqACXvE1v9QAB7x2ZyTv2dh05ztumWePhT6dO+8aKNeN7DsZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11189.eurprd04.prod.outlook.com (2603:10a6:150:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:08:50 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 18:08:50 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 10 Oct 2026 02:05:25 +0800
Subject: [PATCH v5 04/13] gpio: mxc: simplify gpio_set_wake_irq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-gpio-mxc-cleanup-v5-4-1e59e6ddfa00@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0203.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11189:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e669d4-d2c5-4305-f510-08df26305ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3ZOe4BUihDYOjzMdY8SQjFjDUEbtcZCKWq4NSYAlvcm8F/TrNjXrGIxmQe6cwAHUocV1ky1ZtVgZMtnGbOGRsaAAKX5Ufc3hlpChSDqiFtHS+KkxLwGSJnzlbDDkXYjLisDSf7tRbAup5wGFFNhTx/gSo4nEOjx/exYA7wDQ+RWOdQyUODt0Y4NCtJJGP9nJIx7HZ20nCMjlud4BOUo83f9tKX8EAtHPwA5P5EO8Ks+BLAauGxKrzJ6/RsSbzV7/IQoU0k9T1i0R7IaRQhmfXi7O0eqzieqGTOCDNhDZ4z+dB4crghpHTAi0/VdK1iOjTnOBITOIhZTzbfTS6F4LizZVWgFspqf2T41J5LW/HPUp+jJgjCrzh0A9NBARLgkPrbL7sFyTRM+yHjnic56lASMQ4IkE3CqUW7wTTQkD77U75eBUUGERDey8fDC5EbgUkXnPbjWvWTw1aTHXnA8XQOQMJjvxPiDTQKMyc2yaaG4RzF4ffTBNqGGUUhM7R4JmAxtTBH1nlY4IZZrlIw2ue8y+r1FnhEMKYEtf2331dvr4IwLFwMXmo3S9lzyR6usJ2GN3t3+jJq/wxCwMtinP7fMJFIx/6j/pFDjuAyNGYtvaPgAYFubeSVNQM6jIPu+OiXaoxz8r58rCPoyu4EnfnUpyE+pLeedYhL8sV4+QTCM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXF6c2lDNzlEK1FwTGtURXlIQTd6ZmZYVnRpZzFmK2UvL2ZFZUNINkRIZmF3?=
 =?utf-8?B?SmkweTIvQ1E2K05FY25aRDBmK3VmYm9YRis0WHNYL1M2cFJwYkg1NEJBSVRm?=
 =?utf-8?B?ZTBzMFRSTG5ybEtOTi9VRmI4cUV2Z0tXQWVnYm1qTUEzSy9PTThtVHNicXlM?=
 =?utf-8?B?WHY5M3ZXNEszNWpUL1VzN05hMHhJdnhQcmVRK2UwOTNsWU41SW1YWGRGdGtF?=
 =?utf-8?B?TDV1ZTRXYXdCbE5mTHBFOVh4aEJBdjh1YjdDM2VlYXNlTXZkYjh0allaWGQw?=
 =?utf-8?B?ODBVZFpXcHl3clQ5bnhzV1BjUEw1MGNYZTZUZEJ3dGwwRllPS3Q5TExXYTlD?=
 =?utf-8?B?OWRHbzBtN2ZEUU5OdHZpSTArb05DM1NHa0ZTYU5mUGVTL04yNE5vektnQ1hN?=
 =?utf-8?B?N0RXTmZLR1kzR1hGM013VzgxaDRWV2R6Zk9paDFqeDcreVBSayt0TFZBUHdp?=
 =?utf-8?B?bzFSMWMrQlFtVzhmU0VUUncrRXRWMmowOUNBSnk0UDYvNE5LWnM3ZHpLNjZ3?=
 =?utf-8?B?ejYxSkVZTlZ2VlFPVU9RMGNxdVFUNDJzUVBEbVNBMXMrL1BRQnNLSVRUc1Vl?=
 =?utf-8?B?Wm11dE5RMjlKNmxmanloVVdWdy9rMnRTT1d5OHdPRzdyVXhuWDVFQzArd05t?=
 =?utf-8?B?OVkrWHpJVGtFRWI1VGVnU1BCM01pUGV5RlZsb2N4eVJMTkREV21xRmNUbytp?=
 =?utf-8?B?Zlg0c3BwNlU0dEtMWGpneGl0ODRyWXA3eXR3SExYWmZiVVNPbXVDWEQvb21j?=
 =?utf-8?B?MXNoZ1BNM3gxRzcyOWk5clRyTFoxY3JmZWFCMlk3cmtMMXRLUFVlejRuWmdO?=
 =?utf-8?B?QnZCblg2MHMrMUdPZ2pudHQ2RFhjWEszMlNJQ0lxYjlEOVA4Z3UwWHRsMmsz?=
 =?utf-8?B?dWp0ZUpQNUFEYVV1UzJUUVVPTEhLTVl4aDNBaG1lN213N3NSa0R0NG80RVEw?=
 =?utf-8?B?eUd5Z1VJUDVERSs1YWJaaHZkb1l3dlVFazlNWkF5dFFNRnc2K3V3bEFSdFcz?=
 =?utf-8?B?SGRzcmdYd1Fra0R6K3ZPcDdmcDBLc0sxUkdFRnYzTUJpMHBkSWhLakgrbWor?=
 =?utf-8?B?OEhuejFOb0wrSlZCbTlydzR2dWhGQnlOR2k0NzdzVVRpK0czZUZrWDllZS9Y?=
 =?utf-8?B?QnpFZWpEaXJ3WGx4c3pMUnZNeUxFUkVVT0dRRVUxNWpyVDZTTkhrN0pxcmM5?=
 =?utf-8?B?SzJkYXpkcnZzdGd1LzVObHduLy9oSE4ydGYxQURqdmFiRy9pK2svdzNVd28y?=
 =?utf-8?B?ZjFycnh3b1JuaVlsRWYzODJiTGpObzlKbStJUWRTOFpvMGtEUU5XZno2ZkZu?=
 =?utf-8?B?RzI0K2RkSGZtUGMyNGxnUmZNbWhIYlNxblhkZGVGdWVpWnJpcjcrUHZLVHRG?=
 =?utf-8?B?eElYc3hkZDRqQmpvWXVsUU0xVUFRVW5OdzlUYzk5OHF6YVFvampROGptSHJh?=
 =?utf-8?B?c1dqZnVYQjJia0xTNXBQaGUvOVpheVlLSHBKdjFPRnhIZ3hxZXYxTllqSkZU?=
 =?utf-8?B?a0F0YlNpOVRGS2I4cFhxQk9zY2xoakI1TXFBWi9EQml0K3lwbTJVSUJIdktx?=
 =?utf-8?B?UDZqNWx5SUxsY1graHVYWTlLU0tMam5LN00vT1lUTnAwSWl5dnRwV3JYRmZl?=
 =?utf-8?B?OHhUYWQ4VW1vSzhwQXRhR0JvRjFKTU1lVDNZRGJxUGI1a3hpZEk5Q0wrdWhM?=
 =?utf-8?B?eVBDQmNEbGE0cFhyQVJFUnljNVlKV2U3TlBNQnJFS01JZVhYM3dBTGRCeDdh?=
 =?utf-8?B?V2ZRSFZnVEtKeHZBMEFyZnA0bHh4SjFLMjR4ZWhWUVpIbnN5MVRzcExWZVcr?=
 =?utf-8?B?K2xRVjcvc2VsSkd1Zm0zMisya1NuWkVvVHkvNHFyM2I5RU13YkpEOHFFQXc5?=
 =?utf-8?B?b3pCdGR5RWw5OFUzb0pVMGt5ZEx0VFdEbGFrbkJ3a2xVMVpIYlVVcnJSMTFm?=
 =?utf-8?B?eGlHaURzOHNkc3VzVkkrWjMvRUFLcWczSVZqL2sveXdQUS9UdXNkeS9XZjdx?=
 =?utf-8?B?MWk2a0tFb3RpY2M4K2RqQW9SVW1BV29QMkdJdWVta1BIWCtrTEtIZGZGSENn?=
 =?utf-8?B?R1NwamtkU0tBU3ZCQTJpTk1BeUcwZXk2SnRucU1mMHhFYSs0TzAzdmJTa2RF?=
 =?utf-8?B?WnZGaXp2RTNIUXBQZTF5NzZCTDd3NktndllPREFGZUcxWXVmV1NMMDRhNWxH?=
 =?utf-8?B?di9BNmF4NlVxWVVaeTk1cno3RnJYazV6b1JEd1VManZzb2hwWitGU0dIeWlJ?=
 =?utf-8?B?eFp1NHRieEMxR0RFS1BTVm5KUDIyNzR0Um1RZnk2cEUrNGk5ZTNTMGJPYkRk?=
 =?utf-8?B?ajdHTEhkUUtRYTJSNjRVOGcxQS9nM0krS1hKY1ZUSUNKQVI2M3ZXSGE5c25w?=
 =?utf-8?Q?btJQJlrvZsaytvTdw8AV6ZlRXjvDwGqtvReEl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e669d4-d2c5-4305-f510-08df26305ebe
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:08:50.1300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQTnr1uyEU1Wl04BYS29JlwXAbCL6XY7K+C1GAOVeQR25RRUDB+ZBU1S3DozPmA+qP2TL9peLkKxwjBCncwO2aIf/gcB4+fwgTwNQNsNEIXRbOWz22aY+gLbDPxBZv1L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11189

From: Peng Fan <peng.fan@nxp.com>

Simplify the logic by consolidating into a single irq_set_irq_wake()
call based on the enable parameter.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 29396135717a..c921534aafc2 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -325,17 +325,10 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
 	u32 gpio_idx = d->hwirq;
 	int ret;
 
-	if (enable) {
-		if (port->irq_high && (gpio_idx >= 16))
-			ret = enable_irq_wake(port->irq_high);
-		else
-			ret = enable_irq_wake(port->irq);
-	} else {
-		if (port->irq_high && (gpio_idx >= 16))
-			ret = disable_irq_wake(port->irq_high);
-		else
-			ret = disable_irq_wake(port->irq);
-	}
+	if (port->irq_high && (gpio_idx >= 16))
+		ret = irq_set_irq_wake(port->irq_high, enable);
+	else
+		ret = irq_set_irq_wake(port->irq, enable);
 	if (ret)
 		return ret;
 

-- 
2.51.0

