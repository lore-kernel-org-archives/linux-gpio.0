Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CEC4A5EA7;
	Mon,  5 Oct 2026 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210327; cv=fail; b=QsNl8mfIw0MoAa0Xjt5BYkAhzcn8oSyvwvvaO5tCRCfu4mRBxtTRUhH2aOp23sDuuTIZFVd0TThM6cg8ogb+yn+K1TyH1vhsZfH2Z/AcZsSD1JX22DpdHp55/MEBufQbXR1WTecxWQC2JomnuCGdYmKSSVjjrTdzzdaFgss0hJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210327; c=relaxed/simple;
	bh=BMz62yGkKZs4m9rTmIgWa6emFkv68o7tKED0KIHDmUs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bl7NYfEszrGYonrkAxxVZHuNABWQhJ72kzKbmScMAECSvIWG3/cFz+RNOWi2KwVc7FCwUm+yKOd6VNoOaU+cRBoZcPRN9FoGUS/LFg98nKsGXZm8glcuHU1Jrb6hOIljulrNcdCGOoYmUq9ukWCFlDC9fG7ebAd8cE8/DxPBjjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CoMzAZM4; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CoMzAZM4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZg5iYYRNREuqFJKXWy+VBqZX3bZBqg7DCG7Z5WOvn81nlviEprappB0BHhYKckazujjoSc0dBKf4Bnr2iXQwnmX3Qbrbbwb81siFnmv9snlZCbPPKejEuQmpMnc1ioLOCx0fA1M/nbMlHTZb0QLHZmXv1tTG4gBcBIeNJifWtMh+TKvOR5ERP2qrQTm1DprzogUfZEUKxSdo9vx0ws+hvtdNeX1/Cz+vM7mHR3DhEQbFVNjBrXKPbiOQF8ofasqnDI/pUUobkZIEFfkOa7LpCqsR5WXQxM6srKXAI3nD0R6qv8SX5WK9kgRsMyaX9GjavnoYxz4jR4kpUvOK42SZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnWTtkKrndpfSOnGcyi+uJvrVjNkTWeh7s4dGCsVBZc=;
 b=nDcH4jR/w9RTy4Je/1RG8OPKA7w/W2y2d2XOyWhy2tpSQJlbi6jWPkHT4PWMkYLTsYod8Qkd+Dj9hsmgeoxDqWGBakah46X+L4T6+/uqSFXt1WX/3UrqMOsSYEZLgyq9nRwynUFCj6ZJgvC4rkVf0kwmMDKlu2o7vcxE47VqF6UTOjEuUTPTyLRt/WInJSjhLFCUWX8sz21Tqu0sS2Ih60Nbar0s2Y2SrBDic/eOxhI0VRRqTtjWvB7135aL8TrdFiiERyi+FbOimUeLD7NNP0I5HlxoOEBGWCp58Xi/E/CLW3yf32WXTCqb2KdTzSjouO/iRQUzAUILfEcuUFo7UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnWTtkKrndpfSOnGcyi+uJvrVjNkTWeh7s4dGCsVBZc=;
 b=CoMzAZM4kJZHdOA6xGftqdwOKi24oMO1hLWyLdMXpchSdnZJ1qRYIUYC9DKUZayLJGdIHidKqSqV0MMKOPf/UFO6rS81BhIoG8s+FwpP6tHMi3DbIZSa5MJfLesBE4bpiTJTZTz63OlNiINNO+YzlrK66/W6usL7LLS9UrN0f9z5h9QajcjVxn67fHeCgSMEuEfuy5WnSc8M7BB7/y4BLFcJHihgG/PaNfS1/K19tSXsil4zVrqyIlV+dHTtR8npRq0Emd7JDtSEGU3F0MoUCinWkLHyry0KYkd+70sgJ/ySCg7UObsVWkFiIsdrtxAoP2mDe6cebpHUStreEJuVlg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9198.eurprd04.prod.outlook.com (2603:10a6:150:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 14:25:00 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 14:25:00 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 05 Oct 2026 22:21:30 +0800
Subject: [PATCH v2 9/9] gpio: mxc: use BIT() macro for single-bit
 operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-gpio-mxc-cleanup-v2-9-bdc3afbb35e2@nxp.com>
References: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com>
In-Reply-To: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com>
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
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: cce5bb4c-7382-4139-1a25-08df22ec705a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3HcCuGuAbAWyCno8I2oSpEVbF4YbrXuckVR3T+gCr1ehfA2byf+yIEYqwWjeF7vU/4/15I6AleyAnOFF0+ar24Gcuznri55ZohZ+Ur2XYfhOfg0G1rF1J07e/GQ4diX7Rn0i4YjnkMeIM0sAnzg/CHfLJEnuokWxVyJytx3N07rzQpluOCdftgGhZxrlHuPi2hSiMQDsnYtF5NAilRyeIogXRDINbM00dR8IaO8npuR1j5MM7RrE1+GTvMrVMH3LiCNClCaToXZSEaiS47fU4ugxqmqb3USyWTRf8e4S4MHRAijQqPAHM0zZa4CEgCZ8zLxB596rlety+3orLIdgzxOIA61dGcGWwHypNvfn8pAC3V9OlW2Hxk9U5zYo023U5wkOFuBp384XNnwkCuqnMeR1puiS8FenJyUB4teDIwsLUr+Pk2ODZXhxkywBAnCPQrSolseKJPaQYBarjujyv8162pNKyuShgXV0GpD4dShFDGRXGQG/iRifcOrApDIif8D7fEgZGi6WzaZiPHl0UTMHPfiZi6zJlGtqAbl/QTSMeT9h8MBVkF/zSnNe5hWytKCFJpRYzX87kYDt3Of8B1IUUqs680vy1FpGCoVI/yfiouOWRH/TBFZd39Uy+XsZ8sTYKIrmfEgGuhDbtGWkN+s7pL4DsLzFUUppN+ri4Xw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGxtQVIvNzdYbmEvLzYrU1BveERUSERaczBhWC9wYUtzdG5jOXlrSUlLTEtj?=
 =?utf-8?B?cVh4MWEwVU5FelZuN0NpWWkvT0dJNmttUEdiT2o3YWZtYjMxTE9jcnNDWmhB?=
 =?utf-8?B?MlFOVkUzTG9kUU1WbUM4SFhENnJKRVM4dmdMbU9FYkU1WmZQUksvS3Jud2JS?=
 =?utf-8?B?bnZaN1A1S0pOK0w1eGlyQlZ2UWxqTTJuVyttU2VPUzRadElXUzZZeVJxUjZX?=
 =?utf-8?B?VzhhMjJMdUhKZFBlK2pzTUJXaWltNk9NSzJEV0t0aVcwQkdvbnRUS2lHWVFJ?=
 =?utf-8?B?Mmx6L0ZhZVFrL3NJdExmSVBlc2JjaTlFN1dpVU9NOVhFUkQrb3RteVlacTFy?=
 =?utf-8?B?dDJjakxmdFAvL0NuMXA5SmJ4akFoWnhCNGRmRjBxZTh5SjRpOWgya01mYVNl?=
 =?utf-8?B?R2psVUZsZTFiK3JqTmU0UllqYUxVWWcyREdrVXhmZCtYNlIvUGp2RFZFRzdi?=
 =?utf-8?B?Z3dlUHpZVHhEZ0x5Q3UwRklTeWkzK21STnFyUVdtUWtwNEpOaGtoamZuSnFG?=
 =?utf-8?B?eTgwZmF5eFJiay9XQU5Kb3BtRVZ0VUlmanA1YnI2S3I4YmhWWktud1VxWFNa?=
 =?utf-8?B?cExpNzlSY3V2ekZQNXdIbEZWZ3czL2VQa3FnaytwQ3dBTFpyMjBaUHdvWmZL?=
 =?utf-8?B?Q21sbEZKOE5HMzJWMmVMekkxMTJzU3hrYkVvaFNrM3lzMHdsRStsMXg1Kzl1?=
 =?utf-8?B?cUFmNDN6TjNGdE12TmNkQ0NrMlpLSnh2MU9nU3BpVUhqTTY5RTUvZ0pOVHBK?=
 =?utf-8?B?MWphNFpkZnJmUTNkRHRoeC9kbFNZUG1QOXFCSG5qb2FOVXNLWFpvSTFkZ0sz?=
 =?utf-8?B?MkN5cjNsOEJqeDNZbjlpOVpveTdPNmhSSHFESFYvd3gyVTlBaVB5V0xNZXJG?=
 =?utf-8?B?NlVkWlBSU0VyY0c4aDJVL0hoaUpFbU93OUt6TmdkWDVXU3JDbGI0VW9qcW5m?=
 =?utf-8?B?SEppejkvZEozLzRsK2U0aVQ3NVJ6b29BRGY5WTh0MXNlUDVlUmc0cG1mbm9v?=
 =?utf-8?B?d25ZMkcvNyt0aURhSVV4VUJieVhHQ0E4eDlFNnN1YVVTejFUTEt5cUhib0hG?=
 =?utf-8?B?ZDk0VW1JcmsxdXhkdHYxekRMcXdFaGowUENOM01SZ2xBeCtLcmhJT1BYYllD?=
 =?utf-8?B?NlhIdmRXV0g4MWNveWZFdUxMK1VRMFRTZnRXYUtIZlEzRHVSb2tQTThJTm9J?=
 =?utf-8?B?MnJDQjk0K2hzeTRjUXBjdTFvakkrSnM3QW1ISE1RS1ZvSW9zU1NlSytjZE83?=
 =?utf-8?B?NE1uY2k0dDhvZUlTWGhMREs5dnhLTldITzh6MjViUloveGlLOEV4L0J0blNk?=
 =?utf-8?B?TkVzalVCaE84a0NOelNsV2xKSDRYVFhZSEo4QnpFeHMrZEhFeEI2V2NMT21y?=
 =?utf-8?B?NHF1MS9HNlFKWXpHWGZpcll2Ry9aM24yaml6ZUo4Wk96NldFNStBQmZVNVdD?=
 =?utf-8?B?cVdNRkRET2hEUjEvcTNPaENDV09qaEpDOGMxb1RPUjhtK3Y0NW9kNzhMOHNo?=
 =?utf-8?B?b24zNkVVNGJHMGVoanJIWnVZU0dJWVJBQW1INFJ4QUxpdGxzblZwRmtpamF6?=
 =?utf-8?B?UHVteVlLMXFkSUQwR3ZiQnR1SXdWWjh0YzREUUpZRk9XZlFtbDFCVlFkbGJL?=
 =?utf-8?B?dEFmV3A2Y25kUUJCSFBSdmhGQ3NLWUt2WkVDSEc1cTV3QjNXVU1QRlRoMlFR?=
 =?utf-8?B?UTMrSTF4L0xmYXVBdm84YSt2NVE1VVkxYjkxMGloZTRzMkloRjVkWVRKRG13?=
 =?utf-8?B?Mkx4QktOQkxzTUt4OVIraVZWZTA0elJTR2dYVGR6TkNYQnRNbVN0WXdFSjVW?=
 =?utf-8?B?VUp5M0dPanBZSGtPMUJJZHZ2NUdXZ1FndWcrSHZ1NkFNV3A3ZXNqTkNIUXpJ?=
 =?utf-8?B?ZjhhQ1Y1UmlHVlBQRkdRZ0N3a0owWnQ1UFppVnRFM2o5VW5Sc0dQMzdWQUx6?=
 =?utf-8?B?bklyZ0MvaG5nTVVKeW1odVltREQ2dHVzd2VKVUd3V2FVWXdYRWFObWtBdGYw?=
 =?utf-8?B?YXlGN1hBd1dCUXFFeWd1QXdNTmNCYkRQdEZCOGhWT2FHbmNzSFVTNUdmVWRY?=
 =?utf-8?B?bUVFRHBRenVSajgrZU5uWDl2QnZwbWJyMGtNU1NxbU1OUitBZ1JQVFV5MVgx?=
 =?utf-8?B?WlNjRTkvUUNXSEVmclNyZW9pWlNaek9ncVNPdUUzdk9tS2VkS3NIMlNtVk51?=
 =?utf-8?B?cjRRZCs5eXYwY1dWcURRT2hUN0kwa3pXUFlMZ0RUMC85ZFJwQXR6cTU0ZW9N?=
 =?utf-8?B?QWtzZVVtWmpvZ2RoaWphanV0cTZaTm4xU0dKRzZmV1lCcXFOMjZRb2owWkgw?=
 =?utf-8?B?TVR2aTVXem1wakxPRVoyZTM3Q0FpVlg5UEZ0dmlFRlA5RWl5UUxMZnZBRXc1?=
 =?utf-8?Q?cZdmFrgCSkGV29f6Ew4JsW7Fa0Z1gxZqkaBvM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce5bb4c-7382-4139-1a25-08df22ec705a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 14:25:00.5359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bsbE91LeySXMxWuB3FpKzgBw//W/RVIPI/9jcgizYJzTrolfRAGRFdBzD3dCdTTmxLRrLtx2sjYipKw9vmu5V7DMR7YVVetOfR6Y8DpCKaiLqqeblSXpZi0JrQWiUOGh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9198

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
index c267727061fc..dd6c2e632a42 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -209,7 +209,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 	int edge;
 	void __iomem *reg = port->base;
 
-	port->both_edges &= ~(1 << gpio_idx);
+	port->both_edges &= ~BIT(gpio_idx);
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
 		edge = GPIO_INT_RISE_EDGE;
@@ -229,7 +229,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 				edge = GPIO_INT_HIGH_LEV;
 				pr_debug("mxc: set GPIO %d to high trigger\n", gpio_idx);
 			}
-			port->both_edges |= 1 << gpio_idx;
+			port->both_edges |= BIT(gpio_idx);
 		}
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
@@ -246,10 +246,10 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
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
 
@@ -259,7 +259,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 			writel(val | field_prep(MXC_ICR_MASK(gpio_idx), edge), reg);
 		}
 
-		writel(1 << gpio_idx, port->base + GPIO_ISR);
+		writel(BIT(gpio_idx), port->base + GPIO_ISR);
 		port->pad_type[gpio_idx] = type;
 	}
 
@@ -298,12 +298,12 @@ static void mxc_gpio_irq_handler(struct mxc_gpio_port *port, u32 irq_stat)
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

