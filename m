Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021125.outbound.protection.outlook.com [40.107.130.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4A546C4D2;
	Wed,  5 Aug 2026 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933289; cv=fail; b=RwmlPUVD4kRUKtmVV7kaEBNs9YAuKAb1AoTfL9pFR0nlrQkbX+NURcSBQDzJxt88WJT0/L5bpViPAbDWPGVzzy78OxNQV7rjxS6uCy2Y1y/fMciUKfJLabpepwIQc9yESigIe7PSP2xJ+FBUfr7atmgqf9H+yJCuf7VzcpyDbVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933289; c=relaxed/simple;
	bh=dKt+3x0V4eimA1jnx36FbKwv9cWh16AmwmOtQtJNbPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uVx7n6ATwt/vpKIN5h1gACP1xxMMYH0A50nvT8Wli/4s+V6tsbbhGP1aECFHFdH13fVeRvpnPdVGFS2q2zhNJ+tjvlwe8R9Zj9dokq5uvuXtmi+iAYYUnLDcd4hOIzmKCGnHKmbpGaAYkw0lyEAKRuFiOE2rtmg/SUKJXf8W0eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=XL0WR/VL; arc=fail smtp.client-ip=40.107.130.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="XL0WR/VL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbBYpEU6oSD2yPvgwlLy1L5QYRT5Lm4Kco/QgTpT0S7YKWcdbNRY2cxOKbzN7IE9LEBKWVfZkG6Y6c9/KromRT7hWC/ZBxg8f+XN9NyW+FgHnOrW+jzpAJBbJNLBmpAC0d9eXt+/N+jlC/nNU5RO8pSYfv9gBUI3Dy+yLk1vdGQKgfr3wOsoNltpmScFivSvt627Zaq7vqu5hg7l4EWS/79RWGLGxi4HozH6EVnY8RL7I8hb4BQsALIm63vqtoMdxCJRE88Z1wfGGiAa8eSP5wKHY4t7MERjiWUXnuqBQ8t8fRRLRJAoGKUIyVL0UpOPb4EbeImKLSEitaWYK1Cr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKRmdOcaj6ZSKlhP2u9sOWlv6A0PPZIW1NfcWGAZwKs=;
 b=wBJo9FjoJm7g2gyLNAz1N5D4SmWIUY+j8iJ2PyfkwoLT4Ftcg6Vi+U+T9Q61qMW2UPxdam47kY22CNO5xtCzhYFTMVDvOxrEBrsZCwkJyZN/AEHer7wZa8narcS82vud9O1AzjCmUqiLGey5zgvVL1QYSdVEwQq9jnFBzrNOi2sAUmuoBRpLEEO5ETrAygT+nK0bJICf71IWlKL/4EQS0eBueSub+6e0ytY67hOCnzFpeX1FDWmumMz44Lih+s1uglA/OzD82pO5KH3SrcxcCnEe8ENYWKrN3+CV33HyEqRVXCToLkFq6lXOTM/ifnzn/ISBF7QXb6oSOUCWZpvNgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKRmdOcaj6ZSKlhP2u9sOWlv6A0PPZIW1NfcWGAZwKs=;
 b=XL0WR/VLhQOXsuvikNxdHaM+F7iJE0AhLBxiMngZVRkNeexK08S1bdQdZ78k52kYY7gRZXymHESAaFIrvzzReToGnM2PFpRPeB+/6z3gbitg1IlF0DCvn6GfAFT4OcousChNHuwD3wKuam5VXupJpuG8wiMbNzAOe3WOqRpF29CDondjndfLYcgL841CWLyAz2IvgbkS3xVJ9dKcbFOJEn936ZRuFU0i0qxh4qf4LCQ6tqMW5hUB6sHzQ5rNg5Att0lw36jpfgIoMH6MZM5M7bmbf51GbEaA6kwVgh9ejOKc9P3QtyF53AEBPRb4REYYfXuQBdciZfVXSYbk9qDkyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:34:35 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 12:34:35 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v10 07/36] dt-bindings: pinctrl: airoha: en7581: allow configuration of pcie_reset pins as gpio or pwm
Date: Wed,  5 Aug 2026 15:33:39 +0300
Message-ID: <20260805123408.3767648-8-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS4PR08MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fcbf3e1-9a9e-422d-474d-08def2ede821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	ZZjUAJA0JT/zjxcF5NttnqdkcesBdmAbrV4Qi2A97hGEX6QjUng8rF7ZqAz/M3OHvde1IktRFBnhNLDf1kqM837ozdwtgcvf6WbLiP7HGsd1AewTER5Lj8I4MKBoTi/UonD9cCuC/ydOJG5C0jFiBji5+kD6T1XsAELv7Eo+xAb+aXV0OaFMLPLXJr8jtGuBYCO3HccmgYnK+a+IqN7y8BFBEw1W3dFe0XnAsDVjuyGg5LR3kl/PJbQKeubJm4WMvfOfn/5Y11V1SGsoWL4mYMu/3s+HSUb3yKftR4CUEZxZEQRDGAIzpZr4dJDnJcsqwXKJsnmbScvqutkvL5ggjxtqHajwlgFGIN9P3w5BlmP5Qb3V7808uzbpwdg2x++Q1tLZ/Voqo79XsH+6XG8j61WqnRNeIHQVslJH1n58zCAdQHFLfiBBpGTA+RWfcWc/7GcnvY8Sefo2uXTNRE4OnKvCGiVZkR3daizau65zb3yu7DmpriZ+gr3/kNWOtvng/PkEFjOoriMkn1BWdB52NAAdi0A82G35Wz4eW/RYTkXw5JJOfCz0uDK5qhpeuz/f+0XUHzeT8qa3HB+cRdXX1RBj+3thevlz4q7HTY6uOzb3NnsP9NdvAhDHEM1gFPfqDfproeyCMEJ4v/Y+ohrDL3V0qtLWQycvhhW8FrPKRCr41KJ+a8I0S3SpGvxme75t/B9ta3xzZ76jktFBftsWKhw5DrGtqdFX/8oCUeHKrvk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L0p4W/dAzEik8TFz40CDNtCrkLt6G5OaBhDHo526l0XrwmYOrhu3nPOIoz2v?=
 =?us-ascii?Q?qqpTRhVKvE6M3ZM03Ya3dUyiZRjq2NS51AFTxzYhF0khk+jjILHEjbFWIfEN?=
 =?us-ascii?Q?REYfDJX2E1kxBpRmuoD4kKLD1GYx9mftD54yHurasjTktjfTrjMCGTVc7T2e?=
 =?us-ascii?Q?fNn2CrjUKpBC0FK8ucAR83HgOmfKsCt2DL2uYYBUr21M5stQesvhjtj9ZRPR?=
 =?us-ascii?Q?9fzR20jllX3zX64SXbj+pTISsZETKJt6YHTndMLDz2mSzEXKxP/khmw1IzYR?=
 =?us-ascii?Q?iqZzEmW7oqIjcD8U4gzuKMGQtoNZ2TJOOlBv7gRUOPNZNtcGbSz6iq01VKv6?=
 =?us-ascii?Q?xKe9De431mmU9W1/rsM5GdgSVOgCuRioauFk/kiA7hRXCyCUdUtI1ugv0AbI?=
 =?us-ascii?Q?QNjXXSSiY/umfZ56RnfvXKSEiA4cS3KealD3PGUiOKEmXm8mC49EkAwyC1dP?=
 =?us-ascii?Q?pOkk9vquJsAj2Z7VrK65dMxKLuCMNoPKCpoBAOi1kTJArNR+iAlMjgvvq341?=
 =?us-ascii?Q?uOu2mOeOUiWESSu0U90a1G9sRdrrR2bCxyhbZpYg5tYeoxPcJ9iwnq9/dM2p?=
 =?us-ascii?Q?smR0p/cnBcBIxcwf4RajQQ53Sm9+tBSAac75qRmj3HDEVSknz9tyepDs6+/l?=
 =?us-ascii?Q?aPLnOLEMb0kglCcmHfh9De9krCPIiiqDhV9qiMcJ68aiEpE8aMIUvQm4zyW8?=
 =?us-ascii?Q?liMmvSe+LWLcNyWpT0H8AituFxxu9+e2hh4MsJyDIibf3BF+Hhjt8Z9EmHSq?=
 =?us-ascii?Q?4O1yADUzzXkI0HC7Eo8KwmkJoRtPkRJWUThZs8IuyUzy32+qSQWJT00PtXzu?=
 =?us-ascii?Q?kctn2jMjl0cJTz4fgJr/+gYaPfpGOTNS/sTwmtJRY35HMQdZmNIGG2FGiI3N?=
 =?us-ascii?Q?r9gNp7FmUYuShyn0kLZU6RBpHLMN60Vlolc8yDlyQ2byovYXeUnCc/TqcGjY?=
 =?us-ascii?Q?O/02xGvkXzcvOdhaN6oInZLfJDq3IRojCndIU+mbH+WQBRFvNAjnhXWUgtPw?=
 =?us-ascii?Q?80MX+ojJoOz1b5uMuu1Y7g1J287G+1mS6nZuZWLo1arAYkSHuVfykCvSyG4N?=
 =?us-ascii?Q?dR+bLufo+MKgur2TIFTGft4VP5RK9oEpi4hi/Gmmh0mOqp7nARcOnMwD3yNk?=
 =?us-ascii?Q?jINomY5PRaJIft3/kMNn5kNGeMvGOQrNiUpNQuY8j+m1AbLhb6k43/27FE5V?=
 =?us-ascii?Q?ZwvzyG7MokDeAfEA17GVWay45UYCip6QZKGt++HH1ucpw25UXRCSN+pybN3K?=
 =?us-ascii?Q?Jd9nfOBitTe7iCD++KO59Om9KHrz/lnk01c5XmQqz66Fck5zWH18IqT2TnqY?=
 =?us-ascii?Q?n4qWzm8xu2dckcXNbow4PkFW2vCEUCAgCiRT32l1hXSrW0B94Gj1cFO9+vZn?=
 =?us-ascii?Q?toisATEJMoaQk7E578fVemsdGqgCVBkLRFasPH2+TJMfslKdy9i3pE+47p6u?=
 =?us-ascii?Q?+6jcmfTusrgNtMCyonpM1pdYz+4xaaMj2PkuqvhvMLloWylNzpcsbgMs9zNe?=
 =?us-ascii?Q?PSG1AGxjEUE5HKo0ZEyeJWGVzdVa+0mvKgfxvQ0srNTFHACZiBjhWs1wSg0D?=
 =?us-ascii?Q?nxjpimuknps3SrSK1nXytTZynodpXPFPpFi82ru4u8JlpeUNW950K2EZa4lJ?=
 =?us-ascii?Q?PNrhhIG8cWAyHU0JTdN2kJvaLnXBqKvX/0RpuLARWl2f7QVsAJWSohiJr2I3?=
 =?us-ascii?Q?UpM8ZgUNk2RzDPCsZSvjT62CDeNX+NuC09j//VyBRqd5dyz4uCigmT3uc6t3?=
 =?us-ascii?Q?Q03d4D81/UQR8NJkC0qv/LkZ5slfsL8=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fcbf3e1-9a9e-422d-474d-08def2ede821
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:34:35.0178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3T+BlhtXNf0vFYYHtBDsmWMkxGgoR8h7Tei8SJFtoUWfqUhh+qXm8TiHDcT3HXiNLlXfdUgv1Ix4pAVZsXQnZtkMu/fZOVxWNR0/Aa/79AY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831

In the an7581 case
 * gpio47 and pcie_reset0 shares the same pin,
 * gpio48 and pcie_reset1 shares the same pin,
 * gpio49 and pcie_reset2 shares the same pin.

This patch defines a way to configure these pins as gpio or pwm.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,en7581-pinctrl.yaml     | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 0c5a7eb6d563e..1f281d3c47cba 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -61,7 +61,7 @@ patternProperties:
             description:
               A string containing the name of the function to mux to the group.
             enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
-                   pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   pcm_spi, i2s, emmc, pnand, gpio, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
 
@@ -187,6 +187,14 @@ patternProperties:
               properties:
                 groups:
                   enum: [pnand]
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [gpio47, gpio48, gpio49]
           - if:
               properties:
                 function:
@@ -208,7 +216,8 @@ patternProperties:
                          gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
-                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
+                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47,
+                         gpio48, gpio49]
           - if:
               properties:
                 function:
-- 
2.53.0

