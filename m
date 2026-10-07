Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4492F48F84B;
	Wed,  7 Oct 2026 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370129; cv=fail; b=JdWgFyOZz2Ko1vZXoYSfSqUS3y6USsg6/2+YI5B9qZdoE/USFYsX82RfECk1OFN47YER2LlquBkVpKf2S0KNRaIPmpZWmvYEjqIxnikVFiMQNhbfUZ6L/USfMBLhrRrH1Ps5Q2KyeQzmoBjYtunj94epY7OINOfMjZm64MucORY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370129; c=relaxed/simple;
	bh=2qTnMur57zisdBOPmd4WJrZZQocE5LLFO2QqS+pvKtU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=S0UVmB1iru8IBbyoJbO32TofJq1/QiUmLSOeS5H6u1Kmu95qx5vKCP3ni65Madmsqt7QAwEHrLTAoOwD72Yoqwk7Nlmtx/v9bl0iZrlHKXXtN/uinnf8EF9ekPSR8+J4mt+VM2ybTZe2GHJUJ2OeDo72NGY3STZRXon2dTzGZ+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=a5cGlGKH; arc=fail smtp.client-ip=52.101.69.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="a5cGlGKH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2spInr4I7IeyxVYnu544fLA/g7iqiImU+soulCCR02a+hotZq2Hb86QYNOcAHFL0lUQvZCACRtcs+Z3B2JfcVAEHGMAy2xIQDUsB1i0lkdFwN4HiFyz8i3VLP4mgV6jCGnku36JGsGmVHIQx9yLcRu2Xp8RGkW3UoqoOcEAr8w8Ps7wFvI0CgU3GfqWD17dDsht0KD/uM+UO1bpQCiVmU/GSAYGESWgaLMDuEdCnqkSOGcnGb4szrZHwTe1skTQSQBf5aUJS4K5VY0ubFd9XXOTZmJkm4EkKFOoFpFkZWcvACP8cfOAetNEQPW4MG31jux6Zm+qT0cXzIDrx2LWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGa8u2AGE2H3xe0iQ1afTStIK0iMYZQdHcspimJAbCE=;
 b=KEo+R/yzA/uKbLzooBrzgOhGa75Dl7dPyc8fDL1IyMXtNj5wiV71XdpP+Unr90/WnWP720sZ7UIlhiVaF6qyUiOPjaodHZScZhZfgXwfgnS6gzGCSTKDS81oZ8ZpwV7s6WfHnZreurETH1/0chl8SCCn8Dehar3yvodT5CXZDbDyHZ0PI5oh2gVzM0vmQWeMfCLQMwCbHnOxKkmKWd808D+gdZ2GPY6WT6HLTIW8p9dcIzxejNnve4uFvjeVENgVOKuJ3NIye42LT0vrrwyOmVu83Z+8+Ps8BemQLC80Z4SyH7GimhHnQ7VnGVj2W9g1koSr3OR11mBX0vF3o/DfTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGa8u2AGE2H3xe0iQ1afTStIK0iMYZQdHcspimJAbCE=;
 b=a5cGlGKHl5ib5e7xGPEerbCza4Bn6Xh17gmEQszHgfv2oNWab9poSKNhApuEicB7Y2QgGujCulkVyjhK906KRbFbsGXfMPFIN7c9BI4mmOHMz2Qz3AN+kysVyuiTnb4t3bWdMrUAKNFXXgTlMB3GNVf6kcgkz1LpOoTAkBkEeVRKMrYvJEuu6kgtLr3ng3QUl0zd8ENuYBuTkBeWSr5DfqBN/mbXpFHHnZFQrd7MsgC7EcgNB0qqQm4fBQmWLV0ewrjehd7UOkOoZuU9hXQKK40NFqIbxn1/lhZN0R2JXEps9MEQ6o4L6qqx+bDSuKcvuw6nHAOMToMFipToLBxceQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11738.eurprd04.prod.outlook.com (2603:10a6:150:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 10:47:22 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 10:47:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 18:44:18 +0800
Subject: [PATCH v4 03/10] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-gpio-mxc-cleanup-v4-3-c9f5a8b50df9@nxp.com>
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
X-ClientProxiedBy: SG2P153CA0034.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::21)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11738:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c454ed-a7b8-4b88-b86f-08df24605dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|19092799006|366016|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4WJeejU8p2vTGZ+yNiRU9B03rcGSZULhUHj1YWpq1vNUSfb0Pkb2DDSFO8Msb1JreRwhT33Q6Gxbvmd468DNDt6zUbchO7xri0bMlmN/kDtw2YishWQnN1GpIEMsWSCwYTGe0kUWRfwowEUmqN28989XKh5pB6rDeBEAShgH3R0ybNdE3T0Je+c+l+XQS0c4K/miyCp7TO2Rgk/GWLl2PAjXJuLHd5M/fdzoV4unHyuZ75002Xy4SE8hwM63lDqFbNM903OAsvzd+5ifftu2bIAxt182S0PIdhHS00P9dmv61IbJBnsGCnwoOmB4gbWKxGj15GSmvfygj1vQ2/rqYKu2GA5kFqpNl+w5lCKGaKLLm3Y9w1RA1PhW6ylgE3Z5tGVoSpNDePdBfk0xIUzh/OY+Vj3ViRvxWXUvetwpiGSdjyruZzaCFRt4pZKy6hh+Wg8ATfgUTM5jVIfq+VRcfV2AxcvmOoxyGJVIT5IVaa2SANWsv61NGK2Lv1h0vjynZZwbEKhS3OlOoig7hgka/MrFiVtQE52quICJIEauI/CLFnwNg0wrl52z74qzRckA1CgJ5lZlegsCu0hwUpXe5gk93cV2RmoVw8WFBZKP7dDQJ7QX6AfTSdKQwq1U1sk/+nBpL9KX/Iqp8mFPyg/4wisrYMJBFE0w1rjKZyNAN9s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(19092799006)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjF2Tkl5VDQ3czQzRDNheXZxQ0xmNytxaWZkeWpQMTh6Y3hBWWptL1M3Y3FB?=
 =?utf-8?B?TlRTcmpGQ2JuZGdyY29HdVJQRGxsVGVDK0dWM09uZmduQlg2NHhoVDdHR0RP?=
 =?utf-8?B?N3drcW10TmdvRzVFYyswWmt1MmVHbm5sNDl6S3cva3lmTXBlMzhHaDl6NmlG?=
 =?utf-8?B?TVo1NTB6T3FJMzNZQXltb1BINWVwZDU2cVhSWUY2Z2svVjBjTytSMFFsNDBn?=
 =?utf-8?B?UVBUN2tWbllVZW04WWVYZC95VzVpRXU5WStTZVJZckpxRHVxeEJTeFlNMndj?=
 =?utf-8?B?QzZvdUpHbFNBajFWNVJiYVZFN3ZpY1F6VmdJRjFPM2lGZEJ1VDRFZTJvckRy?=
 =?utf-8?B?OFg4Sk5SSUZCVzlKTnhoUm9mVGNSaU0reW5hdVdwVG1HZTB6SDlkYkpCRFNR?=
 =?utf-8?B?U3JNUTZZaTNMTHYzYTlBSnhFRXpHR0hDVURKR1lwU25ocit1d0hDaFJjekU4?=
 =?utf-8?B?SEh6ZWZtS2dpTlkwK1BSTDUxTzZVZGNuai91Q1Bja09Td0ZMZDRjZ2JvMXpN?=
 =?utf-8?B?Y0V4SE4xL0thQi90V1JMdmRMNFpWZEt2RngzbzN5ZDllaFMyMDh1dzJsLzFo?=
 =?utf-8?B?OEJBemhnYlVIWHJNeG90NS9vTVVubDNHajhHRkIvOVpLUCtmaUhCUFRWSFNS?=
 =?utf-8?B?WDBDK2NYNDU2MFQ4RVpTRkNKc2t2MjI1QlI4UFlESkV0MUlXdDRWY2s2eHZF?=
 =?utf-8?B?RzdxNXcxU3FDUEpWMldrMytLZHBaRkFxd0VFZWlrZzBxREl5NTRXWDcvVlFn?=
 =?utf-8?B?OVhoZmR1VUkzSDNaSDFlbWt3ajRFeE1pcFJ5MjFBUGdsTExMOHlwYVFPL3BY?=
 =?utf-8?B?V1JNV1RmRTlFQ1lkK3ZSUmVnSDlHSkZKd1pDdENZV1I5cFVMRE1Tdm5OV0JN?=
 =?utf-8?B?K3FYZjBRc1J1NUVzeEF2NU9VcmhkalFHOUNQMDlScmowQmJoekpRNjZHOVk2?=
 =?utf-8?B?UDRORmRhUWpTTU5jQWdiYUhrK2NVd2pXNnlmYUd3OWJhZndHU0hBMDkzeDdH?=
 =?utf-8?B?V25mVUxsdjMrN2tUSTJIOXYxSklKKzRra2xPNFJtMi9NT3Rrd0E0TndtUTVs?=
 =?utf-8?B?bk9PWExhVUFWMUNtMGJQdU81YU1LVDhGQll4Z1Q2aW1xNHNreG80eTVVNkNn?=
 =?utf-8?B?WFg1dlQyclM2dEFXZFZpZEdNSlhaNXJMbHJOZ2xuWEZua3JDaDNIRDFLd0k5?=
 =?utf-8?B?OUlRSi9vTlZ0SGFpZnZXb2UvVWlFQXErL3lCM2dLZHNpOWQ5ZmJyZ0VoS1c5?=
 =?utf-8?B?ZnNDSGFBWDdkZ0o5dm5TYWJqYjNJQTJDbGF2NHJEeW1aSmY4NTFiMHVIbEo3?=
 =?utf-8?B?c2pHYlh6cnRhYXQ4MWYrWFNkK3lGUnhFMFlvTUZBZGFQM0xSa3pzYTJVUkdR?=
 =?utf-8?B?R1lxZGdma3Y3QlRHNFFnK2JOamVDaEJ3ZGhOT3gwTE1FRU1KaWZkdUFyMDhI?=
 =?utf-8?B?bzFPWkhVeEFIZXFYTnlTcys1RlBIK0oyTFY2d0lTZlBCM1dNbUtEbmdjN21M?=
 =?utf-8?B?QXIzdndmV0FvR0dSd0h3L2FIczZsQzFtZkI2ZjY0VUl6Rm9GYzltUlYwLytI?=
 =?utf-8?B?bTUzS3BJbHhHeTFFcEJYWFJLU3pwZlRhRXNsdUR4WFZvZWZDaWZ2d3BENytv?=
 =?utf-8?B?S3RnaWlzRzlBTFpCMHYrWDNRMGM4NmkyS25wNERabmxVTkVqMldnc3grQlg1?=
 =?utf-8?B?cWxoNml3ekVscjNyRkE3ck50M0tZNjIvbUxNZ3dEZUp0RnJjdEYvd1RjU2N5?=
 =?utf-8?B?ZkNZY09UR0kyL3dIY0tpOHRYb3Q3OEUvakNpOE40eVMvV2wrTzY5OEEzVlpx?=
 =?utf-8?B?T1ZxN25JMkcvb0lKNmllR2pIQ2VPVjFJV0RyQldjVmdiUXlCczFFQjJsYUY1?=
 =?utf-8?B?d0VnU2c2L1hQR0hYNW1PWXhMRFlxM0VhaEdPYnJkZmE2VG1qTldGOUtaTGJ3?=
 =?utf-8?B?QVRDZ0dKb3J2dzFJZ25KMlF3REVoZzVhNXZHTjVpWE45eEpsUW56NDNTN2pU?=
 =?utf-8?B?VE1INlQ3OUExTGdQNkZJNmw0RFdtWFBCd1RuZzQ4ei9OcXgrSFljVUIxVU5V?=
 =?utf-8?B?VXhwU3o2NFBTZHo5RWQyWmlaNVNYVmtkd0k0QWU0ZjNEZ21PNlVmQ1NiMzEy?=
 =?utf-8?B?elRaRHZyUXo0UHc1djZwZnJwaUpYekFTQmpIMVVBYW50c29YQXlsOEhlcmg0?=
 =?utf-8?B?ZTYxWjR5dEZGT0pRVCt3N2xWN0M1WGY5MFQ1Zm5laVd0b0dyNmZWRlZPVTdm?=
 =?utf-8?B?WkhoMnNHTXhxZDJYZWpoMnNPTnZodzcwMElrVmMzQ2g3TkJ2aVNQeC9NYXZV?=
 =?utf-8?B?Q1BGZG9oMFdsYzNJbWxDR2FycVhBY1MxcHdzWGNrbmJJbDdQN09sdWxuMlAw?=
 =?utf-8?Q?mdSrpSoCMNPDrdXkUupn/cdqFnPBNslde9aeY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c454ed-a7b8-4b88-b86f-08df24605dc3
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:47:21.9695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13UYVJLTjGdLXqlE32AZbaSfJcM0q9n0lIajA377lPiBuLKyjacNc0dXx3kTpdivRegoWrWoVKsAF9ZHb+Q5KmgEFAq5BiGptB44TWNgFGr7FagD94MAWWMi3CY8lnLs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11738

From: Peng Fan <peng.fan@nxp.com>

Use for_each_set_bit() to iterate over the enabled wakeup pads instead
of checking every bit individually.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 627fff6f1886..1ff5c2afb2e8 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -593,22 +593,20 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
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

