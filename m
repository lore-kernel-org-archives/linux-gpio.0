Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011035.outbound.protection.outlook.com [40.107.130.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DA74FECF2;
	Fri,  9 Oct 2026 18:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569396; cv=fail; b=KUhMPi8V27OCYedwYEWsTmjyz6V7lawGFLXb50xzOPvsKg3JqxVDmBwqzrHRUEkm4TTLqTcEt5HwUES8ciLapTzIq4ur0UxYbZUFbP7tiom22pSDCd6x9FGtqOt1jw69AeASE30AH38aljcRu0EfOw3UfBvJQuqjYKYMiwC4FSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569396; c=relaxed/simple;
	bh=bELb3qObvbHjAQ9OvbnAVEo5HvobqMTxH5URNbX5qgo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pjn3dKJy3gXVmycu+qSIUSh/OBIYAS0mpSpi3UWgr+9QId/u3v9UgnqgGrCh/jPEFdSkiXafdtgVL1r71E5leWHspL1nZP6XdbUdm465+uSk+T5UZ2Q7TUEDtPF9hNRE+dqCl0XGfwrgZ5dUOTa6/z5uxuwh59CP6DDiYdRjfa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pn8PDEKa; arc=fail smtp.client-ip=40.107.130.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pn8PDEKa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVQWt6f4iGp4bWbJvSvhf1aeb7aYc2o/oYDxuSLtdq5sFn4gdTkjOdyemxMFUUwFthDFJPIehpLgYcEXxY1BPV0gGTDsUDSWHFefakGatuHB8vsgOLEyjd5c0Fl+xWPqa3XkACX/2iUCgbkESQFLMX+7VHZ6qBlzRuZO/PGehUomg8j13OgklWrcEVTGaco+DXM+VaDc1iqSqSdsbxaTyycUiJ4jWdY6IXFK90Hzm048KwFhoDOgIQHZ1x6XQSMsvD9Y4yfR29uhy+/ptLestnX2dvozeUe+asrDNBA7leizWnc44DSR//EgmXoPqmKXueyziq8utlO/haPOEmWgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3bAlHEicaDKDCInh1VWeYVSm+2DB7bhuSTw9jji6qU=;
 b=J2l9qlbkAstNcgWnghXytzmV0O1/f4+ThAPv8chDwPUA7H7i25w8cJtSrflzZJQLK5epmPDoBSs7dDlY+ka1z2UYyUDd/VeNGoZACI6+KJTuwtYPir0D8HJP1YwmFErlSIl/uNU8HBqS339Hg1whE7nU2cl4qNo2DsydesWV2Tb7gydyneVVptmlZ5GFG0RMSV9+LHDCG9TggIjo+uyBDa5q2xdK5WCuIZ9fb+IdPR0ctWfoMcbfdkzri+zB16XbeZ2zaqHY2TiP6GJDx7z/LPivW9VaEaz4e1QpXV8Qweu/RxYq5URFVydKAlsJewEJkqIR8xdjovkStfBISVBdEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3bAlHEicaDKDCInh1VWeYVSm+2DB7bhuSTw9jji6qU=;
 b=pn8PDEKaTZpEhqatm7sdkoSPFf7OPJKQXNom1fjoUVfPUwV41IjKwL6UHxV5pL3EhUrzvgKGA+T0tDufSJoumNj6Qc4evPthWFqDJbz7G+UcgOBlGUujMr26Hv/h/xMooDYPYYLjziTw2VBgRPrqwsB5Ig51yNclWv5sI8bKOaeitL5oY9wMl+0MZMoMT/Z+Si/bI4IAZggLmX9C2V0MnpSOS5t1LOdzWk5+1dWc+WZRWy2OEScsHRAZehThFOzyZ2dm8hhy5Fa0W3+iTtgUYsbAauQHmcHraCQTvdQuwW5b+70jljT/dJrgD1s1FILJdIE9jN8R13Wb5ytlFardeA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB9PR04MB8282.eurprd04.prod.outlook.com (2603:10a6:10:24a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:09:51 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 18:09:51 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 10 Oct 2026 02:05:33 +0800
Subject: [PATCH v5 12/13] gpio: mxc: introduce MXC_ICR macros and use
 field_prep/field_get
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-gpio-mxc-cleanup-v5-12-1e59e6ddfa00@nxp.com>
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
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB9PR04MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e9ed0c-3a29-45ae-dd67-08df26308356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|7416014|11063799006|56012099006|18002099003|22082099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	i3Oo24029Y9N0m3lKBfPolxFWp+GI45sPG+a9Iey78VYpeR12PV5Jl1Yi3Z+SYrur/1V9npOwY5vnezHoTXG+JB/JRenOW3Sx6Km8qwsZNFYyp04zt1DaDwK5y2/V2cNiiRkvqf4h8msCoNvBrlOtzxFCyV99It99i87lMBPIlxzohjZSV7pImsLZ50nqBZArZteJOuiCMr+t0mkj+w06zPcGdfJmojXw9MFIKgV0T90tEcBly1X4cX1DokbdKqj9w7X9rPwwF1ZMbY9SUEG+WxCWnGNBx8+KRt9+43g9/oHekA4KGzMFLd6nKdobE0WuTPbejVRDd3iELkGiAirXb53vXMVbJmHgRPd6udO73W66a7TcS7rRkbOcmb+tA7pDIjzVmWDJSBr1inXtszk1TJTc2+2gL5AB9sEQUNzrkhOoa63GtBhnGlJWfFLQAp1nNrBaGJ+N7xo9pc+kKKztQmo4mdAasif9KVRMUB/xVlmIgJhg++kUHBD7LzewzHHnN1/thHKCrCooxviPigzEn62uNTps+DDA5b12uqFUKkQJ6EKF9gksC9qTjdtUWHGEXxU4DTWxCRz+uM/ABpVNaXtjbSTU1UNOwqlNUwF0ZPyBz4JvWoKH0sXY7rz6L3WeApmhRqhc/DLyVodc1X0o8V/QcIITxq6vcgOCfRU7m0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(7416014)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NklBRTFJRkFRak5zdTlTQUo2V0s3QjJLNFVrLy9JT281OTloc2lTR2oxUlpN?=
 =?utf-8?B?enFRWW1IT1RzZ1UxWWNrYzdxN3lhbUpZOXgrbnArWm1nRTZIRGdCSkpHTkxk?=
 =?utf-8?B?Q1U0dW1OS1lyRStodXJGcmQyRjRSUTFvQW5rZmVPZjA4c3VRODFhVDdXdGhB?=
 =?utf-8?B?OUdscmZFb0oxTmZkNHdtZjFWdU9iMlhDSkh4MXFWc082ZVpsWTNXYy9VU3dW?=
 =?utf-8?B?NTk3S2I1SU9BQ1FDVmtUMk9zZ2pRcTZwZDFyOWJPVnVFWVA1R0RpQVh3NDBN?=
 =?utf-8?B?N0tvWUs0T2VrcVp5MTMzcFU5ZWtFcTdiVTM5OTd0L2xzcjhMeW8zbVg3SEJl?=
 =?utf-8?B?OUVCN3RweXpGaVplQzdZdjZJN1BXdTEwcU04bzhMSTVBQ1Z0akxBSXozMXJm?=
 =?utf-8?B?dEZXSDNGODlLNmV1RnJKVVpKS0tFU2JtN20yaW9PODlKTGJXVlpzSm5HbzN0?=
 =?utf-8?B?M05QcnZWMDlsdXBqeDhVKzVQL01xM2dvT0JTbHJRNzByUzlCOHBZenZXWXFx?=
 =?utf-8?B?ZWU0c2cwdHBqQU5Ta3lLL3lwMWZuZDR1aU4waVNVaVZtdURQMTJ5bS9zSjNw?=
 =?utf-8?B?WWZ4aiswbDNZVGtWWmQ0RmtLdDJLMXcxOVc0YXJIUU93THVXd1dNU1lLNTVJ?=
 =?utf-8?B?SS9WUkFuZERTZ2trdGhFdzJQRTRMT05yQzFZOGJSTmhZS01ERjNJTCttWlI1?=
 =?utf-8?B?N0NaTS9IdGRWcWs5MVZGR3R0RzNiNFBLTVpVRG9NZ1pZMGVMeHErbmp2eDN3?=
 =?utf-8?B?WnJaQWRiakREN1hCTzRCTWpZQXo0WWhJbkkzWHV5SVlhV0pxSkRKVDFDREE1?=
 =?utf-8?B?NUs5SWgxaFdaV28rS1YzMGlGVmFubElRK1NqYjhHWldTWk5nN2ZFcThRTU16?=
 =?utf-8?B?MmN3dncvWFh2ZVFRc09VTnBXNy9DeGtzNHphcG0rZDQwS2dwN1pHVEtzZ0tr?=
 =?utf-8?B?ZzY4MW9BQkFKSXBoMzdMQjRMRUlJMEdWN0NpbkJkNlZqWVBXRW1jTlVvQStr?=
 =?utf-8?B?SlJOdFRMSW1zYUxldGxGY1JJNDArNHcrM1RucC90bHZ6dVRnNUxyV21oeWts?=
 =?utf-8?B?ZHRtOVViaWQ5NGd0V0F1alhGejRYakRGUUpqOFM3VFp2RXhWQURVT0lwOThU?=
 =?utf-8?B?OVJ0eFlyUWd1SzNidHdqMmVFb1RQNThzR1VjbUdwM3dMcFg5bmNOWWplaWRQ?=
 =?utf-8?B?SGkvK3ZYekdEZ2pNcE5EWWhiekNzV1BqZXNEWmdLblY2NGhqSEt1a2ZraERR?=
 =?utf-8?B?NFgzT1JaZVhaU0FpcElacFpZQWVVcjc2Umd4bGF2VDBvVzdQbHZmaTFlOUVx?=
 =?utf-8?B?S29ZcFVhTDRSYzZ2N0VMTmFQa3gxUUhRRTBiNWdPN2RvR0swendUV1Nremh6?=
 =?utf-8?B?Z284SU9kdmZGUkRXOG1ycEpucExlWWhaK0tra1MzKzZNMHFXRStxeXRoL0hi?=
 =?utf-8?B?N1hna3hoM0N0UllFU1VCUXV1NE42L1dlN3E2OW03Q0I1bmQyVDJJZFh5cFB5?=
 =?utf-8?B?SGliaE1oZm4zZjZYWXA3dDJLMGpISWFRUWQ2eXlaWnhCR3o3c1kwM0VXWWZX?=
 =?utf-8?B?WGMrQ2FFckNVWFlvZFpYZlJGb3NBZTBPYSsxYWdjTEU4QXBxc1JzaTdxUStF?=
 =?utf-8?B?dHZQeGVYT29hdVM5OXFWMWZpeFcxTU1hbHg3OTJkdUhTbEpMSTFNVGVYUFVq?=
 =?utf-8?B?S1B6RlhpMEdwVk9nZmIwMG11eFRDak9lTXFnQ2NKYnJMekVoWFRqNy84K0tr?=
 =?utf-8?B?UTBobVExK2xWUHpja2QwelMzeDk5Vk4zQzZMU1NGS3pCR2EzMW5jNDZvL29q?=
 =?utf-8?B?dWpuU0hiNXpoTzRzc3lvOUlaZEFTV2k2eGxKa2dsaWp5SEw0b214di95cUw4?=
 =?utf-8?B?d3FUazVwVUFqNVFpT2lNZXM1N2w2R2J1ZmNQQ0tRRklDRHlVOVhiMmNaRVFO?=
 =?utf-8?B?QVpEbjlRaG91Y3VRUFhHNE5jNXkyU2Q0ZStWZ0VVTEovdy95WHNEamVhdzJq?=
 =?utf-8?B?R2RySUpqVCszOUo1QnpWNk5wdUZLYjBud1NSRk9PbFhicWtyZlE4VUdDUVNM?=
 =?utf-8?B?cmcwSDRSbU81bjBaZ09KQVJ4U0I3L3RCTGZsMkNRR2ptbVRIcVoxd2g2TXk2?=
 =?utf-8?B?OThQMFdMYlFhSzdnTWh1VExaN3Z2UVM4R2NkbE9TRko0N2ZRVlN6OTRhWVlQ?=
 =?utf-8?B?QTZRUlVkQndjbHEweTg4MjVYV0F0ZVQzWlFVdmM0OFozUDJPRE5vSHpwREow?=
 =?utf-8?B?UlA1NkpLK1hiYTdjaDd5WFowUTFqbGhiMG9lbGxYempDeWsyNjM5ak50ZXZB?=
 =?utf-8?B?MjM5L2RZekVNOXlRZzI1K2s5amRTMEtBZENPVENmY1loaTNONTBlalM1ckU4?=
 =?utf-8?Q?FMZEkyRIpC6md740bG6hkC40XFAizysU8T1as?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e9ed0c-3a29-45ae-dd67-08df26308356
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:09:51.6361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PEFOGq0HsePI9bKFa1madbFtBA3bQFitKljA2UZ1TzV2SXO4ACJ1jBDhybtpAuCubV08w1pI6kaQk294mLPTK3aBoeHcBajhioKR7iYMIgwnfBsjFWxutkznCuaCqdan
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8282

From: Peng Fan <peng.fan@nxp.com>

Both gpio_set_irq_type() and mxc_flip_edge() open-code the same ICR
register selection and 2-bit field shift/mask arithmetic with magic
numbers (0x10, 0xf, 0x3).

Introduce two macros:
  - MXC_ICR_REG(gpio):  selects ICR1 (pins 0-15) or ICR2 (pins 16-31)
  - MXC_ICR_MASK(gpio): 2-bit mask at the correct position

Use 0x3U in MXC_ICR_MASK() to avoid implementation-defined behavior
when shifting by 30 bits (pin 15 or 31).

Extract the read-modify-write pattern into icr_update_edge()
and the edge readback into icr_get_edge(), using field_prep() and
field_get() from linux/bitfield.h for the shift/extract operations.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 1eb5cd148c28..97147a5d747b 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -7,6 +7,7 @@
 // Authors: Daniel Mack, Juergen Beisert.
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
+#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
@@ -174,6 +175,9 @@ static inline bool mxc_gpio_has_power_off(struct mxc_gpio_port *port)
 #define GPIO_INT_FALL_EDGE	(port->hwdata->fall_edge)
 #define GPIO_INT_BOTH_EDGES	0x4
 
+#define MXC_ICR_REG(gpio)	(GPIO_ICR1 + (((gpio) & 0x10) >> 2))
+#define MXC_ICR_MASK(gpio)	(0x3U << (((gpio) & 0xf) << 1))
+
 static const struct of_device_id mxc_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx1-gpio", .data =  &imx1_imx21_gpio_hwdata },
 	{ .compatible = "fsl,imx21-gpio", .data = &imx1_imx21_gpio_hwdata },
@@ -196,14 +200,28 @@ static LIST_HEAD(mxc_gpio_ports);
 
 /* Note: This driver assumes 32 GPIOs are handled in one register */
 
+static void icr_update_edge(struct mxc_gpio_port *port, u32 gpio, u32 edge)
+{
+	void __iomem *reg = port->base;
+	u32 val;
+
+	reg += MXC_ICR_REG(gpio);
+	val = readl(reg) & ~MXC_ICR_MASK(gpio);
+	writel(val | field_prep(MXC_ICR_MASK(gpio), edge), reg);
+}
+
+static u32 icr_get_edge(struct mxc_gpio_port *port, u32 gpio)
+{
+	return field_get(MXC_ICR_MASK(gpio), readl(port->base + MXC_ICR_REG(gpio)));
+}
+
 static int gpio_set_irq_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
-	u32 bit, val;
+	u32 val;
 	u32 gpio_idx = d->hwirq;
 	int edge;
-	void __iomem *reg = port->base;
 
 	clear_bit(gpio_idx, &port->both_edges);
 	switch (type) {
@@ -249,12 +267,8 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 				       port->base + GPIO_EDGE_SEL);
 		}
 
-		if (edge != GPIO_INT_BOTH_EDGES) {
-			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
-			bit = gpio_idx & 0xf;
-			val = readl(reg) & ~(0x3 << (bit << 1));
-			writel(val | (edge << (bit << 1)), reg);
-		}
+		if (edge != GPIO_INT_BOTH_EDGES)
+			icr_update_edge(port, gpio_idx, edge);
 
 		writel(1 << gpio_idx, port->base + GPIO_ISR);
 		port->pad_type[gpio_idx] = type;
@@ -265,17 +279,11 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 {
-	void __iomem *reg = port->base;
-	u32 bit, val;
-	int edge;
+	u32 edge;
 
 	guard(gpio_generic_lock_irqsave)(&port->gen_gc);
 
-	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
-	bit = gpio & 0xf;
-	val = readl(reg);
-	edge = (val >> (bit << 1)) & 3;
-	val &= ~(0x3 << (bit << 1));
+	edge = icr_get_edge(port, gpio);
 	if (edge == GPIO_INT_HIGH_LEV) {
 		edge = GPIO_INT_LOW_LEV;
 		pr_debug("mxc: switch GPIO %d to low trigger\n", gpio);
@@ -287,7 +295,7 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 		       gpio, edge);
 		return;
 	}
-	writel(val | (edge << (bit << 1)), reg);
+	icr_update_edge(port, gpio, edge);
 }
 
 /* handle 32 interrupts in one status register */

-- 
2.51.0

