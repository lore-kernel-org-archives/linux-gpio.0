Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013021.outbound.protection.outlook.com [52.101.72.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A43424D7C;
	Sat,  3 Oct 2026 12:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029438; cv=fail; b=C1wmcTFLZmkCrvW6DBpZJ6MDXC4OOFt6eYuH0021Gv4OldsYSG/dd29bX6tGOamdTOnOM4GHrz2nixk/XtfOQLVU2Zf6Ng9wSDdYro6xY15ltAWOBON6bEWrdxYwItX09qJMf38ya7mW4uVErJdD8hg6kTL2LH0AWrVuAhClZq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029438; c=relaxed/simple;
	bh=e+jq5/69N1yCPbcK7ARWJL67gYbO6wv4IABHKQiJjlU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IQwz13/BIim14AouzkcpQGFDVRswrqX6RCLWXzUho0As9xsv7moyvTt5jvbRp6PuVlpE1vpkOvIjFzpKTBLXegJy3U0xn7DKdi1UwgrtmTgnjxMsXNy0NneK6FepvFDJGmFNp6yiGAQt8EAyWAPi4nhMVudKHitUdgQaMY0g+AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ad0uGwSH; arc=fail smtp.client-ip=52.101.72.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ad0uGwSH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8GKetRir8+3vjAcK/xRNHogKiq5kCUqkL9LVAQV1xarTDwB9v77SOlwoeFJ37uDMJceLdhvUgmgyFdktprMczXkMLyO737H9Y1v5O4h19LiEhH6c5M8fUaLH6cgHEpuwmED3LCR+yUJPtk3nyS0aLkFt+bgu4jcHbGz3qLpNazwvfizn01obZ+W+uFY8OjWVVGAJ8a4QoUNvOO/EgxbwJ+h3A0wogQwJ2T5T07QW9Vku1OJtSI72nQTXSSWgyXh1rjOwFwXe0yPMnf2cSZKBYKXPrsoD+EYhTTvpcfgJ0G4GnKYXnU5hDcvz5wYYhBEaMhhStQ3ldAQfGCQPZn5pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7Q639nPaMR4/rFy+rFDmOD9e0iJzjp1Tg6zqZRD7JY=;
 b=PgtJ4Il+1IRp8tNLkgNBauhdtLMrNhyuc8dhoRUmVdrXouS/mCXQJTsJmlnveIyVFWBLQoM8B0mPB1Aqfv32zE+tS7vwy+gSbGrrKUyg39W99K41bTjaHonXFc3KpLceFJX5JOAKztpdwrOgmKJmxMcwX78AhJHqOQa3OPoMkDrZNAKE/U7A4ZFlQNCaXp6WjLrRVTB87EiUGHnxKF/BCxIqBduUGb0CLqubJnA6L1ZDGa87udrJ9T2gvYqY0UKEtxo6nMmFfKz2guXgQ5kye/mhY6zy8rcGiLp9FyJtHf46Rq6b0Y7RGe3JQgbDErwedc3qNZLrQHoxS2K4aax62w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7Q639nPaMR4/rFy+rFDmOD9e0iJzjp1Tg6zqZRD7JY=;
 b=ad0uGwSHwX4Uk6M8Cfl3bG+HvmNKQv8jzBiByJEoXLO9V7hA9B2U/uHT/U+xD4Gr1qdU7NZTpp3Ssp/7H0QK8zwepG9l+7y9SIuKIecPJPqOhrQDgoC/+i75M1Sy48LRLg/TT2ZLbZoso1IRV5HKbjQPwqoCk7f5Fw5Mm9w2vy4wOZl5/gzqKwJBjpJYwAJhOYoqz8J7C9xCfP8097/JGmDhu86m/SwaNno424VxH+WVo08bubg8J+D64t0sytu9D8c6K0x8Xg1FHiqdnjxY6dA2InvLv23cvJeJ+XG46HcWeKhpLhOLNPmGtv10aDgybEtnawtZgRwZOEWmBesDRg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9467.eurprd04.prod.outlook.com (2603:10a6:10:35b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 12:10:32 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Sat, 3 Oct 2026
 12:10:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 03 Oct 2026 20:06:51 +0800
Subject: [PATCH 9/9] gpio: mxc: simplify gpio_set_wake_irq() with
 irq_set_irq_wake and assign_bit
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-gpio-mxc-cleanup-v1-9-dad728ce27f2@nxp.com>
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com>
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
X-ClientProxiedBy: MA0PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd8d694-7008-4a05-023c-08df214752ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	tum+jrybJWN+3uANo4DjY+FeIu1nkByz8b/iPlpWWemivcxzb9CdujzCbLRFis/7a0RfH20iuK2Os4cm5Xhsyp7I4ZEs5YPwsNe0WeNQR3GtViSIYWmP1EZX9edG56SfufdCsI/tRWks5/3VeJ27plribcdETYZrjq7u5LDzFDzuazy08Uh8k28g3PSBGPNgg3UjhasmxSHFBEgqXw+tnJhjoqZqX6b53ggfVnrPV+1drp789ykzeB0PjYOqIUFqTGmMvbvdYo30WaqSlmbvL4Epet+lU0nphd1WcXVMC2E0JYebdlOcy/CK28UnrKCO2SbgV535BL4pnclCVJPMRLr8m27ghXiCYZ2lYSfRfdNeT8JnYYjqTZtV9dEbM7uaq0MtfzvN4ZgLTepniHfDOfdFyH6ByDT6E25sRzEuM/v+q9Q0EEmE6imZjoD0Hyp/KRVA/iub9dOkr6c6MOJyl8xX8ldsPC2hhz+CsJkaMgD/wMwIcgMBTZ8a9MXuHxCj1VECZHkTF9xrnuBUhgMpKJooF+CjCNj27qGm7Ag0QSi8fXbXco+Gd7IhMleiOAD850G1LA8aPv6lmfPgVfUqErgxLBenCGWhuE5HZbgduUfRFyFQtITeHvnc8atJkii2jC4gNT/Gr5wxfoj+rHhkGxnZ8mLpkdM+VmkgCcNCX+0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDR1Nm9WcHp6dEpnanNZZExQVXB6RUFRenU3ekg3ZWxZTWo1c1YrUkdDbXZD?=
 =?utf-8?B?MUdRL2NKaXNVaVFYTjdhVXk4ZXFVekYrN2dzSmFJWERFQVdGYVpGYTRZK0RN?=
 =?utf-8?B?MXBlVW9OM2d1UTBndXlIdzBzeGdaMWhMbnJoWDRha1hBQzdGd3BOclFrT2xJ?=
 =?utf-8?B?YnJFbThzRXRVeEEyajBzdFVrSGxlNG1zUDlWU2hnbWUyYVBCSGdCQTBRbWVY?=
 =?utf-8?B?eHpuanBPWmo2Qm5mMFk3VTNBRUtiZEhleno5c3ZiUUtlMjZaMUFmSDNEdEJF?=
 =?utf-8?B?YWRJdldzV0RaeVZUN1pUZVI0QVVlbE1TSE54K041MFRCa0ZKQ2NWZ1VNSlhw?=
 =?utf-8?B?b2Y2UVRDZ2k0Z1pNOFFQV05ERzB2TEtBK3lZdHN3eUlwcFQzdzdIQUFmQ2ND?=
 =?utf-8?B?eDRpZ2w3dDYvMGNyVTBzeGdudUxvSTNVbzBNWGNPNnM1czZ4WGo3TW5VOGxH?=
 =?utf-8?B?NzdlUmZ6L1FGbUpYaEhJQ0YxeGgyOU1ZV21FdmNEdi9kaDEzTXQ3cG53NmdT?=
 =?utf-8?B?UUJKSDRyczB2bkpnTU0xNEE1V3FHdkJtaThKQ1Y5Z2kyVGtLN2ticzJLMG1Z?=
 =?utf-8?B?bXlJQlE3dllPampZNG55R1VoeWlRYXJGN1NUQmkycVpxbENQbU55c25renN1?=
 =?utf-8?B?Ly92dWdOOVl2WUpncnJpMjhWd29aNkMzTUdNMUxhZFFOUzhBMDdBS2JSdldt?=
 =?utf-8?B?WHRFajlEQlMxV3Bjc2hhNTFJVm1SajJQcDl0eXV5ZnovWGhZa2RrY1JpWDM0?=
 =?utf-8?B?cWtXYlpBQWhWRnYvbnU2UlRYMUtuNUFDYmpkbUxlcGp3WG1mN2ZEd2lhdE4v?=
 =?utf-8?B?Z0RmZzZSakJ2RDdkU3pHdmpDVzVaSHNJNm1CL3A4NFphRUk0N1FBT1dWQ0Ex?=
 =?utf-8?B?cUhsT0pCTldTd3Vjd2EzSTR1anRTdmFVby90M2dnNU5tODBUcWh3dmhoR2hC?=
 =?utf-8?B?Y3FldERNWU1VRGFUTGg0M3pIR2hzNzhPbFYzQlF4UkxSV2I4MVc2VUZQMnll?=
 =?utf-8?B?cUFubmZwQ2NDL0tQQ0hIRldPVERVNzVFcjFIakxrdHBpMC9rWnFYdDlxRmMw?=
 =?utf-8?B?RlVQU1E0TEFLTXg3cmJLM1c0Z1lmNEh4aFphNXRoNFZSaDdOYkRWMkwxOG91?=
 =?utf-8?B?ckIwVm8vMmpzMkJKdVphekI2MlZsTnJUcE1KNk4zSEhlOEg5OGJBYmN1RFpk?=
 =?utf-8?B?QkVlMitoZ3pucDhxZTgwTTZpY3VUQjdxRzhKSko3dmRlellET0ZNUVB6WUtp?=
 =?utf-8?B?dkxFaHJGMDg0LzBCZmh6S1JZdGRPSXBwTnR5M1RJczNTeGtlM2huSjZDTWJM?=
 =?utf-8?B?UlZoVzhZNjVqbTMxb2tkaGRTSUtIN0ljR2VOQlNJYUNxUU1STFRub2VXaTVq?=
 =?utf-8?B?cmM2MXNyY2swRVFGU0pqbEVlWFNuM3NTeHZRTE42WTZyQUxLQ0VYU29NeFFt?=
 =?utf-8?B?cUFMS3lhMmtBODZMMkhCSCtzYUFLSjBmc1NwdFZXczZmZkxyZ3owaERUZmhN?=
 =?utf-8?B?UHpidDd4djBCVkpubnhHVDY4T0RrbDFmQUVmNUZRQ01rVGk5K1gxTDRvWklB?=
 =?utf-8?B?elNhOWsxODU0NGJaY2VUYjYwRVR5OXpsNDJOYU9RbldGMy9OMWFnbVQwYkZR?=
 =?utf-8?B?aFBQbXV1MTRCUjB3dm5tb2RXMkVaOUkwM3VNTlUzUWowYUpZajJzdFFvZUU5?=
 =?utf-8?B?RDkxS2xsTDY5MitOZkJwRUpCc09RSG9udzhSS0FzWkFlTWNzVzJhelZkWVBT?=
 =?utf-8?B?eENGeDYxcnVBWGQ1NUswUHRRY1VNSVVoY29rMjFNS01QZmhLQlN1OVczQVlO?=
 =?utf-8?B?SXlyL3hwSEF6M05GeVFwcXVyRmxEWlc1MGlOZ3ZpcG1WclVCZGpvc1NpMmQ2?=
 =?utf-8?B?T0RwYnFaV24vNkR3bjl1VDcza0xneUVkWkRCVytKRjM4VHVHMTFyOWZ1SkZQ?=
 =?utf-8?B?Y29leWRyNVFRdkF5SzdVYjViMnUrQWJ6cHZiaU02Zy9Vcnc0NzVqcGpyNkMv?=
 =?utf-8?B?QmdJczNzdjlzQmpOd0lVYzlEYW4vMHAzNnNXb3F1aGhZT2w2MDlzV0lEeG1q?=
 =?utf-8?B?RmdSWWd4UzFoUUplWjZyMkJ3ajhMdEZhRUZYS2h2bWd2dFE1YVJ1dDlrc2lm?=
 =?utf-8?B?QTJ4TTYvQlBTbDRiRjJmZmZuT2d0bXpWdU16V0QycHNJMkpIaGZTaUlSVVpD?=
 =?utf-8?B?UldlekI4WFZJUXlUR3RlSTZ2WEVBVWVQQ0hyaTFBVmNCV09tTnJBVTJFSWo3?=
 =?utf-8?B?L2J6L1RsWGlYRHcvLzBucmxWQW1EL2xBTnNUZFg1RHUyNy81WXozL2RCVlo3?=
 =?utf-8?B?b2hQamp3SXNML3daOWRsTU9kZ2VITVZISllML0hXYnZGVlhkeGgxc3lKSmxs?=
 =?utf-8?Q?Uy0CrXX8ksuGZYdnWRmRuSmRIuLbX8sXHj+u4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd8d694-7008-4a05-023c-08df214752ce
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 12:10:32.7834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pi0wKcCkFfZ+DND42TRQQ0bGcWFB8+LVOs9letjrdHnzQLkveVPEDnVEN3XAzhQBNpVB0g9kXzPC44uC8uUfSfOHwCixzoJHf4823e6yr394Njpn7iyqMmHVg5iBlZFa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9467

From: Peng Fan <peng.fan@nxp.com>

To simplify gpio_set_wake_irq():
 - Replace the enable/disable_irq_wake() if/else branches with a single
   irq_set_irq_wake() call which handles both directions internally.
 - Replace the separate set_bit()/clear_bit() calls with assign_bit()
   which sets or clears the bit based on the enable parameter.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index bf1207f30460..546a46857e1d 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -329,21 +329,13 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
 	u32 gpio_idx = d->hwirq;
 	int ret;
 
-	if (enable) {
-		if (port->irq_high && (gpio_idx >= 16))
-			ret = enable_irq_wake(port->irq_high);
-		else
-			ret = enable_irq_wake(port->irq);
-		if (!ret)
-			set_bit(gpio_idx, &port->wakeup_pads);
-	} else {
-		if (port->irq_high && (gpio_idx >= 16))
-			ret = disable_irq_wake(port->irq_high);
-		else
-			ret = disable_irq_wake(port->irq);
-		if (!ret)
-			clear_bit(gpio_idx, &port->wakeup_pads);
-	}
+	if (port->irq_high && (gpio_idx >= 16))
+		ret = irq_set_irq_wake(port->irq_high, enable);
+	else
+		ret = irq_set_irq_wake(port->irq, enable);
+
+	if (!ret)
+		assign_bit(gpio_idx, &port->wakeup_pads, enable);
 
 	return ret;
 }

-- 
2.51.0

