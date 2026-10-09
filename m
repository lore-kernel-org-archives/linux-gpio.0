Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013013.outbound.protection.outlook.com [52.101.83.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545A24F3ED2;
	Fri,  9 Oct 2026 18:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569318; cv=fail; b=LFcFjY6Gf1aD4XePGFLr5cnUJrMakqJuQxsJUSrvtPwWcuFYOr64FSKOq5k1Lrp45EOpeiCZ9Fwg7YOyAftteteiTMduCJQzCC+MXxmHFRC1YA7OxBbj8vza1SsgaDEzmG7IpruO7ax0swdCWDIArtuxpRTyHQBp08xmyzH0igs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569318; c=relaxed/simple;
	bh=Cdyi5bh0dQEX/F0zKZUdt8czbHqhoCMLC/HvNWPyDJc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ay+qSZk89K9m95zfg4muyeLX7Fk9EwLCJn8+T5rCy1bpMg8X/dSXl+ULbv20NPzLEHbLMcaZhGiQmZM8GMwAf0TMSd8b8hVGvlEO35DOrFtJBbon6utX/QTW6TuTfAtKfN7RPywWPbZn+xg3HyUff/IcEuGvsvhhLO9Wy27RK5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nVvQh5ZH; arc=fail smtp.client-ip=52.101.83.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nVvQh5ZH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsKRUiK0b2/jlsPohlqhZrWlrjXkw/ulc5dKriH1EXqWVoNsIqKoONboWEQYSbRmJng1XcBht9ZfsGVby+k1Oao97vcOoa/z7qhhsKhlAHWgeGrT4Y4u7Ex8Q9blvdGv//qQwhJPW9WmtEj2fopwDtYJTi4hRUkeKp25qq+Fv3nyO5eoeLa4GHDn3+tqAOwko/FdvwpDuCZavUII0W4PEYRHiUju1FZKffXiqvnYdw4SNR9G04Esrkq4mP2tuYuDVR1ocZTRjeGTlYmvUnZWBM3+0yLkUfXwM6rGb+Ne/WluIvz9ogYgOeCTuFRMa9sEF9NTmSu/F6+XW3GlHpe5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6Qax48sbKQsKudnTfFkdA9gsFNnIUG8oHxqYnjRY+s=;
 b=F/k1ipNYdWAaK2SEr/oN+Xs9sI/0hByZWPgfm/MTnhd2bu6QpmP79pAdhLnHeKSr/iRz5R7dVgrn5Db8ul9OOtfo5AZSRYnZj1gpiojiwtxv7y9XEH1VnL4UblOuY7NBEMn1MWzudgGF2A6wiIuTVMh3f7dKN7iRFfW64OBJ7qE5YK6ba9vygs5hjxyrVA1ey8wfS9NSzZPeRy9UP+y0hT9+6xH08J0xvreZBUvT9SOng3GkA7cotRPCkADFinnXpkyEPgSur/b/t2YJXZGP+Glbnv9jO4/bHsA/OQXhyfuuQH1kkM8FNCJ1AREkS73Qi/32lu+BhJYziC/u1Ql+lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6Qax48sbKQsKudnTfFkdA9gsFNnIUG8oHxqYnjRY+s=;
 b=nVvQh5ZHTGjes5RyWj5oII/DgvhkEL6Hj37nH1W1d+dVQmTiAHRm+OYul2TF8YflVDVn68s6Oa2loFAmEUeNCOJxh/gPpuXI/JjfQxTNbNpfbt05jlKyTqr/9Aos51kbOO07Q+OBMy8WrhiAcKfsG+Q03fdxMrL1yT3ryxhANhpIvOcIsLZjfTilNymTHChgmctClfABHhc0ivRdu8zNs/CDqd3HO6YlIBEQPCWCM4YB2Q54YFNHueOj30SCGnW9dJBCfSB3202uQMnIh1TBsjvsah9Kx/tYmBRXQGVf+d0YUvtal6yBD0nBaxMFH93GNKYOxxShvuUXXHWH3e97rQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11189.eurprd04.prod.outlook.com (2603:10a6:150:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:08:34 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 18:08:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 10 Oct 2026 02:05:23 +0800
Subject: [PATCH v5 02/13] gpio: mxc: fix both_edges bit operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-gpio-mxc-cleanup-v5-2-1e59e6ddfa00@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11189:EE_
X-MS-Office365-Filtering-Correlation-Id: ea13cfe0-e763-4fed-84b5-08df263054eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	3U0az+6bJKg62zejYanT9r78FHAgIfxSBteLBFBPHnHaXLhUBHA79lbUrxPmT1xJPrLNcLoPinD60gkcgsvDY/ntZhw+PPcUt4mxzF56GHYmLICl9Az3Ibsa0yP4iIU2zSwdr52uOqBbxjSRRSOL1jtJc7FxxRjuMvmubCU2sEOUgw5AJMdQhPaRjcZvE71E0U5duQkW+IZZwQ81vodPnmkEUsgO1xQqQKzZbpA5o59Gv4oCqRd333xEVM+i9/NW7+bB9ApsLTRIXA3fd2BYIMDu83xz9oXhPoksMeD8oEmvT3OK6TdMrSs2Sgs8R47463/akaak7rDXUUjHBYGu+fJhqU/6k9vJtOPAXDJQE2XbSmHuBnk7dh1xDOWFORiWrZWtdgZknIrXIwN4vn5lN30qo48p+xhWGqAphTD7FyEhJkkATWaebNv0poB9zv9rfglEQb3mCezVzIIDkikUkGHwFH7MmpDUgrpI/zkC0ALlCPpuaPVzxS++othRwKJjpwTn/u0Qkq+OJ0u3Cmsz3nzZAcfm7rgyK8sfhDZhfWO7VY2B4bcA4U1g8k0eh1f7LTW3xukPNFColnAR/GmmgpwoUvGZbfPR7aY+LbBxShJ6CQilgZ5hcR3hsKAyJtN9doblLRIe0XGpJNCMLuRc8k2t80/gxS5OaNA3xP9cq4A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWF0b2Q3K2VsejJSaXJidkxGZDkxRm1jTkw1TmlBeWNFMzYxMTkvbnFBRXhG?=
 =?utf-8?B?UzZjTUl2VWcvaHlyYno5L2M5Vi8yRTZOYzNVMzU0VUtlWkpzZC80MTMyakhE?=
 =?utf-8?B?S0tkM3UyMjEvUWVMYVFBVjBKVE16RDV4dHRSNFRLN0I5M3FEZHZuN2pzZ3hB?=
 =?utf-8?B?VXFJTVFLYXRsMDNrT1BCV2VXTDNleDlkMmRLb2NKaVNuRm8yaU5QMitNdkpp?=
 =?utf-8?B?V0Z6OFBLTnZzQUtBOEdWYkhndlZWK1VUNWFOMXlaSm0zVklIVWNjOTR6dGpo?=
 =?utf-8?B?QjVlRktqM1M2NlFQQ3NGblh2eFFwb2ZqajVTTHdjNmJyeDBDNkJENkFLZm5M?=
 =?utf-8?B?ams4UEhqenR2OGhFMytnUlJWVW9qbDUzR1ZVakFIS2FGcU10NFFsL2dOM0FQ?=
 =?utf-8?B?SWhRRlhzYStONWlpdUc0dURqaU5lMzBwZWRZR000QnM5THlQK3h2am1GVkwy?=
 =?utf-8?B?bmpLTFdraG4vcEFWR1BQY3FsaUZhV1BaUUFaSUhFR1BDcWd0MFlsS3d1NmN2?=
 =?utf-8?B?c1Z0dXNNcERvYkdGdlRiYXNtcEJ2MkFSak1BamVsWUZWSFJaZFFPR0VzbStz?=
 =?utf-8?B?a21Qbm5kMkRKVTdoMFd4TkpDSkF1UjBRMmQxSW9EYUc1N3paWTRSZE9XaTRh?=
 =?utf-8?B?djgxbDlYYWFuMDlIYVVkaVZtemRkT3RXanlRV0dIbzl0MURrNXhUUHIyOUMy?=
 =?utf-8?B?bjFYU3QwUHhWTkNJVTlxTUcxU3lsdFVLOVFIUnlwYlFtNFArc3ppWWZQc1pL?=
 =?utf-8?B?ZGluWTBxNHhxbXdzM1ZpdVJyaTE4b2tDbnZJdVgyTVFiR3ZGMlVNRU5jTUhX?=
 =?utf-8?B?ZGJLMFFiV3hxUVlJNXg5dUtrdytCRXhmM0NIckFRa2UvLzVPTDY1VFBPY1p2?=
 =?utf-8?B?TVgwYzFTOE5UT3pqdHVwZk44TFNSN09SL3dKbFZ6MGs4cmYzQ1Y3K2RXakZo?=
 =?utf-8?B?ODJzVFJ1TzRmWCtDNGtDNUI5R3l4bEZKZ3ZYbjRlVUF1VlRoRm9YRW8zT003?=
 =?utf-8?B?dUFhckM1cWRJUHhCcEVkaGFIenJuTGxPc0htdzVsTFk4NngvM20xYkErM3c5?=
 =?utf-8?B?b1IyYUp3OFZXZE03VHhJUC9DaE0wZlQxWitmZlUxbE5HSjljTzUxWkZTbWRr?=
 =?utf-8?B?MnRHREhLdXVhNHA4ZjF5OXl3NFlMOVFoK3lEUjJlVTE1VzZxQ1JOS0RhdjhP?=
 =?utf-8?B?d0pqZHZ2ekRTVDVRbkVPRmY0WlE3YXcxck04UU1wS2lzOUZseHRDQThKMGZp?=
 =?utf-8?B?SFcrZjBSUW5QSTdVTU9FM0VuMHowN2VvMzZYUnhETUdvY05xalVyd05YWGNC?=
 =?utf-8?B?d0FmY1FZczNJTTJDZzZ4REJLaTFYaVNyWUc0RnoyUVdxbjZYUG9yaWwzRXZT?=
 =?utf-8?B?NS9IQldqalozRGdDeEsxakJHdW8rTm45VklYR1FBN1JpMWlhRU5CUXdOdWNa?=
 =?utf-8?B?ZXM5Z3dMNTl4ZDNoNU1BdnhaKy9OUmUwamJTWFMyR3R3VjlxY21PUG5ycEFY?=
 =?utf-8?B?OC8yaHpMSUFuWWpOcitRTSt4dXhJb2V3UjhTd3FtUXRhdGt3ZmF5YWR6UkNm?=
 =?utf-8?B?dVFhck51azhkN0tzL1VlZERjQzNZOWpwNUZxVjlieG1sRmJSYUttaFZJb3cw?=
 =?utf-8?B?cHhNV2kxbGY1UEMvSlpIVitwU0tzbGRGditxY0Z3c1I2S2FwbEZaYmVXeFFK?=
 =?utf-8?B?U2I5OERSRHNPS0dnaEN0WWx0WmFJQjVGMkFHc2xjOHVFaHdkOTZtSGNjckt3?=
 =?utf-8?B?by9hUXZTVnVpWkMwU3BNbnhONkFYOTFLUWdoaUNxNGUwemtBSVFGYzNtcTBa?=
 =?utf-8?B?Rld3MWZlaHg5aUdCSXlVTG5wakZLdW5SYyt5MmxOSEVWdnlzOUcxK3pNQWFD?=
 =?utf-8?B?dlhldkF2ZnBvYkRNeG5mNGllaFFDSng1aFZqK3V3UTdIZDFIUWVla3FQaS9R?=
 =?utf-8?B?QnVVakUvVlBDRFIySVVOSG0zcFhIWFhuTUhzcTk0YXFZS09GZkhKSmhqbkxm?=
 =?utf-8?B?WEowUXFJMkRsQzhsOEd6MDFrd2Q2K05EeUtwVlBDWWVhbnlGOTBJeFMwd1FN?=
 =?utf-8?B?R2s1aXBqRmNTQzlET000ZEVwdTg1c2l6dEVSaG5odjBqUGZ2MHNiM2c0NHRw?=
 =?utf-8?B?cnU4WkJCdVZFcXJkaWc2T0ZieW9Jb0lwdWwyVjh3ejR2b0VxY21HZUFucldU?=
 =?utf-8?B?bzhrOW4vazU5cFo4RC9pQnlwTHFnaWt2djVoR0YvaFB5ZVNUTXhNSDhDZDNG?=
 =?utf-8?B?QU1BRzdFc3ZheENwelZGeFJzbUJ5d2xvSnlKSCt1a24venVzZDV6b3JobHRG?=
 =?utf-8?B?Uk5xOGZOeXJSQ2N5SUpDNXZvaUYzSHF0TVJNeFk0dnFhTkxiVGlVYlVwUnI1?=
 =?utf-8?Q?vfBtY/CJne7LAndasJFFKQLej4dvMGSXVYjuV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea13cfe0-e763-4fed-84b5-08df263054eb
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:08:33.7693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPLEYXh8/isIQh7JmY1Xbl99Xwr6Seons/jY/c9v+nVZJOzt/thDkyniBMLSAZ0mY11uMs8tTrUjWgkhYb54d9hCXZaKdGlHey4dL15SIxsJX3/nZZFIxV3/ANoZxRp3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11189

From: Peng Fan <peng.fan@nxp.com>

gpio_set_irq_type() can be called concurrently for different pins on
the same port.  The IRQ core serializes per irq descriptor, but
different pins have different descriptors, so on SMP systems two
concurrent gpio_set_irq_type() calls for pins on the same port run
without mutual exclusion.

The read-modify-write of port->both_edges is performed outside the
port-wide scoped_guard(gpio_generic_lock_irqsave) section, so
concurrent updates for different pins can overwrite each other,
causing missed interrupts or stuck IRQ lines on dual-edge triggered
pins.

The original uniprocessor MXC SoCs were not affected; the race
became reachable on multi-core i.MX7 and i.MX8 SoCs that reuse this
driver.

Convert both_edges from u32 to unsigned long and use set_bit(),
clear_bit(), and test_bit() to make the modifications atomic.

Fixes: 910862ec092c ("mxc: emulate GPIO interrupt on both-edges")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index e05f276a50e8..2f83a0f076bf 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -68,7 +68,7 @@ struct mxc_gpio_port {
 	struct irq_domain *domain;
 	struct gpio_generic_chip gen_gc;
 	struct device *dev;
-	u32 both_edges;
+	unsigned long both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
 	bool power_off;
 	u32 wakeup_pads;
@@ -168,7 +168,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 	int edge;
 	void __iomem *reg = port->base;
 
-	port->both_edges &= ~(1 << gpio_idx);
+	clear_bit(gpio_idx, &port->both_edges);
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
 		edge = GPIO_INT_RISE_EDGE;
@@ -188,7 +188,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 				edge = GPIO_INT_HIGH_LEV;
 				pr_debug("mxc: set GPIO %d to high trigger\n", gpio_idx);
 			}
-			port->both_edges |= 1 << gpio_idx;
+			set_bit(gpio_idx, &port->both_edges);
 		}
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
@@ -259,7 +259,7 @@ static void mxc_gpio_irq_handler(struct mxc_gpio_port *port, u32 irq_stat)
 	while (irq_stat != 0) {
 		int irqoffset = fls(irq_stat) - 1;
 
-		if (port->both_edges & (1 << irqoffset))
+		if (test_bit(irqoffset, &port->both_edges))
 			mxc_flip_edge(port, irqoffset);
 
 		generic_handle_domain_irq(port->domain, irqoffset);

-- 
2.51.0

