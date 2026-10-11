Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B488439F80;
	Sun, 11 Oct 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719742; cv=fail; b=S/THv4gnQPJ+iGADsYtj+iUlSvTq4oJivtRxP8BRFBsRqRmoF8eqAUkH+6hcfKNvIyZDwuhMMl+pT+nK8NJKkShknV3tZDk6fzaWPchD/N2fWT4CqkD9VCO0QTur/xreOxPAZy0x/Stk05vIFOgDKXFjDEsL1vpKSAXmWPEcNNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719742; c=relaxed/simple;
	bh=w2OL21adA06pAggOQfJLnbJTvksz/lzK92e0H2r6aH8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dpisJVYboSTOwaFS1PQj1e3rdgXioqwJN3TNpcRNlBSOxM4flN3UVSy4nVemlJiuVS+/Tww0DbXnTaHvifnYYDmRTmSCioX/QgTviEOSYkRp5bWxvzikWKGH6wm8U0pELddW50yKHQYplIaP4gojjfPTK2LOAGD4ZGtQucFOpxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hf3hjOR/; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hf3hjOR/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZyblIZesSJLoKHsGxylopLpt0L9Z45e1zoNtTJgH/QEF4N1XS5NvkHAFMLbTXNqCDGTEHeguHdnnpB2BKI42zGC6/T+pyhQJwRcRF0wBu5KiPgSw0CO5Z4VAzjNCzGrbS/L5pTGwm8U/SejGq6FfT3itVoJ4uZSO9CYJZVeScC8rW0LpYPS2j0Bnxw06LMFzQN5mkN5wXR4DmOSXd7i1Oqau/j/yb16a8UqOF1/sggvcztMN3nMysBbFhS4MbYWjjujjQTqi58/Eo5+bzSHFmEopr+NFfKqS8NahHX+CFZApU7D5JQROOALER8VtfisbeakgrbXvWj+KKn3uWN2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgxyNbTIMoVWlcHRt7qzl99KtbEp6jqTEtoSQLEwD3g=;
 b=K9gHlAM986mRSW8xIbGg/LavbnzamAsjB7KNt6goUYsKfsBHetPto4VX/FEcwuO2f+eTc/zz9Gslno862y9yRent1Fpz6/6Cye4qZQC+iFMx/eIB35h3lfSrFl8TJPWKJlbZeW+fX7lBCyy16II+smTD4iveplJ9PREnxWJEbZWTsP4OC/Hoqu+3c09xFC7W1D5G01TsDHhfrMVsILtvcPpSoaXjTCZU85n57VkVw33uqU7NB7VWey6c+nHWjI+bZhwdWf32QyrHluKU1jYm2oBqMokrwWlvEeuoM2dZdBbdQQD84NuhMvIU+OZibPXH0fYmf0Ct8vGlxZfAwKUIrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgxyNbTIMoVWlcHRt7qzl99KtbEp6jqTEtoSQLEwD3g=;
 b=hf3hjOR/QFIOuDK1Pu40cEiRP5KYOTcz5VLUmAlwOmR0DJ5ew1FdmVzrRXjxDM1vRHuJiCkR4/2cvrx/OKC8Mjuh9aZMc/ITdBBZARInEdUHEbARnwGWccYEbzCTyxdGdXBlQ2RE7LM4H1evBV/qTs1KerBx9ZFzUQ+9362n4se5gFPRUBPF6vlklEhOepWB4VFn/qUO1r/dZMpLwzrF1Xcug+vgssioE5aqWytQNtR2lgLj6ZGf6NJH4P1fycBO3SdsutBLJC1SZn9ATmTBYUBmN5kR6Kq9IvFzhcd5y9WJTb9EYTSINcytee+8gUokzjb4m0RPcl96ByPquLpkzg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:54:54 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:54:54 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Oct 2026 19:51:31 +0800
Subject: [PATCH v6 10/13] gpio: mxc: use devres functions simplify probe
 code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-gpio-mxc-cleanup-v6-10-cb47ce2ad758@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: 301bb7bd-c6ee-49b5-2456-08df278e76a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|261009223027099003|261009221227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	pFkT6OmAZScaddJh6glsTFqwVyMaRKoTGs90FE2KkdiSNkIN34EctPCOOw2vwR6qENOGgT93w7bRIQjxmYFRQcOFKNm5XIbMJLo8//t7K9fK0N9vBFX0YsbsxVVOtToz0/HDfuVPsNG1XjLiJ7vB2iDuskkYGGbKRuphMlBfpgdF6QL1O+Jnnlay9Ez0hxBeUaaF1heARMC6YDOJlN3msXi4m1anLldTp5BTsp74T9xfP5QvfkAPGNvfqAWmP+u/aMTqIrmviY4KlOwDnB91+3C950BPr22Ig/1Lhr42oIQ6kuJQRYkFprGLgpwk1H8Sywz6ePTqmN8QZucDkNzOeAFBFo8MVpPprP/rIj+7F8QggPmpo4XYRKCI3BUmLUApWMqf4f9pOtaSU7HQ4LJLJjM1B475xp7QUEOVB9ZMPWlLy+Hi5NcOQj3MD7LirblPyUyfMYOhh50Q6zEm7xyg/MR7ExIfCUY8tby7lFPEmeD351NxBPD+cVT+IEGBxR+MEfuCBZ/gKZYKd2qnbXF/TBWlCX2dxnLL/0K9l8USq4keya/md3CYll9Wol9hjOSXk75EE2HhER82sV3IDJDrKz1CDenG7jvkU5BlTEG0cVCR4nfLX4TTUngz59BEsyE2RbX6P1QcAGyi8EgeGMbENY/l99TjxMflPTobyEHmoe8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(261009221227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEoyQkJ1STBxTUtVZnNleXVYZUEyOTA3UE1JSGhrVG1vNkJhQ05Hc0VVbnN4?=
 =?utf-8?B?bkplYVlXaHZ3aDhyeTIwSEhnZnUxSWRPSmV2d1FjY2xsbUsvT2kvT2d4bFhJ?=
 =?utf-8?B?dHVsM3ZXeTNUSG5MZFkzZ1lwT3lKQjVCK0RZS0VhWHFkeWRicmRLbDBWTk8z?=
 =?utf-8?B?dVAvdktORVVQYVdkVW9zenhCeDRTeEQrbGE5Sm0xa25pM1pONC9CRUtwR3pi?=
 =?utf-8?B?L1lxZnVXNUxzZjZMV3daN2h2SmNIOTNscEg4RnFkaTJSODVtdW1TZWxoR096?=
 =?utf-8?B?RFJPTWtWeG4xa2JscGNCSVNQK0pKcFJpTzhpd1ZFQVZ2U2lmdHRybjQrTTI3?=
 =?utf-8?B?VnoyRUZXYUx3dEsydklTaGVLNnh5WWxTYmhDZ1R4aFU5b0JjS2VtVTVDTitt?=
 =?utf-8?B?YXNpd010WE1iMDFrY0U4VGZMMnhTejJWdHZETzFKKzVhN212OFNkSmZNU1N2?=
 =?utf-8?B?SzhCbytIaG1WV1I1MTc3ZGdWYXU0ejFadXl6eXF2QWxPaTlQWlowUUlyWi90?=
 =?utf-8?B?RTd0eHVPLzlocml6dmlkZnprQlFRWEYzTTlUd0FDeDBNOWNVNDdPeFR2V1JT?=
 =?utf-8?B?TUYzZEUzQWlpN1lxenUwMlM5bjg5bkRhQ3R0Ym0zejVSVm4wamlKV3VxeXhF?=
 =?utf-8?B?SUxCYis0b25CTEZTS3g2ZjVXQXhoS05Ud2toR2ZHUURpelE3UmxJY0JxQWpu?=
 =?utf-8?B?azFWTGp3RTE5S0VJYUxzNm5QN3NVT1kyUWluL1JZT0FYZlcyR1BsK3MzMUY5?=
 =?utf-8?B?TG9HOENwV3VZUkd0TnBXQzNwWFFPZnlHai9leVcyemhtK0dWYmhnYkpOMmx4?=
 =?utf-8?B?cndVNDF2b00yaWNmUk5pVytlYnlXTnRNQlZMcFdMUkJjSzVjaG1PRFhPbVd4?=
 =?utf-8?B?eTQ2MFo5dGEyMVVnVzg3KzRBZUdabC9rMjhyVHhzNFBueENWOCtCVDcyV0to?=
 =?utf-8?B?L0lBMEtHQnVDWEZGRXJtOWs2SmVLb3dIV0VoQlZXY3RHeU5JNnBDSEs2ZCtt?=
 =?utf-8?B?Z1p6K2JUWkJmZUNXdU9MR09KYjIzYnNqMHhsRVZvR1YzWDJGaVVWaFhzb1ZH?=
 =?utf-8?B?UzNWU0ZQOHhrN2FJQklUUWdBUHplSzVQb2lOSEl0ajY2UDY1WVF5STV6eTAz?=
 =?utf-8?B?dWhBRzJrMXI1c1lJWG5vdmlMRTRLRWJ1Y1ViclExVEhYaFNtaTJMc3VqUTMr?=
 =?utf-8?B?UUsranRER3A5T1c0ODRTZmxIUjdWYlYvVmRDTDlkNFQxNUhsVVFLYk5hL2Nu?=
 =?utf-8?B?TlBmMUhuYnNCNGxVWHRWN3ZrUi90NjVjbFh0akJxZXhrODR0dDVCKzlkUUtW?=
 =?utf-8?B?OS9VUjNlTkFzN1JaTWlpNnNuMmlrNTMrYWtYdFJ2NkdoemFHMFN5am1RS1Jq?=
 =?utf-8?B?eGpRVUJwbzhvREd1OWU0c0xEN05xRm1Yak10SEdBRml4MW1IM2U4SzJWUTl4?=
 =?utf-8?B?czhvTnF3TkZGT2FZYnhtRVRJaHpYYmJ2ZHYvN2JxS2VEc2xhUmc1eEdOSDc4?=
 =?utf-8?B?V0RrR3hlQ3RtQ2RnZVUyMHF3TFdCVmdHM3ZyM0I1elp0VFpGeXNJanl2OUNR?=
 =?utf-8?B?M043YUFOeGRWOVpMM2pibmRKSld2dXpmMlFSQ2Q3eDFqY3ppVkxQMUJpKzlK?=
 =?utf-8?B?dm1yd3N3OTdrc09zT3lJNWpaRks5Si9uczMveU9UNUhkK2ZIWnRpTE1DUHBk?=
 =?utf-8?B?Y1VldGFIcVdPN3RqWVF4enhkM3NxM0k4Q3R2MzV1Q2U3R29lRW5mTUVtNkZj?=
 =?utf-8?B?L1QrcHo2SDRPSGtVNFU2STk0VW1lMFJuT0h5SDBjd2ZLS3lKd1lxRG50V3po?=
 =?utf-8?B?WG4vSEV6ems3V3FtODRMcVZ6TWVmbWtHeFNuOHk5L2lMemtmVGk3TGtFcG5D?=
 =?utf-8?B?WUQ1ZUkyWHBZVHNSNzNBbWI2Zjc2SEJkUzNJYmJGRXowRGpCUXJ1S2FyN3dj?=
 =?utf-8?B?b0U1cWdISmhxUVRNUWFtOFZxcW52S2hTOGtkTk5jZWNDMSs2LzAyWFBNOW4x?=
 =?utf-8?B?TmxhYXFnQUZLemc0RVlYeWdSVm5wL1JCbm1NRzVFL2VFTUpYajJ0Y3k2VWth?=
 =?utf-8?B?L21HQ3I0ckVyc1J2cUdHMFVFWmk0NTExbVVhTHBObnRGRmgxdHRqc2xPZis4?=
 =?utf-8?B?VHlUQ01UTW5vaGJRaXZRMDN1S1VreTVDdG9Jb0ltRDNvb2RneGJRVGJJRTlQ?=
 =?utf-8?B?MGlFQ2dpRitxczhqYXRON3QybGRmeW5laFBYSTZlUzliVzMzMUtWWHRQQ2s3?=
 =?utf-8?B?cFR5ZngrcFJMeTJJcE9NcnFUcmdEQlhTcGdpKzJ0RldRK3U0TFRwL3FMM3NP?=
 =?utf-8?B?SW5VR0NSK0xFTXFHL3Z5Z2VEajFQUTVhajFaQVdXTjlIZTdNcTMzUXM1YkJh?=
 =?utf-8?Q?LZ3B57w+GwDqOt/XkRnoc6bgpdGJZjqwK0zSX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301bb7bd-c6ee-49b5-2456-08df278e76a4
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:54:54.1959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZSBtPEbKxwt3+SRB/9m2mLoD8eT6Gj04Q7pViCKta2yehIKB0OnLIOcJnEB0dbc7Gz1HqdF7a3qKAjL5/iOYTvcUoEctPTC4PKZ4OyEQPB79gfUqvC8yLDA/7WSe4XP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

From: Peng Fan <peng.fan@nxp.com>

Replace irq_domain_create_legacy() with devm_irq_domain_instantiate()
and the open-coded pm_runtime_set_active() + pm_runtime_enable() pair
with devm_pm_runtime_set_active_enabled(), converting the remaining
manually-unwound resources in probe to devres management.

With every allocation after the PM block now devm-managed, the
out_irqdomain_remove and out_bgio error-path labels are eliminated
entirely - probe errors simply return directly.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 8dcfd05e658a..09acb186c84c 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -452,6 +452,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	struct gpio_generic_chip_config config = { };
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
+	struct irq_domain_info d_info;
 	struct mxc_gpio_port *port;
 	int irq_count;
 	int irq_base;
@@ -491,8 +492,9 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	struct device *pm_guard __free(pm_runtime_put_noidle) = dev;
 
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+	err = devm_pm_runtime_set_active_enabled(dev);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to enable PM runtime\n");
 
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
@@ -518,7 +520,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = gpio_generic_chip_init(&port->gen_gc, &config);
 	if (err)
-		goto out_bgio;
+		return err;
 
 	port->gen_gc.gc.request = mxc_gpio_request;
 	port->gen_gc.gc.free = mxc_gpio_free;
@@ -534,27 +536,31 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 	err = devm_gpiochip_add_data(dev, &port->gen_gc.gc, port);
 	if (err)
-		goto out_bgio;
+		return err;
 
 	irq_base = devm_irq_alloc_descs(dev, -1, 0, 32, numa_node_id());
-	if (irq_base < 0) {
-		err = irq_base;
-		goto out_bgio;
-	}
+	if (irq_base < 0)
+		return irq_base;
+
+	d_info = (struct irq_domain_info) {
+		.fwnode		= dev_fwnode(dev),
+		.size		= 32,
+		.hwirq_max	= 32,
+		.virq_base	= irq_base,
+		.ops		= &irq_domain_simple_ops,
+		.dev		= dev,
+	};
 
-	port->domain = irq_domain_create_legacy(dev_fwnode(dev), 32, irq_base, 0,
-						&irq_domain_simple_ops, NULL);
-	if (!port->domain) {
-		err = -ENODEV;
-		goto out_bgio;
-	}
+	port->domain = devm_irq_domain_instantiate(dev, &d_info);
+	if (IS_ERR(port->domain))
+		return PTR_ERR(port->domain);
 
 	irq_domain_set_pm_device(port->domain, dev);
 
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
-		goto out_irqdomain_remove;
+		return err;
 
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
@@ -566,13 +572,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
-
-out_irqdomain_remove:
-	irq_domain_remove(port->domain);
-out_bgio:
-	pm_runtime_disable(dev);
-	dev_info(dev, "%s failed with errno %d\n", __func__, err);
-	return err;
 }
 
 static void mxc_gpio_save_regs(struct mxc_gpio_port *port)

-- 
2.51.0

