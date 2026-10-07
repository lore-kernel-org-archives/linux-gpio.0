Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1584A1DF3;
	Wed,  7 Oct 2026 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370277; cv=fail; b=BS+7BP9aYqMhoM5jl45R5PuCeny6/GpQ9awycb3iuueY+VQ5Bp8E0aCjhcAB/qnzWfmlvHeHkIMHZk3eh7WURY6j9l6a8wJszEgeSdXFb6RKf/jUZ51B8wZY5dFezwAoWJAsCE8GGnAHAKgwrbEbhacbKEBoXrke2H8KCM+COPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370277; c=relaxed/simple;
	bh=jWKI7C6JO2fyGnWnhSzg+2N4LANlH+tqv3dJ/liH7hY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WWxtU455kQgC43iLM+Xt6zyJjX+oEA7j8Z16XB8t+jIHL70oZbxxvBh+Y6Jm60qvjfY44kd6d1YzonA1C/RWB7Mrfj6p+nyzLInvrDEKxTMJCJ1uGI2gp3nFTrAIvg1eP7QqjtY+z3vUaJSh8Bu0t6d6Gnnc7xt5RXsdEf7v9NU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qCGiyyz8; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qCGiyyz8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vq9cRIqg0Ih6lqLW76ex7s2XY1nbGC/SIiVvPNocQtLD6auYgI/vdgSp0j2eR0A7r2nnpJJw1vjHClEw48vjV6IFuTiBBQJxhlYVf18XFeQBqqtyHTG9WOltlslcxNi/X4DP3Eoy8ss529enwC6G3SdufHxuXa60/4Ezm/+hwVgnFnnaS5ma9YX9tWZ5JyEWwdSsG4PptrDb1dPJuIjEgiPHaV7ceaeK++JhBC2KTSYVugZAigIwPAfzdzEeeDy6Gson6aroQvtK7S17lhTHOFwEgMwwtUp4w0uRft7lTRDuxN84sRhUxgnYDStSwYaUbcBAY/wTgQ2tIoRnKGaZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34j+RrZIcOKcbfOqT4ZXAE59bQZ0GBx9e8eDLhdXKX8=;
 b=lVib30SNwOC0KYUFpW1KvurM4Uj0ToeTN30v0Vw85Pg+mrQVR9rYDMpU07ye/vzGKdGW69/QYjnTgkgLp3ZfU1o+Osocb93GUKoqtoRQdLNZk+aFXF2m+xYMeoNAwJSZIsF76rcSv9NLnEYot5ZFFsL4H/gtdCIPyCfmDtazUuSxWorhlwrVXVe5odqChY1ZhquklMa9Ydh3VFepJJRsdJI4+O4w2vN8U4ZJn2Ldk3eyiA1a55LHd73RJDLHZss9ABshPiqepWajl7GEwy1U6HF54RcCIouNVIrwffeJ7iYzQ9HxNMNpseJX4a4TvDqlMVIFYK45WS5i2xJNF6bbxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34j+RrZIcOKcbfOqT4ZXAE59bQZ0GBx9e8eDLhdXKX8=;
 b=qCGiyyz8QFxoXS+GELTTRYkP+LMASMPTC2H4x9oZI5QS8eBB/YPsR96UPXWkTjiAuWTEXE3Ev/X9zbePhIVzuJDNijud9FRnasdULBtnTvBm/5GF3slbdPh768lsf+mpXfYsOq2/dsRWqggUKIUwqauE7AuXSkgyeokve4CMPRN/hlPcetL83Ogf3APS6cGLwnwxxoFAuNgJbb8gid26ZEB8icpDL3vnM7sKL1FDy5BueClysyGiazYHL5EYv5i5KGXacVibLtpYPXPtNyHRH8WgClaYRg2/DRtAvfovMFPPLQgUH8BiN9um+0OjhPSsntR9GO6rUwEpQ5ERSgsyLg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11738.eurprd04.prod.outlook.com (2603:10a6:150:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 10:47:35 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 10:47:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 18:44:20 +0800
Subject: [PATCH v4 05/10] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-gpio-mxc-cleanup-v4-5-c9f5a8b50df9@nxp.com>
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
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11738:EE_
X-MS-Office365-Filtering-Correlation-Id: 31127f97-b35f-4324-b105-08df24606561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|19092799006|366016|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ho7eAT3VSQsmuQY53W0qNivo0+OnjuMe6F5pJMqCeNqziOmtU5Jah0qpFtzi9CykPq37Ib6UUWEBjdDlZMld9N6p3jInUb4/rT6ChPNhLM82PHxl8qrujZ0viuZNtqCw/eA8lVhIlECOr6QjRxKK+wjkHwGVPcgF9j1y4b9wAF86FLveKRIAwolIaiEjedyrcSnqCvSOIPjMVMBVxAs5T1jyy6i8C0twepoRCJtcQFgtBr/D7VIbpyqKzM774YWc684Zx/6/3AnY1gy7LXy7gjI85OECb9E7j7O/NiXCfFCDUoBmCVgO0hYIULQI/y/rjMxo95sINSI/S+hZdRslAHYvU7vOAXnwXs8nBYV56fHsoMBeN5YQnp8l89YTYPPKlwd9t5MEonzSMApZKDv+9E5jWqOqlHQb9Oo4ECfh57TSvF6Lyjhrf1dtvyezWpUtoT+YINiU5KPjl6AUnymaYOJnghLmqAUMeHtpldWM8RJQqIbvR4NJnLblhGLbSJlkRqvOusZb2FmrZRSeSrhaSS82dxzXHKdGA4qFYOKWubHXIPncks3eVUM8h4uxhnOuTZqmyxielUkIY43maKcdhZx2eoCIC646LPer/yhPaNJV+GNZzsOMk7ioaqjJ3xE4YdA0u9zNHKqPXqLvlI89D28RYMEqmiWsNiQsTcJ/oeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(19092799006)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUJpMkQwNk9aelUxTXF3TDZycHBnbUdEMDJBZGZMeFBmMDdDYWJGZEJDV3I4?=
 =?utf-8?B?R25KR3pNeTVkYmVYOTVYUW5KeDVHNFNvM2tudkpKRmFoelBISHgxa3J4b0J5?=
 =?utf-8?B?dFdleGdiUDNhT3VZQktzYnkzcmYxZm5ZdEN6Znh5alhERXJIRzB0Y0ZZWTJs?=
 =?utf-8?B?SXBlZ0lwZ1lxTUNvS1R6VUk4dUZkS2MvUWxBMXFMOVV3QlVaSWJOWUY0RW1H?=
 =?utf-8?B?RmRPTGZwUjlhRFhXTGJWQitCRGhHeUdaQnNYVXRFbENXR3VjWHZ3Nm1WdmlX?=
 =?utf-8?B?T2FvZk5tN2Z6QVl6ckszS21KNkg3WDJPUmJWNjBMb1l1dGx3M2FzZ1VBTnFB?=
 =?utf-8?B?S2lvaFJ5VEFYeUMrS2JiNXgvQi9uaEZLMzcrOW5jR3QvYnZXaW9uRHpVWmpR?=
 =?utf-8?B?T2xjWTdqdzdhc1NyMmc2cnJyb2ordXFaK0o1eGR6NzV3WUplOXhkWS94MHBj?=
 =?utf-8?B?NlBKbktZWDhiSGdLWWV1NDBFT0ltdjVRSnNHMEVJaTF5MGtEQWlYd0pYKzA4?=
 =?utf-8?B?RXVyM3pxbXdOR25HWFlvM2hML0kvTjhEQlJMZnNKOWtFd0xZOFVXYURjczhF?=
 =?utf-8?B?L09uekRwWWdnRENHbVlpNkorWStjUUZmMEdMUEowK0s5ZzdEU3UzUlNRRW5K?=
 =?utf-8?B?UmxvWktYOVFtVTU3c2R5VXBmYnFUVFdadGNOUUcwSFQxWEh3djdvZVlhajl3?=
 =?utf-8?B?MzZKeDNTSXhyeW13VWQ4c0Z1REZDdHV6R3JleXFiSkFDQVZCc0dybmJEZE1F?=
 =?utf-8?B?MjcyVFRIY0E4aStjcGdPTUFVa1A2SkVRdVFpaHJqbzRHV1hLWDJpcFlIb045?=
 =?utf-8?B?MCtrNE82UVI0QSt3TVBtOHZKRit1UEpmTTAySHl6cmRyWXFFTDBzQTFJU2JW?=
 =?utf-8?B?aTFFSTdEZldUbXc4Umt1YnJxbE81d29PODJTYVZZbHlFaHoxMzZMT29XY0Nu?=
 =?utf-8?B?eHBGTHJpQ2V1Y2I3eEc1RzhRQks1WE9HNUNQeDAwT25ZbzA2RmdxM1FjaVVJ?=
 =?utf-8?B?T1Z3ckFOeTg3NnVHSjlZZldueW0vNnIxbzlGcWhuSWQyaitGZmMzeVpWNGdV?=
 =?utf-8?B?a0pOVk1mYVVtazBuMFJRWjZYS1JyL1dGSWlZSi9PbE1KTmt2QU4xajdxUTZk?=
 =?utf-8?B?UXBwbUtmVGlEc04xUTk3dy94L1o1OS80TlAvUHNleC91bGZCNUpnN3JHbDMr?=
 =?utf-8?B?akZoWHh1bXg5ekJuWnBZUzNBQVl4N3lsckVzRVVaUis0MFBEODRFZ0lvcXBG?=
 =?utf-8?B?czBobmM3cnJCVmxIOTNiblQ2QVlNL1c3eG1FWXlaNmVKOFBKbkYvVkw5eHRn?=
 =?utf-8?B?cGRHREFSbndPRzM4bFRRUXVRZGFVV0F3YzNocDFPYTVCTVpEbjhRR0FzdXpa?=
 =?utf-8?B?K2V3VUtEWnhLUW0yRGdJMExUenJRc2xDSXVKaDVPbEJqSVlVb2tDRTFUU21v?=
 =?utf-8?B?ZXRhcUJrRXpSdzAyOHdmVzcyMmh3UHRqZ1pzSU5tV2w4ZGpQUEFOU1czQndq?=
 =?utf-8?B?TDRhcUFuZmd2cVZVRTdocUhBVUdhQTFRaGpSMUp0ekhISlVZZVVsUTBUREpG?=
 =?utf-8?B?bmU1SGtDNllJMWQveEV6TDhKaG9uYTVCUUt5YVc2TVNZYWI2YUZiUkthK3lp?=
 =?utf-8?B?WVBkLzRsV21qNWZYU2hhQmw4cERQb2M1SVhyNUQ1YjVRV3BmQVliZjdwd25F?=
 =?utf-8?B?NUUwNWtXR0hzOHBMYmZBb3JyLy9HbTEzRlJsUEVTaEx0MWtSdWliOHhmWGcw?=
 =?utf-8?B?OWhROS9sTE92N2lSU2FDdFIyQmNuT2dLbFhwaytNamJPZnRkTzhOM3EyaU42?=
 =?utf-8?B?VHM2T3Y5YjQ3bFBESzJ4dGIyajNCSDhUVHhoRHlEMWQySkp1VWQwU3dEM0VM?=
 =?utf-8?B?UGFQTVU4M1ljU2RSMjJWWHNZYzc5MENTbGpzNkZXMURmb1MwS1BjOWgra3VW?=
 =?utf-8?B?QVFXQ2hnaGZvK0FQTi9zT2pSSE5ydWlaNEs0TmpzOFZsTDFvY1hJb1UvMm5S?=
 =?utf-8?B?UUdMQ0NwdFZVcFBwWTdob1lZRGk5ZmhvSTl3cjVKQmhmR2dGZ2F4TDJyUzR3?=
 =?utf-8?B?VWZKZndGWlBvSmtDc2VCb1krVkVGRCtmSXFLL1ZTbkduN0lUSnN0TFl4WmJq?=
 =?utf-8?B?Nm9CczI2aS9aOUZyR0RMNzlnVjBKanppZmVDY0pERXFISWQvY0RXcEJMcjBX?=
 =?utf-8?B?QnRDeitZVU5BbWpOKzdCVGlHM3dQTmkvVHNIU1hjbEY2NUVvcElQbHNrMVow?=
 =?utf-8?B?OUpoS2hTT0puVm16WFdCaFBxWlJOSzJlN21JbFJ4U2NXb0FGUHhRWjk4Qnla?=
 =?utf-8?B?SjZIQjdacnhLVlplRzU4Q0x1Y1hHYmJVbmR3dkFoei9ZcWFCMklJTmIzTTBU?=
 =?utf-8?Q?T5eXPMijV6yrdFhmIvwj2dynM4v+Ig27b2NO+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31127f97-b35f-4324-b105-08df24606561
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:47:34.8914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9a3MQ4DpG9cCivXPmZH54dSaq9ktJsCpOS4+ks281nnKmNOMIprQa6ymreaOsEtQEIHtsgP8nnwiwTsrVqyjTYb/Evc4QHbuoe/hODvQH45A9c+7LTp0NTUq8qz666PS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11738

From: Peng Fan <peng.fan@nxp.com>

mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
of_device_is_compatible() on every invocation to determine pad wakeup
capability and i.MX8QM-specific behavior.  These properties are
invariant for the lifetime of the device.

Extend the hwdata flags scheme introduced in the previous commit with
MXC_GPIO_HAS_PAD_WAKEUP and MXC_GPIO_IS_IMX8QM, adding dedicated
hwdata instances for imx8qm and imx8qxp (also used by imx8dxl).
This replaces the repeated device tree string comparisons in the
suspend/resume path with simple flag tests on static per-compatible
data.

While at it, clean up mxc_gpio_generic_config() to use a local ret
variable for clarity instead of the == 0 comparison.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 46 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index c08f0b59d284..5da603569d88 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -34,6 +34,8 @@
 #define IMX_SCU_WAKEUP_HIGH_LVL		7
 
 #define MXC_GPIO_HAS_POWER_OFF		BIT(0)
+#define MXC_GPIO_HAS_PAD_WAKEUP		BIT(1)
+#define MXC_GPIO_IS_IMX8QM		BIT(2)
 
 /* device type dependent stuff */
 struct mxc_gpio_hwdata {
@@ -132,6 +134,26 @@ static struct mxc_gpio_hwdata imx7d_gpio_hwdata = {
 	.flags = MXC_GPIO_HAS_POWER_OFF,
 };
 
+static struct mxc_gpio_hwdata imx8qm_gpio_hwdata = {
+	MXC_GPIO_HW_DATA_COMMON,
+	.flags = MXC_GPIO_IS_IMX8QM | MXC_GPIO_HAS_PAD_WAKEUP,
+};
+
+static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata = {
+	MXC_GPIO_HW_DATA_COMMON,
+	.flags = MXC_GPIO_HAS_PAD_WAKEUP,
+};
+
+static inline bool mxc_gpio_is_imx8qm(struct mxc_gpio_port *port)
+{
+	return port->hwdata->flags & MXC_GPIO_IS_IMX8QM;
+}
+
+static inline bool mxc_gpio_has_pad_wakeup(struct mxc_gpio_port *port)
+{
+	return port->hwdata->flags & MXC_GPIO_HAS_PAD_WAKEUP;
+}
+
 static inline bool mxc_gpio_has_power_off(struct mxc_gpio_port *port)
 {
 	return port->hwdata->flags & MXC_GPIO_HAS_POWER_OFF;
@@ -158,9 +180,9 @@ static const struct of_device_id mxc_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx31-gpio", .data = &imx31_gpio_hwdata },
 	{ .compatible = "fsl,imx35-gpio", .data = &imx35_gpio_hwdata },
 	{ .compatible = "fsl,imx7d-gpio", .data = &imx7d_gpio_hwdata },
-	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx35_gpio_hwdata },
-	{ .compatible = "fsl,imx8qm-gpio", .data = &imx35_gpio_hwdata },
-	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx35_gpio_hwdata },
+	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx8qxp_gpio_hwdata },
+	{ .compatible = "fsl,imx8qm-gpio", .data = &imx8qm_gpio_hwdata },
+	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx8qxp_gpio_hwdata },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxc_gpio_dt_ids);
@@ -575,15 +597,16 @@ static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
 static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
 		unsigned int offset, unsigned long conf)
 {
-	struct device_node *np = port->dev->of_node;
+	int ret;
+
+	if (!mxc_gpio_has_pad_wakeup(port))
+		return false;
 
-	if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
-	    of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
-	    of_device_is_compatible(np, "fsl,imx8qm-gpio"))
-		return (gpiochip_generic_config(&port->gen_gc.gc,
-						offset, conf) == 0);
+	ret = gpiochip_generic_config(&port->gen_gc.gc, offset, conf);
+	if (ret)
+		return false;
 
-	return false;
+	return true;
 }
 
 static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
@@ -591,7 +614,6 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 	unsigned long config;
 	bool ret = false;
 	int i, type;
-	bool is_imx8qm = of_device_is_compatible(port->dev->of_node, "fsl,imx8qm-gpio");
 
 	static const u32 pad_type_map[] = {
 		IMX_SCU_WAKEUP_OFF,		/* 0 */
@@ -612,7 +634,7 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 		else
 			config = IMX_SCU_WAKEUP_OFF;
 
-		if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
+		if (mxc_gpio_is_imx8qm(port) && config == IMX_SCU_WAKEUP_FALL_EDGE) {
 			dev_warn_once(port->dev,
 				      "No falling-edge support for wakeup on i.MX8QM\n");
 			config = IMX_SCU_WAKEUP_OFF;

-- 
2.51.0

