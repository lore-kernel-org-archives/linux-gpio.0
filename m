Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6AC3FE67B;
	Mon, 31 Aug 2026 11:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176167; cv=fail; b=uCKOKCIAcscgaUgIgHPmTlmJrw7SSAo+uZjehuZzCzQPY/2mVwY7PM/IGhTVqUkd4cLLxQQOsPs5+ErRfQlyj6QMwFh06oHgV4HVP+BncB+mmAViZlGXRkIuizmAPAVMV/RZXIMoXwFqCvbQ1YLF40cf2Z+XIcPQNO8yBYIQ+Ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176167; c=relaxed/simple;
	bh=uztKPcIit8qZXxFMAKpRU21z2QtroXj+Yz7rvJRYK8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CW/GZRAEgBu5A1GWUkk/3r/nHDEKQfZ880REeueJQMtQbBwliOvgCkYt61O9s9p5QXpHX5IuZRtxHfF+JmJ3W3gg+SjyiSoqK3k2pdfIcUv1aJ2wZHWlemvjoPr/JlR4nHAlYgrBJbTLiwsUytRmCJVklBL7F7MJi8S+QdKzD88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEQ2/B2RrMOfR5iOkmj/B4qnUVOihOfYNs3xURLHJZiA5gToN79kNQOk3jwS/795sERb6uXPsfjCFbo8Z7OaUBGJ0/sKnd/oBnE64Uof8ymKQfM4kQyOJ0kVSt0ABdzATlLdqX5B8GSWvxzIu23N9tdV14PgiWz5ZxoqIKx+y713XLqI9W8vpSlfZok8koV52r9TKCaS5JBClG4LBsZzKHSgk5W/+sCZp/uxu1m8Qf5BTdCN15LwJgPynWQmLsUWxEqvQUUrmCiTtDQ+buvCqGku4vDfz6nnrnKvMDD/lFNlWBRZzb+lB0Qn7P8fC5E0iQniLDjjlCiqEDD3i5+Avw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/a1o2xHG9J7IEqlRftz7wdvk5JemND3dNGDiYwj1nc=;
 b=R5SOaK+xVTC8NkPxS/LtCuPYtfbhZE7u5s0dORZVjh/51gg0dnsx3m9lFXCx62ql5w1MfHcZaS0UyxQpwxUy4mpWdvXAo8mnXqSi+kP78seHmNYoPzgj7zcJlWvrlPRkcHCjyzJ1by0rhW/KHwlCAm5Kch4QOwd+tvFobS98V6xvObcvicNrCBiM/hbq7IQQ3z2Cz3X3UYTOVfo8CJo7IhBJYD18Xk5cLd53eupS31dsaKG8GZg000yN4wZGtT8G8+GdFH/txke87XevWFfFQuenOY6/vMIHwuvyrryH2xDkd/5zS7Ovp0eO7HKhHbMeditIYX1c2WBJeftAJZh/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:47 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:47 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v7 19/21] dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
Date: Mon, 31 Aug 2026 04:35:12 -0700
Message-Id: <20260831113514.66382-20-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
References: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::8) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1332:EE_
X-MS-Office365-Filtering-Correlation-Id: 68167cba-689f-4e64-77f7-08df0754005e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	J+5VxewBSfl+IN6Y+ADW7ZaKr7wnP2d8z1AARu3UeNb9RxBzIf3GR0oxI517XwjBhozla4u6nP15KmY584gZlRU/5tfg5iPoon4rawg35184tgxqWyd4ngQ6eptaNCdoKh7MQ+N60dEUuk+CwZ6UWGFlWjPTI6FIycAEJu+8N9AwEfTEo14L+2rpOpgjfdTknjxOpOxTULIMBVEs3ZVeCVU+/JSsSpdsdjqRKDCn9nAqhntxOGD9B6IDApbezi5GzPq/tNDJmQHI+7FViojvAPFUQA3kaZO9mH2S1cOfwmZReVZW9vfFg+GqTq7JOXyW+CcdUusK+NjQqyuiq4tH0YXDP2ej8Pxmzbg9p6INJGSc03M81vdifNZRFQfK0I82WytLjZnIb4KI7QAYMOyajkPX4ezc7ncZrAxrVrA6yF1VozwqrcHP7aqxe3BNutetAbzAraP6JT1OiNaK3lju33w9N2maqSAq37HnWs4989gnnIqsdTN/EHAaa8wadNs/J0B427c5iHJjIBSGuxA3P+xsEWBcNXLlgRloiQvMa5IZ2mVYbGj9ew2OnSsfG7JvMAfS2sde+xDNQc9YwO3rIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OiOwIfRK8E2dHRSASpziTWCApnI0R668YhIkwlorG4ZED11xhfj/jr52kKoF?=
 =?us-ascii?Q?nKbBqxKv903ohuTHXY7P5TkYacgbH9uwfti56RxYoM79s2y6HQyg0TQTDnaH?=
 =?us-ascii?Q?/ymp3bIUQOioBYHMzLD9/ookmuYNZ82o9JZfGv9WngNBd81xAdDJ2fnQkudQ?=
 =?us-ascii?Q?6Xbrr8ZPN0FN5sR58kweRWgZSFtjVsmeqbANFPIuBVeMlCayAxQGNWr+kQP2?=
 =?us-ascii?Q?ueJn0h2x0+c68ZrMjvwPEc/AzmoMlEPZcGDufXp1LKCFOmErMsq4SPcIpXEa?=
 =?us-ascii?Q?Gn5oYXgyCsyZl+R5GNLh2NOhLgTTvEGUe3DnI1aZqr+8qEpmVRJnjBOu7PlT?=
 =?us-ascii?Q?mlRu/k6vM41KmtpCTNQdqNraLQjk3wYVa3+bj5klKSulA2nGmSO4gurJvwPn?=
 =?us-ascii?Q?eWphdzagQBaRGzQv6G3mdBRqu2pOpFB1sHxCukBauBbBRT619KE01HX3jPoR?=
 =?us-ascii?Q?aT4zCvMQMHhAiakhA/NSVy2QzZ+IKXyorlPgTH7o9hlBsxLT/2lcr8Fs10y7?=
 =?us-ascii?Q?k1BWf7kRmxw5XubXy7yhDupt6mnCJP6I0QdjIe5fxLBZlEezBRGzy6bD/D6g?=
 =?us-ascii?Q?Mfwcasf6vTv3Ey6loBmsqbp0U0YeoMydL9UdrIpz/JZZWJVk8eELl6Z0NugI?=
 =?us-ascii?Q?j65btzArLyxBekte19p3GPgkqjiuF//N+LO4+OiNuhz8n2Bu4Vx/wUt/2SIu?=
 =?us-ascii?Q?MeUrKITjsAyrN2RnRQqUoTyScvBjlPsUSFYYT2JmH4f6598CeMPCELlWEDDA?=
 =?us-ascii?Q?Sc40ORUK48pFHD8aE+USGtRjC8c1+Rk4KsWeYqFSxNqTvr8bs/luH4AdtmSV?=
 =?us-ascii?Q?oyLIwtq2konYH+7t5TSzpvSm/2RWXSFD6DqVsVurvUEmxf58i0iUcuk9PEpz?=
 =?us-ascii?Q?/UBgNfuLH7ZWInCTj+jyeoKenk6WKTonLxsH92JWZF5rJjj21tsvphlno2sp?=
 =?us-ascii?Q?20GtcK03+vaJHPxzGPJZtRnXEiTWBUPW9agJTe9svGSCVt7zZsVhK336BdKV?=
 =?us-ascii?Q?I3/kiZ/ngj1jPEg2xJFrOFELdQ6AhovxebYpR68Zj5Z/OGMSl6FOb3Hycg0L?=
 =?us-ascii?Q?1WD7nv4tFBCI4c4+7ZJ3y5teon/SLF87kMWERyjjsarxWJkodmWIB2+8BzNe?=
 =?us-ascii?Q?d4Cd0uEpgRcuqYO1tes8fpQKhlmbNP1ox2l4S5e2EG6OdNExiT5LaJITkiO2?=
 =?us-ascii?Q?q0/Y+vY608heI/0hNlXLCePcNzgZGVrUoM6ipng7Ff4E5355Rse/jwxCyARM?=
 =?us-ascii?Q?9bQhw8HEUq+8LQZis9+xRAuPq7GfQliAhwSKC3y1gpJZyDKeZr1rQfudakpT?=
 =?us-ascii?Q?0AGqeFwzNvax0G6SQaX6EY0NeEkDbS2SC2uaWoZ+NgQFnGowNLRv3YLXH2I8?=
 =?us-ascii?Q?IwFXU8mI13igwJuWGpOTQV2/tTadG5b2EWs6UIqIJTypbgevqlx65m9mTj95?=
 =?us-ascii?Q?DbqmS2I6qQVtw42NOfb7EkVw6jXh5/XPRKWks6t4vjbBQxGjilMZXhGU3Wb/?=
 =?us-ascii?Q?Bmof29G2mVSPnAg8kXXUWR8Tsw31Oozq+kt5wsfT/ZQFD+l20rKN5p0FNXJT?=
 =?us-ascii?Q?dynfzx6Hh6R6lmDF6vPuIEWgnYO8eSPS8yyLn0ESUn4/Vw9qW7jtw/29J3Ex?=
 =?us-ascii?Q?aD+zEoHbiOcIqrUcbkewT9SJ3e90RHR3ky38S2HRZ3MywJfiOEoEinKb48TH?=
 =?us-ascii?Q?FAgPRU4+tHpIxWCcydIbSAwocMA/LILNSre35C3j2koBH2RoAuFoYgPG0nrw?=
 =?us-ascii?Q?QOzdHe/M4qeWk4ZFZZU1NXSv7Gt03yQSi1PeM9JBDOildnrKnnlO?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68167cba-689f-4e64-77f7-08df0754005e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:47.5905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJHR2gid3iVav6dyIgOZBn7q5Q09OW+JP5k+DliOmsGtzSdirsnmzzPbKC0LhV+dBU4FhHUkj2PLTu4PaxDY9u9lE5OvT8ef499QYofTzos8BEo4oQBIvaCZL/fNv8r/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml | 166 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
 2 files changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
new file mode 100644
index 000000000000..92093315ef15
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per3-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-3 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per3" pinctrl domain.
+
+  The "per3" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO interrupt handling.
+
+  In the Peripheral-3 Pin Controller, there are 11 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 2 functions - 0 and 1.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1 is the alternate function or peripheral signal that can be
+  routed to an iopad. The function selection can be carried out by writing
+  the function number to the iopad function select register.
+
+  Each iopad is configurable with parameters such as input-enable, internal
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate, input
+  debounce nanoseconds, power source.
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-per3-pinctrl
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
+          function selection, bias, input enable/disable, input schmitt
+          trigger enable/disable, slew-rate, input debounce nanoseconds,
+          power-source and drive-strength.
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
+            enum: [ gmac_mdio, gmac_rmii, gpio ]
+
+          bias-disable: true
+
+          bias-pull-down:
+            type: boolean
+
+          bias-pull-up:
+            type: boolean
+
+          drive-strength:
+            enum: [ 2, 4, 8, 12 ]
+
+          drive-strength-microamp:
+            enum: [ 2000, 4000, 8000, 12000 ]
+
+          input-debounce-ns:
+            minimum: 0
+            maximum: 10485680
+            description:
+              Debounce time in nanoseconds. The hardware counts in 80 ns
+              stages with a 17-bit counter, so the maximum is 10485680 ns.
+
+          input-disable: true
+
+          input-enable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          power-source:
+            enum: [ 1800, 2500, 3300 ]
+            description: I/O voltage in millivolt.
+
+          slew-rate:
+            enum: [ 0, 1 ]
+            default: 0
+            description: |
+                0: slow
+                1: fast
+
+required:
+  - compatible
+  - reg
+  - resets
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
+        pinctrl_per3: pinctrl@11c42000 {
+            compatible = "starfive,jhb100-per3-pinctrl";
+            reg = <0x0 0x11c42000 0x0 0x1000>;
+            resets = <&per3crg 6>;
+            interrupts = <64>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_per3 0 0 11>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 4b7f349cd9d7..a645ddc836ff 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -230,4 +230,18 @@
 #define PADNUM_PER2POK_GPIO_D47				16
 #define PADNUM_PER2POK_GPIO_D48				17
 
+/* per3 pad numbers */
+#define PADNUM_PER3_GPIO_E0				0
+#define PADNUM_PER3_GPIO_E1				1
+#define PADNUM_PER3_GPIO_E2				2
+#define PADNUM_PER3_GPIO_E3				3
+#define PADNUM_PER3_GPIO_E4				4
+#define PADNUM_PER3_GPIO_E5				5
+#define PADNUM_PER3_GPIO_E6				6
+#define PADNUM_PER3_GPIO_E7				7
+#define PADNUM_PER3_GPIO_E8				8
+#define PADNUM_PER3_GPIO_E9				9
+#define PADNUM_PER3_GPIO_E10				10
+#define PADNUM_PER3_GPIO_E11				11
+
 #endif
-- 
2.25.1

