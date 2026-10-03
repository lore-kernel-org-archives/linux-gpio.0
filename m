Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA78421EF4;
	Sat,  3 Oct 2026 12:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029379; cv=fail; b=hYtJJJz25Hb3xfWBIsUqq7IXX94cbUG+hMvEoOgU9Da3qhIZoRWjsA+FucU8UN/lNWltrHl6DGdaqd3CcRd8XQ33pe0j9HMdWCIDQ8LZlyQ9yu+wyeFLRENHRnA8PewrZnGRM1RT4L34P0yxW5C8WAoP7G66i5LZCvcE6j0ulkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029379; c=relaxed/simple;
	bh=sydmaNH6EVwUe9FXRZU4Fna603QNT43zf9+Fpi2ZoMA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=plK7O2BfotirKXSSjshYyxccTMrGsAXVyl0X6/ad6oFD+llmyfr3BpwelDz8Omr8r1rOogjYMgASlB9gi+wqW7AJkmkS1tkf2JoNNY1sSwLM5Oj2I4I8oj0Dh82HCG1gWFeWYyfi/KKOjB5ZVK7YOs0dM231kFwjbc6TvqxW/U0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XzStPl3d; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XzStPl3d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Icu5cSDfH7rkPnqmu66EWZ05UxPXMpBBeAS0LtRDdjG3jHIswWmBrCp0aw7pz+lnGmnwkxGFrtq5ZR7ooR5BDuaBdtjWcw58474FBYep+PHs6yjxC4E11/22eA6UhiFcvjDp8PioNV5FHie0fb7h6zKt/TxnSlrb5vVsPlGsHQHUPK9T7dVvwMgLM1+1GHoo6Ih1W5GU5knsti35U9nP3/D8b5SQuiEbLhsrWBxAoQeOw8U0n7+pEGCRiRCTg6o8aMMDrUzWh9q4UE29uooVUAOMRkeOUbF/Gnu062U7byo3iX6HOa62wMJMFuYsp2Hor16iriTf7h8R+IBUnRuYpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTsqBT7vAngtdrpCHS9i356J0IXOGbym5gsM5KvWOX0=;
 b=ZPLZ/FcsodMf6VDl1BZDzlNfHmQw9EmfuUtGuQcs5ihaQ2ufXhbXqspkO7GEOmAvxsCFIqqih9dU2tgDwZ2l7U3igwjh4TvBtr/hxP9fYPvrkBTcPNYqqNDmeYMLZm5pKrgiI535Pycf9dGKKnRmekNPtUdb7m+yFvfRRW2KnhW9Jz/re0feEnXTLdjCogh+WvwQknLxhzkp8an8uZ6s1Ckq7mDJtlQtuv35hNBEduTMdbQ6IcniIlC+ktTNjrjAPuk6l7AIwNQlOPn6B6hFmKBuuhGIrCFLw2uiMQSJQE1gr+VbwmIxkMEPUD/syl669AFppB6SLapCw0omx+PeBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTsqBT7vAngtdrpCHS9i356J0IXOGbym5gsM5KvWOX0=;
 b=XzStPl3dsrnl/Mr5wxwL71fwWcffEh4YX6rvUt9hl/gapuqJn8OmHfTaS16LD1AQxbwNRhP3iI8FAul6GN4KVAiSj7hMpRdEkg9KbljhBY+fEDHK4PS2Yke7G/zORXbvb4e4bUB9w8WzfPbIYLlk9QGGw3OBB0jCVguP8gSYYMCQv6gdrZXwVciy9+g8w835V66kgewLlM1ASUsBt3pQEkjDs11uHp5W1IZyYu9oYYasgFOGmYfrVcWmh+Mhu5NarrNJjbnTX1JwtI5VyEluibQiaArnBeG0u7wZNacJBasAejR+ge770VLYF3Z04DuF9fYbOmLBmdd1pYVI07IRkQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9467.eurprd04.prod.outlook.com (2603:10a6:10:35b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 12:09:35 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Sat, 3 Oct 2026
 12:09:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 03 Oct 2026 20:06:44 +0800
Subject: [PATCH 2/9] gpio: mxc: fix wakeup_pads bit operations for
 correctness
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-gpio-mxc-cleanup-v1-2-dad728ce27f2@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0215.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: 51749eeb-048e-46e2-40b9-08df2147307c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	pxCwG7Me10DNQU8dErf8V01Y9zLQ4/CdajFygye2ViZc+kgixpC2NljKxp4VR0oRriYSQ/qJjkbc1MlNFVNsyvEXaP0QJ60BMbyaO8Zhq6NxsriopBUwuIi9hjQyMaHsRPDUZZKrh1tX/wbDtpfziy/LlxlHco3gnmWMj1noRyiIVZmoHoQkSxbG1UqPgqltubgSnwzWpeyPnXjWfj3RVeFfuKOD0UXhlntSau2qRLhUKfUycxVVYsKfkcGIve6COwqJAVZJbj+ZCOtKV4jFO6Cg3cyNmJAXoDZ7b+EJu9d0sOI4iFfhbzLhMn5GLq+RYgM6b/H9+V3Q3a3c4M+hH4OZfTrUPYs5AwF5tDPX6B2Py8/vhe8vDqeJCF4td2brva/YC5o8XwRDmQcQIfGXzRf5JgwhgpF2TvAVoFSxuuuGgyGlkHljN7dNB52Y30zBMhJtbET+IGep1nd5cOAA+gIePuSPtN1HJMCRPz/qZqcxhAb9bW7/xptC/x+36wOk0pvwvE2ysiv1FrY3LI+Vqi8zcfMPYKbHVB8BIprf89LRElgS3ReJ+KJ/Blh/XAZj+lAtSfsimd11yvijDZsdlZbcnuEPmSANFFgxxeVP8cadiUTPyS50IXOyvE853xrtXUqgIsHE5IEb2UnQPrrWWEW2aFPtaCqgWWjBK6mmfmY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGRFNzZvSHg5YnlvTk1iSDBmVDd0cm5MVzZYQlYvYlpFdWtUdEl5cGl0d0xo?=
 =?utf-8?B?aVpJaTAwQ0tIV0FjZmQxK0FQWDZRT2JzbjJVTHJkOUtYVVFYSmwzSW5RNzU3?=
 =?utf-8?B?NTduMkpUazJyWVVEL203LzZQNVA3NllFM3VQYXgwV1MwM0RxcUZjYUI4QmNn?=
 =?utf-8?B?QlBaekxLSEY4cEdoQ3luQXZIdmkydDdsWkl2YS8rc3dyMndFczVXc0wwbThH?=
 =?utf-8?B?STkrUUt6RkJDMmZNdDZ5RW9PZVE3dXFEaXU5c3RpOEh6d05aRTdoVUNhSDBy?=
 =?utf-8?B?TEdDRWp0SXFiakl5SXZwU1RRcnpQaDZ2RVZBdEhCejRBQ3dqbTJBZ0VWSDg1?=
 =?utf-8?B?bmp0NlFQY2lraFUySmUxWHd4WFA3ektQbjZKSkNrOEEvSUErdEhDc3h6Vlpx?=
 =?utf-8?B?dXFZS2RmK2luajBpdHE5a0dpenpPTXJKcFdvWGR2amswOGw5ek9PblVNN29G?=
 =?utf-8?B?SlhRSEJNdGljb1I4ZndtQytDbjVyZXo0VGFmRnNWL1h5MENFSFpLUDUzT0hi?=
 =?utf-8?B?NHNYYm9SKzl3cGx1eTdjYkFsalJ3ZmZNanBZU1JIU1A4RXVrUTBTMlFMU21a?=
 =?utf-8?B?Y212dExOQUp2SUhrSmZNUGdZclg5clFkMm5WMlMyUDBmQjdUak1mdGVoYTRn?=
 =?utf-8?B?QnNwck0zRUg1RDUrNE5BbkFXcm1LYytkY3o3S20rSWZMVStEQnViMm1HNS9l?=
 =?utf-8?B?SXFXYjlMd2gzYkVWZDFHQkxXSVMwdDFHY1JuNUZ1eUc3VXZlQTBBdkt2RmFZ?=
 =?utf-8?B?Z2YwYWt2ZEh4L3BTanN0MkhnVUtHOVRPRi9JOHkxUHZ6bXBBdUxTNU5wOGsw?=
 =?utf-8?B?Y09YQlhRMWtyV2doRWdCSmlDUUJYSldITGg0eHUzL0ZzRGxvUDd4ZU1ZRnVR?=
 =?utf-8?B?ak5JU25OYlNLWEFySi9IZ2R2TDRlRmlWblJtS2JiV0NoLzljNUtBa2Q5eW1j?=
 =?utf-8?B?OGR3ZFVhdUxmRU1XTnNkbVRjYTJ4SVJoc0d0eDBPMnlHR3JLaXRSM25WVXc2?=
 =?utf-8?B?TlEvTWRKSTRBYUZiM3VDZk5ZOHRCWXdhTWxjcGdoY0daVXdqSUZFa1BCR1lv?=
 =?utf-8?B?SzhRNTA3K00zNXhDMWY5NXhYaW5hc2VYbFJHclRhZGI1ckdlallHK3JEdlRV?=
 =?utf-8?B?VCtGb1huemN1UFZYdzd4YWxyOVRYd0VXaFkwSkxGY0owTkIwNGRBSU5tZjBo?=
 =?utf-8?B?TUx0VDFXdkpTS0F5TUlIVWhNUlZsY3VKMVg5eDJMbkxDTzNXV1Axc0tBc3cx?=
 =?utf-8?B?L05KZGQyNmtYakpVRk5JUGVyV0ZKZnhjRGZyYTBXcW1aYVZFTWdydURxZGhl?=
 =?utf-8?B?TmhneWp5WGhTN3hDeEIwQjJDUnJaYVJVMVJDUFlwODErU0Z1cW5Hb1YxcFpP?=
 =?utf-8?B?Q1RjNFkyU09mclE4R1RYbjdvRldZeHdsVUJ4cVc1OEg5UDJ4QWZnaWtYWmxv?=
 =?utf-8?B?d041aWczdUp2TTlabUN6UFFQKy9ad2VHdm43NlBIK1RjeU1nTUFMc0gxUXhN?=
 =?utf-8?B?UzdQM0l4ME5HTWY1YjRSRnM5K1FDYjJBelhDRngxOWEvc2VHNGFJQXdOWnZo?=
 =?utf-8?B?am9qYmJ1WFlMYk51K0lOZUYzVGFzNGpRTGVsQ2tyREZLNEg2MUZ6d3ZNU0U3?=
 =?utf-8?B?cGFucVZOWmd6VW9OWlNXK2g1TS9JV0VGMnJ6UHRpOGNhcVFjdE9LQ2UrOEU1?=
 =?utf-8?B?N1hYODFsMG1YVEE1Q0hMaU9tc29tTjZpdmFra0d0N2NxbWU4MGx6WG85dWxa?=
 =?utf-8?B?RzdhcUdzQW9pMGdZNjJHaXZhVC81MWdrV1JtSzVxVjY1UmNpRVo1N2FOOFda?=
 =?utf-8?B?UlU1S3JkdDRJL3ZBcFRSVy9Ib3QvN1hsbEw4TkhZSXRvRi9WSHltQTA1NkRP?=
 =?utf-8?B?VG1iK25za2hnRHpEUUd4d3RKVUZYVWxFOFQ2enlqcEJNcTV6a2o2SWt4c0NC?=
 =?utf-8?B?VEkyeHFrL3I1cW0rTVZGSE5za2JPelpuVHBtMkM5OVNLOThVVE9TZEpDcWtQ?=
 =?utf-8?B?a3VNcVQrSm84dGl1cXg1Qk9adnhKd3QzZDFYQ1h1NkpMZjVuenRoQ1Y1c3Uw?=
 =?utf-8?B?Tm5TKzJSc0E4TUJFcEE5VkpaNkloWSt3S1hqeHZ5cHhESXQ3M2VFWDJaMVpo?=
 =?utf-8?B?cHpqa3lNck1PT044NTlqOXQzbXZiSVZxWWo0Wi9pMzBFeEVzS2kwTzFzYjJL?=
 =?utf-8?B?eG1Ub2ptajZ1SmFLMk4rdEpwVmdUMWh5R3RmaHNLS3Z4ejV2UTJPSXFkMjUw?=
 =?utf-8?B?bnNMeGtKYUZKNUdZS1ZnZjdrbmFmWGQvTmUyQTcvVGFWbUx5Ty9Pa0VGaTI4?=
 =?utf-8?B?blNDVm1idlV2M0VVSWpmaTM5K1FwS3dSeW9Bdi9UOXZ1Wm95MXUvV3NLcGFp?=
 =?utf-8?Q?dkQJeeGnMqUcExzH29TuWdM9goe2JFd8kRexT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51749eeb-048e-46e2-40b9-08df2147307c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 12:09:35.1050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOGrd/Xk4mBRs0cB/5XihVXADeC/HFFBFLE4QHboDIDeIRxu98NHydYiggrl4+J3A17F8nNGyMVWIAH+4pauHF9BriNinDLK30ob9NDAJnwIeD8ejjYLQ0ZWbVnf079A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9467

From: Peng Fan <peng.fan@nxp.com>

Replace the open-coded BIT() / mask operations with the atomic
set_bit() / clear_bit() / test_bit() API. Atomic variants are required
because gpio_set_wake_irq() can be called concurrently for different
pins on the same port - irq_set_irq_wake() only holds the per-IRQ
descriptor lock, not a per-port lock, so concurrent modification of
different bits in wakeup_pads is possible.

However wakeup_pads field is typed as u32 but accessed via set_bit() /
clear_bit() / test_bit() which operate on unsigned long pointers. On
64-bit platforms this causes an 8-byte read-modify-write on a 4-byte
field, corrupting the adjacent is_pad_wakeup field.

Change wakeup_pads from u32 to unsigned long to match the bitops API
width requirements.

Also fix the disable path to only clear the wakeup_pads bit when
disable_irq_wake() succeeds, matching the enable path which already
checks the return value. Previously, a failed disable_irq_wake() would
still clear the bit, causing the driver to lose track of the wakeup
source.

Also fix a latent signed-shift bug: the old (1 << i) expression in
mxc_gpio_set_pad_wakeup() has implementation-defined behavior when
i == 31, since 1 is a signed int.

Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x platforms")
Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index e05f276a50e8..8a755ac1af83 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -71,7 +71,7 @@ struct mxc_gpio_port {
 	u32 both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
 	bool power_off;
-	u32 wakeup_pads;
+	unsigned long wakeup_pads;
 	bool is_pad_wakeup;
 	u32 pad_type[32];
 	const struct mxc_gpio_hwdata *hwdata;
@@ -330,13 +330,15 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
 			ret = enable_irq_wake(port->irq_high);
 		else
 			ret = enable_irq_wake(port->irq);
-		port->wakeup_pads |= BIT(gpio_idx);
+		if (!ret)
+			set_bit(gpio_idx, &port->wakeup_pads);
 	} else {
 		if (port->irq_high && (gpio_idx >= 16))
 			ret = disable_irq_wake(port->irq_high);
 		else
 			ret = disable_irq_wake(port->irq);
-		port->wakeup_pads &= ~BIT(gpio_idx);
+		if (!ret)
+			clear_bit(gpio_idx, &port->wakeup_pads);
 	}
 
 	return ret;
@@ -599,7 +601,7 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 	};
 
 	for (i = 0; i < 32; i++) {
-		if ((port->wakeup_pads & (1 << i))) {
+		if (test_bit(i, &port->wakeup_pads)) {
 			type = port->pad_type[i];
 			if (enable)
 				config = pad_type_map[type];

-- 
2.51.0

