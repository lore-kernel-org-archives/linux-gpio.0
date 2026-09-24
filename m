Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2F81FC0;
	Thu, 24 Sep 2026 08:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239070; cv=fail; b=tdoF/mdfSKY62ojZ6qPTUaT0Q2xLrWuhhgyzaz5JZauyV8I9xas7dQ8PL9ZBWUXajFA0BRNeKuNQV+pqy5B2qoZh+EtO4G/of0LN5ZvJue1GL/Zef5brVzc2dk+ELNumL53piCY4TV1mvCODnUiCffAmH9gQM95/yMV4sYj/cb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239070; c=relaxed/simple;
	bh=l61rqDWlMelHoLg7A1/71y7iYpgMoDRH2g4+xVxuXRg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fEo0lRnPLoAZ+zGLHKWzZZIj2Wel/Bnh8TJV223BD1ZOVFKjdcnjaRh8Bd2Jfr7INStH+8AAg9Pfk0OGSsTHUW+UBU9AnlZDdIopzn2VXzI4Ac4OsF+3l/jQHt3VUDfYC4KXhVyUsYhvJnMThde0VG2gFhoc0Rv0Wa/tHp3ODZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=a78rWilW; arc=fail smtp.client-ip=52.101.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="a78rWilW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xb0PfPdsYlhTSrdinvOIPIl2hURCxuxrqAuh4e/LHW+tVmRS+IfYDFaRPCDrI/xGGg678FYkJ+bnaoi2oIETyJTt7g3NwXIDYm/MfXDD21dyM6QjBiZ4mME5yd2EQmrHkG6dd1dm9COQOjJL3S0ExfqJbd4ePXBOaiNbYOJf1CRJnv6wp3h1E82J00BUgZ+XNnnTBl4CUyHnJWrPI/yZCrVDygt4p1hvBDRxbXLDhEByu6qY4JZqQbkZNhS+0c4hx7vBwfpFvtUJ13+TaMksJQgEBncGwqQAq9FSHeoTNwZXuGbdBSPJJuHIX8nktebKvjwau01D/Z8QoWjqC6LkVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4YqIFGfUgHfitwtwB8IDUwC7PTcFzN9m/4t0jAEzNE=;
 b=NdeSjIcAAiC1faQuuGG2mOEzpFr5IYNmscdPjM8A8m7KiwZxKvkAbxeZm+NH5Tb1cMqiFfeYKmbM4JdrnYz20V/+dh0ZPlree0b4fv/Le0hB2qk4JzxxIeuH0u6JFhs8/dcovKVwkKD+I4aOD6NmxbwfEFxuAi4IYvzka943uvdtCS7zSDTkKkEGl7n9WtqpoHLgUk0/t6W1f/UuaYpgNWz6EOMaJN3kqjpw1er5DemkXHpsLDnNOEKKBeunUyzaydgkc1ELVIlrgLWIABXENecBSHpmK8jVxU0yI+ztHU5JeVXTT894PkgLah8yRzizLINDo1EbsEtVvw5LcdRf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4YqIFGfUgHfitwtwB8IDUwC7PTcFzN9m/4t0jAEzNE=;
 b=a78rWilW9e5MMOKpsiAGIfk8sl2y1nCqmhMJ1OGMuSsRcXYjttIebhteG2N545kaPOhwVVrDjWUQdSQVKaTuGHX6AK7wBGnL0yl7eVrSJbZtaISMmtOfAinrA9pGzkAaJSmDr9vQNJ1M4g2yjWQiGq1RbeG0Ge+zQlajTkt+WcY/9R0Vz3VPt1aoYBrOvHpOsuCC8oU2oRK3TSyFbxGfiRDCEK64Ppnk/GyZnWlDJB7qteODVMTBovtZzPaTFlJL9Tesd6qq3QCvsL0hk5z/QOGNMlcE+7aHyGR+yZZpE24lIFmt0YaV88oL7NIMqQrcU7Nti7683OtiSFPlRNfIQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB9PR04MB9937.eurprd04.prod.outlook.com (2603:10a6:10:4ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 08:37:46 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 08:37:46 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Andy Shevchenko <andy@kernel.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: wcove: use regmap_assign_bits() for conditional set/clear
Date: Thu, 24 Sep 2026 16:35:11 +0800
Message-ID: <20260924083512.461838-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB9PR04MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: dacb9625-df00-4d10-058c-08df1a171be2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	hSNTDFkg8ZjL54uHmSE6f5SqFBUrXbzSGR16oSygrWPRysX8YIl+bnR42IjcaDW307I6vKqmsaCmuNSd+uIoSnCElwrUFX0Qvx5pcsa5PqhwnGKQ2pozfdKmlo1ZC7Pa9ApvughXmBwD1lsuTa0fcfCZn7GLwsTSfejcmETiyqQ7NEWgDa2DlIdcDxJaZu5xlxmNeJLsuzGXkCrhlNcG/xESnfhnoIVMFioOZDfa81ob0RPvda6waQGxMwOXBjYnF1NabryDfG7GygiC7laQcU5Gbc0oFUWRBTaD/KAEX80Hf3RXsvxB9Ia4tNix8IpuYzdO38kFwy36dWgcWLPOgN9K2lZkXAYVl6yRjf0QKYYJq/pwuyFeG/Gl2v1Was9Vakn69Itpnon7OtLQglSSBxDbkWo6jeWyE7eH+bXLwn7ArKMHbME3yrgvnifBz/HWnBq1fsKVbFE0LBUilg9rBXinS1Jm+AZVUCEt9on+Ad16imb6OSkwSYQiqKpeS1fOamnfNJoR/ISjJi186AO0SnqSWdkCvITG74yewohmoP+SEtqByjWvzyuxF8X+G6zOktRvexYrDnzfPJJ9DYuAwkMF6jjsfpBcoS+v0JzjUKfoQZptJEndg6FslM/9cLbryTVOEHZS80CrL5btKMHMW53MbnsYrmL5GFUpZoPP4KA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+kCLVK+l2hIwX9VdircmdVa9PNtPmDcP+ASJRrQBf7a7lcPF2kImvWnXm/yc?=
 =?us-ascii?Q?e4EEuwKZmBDWZWQVazeMCRBO0sRcnVRicGVG1WFeAQF6ebbznISQauwLji64?=
 =?us-ascii?Q?WMloeKE6jYS3mflPdIB9RfTjUfmclUlu7jyGMUmXOxUI0+2ZOFa4MPw6RqPg?=
 =?us-ascii?Q?4s81XnFuKktzWcfmr7PtIs7Mtd0OhlSpAiKubpKoJRWgo1wTRqsOaVNjk2TE?=
 =?us-ascii?Q?hJLkaZ4juu6179XE2rzzCIFnu+Wvce1HMwVXT8PJRl4/xAMgDTZKvH4jvV5/?=
 =?us-ascii?Q?mLxw/LJD5bG47VJrpCubDhkOl95LGJ7zqfh5WyOR9I5+4Ort+92r3TsyiyF9?=
 =?us-ascii?Q?pSdeRxbn2azfgBGQoS+ofb4pd8iSOJC0rjYmybIv7BZZ19bLLL6ZPKVIFEV+?=
 =?us-ascii?Q?3Hd+lrbmlDb+iwiapArsjfo95rVA8K99FFmJ3Fs05n1C1m9pOIFKAd6LZpxD?=
 =?us-ascii?Q?wYV51VKpMlsB9eGRhMadIzeXfHegN8JYuetUfBeN9mlZ+IybtAohLTJcagjZ?=
 =?us-ascii?Q?Fmz3e6bdkt42kuQ69EIf4/Cs2kgz5tQj3PARePJnXD7L+7CO1Ob3JKndFHM/?=
 =?us-ascii?Q?FfCdpe1xoZ3idvseRTuPPEzPHUd15sDxEH+Cbgx/TdwPW9bQRe6qGQEe/vmi?=
 =?us-ascii?Q?pxTnfPtrkS5imyDKY5qSXqx7XXiM5a7ZNrXy7OfKq5TLNjEblXwScNxk2bJa?=
 =?us-ascii?Q?Aovp20EKQezls4UUekblvCwXkwpOS30ZNljSobDuVWHbFHZFsHLd0c9Ck3Mr?=
 =?us-ascii?Q?z8eIj3LUOPo+v/9YXzLYCWpGgr7c4iYzuUvT1XmpQVmoNw3QqB+UeZVJ67ZW?=
 =?us-ascii?Q?IQomn5dej2c0o7r3E7Qm5wwBJ5FEXKaOMB+kBQ9nEjy13o7L3XKjxNbDRS/H?=
 =?us-ascii?Q?zzhFB5tqwcT7xolFvebDhsYmktSibK+JDawulZBJ1Airm5m1nfeHlopHkgF3?=
 =?us-ascii?Q?od8BkD6VJwB/GrKG2Id1xyoJcudC9xfZiiNQx+8lxYLhDd+fUUEtY2Yyuc74?=
 =?us-ascii?Q?V9xzNgrymZVyDO32XQ02k8hqgEqS171FP9HxMkl5y8eCm5oNAKoCD7bVgwRd?=
 =?us-ascii?Q?rBhis+EmpDRH1ltK7cgPUTfYfbjlo8AKYkpY5yg2/zRcXCSY6lz80Wkowk0S?=
 =?us-ascii?Q?Ud2EmaLatc51hSucCzbebLFahZC1XrmNrtMPTzVVk7iNuTaZM9Ur5XbbfbfG?=
 =?us-ascii?Q?JK876vlC9P8LIsCgtqP9e5zTvnhbqzyry/zIRjNoJsEvjmV/QpbKHZnzUDw1?=
 =?us-ascii?Q?lAD7v1C2IjYJb3nLE7wJ+SDLprAtCvTaO7bFSPRcUp4XsofWyr8Lg59YgMb1?=
 =?us-ascii?Q?DkecReXlDNqbFHh6GAPFDWzIL+7ROMOV8Z4Liz/l9jdB0tq4T+mP681ds4hh?=
 =?us-ascii?Q?gcO96qLtlwAaYyxAx5C1HfQ56sBESXujZCkq1HYv7IhlS+Dnbts2tiDjx6zD?=
 =?us-ascii?Q?qelGqcvgkLF3ciZoZrauppYr9MXVBzV4FEJuluEigdSNanbcuG6O7ZwsU54w?=
 =?us-ascii?Q?dw3SS6brIQGQpRGqAgskyN9ymVLN7FuEPLDRyP0foJkxMak+vCak7wvAX8T6?=
 =?us-ascii?Q?aPUqL6L1Zes2exx1s29RTSi7Zs4D01ZJ7wSKlf0vzFJ6UrMsPEzTenuGDnKl?=
 =?us-ascii?Q?hyhXk9JB+2dABofm8MhsATDqStm3ZA/uYWQ9qa4t5V5tUA4p9nZkGFkhLsfT?=
 =?us-ascii?Q?PpYOceUKdvWzm1YdRP8J1+tPfxvyUcU6z3LQU0R9oMomSGih2icQtbZDvaJl?=
 =?us-ascii?Q?RGvdhka1RiPVrnNQ0r1ja/3hQOOc6cGPF0i0Wk+HLuo0J88mV38W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dacb9625-df00-4d10-058c-08df1a171be2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 08:37:46.5172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpStmVb7J2PvNF7S2NyBUzcmxQTkEcA1vF/4f4Xmh0XJOANStERY9T3Yx3f4fQjEF82Q9dCX+2n8ZH+5RgjGP32lQ9AYWzfC0Mi8FbgZjFQSpXXAHhVm2mzZuFWjSFoM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9937

From: Peng Fan <peng.fan@nxp.com>

Replace if/else block using regmap_set_bits()/regmap_clear_bits() with
the simpler regmap_assign_bits() call.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-wcove.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 4a5e20e936a95..937c5db7e6e49 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -129,10 +129,7 @@ static void wcove_update_irq_mask(struct wcove_gpio *wg, irq_hw_number_t gpio)
 {
 	unsigned int mask, reg = to_ireg(gpio, IRQ_MASK, &mask);
 
-	if (wg->set_irq_mask)
-		regmap_set_bits(wg->regmap, reg, mask);
-	else
-		regmap_clear_bits(wg->regmap, reg, mask);
+	regmap_assign_bits(wg->regmap, reg, mask, wg->set_irq_mask);
 }
 
 static void wcove_update_irq_ctrl(struct wcove_gpio *wg, irq_hw_number_t gpio)
-- 
2.50.1

