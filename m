Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87A2490BF2;
	Wed,  7 Oct 2026 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370159; cv=fail; b=DSNMe5w0ayq2l8z3kLmgN1nSIQHSRz+u99inZsiTOMJ2nqgv2ctxFFUJY29t62G2qBwesLA7zId8zlKPeeNP97jUix9JBYQAckzwyEFvdnlCejUuy9Bu1qeaFS06qshH3C3Qx6wRFUnTODLGc2OtV6w6xpmZU3Hd7cENyQD7HjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370159; c=relaxed/simple;
	bh=PbZ//mD/R86S7Fkfw/jQ+Rtsh5wGefydSMAAyrg2FLc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FfGY0Q/nbS8/HIZCrDZQNdhaf3BwujRxw1lEVVHwYXHs0SzV1NYVjOBgHjSSuJ6/E+4q/N8h9FA8jEgPPexM8hRgAlyyE0lLmfFTcbLeFReT5n1fB9dO48ymQa/SQA7BkBhSRuN/GOiRDlf+SrVWTKUnKXTRCFMlMs5EAUq5zCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tkSVnBj7; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tkSVnBj7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVw7pFt7tcOTkw7b4328PmJQRPQppedvmHmJcxIocHSvCCXHRxjnDWepoDIlbwx9AyaDlmDJGTn7CKXjabO1CkmiQsg9JmTTKRyrSNToHs1PLHfTaicxtr3LjLf12HNn4ji7KMbmZr5rGlBH5tRNS0U8l5SqdWvKdMqc5HAdA3IEb9NIMKO2opMN6D4YTXoIuy/sEgDZJejkFZxgTnfNEefEqMWJ1bzIvCTfiL+07HSB59FCuYuh6nPZ27Ip/aDRJHJqCVOic8KAnf8vvCXhEBQyccaEeobkDXCuBtjV4OX19qGQggZXmkdv4EmtB9bPOEUFW50ajlXUjweMFCuxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89zHYhl+qd3Gd4q+U1uoRnTSVPRlGCRRNVC5Wc8KnQE=;
 b=X6sg+dHj41I6tvuw6EMoYGIyvUiyMGzyMKS7496AtWhBWTZR0ACfhwnWDq4uJYGYH+rt0MgEMlIO7VOqzpX/ERV8gii6PzUOFhKWryQbeK4vL4LXuov9NwLvpy6861bJxbab/DShe2e221GgT/IdRQYth8mQDAZMtLGpYMtTaDfWw9TVU7lXc/6Gic/sccDrwNN7iBdpBwyJ2v3ve0v2Ls5hicyZWahRFagejoFitCFNoO38MFkzCHFukzJnmxph0KblcLRgjVXsD115YWJeIy0rLpLq9DxDnET9JyFH0C34UOgzdyg1Q+MR8JUQGaqev66lqkaEjSgFQDbgel74bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89zHYhl+qd3Gd4q+U1uoRnTSVPRlGCRRNVC5Wc8KnQE=;
 b=tkSVnBj7gNScitbd+52/NCRvtbxVDEucPQdLX/2SZUPtE7gFF7vUQ8POVPpXZeMUFXE7lJnoB5pZdhSuoTM5mPDpFro/N6F2FuAiS9Qk+rl8tZG7/gaNN7tGF8UhamnjKCYlaHX1I7dCjkDIspqIr5aW0bYpOz0TC+lJ8Yge+rsb0Omq0CLfRym4HmshcEyH6cOzLfEwnqvNkVFJi6Ct+EmqSFA+w6VDG+hQ6KvBCsw92xEAAFI0utnaZWj81Ghkwhr7ZM1ZyyEYlVviUT1tYsxVcb9AB3PnyV7nGiJdAGxRcnksWxojXSAnGw13IA1Vi1i7NWDXj13XMMp+13q/PA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11738.eurprd04.prod.outlook.com (2603:10a6:150:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 10:47:29 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 10:47:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 18:44:19 +0800
Subject: [PATCH v4 04/10] gpio: mxc: replace of_device_is_compatible() with
 hwdata flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-gpio-mxc-cleanup-v4-4-c9f5a8b50df9@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11738:EE_
X-MS-Office365-Filtering-Correlation-Id: d59490ce-b8d6-45f3-a5c5-08df246061c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|19092799006|366016|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	k0EgWPgB5lZo7n7BccL6UxuvEVcs/3M85Al524CYozz1z/4JlpunWFS9n6etvQztOtxXS7NZTgEoSTgyLk5HBMqqqo18YEp5yiqzmCF2r40a81PqIEucHB3pME2ZBdpXC3t2gNjydb1bxnIhdtUzKOzyeG+GpDDamvJdjTO7oXaWzU/Xqe9mwFWxXYI9LGRTcVkvIlxRCxyV8cPd4mBywy2L0UhrgB3AcIGsdoDNxSChM5Ga/j9Qrko2MaeuxWPlhTCBjBGva4HcHDkdZ/DwMwVnY1EAKqCHtHOBSnlWWVn+G8OCUBzVTRGEoCIYXT5O2hQA4ZRs/v1aImfT0PHiPFq1jkeLamhilOV1PduZYh3pfm8zrPI/MIzzpayIsFJnalrUH4cu4Too83ykb2ayyiNqip9vRgfNUx30e8cyefocX3v/ZbFE1j8OgAiLF1y4ZGPnjXhYNKLq50ldrX+UNSeG2FrJQ6Mqh+dQuuxQ7GjwuUuPCHZbP9QpYBtNXFChdgGI6p+2d2qzzk+5QrI6qtTDamhV2RXne7Jv0sFgWvN65ri3+THGHgvWfLW1qeAqGBP7dw0L5ZQ4LX7mEh9nKx3Ffk7mkXkU3Bc78hdAsAMNXK53cvA7LfPHqnZiUMFqKsBmmS2Z50niYeZymwoi1Ksp5NyHbnwebyj3Cz49atE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(19092799006)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHN3S3VkNWJBbW41US9xK3ZGazRTdXdWSE9jVy91WlZMUDc3Yk55VFpFejlZ?=
 =?utf-8?B?OTMyazVVdmo3UVp5VHZHU0YwOFpIcHA3U2lUelF4cXRVWW5ZRVZ5Q1YvSVpP?=
 =?utf-8?B?R2wrOUR6b0NpazQ1SlAxWXVPYXF0TUQxMzBiVFYzQXUwSHNaZGs3bHVpRmNn?=
 =?utf-8?B?RkxvT1cwNXJUd05KTTQwaHhhbWhERENmZGNiVC95Ui96RU9wTVRpWE5KQ2Fo?=
 =?utf-8?B?bGhsYTE5TXpwRS8yV3RKU1lDY1pQNGJtSG5YMlBwQ3V2NEZ2M3pRajBpT0hm?=
 =?utf-8?B?d05DOGNPM29GTHNSTUtGL3pONDZ1RUZVZ1V4WElKQjlmdHl2cU5FK0xaU0d3?=
 =?utf-8?B?TElLczRxZDVpMVdoUmwvbzFOZERia05KQlVQOXZUU1hQdlYySkd1V0ZZemZK?=
 =?utf-8?B?cXBIMzYyaGo0R3BCR0Vva0cyOG1RSHNrNzhzcGJIbERaMDlUM1VLd2V5OG93?=
 =?utf-8?B?RHZNWVJ0Sm9vRXBmbXFkaUl3a2ZiMk9PTkp1SUhPaHhrTUkvOUhmaU9Fa0ZM?=
 =?utf-8?B?OVZ3ZWhBMzdPa0oyRkF2aDVVRjd1ZW8zOGxXTnZEclRDdmhkRkNmNUE1NWNB?=
 =?utf-8?B?clNaSm9rTlZDTlhhWnNXVEZWcFA1Y3lLbXdDRE1FUUM4WWl1MTZ1QU1VbkdD?=
 =?utf-8?B?UnZNRDRrTEhpZnVtNnIwcUU2UWYxMHlCTm1STkplMFFESTdYbGlDTm5hWHAy?=
 =?utf-8?B?czZueXRudDczdnRkbjRkc01obnl1OCtKVksvMVdKT29lT2JjZDBqWWM2OFJV?=
 =?utf-8?B?ZkJ3NzEwaGVVaGNhT0xFNmZod3JrTUJUMkxEMWlJNkZuSithZjRwb3dobWhV?=
 =?utf-8?B?OGNvb1haNXorUHZCNE02WThXWHRFTE9zTVVuZ0lVb1FTbHFtRFVlWU9oelZU?=
 =?utf-8?B?ZzVSU0JvdDJjeHN4bCtRRjhDZFZ0NEVhNzNDSnNRYmUyMGEwVjFSNG1oZWs3?=
 =?utf-8?B?ZHZITFVka1IveUd5M1hSM1A5a0ovdzlDTWdyRUd3UkVBckF6MDVuMkNYNFA1?=
 =?utf-8?B?UnB1Z0tFcnpjM2Q1dStvSVdhVlFBVUtZcm1JODhIb3RHa3o0NmlWcVorb1Qz?=
 =?utf-8?B?UnQwVnQwbENoVTUzdDFEMFBaS1ZnSkh5MmFKa1VOZ0pXdFhMQmtYckZlcHhh?=
 =?utf-8?B?STd5aEsyNlpOK05lbjJ3cTdSRGxRM3Blby80N1k2dUxpQzNjYWo1Q05sQUc3?=
 =?utf-8?B?bEtUYmV0R0JnRXF0M2FnY3hCeE9PWnZFbFFvbjluMDNndHNBVHFwZENrR3Zy?=
 =?utf-8?B?UE9DN0wwa21WdmlUQnIvYk53Rm01M3NuZitjaEs4YWc4SXhRZkx1NmkvT2xq?=
 =?utf-8?B?ZUtaTXE4NjNsWHY0Kyt0VmpQUnJWU3V4YjdscUI0MlVPN1NjQjQ3cVY5ZFcz?=
 =?utf-8?B?bGtRYmtrQjlLR1lQQ0F3ZnVrVUNIZ1ZaQ2ErUDlmM2VSSm5MSVpDdnhlRHZP?=
 =?utf-8?B?S2RYRFFDZG1zMzhtb0RnamNzb1FOQVA5RVUwR05iUE1ibjkvRUFIZkxxUlpn?=
 =?utf-8?B?bFFhZFdhdDNsNE45cVdlUFJNVkNDOWdtZnREcHBHYTFZZ09uT0o2R3JyWE1m?=
 =?utf-8?B?aVR1cE1WQzlxYWpsNGkyWHluZkFHcHFGb0tXSTkxNjF1WGRkcFRzZDhPcHp2?=
 =?utf-8?B?b3JDNDQvREZvS2E5VlloSW5CUmFGMmJOdTJ6cVZHbC9DQjNLWXQ2ZmZBNGJJ?=
 =?utf-8?B?MC9mV0FEdlZVYnJpbkhvb1c0Vnlhd3dkWmdQQ3Frd0RNN2JGYTRHZzJWK0ZE?=
 =?utf-8?B?NTdBMmhqY2lMZzlYaHM5VU1CM3VGYnpnc1lRTlZCV0c4dGJvRjlMYlo4RkNy?=
 =?utf-8?B?VDlieU9sejZBbGpDK2d0ZmdodWJ5Uit6LzlpdXBSQzBPWUxZZEo5SGdNNVls?=
 =?utf-8?B?UFpQRDRYS0c0UUJFTEVMNnpGSzUvU1RTdzlKME9YUUhJcnpqMTlNQUpKUm1y?=
 =?utf-8?B?dU5PdnRjWEU3dmFCS09HcDE0c3Nxa0FJZGNwendWcFoxd1pSRE1nOWZtbHBQ?=
 =?utf-8?B?UmJVeEdtZVhlK2tCU0pVTXliWkVENnZ1Ly84TzFCUmxRa21jZGtwaUFPZisr?=
 =?utf-8?B?c0tvR1YyWFliMHJZcmdGVlRMWjl6V3JQZEd0ZlFsZk5NODFCNUZBUHJpN09H?=
 =?utf-8?B?TTJyUEtnVnQ3Sld5ZWNLaHJqNDN6TlpSUDExRVNCWlpGd1ZMWXRUZ0hNSnpH?=
 =?utf-8?B?L3Vyazk4YUlvYkdZMldGR3g3ZU5pSVVOODVobm1DY0JOUXpDclpZQTNlTHZz?=
 =?utf-8?B?UmZhUUR2UVd1NTNPR3B3RFUvZzUxWkgvSXZMQW5QRnpMMlQ2SWVSWG9QVVZY?=
 =?utf-8?B?cWVSL2JoWUZkNmZXSUVCMXRKa0R5M240WllLNzVlSGYwLzJwZjl0NUpnbDU5?=
 =?utf-8?Q?3ZDoAkZP1F5lLlCjDLzIL3601eHMNWHN9d8hZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d59490ce-b8d6-45f3-a5c5-08df246061c1
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:47:28.9020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eisdf3SegubETG2HKGWznmM9ZKDYZXRbJHZOY/yUaEBzRiJsneefUvzSJ0iKX0Samdr4acyz8mjDvVI3nLby3hP6e4PrUG034SbP1Q8DFE5U+lGcJEgpsL4qUR5Qz8iC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11738

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
index 1ff5c2afb2e8..c08f0b59d284 100644
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
@@ -447,9 +462,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(port->clk))
 		return PTR_ERR(port->clk);
 
-	if (of_device_is_compatible(np, "fsl,imx7d-gpio"))
-		port->power_off = true;
-
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
@@ -536,7 +548,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 static void mxc_gpio_save_regs(struct mxc_gpio_port *port)
 {
-	if (!port->power_off)
+	if (!mxc_gpio_has_power_off(port))
 		return;
 
 	port->gpio_saved_reg.icr1 = readl(port->base + GPIO_ICR1);
@@ -549,7 +561,7 @@ static void mxc_gpio_save_regs(struct mxc_gpio_port *port)
 
 static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
 {
-	if (!port->power_off)
+	if (!mxc_gpio_has_power_off(port))
 		return;
 
 	writel(port->gpio_saved_reg.icr1, port->base + GPIO_ICR1);

-- 
2.51.0

