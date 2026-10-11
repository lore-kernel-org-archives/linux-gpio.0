Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60F8433E81;
	Sun, 11 Oct 2026 11:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719657; cv=fail; b=nCFrgQ/cB7sU0exljpOjEYN4T6xsYX2i7nI2hC/qMJgnNNp+Db1J4+FWCDyFbpJgoX0VRrm3a2cG52kf4a4pZF4NtTlrNNBqf4xRysFgQLfI5OAj4xwQbaNXqDsJ4weefFHLSvCU53rsmM9ddb4j+vXz6pj1TE2tViQdScEek+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719657; c=relaxed/simple;
	bh=2bfji0SY69Z9qz2q+KI55/R9XM/EpcdkLGmjMG2OPLM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=L+ekU0ZuI23KAFb4jL9WXTZkVFaMU603O+j4qjKcDPLvYgA3PhczacigM4/3vMf0dhlB9Gs5DsSopDO2HB5iqGN96Mvy130CbgL7D+h5Tw1n4nAegyJYaF2nVVxA9c4PMKB9vnV8YbGEntvcOKnZ6telDwjlPC0AdDoGLeTQ0PE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gG7JtuEm; arc=fail smtp.client-ip=52.101.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gG7JtuEm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/jkM8vASyTxCAkMXfCfguBNoOCzngmxJBxd2nKm84RAYx7eKMmVy32Zp8rrrDX+maWTJLnnSOCgKK2Ria3PJNdHlOO6RKhsi2jLcd16qNjf1uvCElaLnDsaw+dIqOL0NB27Ih+CboG1tzrVUVo06+wJxF5fyfxlm/e4q8xyvJlYj1euDCcp5XuIHyO9MHszUy/sEsYxRLrPH08mLW6cI/YSAFbcFpqh42mWwxGUxHOltyodQeo5c7zD4gLZKhCLEzzam0RwW1HrUfWUE91dD3H1Lv16rQkMU37cSKvrfJ/kxgJpp9qAbQip5DGrBISHQt8W+sJXJXUWdyC1FrJtAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxhC2UTg+9RF0gl4JPeMWHVdxFLrG6SJJq2evPjsVF4=;
 b=jqTIso+1iTEDn5/5AACksvMIDbblbWLG1Mo2GJwexvHiSNJgpYoXbJor79QlQLBAcCupKG7nlM3JoaL8K1287i3TvNeCs85sfMtavEbAtfEg9whcErEw5kHO7B3On/VW4jzEaeXeNRz6o35AiO0THWoG4p5WxGBdxP4TXbjaFu0u8QSft0fy0x8jNbaXX10aZ68oGYfdRDtZ8+2DbmcPqzpWfEqfgv92Na0tVbkowR3swoc0uill+NjUA7KCqWbDtnuVRjt8B9OaCKn4HfrSJ6WUWoCZWIS2KnY7vwN7JWO35zO9wNY+6HxYKJgwMGNSkw7uOHg+f0cGd5cNGstGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxhC2UTg+9RF0gl4JPeMWHVdxFLrG6SJJq2evPjsVF4=;
 b=gG7JtuEmL4feZYuPQTgoEVK2PQQ1wPUEdu8xrYoNWujU6EyZc9ZqhD70+LPR/lbJ7MjM3LhRSreEUreNjLwZsQO3oME/I9CKO2htPdhyRSoi5K0ziDZqvp/k7PDTwHN/7u3vFYcvkJtrn0gVXNV4jrZF2cC24DDfrZGU4HW3V0TR7ChyvDmU7nbjZyPOwft8f6gOFDiLxmGalOdsk1Pcxt/KQzHJPhVeSi7eW0TcPMBf/9uEZwOlsXiwIDqu4vzz0l3pJLEfY7uDK2zNfUnYlb2WM0RcPvpWyfd3GsuoUZtFe9TxFBAAiK8nzribB2SivF7ASb1aIZl11wSSg6suLA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:54:11 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:54:11 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Oct 2026 19:51:23 +0800
Subject: [PATCH v6 02/13] gpio: mxc: fix both_edges bit operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-gpio-mxc-cleanup-v6-2-cb47ce2ad758@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: fdc166c1-2220-4295-f42f-08df278e5cf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|6133799003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fG+Io8/7Xex2Wx50Y4oKUQlkKexnn4sZu8hpOl71lM/NzdgmJryE/INiYcgx3b71CgGBLw6Y4gXb5k9bWB+bk4cWKIkC+3pHU6kg7EHmnkV0RdVfjQlM3dQBxCGZkRBRjHDXGl5BrqI8jzL9DCVaPMAKZJ6lPeSviOJ4Rd+YG9nif4EIB12plqE7FVBsFVyBPUbDJdKw5V4RVonjC5xwlxLTTAqwLq3TQ8A/YEGOzKmVPxOfTvsxL3DgldQ1yoKZivVONvktXl0E+w8jcdoeXNuwgCS9+DvexI7xsHCzthVIhEQTwFLkm1LR2yMNcAMLTXWbawnXHpRPwqOcQxBx+yKDT2kDztoQ0KwynWe6W3KrZl8WsifdFh3wyzyLip2ORYp3wV4RImys1EJApd8mZbbfIZBKTbuTJ7egcPwrZigvG9k6SzSktOERxuYiB0CSlHYDBhuJ4rmMN9a4vqcGh7qkz4AN3O8AmH79Af/bCNOuMuJX8TECkgS8x9aFjkggydi2cj7ssyFTzr6HelPKBixPOiLsi1twJf+3dAGDKvX4LViOnw0W5h+PH8tb2jqjCSjulMrzpu5mggAyFSLE6wDxTrSbBRRT1d1iCyBAEsmy18ylkAqTC2awwvtiRP2nBdQyyhMSrMnJpWZ/S7v+Vv+WI6/C7mLNBilzZKWTB7o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1RhdUczWk92SGV2emQ3NEdvenJhMWxPUDhRTHRtNWdFcGRvdHVaS0pDM2t2?=
 =?utf-8?B?elIwdi9vSUZUZ21nazVPNFlvUStRUEE1MjloT3lSenNJazVteWRoY25BaFFr?=
 =?utf-8?B?S0VLWUlFVTlDYUxaM3J2MDg2UUZybjFCUkFMZHFNcjNLZllyb2VQSFRteHlV?=
 =?utf-8?B?bTJoZ3EzSUd3d0VXTVZPRmFiNUZqZjliVkVrV0I0Zzg2NWcyK3dhYlNMOU5T?=
 =?utf-8?B?WDJ0N3EyYlBlb1RvQnU5Z29qY3VvZmp3QmlGeUNGakw1SzZUbExNb1FOMFYx?=
 =?utf-8?B?RnBYUHlIUm9NbStKYnJ1dzY5Y0NyRjVWVE9MaHhSVWZmRnlCUldGbU5QQjhS?=
 =?utf-8?B?dUQwVklUOVhSL05Ld0dFYnl5eWFJTnNydWVzdmFOQWZYVlFBY2hnV0VXV3Vo?=
 =?utf-8?B?bG1nelU4NVUrMFUrRDBMdktldXhjR3Y2TVFkOENKQ3pxMTdFSjZHRS9WWk9n?=
 =?utf-8?B?U0ZxVGNKSXRCSHlFVUwvajBoZEx2QlpHQ3VMMVNVUFBrVGJSNGU2ZFFEQmJo?=
 =?utf-8?B?QmYvNStoaTVSdGlkTjJQbXpWYTQ4RnVxRHY4M1dQSmM3TGh1N21xRGtob0li?=
 =?utf-8?B?RDJUMDJOQlJvM0hLczhzTzZmbmVpckhCMkZGcTl2bm91eFhFajltK294WDk2?=
 =?utf-8?B?a2g3SWZJbEIvbWJFYnlvcTRqc0JwZ214WmVDNW5VclgzTUtOOFBzclBoUXh5?=
 =?utf-8?B?UmlQUTNGNlVNWUxHRHBHemhVMThTS0xFTkZKUXphejloLzlGMzdGSWsvenR2?=
 =?utf-8?B?Wlpsd1BDZnlBN1FOTzk1akxFak82TEtjOFJLTm5BUTFVYjlvMnJnMkZ3Rlht?=
 =?utf-8?B?SUNhVG00bzYwSkVuRklvU01IdGVJUjdlT1VTbXNuVmczR2xDTFFaV1dzQi83?=
 =?utf-8?B?dnBkK2lhWm5RdXZsWXhzZVU4YnRXZGRUMVQ1T0VmVUpOOTFEMEVJdWpEaGxi?=
 =?utf-8?B?dWxyeStUcFdaVFNTbXBySFN0bS9Id253eEJ6dzFDZ0tRNHF1d0lKVS9pTW5X?=
 =?utf-8?B?djB0UUc4MVhMMzgxdjF6MXFodUlrY1JKZm9GM04wSHk4RlhLeEo4WFpzbDlW?=
 =?utf-8?B?cmtTZHFack1iZlQ4VEViU0FNSXl3RnZlWkowTUkvZWZZWm5HMjNqOU1ldnc5?=
 =?utf-8?B?TmZXc3E5cDM2R2FLS3RNMGhsZ1k0cUV2OHp0dExhTjZYWDRUU0FON0ludHJq?=
 =?utf-8?B?OENNQWhZV3RSVDBuZTZJMmNFcDFnM3pMOTRIZ1FuMXlaQ0w4V1RZYVJrVWRH?=
 =?utf-8?B?T3I5RGU2eVNYYlFpaEEvSS9xeVQrR1hZWHJWd0ZiQitkWEhraExkUGZqOGRY?=
 =?utf-8?B?bVdleU01aVhCV0lyYllqTGNDbmlrWlNHTW5SanR0dmJ6WktkaFcyclRxVkI3?=
 =?utf-8?B?ekdwUnRyZlYzWFVubjBIOVNXYlZFdGozdDFjQkQvK0VVNnVIQlV1OTJwVmFl?=
 =?utf-8?B?M0ZTSEhoWk9aN1hCNjZzZzU4RUtZTUg0V3g3dHRqeWlQdmUrZlRLTG5Qbkhz?=
 =?utf-8?B?cVlETWUzWE5xdU45aWJ0YkNHMFlPZVhpaGNweURVM2JIV05yRnZHenQwOHlF?=
 =?utf-8?B?UVJrSzlZSjVtR1Z6YnAxV2w3QzN4OVZzc2ZPZk9heWh2Q1FHRmVYcENqSW9y?=
 =?utf-8?B?ZG5rWk9uTzE2ZjdIR01yR1lsaE5jS1d0MHdHVGpkZncvTWpKcmpBM0tIQWh6?=
 =?utf-8?B?Y2p6SVJwdDd6RVc4SlRuU2k1Wlptc0RQM3Y0WGVIdXBHYWVuTWxIMENGT0th?=
 =?utf-8?B?ZVF6UnpZbEUwd2Y0dUtFcFlDNHFLSlhZQnBGcU96MU1jeUlnbCt4RWRWeklR?=
 =?utf-8?B?bXBiN0ZqbDlwSmdqd2tOd0RPT3YycVFqQzBoOC9VbzdaUG44UDNQQWlyWS9t?=
 =?utf-8?B?L29hcVhoYUpETVRONTVPU01yQjZzY1gwN1N6TFJESDVnemxaMkEyZUFYVDQ1?=
 =?utf-8?B?d250MmRqVy9zYzNlb2FmQlQxemx6YXhEOHVVRVdiSlovQ3I1Z0YvK1VvL3dP?=
 =?utf-8?B?TG44SldIRUxCNWdqTTVneFNleEQ1RjA3UTA5TGxnWFJDMzdDV2tXYzlvR1da?=
 =?utf-8?B?NEhFaHFIczkraTFsTGlUZUZMWE1rdEw3N0RsODRKY2xNMDcwWUNrUkNGeUV3?=
 =?utf-8?B?ZEFjWUo0LzM2dkk5VG1HaG1GTmdBa2JUVkZ5LzllK1NkQ1ArRmxCNU12YWkz?=
 =?utf-8?B?SFc4NktIV1d2V3gyZ01VY2l6Y08zblk2MUU4a2JpV0YrdWRLZmhWS3JrdlUy?=
 =?utf-8?B?UDNOU3VTanVETll6eFpncFh0ZkNEcFhTMmo4Z0x0NzUxUmJLcHA1b0VrYWQz?=
 =?utf-8?B?cDEyRHh3Q1liTmdHYllXWEc1bEpmR0ZvSEIwU0x4c284cTh5czFlUFdZQVdv?=
 =?utf-8?Q?oBP6ZpyoHHf0N1aEecw1nnWyeXIqtOUI1YspM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc166c1-2220-4295-f42f-08df278e5cf1
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:54:11.0964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kn9JMad2IgusgpfpBhUpjLhnz2+clDt19mXl5pMCnSHlfuo8iMQBbF/pw8xLyBf51VX80tkjQiMk96tsbb+URnblChUIRFfV6j0QSbr6xZj2LJGLB1QlvNjXLztFjn8m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

