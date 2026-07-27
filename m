Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022110.outbound.protection.outlook.com [52.101.66.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C43F43991D;
	Mon, 27 Jul 2026 17:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174145; cv=fail; b=taPOPylAfnV3qyMzsyuz7vb8edeEe/Hekh+Ei/wwsBAqaTMOnRENDG++j1e/EvN9oGySDhAlDZl4RMQFTkaAVJ6M14Bekh4SeKSg5UOD4Pc5Iev8dCICAlRwm4LbAXVQMZbft4W9MhM2cQh1CO63cMzjfEW4ePA/GtkHJm/ME+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174145; c=relaxed/simple;
	bh=mDgje1mlBqgI0wDUFRb0s4y+xFszhC8loW9JnaiZ/1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fKeivlK2fxwLnNSWDmVwABnpiWEd/YBhaHFMJyaFRw7ttqaz9hbzW8W07tCE04I4L9tUra4lGT09bs5ltajvx0RhAi+XIXHMFMHWMBIOwEV88VZK8bYtnjStF3JXQU3gtMb9kj25S1jSHH/RD3Kqg9VpKv4ObHh/BsPcDTDRXkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=Xkysfl3t; arc=fail smtp.client-ip=52.101.66.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b="Xkysfl3t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSprtlUbmqrhc7vegQmpw1tqod5xU7RIlqtWZB8L5rB7g6EZ0Ybq48WmqnNSCHmorxHAi1OqeRSMfckIhGX/HHR0SCKGgOuY7HcZU4eCL2/dSrVQ0zpFdGtZT443AqJunQBPewQGJs5LxMGFb9EBDT1iSACQ/sDAxGstj0iGHLbtc46fX2E4zDP0v2q88PUGTbNKCvhMlwEKSQ5L22MESqc474l1RoIfHVqczPpYRvc4ttm4dgryblasL77RZ2eur5hi1Ds71AEH/6aZXZZD/ycyvtkKG9a3KpmGiYMgTCa9LltwUhkUkBw+tQVA503f9tF5AGpIwlycyw5s8ZhY+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnrr1hT6xHI1xZrSbHJSnYKZgf+yBix8aqKG2iRKuXw=;
 b=G2A/zUyAPAVQyyROpyT7d/ytqznh9Z8KQUaQO5DaaCh/RwleZx0gGJ+CxePgTDIAXGgScLuvPBtsapUIhkZiMIEg9hbG+jvIk72aC1TxKHSTnFYZ2LrkMm+MByRPj4Sy9P+fX3Jv12onppDMW6CC3NUjZ+Xh3EhMhQEG0XNYhotHir3B7chTILDy8AaS635Rz13ux+M7SAywOQ8azpVNBuET8zhMzcye/ng5f5HnV8diz0FfS1gf3mTzUROmMWbJdq5cjg5FRjYm7vkKKA7V9hfWVjwDcPWGO054Wc3wk2W8/Stzqigxs3UOSkxwtm9xGPJW9I0S0ZzTQea0wtGFnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnrr1hT6xHI1xZrSbHJSnYKZgf+yBix8aqKG2iRKuXw=;
 b=Xkysfl3tneAFQGvPtIHDDw/8tqQVqbd/3W23biWGsIh9qAX+2stznxy37UBi+xTXBERHSPGxbNVeynYnHGLz6y2TAABQBNn4Vvkoy+EqhteMJgo3CCr7ucIXh994GSfOYmE5GU53/2IJ9mQzz7+KSEoqWOmcjzgp8rF1iifgOET31K5n8ZdOvDUpVnaFqDIUh3Lunr+KhvqenmeFU92hbuiNLGtgloDfquxx2L8hF4h3/LEL2q9auMEpyWBnETQKRJuqX7lu0K5LC5FI7iNVKdqqgVXAEnBD7Fv0eGPmgCHO8HnPQM53uTRca/JDee6obHvgs/7ujSmPh1BzJeiufg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:42:13 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:42:13 +0000
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
Subject: [PATCH v8 12/35] dt-bindings: pinctrl: airoha: an7583: allow configuration of non-gpio default pins as gpio and pwm
Date: Mon, 27 Jul 2026 20:41:18 +0300
Message-ID: <20260727174141.664933-13-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0064.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::24) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PA4PR08MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef0672a-4a49-4046-86bd-08deec0664a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|23010399003|1800799024|921020|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ZdFYD4kSJceUpbleIlpkqwbHJsM04KG63hDMQjrPXNhpeQWiu1iWLJE2TZk3ZffK7VsbzLOx1vtIa3xcDRreCQ+ZzrX1qs0Yuz5VPFxr0gPu7pMaQqH3/lIZsS7Xo5HbtKN48IksMwn5oQdHC1SCn56BgS0Nf7JtiaivxIa+7vqRUHgE+0vFCXZ66Mj1474s64hyZ/hcyfpwlKWzuxYx1AlNd8mO4LCuTt7gKN9LVX1O6DngC/Z57Tfcu9C9dOrgnfxVPpNJGya7OQ2yMJ4pwvkycYB4rICN+8AxnAWv5PPpt6ablt/Lak3Pe4Tt9JxiQ11uZECV5eF284CVGMPZP8lTpIVRmjO4GCQC5mO/lcdMyORrOBfH6Kg3cPQDZnFsGWTHyrgsJWbW16JwdvxHhtufGx1R4Mlf6s0Xi+zPoSRY8fUqZ/5hGojJB5ncKzd6CEt2nThMdiP2ENB7KqoZzShauqYo+sj38fDRTVgBJzzIvShHtPwqyXj40JfzLgaFULtP6f/5bX0OPEmROnN+rVGKVgneFFgTQhweTi1WiRh8uKhS5PrpaRqwVyp9i9rN0n/k/CO254LQs3Xb8qkK1GzCh7W+LeNJvCxQNTIdaVdVnI8uEJeCBgaFFiqP/j5A4d5YsbNXXbXiYBKNpSEhe6sOg78J5fH5TR+rnbo/xFvsZnGWFlfMFlaww8zlQyULKdmn1RePJVq/VZGmLq6XVBaLtb/syqTw2B7HlKZsYa3qbOrJ19w+DEKzFkMaCQ/K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(23010399003)(1800799024)(921020)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/m4OJLsvF+7CFoWVRyU3UL4g6O65aLKRDEoz9ROEahzNVnQ1RuXHhNmrq7H/?=
 =?us-ascii?Q?XYnqjOhJhfTnXQXrM4EgVgMIjEDmW83ma6HDUrDtoRo3VuJ4YhRTK85bANCX?=
 =?us-ascii?Q?FC09LSj2PxV9usnRhq85h+el8/KQkZ2DIon3zLXPSpsy90IisFhtqAZkD61r?=
 =?us-ascii?Q?JlGgBp2L3NhLMpIQzDZhXYIoMcrG6Bl7HH/8vNu5PKN9fOzlwk7Vk1YGUK0x?=
 =?us-ascii?Q?NOA1n/hjAob4Xcvb8LzQffW86Jf6kZc4Q5Evtgegh57QBn8z1duGJBM+s2Pk?=
 =?us-ascii?Q?pHxGm5bx9mSD3lPVX0DS6FvXxlhEE/bh3ilc0wO3ithqJT94Tnlg7r7iV5kh?=
 =?us-ascii?Q?7KfUC4GWty7u+dBakjB5fMr4mKFPAn5RpXEuF9NovqPa1WyIiWfYnlC+TMiw?=
 =?us-ascii?Q?mWPHhnbwlqnlptb9/lLmsrr2d2lr66U6aS5Y96jGchJlR9ycYLSyE0H2cryL?=
 =?us-ascii?Q?K1zqCJsSf4BsIPnpZe2+umnNyoU6TsmaMmwUTDIuy7W16urh3QTHw1QfG5TX?=
 =?us-ascii?Q?0ErCujImvySSzDy4jI8nxnL6vJ6nro7U917lMZf3UjWth3ZFvFWGAdxpW5d0?=
 =?us-ascii?Q?bBT4BqfaYKUde5BwtewgtrcFmGStMMXG/c8pSw6kqn8BCfA3HRQMP5BANN9+?=
 =?us-ascii?Q?CvzHrY66vvq9eQc225V9w+8mqe/4wBgtfcm5EcFfl/kBIbLunQacnA86Tvh4?=
 =?us-ascii?Q?BM2zU1n8CVZ16Pn1WmLEomm6LPeV0BydS7MQYMeqczICpry36zd5OX+6cZPq?=
 =?us-ascii?Q?En6/3QvO/KcQaq9DBXOVWFCtSxb8wrksuaT+v0cmA0/uHLBtsG9xhyZV+idB?=
 =?us-ascii?Q?JbWAVQ+pbkXQkLZDlBnwEmhCH2Ulw++L6jQJWw/+cEwUv0jQbOml4tuxgZ4E?=
 =?us-ascii?Q?gTboiQsxMI7RsSlGVx8/ohp5IB+61TIB0HDfYDO6ECwwwLaOshKp4k6uTAHg?=
 =?us-ascii?Q?UlwLQHz4mb7lMU2p7tbUG6UeT4uqq+X++sqgH3361ooUx6kiT0yqbkNZ9O7N?=
 =?us-ascii?Q?r0q/++/R/ANmYBdsD2zVEBKAkk8pdkOdcUpo9yBRCNFJy0o/oJtzGGgZpbFW?=
 =?us-ascii?Q?5MeXqLZM0T/ljjvLGEjmLRmysgQ1aLk3xzcTjtGnXS5r92SF4aDIvBYX8kEv?=
 =?us-ascii?Q?qfQwIPLcNBirBw7zZ2gMZ0LspiUw5Wgyn4VdnQid7nFgh0CWHkwQPN9emEAF?=
 =?us-ascii?Q?aLsFNOKn35C1SQWxaWaql+HFAk0JS23SSiHVuYqBPrmCLvmjLOjyEzpAhK32?=
 =?us-ascii?Q?HKY9/p9D0oDNaDH1UwrIiZM/ojEe76KqLhwSrBK0gMT65lB0a7w9lSy0aivc?=
 =?us-ascii?Q?loSWoEagHgE5DXq6ECGw33ZunIPOmQTE43Za1Cik95uYlleFFitUos1NMo2P?=
 =?us-ascii?Q?ybLrxUcwgnuR+/WtL0i9AHqg8afueeOX3HnkfPCbvC2KetkYXT8H4CzEaMN/?=
 =?us-ascii?Q?iTp3jaorNl2voAsRUS6YbJl/tP82JaJoUfFh8lnc9i+l/sf60HNA+cO0yNab?=
 =?us-ascii?Q?kSgZSxXN/Vdn6FJO9bQrZd9PGgI3FVU0BbbQQJizuLdiWRS/iotvYJDMRKFr?=
 =?us-ascii?Q?MbbN2XHi4jejh6vBWcNB2Lb9jJmXk7Hyo1rJdyOElSBrOOmzdNqFIGBj4zBN?=
 =?us-ascii?Q?4IYykqRjz1dAkIm6njIpf1NX3ZhgeyQS/xHEVrB+2dlqktyXsjyDbi3C2MPU?=
 =?us-ascii?Q?clAPLts0XVi/fYFyeK5iaaoJzULzsF9PnVk2ap7YB8F80C3h7GutRIajWs2P?=
 =?us-ascii?Q?poyodiWs1j3J4cAofTI9EqHy5Ney1kY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef0672a-4a49-4046-86bd-08deec0664a0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:42:13.6786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frADVyyzjyOuEBngdHeZIcdN6eiAKouY/q27OTV38apMj9SipUJWKoXXMtijgXF+Nma4RGVe9XJExOvhTfhBCgftOQC5RMq5QZ64MxAnmIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

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

