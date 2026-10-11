Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E067A43DEAE;
	Sun, 11 Oct 2026 11:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719684; cv=fail; b=Sla3GAFBO4C+bnBfYh6sAbdTYHMPa207rbdXyNV5aSP1yLd++yXLL7HcwpUoae3/RXn2ZxLGxz2jhkdiy7VDMKtVOZGdJHPbGzanMLh1/Z7pp0F2zqMZLjyYMhgS5qppjGFsAFSfY3nPpkqa38ZETit+CXAtD1nZk/EXd/FBSRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719684; c=relaxed/simple;
	bh=RKh0MPV/0BSDoYaM4MjHRxP6wEHBu2fM3aipXVFtMrc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VeQVFKR7Q/ikCOB7eelUMHyg1bpQq7mIRs+JEErOm2SQNlnAYdmvOj2PkjHbQC1mqKaauxYXKJc9cTAUFUf8Me0Q9cY6dswmwyUNMGE01NgLFsX2EYiUnANRYQxSnCW08Mhd40MRSdpiGwmjaOEF+W0hUM/GXUo8jbUhGXCAdEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iaUC2WfF; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iaUC2WfF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7wZjJbof/jgscwnDYuRqo+krHnePUWo1oha17raRsJqcCWpsPaXMuldyITtwpD8JyGOPk/f/taUfGhosvpDOfrEbF+amnel55jYcdYv5Qvrr+opAwh2pu3MwiAirL7AEbyxJyfNbOumf+g9s6pmmoF2tPrzrHO4hxHqPps5RKRyVCndySSo7okQppHyJpMjOP6uBHKN4FZMndF6Ulr3gV75t5kV/ws8N7oz2GMMH3IouQrIlA2PjN47HvX71qivEHcQm3A5mgYznJqdmxNXjXlq9XHPVCyQXG9dDMHH+TDRT4Hjac/Z5XLJ1lXya1mbv7bZR9cMvfkdvptLogbxwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tJyll3t3IvxFpMt1m+ZBHmqtkTAsS2tveMg+y8v79c=;
 b=qwPcKvooBtaK4e3YabbuM4FDs+c5WPuQZQ3jxsRPJKe6P8QvFqHs5MrlOm0pHX6ai+Fl9j5KnLFzoMtZPYkAVcJqtGiz9kxQIbbktR2V7cRsETGhNsqm/U6ifyryIPY/sGbS+ZjfHQXQpsaJaBeW8w6fMgk3LKPDoolJ4g8OsKa/eKrN0pJ96V6nVZk1cNxKntdFW6i7Tqyd/9motXq2zF4hV2ExCHuxSh5uWnK0HC8mfC58dsJ300WJWJhWK4E891MGjcR/PQS2Qd08Zq8sGdk+af5IToFQvSV3ix9L3JO4T1K7x+uT2xK/xaUMXn+1Zk2PiG9Q/Ay9KSMAOaedPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tJyll3t3IvxFpMt1m+ZBHmqtkTAsS2tveMg+y8v79c=;
 b=iaUC2WfFIIFM0UwpXW4jxYef6mdIPz4CcrH9bQd+ReD+Ok6fvf8AAq3qYREdCdfFdJ2Vu9lfkB/xGy0gbv5W1B0n/LueEChlmDmFbhOJJe8nbR6jKdCPUwWsWbvRwy8GrppIMazQQWcwEWZ1/Yc7gNl7CmDXhWIJE0Dzg66JwCksYLN//p0cwbtD3xW065UsMfixwd1RWE08dPr20h7Qs7JtK7Sn0/8KfUsqd+f2QlzahJVnce1o43nH0UVxjEfLQKvASsEGv2hnqR9nDckw7LTd01pKW1Qnfs2l1tRpO122ou05MhWE56gZmkngjHB/jaWqJcV8dG7kaZ/myMGBFQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:54:26 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:54:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Oct 2026 19:51:26 +0800
Subject: [PATCH v6 05/13] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-gpio-mxc-cleanup-v6-5-cb47ce2ad758@nxp.com>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
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
X-ClientProxiedBy: SI2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:194::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: 3964900f-6001-4b5d-39ba-08df278e6661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	57BstkFKkx2P53/jg7n+CAxrUyXhWdNTthmHdJppRIH+OLBquGVBuzgX/GrbZBedMwDkxN9QOAawVtrrpLm3AfLh0ekCDtHuATKVs6yyNvxT+19SsC66thAZw43LtdOOF+oV/4vDvHJl4l+/K2+fqbtzFTk6G5tgcVNa/mOb4fFP5gy5+Oxs41pw4PLO46kIhrrFigcd2tJyxv4UibE8tRqCKuQqKy/qBXJWLCWjI1w/oFO6BJ7cyz4pDuDht3f26kFRy/jucYGdcRFGyuaiHKHT/zjqV37p2YO+bTrjRvTGrRBoLtIcJyCYaMH45b7p8yQkPNoH2uPzsX4ygVeK6nu/dOTlk50fCKxtXuTSmRAqmUJ2gNuz/Gbj7M5m9byKfmtPb2fWpQR5O+sv8qpv0nhQqILvgLPkDdIHJZw8BK1Ib0Jbkx1J7/XtkaBkB1mfC9wiUUYj0gvWB7Yt3SUmMeCJyLPn0pw10fjReEakHVgQPRrTbxi9j1Ve89NlMUJRDCyOM7SNt5P5WDXum2UVszLTxH19JncGs8CeroG+n/h3nbjKfZNcJIdUhDHWZyTm2/iki+SRj2YXftbMD6dyS10KapnVEB5z6HUfJGE+vyfbP1NHAa5NN2iBPZx7viq0W69REo38v8JnqZuG8TRgy3uqFzFGT0ByWNqqeT6KuQs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0pXL0hraEsydVlBNXlOSkdVbC8yWmVLVzhSNTNLWDh4OEE0cnErdFQ1TGhW?=
 =?utf-8?B?ejRRcThGaTU3QkRXa1B2KzM2TXpqcUtsVjdXTGt5UExzTC83b1YzTzVlTWp4?=
 =?utf-8?B?SWdEeEZmYzVLTUMzUGk0cFI0UWpsUFNYNHlQWW9GcGxmZmgwT3QxMGF4Z3ZF?=
 =?utf-8?B?R3lTWjFFUHlVSVBTcmxJOTJqRmFRWXYvTlIyOEh4blAzUWpJLzFFR3ZDUndl?=
 =?utf-8?B?Q2duQVlqSXQyeUpkRGtxVmwwK2FqcmFBc1NYRHZkWitFQUpBOHJFR3JhS3M5?=
 =?utf-8?B?eHFKZEFuRjVrM1BsclRmeTlrQzJReENSVEN1SnBxUHlvc3VES2RHVEtrLy9C?=
 =?utf-8?B?UjRQNk9SbmhjTmxzVXNVQ01QSTBHeXB1Z0VkVlRtVkJHeXhZdzdDMDQ4OGRM?=
 =?utf-8?B?bmNTZzhsSnRmcVNEK0V3aTBKcTZvT2hUTENVSUxuQmJ1R2ZMSjgyUTJnNGRm?=
 =?utf-8?B?UUxXTVYrWkI4Skc2QkR0NkIwZC93SEhSVldOcDZrODlOdW40QWV5Q21zQzdH?=
 =?utf-8?B?Wm1hQXJJSndENTF5N0w1ZXp2OTFtSVh6ZDRnTEc3Vm9mR3BmTVVjOUtFNlB6?=
 =?utf-8?B?N3ZzWkNia3FpNGVsZkREY3JyeHVlVnBPTlIwTG9IK2svNDZubmR6ZXRGYzRt?=
 =?utf-8?B?eU9LNXQwUDdzYW5zMEk0M0JaMlY4TDN0VGZ5dWdVdTE5QVJmdnk3VlJXWitx?=
 =?utf-8?B?cmtlQmJ3aW41R0UrMG9qZGZJUTdXZFdlTitZM3pjL0dJeEttYzlSZVRkZHNt?=
 =?utf-8?B?U3FaS0d6aDluS2lnU1RXditXSG8wd2xtMFJGQVB4YUt5cFVnUTE5bnJzMGEz?=
 =?utf-8?B?d0tFdHB6T0RTeUs5bSs0ZmlYdFhTNW00NnZxZ2RBSDNFZWE0VWxiTzh4YSsw?=
 =?utf-8?B?d0FoaDloWUlYK3IxTFhCMjIxa01lcHVWRVpEZ05aUi9EdWRvdHk5RFFyUkRF?=
 =?utf-8?B?ZWRabmN4S1BXSSsvelFNbCsyUVhHN3FFOUFWQVJ3YjI0MmJXYXFlMkZaVGRW?=
 =?utf-8?B?dmdpVTRRcjQ1SUQ5SFdBK0lncFhyenJYckdwM0lkdWptb0pOd1Z4U3pJQ2Fi?=
 =?utf-8?B?NU9oVWhpR1BlRTlFd1lsN0w1WDVOOXVuYzF5UkI5cXVJeU04ZzA1bUpreG5K?=
 =?utf-8?B?ZVF0RUo0QkN4dmhaOE85VVZManJ4OVorb0djZkZML0JJcDJMRVhhTXBtdlFI?=
 =?utf-8?B?V1BLNkVVVis1Q1VkbUx5c1BldkJOaEVPOTRkb2gxTDRnSUtqRWVZd3NUUU1O?=
 =?utf-8?B?blJpb25HblpMa0JKOUdreEw3cDYwK3phUytnWnRIYktidk1TWENNRnppc3RB?=
 =?utf-8?B?QnZNRmt4bUNTYjJ3L0wxODVSZTFzeEVEaXp5bmdtTnlYYnhBWTRwVkdlVENV?=
 =?utf-8?B?cUZCQU5kK1NzSk96MnpXUXJCcmJodElHelNzWVh6bnY1Q28relUzWWVrSWMy?=
 =?utf-8?B?NkNmWXNreUZHamFYaG9JVXRZZGZqclNxa3hzZ0lvMzd2R3lycjVGRTBtcHVi?=
 =?utf-8?B?VzVvNERMWU93T0NBWk96TWJTOWNYaUVDa0dOcy9Rcnh1azdzdzZzRHVrY0Np?=
 =?utf-8?B?YnBDQmtLRnFsSkt5VVE2YW9odHUxUUdvcWQ3QjcyTEtYSXRYWTdCY0g0R1Uy?=
 =?utf-8?B?RmZ3Z0xkbEtVUnRsSXM4WVEzOWc5dkJTYmh4YmZ5NGh4NnNuQ3BLN0pXenRN?=
 =?utf-8?B?V09xTFkrbTdpeWF5N2hzY2gvczlSMktrVERFZng2MFR2U1UzSEZvWWlwTTdq?=
 =?utf-8?B?ZFRSeFNXenRDM2c4Y1Z4TmYzMnRqNXVlclVMK3JGMkxPYldBMm1BcjZ4OVRr?=
 =?utf-8?B?K0xKaDdFNS9pcTJyVldtUzM4WmVsQ2p6RUliMmI0UnpuaWV4eG1QanhUSWZm?=
 =?utf-8?B?RlkvRmFvVFZyekxHakhGMlRVRW0wbnlVQTAxRXc4SGtuTTJZSGp6cGl5Vzlq?=
 =?utf-8?B?V3RFOXBoTnRrNnNUQWFkODFsSk1TaTlTdEJRR1VOUUFra0UzYXdEVWVRMDdp?=
 =?utf-8?B?N3hNN2d4K0R5bTNxQ3RVb1RhWmw0b01pQTBoL002S2VnU0FWalBBWEs5NVU2?=
 =?utf-8?B?MTVIQlNVM0xUNFBJeURYSlJWZUhqbC9mNlorWkZrN3lQVzBRN2JtQVRZQXJP?=
 =?utf-8?B?L2tkQ2ZTSVJ1RGRxTVNsRFM1anphbGd5K0RjL2F0UEQvTi9sRjVLKzdpMkw2?=
 =?utf-8?B?dHBEb1lHbUZLSTExUmdRUzZRWC9FL3JpdFpPRWZGNDJHZTNIWDdVSVBNV1JX?=
 =?utf-8?B?bFgwcW9xOWhnQzhaQmswc1JzRkRzeFIwYzF6TURNRGV6SlE3RmduTWhVVGU0?=
 =?utf-8?B?UXgwSXpURnBIdFVyeXh3SXpEL3BETFZMMDdjOG5GYXNpRE45TmJTNTduSGtw?=
 =?utf-8?Q?kDNsIiGvHJIHLS4JC8pb9qPBDdOCSKOY+aZTh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3964900f-6001-4b5d-39ba-08df278e6661
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:54:26.7871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/EtWxzXGwOGtITMzJn54amvwDDDrqZ0m+ay/X0h34MTQKqThUVzz3I1L8MlROaF5SH3pKviunNDQobS1WjX87NxkDtiKlnxG1PJzVBWCQ3hLPVOFroVOVOmX7IhOLu5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

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

