Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF1A4A440F;
	Mon,  5 Oct 2026 14:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210282; cv=fail; b=KYXuhQTCgO8sJcTGvOI7SjUrccZdw7l3eXNNj4i3WiNgBlb+yq5km6DCVspCi7MYlkCWk2TR0TL0mXOEC5foPNefEveoqLY/SaLCYm+VQONnZsv1jQaUQCtY9q7B9chjdpBFlQXXjas8MisdVuKo1fHvVXRNIbKlN20CBTYkGjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210282; c=relaxed/simple;
	bh=lLUTzb1fnBB4LC98rwr283TXXQtbqlObwtom/2k6GH8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PlIBbMgRfb5fSf6bCmvlfyNZ0iUxGhJm1xMHjYGIqfB7r+2Z0o3+8Fs/3MuG2n+T8NaNLCXVChSfvWD5cGBO4PzHLyBaKl+hOyB6Jhsgwng07K6QYpdhCP45YkOOOChhV1sg8EwLyV//U6fG9jH9gzowQFd2dpsDKYhazWHxc0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X3QdiijX; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X3QdiijX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3YDvRFurqafuzoexfSkjLxnxpA7nNQcS+Es5zxIVTOBZ2ta4hHQnE7uyBY5Yd9YTI6vYJPpOwx9w8Rv7yv5AgnNpS3/3C/DIAH+bpnjCHwk78gbS6mFePKWW1Ud4QfYdzYJSr2/M2MecJScVN/7aSBbvgRujJ/hyZazEAG6uSx2YmCYQa7VuVCbUEgan8BJW86LsIacozBYEW79kWhyb2AGb0SCpn2SQNojd27vc0d3mypMjrcC5RzcXWiM7mzlvQ3O2nMFGdZfIy+0QRR3lts8xHhpOr3Xt+tSXXpZrmXBYtUVIWz2tCa/cSHJGIN6ExJ6E9QJiev6rt0/7zyfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcglSZBRVts1rV1xHNEXg6w+mRG/aMKLkFrSJVtnxlk=;
 b=B9n4uYhunv05bZSdURZTRkQXi2SWu/4Mbb5r7O2YNJXInJ34+6xgrZEcakXXncgMXqyTfdxWRXR9bCYr2ANxOwmPtxFPWX0ZCFt2dpnVOCG90Mz/MNpZIHCOwrId+LZQC3cn6R3Qp7759qXKSmtga8cPx4MttOkbSnwi8QKYYHlIRUVICCCex3kYXxeF+gDIeVxWxbYNv1GL+uzkgb/dx/l/UFLrnRLvsnikDSn1w/j2h46yDqd5q0zO6HFGZbgigjkTNTS8gcTWt/zXgNo5eWGZUTB/ZGdO7yeIlqBNEPHixifSCTEEDgQmi1C+t9HCIKrWSDmiXE1ZYZ6DloXSMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcglSZBRVts1rV1xHNEXg6w+mRG/aMKLkFrSJVtnxlk=;
 b=X3QdiijXbwEORsHQZ72vrcPyzdVrSoavBIW8UiysMY+Kf3L3ROl9ofO1z4l8nDrn7CkSua/oUZwpjzEkrzD/msXc2VqQoXMkegsn41h3Zrw2rN8iLkjgH1WvsFZX2Tq3yl4DYS1Or8scO959GOJJZ/8uACi4hY99ak2h+3YB6pChbOze4uUuPWBqQY0xd3Jig32QaPNVUtjbwbaG18ZbVDnDyllO3sjUNGbk6MW3G4u8Mfl/Tsz3h77QITCmNm6l4ZnNXT0Ye0DvoOhmZYdqeOigJ8mqiq0QvzlE404dGiPjP6I1G6QVPLhEShCxW2uQuCRBu0j8U6x7jrOWWwBMKg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9198.eurprd04.prod.outlook.com (2603:10a6:150:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 14:24:23 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 14:24:23 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 05 Oct 2026 22:21:24 +0800
Subject: [PATCH v2 3/9] gpio: mxc: replace of_device_is_compatible() with
 hwdata flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-gpio-mxc-cleanup-v2-3-bdc3afbb35e2@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ac9b87-153d-443b-2050-08df22ec5a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+PsQSG1Hdgjf2fbeMSlpo3VaplE/L1lmkixrFZ8S2MkHjJd67efPWf0pnUYIzemSltDEXtc6PqDV+z0xOyaXvpYT1eJFuhO4NVo5sEjCLwMbwClhKzvs9mwzsbcNDADPvpShy2SYGe6efeRS7QAM3/YBx6Ncp3aUF+s5YYFR6vX3utczXepREnbZLtrfsrLD6RsWufc8E4ZU5zNXw8fUomiVLnsj1X5SfdXjdYyUDTSbN4UpujWyquCqzSzOJW2QLItlr+dTwzj9PmM1QJ4LIRnUf56SNngKh3+lD58qr7XtnQpVD3Gm7XGMl83ANZqEZq2lA0ySC8sq5lfIMLM5G8vdu8AEdXeNc1lujhvElIYjApsov3Nyj2oSbgqAAM/s0We5+NnMnJGE9ECjrrn6cW5VZCqM5gMSQtWO4J7J//EcxaTffdSf6ataegFeKqPxk+QByEKi42KgNOD3L64mwC2k3cQhAxaeIQgQo6LQFOzituv42pUU534kkOrNo/HQsB+Ph8xUNDNOuqoJ2VXEUEyDicEvJzkxvcYL53jOvKoHSg+Ea21NcpI19UBIo606fHdSksF87B9TuaNWn5ngdbDPPuMLTOhOdb8s0OyxMQuaAoJkT8gTAT/nMD/kJE8hKBjfRPK8yfl09cBBZJ+O5rBV0BIMjXs5NsFs00PdEBM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWhaZWViSFE1TG5SSEtqOXdJSmVoaXFiWjIvdXFacEdkckJYZjhjNDdXWGlQ?=
 =?utf-8?B?VlBDYk9XT25VNjhTWXl6Y2dBcnhzQjhUeS9HTGZTODQ2L3Z6WnNpNkJReG1i?=
 =?utf-8?B?akU4OUtHczFUK0E5c1BBT0UzeWZGSVZ6UlpWVzZNZFdOc1lVdGFyalpDSjRm?=
 =?utf-8?B?OTdwdjRRRVFBSE1aN2kzVXAwRTgwU2ZYRWRGWGxQejFmOFpQWFJHYzFQREdV?=
 =?utf-8?B?RFIyTndRK2VMNE4yMVJnYTRJeGgxeFp4UXFWeXQvRGZMK0pDa3g4aWNIQkVC?=
 =?utf-8?B?dWxaUTFncEQ1YkNEK3Y3WUt2VW1tVFRFQU1QRytNYS9XMVUxY2Q2dU5La0o5?=
 =?utf-8?B?TnNnSHpGNUw0S3Uxeld2QUxmOHpCNzRhTlIyTVJKYmNxREQ5cFZRSmVvTzQ2?=
 =?utf-8?B?MUtzOWdRRFB4VUNqYjNuOC9jWmJEMmpzdElxUjdzVTJ5UFIzamhPblViTlpN?=
 =?utf-8?B?NDFuRVB2Rjc1VkF2MnVwTnVCV1FETTMyV0lFKy9GMWJ5ZWs1VmxIN3YxN0JK?=
 =?utf-8?B?ZTlDK2l3REt5SW16Z2ZrWkc4Wkp0M0VzTkRKdW4zR3B4TjNVUTZSeVJ3aHBR?=
 =?utf-8?B?ZXhHbllrVFNFYTQ5VDY2Uk94TmM5cjc3Q054Z21IeER6ZFhsRU5kYzJ5MmtI?=
 =?utf-8?B?UnAyaXBZNDgrbWVDNkNQbmd3OVlsLzduZ0JpZXBHTmtiSHJ1YXdCMWlabDFG?=
 =?utf-8?B?dEY5OG90OVJMYTlpaUt2ZHc4eDNMbVRrS3dVM1luMWkxYmczOWdVUVh3SlJG?=
 =?utf-8?B?QjUxTWlESlNZaE5aa2FhdE56RGxyRTlJZ0MwQXh5QXp5OUtwUTNVRzU0U1hF?=
 =?utf-8?B?YjNLeEFtVk9JdW8rMS9FQkEvNUtDWlNPNkJDMERnV0FoemJUcVFsdk0wQzZx?=
 =?utf-8?B?RDlpZWRrb05FVmVRY3FyeXFnQXZnR0JTTkVJUGhUVnRqYlhLZWtiSEljZVc4?=
 =?utf-8?B?c3BUTmZaWFdnNVNGWkM4WHlZQjdtV044SWpwQ1VjNjQrVHNYS0JwTW51alV4?=
 =?utf-8?B?RjVJSG9zblV3YnorSS95aG9OMnZBTWNvOEFJWW84SllJVFJWaGgyeTYyR0kv?=
 =?utf-8?B?KzRXT3RWb25Jc21aRWRpRTF2YUpNSzI0SlIxNmFLWGtBa2t4b0s0dVFRbXdB?=
 =?utf-8?B?S09GSWFpWUpPQzU3dytTVVRiQlRSZFYrQW9reVRpMjZUVVZ6Q3p0T3NhUVQx?=
 =?utf-8?B?T1N5VXFjMXJnWktlZTNZc085ZTVzQWpSbmlkcDhMWXVmN2l1Yk51ZzVrcGFZ?=
 =?utf-8?B?YU15WkxnK3JpUGZYQ3ZsNXJ4UVJRcXpuRWJ1YjJoTW4vc3FFWjhoSFJKU3pX?=
 =?utf-8?B?dlFxVEhzY1h0WSs5d2xsYnIybUxEL0FIT29DTXFvcWZRN3FwWGh1d1dDdU0z?=
 =?utf-8?B?MXBnODB3dy9kU283MmF4QmVUdEVQWnN6MzhNRHlWTmlzRTNKaU5oZ3c4YW1w?=
 =?utf-8?B?cG85dWVNc0kxYUI1dnlzZE44ZU5sVUxKM0JVaVRvcVpCdlBlN0lzNEVvSUlm?=
 =?utf-8?B?ZHhCVUxGYTlnbHBMbzFmMCtBSy9hdlpyYkQzaHkzT1ZQZUxpNkNVYVZtVFo3?=
 =?utf-8?B?bGMwVHE3TFAxWHVDSHpyZW1oK3hKMFVDNVlQSjNrRTR6ZHdHQ2ZXSTR1TnJr?=
 =?utf-8?B?SGhWNFpoTWd0MEVHQ1FGZStHRG1WQTBhRWZORnVwY3dqV1lHbDdtalcxT1JS?=
 =?utf-8?B?VmxRbEdVYVNtd2dveUcwbDYwK2I5c0QvL1Bsa1g3TUkxNkUyNUhiZm90cXlO?=
 =?utf-8?B?TWx0R1RxRi9ZK0t2WDRJcW4xMGtDeWwvRktVLzU3VjlkZGxKM1VaRGdxRFJQ?=
 =?utf-8?B?RHhFRlQwa1F2Qnl1bjVkUUVJbVI4NkNMdlJidTFLYnp3c1RGbjBWeUVVbGlu?=
 =?utf-8?B?QlY3SlY4ckpRYTVGb2YyWnMyRzhIWVNnOHAzZCtLUFR2bkF0dXNoZFZDSGVN?=
 =?utf-8?B?T01oZU1tMmFYWnpRZ3FLQ2xqOUJKaitKMWV3Tmc0Z0tKcWMyb2U5N3NFQjFB?=
 =?utf-8?B?OGwwYVIvYVJ4dmdXRERRbjBod2ROWC85bHcwWVNsUXQ4d05HMDJvZXlnWVZz?=
 =?utf-8?B?SmdDWXl5QnQyeFM3VXpJNzNYeU5rcjZFYU5nd2tPcGxzQkllUUZ1S0pHeUZ3?=
 =?utf-8?B?UERRWTk3dFNvZFNjQngrMXBNL0d0Q1VlTEdOSTJER1F4ZU1VeFI4ZE95aDVN?=
 =?utf-8?B?RXhjendZd29kRWJnZEk3RkRFT3lVTDkxd0hkcys4eTN1bDVJMThyd0dyUWE1?=
 =?utf-8?B?b1B4K3pZazZNenJPa3lTcFNvZjQ0VU5qcmtQcm03WTVGTkpGYnA4MEFhaUVM?=
 =?utf-8?B?dll4ZGVyL0pVMzBDclRDYzRQM25KUGQrVktjK2VFVmdia3FSeTI5U25HdVRp?=
 =?utf-8?Q?E07SRgURnI0gn3RBEpHkz/9MUp3Qt4IDeVrPp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ac9b87-153d-443b-2050-08df22ec5a48
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 14:24:23.5339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RF0gH+ZJzGT6w+wm6qj9SOJrvPut2m+F/zVXT4tjWu9moX60qKT3RZ0LcbSHR4wEpMXU5eTz6sOevdAv5CoPusBDZWBSE7OOmRfG8DLGViNLU1qM6b2fhjQ0HSqmM6K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9198

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

