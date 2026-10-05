Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FE14A3F19;
	Mon,  5 Oct 2026 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210271; cv=fail; b=Yu/V4/KOHS3FIEJMYHfGCpmqpWrpLyaYgaGM088Ts43uw83+CTfIaTs43E+puNyqhttjYBluF9SCwQurqFHI62zG00a/d/hTiGKMg5h1x0W6ADn6eaJN0Zx8tAlsKFJ3mZxGox2rBQvl56nDMTmg40fiIjQXGbTCBRP2UkMLoVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210271; c=relaxed/simple;
	bh=kDOttNANywMV1u+AL4yD5S52RgtgJrXWwgUFOCqlQFY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jpCWxbgol4gKF4NfpW4Jg28QNLyvBb2L9TRdAk98qUwONJZA3nu6UhhJEIYmicCwsuoGpP2AH6K8PVcYTid4hkd8celokElz+lV0o0Ne1XaDznmQJ8nh1/2OS88AcP1FO3tP9H+Y29z/7h4VADyeGiRWDygUiDes9zMmhUK/3dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UA31Yf5E; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UA31Yf5E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqgHXxEy6MWaLjFaXvnDxl0HenPkq2Ki/Sw+VRfAaKljV1pG2sJLEmr/ZnbMB0GCjJUVdHJYkGcs7yycPsxdZdU0carrD/nwGbaoJGeQhtAz/HH+yPs/lpnmmWJbo74Y+iIgY1LnXQcgg4JQxrH/VbnqBnQ0UzZFEzy6sbLVarsZ6SsXmmbEr5Yc0075m+5eu7ZXrQnWioX9rMA3g5EYSLIS/s48F7lI6gBVoVe9yUGrBZz0Y7Wh6vL6VdFatwuwnCk9cKFBpJN4jtz7i02ABJZVSdOlm96nybMd3LhD3s2YgDCmavBSghTRt2/OurG3+wymF3p08YVo+ArE4mQx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjuT5ahdQaiKc1riD6ReBUM0l9oH+pXpz50A6vmk+80=;
 b=s52A0nUwPl0A/kyaVx/A3bp+Ip8A5Zh5nbCoCW9zlRokd3oxNM9z+shJ+jD9Y4/KRPStETVFPhlr1eyHWGUT3JcHobmRz65C0M0V+VFpekxEb/Yz//eo0NJZQ2pwBQ9pfA6AwPJDS0GtA/tWhcf4sDJpWkjLToB2/CQuacRrMIkzPcl0/8HAlgH9XruRBvjitGcQJSi9ElSM3Hg5FFwdNkq5ziJuTHMmcHAmdbcTvQQ+nB1HLrdE2SjBz7wOKDJ9SdZSuumEkRgA5uD7VBeBg5I3c4J47aetFBC+AUHZuyFvBb71ZZ9rVoh+dDWFwqkxKPproxW+MIBaYtTsvHmyWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjuT5ahdQaiKc1riD6ReBUM0l9oH+pXpz50A6vmk+80=;
 b=UA31Yf5ERcq3+V0PGpQ25q2Fp8aZyIbtTvTW7FIX8oOs8hvKhyaXrQHf6c4A9cgsMgaW/Vhf4cpjtFfNh+4hR66gkceYYnuhGKpdnxVCAPdcjKwLok/RbNdva9m02oVRvd/xiWxtG+WEMR6OMQrlEcff0hYYj4l+yZ41HKc6cs+AP5d/liFl2PNdnUajuMdVIcRw0mE4OJgyoP9zs1Yu/lqDVctBtJTU4vYNapzJwFwgbzFe5Sexqlwjg69ODWo8/pyCHBS1oXUQkRYkKYGMZ+iePM4XZw+5ASSBF2RXYndm7I6rAENqZMV4wdh6WZ+YoBAZvsN1nk5aGMrC/hLJ2w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9198.eurprd04.prod.outlook.com (2603:10a6:150:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 14:24:17 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 14:24:17 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 05 Oct 2026 22:21:23 +0800
Subject: [PATCH v2 2/9] gpio: mxc: fix wakeup_pads bit operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-gpio-mxc-cleanup-v2-2-bdc3afbb35e2@nxp.com>
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
X-ClientProxiedBy: SGAP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::34)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 847b23cf-382f-415c-c1d2-08df22ec56be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1Lg5iJk6vpCTWShfp20e3Cbr4GFEbHjDsV/O5L5tpIFUCKQMLke5ivYc1PfX+2QxPRSXkGonSLQBP69sb0V4PrnqmeMR3mZoF8mX0dIoZRj5qlMRtbDO3C/GehzLOaKUaI3ido5aMMtKDXHPW0RZ0/PwLrujK+f4f0NDnujGOjYY0ETaTzR3PwxGx7fZGnxaYu9S2DguJA0DH5oUGCANb13nyFe6rYxkjbWIFQCHxErnLDgwjbfZ5IJAUl3wTo/z6zrmx73iAJ1bSrj0qhFoV8DbSEDT4j5k5e/GyhcrBUX6XcS3eGWLFN0rnYR8k1p4gL/JFx0HXYrAQzWqu5nJhPScqcxF2zfQb7oswkBbf72ONti5preo4zqQaJsinvjJimBGFGGi5rgjFYrj+c0myIAN6WybCFybnd/rGNA1cMeP7eAfLs8KDjCBe59F/Rr42ghYQxBDkbEQ1Html65BQSiy3P7K6JiB9IFFoU9nCZYtp5Tyr9q6/FYM0w6Xk6xuMhakD44QcSxI40TJRkkJ5qWsRz3tXirmoxZ5/qgbE/Ne7G/YbDDRwBivUm4xb6QXMNruR7MzewTqS48X6RzW7O8pnmWgJYlwmfauapKM6y/If0VrGzDKOyEonXtklGB+6WjADfEE63aJtOQPkaN/6slS5uXqROVZweZMYI0T0Zo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlFqbFdtR1B0aVpjZkMrQzA0VHZmUHhrWEZjSStLcDVuQVVWWDd3enhrWFhq?=
 =?utf-8?B?V0Y3cHdidncrcGdmS1NTQ0U4UjgxN0ExL205WWJ1cXNTVE94QVBCOTVoS0pM?=
 =?utf-8?B?c2hKYnErd0s0NjhTMUtJRCtsU0VGWXdqM3ZPRTJJS0xJdFZVQ2plV1RUT1pj?=
 =?utf-8?B?b2psZFVtRm16SXdqN3U1eHRMekVveENkcVBIZC9pNC9MWVRwOVNyYzlEU21l?=
 =?utf-8?B?RVcwWVU4a1BCbVFqZExIZzcyUktkVjA1cTBUeXJnZjkwY2JXdm5iV3hndWIw?=
 =?utf-8?B?UHo2RWN6SU1uZGJKMlNVd09XT3RHbE5VbnI4Yi85UVBoZWp3VGluVWZzRXMz?=
 =?utf-8?B?NDQvdnY5ZkFSWUZtcFZ2NVAyYnVHNCs2WTY3cjhVdWhhbUtyd25TZzJqTFEv?=
 =?utf-8?B?VW9YYTF1dHlMVHNnVFZXVWNLZ3JtS2s2WUZWK1B0VW1XVWNHaEt6SStUcmJL?=
 =?utf-8?B?VTRTdTFYZzhIb0lCVi9lUFJJdjFCbmtzYVFvUnRPbWJOUkF3N3loblowTWpt?=
 =?utf-8?B?WmpQSnAwU3dHTS9aanFWbUUybDFQdlhYUDRTOFVwR1pocEZzc3ZWSUZ1V2RY?=
 =?utf-8?B?ZExUNC9TWHAyQjhEYjNVVHBxYnBHVHNvSGZUUFU2bzhEU05pM1FlY3lLOTFJ?=
 =?utf-8?B?U2xDNVVjNk9nZmJaZkZLazkzVkxVRzJiSmpSeHJvbGdBeVBhMVByRmJmVnFW?=
 =?utf-8?B?eWRka0hxM3c3WTRzQU5abUw1VGJLYWI4ajN4WWFVWEE3ckFDWUhEbThwbUlB?=
 =?utf-8?B?SFRhT0haV0hmbHJJQUdqdFdrQkx4bHZGSHlzZm9Ebk5URkdGMzZOcUpSRVZL?=
 =?utf-8?B?ejNscUFmT2Q4VXlKQ1prczZjaXRCTS9qbVB1UUFpUHBpMVc2a3Jvb3JRYW1H?=
 =?utf-8?B?ZytvQ1BRN0x2QnhIVmRHWWloZGRyZE1Da2dNc0NGWmlQOWppQzQvTENUem9t?=
 =?utf-8?B?R1VScTJ2eGNDTlJZUS85b1pVVGRQSDNEZWRHUFA3MWxNZjlaQWFmdWp1ZDdt?=
 =?utf-8?B?VHErenlBMVdlMURLdldhSElQQ1ZiWnN0eEtOYk5vSTFtaEQ5VE5kY1VBZVdu?=
 =?utf-8?B?ZzUzN1B6R3YvZ1lKbWQxRFpxbGZObFg5UUFPcHMwU2N6SlJwYUJlcHBLeVph?=
 =?utf-8?B?K3dxOVRON2RPdk9MZTEvb1lrOFcrQkk1ak1CUGFTOE1qYUQyNFoxTDVhaTB4?=
 =?utf-8?B?aXNDZUVmUWMvY1BiN2tTbzMxSXQrZ25QaHNlUnBZYnd3c3g4RnpqVVc0a2lm?=
 =?utf-8?B?aGNSc0Ixc2ZKSWt1VUZndzdXS2M1b3VxNjdPTHFNMWtNVkJNMFBLUjJDNG9W?=
 =?utf-8?B?K3dnZEZid0VUcnFLdXVHdVJqSUFwUmNHS2FaREloTU5EM2s0cEIvMXk0SVFV?=
 =?utf-8?B?UlRXZ21zN3JqZkE5dnRHbGgwVzVOb0Rsem9XWG5VMWhhVnV4VnV4dk1NUm1j?=
 =?utf-8?B?NE1yTE9UK0RKd2tqQ0ZVYmlZN0pqYzZFU2tvVFB2MUk2SjBIcm9PRFE5OC9X?=
 =?utf-8?B?YWtwcjNYdTZWY3I4L3pNeUx2R0VYSmVoN2ttRVhqRWZtK3RZZmt4VnIyOUk4?=
 =?utf-8?B?OFJtUUVCSlNQZ2FNU1NmanlvZUovend6U2R0SmRPOXcrVjBzUmxJOCswdjli?=
 =?utf-8?B?cHNlYlF5Y2dvc2MxTVZPTFlEZTJWUWRtQ0ZEbUROQ1Nib3BVcUFId0pOOWhI?=
 =?utf-8?B?YjRjUjZaQlhtbWdaUk95bE9XYXg5UVRVTU1WSkJ3WVEyelozY1dyVmVBYy82?=
 =?utf-8?B?ZnR6OU1HUDdhc1M5U1BPQlZZS01POGxBYU1xeUpuY2owUUdlcFZ6QndwK1Rz?=
 =?utf-8?B?ODhrazkzZldZMVFET01ubE5zaEF2czh4dDBpY09RVVVBUmRYYVl4OS9jRGJm?=
 =?utf-8?B?K0xSUy9ia2hQS1FLMDQ3K0k5N3B0c1dnVisxYUNQYTVxajNNZXY4YUJtTlkz?=
 =?utf-8?B?V3JtYVc3WGUxei9vLzBNY3J4TFVTY0ZrVm5pRERpU1dYMi9sbm8yMjA4TGZk?=
 =?utf-8?B?SjBxZ3Nkb1VlTzhLM0crdXNYQ01PaWRtU3dSWkdTYlBBYkxJenNrMWdqQUVo?=
 =?utf-8?B?SzM2VTkxRVdqbUVCMkFKYnpKd0JEdldQWFUrQkZnc1ZndGxRamEyN3pSQkhC?=
 =?utf-8?B?WHRmcldHZS9pbUFLSHhJd1hUeVYxS0JXaitlTTVkY0RLczB3aXlqU21KWkdH?=
 =?utf-8?B?ZEJ6M3hjK2RTcE9wcGljeUE4Tnh1czNOQloxTXFYWnF0cExicTVMNHBiT0JO?=
 =?utf-8?B?VkZJQjJQWWJUbHdzSmc1V05IaTJZNTNiUnRNYW1VZVQyNlIrcTZCY0t1Y2tT?=
 =?utf-8?B?ZGd4Nk5jamtIazROaVp0VEEraUwxNTZzK05qeWVMUTRkcGJveVNNdzRSVG1i?=
 =?utf-8?Q?hdPz0WoaouygUQCfZMQfKGDxtvzXHQJ7GETIr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847b23cf-382f-415c-c1d2-08df22ec56be
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 14:24:17.5822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6H7UbJMx6rez4DYBJqJaQpLFRvDf+H/g4dLqS54HaSG+JUDWxDG8DElMCY3tyh+yx8f8TdAOXo1WPCsXpa0j4/UFchPxEWn9ax1tD24M1+PHD2zxzHyXT4yw8BvTXQR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9198

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

