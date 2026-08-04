Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021116.outbound.protection.outlook.com [52.101.70.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5271D47D940;
	Tue,  4 Aug 2026 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859542; cv=fail; b=l55ulDYdhVCkg7yIMx2ABCq/Xp48bvWr5MWKPVBIEw6y4djQeQwmOTtLSzm84rckXdM3v+vK/qcfufPFWm88MKDTyPFxnrxmACHsfykyHD6CstrDn7F0sednFeJQc7nMKt3u+Mfq7FePSGDD1FQ/C+8TmYLYubyi6czJoet394M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859542; c=relaxed/simple;
	bh=PpWwAV6qrt8eCCWVE/ZbEORjoXBPL+affWdovmaHNOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oU/c4Fgy2lwsAaLFs5LnSdrOUQO6x/savKd4J+1wsX4sXKLikXuKejbtZI8HJMvYxgJCCiHeqnjHhkN104zEyNExilPbYsQzsDdgzsHU1eK8RQQMwg3vJgzu3HGI1OJNf70gzUhduyxijFaB4+ghoAodDOWYZOKWywe+LWjMOPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Mkd640oI; arc=fail smtp.client-ip=52.101.70.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Mkd640oI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBT53iHbwiiGGUnYTCHZn2+x1L59EQiD0IISg+8XgTAaxGsZ/hz8SrGMmmSRzbfmn/8HLcc9fOSjJxbrvAm9UTnPIi9DNm1hO7h5JuC/Y544uCQMAyYR+V63zP73B+JeRD9WA22oNqY6AAQUDu/YPojCU3QEy2iqCXPKBCI88p0ZoxgSOug8ybLP9H1Okyj+8LszMGtFchGP49+7ZKoHbKeKMnE6OMUeaRWZNFSAzh4nqg6h9x9OUrrTszQWI240bVVlG7xp579tIqxU2UUGIX+h+h4aPKfp+a7HAuY/apBHw30zW2iielK1ZHBuaxW2QIMnpX97+WaBYbbuuKfPGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBv+gELBJaRjdkYSzHUjrSDMwX7kfOBm2SPdCKkU09M=;
 b=OFQFvewQLCuMG1wSFZiEfO0l2G43GMqxc/3zaLvayZO6qMMkgbKro26OVNqFQ/VKCse4MLIZBUS3qM2dL6Tdb1IR+F8I2WaKxt+YROtUN8L8XVwInnY4zbvxOPF57Ycc9zeOhKkX8MGW9YnnQ0TXFZAEwJByrpJJvMg0vILHzWKVT5XeUCoD6xD8+M/fwUzdAMetR5krrkmlzFBZGhOgRKm6PXzKIPcWHGBxtrAF7/fKUsUaKoxPIJBJdgsIFAXs5KZlbeffQZmgZ7vthdfvKOmuN0xk3LFRd1txjDxW9H8B1kjB/nNGzkqABzY5f4KjJZAkwPBzSODbbqRPTnrNtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBv+gELBJaRjdkYSzHUjrSDMwX7kfOBm2SPdCKkU09M=;
 b=Mkd640oIwcMVlp3BM6jg/Et9RHmQywGbylPfQ389OLW2Q8BMCwW8Wt5RdpqXHSWJAau0mPH491r8GZxc/cYzzOTOaPn8BOqGysli27RrotGaOBTUNZ3PQflqE+KidI7t6bCIBYg991vn+HEHvE0ZEwETS1f3YLfkYge83RGXZTUWjq9DLVk2ttb0PByPgk/MuVZg3YBBl1OHTkcEEdrqs/0W3BJoCppHeHKfdCvgHZJAeThcemzNaW14mppjRkKKKZ04Ba9VqITgPYqIsY3Zs+KpQEebRWcXFsBm/3l/3HP3VreUkMkADeJb+uJJ4fZTuiSGf9bRJNdrMpEEYsi64Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB10792.eurprd08.prod.outlook.com (2603:10a6:150:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 16:05:27 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 16:05:27 +0000
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
Subject: [PATCH v9 31/36] dt-bindings: pinctrl: airoha: an7583: add missed features
Date: Tue,  4 Aug 2026 19:04:14 +0300
Message-ID: <20260804160419.3592327-32-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV1PR08MB10792:EE_
X-MS-Office365-Filtering-Correlation-Id: 86011bdf-437a-42b1-8f7f-08def2423338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|376014|7416014|1800799024|366016|38350700014|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VQG3ule6gLLeGC+FhyoBe4ZigyMokS4brsMB0h1bRsvYATPcClbGoYT6bW8qhgCR6X9BfEkq/jk5n6HsdjMHnYXroPnYOtTdJQVXbtdgJgkZDuf93S+Q7wZm9nb6yhsX3TRRvAJwXfmGB5a3jRpvHm5btYegjnB3/R3osB945Ospj0/JQ5XCz9LHdCgH2lDhmWoOyReX3tGy7aPD2vz/pe/RFiUwAbuwR+jmL1DlQ2BAaLKrnVX0s58hNBCh4gGYtLU1bD6LWH/DQGccr6PdY77imYdofCD+6nNDKbOak9m1cyb0oYae+U62/o2GA23ejxkyC0dn0s/Qr2068LvjHmw/GGhQWj5BRx5Owv/A9OOuz/bc6BZzVDbc2BH6ZTVm1zZc2WWwvf7XLErEWPing787tx/njM4xXR2IO/NcYqSWKJ7IGXA6pKUWMbycR1NOCSvJxExvz2rmW17N2nMdWrqrpj3+7YbyIqlouxwPLTp7hq3ZTJIKSoDNnm/tYY8aLrRRlQygzqI1JSHyUhM0w0RfCU7JDnAJqprtwzM/DaF16ELmpSB+IJCgG60cDoOGLnZyiQwY/jhZ5mrVAhvWXwRztcC7bf22HKgQFwiQ77sCD4nzJyCwU28mI/Hek2TzUyTGVTErypK05Khq/tXcqwBh8ek6ZyrJhdTzEO5y3/qDwe8F8Lk2/RofL5eO46xP0Tn+OmQy7PJi+7eBHV/HAUmu+oWiji5JTCWxsF37jak8yI+vRSOzV2Icw37S1IZc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6Y/dc4OaEb9DR9usCCh4bQIdfWNCup7gTxgztQ75/1basPzDlWb/feQGM6Xv?=
 =?us-ascii?Q?cyWl+lpAq/L5uKnt7SCU3sClPbJ62JO+S9rmh5q2hdsQf4QyxxJ2/wcmkM/B?=
 =?us-ascii?Q?gKGMEKM6IrQfdhK0PwgTQ2Y3fv7QcC3qCsOEpCrJ6w+dNFvu/aInIOcpoUjI?=
 =?us-ascii?Q?CPVrCavhWggjUlC5ORgONR8cnMik9CpdeMaLtzvMMK52vT7JfVnqm+QFuLxJ?=
 =?us-ascii?Q?amPiee63npZKbB26nA8A495ECV3MkpcU7tS6p2Gh0wt6LjYgcHGaV978HvN7?=
 =?us-ascii?Q?BSyPwh2PJzS4aElBg6zjpo2D5BmC2WotN1XoRLX13NAnGbsYWc+JRACRvz+Z?=
 =?us-ascii?Q?rlDW0cLR8KTC9HMJI2Hn2lyhUEzo1WCxMP3nRm7+7mxwwR7yO6VR+Fue02qc?=
 =?us-ascii?Q?5uCu6PnARvAQ9LHRRFC2NEoF3r4XLvA2a871kumvfYCDlOOhNTLay3+msQNN?=
 =?us-ascii?Q?iFjDP2H5zcwlhX/9OIMOZDab2diGkj7eetS0U2IGagwczrttAVkmXLaBoNJH?=
 =?us-ascii?Q?Uwfdg3mgHCTj7lrYIZXAvq4+4pKmOOYkFBvVMWj4aoIxT6twCSzCFL/gBdvM?=
 =?us-ascii?Q?qhTuSesSXQPdWyuMkES98doxNicO9PiFQEU64GOSBGCR/6uz6Yj7D4wIZqqq?=
 =?us-ascii?Q?dAkFvZ1r4WcTA0jnGig1SgeTfIs1ntOyzdH/Ubg9JBqgn0TbuynWGLVKQBbK?=
 =?us-ascii?Q?6Tl2isJxisraSAY0ZMEeg7yv/u0ZJ+JY2Mys26FgDy/YHe/tKtP+G4zLJZjj?=
 =?us-ascii?Q?4GEe/ZkMvzetHWsnA5hE12uMz5x4yWvxlVji0JKHS5Ho2ivVFB/IEtJjjdeY?=
 =?us-ascii?Q?kpTmdy4+sHVvHHQ2uD6HZf6osJKmnOxegnUBxY4h1BdDuF1fGl02/wDHmK2D?=
 =?us-ascii?Q?FqAIG+Xgx0t2sdxrtUAPM7tmlYOa/VTwVnc3jj4Qf+DWYVlTvJZZN2cPBHcY?=
 =?us-ascii?Q?0x/atxl1ueDQdlNuDkg14sJg5YJ64O9n9GnN0czErPFdugeaOf1PwQ/p+ihS?=
 =?us-ascii?Q?chlBGee/7oCb1KnD59xk3gQKWRuCu7cFzFqFv6zHFjDddFU+R8tGoNd/HnLa?=
 =?us-ascii?Q?OImZHi2lYCm5D1615GZqeGjtBESh3OPRqocrx97MFVdHPsQZHfMVFBX3J+9W?=
 =?us-ascii?Q?rvzdBoWWdxv1AesbYPjE9d05/LfitZx6v5Z+kIb/P1sY+h8qTXLlB7iDkQIY?=
 =?us-ascii?Q?O4/wrs9kqrqoTjNxKBAY9D9GQGmm6N2qqRcyApHuaPCrLYAq8LS0klfhurKo?=
 =?us-ascii?Q?FBzPOuayFN/eWepbRa0mSPxMx52+vUi6Wz3ql0kmAPx3tDN7BgtOb+v3XrOF?=
 =?us-ascii?Q?TSysEa5LRl2fPVdS5lFgqrCO3Qyqaqp4mYoYbxKB3odH9Oktw2pyXlX1lTC3?=
 =?us-ascii?Q?+2foMLOysNm67sIVq7E56W8kLVlGxwowUe93s63TrB7E45PZkoEIplh/C/8C?=
 =?us-ascii?Q?QTpTIooS8Rni15qjzKvpLab+QS2Wzhjos9F2xq47Z8jhCta/epLGYI9Ww3fA?=
 =?us-ascii?Q?1T0WIE3CvwD4b0oW+bX2VGbmMvxhfcbgQgLciuyIHYhFXMq+aV6zwURLZW+q?=
 =?us-ascii?Q?+FFYBUS98p+3aNTmngRqAU0BMfMA9s279UrFBcCD/d80qK+MtcR15QskG3jG?=
 =?us-ascii?Q?1rKmB7ijJpWcjTTtBh1P0KUmxJkgUktgV4qhZYseACRSfGuv/roUSGXZ24Wd?=
 =?us-ascii?Q?bhpckV3ip2SL9rpenFjBvv6kIiU37pTtGl3eGNDa0Sokecyh6W4Kt7/xMPKD?=
 =?us-ascii?Q?3CGSvxJxycCkw/vtxwThDUOCAnVrGHM=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 86011bdf-437a-42b1-8f7f-08def2423338
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:05:27.6378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HcnvuF9+3jKdnAYMlDywTFqIcz97T3XZwxNyaqbduiRkhxJF7cSib95Ih2EUJPnrHZX/RAvUgJSVzVLDCojnPOEOR2xmASFyKODjDPuWiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10792

Changes:
* add i2c0 pin-group support for i2c pin-function
* add npu_uart pin-group support for uart pin-function
* add pon_alt pin-group support for pon pin-function
* add support for olt pin group/function

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml  | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index e2896db7740fd..4609cc76babe6 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -60,7 +60,7 @@ patternProperties:
           function:
             description:
               A string containing the name of the function to mux to the group.
-            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
+            enum: [pon, olt, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
                    pcm_spi, emmc, pnand, gpio, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
@@ -81,7 +81,15 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [pon]
+                  enum: [pon, pon_alt]
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
@@ -115,7 +123,7 @@ patternProperties:
                 groups:
                   items:
                     enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
-                           uart4, uart5]
+                           uart4, uart5, npu_uart]
                   maxItems: 2
           - if:
               properties:
@@ -124,7 +132,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [i2c1]
+                  enum: [i2c0, i2c1]
           - if:
               properties:
                 function:
-- 
2.53.0

