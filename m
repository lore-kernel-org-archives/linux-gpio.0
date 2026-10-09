Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011070.outbound.protection.outlook.com [40.107.130.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870C84F648F;
	Fri,  9 Oct 2026 18:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569359; cv=fail; b=OzCsk+nAMIB+6/PV6kh/sBasD2blmqB1MM9tOG4AMTRWz5tNtPoYDpIKJe7yX77m00U+mi5Lujeo2DH36r4wvSJ3mvGBud96TTLsh2L6rbosGo5tM3/Jm+NQPFfMCCQlLpwl/70C5CdnOAmjHEa63NroPKtivRGCfHEWpKLdOw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569359; c=relaxed/simple;
	bh=LpOaOnufWgT6FHUSeZQ8qh17hI27kQdIri8jGTG6/rs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XYJmJbBQZO6kHdbSwuIOe8i7HlvfA/PaixnF8pJN7XOabi8X7qo3Wz1gR7AneV9vS0O/RTKwPQ6CZo4390efQD2maYV+v3OWLCZlO8KKwK8AR3MQrJUiMLtrTYbk1ZAITIknYYAPSpqyETxV10/9JFr/kvHOdvOm5e+3W6Cn8L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PV7N7inb; arc=fail smtp.client-ip=40.107.130.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PV7N7inb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=modTL73RfkPkDoVy54psb7C8s9NEUDDst/B+VeUTSlMeXADfDQ11tbEUAgZiPjkOgChgrth+G3GLilx75p4exLPhAzPMqAc3DGmmFYrmoX4j7OfHA0Eprr4x8xKAN/vo/GQpSKewqlgzB9t71dPGNBccVSJ8JnsFLXLA77WpjWtWWmIa8zDXhPS6sUbzFjjr4x97I0lY9VAnEQmdSp8vtsc+AKiXpvLonmnUespJ7YebjyvjFQBLyQ79nroOgThV+cS3hBTq0ejMDqpZJw+trTdQLiEs/8loMTHM1qqLy9Bq3mr14KwlLLzzSAzT55Il+h4VM2QUoFaP7OOIUP0myA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEOCqVRfAiW88GiCCC2TQqLZPy4/MseSFdVIjaTL3Kc=;
 b=Oq5f0X+3BFPOdFntOcVYugJZmV2lrhLqPDWnlSbEwg2Kno2N16+ynPrac2OtsOZbwOnjJg67zQ8omxN3tb/YCL+x6VK+eUnJ2yxertXL5A0Ox+XPkMF7xCt5JZXMbu8o8L7r2pYrLOoPaYbrt3XiSSo+U4pGRLrTS+ZzRwacPhXBP9PDauaZniLzsRrZlMnx2lhdvji/0tmroJJm1CupWSqiLVQnRQkhJ/s5ABibfPkoYlUDcd8bqCjX71Ec58vMrnXeVvOUocSrU4s1wKnz+x9wrVtwaqULYyjzzoHcV9FCRsuTNUj7ot51t3DuL6oOIze8nXOJL7m8yfWTwEes5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEOCqVRfAiW88GiCCC2TQqLZPy4/MseSFdVIjaTL3Kc=;
 b=PV7N7inb5FohzDYlFJN4xKbUIen4z6c5mbFpdOmkMxiHb2McbHvfJZKD9ayMAya8k8LNQ9gqZQBaj/8h9QQN4eGJEfC856WLTI0Gc3/yqX4evvXkfj+UUPRG4ionO+TpQNg0/qNMtWUEFo/r7/oR/Z+IqkWl+Ry++mBjlu0OYqPK1vqh4yRSv7DEWJ7LSR6PSX7eLyFH/cFBTCze27VSBNpF96qoxSE7fvowXYGayh/RqrMVuBl6xs0zDtQr0JyV48dWbgOuwPmxmIrdeTv51hOWREdEH9tP7Dxs2aSUPSztfsfng4E4eANxu6J4W4eIOzHjNu2Tt4DoMYFPFQFNXA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11189.eurprd04.prod.outlook.com (2603:10a6:150:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:09:13 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 18:09:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 10 Oct 2026 02:05:28 +0800
Subject: [PATCH v5 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-gpio-mxc-cleanup-v5-7-1e59e6ddfa00@nxp.com>
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
X-ClientProxiedBy: MA0PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11189:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e41ce79-a1b6-46e9-491e-08df26306c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UAlAD+sHQNe9+EyXzDIommry2hjA0q1MDfEUJe6id4KVWHf4mZTX0LY1QMUktUKqHrm3AWpLVmKCHnmAqyjgh78Y4T8Cv41HgB6GsiLZWPjxtOmPrX0/rRAn/INtEvG2GthRl0SWgM//X9Hi4dos4poIci6w/jA8Ii+T+UoIA4VkGbw9bMWUksdSJO1DckkAVBQYnBePG/y7OTelWoSUo8gbh+U0U12YL/rjLicfjhidc6nQlc/onNOBK78T4lNO1lOVhCkpl6Mcr1mZfbRdjKlbZacVx9VAbn26AFZnZXSiAR2O1yIkFe1D+GrpoWv5Gk1an6zBdxF/MNGm1Mva+GH7i+CmfMcHgbD/ldfRI/QCaLg1yNXx3YUMkJBvt7C5tmCm4zx7097FkSfszGn3z6wZcR5zVvIf0bw+ftdEpnE6ZgA6HDggTSWiHqR42LNfhzwTDGAPMBxuhxwRz2KnnKFpU89lxSeg095ZF2D8IOb/fopzPpmYtFF1QthtWJUsf21ebrx4NNCujASmLrniYP2Q/HnPGACZY0xhZvHJ4W4Nn1jdl70qcbfkidVJ3dnb1y8WRwtp6mJa10GVw5sInvrsrX0QbVWv4PVFhWAvcmJtxfKIolMswtTJbyypyroVS4JK3ZlepheGXEZx0g7QrSKvmL7V6XPbTj2tnRcDP4M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXlDK0dZUTluMGs1dlRVTWdSNTNMZFF5aWFFWExZUGgwbGFlRU1WTm1vYS9S?=
 =?utf-8?B?ZFYzWDluYWo2bU5pK3lBOG9uU2wxcjd0SGVwTmg2a2JYMU9SVU1XcEdOcXFz?=
 =?utf-8?B?U1AyTG5oU2hmYVowL2xXcllmWGwvekRGbzhLZktLeWluUnFGWTZwbDl0U1pR?=
 =?utf-8?B?QmpaeHZyeFpEMTFTdTRvcElnTjJ4cHQ1QUc0VkJhVGFPRU5CekpzNXdoYThk?=
 =?utf-8?B?bVA0dUt5UzlDK0t4MUFGbEUyeWI3NEo4aUsyS1Y3Y0FyZ1VPUkJpTDNrUjhI?=
 =?utf-8?B?ZFRZQjlHZFFpWWptU2ZZbGF1aWxtNHBGMzczT3VhbVc3NDdwK2lGdTdnbnEz?=
 =?utf-8?B?Nm4xUFF4Vkk2bSt3eUN1aC93ZXp5WEoxM0gzWG1IekpLRnVmRDJEUHVuejUx?=
 =?utf-8?B?U3ZqT0JMVmRxMmxCZk9HQjdOV2ZEeFFmQWJoYTJOQnBGejBjUjVHVUd5bTZL?=
 =?utf-8?B?RDBuQTRwdnpPZjV3d1ZtVEV1K0RuVHh6MDRlWEo2VkNHSzhhblVSOXgrQzVB?=
 =?utf-8?B?YnVBZkhra2x0OFFMRHBRbFhLTHVDRjBFM3QxUjlFQVBHMWVndWdnMWFKSm9C?=
 =?utf-8?B?UTFVZzl5aWpQaHpBMmpUS2NSYXcxWUR0Sno1YXJyT21VeFJQMXQ5SHhKZDRD?=
 =?utf-8?B?VlN3VHVzdGs5enJla3IvbXdKQ1pTZUtUOE9vZW5vUnJ3TXhhYWl1bitEQ09I?=
 =?utf-8?B?aHIwdUI2S0k1c1lRdWRSSFFseW5DYTUySVM2T0pNY0hiVFRZRVlFYm82R2dw?=
 =?utf-8?B?dUIyS2ZrbkU2cDc1Ni9YYzdoQXdIbm5RWXBJVXY0NnY4VU5CS2xrSTVqU2dh?=
 =?utf-8?B?RXVjMEVtUWFnRnM1ZWZ4dEo2Q3VlRFNEbHFVQ2d0cUxESUhDRlNiVm15UVgz?=
 =?utf-8?B?QnJQNWJLOXdaZ3JsZHFLYkdpRDhLU0dsbk1KWHVhY1RnWVNpaTQwaXYzczFn?=
 =?utf-8?B?ZTVBUEdpYUdyMlNVUkh5ZzNIUlVnamhETHMybUdtaHdPcW9HUFpoY0kySkZr?=
 =?utf-8?B?L2hWc1BoVHVpYWs1MjFJazlsTCtMREljYXE1V2hVTGJzV1ZETzRFSzA5b2V4?=
 =?utf-8?B?UEtFZ2piMTJWdmlkTldYRm5oVzVwN1FobGJhdHdtVUxGRHFvazVXUkhmckVZ?=
 =?utf-8?B?aHNrZlptQUVLN2dhNkFJbXc3MlRUTXFGNHpKY1JIQ1kzcU1XZXM2R0xwRC9T?=
 =?utf-8?B?ZG1MZkF3bS8xNWxLMy9hcjhLa2c0c004YWxkVXhtQWh5MW5QNndsaG15UHY4?=
 =?utf-8?B?UUxwMVpVWWZLS0VucEZTTldPSGdDY0lJZlpMQTZtYlNJL1Zrb05PUkg3V1I2?=
 =?utf-8?B?NHRpb1Nwcm9TbUFnNzl3TE1UWHdib244MjRNbFIyZmJuNk1wRjlEbFJXd1dY?=
 =?utf-8?B?b2FPbkFLTXZkK1FLOUMza0x4aVdFekV4WGlyZ2tBSzBnNW5WZElnc2ZyeUVF?=
 =?utf-8?B?NGxpUXBOa2NnRnVMTk14S3V3aE4zK21mMjZXeWJ0b2NLNkJYQXRNczBLVFdt?=
 =?utf-8?B?dEZuOGpSWjM0cmtlZTFqbFE2eUpEdUQ1VFEvZkJvUkdpYU5NVWl1ZEE5cmNM?=
 =?utf-8?B?V010QXVwdEFoSWlUWTVMdXgybk81MWJTdnQwWlFiendJY1U0ZEswTmM2bkF1?=
 =?utf-8?B?YlpKQWlvLzVFbDRoWmFacHl5SVdScWg0aFFJTHRnUDVCcDl6UGpQejVRNStp?=
 =?utf-8?B?WDNVMmp2YkxYUFE2RE1aZVN2b213aE5kbUVKeTI3THFQdUxUQWIva0RJRkFL?=
 =?utf-8?B?U2tJbGJmTTR3UjVMWlpjQTZ1TXN3eXFSQ3RLUVhLQ1NBenZrRnJZMmE2OWdL?=
 =?utf-8?B?cW1VZk42aWh3WXFWTGdYZlJXczNrMkZveDBnekV3OStqREY3UjJMUFViZDVw?=
 =?utf-8?B?RDNaV2pTUnpyZE1nNXVlQzBXWkVHeWR5dVJuUVVKblp1RXhCWXhoMVJxam5H?=
 =?utf-8?B?SUJsQkxFUnBPcWo1VXRIQ29BSTRXcmRYSEJ3bDNOcUl5MEllRHMvajdsdHdO?=
 =?utf-8?B?TDl4bVloUThXNVJhUzhlZmpPNThNdEhXL1NOTFRzZjBjbnBWQVJGVzVPaHhC?=
 =?utf-8?B?RXhyMHFhLzNJT3pPQ1lwRGNsbGZVMmhOM3d3NGxiMHJvTTI5Z3JvT091akFl?=
 =?utf-8?B?Vk9SOE9iNE9YWWVNaHNKblR5SkFnYlNxWmJWTzdwWUJoNjI1a0tUVFN6Zlpn?=
 =?utf-8?B?bFVncHIxWHZnMzBhcTZ1UmtWQThxcHFnUmdENWhMMk8rVWI0MGI3MkhSK2NS?=
 =?utf-8?B?V0RMZFFvanFlcGFqWEVHWTdlbmxndzIyQm5nWUdCZ2R1V08wTzlTYTNWdDNj?=
 =?utf-8?B?eUl3YUNhdTJpeFFUbDY5bC9ZdTh3WTRvSjBibG1SYmh0eUJ1U1c2UlRWWDRV?=
 =?utf-8?Q?nPar8yOyjskQn61cy07M9jeOnG1jBRMaMuQNl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e41ce79-a1b6-46e9-491e-08df26306c97
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:09:13.4474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XklN3aLSaWdYDjwjfrMLgHHrznJgOVo6kQYAv2spkzoKM+PsWWJhRN8CbcpKw1SuPiAUy8SoaXb+MaAa0ZG70rlxWPRw/+MnLponLEgwK9mYxvOoRnoKmMSfqLuvHWlX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11189

From: Peng Fan <peng.fan@nxp.com>

mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
of_device_is_compatible() on every invocation to determine pad wakeup
capability and i.MX8QM-specific behavior.  These properties are
invariant for the lifetime of the device.

Extend the hwdata flags scheme introduced in the previous commit with
MXC_GPIO_HAS_PAD_WAKEUP and MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN, adding
dedicated hwdata instances for imx8qm and imx8qxp (also used by imx8dxl).
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
index 1a35b23747b4..70fa139338c9 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -34,6 +34,8 @@
 #define IMX_SCU_WAKEUP_HIGH_LVL		7
 
 #define MXC_GPIO_HAS_POWER_OFF		BIT(0)
+#define MXC_GPIO_HAS_PAD_WAKEUP		BIT(1)
+#define MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN BIT(2)
 
 /* device type dependent stuff */
 struct mxc_gpio_hwdata {
@@ -132,6 +134,26 @@ static struct mxc_gpio_hwdata imx7d_gpio_hwdata = {
 	.flags = MXC_GPIO_HAS_POWER_OFF,
 };
 
+static struct mxc_gpio_hwdata imx8qm_gpio_hwdata = {
+	MXC_GPIO_HW_DATA_COMMON,
+	.flags = MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN | MXC_GPIO_HAS_PAD_WAKEUP,
+};
+
+static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata = {
+	MXC_GPIO_HW_DATA_COMMON,
+	.flags = MXC_GPIO_HAS_PAD_WAKEUP,
+};
+
+static inline bool mxc_gpio_fall_edge_wakeup_broken(struct mxc_gpio_port *port)
+{
+	return port->hwdata->flags & MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN;
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
+		if (mxc_gpio_fall_edge_wakeup_broken(port) && config == IMX_SCU_WAKEUP_FALL_EDGE) {
 			dev_warn_once(port->dev,
 				      "No falling-edge support for wakeup on i.MX8QM\n");
 			config = IMX_SCU_WAKEUP_OFF;

-- 
2.51.0

