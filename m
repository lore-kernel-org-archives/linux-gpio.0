Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ABC40B396;
	Tue,  6 Oct 2026 12:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290062; cv=fail; b=IXWoKC+QZOOXsJDfdsRKeRvo+zub2e7LfWIDkwLUbEuacA/8aO82VwPorIQ88AkrSipl9375gjkFI3VgogN4xv1+BiAQEUnSE32c+XP7mvFZ+b6TBhne+4KrwSjzNdX5cSCOUwkIdkyn7VPlrdA5XXy7BB3SeiYjsKBaWoLZegk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290062; c=relaxed/simple;
	bh=lLUTzb1fnBB4LC98rwr283TXXQtbqlObwtom/2k6GH8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Y6hHFssc/q8yWYQsqgU6pDOxc94sHck8K7dRZXwxCREOw2JLI3T35+fPQ2IAUduBgvRb/03q5iXiAvZpKYt0J5UTaDKIJlWEsfmzMlMfmYYdx7tT+7CaVmBCPBd0I3C9il0hJhQV5rJsztENS92twCoUfEYqjM2R6pW3aPtuAVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=I+uQzUmp; arc=fail smtp.client-ip=40.107.159.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="I+uQzUmp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cP37x7/h0gpMLImO+fnU1Z3OuTdXOSe1yg24wxu8R2NS30+ShxQ77SJGZqRyXLPZkJ/2IA6SEWvPoHDQrorawii/ZIF4/1FC/NXe0NtJK9igmUh17yegaHJPFr3wLUxz0qVKyCHfAQkblKVP+siQ79KRS0U+foZfPgineIZDXuhbuJDIF0m6Gt4TN9uS+YlOOds1GyqeMooKFvPN8YDsjfbLwL5bvV0Yeiv23lXqPm+ws14BecjApqCtG6gaiV2cglcMOwT9GoHn/uaCJcEgilVb8q96CXSzgjbQ7MDxpHi/kkgua7kYpbBvQthzvcMQ3tCDcOJDfC6x3oLYlm3KjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcglSZBRVts1rV1xHNEXg6w+mRG/aMKLkFrSJVtnxlk=;
 b=YS2IsqdKmFQBBRCQNM53n5RT48zMEkMCSwnuqEhacWZR4BOLmMp64LigOUcTk4r4U8TxWkVaIqa8tboossHu6GutwiiZ1UtzxbnZGj+RozsWhGsbOV07bZk7cbP45MbfkdkqHveL59uSIPKIVDOkXkn/O54xeO4QOdkGVtmJ0dqsX5y+v71cog7WG18O3JDHe+SRic4G9nKWArFqrY0Zz/SDS4jYzXQTQhoS1Sxyev7HXT7FkhAXjEbjkhKJhZ3eP8jgS45ErnvDIXceIvJM/G5WC1mhgUXflM7aztYyzV+FlevnfUHpJb5CE/ZZEvCocx8yNgm3vzqvhb6wwdtngw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcglSZBRVts1rV1xHNEXg6w+mRG/aMKLkFrSJVtnxlk=;
 b=I+uQzUmpA+8V9ojA1rYt33bxAaa91gfae2ZICxnIxlMjwNdfz5IdcMm+bzRGuI0yr4EM/Ki4pUCOLSph0xH//XMhdwGonJi9Ub5bJps8wYt9VbWzUflV4WwA/NmBY5EB4TohiPTx3f9PrVdJQefdhESM9yJfznsaKq/uun0jln1HTOZb7AHawrQ0XcwwstYDetC7kHXD3FF11MTC1frZfTYhXTWp2b+YdAjlLWaUi8xwy8mKVB9qlGleOHZfOhqTtPdIIfVoVipySk7tBTKCg9W269Tp+B0v+Eju04dQBQZnNZojdpRjQ6yu4ZkghNhrf6epXx4XGhuM9Ct8/bohiA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by FRWPR04MB11246.eurprd04.prod.outlook.com (2603:10a6:d10:171::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 12:34:11 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Tue, 6 Oct 2026
 12:34:10 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 06 Oct 2026 20:31:08 +0800
Subject: [PATCH v3 3/9] gpio: mxc: replace of_device_is_compatible() with
 hwdata flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-gpio-mxc-cleanup-v3-3-129f93302a90@nxp.com>
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
X-ClientProxiedBy: MA5P287CA0176.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|FRWPR04MB11246:EE_
X-MS-Office365-Filtering-Correlation-Id: 76031707-861b-4265-9941-08df23a61ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|366016|7416014|376014|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	IQQlYrUzYWE0IFbRN+s1p/IINo3/yxDc58kPUZa0H34mVg+BW8a7j2WNGnQ6gv7U1VrcnBQix1Un09KUIti/Vvwy5CxiagRDNJp0p47JQkcNCwJkHJiqil4u52hGB77UH38vaUpxk+iJQYYE7e3TCEKA8ZLbwnppoIhd3Gt+ATiN/yHitZGdtnpwN2pk9s0luL+ZeMUhY1LmoeXKJ/tVuYEzeh8UHMtfj5PRCDjaCPmbT1DZHukmGIAQWQE3y55ofM6jfIOD3CLPdtsnl+/57UzswXGd5TcWFfiYeVxzzcOmc6pDMKJQe95TJLcrFdnBdXEeqoiKgS1bUnTPujkZO+ZeLQYd/hv2r+wNQnSzc0m+nU1DtdVo8lXQEIqBPO0frsjeIifi4goZG6xQX7toAlyHafN/1JHRP6mdb6OYLNyz4xvOtrERCwZYUjWYHZ70Eq1kcq+67Er6oMU847ZRrs06mO2bCZUqIsnOot+4jXGYGbSa400jeNhVoqv4DOQ24xdI+HPpHbb8/9LrHtXHJi9BvC7CkMoxiabI/nvLEm1ZUTqbJ1F8Rb9H50zKFAVZ6pGy9wFRsVaD7+KPyFMJcSEVyRoZc8AM7frj5vHZ7BtzfXOu/uYY0mbsP2Qlo/2hwSIH6elHLxGelMODFqodL4QPeAqTmxDBmusPVIWFcfc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(366016)(7416014)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkRvMmVrN2tCamxoaXZKS3hCOXB2aTBidFEyNFBCOVJPaS84OEoyVElNeUQx?=
 =?utf-8?B?YlVtRUZLS3dEOXNobVRXbEsrUUVhcmRteWNTZUJOQm1CRGxJN0tRYXBNM2VL?=
 =?utf-8?B?Q2VtZVZSR3ZPaUdxQzZPWDZ1RGlKMFhQMUo0bnp1OFphbmpZNjNreVpSTmpF?=
 =?utf-8?B?cnZKcXBqS3BMc3NEZHhBYktwbFZHNFFlRXhIQzQwV3RQYk5XYXFwM20wM1Z5?=
 =?utf-8?B?QUJSanphbWpvU1crTGxKRElDZklDVFdvcWl4dktJUU9yVDJDeVoxMjhKdlU0?=
 =?utf-8?B?bW5qNEcydnFhaVZraU9INWFadUxQNkUyRC9DL0lSWTE5V2lUazZDSzJYeWNn?=
 =?utf-8?B?UzN5MnZtWEhqY2RHYU5Kd3FaRTU3cm9ZamJUWDhQT2FTQ05mUGdjdXBYSS8w?=
 =?utf-8?B?M3p6Q2gxdEY5T3NGOENGdmJRWWRhU29oYTBneEsvQ0cxaVZrMXd1dTRIZWJB?=
 =?utf-8?B?dVRsSlhwdDRhWnJiK29JS3Vrc3paRTRnY2Q3WHQ1RVhwb0FpL1NBZEkwRG1i?=
 =?utf-8?B?amRPek9obWFWMWdtRSt2SzFQYVNhZC9WWU03RXpSVytuQ1QwV3AybW1KK2Jp?=
 =?utf-8?B?aHdIcWFXZkIrcWV1MHhqdnRqcWdobnFkaFpUcVYyV1JERDg5bFFnaEFDMzZl?=
 =?utf-8?B?QlIrN2E3N2pWWkd3Uzg0RVNYNitjb25aaWJ3UUY0NTRTSFFqQ3kwdDRwZWdF?=
 =?utf-8?B?aWRQTEVVMDY0Tmh5OVBDQU9jQVRZMThpeHpUbjEvT01NbENRMGZxYmpmN241?=
 =?utf-8?B?bmFWVm1xU2s0Z1IzQllHZzcvRHRXc3Q1RlRKRUJMcFd4cnRnZWtzQ1VqKzdk?=
 =?utf-8?B?dzd1cmRVMXhhenNxckVDSHJoUkcyNzVjQmhQMTR6eW9ISGF5VG1GODlwYllv?=
 =?utf-8?B?eGxiTEhGRmxNaHF3eVJocTJaNUhBLzgvdVFKQlJHV3BGNnpYL3E1SG16dGlU?=
 =?utf-8?B?QXJKVWw2MVBJNVczaXRhcXl0bU9uL05UTVFBZmE2akRFYVl3dUNPekFGQldv?=
 =?utf-8?B?Snc1RVJDNjA0eitoQkZlbDBCbVBNVkNOVkhFSGdhNlArZFdFYlgwQkxPcHFM?=
 =?utf-8?B?bXZsbzZNR0d2UUpPQzZGVURnM00zRi9iU3ZPN3p4UElyMmswbmM3cG9nTWhL?=
 =?utf-8?B?U3FBemNhMGdGVjMwRFd1NXJXQ1puOWY3SndPLzVRbHJ4d1VXU1dIbG9MY0Q3?=
 =?utf-8?B?YzB0aityMDZmc2Y5RlhtNGZaQ0JDWTBjb2tJSHJlY2tyS3BpOW93MHdjTWJt?=
 =?utf-8?B?NkhyaWZCSkZ6TGVMTzAyUHVIZjRqOHQ4OWVGQTRQbWZhMlZIcU0ybVV1NWJC?=
 =?utf-8?B?ZTVPd0E4MjkvbEo4M0RTWVM4bmZlbVUrYVRUQXlFamVSZXN6REVhTHZIRUI0?=
 =?utf-8?B?SjdGY0J1UkFlMEFGMHlORHl0azZPVUJiZmk3VVZyeGh3b21Bcmt1SFdKOU9X?=
 =?utf-8?B?WVloRE05RWlnb0tGcDJQWklKRXRVUE83UkF5YTl5bkZqdENMWG85QnZuVmFu?=
 =?utf-8?B?QmxKVTZweURpSjhWRXRSYmhKQjJrRmFydDV0SFdBZG54SVE3RXpqUllZU09G?=
 =?utf-8?B?QzFrZEZudkR1Ti85Um9SNW9uaHdKcGE2WFFWeEIyM0t1ZVpXYzRSZTZENjhp?=
 =?utf-8?B?c3BscHFMM0tuY2dncVJESzNtM012Um9VTkRSVVQ5WThvNlJMNXV4a20wTEI0?=
 =?utf-8?B?N0o4czZEWWI1T3VMZ1ZHUXVpUG0zSlRUY3dZcEIxWFl5aWtTWlljbFN6MnJp?=
 =?utf-8?B?UGYrYVpWcnVnb0xuMVRwSmFFSXo0N3JxWXpWTk1ZbWhhQ1NIeUlZZGYwTURq?=
 =?utf-8?B?ZGxDQlVEa3Z1c2NMWDR5eWgxZ0sveTI3UWJOZTVpVEVVeHpvTlFFVmNGemFj?=
 =?utf-8?B?L3JHKzVmOUFHNzRhNHRKVDB3UTVJaVhYOWExaTVXa3g4bE9OTjB4eTVXM1VQ?=
 =?utf-8?B?QlM0RmR4MURJNG9XSmZvSlZyMklleE1KVjlPeU1BOVdpYkxnbFpmSTNOWkFW?=
 =?utf-8?B?Z3FPUFhjQ0dqajlqT2ExMUMxWlFtUWo4RDFQM2xuSHFNc1RhWGZQRE4wWVdw?=
 =?utf-8?B?ZmNSeVJaR1I1aGNGeVJ1OUFxRzlWbXBBV3dscHk5VG9YamMweXB0R3U3S2xT?=
 =?utf-8?B?ZitXeEhPdTJWT2lONzg5UWt4anROL0JjdHFod1R1UE53ODlDWEhvQW1KaDJx?=
 =?utf-8?B?dGJYRDA0Zk1zM2JNaEw0WTh5SnRUVW1XLzdnV0psT0c5aTdycXpiMlpOekJl?=
 =?utf-8?B?c0tpYjEvaVdXZmxiRHhBS29SclBxMGFqWmt0VU80a1hKcU5saElLMDUvV3cw?=
 =?utf-8?B?QkJDYXRCZEpDRFZMbDZVckUzMWVkOWZHVU56eTB0azUraG1OTjFxSlRtOTRs?=
 =?utf-8?Q?7qVA38uroZz1j983sHhChIzJbbRybUgj7ww1C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76031707-861b-4265-9941-08df23a61ef7
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:34:10.4080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4aP5g7nzzn0jTJR6hchLWsCgBGCUlIz4/1aEln53B8kTpybjpn5l4s15Rd9jo4uUUil/9rUqgBA2yj/qcWlxW2yZFz2m5Iy05TBmYxFPG0MXEUMYUPvLVgsmjij15oe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11246

From: Peng Fan <peng.fan@nxp.com>

Replace the runtime of_device_is_compatible() check for "fsl,imx7d-gpio"
with a flags field in mxc_gpio_hwdata to move the power-off capability
from a per-instance bool populated at probe time to static per-compatible
data.

Introduce MXC_GPIO_HAS_POWER_OFF and a dedicated imx7d_gpio_hwdata
instance that carries it, along with a mxc_gpio_has_power_off() helper
that replaces every former port->power_off test.

While at it, factor the register offsets shared by imx35 and imx7d into
a MXC_GPIO_HW_DATA_COMMON macro to avoid duplicating twelve identical
initializers.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 50 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 0013f73d23bf..5fbbfcebaa8f 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -33,6 +33,8 @@
 #define IMX_SCU_WAKEUP_RISE_EDGE	6
 #define IMX_SCU_WAKEUP_HIGH_LVL		7
 
+#define MXC_GPIO_HAS_POWER_OFF		BIT(0)
+
 /* device type dependent stuff */
 struct mxc_gpio_hwdata {
 	unsigned dr_reg;
@@ -47,6 +49,7 @@ struct mxc_gpio_hwdata {
 	unsigned high_level;
 	unsigned rise_edge;
 	unsigned fall_edge;
+	unsigned int flags;
 };
 
 struct mxc_gpio_reg_saved {
@@ -70,13 +73,26 @@ struct mxc_gpio_port {
 	struct device *dev;
 	u32 both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
-	bool power_off;
 	bool is_pad_wakeup;
 	unsigned long wakeup_pads;
 	u32 pad_type[32];
 	const struct mxc_gpio_hwdata *hwdata;
 };
 
+#define MXC_GPIO_HW_DATA_COMMON	\
+	.dr_reg		= 0x00,	\
+	.gdir_reg	= 0x04,	\
+	.psr_reg	= 0x08,	\
+	.icr1_reg	= 0x0c,	\
+	.icr2_reg	= 0x10,	\
+	.imr_reg	= 0x14,	\
+	.isr_reg	= 0x18,	\
+	.edge_sel_reg	= 0x1c,	\
+	.low_level	= 0x00,	\
+	.high_level	= 0x01,	\
+	.rise_edge	= 0x02,	\
+	.fall_edge	= 0x03
+
 static struct mxc_gpio_hwdata imx1_imx21_gpio_hwdata = {
 	.dr_reg		= 0x1c,
 	.gdir_reg	= 0x00,
@@ -108,20 +124,19 @@ static struct mxc_gpio_hwdata imx31_gpio_hwdata = {
 };
 
 static struct mxc_gpio_hwdata imx35_gpio_hwdata = {
-	.dr_reg		= 0x00,
-	.gdir_reg	= 0x04,
-	.psr_reg	= 0x08,
-	.icr1_reg	= 0x0c,
-	.icr2_reg	= 0x10,
-	.imr_reg	= 0x14,
-	.isr_reg	= 0x18,
-	.edge_sel_reg	= 0x1c,
-	.low_level	= 0x00,
-	.high_level	= 0x01,
-	.rise_edge	= 0x02,
-	.fall_edge	= 0x03,
+	MXC_GPIO_HW_DATA_COMMON,
+};
+
+static struct mxc_gpio_hwdata imx7d_gpio_hwdata = {
+	MXC_GPIO_HW_DATA_COMMON,
+	.flags = MXC_GPIO_HAS_POWER_OFF,
 };
 
+static inline bool mxc_gpio_has_power_off(struct mxc_gpio_port *port)
+{
+	return port->hwdata->flags & MXC_GPIO_HAS_POWER_OFF;
+}
+
 #define GPIO_DR			(port->hwdata->dr_reg)
 #define GPIO_GDIR		(port->hwdata->gdir_reg)
 #define GPIO_PSR		(port->hwdata->psr_reg)
@@ -142,7 +157,7 @@ static const struct of_device_id mxc_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx21-gpio", .data = &imx1_imx21_gpio_hwdata },
 	{ .compatible = "fsl,imx31-gpio", .data = &imx31_gpio_hwdata },
 	{ .compatible = "fsl,imx35-gpio", .data = &imx35_gpio_hwdata },
-	{ .compatible = "fsl,imx7d-gpio", .data = &imx35_gpio_hwdata },
+	{ .compatible = "fsl,imx7d-gpio", .data = &imx7d_gpio_hwdata },
 	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx35_gpio_hwdata },
 	{ .compatible = "fsl,imx8qm-gpio", .data = &imx35_gpio_hwdata },
 	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx35_gpio_hwdata },
@@ -448,9 +463,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(port->clk))
 		return PTR_ERR(port->clk);
 
-	if (of_device_is_compatible(np, "fsl,imx7d-gpio"))
-		port->power_off = true;
-
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
@@ -537,7 +549,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 static void mxc_gpio_save_regs(struct mxc_gpio_port *port)
 {
-	if (!port->power_off)
+	if (!mxc_gpio_has_power_off(port))
 		return;
 
 	port->gpio_saved_reg.icr1 = readl(port->base + GPIO_ICR1);
@@ -550,7 +562,7 @@ static void mxc_gpio_save_regs(struct mxc_gpio_port *port)
 
 static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
 {
-	if (!port->power_off)
+	if (!mxc_gpio_has_power_off(port))
 		return;
 
 	writel(port->gpio_saved_reg.icr1, port->base + GPIO_ICR1);

-- 
2.51.0

