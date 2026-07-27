Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020142.outbound.protection.outlook.com [52.101.84.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE8B3EE1D8;
	Mon, 27 Jul 2026 07:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138228; cv=fail; b=TkFQd+qUFlV0IRXeslr8ttwZr7Bs/vhfaNi2qIid51pfz3zATotadLCku5kKOFTILVWdETCLZS39iFKYJEjTEucWnupwoU/I5dURb3fOm48+IpJBcqXK455VfinIchleuBCnSvuauxZt2o/lTJGQknQfnKgrlpWbuFomtB5NYPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138228; c=relaxed/simple;
	bh=nFmqXw9HudFY/BzrTU8i/pUm7oOhWYnp1Tc6xGIHcVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bt/bPqOFeejOPR2ZnRR2HVfuQK6ARWdlfp1OvSM39SmztgNjgSF83AnDUPQrUh2O8CV08cXr7ptQ2//U67iND2+1lZbwdMLy8Anr+dkEggxwy1KHRTMfthVdP2kKxU+uP3B6DB4NGqiP7nKnPUjCS4PMv+IJearuUZMx5bgMW/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=fpTRsJRs; arc=fail smtp.client-ip=52.101.84.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="fpTRsJRs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5xwxQptONsJy6VIm2YVfWasnv5+hH7yJHpf+hj7BX3hwSqFSmzoq/EDLWdB/HuVMtmLRptAmpRjua/sbjkZAMkqz0jbMbenAJ1i68UsfThag5VHByRS5zxI5iMj2JM0hN0umZC0vCzCcAWTjqsr/fWj9IhsE8iKNK5YIPqlpR6xJsikKhgZolkjfLIZZZ00Cb8LMhOVYex2BN7fToV+NWF8pUmdwXi0sZzOcbOglCdXznOAsjTFR1ngErTK1seaXrTZjl4TjmwMEq8lQGTfjaamxi7VotGDgSW0+HC1ygNIOSEYWxrTCkx+KqrFbmWDEFg0HKQOuPgPvPCEhTZFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpyeFMM8nNputDqYZENTlO+KJhiV7FC1RftZzRdvTkg=;
 b=GUJbAOZcqRDaxap0NUx5JO1vTnJRya6Bd1/Q2aenso2Ps4PuKCg/phLVzitNezkIK6hMhAjFzx/WuGzFouHp3KaReL/QwbVRrKkaWDffs5q2QdYz3LPqhGKszcUYUL7bHoevMt8XsoqOvyZUHe/MDhPhKeUDboxvDGX4hcmvJf6YsXfUontLAb3osyRslF7X5fiEB0GUWVxZdBJ8pR55JUZnyGIdwv/y9lr5D3OuMIf8rhrv/DdAqMJT7LgKqRQwKx5onsbGlUxZ3xEhj1dE6q5FEh0bsGUIGZ1jcO66yDvquiMmclMhA2jTJehc4xbmMgI0xODyXmHNa54w1DEwiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpyeFMM8nNputDqYZENTlO+KJhiV7FC1RftZzRdvTkg=;
 b=fpTRsJRsMlCoXX2q+OdXUGhYdNY2MSKdHpqgY1Owe/nAfe4NSeK4jNI7B2c6BykqIZ9Fa2+bZqw30PMc7H1gELsaHAUB8U6mBn3AD4IJ0NSozX11Zk1SKdWSiAtt9EauzuB7xDSaBt8CJSWgAXNjkWxypOSyJC+JzYs69EA7/YCS/Ui1pRD80ORO8xFc3SdRZKv5+exSQA2wOKFcrsy5wyvSjhZuuOw5qMuDyLThAaWMxfxnp5eBm6EQqBD4YRSHSYTIEgwNlt6T2FG4HSPmZDLumFRi2jmYT2AePmlLsJU0Wo21EvWxZEy3g6Z5aConRv7egvD0nYOQl8qHQOoKfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by FRZPR08MB11139.eurprd08.prod.outlook.com (2603:10a6:d10:13b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:43 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:43 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v7 29/34] dt-bindings: pinctrl: airoha: an7583: add olt function/group
Date: Mon, 27 Jul 2026 10:42:29 +0300
Message-ID: <20260727074234.3761170-30-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|FRZPR08MB11139:EE_
X-MS-Office365-Filtering-Correlation-Id: ae638b2b-eb1f-4f40-261c-08deebb2c810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|366016|376014|7416014|11063799006|56012099006|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	6fnYUI/sG7qajNeQwo9JkHGQUYuiGeqjVNSBDgxHRDP1WT5CSbKSibGBQUhfIRVBSyuETYG8W8WDow/O+WGWwDVwn30htjn93DH/QDa+krsXwLulbBxYAZRNuo1S0+fkwaMt/jNy2buY1evqbKerAL3RAd9Lov5FRONy9AV0Xou5b4FQPsKzSgKMfwWyCI4mAL8fmrl8hyMpoWBnzajEkMGpISOdlumJb8jsa4rZM+ml6WEALgLOTF04qTBHTE1smwS5ZEemyF9RIwODUwVRKE8To0lPfZaLfbA/UjfezUF5eQFOgf+1io7Pbk+lU1NnBg81O2ong82U+Ycu+m3yVVHLPHFctXnyGZSihDyTYQpvVUeAGI+Lfv+O2XmDq3ETiKo+MVs4e9yFf2Yx9MbQ1SQw4acLCsKUeFlLWvy0WOyIfnYLBhLBL4euHAl1UBow4Pm8JuZiYhiftLmsxT6hiV49/bRJWlhUH6VhZFkLB80X14gyIB9RW9BlQ1ibrszRpQg42S4rhjAV05++WdAh7fIJelkRv7X18cuLbIuDnN9UTrs3HGjro9bSUdyOjir/Z5FYisjLxCixlFKpO7XWOYqXewkASAz00qt1Oa9TEAlFXoqpGESUGfgGan20AmpKRXeAlKxH0z6f6Xcn+nADyF37APn3DKV4lTAgqVYiKH6o+Iy7XvLum2+kH6jxno8YWOoxvB6xMxP9BjDPs50RShyigfrykGJx3gdmPPvXl9SkKyBVlXFMcGpyBwmQSdcw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(366016)(376014)(7416014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SP+fQidDgUiOR0sIUsBUc1S0+JBbfCYtKAgUR8wwmOaYgZ9FVVBAgPEprqGt?=
 =?us-ascii?Q?8tRH0up8XCLM71BrAaP3jEqPt4FlWewVKYMd2lJ3JewCSsz7G+SKmrkFo46S?=
 =?us-ascii?Q?h6TLRNXCML7cw9ouAXvwga3eI0BWJs7sp9U7NbO4caeCOpvqIgiLiPEW5+8L?=
 =?us-ascii?Q?SG/aBOASleQqK1KYscGa5pUkBSkXhHKlXkBHI7j2rCTE6CVEU0FNfeyiBpkd?=
 =?us-ascii?Q?NYq8JuOML0lc2VlPivzezR+RsGcJTcPNEcJXbpus6k8TS8M8Gw3iTFeQBTig?=
 =?us-ascii?Q?uED93J5knlEvHwkG0yc4IiuuVB9BrFGSUVOU2/pe+TFsiNjK/+tITaMK9C1L?=
 =?us-ascii?Q?nBtHc5IdhJafwk3JBpKvtDn0bHXrilCLex6JDTil1yBzZdhwXbeUgOXG+Prm?=
 =?us-ascii?Q?OUHR5HuzvRq6aihDuHIz2r/sB6t5E89hcxco39gAJiW9ZuAdH/OJJ2ZH60ax?=
 =?us-ascii?Q?hY8plQ3Q6Btx6a0UfIspc2UbpUrpxWPjZIUx747pcmqm2xtt/pI1U++gkOxR?=
 =?us-ascii?Q?NDzgtfM8xWDS4V9GE7ru/znTo3qdu4Gw4mWI2FW9ffPttu4gbe+8eyCYwclN?=
 =?us-ascii?Q?8Kq0FW5yZ8prsvDuiiyXy471xD8qaJZc97qgMDhZegX0iJ3EbliVQ9d3ljur?=
 =?us-ascii?Q?p+y9cvm5jhfLjw5sVaLuNObUBgu72yo6nhgD2/6Easzib87eEym/cwBmMo8d?=
 =?us-ascii?Q?xrl4F6tZQGN3p+HZRM2O+kd4px8jOZLwIMzQc9KUyXDzMBGc/0kHLjnE1S0C?=
 =?us-ascii?Q?jrlOHZPxxtjJSkj6QQRSLWYT7u9ElWmHqCAMk/22Ladlq0bsJplo0yiXjevW?=
 =?us-ascii?Q?p/3ypxWvlJ5oLkVEHH67wMPWhCqB9FlFSN3HiY+LRwyYRw8pmR4nhrtkFcl9?=
 =?us-ascii?Q?0i+V8glsxupIdJfaXuaCgBuKUCF7oUygXbcvR7XnsZykOG9aTTcfLuNBe5kq?=
 =?us-ascii?Q?VJkii2PduOBMFE8BzePSj+ihrhhuICjtnH3TYYWaJM4dKrPrq4Bpe2Zq2NJu?=
 =?us-ascii?Q?KIq9XJzPaG9q2zbr2v33sgOkv4rtLRV6tFUcdWFwMLL0f2zgpmEmoKp4be9/?=
 =?us-ascii?Q?tOd5fzTRwh5qyKc8y5KeVV3SYFxXGi5FiAC/OdTcA6cadoM4OLG1VT66/hQl?=
 =?us-ascii?Q?9U7i9e049kMO+NMOMeFOGf45Kg8xZSn8cg1RAgmKiCk5kWWcxGyuCJnR/McG?=
 =?us-ascii?Q?QTy40JR4+QuYO3Ya4b97xD1RlP/K62r4f29AH0eIe+WdslYMtH4yoOahOZbL?=
 =?us-ascii?Q?Av09GTiUtxIBq1EG9Zl5KSfDukcoJfdpzAvzFRixSmbADvlc/FgUcvabh7YL?=
 =?us-ascii?Q?wiVo9J6E+YBUrVUFCWlS2SBe04ROpyiw8qpXsW5G7T75OuQkgxdSaAVXgFT7?=
 =?us-ascii?Q?WYVDcHkIHgx4ibELKkZMKTSH5nxHsSkcy/ALwv3il5zVCofhDG6nb4l9x4uk?=
 =?us-ascii?Q?Ym9e1BU+3K1bqihYEAuBbsgWvnpSeQdsEhuWHED12sHX9YgsDCGuKJyJ0evK?=
 =?us-ascii?Q?js7ZFBbHCCe1+rXgPn0bmGAbikJK3bmoBTfETWDSuBd3rUP4/T29JhPlB0XG?=
 =?us-ascii?Q?eqY5AXPyKGIgO3QTmRo1OVpkRpIN98fY90DRTpb/Ren8+Xp33gfsvTRVr5yf?=
 =?us-ascii?Q?ITTdydMbEoy5XxVf0XAaijl509Mw4Zjk66UgOjTtYF/EVVQfCNYpkBfsN0Vv?=
 =?us-ascii?Q?I2jhwL3b0hc+qkCCJP3iN66rb0M5pv5ev51UMiYfpOy7yo/RonWuRBFvCxet?=
 =?us-ascii?Q?LhIqolyJi+tm7H86aJLsLgNieBifF7k=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: ae638b2b-eb1f-4f40-261c-08deebb2c810
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:42.9164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTfluT+5LhBnmZtKFAivuAEyrLlYC6OABZs42PiC6NfWyro+aUPQnzN6Ev+n2F/UWgf2GZYI/MYFPV+TIKrudLKbgj65sCS0Fuu5eFLbZSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11139

Add support for olt pin function for olt pin group.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index 7deb48db52c3a..f016e0da65a57 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -60,7 +60,7 @@ patternProperties:
           function:
             description:
               A string containing the name of the function to mux to the group.
-            enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
+            enum: [pon, olt, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
                    pcm_spi, emmc, pnand, gpio, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
@@ -82,6 +82,14 @@ patternProperties:
               properties:
                 groups:
                   enum: [pon, pon_alt]
+          - if:
+              properties:
+                function:
+                  const: olt
+            then:
+              properties:
+                groups:
+                  enum: [olt]
           - if:
               properties:
                 function:
-- 
2.53.0

