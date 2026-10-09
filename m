Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443474F403A;
	Fri,  9 Oct 2026 18:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569350; cv=fail; b=ckQ1vXnBZORdLfOxIbHTPRKZyCvDTzgejtwoi9soXj8FCRcsOHqIYBaPBdd+iyl7Kcle8/H15b19jfwxmXnx1RbI3VH6oKhjVZZ0UzB0JsBLgXMd3/QvA/O32L6nF9fFubQ/saJTduKspONSFOo1HuV53VqwrdB0BYzhCdKIuYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569350; c=relaxed/simple;
	bh=nhwTtQ/FOQczLELw2m9IA0iXsPZAvAFkXMEhUkGFE3w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fK24dzqaOnONiHskKChNqadsrVHadiyVm8T3LVG65VJkp7KowNM9PDLiyIgWgqU+4ZWY4wxb/aSQ4FURNVbOi4LyptLqoU8S6JoDndRuQsBcDvvc1iROh8iBLgqatmJHyoz96vAClzTtaWoPy1+XSq7t0TiU7wQh67KoWv97pD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aPl8E57E; arc=fail smtp.client-ip=52.101.70.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aPl8E57E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndAEGyndmOynFrY0VXQTcMuvdSznrk6kMKHM0dGDhPM2/Jd1RlpTJqnvsFG7T76nPlyUpwCGv5+3e032Z7P5uN63RLVw7asmqHjseC7oNRzh4umuXlZXedqUFSGwlhf2XX3omMqFgeYEuYLCwBxS9MZgJDpP5q+1Xm7FpH1tHSDZSilDKt2iv1bUtJ+Mw2AmeS0H1+U93ozdMwEgFxV0ZZRcAcW/tVh3yY0NzjvAxyvQwcahWWWzfN+bxtmoCX3E1vnRgVbBnF3vS5L1h4y9ZwGhq1QjnGZOW8ByXQsY0FvyGO2VwBIoTzqYkWJvtw9/34P+pggwl4u5/piiAtsctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1280nac68NhHDZ7qYrcv7bRsQghdod21/gN+E+YZ9vQ=;
 b=ReLvunWB3Y8O0xniQgwPbfJ/cz28j7vBn7zhWC0zZmk0z3AxhjHR47ky3H/9LvNjmAAcfZ2feekYXbS1qv/g/i+ABbUiBGc4J8Z7VT5D7VBTXEjGBpvvy5xp7e5eE7F5GzlwPz7A+uiyK9GSIo74Kdysr5SFzyzNudp80NN/COZqzKjqrO8bHYpEGiXbAXmvJlOPQFQPBNph1XLBgJ9fzdApslhy9zEat6KRcBehw8DqALPpnb0Lr4BxSF8OXvIEzN+gHR0CuSp9LRcq7dWqXCsr+i9Eu0V3xpdFnKLpRnOXeZ9IJQPKPBPSy6CcpKcn2PoUrW/UJJYtW/+RYi047g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1280nac68NhHDZ7qYrcv7bRsQghdod21/gN+E+YZ9vQ=;
 b=aPl8E57EElnH+nrYxZOQZS503oPF2oBT5VrJAnuxL0xitzXMTDUSkDOxmmX2rx4hj3kxFHza/NqscpyVUjnkY0wdaaR2QB+ROlaKHjhz2sH/EMM4A2TVbiUHvqBSBajLfJXnlafMp4hvE3j1FYijgffW9exumoHS75/DSSNfORuvj22sjWMFhw5pwAQUQGnA/1Vs+pU3sOMKKXnhHaQ24fMKGBgyvAno3vNmXzsgz5fRW/2kpAEh1By8tPqpvoQ67Z9hW/xA73m6Is1ioeducpjol4KR1IdVLGVjS19KVub8JHzUIiTUV8uCndP6SIlR5htaOmv6CvLKU7CmZnhx0w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11189.eurprd04.prod.outlook.com (2603:10a6:150:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:09:06 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 18:09:06 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 10 Oct 2026 02:05:27 +0800
Subject: [PATCH v5 06/13] gpio: mxc: replace of_device_is_compatible() with
 hwdata flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-gpio-mxc-cleanup-v5-6-1e59e6ddfa00@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11189:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a10248c-acb6-4914-c19e-08df26306831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	knZNfZhlpef81qeeBFtiMeNq1tFGaIIqlIlmuaHeI+3eSxLls7vEfsZufgklJ6ZFJ2Tt6KftXJjGM5Ztq5OTrKUDh/b9VXjiTol7TlD5+sWlsDp4QGbot74QnnFwn9JKl5iElueuvybx5AZFmKi8Rj0+tLLRMCmg5HgJwbNUkMiJ8dIAZaLiZwwfnX9Yr/164g2xF+ciaDlFxZ2HdaZ38sq++jp899/aEd0HdsSVrtMBTHmBhnKagGZB5OcDK//NlbcSqlWBTMiVDMSFjZ+egnaUevzweke2AK5nteXR/sL+7Mn2zRYD+596fK9OqstTRd965MO3kq+t1yJmholnS+TkJNUvyUeGIX4kRLFYa/6+m+GmT1TmBBhNBLK5BFK7jQwy555oLqubgY+XKk4Mzq+Ijlu6/Ww0BB6CUO9J61Wadhp7Ils2kNTgXdFjCpeUfTh9Dz0dRO+sUNIsEBHOiyu04LxJnkixdZD647Va+h3+ERkD5CBM9XCl8Pp2e3dcFQDnew1TkYgrWtOX3UuZB0YGWiWcJcP0bHDfGSn68YSJFu6QJuOIscQO1WIZXjdG1ENRd6tQTwdh6LbFhk3EQjtu06xI+aE3Wwwqr41WSdBqPsqlPTDi6jkVI5EbA8cgt/bxFduTUsJq+PMQPuJUogy92O0U1yqyZ7teEsOtvYM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXZiQWU0WU1peStoU1U3Znc2NWdiaUUwb0ZGcml5ZHNNNkc3K2ZNZ2xEZUQr?=
 =?utf-8?B?djVZc0c3SFYrWUFHazlHK1VoeDhaNzA2Zk5OUkVvdjcvWHA2aThyaDZzdTVK?=
 =?utf-8?B?bHFnY0NIZjJiOUsvQXVwS29HTEQ4NmxWOGdZMDRVMHpLQzJyUDJrOW92MmNa?=
 =?utf-8?B?bko4QU1nU3RJKzZoSzRlcDhCZStDWDFpN0srdlZ5d2lRWlRlcVNtR3piR0E4?=
 =?utf-8?B?Nk9HR3BRRDI2UGEwUXM4WC93WmIwdVJiMSt2MmlXYlhmTHFLUmRVSWVXRlJR?=
 =?utf-8?B?di80dVFhMlFlVndON3dpQXBta3NaSmpVeFpUcnl2NkYzTm80djdWSll4Z2Rs?=
 =?utf-8?B?VW4rUThzWUFDQjg2RG5aTXZMM29aY1R1dytNSGV1a3NBMUk2WE9SOEQyZW5M?=
 =?utf-8?B?K3UydDNxeE14NkEvQzJGTmZaaGMyVUx5NXltT05hNXduUmczRUJZTWtlSkFa?=
 =?utf-8?B?cnlhV0F6Tmc0NEpSbFF1R1oyQm80YmNvU0Q5SlNtNFVpMi96SjU1bWQ4aFUw?=
 =?utf-8?B?a1N6Tk5iOGQ4Wk13RjN0enErOEsreU5RaENsbndEU0hBVVZaK0hWRHhKczVQ?=
 =?utf-8?B?eDdETGVjZnBQczUrWFNERUFiamJOSkZHTFYwU0t3Y2sxREZwQWhFYnVLR09h?=
 =?utf-8?B?QUxVYTZCQkRkaDh3UlNwbTRNSDhVOE9BWEUxSnIxeC9JQjRQaC9pM2hhTXJZ?=
 =?utf-8?B?UStIcUprOGdlWHNMa2dmdUJyK1FFem8rRVhYcjRaSlpVMUFIa2dRWEplbVZx?=
 =?utf-8?B?VGVuSVc0OU5CbkkwR3hQN0wveDQ5L3FZQ0doQWt6ZmZHMEZKNjRMVnJKNXox?=
 =?utf-8?B?MFNmTDd0SkJQZ3pjdEF3RmlXWnlWSXFFK1pvNU4vZ0VzZ1FHS3BkYXhlcXBT?=
 =?utf-8?B?NzQrYktHR1J4TzlvYlQzV0NXWUh5anNDdjdQZ21PakphT3FoNlhTZDE2VmFC?=
 =?utf-8?B?TjcyaWpBdUFTTTFtWDRBRVM4RVIwWndocHY1ZUc4ZVJoVHUwMTF2TG00RVl0?=
 =?utf-8?B?RmREbDFRd2w1Uk84aXFYN2ltd1JOekVMdGFTeTdYQk0xRm12bU1CZUl4VFlP?=
 =?utf-8?B?eCtnRno3ajV1bis4SmtpVDFqZTNUQVpyS3VLWEFGZVo2MXdIeDJGVWFERXlJ?=
 =?utf-8?B?UmJHT1lTVHlwVERJbmZzcEJRTXRoVXh5UU0xaUx0Qytvb3R6aUh1UUVkYzN2?=
 =?utf-8?B?NXg3VjZOTE9sK0JNNkN5V2Rkb1F2V1lTSmFIaGpLMVRCVmZjOGY3Q2lDTlRt?=
 =?utf-8?B?dDVrUldpQVZIVjI2MkpGeExIUk9QVU1jZUpMWUhmUUJIeTJLRXRKeGVsYUZ3?=
 =?utf-8?B?ZUtNZ0lHL2p0aG92aEEvTUs1RkszOExwMTQyRGtadE1nWFFSOWZ0TVh3UVZz?=
 =?utf-8?B?SGZRVjRjUlErTlpKeXlmUmJvVmd1Y2ZnNXNHeGpIYjJEbFcrRzFYdW1BU09w?=
 =?utf-8?B?YnNWcitjY2xJS0I4REkvZDNSMGx1eW1ObUJDWnJZMEF3Q2hrYnpJalpCaUta?=
 =?utf-8?B?MFpKREdSYnYyNkZXRlRSNitWeS9GWGk3YmR5eTFCREtOMEtDVE11MFBpcmpm?=
 =?utf-8?B?YUlDMHRPUEU2V0lOeDliSGdONmZxSUdaSklzemlsazR4UFhtd3NEL09CRHpE?=
 =?utf-8?B?UUZjRGp4ZTVIdW9rSjhUK0Z2RytrTVNUakpVUWo2TWNnV1pZTmg3Z20xZXVk?=
 =?utf-8?B?V0FFdnZWQ2JsejVQTk9yK0kyN0pjRE43dE5RWlBLUVR2ZzNZZFJyekJzRUhq?=
 =?utf-8?B?eWFsUzFxWDF3RFpGbDZOei96bWo0NW8wM3BWK0U3Z0F1VVhDR1JrNDM0empW?=
 =?utf-8?B?dTVpV1B2L0pyN1BabHJKSE00K1NTSUI4K1VIRHppaXAxM3NicCtWNlpGLzgv?=
 =?utf-8?B?c3RzUGpRcytNeHFuUk8rWWlMS3hIZVJLVHgrK1pjb0lwSnFVNEEvei9TNU80?=
 =?utf-8?B?MWE4L05GUnF5RHFIODZ1bFdyaHJqRXpHODhqalI5OWY5QlRhVnZZYmtPMlNX?=
 =?utf-8?B?Mjd6YVdoMGFYOWVBNDN4RlhpU1JoYzRkQUxkVnZtNGJyaFliRFNSZnBoV05S?=
 =?utf-8?B?Z0NmSnBpVEN3MWdnZWVKMXlWa1gxSUJCRHp0c0Y5encyZk9JQTh5aWw0K0o2?=
 =?utf-8?B?MTZpZ0dmOVlvd3BzbjdsUHpZNkRhUnQySGN4eXYvcHlzaDhWL2xPSENXeWFm?=
 =?utf-8?B?WXJ4U1N4LzVLcUs1Qlp6b3RxYndXSm84MElxb3lwQzVBQncwaGZBL0F2a3Iy?=
 =?utf-8?B?RHdJU3M4aHEvNjdXekhLdDgrZllYc0lsOXk0NG5tSmdNYXhIc2dwTllORytv?=
 =?utf-8?B?M1N6eXdjQmdwMGJpZTBLL2N3WGpMZG1yWkxYUkFUNXlxTHFubFd2OTZ5cWF5?=
 =?utf-8?Q?dWB5Z2Q3QRp42DyhunNHF6YMxbGkFq9Hxa1Q/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a10248c-acb6-4914-c19e-08df26306831
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:09:06.0767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQBJryEWDxWgSHXmDd63A248zHwtsU0pmcxAljfLbNnB9v+NtFACQwyGNA2P0YjOSxJAbJAjduI8Wq2wKewJvGAR6Qwg3zTdyC0TuwvEh9EwUrqE4V0yCTVDJ7Z6iT2G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11189

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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 50 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 28578028b9ff..1a35b23747b4 100644
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
 	unsigned long both_edges;
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

