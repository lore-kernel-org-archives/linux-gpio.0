Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D7E4349A9;
	Sun, 11 Oct 2026 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719675; cv=fail; b=dHwAJlJQ8YIEiHH1Qn66kgT8iwWwJKKgoc1eR1FNEF7Z1KZ7BGnFR7r1xpWnf4vCTT21Et636TvhpCNGPMBi9Va5fBY5MRVoyvWmShU8QJSTyyK7WnFu7Rz/paEVTgwWQoDuRcapbuBGSHZsY8qwk4rnpeLbuXwkV++bS+ALIEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719675; c=relaxed/simple;
	bh=0TqTprBOTNKthri+sbHz8zHJiJ4k9YWToNy7yiWcgP8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=j8h70KtLxj9fpdlNnby+g2pkO9WmwM+T3tl3WRpnLotXfJBlWZ0sSpTy8Bzl/oNtJWrJ8zlu/drpUO3YSJY2smRQEaB3vM1LJjrEERCg7VtG2UQMtULzgR8AHUpJCQyFN9mIAQWhPymC0JH96+vN+lfirht5pWT3qcmfikF0L4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jDafFBTC; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jDafFBTC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a35vmdQbWvF5tKHgFl9FTk+xTKZ6s6wvvJypC54xRvW1e2m/i/Hg4Z/y4bssVNeUjNlklS/1UTcNwRuJ3hNHRj+MJO5b/V5ySQyzwAC7T7+x7GFNwCGmeA9n9EFkGTZhtm3zVTTDXcm6ih/NjfmrwOXLz50px0R4OvokVXbERh8HeK0gEUKjPhofCkdutyhLbuOWLyiJipenk8HX/UzG/xHVNJBYOePxV/RJ8f3N5MP6VA0D3O8sDgnMkOdnvlpL2RiFuSBQEo/0Ax5OQHjWSIpRDt7VBTJTg6BWN72IHa8NCqA1eiqohVZZNzbDhUmIoOB0Wa1xSyLiHt3FJxd6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GY1N5GP+Xs7DgF1tJekp/gUq3g7BSbhbCeNWyGmhTic=;
 b=ucHDeHxOIViOsfR/7m7QPwF4mSn723oNKLOY0fGP62qMwuwqVK0u8OwhyLHtNjNehqgP4JHGoUvSR+1z6mC6bioi+sM/IxEfnDD/7WizKmEalTxUU49OQerSqDDloe5kTd0+kl2gwsHhZUiMkJ4/q53pCLd7PIbJQLSh9ug8Or6phnhNiNOcf7THpjNJLyzfhU7gC2/Bf6zKT7HcjFztLYsWBk3XfoD3KZ3BL+C2TKuuOmKafspFVzremIYxgWYgrBIHNoaQc/P4falhGkKu6ZTd3M7vaQPVvgTqEAAGI43yxqdKzGhWkOxMhY4ZS69/b29Of32GPFP2/478cKkoPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GY1N5GP+Xs7DgF1tJekp/gUq3g7BSbhbCeNWyGmhTic=;
 b=jDafFBTCD2q6kLH8SLTzOduJbb94c0u9kjOKZM3PGLx3jXog3odRc96HYB16jHRgslq69Oqg1Ge43KJWGQC0Q8NXNhhxuglJZaLT8yfGgnaXGuhgXJ7uOI3Mw4UBXnvaxtgh9cFDwg0g6tAbXHmSkw6avKrI0bTvAexF9I+TEr+xyHEumQ9BZcXNl1HiNYx63broINN6tk43ImHZF6FLzH2choBsNM1PRm4F1w2VSXcuQsBq1JxDsSXZfPXmorFnuvkduRr100LiSwGpoeCw58HjN0wIPJdXe+qhBMVYvc5o6g0UGM+XE/3xxRYckjCmSuyQMAJuKBhoGa3ZDRM0xA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:54:21 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:54:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Oct 2026 19:51:25 +0800
Subject: [PATCH v6 04/13] gpio: mxc: use irq_set_irq_wake() to simplify
 code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-gpio-mxc-cleanup-v6-4-cb47ce2ad758@nxp.com>
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
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: db791432-5331-4e42-0745-08df278e6361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	hijEhqZM6kqUMqXDGUeqV3X+8C3bumgtR5ZingHg5qekqV8yO5aI0QFkoklG8INJl7gJ7vunghi2pdLMw6TkItXeCAliDL4RrXZXXKaEzxBBJDaOtNH+MNNE6nWE/fyUWBKtSobZH+rbPShxumwQ8HJ3o4xbnamBDKg5Yuia1fyzewXDT2ntIzcasxtBb1/K4ozXkCTI5DS4fBRS2qGMPVozLilMcjzUcf5OiMlDXjZfxu5kJe5HHLyyqsxn3HswAiyeqgwBSJ0b8h13JYUiGSHc5VIX2wcLc2VGIRjSHmadzVFQN3OEJJG10qjutu0eXRZKzbvtHaMiXwGKK7x+vC8aDvKUBjf5XHwN/Q8vYpZ5nTxgfmO1AXkX/y83x08M/ngq5IWuOM/JtXZ4hYob4H7QIZmkDmKrUPglATM7yIh53+cGsXMV5MzUXh9mEPyMUtWvenGLpmA/ZKSsvAmoKzkMEwYwgpCZdpAzUwpUHG9kQ2OjntXzP+j8b4RAjbyJA7LFKvpDS9mu47G1TOAgOAITzk+BMn8VeUF7nqsZRkyQYkp+zjx/4dup78fIf/EdNbSAFjviohwHOkNjyq/GpfRgeeX2ObpylTll0AY4pauD5EbEJ1kFZBHca9k8NtUEtxQ9EeKFh2Nkgng6XA6Oxv+uFO+BljJ4dlwwys0yr2Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFZmRW5Xd1lLVjhxbUwxQlRsQWFLQWpKNFpPaExBbXFaTCtKaGJXZjM2M2xp?=
 =?utf-8?B?R1RtaVFybEZHMDkxRDNLUWpTM3RDekhNbEtIRlhVaEkrajA5VjliL1k2c1Bj?=
 =?utf-8?B?Q3Nsb0xYcjdiTnplVS90OHBJZ2hIRjRuVG83aGtUYkxRT2dZNndzQlg1QllK?=
 =?utf-8?B?bVVmWGF3NTJsV0NKdWVaQ1d5aDhrcHRlSDBqdVpEWDhNMjRaL25WcEZMTkJJ?=
 =?utf-8?B?b3dHZEdBYTJ2VlAvNWNrNERJT3pxQjYyS3dzYWpYMlZFZ3FLaGRKSWFlQ0lD?=
 =?utf-8?B?MnhScHdMeUt5VWFBTDBrT01DU0VkckNGTGJoWlZadlBHVnNNUGpoYVhoME9D?=
 =?utf-8?B?WmJhb01Gb3JyTGREcW9WTStpWDhsK1hCRS8weDFBdStuYnU3VFk3WjRYNkVG?=
 =?utf-8?B?SGtZblIwNHA1QUs0blhWVFN6MzByNjlORk1kcTFiM21ENVBhcXZ5bUpraXla?=
 =?utf-8?B?enNOT0NOM2N5OWhPTURzNkc3MnFsMVF0NW8vOUd0ajViaHBObXBLMW1KNllG?=
 =?utf-8?B?K1pPWit1TEdsQTN6cU5oSXIzNDhqSTBrYnB2TnZvMmZWSFJhQWFDMDJxTHRT?=
 =?utf-8?B?bkxYbDY5N2wzYnlISWJHbjdGV2ZrOHhqcVlZcXdhZ25XbngwOHNmMGtSNTVN?=
 =?utf-8?B?Vm5FVGU2cGJ2dE1acEdiOWcyMVhkOEN1TDV4ckI0WXY2ME1Ub1VlZDZnK29n?=
 =?utf-8?B?SUlydUdLQnhPcUdyYnU3Z2JVSktvOTlKN0dIbjBGZEg4elB2dXhGbVAzVG9Y?=
 =?utf-8?B?SXlaT1NOZnZCMVNTNDF6VWFRVTJUR2xVcFJoMXRleWFwKzdwaVh2ajhnTjc5?=
 =?utf-8?B?R3dsTkNrYUU3MXhjc0NQYTFlTmE5eWJpbmRmOTNObTVzUGRyQUJzT2RZVmNm?=
 =?utf-8?B?elJQaUlpK083T2hpQ3BmV0IzWkJudFNZZ3d6VmNuUkIxaGVjUi9oQW1NWU1z?=
 =?utf-8?B?Q0lIM0orUHJzbmxva3RDUmhIL0hSdnhERmIrMWE2Q1oyMjZiNlhSQmFGemZy?=
 =?utf-8?B?dm9HekVHcFhSK1hHZnU1WDZYazYwNVFaSjRjTmNZSDFaK09UT1dVdDRURWwx?=
 =?utf-8?B?NlRmNEtOM3VvcUVBMWVTd3REcnVRVTBWeHg0aHgyNGtENHJnRGdMWUVxaUQv?=
 =?utf-8?B?TndJMWJGVldNRUsrWkZLOTM4TXcySFNlUW8yOUxSYkxvVVlUT0dzYk02eklS?=
 =?utf-8?B?enJTZ0Z3d2FWTGZJaTd0WUozM0hMc3JrK3ROeDdvMWFCRHRScXBIWWFpd1o5?=
 =?utf-8?B?clZHT1NlTWprL1NnQjZsaDRZWGRaZzhNZUx0NW5KRTdCc3dyeGl4ZllTN1lQ?=
 =?utf-8?B?SThtVXMwL1l5dW5NSm1icFpoUllvT0RvUUs3YlJ0SWdya09SMHY4aU1hcEFM?=
 =?utf-8?B?b1o4YWtPaGpvdkIvdzMwVEhhWmpxeGNuZGN1eTBsWnIzaGU2K0Nwd2tyRWVG?=
 =?utf-8?B?d3gwYmoycUN1blV0NUdFMjdxZVUrS3RyeWRwSEtLV2I2U0JqRlRBQ2FQL0Rr?=
 =?utf-8?B?dnNIZTR3N1dOK3AxWGpINlZyeXlzYVZrMUQ3cEkwc1lod0xKakM4U09SNVY5?=
 =?utf-8?B?RDhBaWp0Y1JKdlcrRDhFUWFDYW1teVdXVUVzTndtQ2xGVmxGSUkzN1Y4NkdQ?=
 =?utf-8?B?L084ZjF6SU1sQmNtaVd1NkRhV2hRQitUMUNLZFdqVUJ2ZWVnVzBEUFdpM3ZK?=
 =?utf-8?B?eHBQR0taU25PODNXQ1FpQTdxUXF6ZUh3cCtnSnVmVHBSZnpNZUhJU3UraTRD?=
 =?utf-8?B?SGExdDJzeTRNUDFVUEp3Z0dmVThaU2IrQ0ZHMlNnWUV6UWlRcllsUUE0OE03?=
 =?utf-8?B?cm9JcWJBNG1tWkVXVGE2UzJKTmZETkV3VUdTREJxSm5xb0dlWVNyenh6QWcw?=
 =?utf-8?B?ekFLSkZZRmJpTVh5Y3lHQ0NkOTY2dlBHbEUxTDc4ZnQ1SEdKalBEUmFkK3hN?=
 =?utf-8?B?TG5ISEdNb3RXdzJQS0p0dnVjZGVRTnFuSllrQXkzRHB3UmxZYzAyYXZxOEl3?=
 =?utf-8?B?cEFhcVMyNE1vVVRjbEd6UmFGTWdqbGFpOTl5R3M0N2cwSlVWZnlyRFJreU92?=
 =?utf-8?B?dzl1emJkR2FicnVCN3pJOXlpZHZ3UzJ3TjlPVE5BNGRMRjd0bWwzRjVFRmJF?=
 =?utf-8?B?VlpPV3EzcUh0M21TejV4b3hZU2o0Q0FJZ2NjQk5xQ09FeFNKdmNvRDRyOWtM?=
 =?utf-8?B?Q09QeEtuV3BLZnZnRDcxaDNnUTZaa01DR3g2N0U5MWRjUVExZ0I4enZGVGcw?=
 =?utf-8?B?R3NkNEdpYnRVSitMTUkzWDV5bG9DeDR4Q3l4QmdVUzhYaFhCektmVklVZmd6?=
 =?utf-8?B?Rk9BdGx3Rk96dUxmOHRKQnkyUk9yTS9Zak1DQWk0eWN2WXpJQmc0ZkFML2th?=
 =?utf-8?Q?L1CL0M7YcHS9nO+V73DSkd4X2oVRilJZeZOfa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db791432-5331-4e42-0745-08df278e6361
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:54:21.7604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhqDEC/THEb9GOd3nN8B7IdXbi63IMoXT9r8bwk2ihCAZwGyXo75xUme9b/MNqAxZRRIikINXR2okmEHWiU0051nQWyeT840Dv4ujbhqRIz6MEiInijMA4N37ZEGWHR/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

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

