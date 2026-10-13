Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013061.outbound.protection.outlook.com [40.107.162.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92E948D86B;
	Tue, 13 Oct 2026 06:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871450; cv=fail; b=k5VT7VfqYBakqZ4NpRkz8xuePfuBWwsyj5kOyZPsXtjchkgMuN98PKHLRSqMxFh3z1pJD3PBzU1qbA3Wjrong3IeAgQ8hYdsM5GbUd28M0UXNvKkRFf2pA0Fp545czZvHA/hEa6+NVtkX6MVj47R0xqj9NPEyKHV8GYj81rzl9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871450; c=relaxed/simple;
	bh=ZRFoiRYTyEHqtzFjuyNcCTkyHh24p0KH5/R3JPafO4w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FYYYQRd8m9wMjaDeSBEnTCzEN5/FqV5Eoo5nc3R79cg8cgD5iPYMvI6QydiapUwXf6O6n4s50O52zGuo26wpR5xnM85ZTT0U0dHq0lLX+uodtw4833NBs8RSf2RD1Uxd7mSKyPbyiA88oASVXh7GGtCQhWbUtpRIQmGyKsvf4sY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gIB1yJik; arc=fail smtp.client-ip=40.107.162.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gIB1yJik"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYYnKpQo8iKCjAPOtP1bNMI7OgWx2GqnYEgsWxDcC5s4zT5AtKrMvvr5HuIa0VFasSixSZ+9aXX/tM58U/dOmJSDO1e0cLz3VIGzr0qoUt91ofr+mDAT7hNQ3VwO63xG9AmHFtJF9SqV0Mx8zxN3iTbi7hkwNQ7GGlJ708gyygF3NPiC9eGhvIayflQ+jJ2Vo477reIMsGHGjUbUZzi7LNy9kPQu30PX8TjHGJF+b+DgICTnFXL3GC9RZM0KKD0v+xg8LA8GSA4KEemCgGuXzlBJ1brN1PiCv6jzoqL3gfp0D3vrydwWGG9U8uSTds3kBkU1wbDqBIRNurNtv8YHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19Q/EwfwKBTf8JlGFQJYQZxJ2Sd1Cl6LvqcoUf2CMTQ=;
 b=y/Mo1pBDrTa192w2oQtqDA+uX7s39+40ho/2cwtRt/UdYIpl4D0/k+E9S6jfRnUG1WbxjZ9zKNEo3R9rXg2DaHAsQ2NzGTAVRbvWpaJNmpaxrJEWXlG5uVtPSPt6Re0Z1iNehjogKta9pfwCrG6dZ6XCXKxJK7r5vfrtAzZBjbv2BkZmIrBZCQlGNIHdM4bxp5eAZSLunSKfmDPM5KReJZFkVmCdHsajmYrtErT9h167GHKQ0D2awoCFiUH1fw+LcOeLvKCWOI6yqJRQWAKDwmCz4LFI+lEt77rJmRJGcSdCl/SJtSE9fELE+yzwAR4HGaE05pOV5yeFs+iRHYTPzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19Q/EwfwKBTf8JlGFQJYQZxJ2Sd1Cl6LvqcoUf2CMTQ=;
 b=gIB1yJikn2BvhheWyLhMCUnyBprvlQs0zNuzYbDPiePKsQMc76y/xagMk2/1idUAWDIEkBa1we8Cy5Z4YMMLRcMXZ/rAUldiqildyBwknu8g1kQbuCFLaP+tkVXZp8CJNB1wzp7qXbPP42lBWU++IXn+xq+iG+ahFGiMY+rBJbhpOOtN07Mjlt0jhPIXrcsBqbOAcWXwuBdzxiB/bEno6dTf9cr1qzkJkS1M0SCfToCRUqkSe28TGsQhLWllOwWa7JDwQkTFtxZkR0sgQT21cW4ncwzjK+lwwRaPUdzDMhPEj/Mrm0jalvAXWQuD8m7VAy9IYmglVG/RdqyU+cBCTw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8470.eurprd04.prod.outlook.com (2603:10a6:20b:415::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 06:04:06 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 06:04:06 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 13 Oct 2026 14:01:11 +0800
Subject: [PATCH v7 3/4] gpio: mxc: fix wakeup_pads bit operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gpio-mxc-cleanup-v7-3-c4d769587d3e@nxp.com>
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
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
X-ClientProxiedBy: SI3PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dde8815-a83c-4054-3a02-08df28efc9b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|10067099003|22082099003|56012099006|11063799006|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	y3lEhIL8PLlJ2cdzOUMkkEceHr7reoezLxRrR+M7qRkBaHTbCNTEAlCc0ByWRkLkZ0cRP0scpG1ex3H4ag3kxid8eYUmTBLg86eBfYaIGZC1MJbqiO3Z9nEmammzEwcB8w5oaQ6r5Aacef1h6RSIdYdrlmwUlYd2b/sIcOm8imWHckDAGAeQbCOreclkT2rFQqVM9NDwyOUz/lqY11U6SdeUGpagkd2QM/mtthAnKkAUrAVzw4gSxUjYN6nD6kk3gE7PSzcnFQs9TH9ktYxMdRfnaIxole3BCqZC2uy1OlVqiPp6SPoeEGaLEgvbnpAg8fGjvMzfDDfJxIEDFPdkMwLUKeDV7Ck8UBWQR4/fnLxioO63Ue9cdmll+zQib0jf9xYuurtt7cCnLfhh0/dQzEN30XsBhNqfFL+O8sJhufBRzFhnrAnBRwymVBzSBrACUh7LMvYL8d4x+nixXAWHhP4E6nRRLbS6chlYQzpS15IkZFYOpuoRO10LqiZgVArRJp9UGLkF7CQSdNLaFoDZi0uT4RPLJSWszAVeTyWAfsimTHAoEYQmdRjuGSLnHe07Z4B5OPRbyPAsXCVsx+dgr+dJMNOQtRe9SHMmlEFhKSD+IgPyJj+ntIC5u8E1sLVHQF/Oubg8G+2RF9CnEAivc8t2FyExUt9zbapDcx63X9w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDVLSTNsQTd2Y3hxbmNxR0ppUy9TeDVOK05Cd2NhV0ZNOXlMYytQNHZHMEZ3?=
 =?utf-8?B?TDIzSk14WTVSdVFtWGNQeHZUUVNpSC9aM2E5SUg5WDJQeWQ4OUpFYmR0VkJS?=
 =?utf-8?B?WWNXaldNbzJRVnB6Myt1ekYyYmRpdFptbENLOTJPRFAya01CVlJ1MkN4cUdr?=
 =?utf-8?B?T3lJbHNlOHNBSTlCd3hMaVBsZFhjeVZId0owUm4xb093UjlQTS85YmxMMXQ0?=
 =?utf-8?B?YUp0TjJrdHdScTNIQXh1VzBNVVE2MUt3N3VvZG9oUlB0MGQ4M3BXYlIwYWg4?=
 =?utf-8?B?Z0habUh1NWUwWC9UVGxscXcreFF2MUVQd0VrUEZpelhMVHVuSDJGRzlGamFt?=
 =?utf-8?B?Um1Wc3ZUQkJmQnNkODAwMk95Ym5rQ2VMMlNsUHpyQzQvM2xoTldTTDQwS24y?=
 =?utf-8?B?UTNjaTgzaWVnaXFvMWQ0bUVlWFI0K1lQVEYyR0gza1dpOHF0RDlaMUtzQ21i?=
 =?utf-8?B?UXJBb3k2Q1Fmc1BtR3hQZHFud2p5dUpCSGNCUEh6VElXVzdHR1p4dFlTTEpp?=
 =?utf-8?B?MldyZC8xWEFCOFcxTHFKRmIwbUJreFl5bnZkczNEK0RMNUplOHJVNFJ6WlFT?=
 =?utf-8?B?bUtDZXRMNjlYWnZTN3VEaTd2SWVybXd6bDJUSC95bmxXQlI1V1hPbjVzZVBQ?=
 =?utf-8?B?UXBxMS9IMGR4eGhuUnp0bzdoQ3NkamdTaUw3d0UyRElDcVl3cEwvTW5kYkdh?=
 =?utf-8?B?TnE1OWQ0bHF0Ym1VVUZIS0MvUENRRjhrS1AyWmtOQVRUQiswY0xYK0xlOC9o?=
 =?utf-8?B?V2NXcGtsUXVXL0VrTE10blFlN09uNmhlN2hYaWxhNm5pVHpnZ21XYnZHMDBL?=
 =?utf-8?B?cit4YURqcVl3V25tcC9yczNrd0NZRjVtQTkwNGtvK1hZMDlYOC9ZZW5xbUdT?=
 =?utf-8?B?dGM0Q0RTMFFhYW4yQ2FVenE0RHozZHIzQzVBbzBwelpEWnpLZTUvQWwvZnVY?=
 =?utf-8?B?RG1CSDRhQXZvYW9Xd05ZVllvZjZyQmhnenQxWklRS3hlNDRyK0JmR1gyaGM3?=
 =?utf-8?B?eWlZTVphc0I2VnFvU2Q3YURmcFo5WlQrWk43VmVWRnlCVVZoZDhUVzlJdGRM?=
 =?utf-8?B?RG5YaTBqWU5LZm8yRjh0TjBMVnRiMEtZdGMwNnNUWDY2ekJHanBSRlcxb0tY?=
 =?utf-8?B?WDI4bmZkWFpCdUlsMG5LeVBKcGd2dklYb21hR3BjR1k5YnlCdFF0WWc5dTVQ?=
 =?utf-8?B?bm1HZ3R5eDVDbERQM2hwdENpSWFHekp0RCtzRFY1eHhaUlhaVk5lcVp2dDJW?=
 =?utf-8?B?eXJPaUN2QXhSeWM0eHA1VjZGR1VtTlh4M1gvM0wwQjJPMm1pOHYwM2VyOElC?=
 =?utf-8?B?Q2RHZFpFN2htc3psUndPd0c1bExTaG5xMnVieTg1LzUzbWNROTF0c2FzTGNl?=
 =?utf-8?B?Wnc5eFNjYVRGNVRISVBmcUNER2ZFUUNXMHE1dTVOSEZnd0hEWlFCNHFSQmJI?=
 =?utf-8?B?L0cxKytjSjN1VWkvMWl0Y3BQZVpSMFVaU2h5N3g1Y3U0SEk2bmgvZkpPRkJs?=
 =?utf-8?B?VkYwRllNelFXK0EwbzRiazdNc1NrRFlYT1pwcE1tM1B4SXM0STRQTTNoL3lv?=
 =?utf-8?B?Y3N5b21TV1NwUkFpbmRRNVRzd1RXS2FEaDlwdnFzcjRhNUVJOUNma1l2cUh4?=
 =?utf-8?B?TkdqTW55ZWtqOHFzSWZoK0Ezb0xXVE83UCs1djFJUy9hdEErSit2T3F5V0w3?=
 =?utf-8?B?OTJ3MUJTYVZsd2YzWjl4NkoxYU9HWWVDR09xVHlyR3BwQVZFVkN1akhOeWdL?=
 =?utf-8?B?TnZlZ0FCdjQ1UVQ1bTgzbXdYZEFLZEMwTmRjOHJxd0VJZys1VHovS0xBazNa?=
 =?utf-8?B?RFAwQnB2eVJ0ZGFEUndWS1VIbE81L1BxdDFEaDF5YzVoZDFVMnhRUXplOGZi?=
 =?utf-8?B?cC9WcTNkbnVoWGVUdjdPbmtEWGMwa0twYWpwRmZvd2VkaE9FUGlQT3IvbGQ0?=
 =?utf-8?B?VkdXaSsxZTVXQWlIekI2Zm5rN3lETm4xMEFnV3RxMjlZVDhtSUNIZ3FUNll3?=
 =?utf-8?B?RVErTFgvWHROZXVIMHlIWXJ1RFlnaXZiWmFhNVlUMnErNWljOXZLd1REY2Zj?=
 =?utf-8?B?QlNsTm9ET1J3OHlyL3VyREJ0SDhmd2RhcFpScFhFUlJxbkxFWkdMcmVMYVhP?=
 =?utf-8?B?M1VmM2pmT1VhcDhGd25oYU9mK3g4eGRJZVY4dnJNaGVSSGtFZ0x0OUQvc0ll?=
 =?utf-8?B?YzdpWGpGaytjYjE0SVZHeFVxVmI0V2t3Q0JCaVZVK3dTMEtyM1lKdWRsWGFi?=
 =?utf-8?B?dWR6am9jNjJ6OGFvMkNYbUZJS3pMMzZVYmJsYno0NjNOZnBBSmMrSW95S1Z4?=
 =?utf-8?B?eFVhd0YrU3FCRmQzTHJ0NmZaNFJkVzlwVFFRUVpRK0pOWnZEa0pVbmRwbHNV?=
 =?utf-8?Q?auuJKVWRnpIM7T2kPTQuWHhNhRUzVz5+CC9Dp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dde8815-a83c-4054-3a02-08df28efc9b7
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 06:04:05.9610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGRm5cT8Ls3iTuIom9m9dUJDK9wWuUusFxo19dVh1/iDzJHiAONNIn4wxW1jvPFOEpVTqr91ZGq7ykAMwS58NMNKdIfKNNrZ8/AG1c6jMNXtAIisvi75UoeceIh+GjrQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8470

From: Peng Fan <peng.fan@nxp.com>

gpio_set_wake_irq() can be called concurrently for different pins on
the same port. The writer-vs-writer race is the concern: two concurrent
gpio_set_wake_irq() calls for different pins on the same port both do
a non-atomic read-modify-write on the same wakeup_pads word. The old
|= and &= compile to separate load/modify/store instructions that can
interleave, losing one CPU's update.

assign_bit() uses an atomic RMW instruction, so concurrent writers to
different bits in the same word are safe.

The reader side (for_each_set_bit in noirq_suspend, wakeup_pads > 0)
runs in noirq context where no concurrent writer can execute, so
reader atomicity is not needed.

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
index 7e17d7668980..e3a80f17d041 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -72,8 +72,8 @@ struct mxc_gpio_port {
 	unsigned long both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
 	bool power_off;
-	u32 wakeup_pads;
 	bool is_pad_wakeup;
+	unsigned long wakeup_pads;
 	u32 pad_type[32];
 	const struct mxc_gpio_hwdata *hwdata;
 };
@@ -331,16 +331,18 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
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

