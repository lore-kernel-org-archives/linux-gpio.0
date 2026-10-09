Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50724F7998;
	Fri,  9 Oct 2026 18:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569341; cv=fail; b=PWa9PcNk0sdv4+FIkI4z3Y6Sxl/gnFbqpkz6GFJBaMPPPGIJ2PPNnEC38vO8AoqLUUGZNDFTzf8qRvh1urGNDbgnXDlREl9OQ2MV+ageb/DFpQEQGU8AIeSPbf4y4uIKS/OXO7yPEpoTSsJRfJB24zb3LfouxvQkkWwXRFXVwG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569341; c=relaxed/simple;
	bh=RKh0MPV/0BSDoYaM4MjHRxP6wEHBu2fM3aipXVFtMrc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=s7prYVUVW+8Jn9q8Z0M/wTzLmkByrmvalWH5UI2Zxf2o3nMuqO0oWUbneshjEmSuuLTASd/I69ftd+M4koEC7fLxszL65x+RbTWV4y74k3lyuyLYrBvNyG5pjZHifiX8anN0xCamtlxIK+w1KPOf5SemK4rF7DEbuHfSBvpi7Lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WkvIYKAv; arc=fail smtp.client-ip=52.101.69.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WkvIYKAv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrElEqG7vWoJIy1i56tb8/ugUJ9DVum0WJL9WJ4q8+87W3ER5Z4ENcpiZV+TgG8/0j1ImqjQGmX+KR0BfH3+lgxJAwca1JMRVFb8bCqyr4GIuD42YtwbFv8imBJtAZkYvEYdwRaAcVvdYewzv3bhfU1mbrXxcB5gWHVLgEDNWjHHTTMsnsH81IF150GugA80FsM9e42n5RIgo+r2O5DiOqjDQr6inIHZhaPVFr0YsS0eCuc+FqiEFDODkZ/drGM/sYh+w8qa0hSit4n+1SLpH5Vov5x9uR1VkPuNYewcOj6Ec9+zozcEVc4tAqPqzkGbso+InQCE9l6GE4rzcLNZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tJyll3t3IvxFpMt1m+ZBHmqtkTAsS2tveMg+y8v79c=;
 b=YG6WUfclY/FDrnw5rDxAg+v2TKmE08rzzW/ruO1p5sJa9faaFlRs4abCcoqmNcNY6zeyq9653pesla8O3JpV49mYnNbEoWncXFINV5smtYTCPar6W7bocVJgF/jaAtmHiplHsKF83PgSa1EdeNpBqD7NeYZfuVRo+xc/qyBU6PC9lw1qV8zcqLTJQDJ/7B90KJ+Ti0FAlpmeTZF7dH2iaguY6SW8K0A9QpfsJlEwk6fX8dMQgKAkps+gAKWMiGV0c882YzGqdMPX+gy0waen6ZA8RytMnhyYnvqhKeTyFq2sk6Twc8IbQ+DoSSQzOz22tM9mCuHo4dE58ErEQfRrGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tJyll3t3IvxFpMt1m+ZBHmqtkTAsS2tveMg+y8v79c=;
 b=WkvIYKAvoJvluYPQivL/b9JQvsJ/d33Q577vwnGwVGTBOeoU08G+VSMHqr12gEEspCcv0p4FYJANh/yKl5BPETu/sUw2RUxgnxC6qIRdGhsD7dvbNcHD7MPP8PR8M3ZFzDvb6d+Ww850eJztSeearqQnQ6nKyMLjAVAk0HRwmnZKuv0r46XpZVDafxzguAZv0lXaHN9zWVT1bqDLAGCOadNM5EHPZ/9yHM0B4i18c8kIFylTLAZCxll/2dryQE4Ve7lwp4d1mrRf/qAf2LcqT80QYq9PCz6XkWD14Wbu8zfg608ObRkA4OTJCSd/lEe2Z8UupO9T0G5XiEokUyHudg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11189.eurprd04.prod.outlook.com (2603:10a6:150:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:08:57 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 18:08:57 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 10 Oct 2026 02:05:26 +0800
Subject: [PATCH v5 05/13] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-gpio-mxc-cleanup-v5-5-1e59e6ddfa00@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11189:EE_
X-MS-Office365-Filtering-Correlation-Id: 6792a84e-0f8e-4b44-af02-08df26306306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C+WqStAIvtaTzwKdeE1zSJ8GWG+i6rQZ83asfNfDL/acaDlBa+5TTee4wyI1zzh58ot4YWeEFaw8/7A/4igA6grne1bWVD4tAybYM4vB1KgwUI92KCfTydmVv/Z32AiNbn/I29vvOO/fclkwQ1cB9Vz2tYeInmiHuAa/6JJyCHoaA1+F+9XB2YTb4o023cIql3HHGd18ohW30kD88HpcG4cOKWMpKcEa3rLE678FBEVhGZXUGcYym55ixb0dX3812QyN51C8X7iXbl046kEFpkhtKrR2mmzAYTbsWpk4++0cYD19CHw+C7SgL/wwzLcCqikAPtc4DeOYVVlejZnMXTky6cgBzkMlPzhJL0ak+rOasSldzr1GVndHTHl+DTYYDydF9ct+0yUEqQfipBRXcTZW6eKUhFcK5j2ewyuSywBUFeCcoEwFv/ig2k7Rtlokbb1nDjl87W7euIK9S5LU1rY9JQFHMVipC9BkirTfKRt/MyLb2yAuUwajILn6O+ZgZVUgeu6Hxh7l8KEUolfKj/z2N+6Rvp0fdIyEvNmqvZTEzVVu6QDbZG12g508VABmIbdeniu9jF4TpLBMgunn7d4Hroxy+qEwf2EIUqzFWh4Rf+gyJWO0HDGdlnHRRx+asv6GFpZ6fLvDluyA+de0xx46jOUTljNdC5TCa9F8yMI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlJSKzhLZmp4ajJ5K2gzN1JTYTFycm1XQmI1OFB0S3pOOFVJTEk4MURCdEVk?=
 =?utf-8?B?aUdLSEYveWpGc0NZL1lZZDVXSnFYMmNhdC93ZGJFZnBmbTA3ZUJUREdoQUlm?=
 =?utf-8?B?c3Z1dnMxZWh1dFNrNHUwR3UzcUFPK1l1cFRPOWp2d3hObCtrZ2dwSHRKcGtS?=
 =?utf-8?B?ZC9IMjZWaXBpWDJueWg3MUYzUFZWM0lKTDFxaUp2WFA4ZjNPdGsvZkgrZnNm?=
 =?utf-8?B?ZTFnTE1rL0pzSjM2cElKU20xcXFqdDJuekNlMEV5QjdNZnpEeDJDUFlDQ2RN?=
 =?utf-8?B?Q1BkeDZzK200c29hSGcrSEFBa3RqY29nWlpaNjFVbTg1ZmlHNTBockRsazZD?=
 =?utf-8?B?WWdPZ3Y4MTJDVTNUS0RwWWFPeGlicW12SUgybm5CTG1JejFXeEJ0cENlM0ZV?=
 =?utf-8?B?QU4vc3RNQ2tmdGRjNkhvZW5NdWRoQnJJMXdPSGtZYWxVTnBwWXJKbGFSTnJi?=
 =?utf-8?B?QkdtUXZYTVVnbHNLZW84Q3V0Q2hEb08vZUFhdXI1UldUVlJyTVJUN05qemoz?=
 =?utf-8?B?a0R1WTJqZXMxOVVnbTRiQUk3bGoyUW83YkVtcVNXbnV0allmblAvN1Fhajl6?=
 =?utf-8?B?UnFGQXh2cFNaNCsvMFd0NVZyNWpORjdTK0NNUFFORFpUek9sU1VYWFpvTmhw?=
 =?utf-8?B?Tm4xcmMrcGZKaFFNM29ESVlVNS9aUHJHL2dtcG9ET21wRmltQ0x5M21XUWE1?=
 =?utf-8?B?SEdaM2xYZVVQVUYrTVRoOXpCUWVORldGWE5MTW5YUitRMGNxNDQ5bWU3Vlln?=
 =?utf-8?B?TE5nVkNHVW5VK3hZR0prT0M4V2VoVDkrbEhydUVvT3RnQjV0dW1jR0FPQWQw?=
 =?utf-8?B?VlJTTGZJRXNxdVl2a25WRUZzRHA3TkdoU01QL3EwRzlVa1owM2pmSU53dzdJ?=
 =?utf-8?B?a3ZlSTRJRVBLNEtlSzhoMWloK0ZpOXNpMCtuUjJBaldLOGRCWkt4N1RjY2Yr?=
 =?utf-8?B?N2Q1M2lpQjFUZkx3cEhyZnk5NWkzNEtwdEoyOWhkVVFuVVVHZVFZb3NoSjFn?=
 =?utf-8?B?MUE4aEM3QVEzclQ2QjA4MUFsTCtjVnFEbGx5TWxMckJnSjVuRTdhSkpPOFM5?=
 =?utf-8?B?bGl6UkRVV245aGdoY2JNcVdObytXRlV5bjQ3L25QU1dKR2F3WFZVV0JIUnBn?=
 =?utf-8?B?UWkrMHZDT1AvMUcrSEdNUW1zaGdwZEsxQ2VUZEVHK2Z5UW1rRGcwLzhYeVNY?=
 =?utf-8?B?ait4QzA2REczQ25DdjNxblF1aGkxMGR3ZHFSRjNLeE42RTZMN05EYUpPTmJr?=
 =?utf-8?B?UGFSRlRXaHNVZldTSkZZRWFzZXFYdWdQTlB4c2llSVNTdWt1VlplMWY1cjgr?=
 =?utf-8?B?Yy92QTdSblpLMDVZWUlPUjVVTHJDSytrYzkyOUxTdTk5RUhqKzQrRHY3eTRq?=
 =?utf-8?B?OUR0RGd2Zmo2b0N1OUFzdjRvRjMzcUpJR0tEMHhoTXY1eWF5dStmNVlXVTNG?=
 =?utf-8?B?eXMyZ0tFbDBERkd4OSt6SFRoOTFsV0h3UE9jOEg4eFg2cnFjZHE4bFQzR1hK?=
 =?utf-8?B?d1d6bVVGelpoaFArOTlJU0hpSFVKekdIZzV6em0rd3RLMXBqbVhmL2VMUzdV?=
 =?utf-8?B?Y3JmU3RBL2FBTnFIWUg3VHEzRk5rckxJdGx0K3ljZkQ2WFA1ZkFLdkJIY0U1?=
 =?utf-8?B?SHptWkt6eStIV1dGRlkzTTJRMXJZM2VoMDhuZlFHOFA0dEorTUZSVkl5S09Z?=
 =?utf-8?B?ZytWdTVwc1hQa0cxWFhTMmJ2ck9LbE90UlNuc1RqelBMZnRvN3lnS2pYcCtX?=
 =?utf-8?B?WmN5M2djb3VHZDh4MWtGSER2VGFtYlk1N3ZOQ2hBZ1pSMXBKQmdRYmtzZE1Q?=
 =?utf-8?B?VjhZL2UxK3RpZVZMdnV0WW0yaHh6eWsyZk9EMjZ1UmJzZUpGOS8zZDFibFRC?=
 =?utf-8?B?VlEwSkdLdnA3aFJFMVA4MlBBdGhhWmEvbW9jWFNUR0hRaDFjUE5pdFpSVWdD?=
 =?utf-8?B?TDNNbFJHa29kdUlGSFdndmV6YThqVG53STJXcnF5RzBWbmx2T0NaR25BN1F5?=
 =?utf-8?B?Qlphbkt3RWNCVGZGOGVXRDVZNlFpQmZEL3ZCQXdJNFZIZnhRVXJEYzcwMDRY?=
 =?utf-8?B?Ym43T1VuUW02c082K1F6ZE5wdHRmMDBtc2J6cGZhdE1XcE95MVN0SVpoS0tM?=
 =?utf-8?B?YktIKzNNSjR4THV6aTVFS0pMbjFEZWMyZXc4RStGNnBwOEdCUkNUSHppTVpl?=
 =?utf-8?B?L1BtZlp2OFE4M2RpZmRtL09VSmRpemdIMUdFT2N5OEE5U0YrUlpkWDRlblhD?=
 =?utf-8?B?clFsRzZQTVZoSXdZdGpVak1OWTF2S3kzN0lVRCsxcnZVbFlWODVZcnhVTSsr?=
 =?utf-8?B?Q3hqYS9Xbmpqbm90b0NKcDA5aEl3ek1zSGlnRFN2cGdBeVB1WGNUaWdsQkxl?=
 =?utf-8?Q?DMg8hS+9RuK0C8H4bRDIVVoTXiRkrdqfCZOYR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6792a84e-0f8e-4b44-af02-08df26306306
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:08:57.3931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GsEQ7cgU4hbsa6yIL7w7WzUQsH4NW6syPPiDcXwxddhOd6Qp2khUF5xBD55lZZoYXP1aBioHVLEzFaz+D0Y6zA9hNoK+QrG4n1oZI2jlBIDlulVhRLbe4OsklbnREe04
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11189

From: Peng Fan <peng.fan@nxp.com>

Use for_each_set_bit() to iterate over the enabled wakeup pads instead
of checking every bit individually.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index c921534aafc2..28578028b9ff 100644
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

