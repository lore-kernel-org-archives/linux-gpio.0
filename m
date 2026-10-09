Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013022.outbound.protection.outlook.com [52.101.83.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B5F4FDE79;
	Fri,  9 Oct 2026 18:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569378; cv=fail; b=JxZ68p0h5bkf4wKotO2mSwOTyJgVVkMdrr9dgI4l8/sP2d4SZkeVgcHwiDAoK/g3Ijr9AvqUbYUnfp65KFqpAlzVzM9A3+veUf2qRMeNBg+GqYetICHWX0kXLHgVgAfHyllKzJdnTF7V89to5oRx73zbamDMsGcVS3WXXOIpUUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569378; c=relaxed/simple;
	bh=UDsiQ4C1O2EHWtkBcXOSQHSmVqRo3pM0X0t0UBkvf88=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=azGSe+cXVW/87gEhU9c/oynTi41IwoL/c/38BR76Qlcx6KZgAiFBC7PjK07izvcnkX/SmiqrfWpiRrGltvJZRte2fNKOBxhzX/sULN1Disp0DYqJfw2lVfR5tgBWzXqvb/XqMWghODipgCJ+l5LvH2COAQtSEhvnk1wffBHO+D8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PbLIsB72; arc=fail smtp.client-ip=52.101.83.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PbLIsB72"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzIfzNL2eMJEjpLCxlyoLXxdDPhFKr3x44xwHRB8ojFcP4QWvxhiNerOUl4SMJ1yNCBVry1POmI3etK7QEVspgjyEJ8VyrhlRLP9olOcakIZtawgxsuGbVvZKdCwsSHvasTAor2xUGXW2/C/EegotPsgfowIiTGXuEQYdTNADV4iys4lzQbjl63PsH/Mel9nHfGu9pCpR5m+xmrghYzB0EYbChEtbwexackfFf7SxTKnipQpoVgoJfHzgRYtOK5f9icmyXGjad+KM/GnAGxBc1ZnBNgP019R0PjKoD3RD1EFPnAwZsw79PBuWkOumzEUDmlwmSoWEC0FeIVtLi4IQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GNZD3HaewzMqFU826KWaztT4XrWsrkng4JU6n+KTDU=;
 b=yJunh4WYroOpQX8MomQ/7NwAZvSYU8YP49pLoLEKsuNXvaAjCrg3lVchIhH9I5P1KCXWwlWS/iGs2mFJdKgWdbpofvQQ0VaIBd+ub5FcEeNFmOiU+l0NJIIVSPuIJwewA51h5Xt1tVXE0KhY81k6haBUmLZtYZGC8EXBy1ACYh7vZF51UZIBOq6pheBnk4LI/wOAjLs1/vFZzI8J7ohycBR2KifDW46F4GmONdAy47pwo3iFWlwD8X+hrsJi+WwetdjlDR9Pa8FkKdijo6ievtf3gyY9l/TtIX2Zw9tNYDOWZXZ3dYrkSM1Qo1QA36q/qsuxtYGIB4J3OSmZYuqmFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GNZD3HaewzMqFU826KWaztT4XrWsrkng4JU6n+KTDU=;
 b=PbLIsB72ct8LFe+A2aetVjWnj8k+j0RywZZlyDH4PF3Uh7VXrr0+Iz5kiCWXZRE7xw7DoCgzsM8Uwg+zoLblUsjjoCh2sxf0/P3FDNKPzitZ9VTx/mk9IwGGIPklVfj7dS5aSixvJJ2yINtzejXLskbLNg+QrRx9GjsugIT9u70fdgnGzPDYm57HujFDP+N51uZUzqXb8Q6RpAkCxVxOJ4gUTNDHNT5a227LQFlr5m9x4TtkZIUMTRMKwuUvN45dG4WOLBagQCzupz5yuGWbBfJ4bEIL5iWd66Ekj/Ob9jO86MM+h116iBbOYxjQm6iGi6N6mY4vhUwri+JHuLwsPg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11189.eurprd04.prod.outlook.com (2603:10a6:150:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 18:09:31 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 18:09:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 10 Oct 2026 02:05:30 +0800
Subject: [PATCH v5 09/13] gpio: mxc: use cleanup guard for
 pm_runtime_get_noresume() balance
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-gpio-mxc-cleanup-v5-9-1e59e6ddfa00@nxp.com>
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
X-ClientProxiedBy: MA0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11189:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b22afd9-6567-4c25-dc73-08df2630779c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5lUZ91lisgSJPKcFF0TKfP4JLoHuQm6AnCetUcGzx7pLLM284TIv86K0sHq850/cAz+mAB8E+r7j+BGN+JPwRBaW0H1a2CKFeX2fAfIoJPvilQ4RkRJO5FQy4MCAS7W6EXFFja7F0QeUw8ZDgifRy71y3cnRe1pUHe7KDBs1aQrzTsd0VDjC/jjQn8XKYJAMEtCUfRbdvad7AQVuNaZtqkRRgtzuwI9YIerRdW11WTC7U3eytw9ukfza3ySbgD1o9RwIIg5LssmUi9fiLZ0DMYFqZFEAJ4NrAEDY0Re0VbqaDIJSh1LEGUM3Vtl9SSyja+/im/UC8lsBnzde+FYZ0/oXayFME6Iu49x15mUFE32TFPBRdu4LMI7wJCB854NB9KnHafFmjq17nAaYOPaA+yWlv292tfT6NfqmvXOioe8JBJwCsliLSQCFkYpIeblFHXXDdjH25B/2acLaWdBvsXiLLYM4WLplua7YmmmT2lQfCDaz8Qc2ZnLa9MQx/t6CcHse4N1lPrXYtlN+NzY0vElAcK8svn7Dw3digwS1UKgUoJkQV06gXs8xbObeaLHIyPn7j/4yihFymR1F0ETxoJY8rG8UILmoCbTlI26h5ILraaYogw52xFknyliekyfxSu2Wg2y3YZn2bJQE90wtpZR1PDTi64+EolfllGAillM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yi9VbnowQWJ5dlc3VXVtOEp3bzBVVU9CRjNTVzJtYmcyeVVOQVo5QXE0QTls?=
 =?utf-8?B?VHBnVGp0KzlkRWsweVAxRlJwa1pYMTFDTzJ6cFZlL1hVbzhtcFNmRkxRc3FN?=
 =?utf-8?B?WENxRXJzSGtRWnBUU2VJeFFrNlpqaEhlSzlQQ3UyR2YzWWNScDJ2N1p2SGRF?=
 =?utf-8?B?K1RCYUlCWEE4NWFxeXlUQUZ2L3UwUWxJTFp1LzBQWFZ1V3c1OVdCUWlqZXpn?=
 =?utf-8?B?U3piTlhuUTNkNzZtYStVMEdUUkpHeDFMNTBuQmVLVzQ0OVFETCs4REpwc0c2?=
 =?utf-8?B?c1RmUkFyeGl0UExqSTVrZVp3ZDdCQkVRSWR2Mkk1TDhLK3BkSUJSbk5COWZ2?=
 =?utf-8?B?eXRaR1A1L29JdmgzWVNMb1VsL2Y0ODRUTno0MTl4Q2orNTVsMytmaU9WcVZn?=
 =?utf-8?B?eG5NZURSOEZReDllWlFPT3RwRDdHR3pubW1XUGVkQWJoaWJzWnZrWWhJNzgy?=
 =?utf-8?B?LzhOdjFKT0tpNStwODU0TVBnbFJpVXRhTG1HaTlYcEdLWG0rL0Y1QnAyem1o?=
 =?utf-8?B?aUlNZ0Y0aDMzMExzSFoySG5wYy9wc3J6T0NlTGZRcENEU0Z1U3l0TllkbWdC?=
 =?utf-8?B?dVVFSC96NWlGRGFBWUx1bXhSbkU4N291MFVvNlBQa25Ha1dWbWl6TklaVFRP?=
 =?utf-8?B?NHJlQmI5RHVnUDlOZHMra1FmQ0phOHlmZUFrcDRSandIUmQ0ZUpqOFk4QXhx?=
 =?utf-8?B?L2ErUFVKSTFKYzU3bFRMR2QzeExDWXEwclZnTGV3akx2YU5yUlhhRlpKWSsw?=
 =?utf-8?B?Z2NBaDh5VXFCaitSTnNOZUQyeUlzQ2hScnh6YW9HREMrMDRMcisrTEMwMHpX?=
 =?utf-8?B?S0s3YWVLTkdzNjFaY2ZQZ1E4WENXTGtyTUFXcXZLUjhFTm9iTlpqQTl6Mlhp?=
 =?utf-8?B?ZWpMQk05UmhOcStqcitEc21mNHptb0YxRzA5ZEVYdGx0WXZjZ2xQNTBncjhy?=
 =?utf-8?B?MmdPa2ZTbW13Vk9pNnhOWDd5TEN0akpuTmN6T1I5ZDBFa0VIa3ZjVkd4MmpU?=
 =?utf-8?B?clMwV0dqTG9YN2NsWUtuZFM2VG4zR3kzZ1BHVXVXd2ZJTEFPdFdjZjdWZmIx?=
 =?utf-8?B?RGxiZUExZ1hoK0s5eWxOZ3JFNWwrTkNQa2xKWXFDTmhxK2tSL015L3FyODRt?=
 =?utf-8?B?eklhV3E2cWxCd2JTNTBEQlBCR3dhRmFxaFZtSms2MTJCdFVVUE1weS9LWHI2?=
 =?utf-8?B?cDR4VXRRVk9IRUhuNVN6Vk1RU21mMk5zUU5JbFR5WVl6ZDc2aVhQVEVXSG5P?=
 =?utf-8?B?Z2plbzNXVFg1dUVWenBOTlAyNnpoNVhHWndFNG5CaEcwcUxmbEtXSVFWbDJv?=
 =?utf-8?B?Q0o2cVF6bTh5cEMxR1RFc1h5QUZ2Vzh4ZnAwREZFMmZVZG1oRFVNNC9MM2J6?=
 =?utf-8?B?WVRzcHpPbUdCNmp2eFM0amRxcXNtQUtWOGU4a3I5bllMR1B3dDU2VzhLd0hF?=
 =?utf-8?B?d2tZUFcvSENUaHoyMkk4eTlhbXJtaGJKZUdCNGlxbGhWcDN3MVZRdTgvWStz?=
 =?utf-8?B?VisyK09Jb1JrQ0t4TGJRbmRRM0FzUVQ0T1dnV2lVNjFMQ2IxbmJMckJFOUZR?=
 =?utf-8?B?OWtrbE9Gb1lJV1huQmdKdzJkcE5kMDdYUUNaTzQ2eXo0RURXSVlzM3lncWxX?=
 =?utf-8?B?NjBvaFhHZG9BWi83dURuOVhwNVBkdVRObTF0RXN4M3lla1M5SFRtTHhGTXh5?=
 =?utf-8?B?WHZPQXZOdmdoZEE5VGlDUUlqN3ZEaUNLM1RGOVpmd2FacGNKazVkblBSdk5U?=
 =?utf-8?B?T3hwQzVsOEpDMmlocTVteHl6MGdycDVhTGNLR2ptdTRxRURsKzJiaXpwVEY0?=
 =?utf-8?B?blhJbkF5dUlyVTJBdnJSd0JnZUd4NGNQSmxZRU5BdHBqa1hKb0tqVGY1aDI4?=
 =?utf-8?B?SHpYbWFHSi9aVlZtZ0xuemdpT1ZMbys2cld4ZUlOb1liZ2tXTTNMVi93WXhS?=
 =?utf-8?B?M0h0NkJOSXhkbWJjNVhpUVd4cThDSElSeE1VcVZsa3I3VUhVWXJpK0RhQnEy?=
 =?utf-8?B?K1lrQlFVRkF6MElDS3Y4cmpub1hwNlhkdHppRU1aT2hVWWxQUm44UGtXSUJz?=
 =?utf-8?B?VmE1N1NhMEVPSklTN2x0U011OUZ0UGxCMWxVd2RGUkVKZVUwUnZUc1ZFVHF1?=
 =?utf-8?B?TzVzcEpFbXlzQ1lWbTR5WUFkNXRqTjlQVFNmZk9Ia2pFK2U2WDVYb3psWWJs?=
 =?utf-8?B?R0h2VDZtQWhkSzhVK25qaWcrL3lab2J2Y2lkWjV5N1pEQXE2dU5ITThrK0hE?=
 =?utf-8?B?bFpvRnZlWXFodmM4ZXNjcEJqVDJ1L2V6V0h4VmxqVDdlYnhsS3hjVjMvS3h6?=
 =?utf-8?B?b1k0TjdlQWxReVNRbE1INzlTQ21CLzJRSFhYbm5TaS9mdDF6Z09qNklmK1FL?=
 =?utf-8?Q?L1dOIYV9XSYsJROY5RGzuFhEo1+cuFO6VgFuI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b22afd9-6567-4c25-dc73-08df2630779c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 18:09:31.8042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9Nob9h9R2LE0perQuSFgfEzHpvB8rJGrJyJ1z/NtlFGuYvIhtzEVBp/yDVO3IZTjF4CVxKOF8QvLVCAP/orMUyReiel8RPghh5bsi20mp4QjDEbOWzuxdZPjGMh+2Dc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11189

From: Peng Fan <peng.fan@nxp.com>

pm_runtime_get_noresume() in probe must be balanced by
pm_runtime_put_noidle() on error paths, or pm_runtime_put_autosuspend()
on success. devm_pm_runtime_get_noresume() cannot be used here because
its devres action (pm_runtime_put_noidle()) would fire on unbind in
addition to the success-path pm_runtime_put_autosuspend(), causing a
usage counter underflow.

Use a __free guard to automatically call pm_runtime_put_noidle() on
error paths, and disarm it with no_free_ptr() before the success-path
pm_runtime_put_autosuspend().

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 5ae9cdee6424..3d5a6566d3f4 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -445,6 +445,8 @@ static void mxc_update_irq_chained_handler(struct mxc_gpio_port *port, bool enab
 	}
 }
 
+DEFINE_FREE(pm_runtime_put_noidle, struct device *, if (_T) pm_runtime_put_noidle(_T))
+
 static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config = { };
@@ -486,6 +488,9 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(port->clk);
 
 	pm_runtime_get_noresume(dev);
+
+	struct device *pm_guard __free(pm_runtime_put_noidle) = dev;
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
@@ -556,6 +561,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	mxc_update_irq_chained_handler(port, true);
 
 	platform_set_drvdata(pdev, port);
+
+	pm_guard = no_free_ptr(pm_guard);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -564,7 +571,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	irq_domain_remove(port->domain);
 out_bgio:
 	pm_runtime_disable(dev);
-	pm_runtime_put_noidle(dev);
 	dev_info(dev, "%s failed with errno %d\n", __func__, err);
 	return err;
 }

-- 
2.51.0

