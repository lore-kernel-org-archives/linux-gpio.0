Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C33640802B;
	Tue,  6 Oct 2026 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290052; cv=fail; b=a36mWgAhB8stQkhQ0ULouHpjpSNkjA2MixMkLyBx9rr3z5Z0/qa+huj/bpc/hVyAaKNDYJHJbiRRDsnWLz1TbDyk7UoZkkF4L7M970ZzmeMxEItYStBAGAjYbmC8kERWcHNvhIFXxz6qEIf8GIlFHHc81Oh767ufi3dLwYSLUnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290052; c=relaxed/simple;
	bh=kDOttNANywMV1u+AL4yD5S52RgtgJrXWwgUFOCqlQFY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tBriufmwge0jc0FkA4lVXrhyZ1gGkHvDYs7KLHatgQgl4O6adFlYpjEl0ILbsF7n60698iuVKNqlhGOAG4ACyyNJe53fWFToGrQkfYONetS5V2ZK1JV2smIAx1k56hx+YqjYpMjV36OCZy3wXRedx4B3n05z3RLvVIvLL2kZ+hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GdIgUa9T; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GdIgUa9T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyY1SYYJoly+WegIRWluIwEfmiEcQU1LpKQar/scCDodnx9dwc95UjCHFCoIyBN2TcP2DQuSMiyiPnUii2nD9QGysz/DO5wB6Q0mEcluUlY5s1mLKAYg1H6+cfE5i6/CLsjFwqNEnCjkyFtq389YXDxHfe+4duQxvwnUnb0ID1HOkKndESPpLcFCwero12zEfXu4S4DkUtJuyGOwFHg1RMVml9vg4P5LImp2JJjPAITrRDR/Ar+xj3oi07i3X8zv/ru2q+nN4lOXWM7TIAuUosuLGM2YfG/OenCXRNI4TRp1j0yVXaaHXTtksGIq8epqd4EKnoty5rXu6lkWOlBkpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjuT5ahdQaiKc1riD6ReBUM0l9oH+pXpz50A6vmk+80=;
 b=naX6dkb7RGlPgfkWaIyu7AfFKVryHM9xV7cYEMmYHlj1fpVqk8p+bJrCqvKvglxd8nRHs7rRbFglPQAzvsDJjVO+Tb6LmevJZxAEf8gYDZQ4xPyNhYv/R3d4/ieLSHaav+HZhtOtRevZC/DtAWWc8a1Nd6VpEIFGF1+dv9tmH2mvcbB/cmLo/alrzHD+Esie1F6rqJsrlSDXFE+vlZExIl44nkfMllwe2YeA3DtqB3SiigFrl8WCSK5l/9utqtAZ+JI4BYDF+TGhT72M3ypxG0UDmV+V3a0ZwM+9MLGAVm5LZI1hQ/qpHNe8+lQ1gD2E1Zi9cqQdbx1yFbcxxDyjjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjuT5ahdQaiKc1riD6ReBUM0l9oH+pXpz50A6vmk+80=;
 b=GdIgUa9TN+5Hxgv+dODo12YxYnmCZp4SvsjAfSGsJ/pBTnPiLxEOeQphpNOyijRxHoa7dW1Rf5tX1ig8TI1AkUnk3ZzNxQ5ro021yS0sgQJcDotZqkcuEs4DaO7myA+N3zB6OBuiQfIYKY84gY0uKht5rl15MXXCVeV0xnwtkjNY0G5+ZDit0AnwuQzD1OT9Qyu5Kboe4f1W49XpSuQX4YY6FYTb8owoaol8FaALqmxX7UFbDX44Xh3MOj8GAIywFQ5ZYkhKaEE/FOaVzOROHhX1Zb+SjW+2tJBatDgHy13wp9pIHFL9a5EX7t3I1IsmmrYwZjFPLFWsI6O2YnR8MA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by FRWPR04MB11246.eurprd04.prod.outlook.com (2603:10a6:d10:171::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 12:34:03 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Tue, 6 Oct 2026
 12:34:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 06 Oct 2026 20:31:07 +0800
Subject: [PATCH v3 2/9] gpio: mxc: fix wakeup_pads bit operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-gpio-mxc-cleanup-v3-2-129f93302a90@nxp.com>
References: <20261006-gpio-mxc-cleanup-v3-0-129f93302a90@nxp.com>
In-Reply-To: <20261006-gpio-mxc-cleanup-v3-0-129f93302a90@nxp.com>
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
X-ClientProxiedBy: MA5P287CA0201.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|FRWPR04MB11246:EE_
X-MS-Office365-Filtering-Correlation-Id: 779b5de8-5124-4957-4527-08df23a61ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|366016|7416014|376014|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	IsREu3h24M+HM6WwaAeRoaEMqyf2ic6E5xep4Q7CQN2+OrxMKwhS3k/i+jww5vK1970hWPHAa1iwt63K3Aj6QLOli1XLNdHjns3WhPTnsn53UFD9IWgf/VgwIwtXSJESkRlXraaaWZGxUWwV0pCgW+P4F6xycQRk9nOun1krMcNHoOS1M7zG96wePfF/7OjO4zMOf5I8wsrSf5B7t3QECwOvSAkHjEd5fROAdMg367xPxTEgdbhJ/LJ4bs49ohEsl5gr+Zk1nISqulS7wHQTf/gL8WQY3E+AlAjlFvGSiVp7VRtBl9lXAhwvttzbob+psbWiikzzTHvmTvbkaIV5H+QFx7uTXH7Zjbb37kZVLc1mjMjTmHidiSijYIBss3ev5E9EzCpYExeUmgi4qBsldzDVU4dwK2smy7B4aCVI4xUN0yhBwKrGoWXoT+fSmLZQGnvUv8WD87ODR6IOn0KNkynT2TUiM27fBxtKUKwWk8nzpPPsOJCamaZNz9s2MYsuwVb3X9RFM8oCoamTldVtncrcORomoHa1etn2359zGq12AEY6OfJgK3xAZN9PgL3pFH/rVyW/ywK7g+SqVeZzvq90uqSonCxsGL7Kghbcq+Yi7tlsvfYVkFMlMnBUYYd+LNrTkXH2U3tzVnIN2WYo2kPtKZexo9AZ1aDVx/Fe6eg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(366016)(7416014)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1VIenRNbXQ0MUR4VjgyZHBaYmx2eXRCRlN5ZW14MVN3VnhKSldqUkNLa3dW?=
 =?utf-8?B?MkoxUGc3TGtYOTlBK3FtMnYrN2xWQ295N2M0anRncmtodXJhNGZHWmJiaVhH?=
 =?utf-8?B?NnhSUlZBZzBHV3N3ZDkwVG5aKzBPVmh1V2ZNZjZleUtqWXhnQTZETjZaLzZu?=
 =?utf-8?B?MVg4SUFjdlNybWtYTU9JcmlGSG5CSmRUNEYyZ1lXU05zWitTVU9zdjhZK3Ny?=
 =?utf-8?B?eFJWWERwOXpEWVY4TCt3cElnZ09hN3Bzc1A4b1JzYVVLbytla2xkV3ErQzFT?=
 =?utf-8?B?OW9oYVMyS2lTMzlEaDVNWXBIM3lScGE0ZlI0MWRiQS8zekpHWDJhRC83OVhC?=
 =?utf-8?B?M2RCWCtma2EzYTJ2UzBEWGJNejJyN01MTXB3UWhpaXhPeVBQTkdYWmR2UVhu?=
 =?utf-8?B?SWRWUXR5aXdLb2VIU0xzNTZ5NnZFS3pMRXlTcmtoNlpyUnlJVTJhTVZnNzVq?=
 =?utf-8?B?cSswMnMwRkx3RUZyRHBRNkpSQnRCRTRWbWxKSEJraFBCYzQzOGlSaXBzdGla?=
 =?utf-8?B?bHc4K3lLZi9lcGMwL2J2azl4NURaNk9UWjd0NUhuM0ZnSzdhd2h6RnRzbzQ3?=
 =?utf-8?B?MnFJcS9IVnZjQzYrNCtPY09LZVEvYUZpYTlZMFVFNEZ5Q083UjlZNFZWc2hJ?=
 =?utf-8?B?b0hkd1V6UWlvVTRjN0YwT2l0T0NqY3BMUlVNcVZoczQ4b01iVVB0eWJpTll6?=
 =?utf-8?B?dURmZDJ3Z2xleGw1YUxJeE4yT1NORUlxVit1QWN1VU9pY1lDN2g5aEF1ZTVT?=
 =?utf-8?B?a25CT1ZoeWVaVFpibG43WkhRcU9NUFYrajE1aHBUMTdsZkJVMDJ6eE9NVGtL?=
 =?utf-8?B?b2M3Z0FrOUJRRUkyeUQ4U3QxTzVnaFAxU0RodXFQblgybTk1NzIzSzY4VERI?=
 =?utf-8?B?YThpMU93bStFbWVKTjlLRUlWeVZNOVVERFV2aExwSkZQdGtDekcveUdURmNa?=
 =?utf-8?B?eldUb0t3Zm1uU0hpcmp3c2RyOTRtdWtxRzUraWVxK3FLY3NIemRvWXNEa1BZ?=
 =?utf-8?B?SW9vNTg3Z0p2NnlrNWJ5ZHhsaVllOTkwdk5RSlFYS3JJOVpLK1ZZckJRYklm?=
 =?utf-8?B?bGlkTzlsOG1uZFpYcFdJQXRVWCtMcW1nMy85NEpIV1RuYTlwSUZRT3ptaUpJ?=
 =?utf-8?B?bWsveWVKdmhhUTZsRGVETnRlTUFPbXk2UXNoQm1KYnJ4ZHlQWmQvMm8zVExn?=
 =?utf-8?B?Z1FYZFI3dzlwN1FlUVV4V2NPcnoreUM0QVJka2VzdUszcmxxYzhza3VhT0Y1?=
 =?utf-8?B?VkZYSTFZUHpkYWgvajNZOEhjeWZ2QUJxWUs5MnZnbEpSOHVhdmlCdm1xREJ0?=
 =?utf-8?B?L200cWJSSlFKbjk3eklxdFEwUWJDU0s1bVNlZWZ2ZnRnRjM1aTRFMGJtTkpn?=
 =?utf-8?B?dVFvTExONTJtbXpxZ3lMT29ZYkxvS2J2aFprQ1JhVXJzdjhyajVIM1UzVEFz?=
 =?utf-8?B?UFhDMTB6akR5dUk4OHp6WlNtbC9SZVN1KytaVk01SnVvck5hbXJsdE1sTkpv?=
 =?utf-8?B?eTdBK3JhbnNBL0kzL0dGOFVZMlZFeTRGYkZJb3cvWDBwZnFPWVVkM2FMVHJj?=
 =?utf-8?B?OFhIWUlkdGpCZUUxeGJBKzZFWkN4Zmh6WkVzTlpBNnV0blZ4WmYxZVRWTUZ6?=
 =?utf-8?B?OVl6RnhSMkIrSk1ZOHZjZ1hPZ0U5d21RWkRkQVZzd052RjQwUUFxM3RoUkxk?=
 =?utf-8?B?N3lyVnNCTU5JdVY4SDJybUR0US8vKzFEQ2tmQlNUVE94T29IZy9OeC9VMUtX?=
 =?utf-8?B?bkJSUWVsMEFpVDhxYStUZzZReUUyR0VaLzU2TzNBQ3dsZ3ROT0tBK3QvWFRL?=
 =?utf-8?B?MEdIK1RiZXY4NkE3RktJeUdxTzZ3cC9CVC9YMmVJTjBlMWt3c3N0amIwZVlp?=
 =?utf-8?B?RStVYXVQbjVuWVE4V0JVR1pnV2Y4dW1OS3kzM0FmOUwrL3J4Q1RVN1kxMzND?=
 =?utf-8?B?WW8wM2I1VkErU2QwdkNwSWNiRUpoSkNlL2wzdHdTV1g3SUk0ZkczTmJWckhv?=
 =?utf-8?B?SkpnMzZqbG9PNXJPMDZYNGlnUWUrSkFVbm1SWXNIcnNENWRQVUxKOEJ3ZFNz?=
 =?utf-8?B?YldYTEhkVmR0RWlaZ1QxZCtjVFlReWhIM3Q3U3dzMUZtcjhLYmN6NTRQRXVR?=
 =?utf-8?B?WCtCUzFFYWhyN2VWQjVOWmJxL0lDMmdNRmF4bktNSjhPVVpsMnFFODhLa0dy?=
 =?utf-8?B?dDFhNHNqRDBhZTBFUXZjZFJQN0M4V2NtSzBhMmFRVUJ1WnpkYlBvdVFmUXFL?=
 =?utf-8?B?STJSVlVNc0ZhSXRiTFQwWlpWL2MwRDlBU2lVRko0R2NKRlhpeHdwM2VHSTVs?=
 =?utf-8?B?VWltWVZWdzhGa2Zsd3FlZVdteGxHY2d2MnVjeitpbTZGM0padVU0OU1XWERD?=
 =?utf-8?Q?eODu8ILAYrJriWWCq1nI2hqBm9ymLqI1zS1P6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779b5de8-5124-4957-4527-08df23a61ade
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:34:03.3501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTkGqEPcjRoZfqemQhsgXAWvFwqfiIWVJtml/ToN3BGFol3HFJD/kzOg5C5pWw2FXRf09uxB7PMWxuXNkeYEcq66x+ldDu47pVsHQGxQknbL+c6NPo3b2BkfDzbf/6H3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11246

From: Peng Fan <peng.fan@nxp.com>

gpio_set_wake_irq() can be called concurrently for different pins on
the same port, so need to use atomic bitops when modifying wakeup_pads.

Since wakeup_pads is u32 but assign_bit() operate on unsigned long
pointers. On 64-bit platforms this causes an 8-byte read-modify-write
on a 4-byte field, corrupting the adjacent is_pad_wakeup member.
Change wakeup_pads to unsigned long and reorder to avoid the overlap.

And the enable/disable path unconditionally sets/clears the wakeup_pads
bit even when enable_irq_wake()/disable_irq_wake() fails. Only update
the bit on success.

While at here, simplify the logic by consolidating into a single
irq_set_irq_wake() call based on the enable parameter.

Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x platforms")
Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 52 ++++++++++++++++++++++---------------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index e05f276a50e8..0013f73d23bf 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -71,8 +71,8 @@ struct mxc_gpio_port {
 	u32 both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
 	bool power_off;
-	u32 wakeup_pads;
 	bool is_pad_wakeup;
+	unsigned long wakeup_pads;
 	u32 pad_type[32];
 	const struct mxc_gpio_hwdata *hwdata;
 };
@@ -325,21 +325,17 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
 	u32 gpio_idx = d->hwirq;
 	int ret;
 
-	if (enable) {
-		if (port->irq_high && (gpio_idx >= 16))
-			ret = enable_irq_wake(port->irq_high);
-		else
-			ret = enable_irq_wake(port->irq);
-		port->wakeup_pads |= BIT(gpio_idx);
-	} else {
-		if (port->irq_high && (gpio_idx >= 16))
-			ret = disable_irq_wake(port->irq_high);
-		else
-			ret = disable_irq_wake(port->irq);
-		port->wakeup_pads &= ~BIT(gpio_idx);
-	}
+	if (port->irq_high && (gpio_idx >= 16))
+		ret = irq_set_irq_wake(port->irq_high, enable);
+	else
+		ret = irq_set_irq_wake(port->irq, enable);
 
-	return ret;
+	if (ret)
+		return ret;
+
+	assign_bit(gpio_idx, &port->wakeup_pads, enable);
+
+	return 0;
 }
 
 static int mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
@@ -598,22 +594,20 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 		IMX_SCU_WAKEUP_LOW_LVL,		/* IRQ_TYPE_LEVEL_LOW */
 	};
 
-	for (i = 0; i < 32; i++) {
-		if ((port->wakeup_pads & (1 << i))) {
-			type = port->pad_type[i];
-			if (enable)
-				config = pad_type_map[type];
-			else
-				config = IMX_SCU_WAKEUP_OFF;
-
-			if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
-				dev_warn_once(port->dev,
-					      "No falling-edge support for wakeup on i.MX8QM\n");
-				config = IMX_SCU_WAKEUP_OFF;
-			}
+	for_each_set_bit(i, &port->wakeup_pads, 32) {
+		type = port->pad_type[i];
+		if (enable)
+			config = pad_type_map[type];
+		else
+			config = IMX_SCU_WAKEUP_OFF;
 
-			ret |= mxc_gpio_generic_config(port, i, config);
+		if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
+			dev_warn_once(port->dev,
+				      "No falling-edge support for wakeup on i.MX8QM\n");
+			config = IMX_SCU_WAKEUP_OFF;
 		}
+
+		ret |= mxc_gpio_generic_config(port, i, config);
 	}
 
 	return ret;

-- 
2.51.0

