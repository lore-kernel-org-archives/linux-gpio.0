Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011058.outbound.protection.outlook.com [52.101.70.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3762A426EAD;
	Sat,  3 Oct 2026 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029429; cv=fail; b=FpvF0fi/h14sBHy7YcQmNHN44Bkqz+2JwbOFkdCBLAYjaDRV7Us5Xo5vplTfURkUp/3WzEcrn2iAEXBpsMj7/xJTAefux9plKNx1pJT0zdotEV1M2ROb8gSZ1wwH3RQe8dFF5b5XXVqddIkGgM9UDmdYItn1ZMARUhqx+oHBoC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029429; c=relaxed/simple;
	bh=oO/o7NhDlj6GN/wCamdJoBLWF1zzCdNxchrYac8vejI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XhAZP+SL2FWyXzzt69n3Od7NAb0/MZjeTf+2PVAwcBfKK8Lxgqa9wfRB5BzWt4GjoHXDQwdS2Hpu0zHDxjdNB+Tns7XDERFPjFfNXMdp+cWwEUwu5NhwJt6G1o5AL8TAjnjQqlSfKkKBd0XB6+WE79+4YtYURfZ/ivrqGNSQKiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xXp2/BG/; arc=fail smtp.client-ip=52.101.70.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xXp2/BG/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZzz8O1Dru7+Q4NKG9jlpu8JLPW5/YuIT9NkieXz7w/DhcRXTegiGCrErxP2O+4ZELxX1nqU92UQa0daFQSV7oWdg0a7ifGDOsipJ2kYpCsD13e1FKA2bFuTE9K68YqYmJuUzp2ztpRMf/2yxHB6s7huZQZOS2aMdxgZaExRTUIH7YZLkN2PumuOAz/9sTItBi9pqTVhMtkdeOY7K2Ta4yNEIkQbca/hH0V+Jgmrw8SsnhD0rYGxnj/Yiwj+USXePNw+rocpNWwbofvXUa10tw80B89gy2JbIEXZygv1PGi9GCw7VisIXClyKB+4ClLA8mPwVMK7xTHK95PlBjUhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wv19CYrl5dozpeM8myYfHb0LDfkakFUTjAdxCXknHzQ=;
 b=hLtEjHHY19l/UTmo/qEKrKxGRXUzI9mKnQL7zAWDChTeRtQ7nEjJE6VHnvRoCKp9G9VR8xzHhu5jCItRKyjOKWWC68mXkgvjv4SgMp4615vRvWOIZ51WxjDefQd0vUxRTDP5Zv8t0I5V4lsWqw+zEei+sFpz2UiZAv8A8/mGQP7FW5bP+Oh+Awp6z2I+coE4gi8Lbxb9xPY4he2Y11FVHK2F4o3uYm4ZSzgxpzwVhfWb6w7lJc+9FxkOD8JdIIVOtItLSXtNITblwPUuw2kjrVDlugDsXuGVNMKMrPVhXowyMw1OysnVd4Ut2dVXshgwQloutkHQ5wFft587LnWXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wv19CYrl5dozpeM8myYfHb0LDfkakFUTjAdxCXknHzQ=;
 b=xXp2/BG/m0dDNd8Y1wWBEEpcJk+zzITatb1fHyzs0c3oC6bSUhwahyZezp0rVqWe4thgM7nqv10JP+INzkgKMoBeBmE04DS+Jmw230qj3s05feUDrwug66KNLUEtFnk+FUxd1RbYhfCGCJmHuAUo8U5UA+Yoyv9F1h7q/L/tlr1YokCoH6alAnhljTLz7jeWfdyfoRtwfmVz7yD9ngGHJbcEdJ7/Q/B5ZFdjMGjIsZ95uGs0yB8V356vGBxSAhxo1mqHzzAIfn08ic/iJogg9Y7XLwjFIXWR+jZ05VvOlwALKT+i3BzOQx14xz2DV1oVlHPvhOooXk+m/yBGgNE+Og==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9467.eurprd04.prod.outlook.com (2603:10a6:10:35b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 12:10:25 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Sat, 3 Oct 2026
 12:10:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 03 Oct 2026 20:06:50 +0800
Subject: [PATCH 8/9] gpio: mxc: use BIT() macro for single-bit operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-gpio-mxc-cleanup-v1-8-dad728ce27f2@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0207.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: 84e9d144-a47d-43f1-4a19-08df21474e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|6133799003|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	GqArrZdzXLoWZ91DhHKEgDWH+7ys8rP4mpn0HOS7vqQYBmMVsthmBGNCA7EwD9U6yZG0M1e+i2PTVaWyOcuK1OhwOqPhA0y3UlnAybz0AX0L1ywj4nmvaDmNhVXwHZM/88Zeq3rmVstkTQyj+atpKpUwoM/UKH3MHzQEEPJB6jXXfJaaK6xNXgatjaU4LkcXi7B7lE7zJBNdQ5WGnXdBzyXDgd6Nb03x+GgW78d36B1hfKxBPMrKjg2/5jHJphN7i578xgukfVqwWGJBsd3q2fvh148zOT7IsIxXRrZrLoIYM6Y3oHranoN3csIJqinF+ZJd+O489vX4LWLsDCUxT+4Pbb58RtBUlILdmo7Jv0R2+ibdwJZzAJ+oG1eJq6Ea/9LQBGGWSdfoMXULUJK9C/pfkEMys/ckbM2o7WnbGXg0HTsnVuq5buIEbU9jiX4r7zSvwB56kM+5snild5wiVV0/LgVqv4HSV2OqSqkyMHtZTUMyGPkcLvZZ/k2+dxuEIa6ZYVlwh0s0G9M3md9ZWXoK3/mF94ESpVwCmZFmWLN/gX7Do5UtSAj7DvEd5IY4e4SvJMoH1oLN0Utoig0TsLQgaRE5eDmZytzGN+mJGJR/QBbAziN6QqLqEG2w920WzDO7bic+z+aOmdl+04ejKtb628ffgd+OOyabd7iuEjM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTN1L2xFbXY4ajhHckU1V3lUc2NMUzRyRk5BSGhrVlBiV1lFd3FRTmpPdzBE?=
 =?utf-8?B?VmUyQlBHanFiU25USXFOZ0RKaUlQcWx0K2w4dldWZlBFd2RvS2lJbGtqNHpZ?=
 =?utf-8?B?b1BWTVEyU2hFeUNuV0dXN25QcjVsZ3c4am1VS3BWY20zRGoyblJKWmQ5blEv?=
 =?utf-8?B?QnRxcGx2VysrKzl6dUZKelJDTUJJbEhlL3I3RnVzS0YzQVhRcDNVU01BN3BD?=
 =?utf-8?B?Z2NIQVkxV3hxM0dQSHR0NWpuVitDcUI0UmZjNFhKdFdBUmlHY1hDMDFEcjJJ?=
 =?utf-8?B?RGIyL1FVTkJKd1ZhRjBGNzNtREQ1T0puQVROb2h3UElsUUZLUStTc05Ud0o2?=
 =?utf-8?B?UnE0UDVuYWtPZUFVMUhIRFkwNXRSRXdzTWQvREFZdVEvWkZUYmJjNS9TbUhB?=
 =?utf-8?B?TzFBd3ArMVJNVnhRbUZPS081ZmFZdStYb09Yb1VOakU5OTZ1citLM3Z1TDBI?=
 =?utf-8?B?a0VvRXh5SCtObUJ3ajR6eXJ1TEtBc1F0V2tCS2Z0eHVMS0FJUEtzbmV1bkhS?=
 =?utf-8?B?L0pYWGNBWUx6QzB6U1FGMDc2bEdSTDd4VmFOUjRJS2JiREFWQzZXSnVQWjhK?=
 =?utf-8?B?WWRUV3p0RVRYS1c4bmpZMUJodVhBUm0vWmw4TXlvSnM3K1BQZ2IwQzJCemRB?=
 =?utf-8?B?UWo4UW9PN0R2NTUyaEZOd1A2cVNMVHRiYTZTaXNFYkFwN1QzR1EwZGxHcDlj?=
 =?utf-8?B?cUxWSXRTOHBJMGNmVUhUYkl6T0k5S1QxWkdhekhGVTdaaGNpNXl0WnRsYy9C?=
 =?utf-8?B?Q2NqbHlOdE5uMmNRaGtzYXZzUVIvRHhYVkdOck1UNmZtMTlXS3NrcXB2UjNl?=
 =?utf-8?B?a3N1L3h3U2d6cUZMa0ZqSTdMQVk2OVN0Y24rWURZNm16YmZObW40dVc3ZEZC?=
 =?utf-8?B?NVNMWFZPY3BWY1RPeUxWQ1ltOUEwaUladXM3OHZ6amhqRk5EaFhPZ1JURE82?=
 =?utf-8?B?M1VQMm5hMHBWV2VZa0llME41TnJ1NWJCUzJhbG1rcDNDUWhXeGJXMldKUk8v?=
 =?utf-8?B?S0kxQlVjclRRdmlib3ZTRHRlUmJia28rYXFjSEhjZVpnQlpxYkRrenROQmww?=
 =?utf-8?B?WGMwVjA4UWNsMW5uampOQ3l5SHNYd1J3MnFWWWx3dWlHKzhTcmVHWkw4a3lE?=
 =?utf-8?B?QWZoamk2VVdyWDQzREl3ZVJZYnpMTVdhcEdMbEN2VUJzdUJrMUtkbVM0Qzdv?=
 =?utf-8?B?cjJiY01lTC9aVzI1MVFUNUpETjFZdUNFRFZpdlhOSUZYTnp4ZXp3VHdnK0dX?=
 =?utf-8?B?ZzF2VFV0UnZxREkzMDJiak9XektKTFdvdkRudFN2dzhTQ1NDM3JkcXFEMEJD?=
 =?utf-8?B?bll2b1lCakR5YWZtcnhMV2VLV0lueUZSLzFoRzFKNHIrRzBWNFprMzZYWXFu?=
 =?utf-8?B?VkRXOXdVM0JId0pPbUpiSGRoUGU2S3owRkZEdndnT3hmbFVKekVMSzF0UmJx?=
 =?utf-8?B?a2pjUHpWOUIvQUFObEtmbmNlSDI0Qzl2U21YbWMzbU5md2JySUZRakJOWkIr?=
 =?utf-8?B?amhaYis2eUtjV3NBVVVTSXBBenRDM2FJSGtwZ0h0QitTU0Q4ekdjZlpRS3Bt?=
 =?utf-8?B?NVFQOVlwR241Smk3REk3amJzN0ZhR1JBQmZPdWtLamh3OFRRTXFHRTBjY3dr?=
 =?utf-8?B?YVBJa0N1UnZqNnowYlhrd05DWldnY204ZmUwa1lnR1BCVGsvWlRaNlFmVUJw?=
 =?utf-8?B?L3J6c1c0Y0czS1BtZXgyaHpPNStmQTFsQml0TVMrK2JMSzgwSS9MTGJxb3lp?=
 =?utf-8?B?QmhYckRaTEFqYUdJOGpONXlUNFlEcEpaVjNXUHlaTS9YQlJRUTQzeDNXbi9L?=
 =?utf-8?B?RlJ6dDFzRE05MFl4MkdRMCtJMmFyY1F2YzFKN0xnUEMvb2FOVGJpdmNIbUQz?=
 =?utf-8?B?UVVtT0hMVWN5QjVEN2svL1ZxRkRHYmdrZCtjaURtcFRZS28vZTJDWnIwaWNF?=
 =?utf-8?B?bkJrMitrVTYvRHlhUkI4bTRQY0U0TVN1dkY4bGoyclBtOGRNaGhPV2lKUHd0?=
 =?utf-8?B?MFhWZXA1Nkg2ODYybkJlQmdUMzF3NmxsTzFQNHcyVzZ1NytrRE1IcDNodW9F?=
 =?utf-8?B?S2haMjJzdEZDSUxnSkVaTGc0dGVVd2Npa1VhcXFrTGhmdGltdEc0d0FQcEYr?=
 =?utf-8?B?NUdtdE96cGd6V2IvRGJsRXhRVkJaU2FaRDZGSWhxMTlhSTl2Y2FUbmlNZUt2?=
 =?utf-8?B?SkJvUFBwQVNJVDZMVVh2MjV0UU9SK0VraFhPdjdNZmV0djBNdldYU1oyNWpr?=
 =?utf-8?B?M2R5ZnRMZFpoMWZIVDFQZ0o2Tm1OK3E1MFBpTmJWZW8ybklGVERRUU9vc1FY?=
 =?utf-8?B?b04rUWRSL3drYkRoZ2MzakRLcHpyWHZvZU9RU3A4RG42b3AzWUowRkU5NG5w?=
 =?utf-8?Q?gX0AHfBa4BDLDepvLpEVyw6Kd8RbL7ReW0Y9N?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e9d144-a47d-43f1-4a19-08df21474e65
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 12:10:25.2700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUk50TwqtTxpc6AOukWupjal94WHOgz3ii5iq3lQAFFYJdIx0YzG902d75ozXcvI/Q4NiYGfQaFGi89KFIxIgqvPG4guk3CJLG1kcYyn1ytTLMS6xg/ygFWaDtO2anNG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9467

From: Peng Fan <peng.fan@nxp.com>

Replace open-coded '1 << n' shifts with the BIT() macro throughout
the driver for consistency and to avoid potential signed-shift issues
when the bit index is 31 (1 << 31 is implementation-defined for
signed int).

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 18ff33a0abfb..bf1207f30460 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -174,7 +174,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 	int edge;
 	void __iomem *reg = port->base;
 
-	port->both_edges &= ~(1 << gpio_idx);
+	port->both_edges &= ~BIT(gpio_idx);
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
 		edge = GPIO_INT_RISE_EDGE;
@@ -194,7 +194,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 				edge = GPIO_INT_HIGH_LEV;
 				pr_debug("mxc: set GPIO %d to high trigger\n", gpio_idx);
 			}
-			port->both_edges |= 1 << gpio_idx;
+			port->both_edges |= BIT(gpio_idx);
 		}
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
@@ -211,10 +211,10 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		if (GPIO_EDGE_SEL >= 0) {
 			val = readl(port->base + GPIO_EDGE_SEL);
 			if (edge == GPIO_INT_BOTH_EDGES)
-				writel(val | (1 << gpio_idx),
+				writel(val | BIT(gpio_idx),
 				       port->base + GPIO_EDGE_SEL);
 			else
-				writel(val & ~(1 << gpio_idx),
+				writel(val & ~BIT(gpio_idx),
 				       port->base + GPIO_EDGE_SEL);
 		}
 
@@ -224,7 +224,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 			writel(val | field_prep(MXC_ICR_MASK(gpio_idx), edge), reg);
 		}
 
-		writel(1 << gpio_idx, port->base + GPIO_ISR);
+		writel(BIT(gpio_idx), port->base + GPIO_ISR);
 		port->pad_type[gpio_idx] = type;
 	}
 
@@ -263,12 +263,12 @@ static void mxc_gpio_irq_handler(struct mxc_gpio_port *port, u32 irq_stat)
 	while (irq_stat != 0) {
 		int irqoffset = fls(irq_stat) - 1;
 
-		if (port->both_edges & (1 << irqoffset))
+		if (port->both_edges & BIT(irqoffset))
 			mxc_flip_edge(port, irqoffset);
 
 		generic_handle_domain_irq(port->domain, irqoffset);
 
-		irq_stat &= ~(1 << irqoffset);
+		irq_stat &= ~BIT(irqoffset);
 	}
 }
 

-- 
2.51.0

