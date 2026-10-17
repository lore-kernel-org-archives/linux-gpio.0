Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2138.outbound.protection.partner.outlook.cn [139.219.146.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3920B3D5244;
	Sat, 17 Oct 2026 05:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792214841; cv=fail; b=JFhwb4i1iKk862kTWvxL0u8mdYPFEIvGI5TSZkqfIqtEMyMS4b2YY8Zra7cSua0aKk216MqIrcVuwSa1zRH0QMBqICeJc39imNqn+VfdtInj9Z1Wnw1ZB8CUiRYHO6JReDD6ugBJNWJByIJUm7K66hrWcoypwG8uethiMVsNF+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792214841; c=relaxed/simple;
	bh=mYYF4+1nn6bHW+os3sOffGreLB4kgZFqj5t/Q0TtOrU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BSyptK91+5Va09aCeDoMgB5UiDBtCfSUKr8qPmgW52FVXfG2by2DW/v4DaLEn/ImJmCnsIHo4ug0E5Kgnxbo/bKe9U7G8jxaNUdZYt89KkMlA50fVzHVEA0P44tqs5jWe4Lq8HuJBI2HOE7NhQCDAo40vhcjSBKjSgt+9YiP0OE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlBpfdjK/TrrzmXTvrhHPhWcUZLTZByxzrAalwuC76/nT5Dl6KKlwcJdmkSZWYabpqpBgyBvFQFjgWSfM4wW1ggM+XKeLLv97W5PW+bKYaYCZ5bSkwal4YO9fVZfALP/GcpQHhXDmUuxem1YADwouSc3spX2GSPaLhk7hHwOKq0PJ5pYeX8LYeLVZqoAA/dflgD4x4FCzlhfQE9MAOZkRsZbszSVAscDYnxrp6bu+eDIXIrCYhTk0hmhKCF6H9deISUI91JUN3p95+taOAByo+Us1VvQPpn2MA6i+nb8OLUR6RWuHsm/zqexZ8olfcb6ZjW1UEm1Hqi3bAJdUsu4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idh+gxIuL4K0nXI2rDAIkuhcE6KD+dzgvYIOhapZ17I=;
 b=naHZcp4dkd/M10yFAbG7ByGP4pDcsZ3PSMjmYVxxkoyXHS1k3MNooED8Gbxv+OBhdAlJXGkXTSmE7dbqqnjx8MeDdCFrcooiv+BjeAxcNWuqFKKwKmMX0UOU+oQOXytiDMhuh+LZIRCkwtjJXjqw7lv3jg+hc1iUdYbYAAfB6iCRxhbgL8Uy7K62+KXuoS5U/eTUKKnp7nSTyJ7X9ujRwPjyFDrSC9ZrhiZwAN118IXMyAEARrgJYaCbJCHHLVGTtXDw5TTIGG/y3HWhswkuOV7j4m5upU/GIpkXmINRBGQTqvGERLCUzzdRYiK0vY/xnlrNlhL/4iLLdig4pIRmAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Sat, 17 Oct
 2026 05:25:47 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.016; Sat, 17 Oct 2026 05:25:47 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 5/8] dt-bindings: pinctrl: Add starfive,jhb100-emmc-pinctrl
Date: Fri, 16 Oct 2026 22:25:31 -0700
Message-Id: <20261017052534.115203-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::14) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fdc6a08-cf43-4ccf-93aa-08df2c0f1972
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|38350700014|56012099006|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	3HsGeaOYdbK2KJJNcKtDfUVa6X2L86DnZMXQiGGy+yTyzlg1YLMPCXrq7bZm5SntRScq8tgNBZoiQ5YNPsqmQ/FoZFBA4ai49YEmzND1Oj7V8ocqdRb1jPXpOL65iuREuKn+P9L24rU7LihYEJTMijWAmL1asB3CTQESTm4MgDNazubhnE7SiWY5g/WwPRKZr1zgQ6eBr/fkVqFjCE8BqPuOuAmyT1zXmcwMSxSWATCg50IpZiSqdKcIfAs9EJa85l3zArb+O1u8/O8QVJaOd6Dquzq0n01y9tUa++dHrGd1OshHKvMYw+0L3TPq5IncBqN9FNBz3fbIFdacKr/9Y1hLJCd012mKczRoRD/xCOJtqAWgMoxZf20ahI0N4sFHKC3Z+/+sq2xAnaf3bKuqnQ959z7/efnP2P7IXP3I7WS65hHInxGwzGMNbvIJMY18ruDDcgKCh1y3RPLmGUy71RJifX19Er1dokz+Yz9VTZef0TYL5CFBoXWSFJv/dCXsDGlWwkVR9SmUWb97EVLOHUIbsBpH8BQ7JIODbv5cGfsFSxlEeb3wyP/nKz5uDcAt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JjetZLwKlUPqK1gYpH4K7OxJ71Vz0mFdzOHkWvtwf8Qdu90JZRuKGQPVprj2?=
 =?us-ascii?Q?MdRD+rNGdeGlFBydNRJ7cnJfgrWejYjqjYRh3g9Mv2clmqyiOZ27fsMpgueG?=
 =?us-ascii?Q?b0omTFLKjIGopCNzMmQ9m2Yn2uDIDsEfnVU36/Y69rdk4W7pbSJwk3tMoApY?=
 =?us-ascii?Q?uQMpRgnIXB+FWN9MnKw8L3L0lfBK1L/MlaJF6lDJAiL23jo3SE04KHJ7oWeH?=
 =?us-ascii?Q?p0s4TF7a2NVBRcdpzRBbuH/cAIB5beL1ceWgf9/OqR8h/glyWkAcS/o47nn4?=
 =?us-ascii?Q?98pzHq29LGIuMQxwnFSmFXNZBWtufE1HJNcqw/jSEGZV8VYDGGSDRNR+plNN?=
 =?us-ascii?Q?9+YXwB1ZPdZpLOCpapikqIiOk1xrmSJ1+5ZzpPHl9x6HciL6pH0OSl3c+pST?=
 =?us-ascii?Q?ZDXkQ7ZLvxdwiHBxvUkxecCdEp/H2m4JadRZN9hkKVm/0j1Xj39vkNqjW9jL?=
 =?us-ascii?Q?n+b61REii84rUB+aNP1FKUQyPpWiMTNoxTzWAoks4R1qmHDYDedrHgS1fp3A?=
 =?us-ascii?Q?5a+y33BHI01AF3qXpervQClPpZFngQ9XZ3+RlUnVgmD1hy3g/Kn4WCxhUU0U?=
 =?us-ascii?Q?DlgIiMJbshj80IBRI/PLCQYuiHxJZG3hMFt/raHAjnCryiR4VScu0bamyyP+?=
 =?us-ascii?Q?FIbyBEzcIGU9x+Pd3v2FaD62OoZIMWqxJw3DJ7HvYDyoKk4pKN5+Pi0A3FD5?=
 =?us-ascii?Q?LQ/FmUIRCjdkQQLcq/ovFaOFwUlV/ItT5aOwew414brpJ1fwJI4D1EZmBw3U?=
 =?us-ascii?Q?K3IfzNm2up9IB/qDZJbDTlmJB1NuccJ1L0GrAifKBpWRhy4Ut32wvJKSOQ1z?=
 =?us-ascii?Q?uaJxlTOwzqSFXZV4GHnFUqiy+NM1V3T0bFol+h8EYSgGq8tGSTbguYlts7gi?=
 =?us-ascii?Q?jIXY8gAsME1F7BWwSSFp7MvncG2FYn96cj2w6ce22CLSZU0SnjwUxN+IGgOm?=
 =?us-ascii?Q?bYRRNmWlsm5zGBA+5ei79zPdL1WZpQKS3gXnUwQcWFEEE6G5sodHR/Q72IYW?=
 =?us-ascii?Q?PZslW1AjABuYLeOg+nBORzr/hpiD/R+BozAfRVOdYBwLoXcR09DoMjATtmPh?=
 =?us-ascii?Q?N7hNQxUJA0WwrfCraBKearMfH1IjvIaJQ+AgEUXYNt2lpJMJaRA+XC17RCJz?=
 =?us-ascii?Q?5RR1ZnOVs49nMzyx4eKGQm7OApYc2EH2T2uANoABwNejhoiPOUnBxrwDaPN0?=
 =?us-ascii?Q?10l13O5PpP3Ujaxg/Su/rauweoeq3e8VKKFB3k02fH2JA+4caED+og1KN2sR?=
 =?us-ascii?Q?2fM3X38YdV/ZCeRsxhCI3yX7X6kgHroB4dmWufdtRW5SAVSu8B5BwvqRlQ3i?=
 =?us-ascii?Q?J47Hz7g512Pkoy3mx/1azKL/RSxhbxCuLUcskWm1WeQn+MYeP9tJzh5uVu/6?=
 =?us-ascii?Q?ESR1Lx+CZsT0Jfcc8WV2s49TBaRG6UqSy/FTrd2orIu2V6VT8BvDjQOnZkZ4?=
 =?us-ascii?Q?lB6PaEeMFpiYRe60eqq+0LDc3EJpMirNXqWh7UaPUGA7jCj+RtJbKEqZ3+ms?=
 =?us-ascii?Q?hq3K9V24m4RdAI3VBAJG+WnJ31lC5EQYev4G41pGd7Zbq7sjwdntipJJPBg3?=
 =?us-ascii?Q?ij6D94q0nKJpy5C6fKf4Qu1QZYGbLnWdyqseZQg4SyYtC5o1amZczqgb4e3V?=
 =?us-ascii?Q?QlmeTVn1TUe8OB9mDQAiS81/5CmuPwtQRwtecHSnTETcpkSmLaWXf3HLilFU?=
 =?us-ascii?Q?s3vqT3oxTyxWng+3j6evvEvY0Ck+8LaDBPUi68CdpRrY7uliJ4C0i2BDJ+mV?=
 =?us-ascii?Q?xI7NVuHPq+X7FRNr3zQCEaZ5ldg3y0rvNQTpgal2XjlRrQvbtScD?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fdc6a08-cf43-4ccf-93aa-08df2c0f1972
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 05:25:47.4008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jn5QQb+sdNxQUqoz0Iv2cnYtJQWbeiT/VEXHE7RoBFptZoi1K4VYQxj7Ha0UCvif/fs4lal1sPUKKENlUwUrxt9A6HD/sOTZXwh4PuaypmTMwpcKlbnsiWYnbRb3QX81
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

Add pinctrl bindings for StarFive JHB100 SoC eMMC(emmc) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-emmc-pinctrl.yaml | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-emmc-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-emmc-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-emmc-pinctrl.yaml
new file mode 100644
index 000000000000..4533209d9965
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-emmc-pinctrl.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-emmc-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 eMMC Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "emmc" pinctrl domain.
+
+  The "emmc" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the eMMC Pin Controller, there are 12 multi-function GPIO_PADs. Each of
+  them can be multiplexed to several peripherals through function selection.
+  Each iopad has a maximum of up to 2 functions - 0 and 1. Function 0
+  is the default function which is generally the GPIO function. Function 1
+  is the alternate functions or peripheral signals that can be routed to an
+  iopad. The function selection can be carried out by writing the function
+  number to the iopad function select register.
+
+  Each iopad is configurable with parameters such as input debounce
+  nanoseconds.
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-emmc-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges: true
+
+  gpio-line-names: true
+
+patternProperties:
+  '-grp$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available in the domain. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to
+          function selection and input debounce.
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        additionalProperties: false
+
+        properties:
+          pins:
+            description:
+              The list of IOs that properties in the pincfg node apply to.
+
+          function:
+            description:
+              A string containing the name of the function to mux for these
+              pins.
+            enum: [ emmc, gpio ]
+
+          input-debounce-ns:
+            minimum: 0
+            maximum: 10485680
+            description:
+              Debounce time in nanoseconds. The hardware counts in 80 ns
+              stages with a 17-bit counter, so the maximum is 10485680 ns.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pinctrl_emmc: pinctrl@11b42800 {
+            compatible = "starfive,jhb100-emmc-pinctrl";
+            reg = <0x0 0x11b42800 0x0 0x800>;
+            interrupts = <119>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_emmc 0 0 12>;
+        };
+    };
-- 
2.25.1

