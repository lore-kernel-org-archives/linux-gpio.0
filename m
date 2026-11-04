Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792225;
	b=KaztR9nwH0Y/ZkI1LFLOp6SfZv6UIp+qYvtOsd/snU7QoyNLfBW9fXS1VmbKqyNFBy0+
	 Oh33+UcWRTH2pScPUTUg+98RxrkyMyRpm1JDOcLUecvfhMMO6/2xvVpz0UteKeORGQCtf
	 4Afd7DP8Nx4x43biDmi4ZVVK+OyYawdeOnSIiFq1VIoAt0oKJqG19HaAiFBLiQIwigyTm
	 h7BKd0k/EcNHatFNwIeb0T5I8EjyqtlMC/dWG08cMzTLI+gSOSMyXN/t3ESQBXtAYHqDj
	 pE6EsaKN7NkADpgTMXBShqMCjBFlDZ+LYJFnB2OAVfd7ccdVBK/nsJtElQ8yscM6IHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792225;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=HGy7kCZf8CR6bcE2bE5uzpDbKBLfg9tC9TDiKKV58ww=;
	b=kCj4ee8pf2KnPGDnRJJ5WAyDeaIo6JooJwBRVUSy9uVRe5RDyyc6THACO2o2GuPhUabf
	 6gfuBTsZprmbv175o11NOHfVooPNpmDnOjuyg8EvuglVnYppf0hK4/J4d1YViORZWnwNc
	 Of4mtHGf3aJyUfyxnbSR5wm8n08Elw9uJtnnvBHGXfPJsoFI/DHqxh71X2yodqwkRrCbd
	 RKVPHGXQM+DWOC/6QhH/rQc5/vedy2y+oyyisd/+fO19gx35F5/gaUThDsQ3GpCLPm1UL
	 DpVl7BwLZ/6Q/gwoh+E37/LCg8buYudEdtlbkSMzhIZYF8gie97ZwB3ynv1B46a9LMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="gJ/dmxaE";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.28
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010028.outbound.protection.outlook.com [52.101.84.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB0C606A32C;
	Wed,  4 Nov 2026 11:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECB0C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gJ/dmxaE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzTXWOnFRHafjfupjI8efwOrQjHYBtX3oDzi9zJO6ihjyUZ0yyRZ1dDatWTVr/HCvbB7SRBir3EqqrW/eGJyK4b0jwl5pwLe6iiemNdKPIASu57K2Fscr82nCTfYDKBjsSNZRh3JpZc8+aTyX2K0bimidw8HjAtpMbpcWN4LluqG68iUlrQdm5e05hXVRaqBsgGK+v2PGMRK4ryTQqAaoX72fXRRowa7lW3c1RQs1804eErSpzLkOm78Bu69iSFCA/eh/tmQM+LJK8w95kB81ktmk6d8kS1flxJ3BpuOczGLSjnMsHE5NAolW5W5UsJHstQQX/rqC3gLAcwD7wfKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGy7kCZf8CR6bcE2bE5uzpDbKBLfg9tC9TDiKKV58ww=;
 b=nvVWA5Q6Hz3Y4UjhPOAmREo3lMriSoIOMXRimcpDqL3Eul3Qm5rI7AYSFbiaBWg3/K1VWdAseqLLUa/N5iDS9zpzPeVbyibqjPCINqN19An6ZV0N9GNKEfqpveqC8kBHHOSiTeL1312uu8A7DppgJ6z1j4Ohz0QhewPSMaPe3KrFUdaDsOtnztOILd30d8VtDjMONXPc7wRS+0CY5Qf0kYeniPJm2b2PyEhMjnkb7n3L3Y9iX516e3aipzVQSWo+E3t2fK6eRA/jLd1mCwLq36EXVzJrILNKBKdskz0Wsun/VpI0VreBB0npgIZGIXActp/EVFqz+JNHMdaA69k3Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGy7kCZf8CR6bcE2bE5uzpDbKBLfg9tC9TDiKKV58ww=;
 b=gJ/dmxaE/LAdWnlFyPCcr2urGU4rlKvw28WHAaMrV4nehk0s8iGCuqZMhcOyymMCCpHTXwDZCjfQVpcp6Kx8mn4SpBKticN8sfmyzXF2+AvdRp4hH1DOQogs216gfAqiuw2ZncmcckmS4PyUpw0IHrH9r8Uqzf3UQUgcVGaRA/LavhKtOTY7G44wWPT018UJv/jL2pobQkEQTSsLWMToWpxhAQ13RH0k60Atnorib9L/EUvXSx0kmJ3wVoe7kXMvB9MzHqHiNYZ4MRZLQwxyjC+7hReHRYkrWX5fb40uVlaZT2K+azfihI9PIihaHt/UEyyuwNGcHt4okC6uDrlByQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11828.eurprd04.prod.outlook.com (2603:10a6:150:2d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 11:37:01 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:37:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: intel: Convert to subsys_platform_driver()
Date: Wed,  4 Nov 2026 19:33:43 +0800
Message-ID: <20261104113343.1634218-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11828:EE_
X-MS-Office365-Filtering-Correlation-Id: 202ad966-803d-4c79-f06f-08df3a67f153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|1800799024|10067099003|261102123227099003|18002099003|11063799006|261022075727099003|261009223027099003|56012099006|261021121427099003|261021123027099003|261026135527099003;
X-Microsoft-Antispam-Message-Info:
	ia9ceiMfd+/mZpUukG6vZ6Kvt1l/mPsYpY7nDdTwlbBQtFOU/cUf9ZpazrjWMA9vJO6aM8FtE2qQNbES4esRqljok08eiHcQgwOexSSSocQUnFPJXXCE+reFHMOiT/7effKktOvc5Y5JIXhLD6hQ9UNAof0PUbH7vRnhQFkAN0StlCXPJC5lirIhbuqT0MeOvY0ICUZJNrmvcff0H+1jWDPYNtQ3lvw3Y+0asIoCVrt//4ukYi9kR7ZVWYIBn1+0C9PP0IKEia9i/RNcLT/CcYh8Hrgv+r4tK/RyNc3beThxNV/igaDP7XMfeyEQzOzzoMeDAO0Fgzr+Sih5gaHOeo3G6+z16dkkIUX3q2KTnbIvcxoYD8xHl4ZMOdO9YuO0+vXkxXqRb3zEP8rapaNEBBhYm49D63sZc0FRWcLuCuyKYSwHR9mGVbUw7+l7EWfA5SUbhqGFEoLXLtoHh6DuWL80pJMRWksV7GAGkUosz0zpQDv8+lIylrYXl0WX+pEGfx0POLWfLjek4KaR9x4Bt+T7askxoT2up958rYuKmm5HbWnWikmLrtRl91v8+co5aIiI2i1mLrbqGh75kEcyzf29xanAk6sB8G+ZhZ1WqIWimSQMgaHQo3g7zgLr4seFEa8Ebvj/DWxI37rOZc/zx5axq0D28nFjRK/WH1rqbkY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(1800799024)(10067099003)(261102123227099003)(18002099003)(11063799006)(261022075727099003)(261009223027099003)(56012099006)(261021121427099003)(261021123027099003)(261026135527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cfcWMcMqwTzvxV8af09z70NK+sGxaWGxgzCKZRzE4gGoirQzp66rB+OX3kQY?=
 =?us-ascii?Q?wZ6gAvVyFZ5vjfqZlkmH0yf1WFkFCVcxuPJNloVdE8eNf6GDYfZe5UlRYK59?=
 =?us-ascii?Q?hEznqzL+e7c2VjL2dkIjf3/P9vl8YTSG17bKR8lsBiu2fFtsFiyt1mNKU18F?=
 =?us-ascii?Q?iobMNEKJFbAH667UtOmTGL0QWoy+3n6XAIttF1Rs1gYPi3mVaAWGgXNNulQA?=
 =?us-ascii?Q?lwIXTt8orqm+6A/dICpvdVOaWQgYlrkmI9QPHNaFk+dUnMyG5OQWgcC9C2Fq?=
 =?us-ascii?Q?1SvcG+Mm9MZaehqcSFOk47rS72b6hHuYnXZspFkEJ0i3+WqbCW3m2iqI0Cxs?=
 =?us-ascii?Q?pZX3g63FBYrO/er3SfRXBI5DoY6a4qcU+1syZEXHmcdD0r2cr6UlW1ZfgHTx?=
 =?us-ascii?Q?7lZ0bBUyQZWjk2tsO7xA1mq4Xi+m0sK8t70TS1LO+bpg+CaPySV+Gi0tygR5?=
 =?us-ascii?Q?KsoDxufXltq/Z25u4QGzvPM0L3NTnfGNoh1+R7KYR/SXwcNbUy2xgZNX4iDz?=
 =?us-ascii?Q?KhKhDetd2EP3ofg8V+n0XOktY+so6NnxP9410isZbYZ3CuIfVPyFeKhsttnG?=
 =?us-ascii?Q?qM0VrZ7zH77PEjoHibWGS4rDeLAS49uKfx1E1WJsxmF7eg6nJ3B+jS8V+giw?=
 =?us-ascii?Q?BL27rkYSA1Yr3rEbT1wTJUeKgDe9TmKPMyK3mpxLbv/yf8/W8a2vyMOsVqrk?=
 =?us-ascii?Q?TnSlFG5SreJRj8HidPs4VnQ+Kh5cLnV0h0nU48br9mqC+XoCbczvZh8wxvG8?=
 =?us-ascii?Q?zKxVJ1uU9DuYMXe2mi+qGTYb/H4gyKCiPOPuNkWT/M1e3Z55OEBDEEMAk79G?=
 =?us-ascii?Q?PBNPsqmfjSzH0rKhg6HbopnIEjE42uQy/Is3gQXDIHKD/kSDEN4Jzs5B4leC?=
 =?us-ascii?Q?GvttrEJom1jMf9Ant3fNA+0BohLIvAq8+BTGuyx/VRXwKqip31Rv23HNSVrX?=
 =?us-ascii?Q?VRoIcqnf7hYFK824JHKVV6Wb+LTn2uBe/w5cvGuHGbk88GzprnDqjXlvu7U6?=
 =?us-ascii?Q?DorCWf28YTNcmZijvgepCrkU0rXcCI0eRzJFt8mFJC/sD60yEhicmg0I+qOF?=
 =?us-ascii?Q?7Z05yuABTkCfRdBW4/GOFbJGXLg8twIF5zdZxRVb2EKS6gB/OErbQ7oatVuT?=
 =?us-ascii?Q?aveunSwb194dw2svJqWKDcMsFO1m16vzPXY8AW62weLVmHjgJo7sUDCp59BT?=
 =?us-ascii?Q?K1bpHwAHjAWViAIX+mrPOQfaVapoixWaCAnUcn5yghsffNuO8DtegPJcRkmZ?=
 =?us-ascii?Q?wR3j11VxpXSqU9azkQkIxSJ7RRN9YSvQJjmfvigqPSSJBIP+qbJGoAfyqSUL?=
 =?us-ascii?Q?M5XC8vzGX+Ajdjt2D/hEWSBRWNTMzqlVsEuZxfVEDwiyqep5v6pssGSL9kco?=
 =?us-ascii?Q?VlVy6ILUG9aLsAietR9TdZNTTSFNux5xGpvajrnY9A7kT6ALOoTbj2qDKKtB?=
 =?us-ascii?Q?/U5PHbcsqDXcqFDk3XvWxJp/jqTu+5MI86mCrPHzX1jRyBch11wAvyoFTf8j?=
 =?us-ascii?Q?DiMYaGkAIKgb/JlAXAaWHZZKdoUkQwJ5k0kdcskHOu8y7VmfZxWaKgTQV+E8?=
 =?us-ascii?Q?nFieL4LYr2Q7JSQUQksmciJvJHC9Bu11S12UgvlEVlWkgVOjAiMaFBYtoO2i?=
 =?us-ascii?Q?41Zl5bsuH4T4wHfcWDAMo7QTeecfwedqqhC7FJc8s9XvKE9wv+C94JzlcAZt?=
 =?us-ascii?Q?g3Zgd7EIEWqfhw205mFTfDFPSYDmLF3/dfwssM6BG3phjFc+L36+VczWwNH+?=
 =?us-ascii?Q?l3JmsB87cklCFJyN89OOtpdwdUMFVw1aYGlA5NsofAjERaVuwIdx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 202ad966-803d-4c79-f06f-08df3a67f153
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:37:01.7559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YD6TPVYFuFlCn2jsyi+KppsaL+eU51TR8KUFjYR17lNX7/r+I16AUS96Tnxg/oZIAebGQhKzMZl0qkVlBMRgf37eAUd4enZbJBbrRxKEA8lpBrFUn3zT/im7JPHG6S3r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11828

From: Peng Fan <peng.fan@nxp.com>

Replace the open-coded subsys_initcall()/module_exit() platform driver
registration with subsys_platform_driver().

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/intel/pinctrl-broxton.c      | 13 +------------
 drivers/pinctrl/intel/pinctrl-cedarfork.c    | 13 +------------
 drivers/pinctrl/intel/pinctrl-cherryview.c   | 13 +------------
 drivers/pinctrl/intel/pinctrl-denverton.c    | 13 +------------
 drivers/pinctrl/intel/pinctrl-geminilake.c   | 13 +------------
 drivers/pinctrl/intel/pinctrl-lynxpoint.c    | 13 +------------
 drivers/pinctrl/intel/pinctrl-merrifield.c   | 13 +------------
 drivers/pinctrl/intel/pinctrl-moorefield.c   | 13 +------------
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 13 +------------
 9 files changed, 9 insertions(+), 108 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-broxton.c b/drivers/pinctrl/intel/pinctrl-broxton.c
index 269b8e25db84..b183ea645f3d 100644
--- a/drivers/pinctrl/intel/pinctrl-broxton.c
+++ b/drivers/pinctrl/intel/pinctrl-broxton.c
@@ -1009,18 +1009,7 @@ static struct platform_driver bxt_pinctrl_driver = {
 	},
 	.id_table = bxt_pinctrl_platform_ids,
 };
-
-static int __init bxt_pinctrl_init(void)
-{
-	return platform_driver_register(&bxt_pinctrl_driver);
-}
-subsys_initcall(bxt_pinctrl_init);
-
-static void __exit bxt_pinctrl_exit(void)
-{
-	platform_driver_unregister(&bxt_pinctrl_driver);
-}
-module_exit(bxt_pinctrl_exit);
+subsys_platform_driver(bxt_pinctrl_driver);
 
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Broxton SoC pinctrl/GPIO driver");
diff --git a/drivers/pinctrl/intel/pinctrl-cedarfork.c b/drivers/pinctrl/intel/pinctrl-cedarfork.c
index 02fd1cc4fd1b..3365c868215d 100644
--- a/drivers/pinctrl/intel/pinctrl-cedarfork.c
+++ b/drivers/pinctrl/intel/pinctrl-cedarfork.c
@@ -326,18 +326,7 @@ static struct platform_driver cdf_pinctrl_driver = {
 		.pm = pm_sleep_ptr(&intel_pinctrl_pm_ops),
 	},
 };
-
-static int __init cdf_pinctrl_init(void)
-{
-	return platform_driver_register(&cdf_pinctrl_driver);
-}
-subsys_initcall(cdf_pinctrl_init);
-
-static void __exit cdf_pinctrl_exit(void)
-{
-	platform_driver_unregister(&cdf_pinctrl_driver);
-}
-module_exit(cdf_pinctrl_exit);
+subsys_platform_driver(cdf_pinctrl_driver);
 
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Cedar Fork PCH pinctrl/GPIO driver");
diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index a33eca5eafc4..00137cafd3d9 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1768,18 +1768,7 @@ static struct platform_driver chv_pinctrl_driver = {
 		.acpi_match_table = chv_pinctrl_acpi_match,
 	},
 };
-
-static int __init chv_pinctrl_init(void)
-{
-	return platform_driver_register(&chv_pinctrl_driver);
-}
-subsys_initcall(chv_pinctrl_init);
-
-static void __exit chv_pinctrl_exit(void)
-{
-	platform_driver_unregister(&chv_pinctrl_driver);
-}
-module_exit(chv_pinctrl_exit);
+subsys_platform_driver(chv_pinctrl_driver);
 
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Cherryview/Braswell pinctrl driver");
diff --git a/drivers/pinctrl/intel/pinctrl-denverton.c b/drivers/pinctrl/intel/pinctrl-denverton.c
index 47636a9719ed..b662a7fa57bf 100644
--- a/drivers/pinctrl/intel/pinctrl-denverton.c
+++ b/drivers/pinctrl/intel/pinctrl-denverton.c
@@ -263,18 +263,7 @@ static struct platform_driver dnv_pinctrl_driver = {
 	},
 	.id_table = dnv_pinctrl_platform_ids,
 };
-
-static int __init dnv_pinctrl_init(void)
-{
-	return platform_driver_register(&dnv_pinctrl_driver);
-}
-subsys_initcall(dnv_pinctrl_init);
-
-static void __exit dnv_pinctrl_exit(void)
-{
-	platform_driver_unregister(&dnv_pinctrl_driver);
-}
-module_exit(dnv_pinctrl_exit);
+subsys_platform_driver(dnv_pinctrl_driver);
 
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Denverton SoC pinctrl/GPIO driver");
diff --git a/drivers/pinctrl/intel/pinctrl-geminilake.c b/drivers/pinctrl/intel/pinctrl-geminilake.c
index 21d0d5051b04..898c4b0d105e 100644
--- a/drivers/pinctrl/intel/pinctrl-geminilake.c
+++ b/drivers/pinctrl/intel/pinctrl-geminilake.c
@@ -455,18 +455,7 @@ static struct platform_driver glk_pinctrl_driver = {
 		.pm = pm_sleep_ptr(&intel_pinctrl_pm_ops),
 	},
 };
-
-static int __init glk_pinctrl_init(void)
-{
-	return platform_driver_register(&glk_pinctrl_driver);
-}
-subsys_initcall(glk_pinctrl_init);
-
-static void __exit glk_pinctrl_exit(void)
-{
-	platform_driver_unregister(&glk_pinctrl_driver);
-}
-module_exit(glk_pinctrl_exit);
+subsys_platform_driver(glk_pinctrl_driver);
 
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Gemini Lake SoC pinctrl/GPIO driver");
diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 299ee4f22bdc..55ff11af2038 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -833,18 +833,7 @@ static struct platform_driver lp_gpio_driver = {
 		.acpi_match_table = lynxpoint_gpio_acpi_match,
 	},
 };
-
-static int __init lp_gpio_init(void)
-{
-	return platform_driver_register(&lp_gpio_driver);
-}
-subsys_initcall(lp_gpio_init);
-
-static void __exit lp_gpio_exit(void)
-{
-	platform_driver_unregister(&lp_gpio_driver);
-}
-module_exit(lp_gpio_exit);
+subsys_platform_driver(lp_gpio_driver);
 
 MODULE_AUTHOR("Mathias Nyman (Intel)");
 MODULE_AUTHOR("Andy Shevchenko (Intel)");
diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
index 5cf54bc18f86..eb8c4c2ac022 100644
--- a/drivers/pinctrl/intel/pinctrl-merrifield.c
+++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
@@ -362,18 +362,7 @@ static struct platform_driver mrfld_pinctrl_driver = {
 		.acpi_match_table = mrfld_acpi_table,
 	},
 };
-
-static int __init mrfld_pinctrl_init(void)
-{
-	return platform_driver_register(&mrfld_pinctrl_driver);
-}
-subsys_initcall(mrfld_pinctrl_init);
-
-static void __exit mrfld_pinctrl_exit(void)
-{
-	platform_driver_unregister(&mrfld_pinctrl_driver);
-}
-module_exit(mrfld_pinctrl_exit);
+subsys_platform_driver(mrfld_pinctrl_driver);
 
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Merrifield SoC pinctrl driver");
diff --git a/drivers/pinctrl/intel/pinctrl-moorefield.c b/drivers/pinctrl/intel/pinctrl-moorefield.c
index 59f46b0e2156..2d757d1f7b9d 100644
--- a/drivers/pinctrl/intel/pinctrl-moorefield.c
+++ b/drivers/pinctrl/intel/pinctrl-moorefield.c
@@ -323,18 +323,7 @@ static struct platform_driver mofld_pinctrl_driver = {
 		.acpi_match_table = mofld_acpi_table,
 	},
 };
-
-static int __init mofld_pinctrl_init(void)
-{
-	return platform_driver_register(&mofld_pinctrl_driver);
-}
-subsys_initcall(mofld_pinctrl_init);
-
-static void __exit mofld_pinctrl_exit(void)
-{
-	platform_driver_unregister(&mofld_pinctrl_driver);
-}
-module_exit(mofld_pinctrl_exit);
+subsys_platform_driver(mofld_pinctrl_driver);
 
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Moorefield SoC pinctrl driver");
diff --git a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
index 77ac32ab9577..893f5aa15fa1 100644
--- a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
+++ b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
@@ -579,18 +579,7 @@ static struct platform_driver spt_pinctrl_driver = {
 		.pm = pm_sleep_ptr(&intel_pinctrl_pm_ops),
 	},
 };
-
-static int __init spt_pinctrl_init(void)
-{
-	return platform_driver_register(&spt_pinctrl_driver);
-}
-subsys_initcall(spt_pinctrl_init);
-
-static void __exit spt_pinctrl_exit(void)
-{
-	platform_driver_unregister(&spt_pinctrl_driver);
-}
-module_exit(spt_pinctrl_exit);
+subsys_platform_driver(spt_pinctrl_driver);
 
 MODULE_AUTHOR("Mathias Nyman <mathias.nyman@linux.intel.com>");
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
-- 
2.51.0

