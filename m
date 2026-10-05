Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589C44A3F26;
	Mon,  5 Oct 2026 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210312; cv=fail; b=nawn4SVJgnIw9GNS8rM/zfMMslUtXgXIFteSp48t/NXD599tIY3Phc5fu/XAeaAaF9BFYYnj+s9sYZB79WidrI8QXlgfE4QZ8E6q6qm1A4I5bwe8VxGKiUvNaaxA+GU/FfwhzaQkx9DHwipuHz6yHbA7KiF5oNVo0lvHQc12OlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210312; c=relaxed/simple;
	bh=uYAtoyDVgXRQq231Qewbbz3aTdmnsXS4UBQksr6Ao9M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nsRc3rNoK4p6ifBX6pWitpJq0eLESRnO9UnJHhUPeLzaKOG7UfcvyVl78UZlqWOzuAUhw2Mp+jT7UnLdFmo3mrQhNyWdLt71WbEO1R5pLIScFqx7+7LjQTyF6IkZknZVBfcp88TihAiL51yFJHwYCMrBH3d+MDC6IfcqYLqcnrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e1FzgHlR; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e1FzgHlR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xcj87EdqTSsmgYC1gpLuiWJkRSHHqetSqpdfi5F//ZnwsqlFOy46yUb5eUKXdMzlzV6Lm2brriqWrYCjm9VWnPwlmJd9jp+8wlre3iPQDwJgn+bVg12ZYUBIDpbq36K1fWfTrCLoRRX6a0MCiASE4fdtmC0ZdT730BKBBvLk/MSn/bfMBkUqjU2v93AKylBL8Pl48HbUSlgJ4bRLE5bQEkqvirDW5CQ8Sl3cNoNEUVYecxqCHpnY+Pmo0jXvIntw5Dh9iCwtZ3KVQRA864Xn78G4/kOnt91rXBh7bfGdLAxoNop8BImteS4+O4KluJhLCb3oyNwoVjJWzC2U5TMcvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDg5ErGxHa82uz9/AKhvcNnfve3FPgrcJQRurW6pt58=;
 b=Ky6hK++dZO49MY4MYaMqGQhY87EP2K6oyGTv/Dj3er8peAnw/uiWoso15sXnj7LYndlbO5G+aa7qBe68nmOzgGM5jVPYmxthZhtqakoLY59bjqoJja6cppnHZOjiYY99v1Kcx/8ZaxFPn6peyfUHC+NpDTPMr/Fhq+JnW6Q58YgBVgvjDlEBBuBITTuQezQcqH5v4EDGoqXqhceSk2mrzK44QmZ35fI6GK+/yYW/XGeSXqpODZ6Zi/Rigr6AhgBq+1Dh4A+PIPgiscYw48ENb8cruhHF0CcAqcl4HUzEwQHkswJ7N4OVEAq54ppW+Fa4LuGs3i6vHvsDOqbqFj+EmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDg5ErGxHa82uz9/AKhvcNnfve3FPgrcJQRurW6pt58=;
 b=e1FzgHlRGuKQAOrYwPFpjeJGSff+6QyXqVii4nmK+DSNTuqZeqL4p6sCQlh+FWxJ6KMdtXd//Oo6zix1RmKcXyfRZg0boz2AvqJWDY32k9XeRiIV7QlmdLJzVGTcigTdIvNdDavHVObknd31CrwLpDlaM59UYOGeVpiMQq5teCEnqNuZcULs3jTKZVY4peDLqbCKcLu9+hVGgv4krg9p6VqtOdrJELg4zI+nulLv7JYXYqymj63vohsOnQBu8xEkP4B2ecVQKeUlthjetod9oKHHcph+MW8FySkzGIu2zg4GcGDddV5PFlMoSnLcTsFaExNYqHCMDW5NmHQjshfuzQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9198.eurprd04.prod.outlook.com (2603:10a6:150:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 14:24:48 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 14:24:47 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 05 Oct 2026 22:21:28 +0800
Subject: [PATCH v2 7/9] gpio: mxc: use local dev variable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-gpio-mxc-cleanup-v2-7-bdc3afbb35e2@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: ece9f8e0-a480-4bcd-edaa-08df22ec685d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rtMkEVidDg8S/RRQDOJzPmOa0Y5CbO/d7CDsXQMDd5llEiFl+rC+Q1C+jjs23mXpY6kSSzsae/MPoMFgrlSo/zucpCYfpqWFV1JhACV1o+jlxPXxTdoiv0DaMZD1tMrga4TEbeh7a2lAdUR7KuO9Y7bAMvTPPQmwsHl68GjsotIo2/qqmptv4OYJoEEfRSCTZXj7FnlkProB25Jtl4btcicYYf2GgKBz4Qyuuk61rGx9HJBuWlAz9R+eQ9iAbgUdYpV5NNcqpFblhSEowcupeTJQJcCotGg5OcH0+E3vzahxa1oXXjdWLN+1jxUwRVn3Z9zPz/vniQ59EG6VEseMNDKqxXUaElehfxNPw78OL+y8wI+iWHDDti0fLins2WP89igqnv9Dm6LL9/drN7NvPxbHwr/ikTpTp5+rfcfVstV9aqbHVefj3SDYIfyUVzF2CvnVyvjDpx2GEBprc9e25Fhp8vOjb1ygka8hE63JKL4tGiye0KJOoimQHjqel6UhX6MhN1DoeNHjtJ2Fg/9a7nAVEYWZ44MPyJuyK4jGz3Otf1LFBczUwUWjwa8ZPMfZAN5CHA4ckjHBu2zeseaMwqQKWaEE+l65OxpPcpE6enIINPFhqqRqW0igqk9+jjP5UpDIKsjU0+EF3nuKGADTD48/KQVY5FKmDxtKC6jxwYs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFlrUXJPdW9YNXpieCtSOWdyQTNtYlROY3c1QTJSZ3pGMlp4c2oxNHBMc2Ru?=
 =?utf-8?B?ZHZMZ0ZHMFdtcDNhT3dVQ0hKWXpFTHQ0Q3Z6NDJsNnU0MFFEb1cvWk5QSS9S?=
 =?utf-8?B?TXpRNzhGUktMVTRjZzdydGpoWVI2QTkxRWpVU0dEM09kZVloL3VCT2l2ZTZr?=
 =?utf-8?B?czBSa09CWHFxcysvRm9iMmJZM2E0ajFENzRkRXVHdU8yYkVjekpra3g2QTNY?=
 =?utf-8?B?T2RGamJSSmc1bGpZVzR3ZjRKbkQzenBJOGI3Rktqb2VhMmhoL0M2RjU2YitQ?=
 =?utf-8?B?WWoyYXdiU3h2cEJzQVZ5RlJmcFV2K1N4dW83dkpWSlZaTnhvaWJGZUNjL2Ex?=
 =?utf-8?B?S0lybGg4ZUlUcDBxYnpKSDRyaEg5L3RmOHJJYmxSczRnd0RGODdzcFFkMEdl?=
 =?utf-8?B?a3EzNjRCUXN6aHNxMVZiVUI1U0ZaU044aHFBV0o2RG1Od3Q3NUJBTDRPVFla?=
 =?utf-8?B?aHFKSkE4a0VaNTVBaTJ1T2pBZi8xOGVvYU12ZDVrMWE1NGpNT1RaUVJsb3dz?=
 =?utf-8?B?V0dxUmFNVzI0Sk5OaUFvVjF0UjhMMmpnMGwzUW9NVUo2ZE5uck1pQ0JuT3F2?=
 =?utf-8?B?bXppQnM1YlkrT29ZeDZTMnRobFZ6cHVWY1NhaVNqTzBaSG1LZHNGcUdIbTNH?=
 =?utf-8?B?VjFhQjRiVE5QbnRyMENKVUl6aE0yeDdmS3Y2YW5wL2dYbnNlcjhhR0VyTEFn?=
 =?utf-8?B?Um9SeWVyN2ovVHVZMktEUXJ4R2Y1Z3F0NzdJUHpYckpSb211L1lUOEJXcFp6?=
 =?utf-8?B?VjNmUzZGUStRR0JPMjgzQlhyVStpS05MMGVXc2grdjhTYzR3NlpNd2UxRXBn?=
 =?utf-8?B?NlFNSjdUL1ZXYlJDd2xxdkVBTTZRZFp3VVRnazFVcDFia3dKWGFNZDVwVUdr?=
 =?utf-8?B?UWgxamdZeG5hS0VMNzViNTFvdmdFR2hMRzdxZUhGZkdVYm1NTFo3R3ZlRFd5?=
 =?utf-8?B?SjFYNnc4V1lMTXRLY0NSTGI4bENnN09rQ0FveSswbXFpOWZNQjE3akJKMk0w?=
 =?utf-8?B?K1c2NkhrWnlJb2pBOXozeEZYOTYzTDZFMjFkUVQwclVBeU5CQVltNDdpemdx?=
 =?utf-8?B?TmhTVC83dVBHcmQvTmRtNEhLTmZRVlhobU9OUS9WMDN4QjlCTnMwYk1SYm5H?=
 =?utf-8?B?Mm9HVVd2bkludWpnZU1YNjVIWEJTYUVpM1pkTkV4eTR5WTFPV1dLL3VsVWM1?=
 =?utf-8?B?eFF3a2FGQ3JHSWhQbUhLL3A5ZmNNYkdmSDgrR1U0ZTgxOWdzTVhBS1dhWk9I?=
 =?utf-8?B?ZHpIUk82UnpXM3R4K0tJaDkyamZUbXd1MThpaFRNb1c0dFlQUDNrd0ZzZGRw?=
 =?utf-8?B?a3FWMGdhdU9oRU9CNXFZRTEvczB4Ry9KaHpiTmxRbVFwMVpmbWdwdlU3ai94?=
 =?utf-8?B?WkZLdnd3TFF4TzFPK2pSbXNkUTBEZ0VGbElocDc2TzdCc3JHTzhmZ3RFdG5D?=
 =?utf-8?B?VDdsOS8rQVRoakNVL09PbFVxbEpibnorU1F6VmpQNjI5SmNja1dHUG9zMGR3?=
 =?utf-8?B?L09BT2RTdFFZb3M4K3QydGwvUnVhUERXNm1GRVpuUjlNQXJBalpGU2JaR1I2?=
 =?utf-8?B?M0ZFWWxrNzlTR3FvTk1TMndpdldFRzFEZktyUDV6VHdkR0htK0RuY3BCS1dz?=
 =?utf-8?B?dVdvOTJhek9OY2thVWlXMWJUdzdaVUNjSkNVaDNOeC93V2tOdFI5UHhISFBY?=
 =?utf-8?B?L2J6ejhrV3d1L3ZFTDFOOU44TEF4bzFtUU9vRVY1MlJ0UDZIM3dlM0dDSUpD?=
 =?utf-8?B?NzdpWVhLa3FrdElmTDNHOUVETU9PazJydjZuNWIxb1VycWR3eklMM2M0VlVZ?=
 =?utf-8?B?ZElWRTR6S0lkYTBVdVlRaisrZFprSHZLaGhyM044Q2R1VU0yWXVoYzlWVGxu?=
 =?utf-8?B?YnZFRENTdDh3Z3NtcFBzU3FKY0w2OVcwdUxvUzFIWmdIMGs5YXFDOXVXaERI?=
 =?utf-8?B?djJZQnNwYXEyczh0SFhiYm1vVm1idm9FOGhCTTdITWhuWnJkcDJFSUdtUTJx?=
 =?utf-8?B?OWl4ZHBJUzZ4eGhnWFNvYlhXMlFBcVRFMXZzSTRXZXA2SzZvSUpqaW5jeWZ6?=
 =?utf-8?B?WXRGTS93cUo0L2dTWnRCNytKeEFpcHp1ZTdZOVRZeEs1S0liaG5TU21ScFJ5?=
 =?utf-8?B?dXZTNm13M2lzTzdhc2crVXZEd0N5SUY4VUREcmZSVC9PWDBscVdaanoyWkY1?=
 =?utf-8?B?TEtHZndyTkwxcjBWR0lSVTZDOXJBZ1I4MlNPOWhCYUJkMmU5Zm5lY2NWRHNQ?=
 =?utf-8?B?MDVKWGI2S3lZbWFHR2llM3N3YlpEOHVhN0lBanJjUmREbEZ4RzU0Q3paZGVn?=
 =?utf-8?B?M2Nsb0FhdXRvREFidlc2Q2NQcmNlMjhKM1JJMjZncENzWU8rY0x1aDBFQ1NH?=
 =?utf-8?Q?0m3KsINQ7QtrWraM6vJ8DvPz0pV7iIZaZNvVb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ece9f8e0-a480-4bcd-edaa-08df22ec685d
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 14:24:47.1396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/3VbxaHFZbDfv/4+9yDYB+YqjBQGduyGZ14YAu9EbLMpuo4BoSSS2uHo+PHYI/LFSuPPEQbpv9G1OvP/8Odm06BxHGLy8tsStXZyWIlsNx4LX6ewgnzy/8mvRccVRYA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9198

From: Peng Fan <peng.fan@nxp.com>

Introduce a local 'struct device *dev' variable to replace repeated
'&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
readability.

Switch from of_device_is_compatible(np, ...) to the device-model
device_is_compatible(dev, ...) API which works with both DT and ACPI
firmware backends. The 'np' variable is retained solely for
of_alias_get_id() which has no device-model equivalent.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 47 ++++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index c92331f192f9..d762d03c8d6a 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -24,7 +24,7 @@
 #include <linux/syscore_ops.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/generic.h>
-#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/bug.h>
 
 #define IMX_SCU_WAKEUP_OFF		0
@@ -450,18 +450,19 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
 	struct irq_domain_info d_info;
 	struct mxc_gpio_port *port;
 	int irq_count;
 	int irq_base;
 	int err;
 
-	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
+	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 	if (!port)
 		return -ENOMEM;
 
-	port->dev = &pdev->dev;
-	port->hwdata = device_get_match_data(&pdev->dev);
+	port->dev = dev;
+	port->hwdata = device_get_match_data(dev);
 
 	port->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(port->base))
@@ -482,22 +483,22 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		return port->irq;
 
 	/* the controller clock is optional */
-	port->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
+	port->clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(port->clk))
 		return PTR_ERR(port->clk);
 
-	pm_runtime_get_noresume(&pdev->dev);
-	err = devm_pm_runtime_set_active_enabled(&pdev->dev);
+	pm_runtime_get_noresume(dev);
+	err = devm_pm_runtime_set_active_enabled(dev);
 	if (err) {
-		pm_runtime_put_noidle(&pdev->dev);
-		return dev_err_probe(&pdev->dev, err, "Failed to enable PM runtime\n");
+		pm_runtime_put_noidle(dev);
+		return dev_err_probe(dev, err, "Failed to enable PM runtime\n");
 	}
 
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
 	writel(~0, port->base + GPIO_ISR);
 
-	if (of_device_is_compatible(np, "fsl,imx21-gpio")) {
+	if (device_is_compatible(dev, "fsl,imx21-gpio")) {
 		/*
 		 * Setup one handler for all GPIO interrupts. Actually setting
 		 * the handler is needed only once, but doing it for every port
@@ -508,7 +509,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	} else
 		port->mx_irq_handler = mx3_gpio_irq_handler;
 
-	config.dev = &pdev->dev;
+	config.dev = dev;
 	config.sz = 4;
 	config.dat = port->base + GPIO_PSR;
 	config.set = port->base + GPIO_DR;
@@ -517,7 +518,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
-		return dev_err_probe(&pdev->dev, err, "Failed to init gpio chip\n");
+		return dev_err_probe(dev, err, "Failed to init gpio chip\n");
 
 	port->gen_gc.gc.request = mxc_gpio_request;
 	port->gen_gc.gc.free = mxc_gpio_free;
@@ -531,41 +532,41 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	else /* silence boot time warning */
 		port->gen_gc.gc.base = -1;
 
-	err = devm_gpiochip_add_data(&pdev->dev, &port->gen_gc.gc, port);
+	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
 	if (err)
-		return dev_err_probe(&pdev->dev, err, "Failed to add gpiochip data\n");
+		return dev_err_probe(dev, err, "Failed to add gpiochip data\n");
 
-	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
+	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
 	if (irq_base < 0)
-		return dev_err_probe(&pdev->dev, irq_base, "Failed to alloc irq desc\n");
+		return dev_err_probe(dev, irq_base, "Failed to alloc irq desc\n");
 
 	d_info = (struct irq_domain_info) {
-		.fwnode		= dev_fwnode(&pdev->dev),
+		.fwnode		= dev_fwnode(dev),
 		.size		= 32,
 		.hwirq_max	= 32,
 		.virq_base	= irq_base,
 		.ops		= &irq_domain_simple_ops,
-		.dev		= &pdev->dev,
+		.dev		= dev,
 	};
 
-	port->domain = devm_irq_domain_instantiate(&pdev->dev, &d_info);
+	port->domain = devm_irq_domain_instantiate(dev, &d_info);
 	if (IS_ERR(port->domain))
-		return dev_err_probe(&pdev->dev, PTR_ERR(port->domain),
+		return dev_err_probe(dev, PTR_ERR(port->domain),
 				     "Failed to create irq domain\n");
 
-	irq_domain_set_pm_device(port->domain, &pdev->dev);
+	irq_domain_set_pm_device(port->domain, dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
-		return dev_err_probe(&pdev->dev, err, "Failed to init generic irq chip\n");
+		return dev_err_probe(dev, err, "Failed to init generic irq chip\n");
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
 	mxc_update_irq_chained_handler(port, true);
 
 	platform_set_drvdata(pdev, port);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 }

-- 
2.51.0

