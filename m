Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021121.outbound.protection.outlook.com [52.101.70.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E1D3E2ADD;
	Mon, 27 Jul 2026 07:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138196; cv=fail; b=i/wdJd0zd6mHYIDY8IMJ329QhyUlRiC+xiHSxmXJYLBVgLOa0UH1pAjsU/wFjP8RWDz3/9xdwyZZslfBCNsrbNHdW/xAnbZSE3h765ydTPSrgsCZLSzIzXDnhYrn4p3gnfZNRj6fwBNe92YWWkQVMu4AmRLQg//Jhf0FSU4GNMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138196; c=relaxed/simple;
	bh=mDgje1mlBqgI0wDUFRb0s4y+xFszhC8loW9JnaiZ/1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f8m0GJk4VAV+B5+7bf++1e02SPCUtg+9RpNfKRQz7Di4knvfdha9YRNS1sKiTNAY1aH66SZLEaDgYAmEUW9xcXnMzRhQ5hCfEG5OA93nv1zsRbP3+FWfOff2LgNVKxOlR+hexSTasARWaCrrdlbc8DJrRXVwhTI8nYXuxiQ2+EQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=CHJXJ6MW; arc=fail smtp.client-ip=52.101.70.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="CHJXJ6MW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ca9wtC/M5+e8TZraW4GYKmrW98e+qJpDiiQ1NtIohhe6zjwvfoyKjapslW5GDV6GOyAoLYZ2ruYUdJPp5GEv7E5k7q8k/AyJNpCA+BHDLpHX4wyo+LapKpxAMD0TvfEAdo20KZ3Ar9Seff4iETgcxYcd7AlZrlDtoF0MJ6cnLc1HBA2dmOgjQXsvOOm7fjTN94heq1P0gTB24LmSvwnrBiChIyWuWKe6RNkYRa81ersTAYrULmK8hmztPKMceR/VK8CFuDOmzq0Rtjhrl+teO934Q5XNd4PdORtW5vYRXOefWW1rWXxhbQ7yr7SAJo4ieFWAxKbpQpuws4E7+C2RaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnrr1hT6xHI1xZrSbHJSnYKZgf+yBix8aqKG2iRKuXw=;
 b=TUnxM6BY/d7PAd2oM1C4C5OAMNIee+8HCmjFffHMBCDiJFQyNxx/DnHz0f0RnRlhGld3+hLu9fgY+NZDDtTKqhpUYtSnxRvPmozGkaJ85HRdBobD+vMucbST/urgeA7f6QA6d2XLJOzKjnr5F/shi+U6ztaYwSCKxRdBGJDj4dwfrV69oA2Xr46anOJb4Wz7pXxYzDrJRHHUE9VOiNrvzCY5uhXQTj/ZbFWu+o9SooK08CPCC/SoT3MFekaCfcQSHnGZAmxibgKqZ9atiX84Y/s6Viao1ldKUJTG0kovH71y5sAthLjAcMvqJT+xhoweCIi16P7DnvFMjeixTd2kJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnrr1hT6xHI1xZrSbHJSnYKZgf+yBix8aqKG2iRKuXw=;
 b=CHJXJ6MW3y+S6Pnmay7GZgaHGxVA5ExaPm4k8Q1hZPmaaQk8oJsEoX2fSoLc2+isC/1rVdwKQox/e9useiBgP+u1EEa9KLCPFEmspFqrVYGDZEDLZ1Zh25dWk/omlGmK2zmC3ZQSqxaIoGg/gCdY8DkQhfos4fVs2GogZw0OaClnh8Q5WxBWuIXTHDrUFQRynY92+umhL8mLhX5Tv+pP7ACoZfbo6n7UBHmdn93DKdakrDWwMGmzBZZX4yzFr3CRjpT2gBelT0SdoOlKgMX85FFLNOBH93PhVGOK6F/32ygAMhabtezM6RC3cQAVTh+5YYCvVZUuRoYwWrhp/0ZSVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 07:43:05 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 07:43:05 +0000
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
Subject: [PATCH v7 11/34] dt-bindings: pinctrl: airoha: an7583: allow configuration of non-gpio default pins as gpio and pwm
Date: Mon, 27 Jul 2026 10:42:11 +0300
Message-ID: <20260727074234.3761170-12-mikhail.kshevetskiy@iopsys.eu>
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
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PR3PR08MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b29109-2497-4fa5-84e6-08deebb2b17d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|11063799006|56012099006|10067099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	VkxoITFU8XFEfc4EU5WlUxpJZQ5geFcAKpyQ88e2uLZwE8Af6RYjGVjcD7ooRdKTS0vAXiqmvHwaJLmE4BJscVs3Jhrr9I4jijoo1waWc4sR1lqPhKTG00ilsQiS9F/ZX5/QCfHQuQXFgmDHsVUOXe27i+mdHeQNLKu8km+OLLRra/SRBNa6VZbemLjwYykv6tk8i9dJ4H5CslKgEu1pURsk190B3RnJ4sbeIObpBdGs6CCOv9WJIhHwf4bjyZb8xy1AMJav+96N70/hXY4PZe4Setr8UupSxIf0g2MBLgPZi68W8GeMf8/vBraUd89CWGlu4L+JVZpKk0BOiuy62BwBdvchnLb7eIMnC/VVgshRDjcJOsycCFb7Iz4d09Wz4NJlpHgDO7jF1oy9o9IFd7H9v3nz/RJxuSvteohMGfW7K71ik/6VUCSTHf/pGcp0BuQaNqnzj7d5L1AdWkTFlE4gbJeFg5aqQmi26ByNtqCpzlaXCXyDPO/BZQJp4BWIkzQv0+3mVi5ocybGUYEUKVT+s+SsCL7M+AgBmh85PVqa/yOJ0ESZKdwnQjnWFcuCWNePwQZV4dxKjPEFnS0GhLBGJ9TixRLr8i4TsqTPJzPaayQcMHPkE9bu8kKmyLs/crwSBnzvwTF054ReIF2E4QhZkA0808ZYiOrEiAdcB+s9YTYdZteHO3JKbRHiLdvV7ACCPw+Rflf3O3cVN7G0dm+5loltOZ0Jw4K4pA0p/Lo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XOC7u7K9Rajaj98wgBfmqlB2LchygD4UD90GVO/RW+Bc4YMCdFjs5Rqx2a4S?=
 =?us-ascii?Q?JGlckOuONX48bUw/97l9xGgYXSr99+6NwWuOwn4eP4md3ElT7P6MSxwmKfQ7?=
 =?us-ascii?Q?RZCbTv6j5+WGJEZLy4GudOnp1IkerbJG+QfwQg7iNwBrSutF71atKy80BQdE?=
 =?us-ascii?Q?CF3RAHkggJMLbwzmtbFd8n6SJ+s4p5z9SBfJxbO8c8UH6v5VcBmKSrQEXoLg?=
 =?us-ascii?Q?AD400DfwFsJgMmCMBEmcFl2m6lzXqEZaaHiJs1bCjH3q6988pOR7RRtao2bJ?=
 =?us-ascii?Q?G5OLRyRP4/8Qf3xebiflxv6kWZ9YJ4UN8QViTpWgQ9khfrFL3CPUoA8A9K90?=
 =?us-ascii?Q?8d/8QB9qP7mjbKTudr8aysINlxnkd+DIQWKlTsXR3cdLGjoymE0zHu+EInUJ?=
 =?us-ascii?Q?Z1fR2Q/ruEFKekfGAM7D2APrsVFGiqAae0M+Qdn8kdnJYSh48jn7V6HnSRVY?=
 =?us-ascii?Q?6FOV0iIEuIn1P8kGF1QR35eFcsSlK1r2kJHHWPidlAfKdxy2CLcOFK94w+IA?=
 =?us-ascii?Q?ATobzPZ12X3iMB1U4yOCGa2H+CxfFmuvYSf2QxyuKwRLwYncf/KEmxNVPLlH?=
 =?us-ascii?Q?VuPtxQqR5eWrPZvaJJKd2WshkqQBkWTcExTiq8TW5cUpKEb0ifo9yd4IawwQ?=
 =?us-ascii?Q?Vx5ZIoHIEn5RbD7z0Geg2j4eseKJ2bg0+/WZaEYo2wN+vfKa+nX4aitWpSZL?=
 =?us-ascii?Q?snI6qb/LfjsLrSPVi6x9furds1dGPbGapQJ41pdzcHRN5XRIl15MGqFOlg6Y?=
 =?us-ascii?Q?5agqnNVIihAoJw9LaSd41kx1mQNHM0B4lcdR7XyMnlfhN68pTSuzCFPZfYfF?=
 =?us-ascii?Q?aOuc8Up4giQTqnpY1q7Pb1LK3SMbhBY32bqFtLwvM9CbO9827fvuBeAITbik?=
 =?us-ascii?Q?RLH8mjwVnJsaCeClIGroU/iF+CmDe8mJWXX58R4JGDlZ4J0SnDwV25Xi9Th3?=
 =?us-ascii?Q?vAg6A0PDiyo6qX/6hM+LYCkq3Ci9wR9n3J4mwN4OZbkbdz+OPujuRUUblN8j?=
 =?us-ascii?Q?RYnaJYVZzZ3+mbow1h2e4MprgxAb/dKoOLwXVH5KkLsQoJkKd3iqTh+GT88B?=
 =?us-ascii?Q?2OAGqPt+tWBfQ17Zpd76Y0cgwxvmi+f/zhK0PwWEHp5vZfwPTevmo9BTOTLk?=
 =?us-ascii?Q?4AM25cAE39jwRmsKBXYttUyw6LLsl8omnGvTEYMdDgZJ8voT/aaMHmnEteTI?=
 =?us-ascii?Q?6qKSV7EEXmC9mXK22R3/qlle190o6qSsPw0sxrav4qC9RCJIFI10yaguWU8u?=
 =?us-ascii?Q?v1bVZwQ7vlIgtL2k2GDJj5nyRvI21NeESONSGdjsXKwory+fMxFmq2Ynkg6l?=
 =?us-ascii?Q?7gx1XfR9GlRDIVWVY1mf6UbaOPiZoK/EnHgJWLXzBGu54J4wgr2jQh2+60If?=
 =?us-ascii?Q?GkUSb8gR/f+gcaIc+kUqpTJVJL4CShrhpZhZ6HHkWNzNRPRa+/gPtd3L+nGz?=
 =?us-ascii?Q?7VREaByN/nO8LSyD/nOoCcG3/06b/ZrH0SkoLClFrDxMVtlImKoQyidSyZ35?=
 =?us-ascii?Q?Z+IGA2IK0rFxy0siEUd3OIdT6swzLnR01Ef8LtnM6zoSKoa9KSX5rJt5RLpa?=
 =?us-ascii?Q?Tu3Yjfj/r4GyLcoQX0EL3c3k4g8rpzElb29LMcwpkmIdxuFcw3oDhGsKiTO3?=
 =?us-ascii?Q?VRxeMi4YdwlV4fcMdfg91pw7oQu9nfkD1n/mArAnZBhCjKI8iDqdFGmFidWQ?=
 =?us-ascii?Q?orLBaEprQoWvs2UUuDlK8PcLZrTA4R4ZNu+b+zVAdK52FA8A8vOkEle4lCsd?=
 =?us-ascii?Q?SFNu6MaiAoBDprI2Gy4GhJmw9MKx/Z0=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b29109-2497-4fa5-84e6-08deebb2b17d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:43:05.0646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0j347JXpr0nZEzc6+zZHnu2WK9OOJxUVpds+A2uJ3HOznKHKj875vDTpabl9mG0YjwrIe7xNLcX7yEpFaWD9cvO5NCJeO7gFpXrfzSNxpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868

Some AN7583 pins have non-gpio default settings. This patch provides a way
to configure such pins as GPIO or PWM.

Please note that gpio52 pin can't be configured as PWM pin.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../bindings/pinctrl/airoha,an7583-pinctrl.yaml    | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index 8d8ec6adb97d1..bedcb6374f1a0 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -61,7 +61,7 @@ patternProperties:
             description:
               A string containing the name of the function to mux to the group.
             enum: [pon, tod_1pps, sipo, mdio, uart, jtag, pcm, spi,
-                   pcm_spi, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   pcm_spi, emmc, pnand, gpio, pcie_reset, pwm, phy1_led0,
                    phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
                    phy3_led1, phy4_led1]
 
@@ -169,6 +169,16 @@ patternProperties:
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
+                  enum: [gpio39, gpio40, gpio41, gpio42, gpio43, gpio44,
+                         gpio45, gpio46, gpio47, gpio48, gpio49, gpio50,
+                         gpio51, gpio52]
           - if:
               properties:
                 function:
@@ -191,7 +201,7 @@ patternProperties:
                          gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
                          gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
                          gpio42, gpio43, gpio44, gpio45, gpio46, gpio47,
-                         gpio48]
+                         gpio48, gpio49, gpio50, gpio51]
           - if:
               properties:
                 function:
-- 
2.53.0

