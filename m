Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2094.outbound.protection.partner.outlook.cn [139.219.146.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B0339EF19;
	Mon, 10 Aug 2026 06:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343873; cv=fail; b=crI21D9wwag4QgEO6Vjkjo2TV+cRmO5enG30Z0EsHvIqMqWdkZY++m8XVDqiEQ2ImkfQJlWeHlOzop/B3/piLjb8tHD92oFiJHVn75kr50c4+j1nbMZVC67TyIG+gxGXZCa0a/0cgH18ZXsiZwYZPj8vnRp6YatqQstRhImkKpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343873; c=relaxed/simple;
	bh=YK8UdYE2qUxuMyAuy292lD89IbPxfBs6oYPiPE0c3qY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HXaIW32tXD+ZeF8oPGdcWe/HLrYfV4gwvwOPUbfkMBOBXE+QhsI4PneRjhekFykLygAr2ZAQ03o0lzR2NLgyaHNQZE5em9rvkveNjRjDlMbOEL2M+1NduzYLek3vjFBDCHETWneat+4ZycsfqArDmFlPTDB4h9X64ACa2yDD6z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsXSq71mdasTkjHuAS+TeELpsO1DhpGACYpCn8D49GsAR4c8uCtLiwjgUGyG3Zuc0bW5nwriYC0hMt9ueS6AcsRiekuSKVgmAS30ihnMpgnJ2muXNgFlzUfOOQWwKIZ9X/IP9U+I/Fyx8XoL2bLNx+EjaBmgKPgdjjWjIGNH+u9Bd+qAlQH7drI04irtM2TMhwVeRn+HQhDloRYuFFXWnVy4eFsziuR+NJhIqCEtpGhhH0uCRLsDFrY+zR/DdHfyTSGHXgconWPiRdrAKbT1jVcrGVQUu0nclhlf6t8IgheKfHMq6Rx8RDW/eyLFpVXKgWQkDtrrddXZsp0NFu6tig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4HnT9F9otS4resKtJGxjIPvYl/E6cVg8IgH5bqRkWI=;
 b=FcqRqHakYOOvhGo9YML35Yw9RysS1XFvPxU8FzTlWGmIRh1aZCuk4bDqsutxWUD3qVzGYaYHLBB1QqdLKrATjFY0PV57vvVTbBW9FQ7SHiEaJGD2yz65STXq+1sZ7y3dh/VtaeB3jVoUmgXdvvIhwlXCSeIj3L0SoiuJJnV6ivgGgyHjmQYrIanzv14qSeVs8uHx0jBQB39wkEogqyyCssFaDRjXI5LlnXNYuop/qP4OSOLMOcGU/BK1YA8PXk9NMsq2+6ojOEx3g8QkdDUVD9NACMK/zeBCUJ4TNJ7ojMV4AUlmE1Refy2yfrY7o0fPB+eUqhEQWqXYTLtsx+IyKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:23 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:23 +0000
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
Subject: [PATCH v5 19/21] dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
Date: Sun,  9 Aug 2026 23:36:48 -0700
Message-Id: <20260810063650.239303-20-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0019.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::31) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1315:EE_
X-MS-Office365-Filtering-Correlation-Id: 19319dc0-a696-47c7-cfff-08def6a9d621
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	/Nrb5exfIQOVjFmqbX50gAnFaUcljdcCn+BcX5WOZGdpm+QO85us08Fx8Wnnvrql9c3QK+2T6r13k4/jZ05fZyoocAaBpIrgM//PR2BzPwhsjFrwAIAUxHcZGDcA3WnjVhwV5/sX2/WAfuRqVN8TX1ZY8hFKhOJgbkMeEMkTdipOzhWf+wRXqFgSjSHSFe7q5j+vJ6VA0GM0s0RFVtACzukbNDdro+N7Bl0bsRSe+5kNJ/wSVXXgA3AhZqHaCD6+4Llry7JgblHX0Ot+dEnIz2opmQ+tmdT0hH7QPYqomXwDbpkFR9l7kZFjtZXuD9kauUtog3saICpLlmglC4+jblt/vxKRT88JMw+8qePXhQVRdqMhPN4Oil1KrFxd5JJzlYdYqRhfAebc1/knyFHM2otXrpoQGJ9UfVBSpBtIbe2VbzbmXrkg/t0rcsj6JIOW6YKXyUiiElx9ZIBhIM0GQJLnZiJv1LN060qEIyEZNkfMpSdzmfOtWwJpwyB6g+x9SoDGGSqzbwFRrd6kmYmbRkohI+G/I3Nb/YfPOklPtAd+TpsNnkA9wToMNVmBW2oSznooJgwsMCEuRyjW8Rsm7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mw3mw2wnUNO+31XGGuVAoLvkQZGJnhqms14lZxltewM6L5dUK0qsbnsUBVwd?=
 =?us-ascii?Q?CQqYH/FFaRuc4YabKCQM1NGphYhCUa4gjEYhvIutvo23589NFmW1L8wCy/mA?=
 =?us-ascii?Q?fhkrDMMYtZqlPHn8fMQA+zZ+T2/SGcSiATOHIat6FdB7PEkxmioipDgJkV2E?=
 =?us-ascii?Q?cxZpnhxvY5H/d2QhdoIkgEvTAlu/nwIghNs2Xlz3uNJ+P5t+8tGzSSHBpN5U?=
 =?us-ascii?Q?O03trJdkH46oOHf4t5mSWEL3ILA5GNHzNG0CuyChUzerWkPyWas31KxrbmTs?=
 =?us-ascii?Q?xNXFmaKKJPU1zc9PinXVr5FfWfZ4dID0/TjeS67ttcm3giAgVZ7zHpo1bA+v?=
 =?us-ascii?Q?58sUjj+w6OcUrtvdpFdR/DAeoHchySPmGb2NcDrNVI1wEEbHETV1iH/CW8Oy?=
 =?us-ascii?Q?Vbj7+LVBg765/HbHzQjNdNQa6dz1vxWJBBcLzqTeGZnmQCXSZx524e6cCG79?=
 =?us-ascii?Q?LjVtr/Zjh/IhvE5+6elVYEdusM+WmnNJOQG8ol2hamp6cAzOtkA5kwHLzlh5?=
 =?us-ascii?Q?kx+4UWzLDaBOLMgtH6gNRRgPmF1aoNNl/ha0h+oiB1pHQFprePfnJfpApe/I?=
 =?us-ascii?Q?MsUwMGbZZPVYs3e0+LrkBn/A6QKUuk11RpoO1bFA5e72berQ0ODJAfr2GoY8?=
 =?us-ascii?Q?pIEjCj+lSWPOdUCu1Em3Kkzu2vXUgeOwTaqMXTQgVvLx5wMEZdqKzLWmNgw8?=
 =?us-ascii?Q?T3hAehoPCImRL+oVwwXr5Mf53n11ddnWBFMnjuUp/UsNHuOJuIOnSlCvyOHq?=
 =?us-ascii?Q?nL99pzIQvjZTqoQHjozmIsSxlrzLldRto41/3K8QdcwcbMX+ZfLBx5DRcsZV?=
 =?us-ascii?Q?zHCGfDB2HZjPKw1CQSS47p2DLM31DNx7RvtAwN7/XgZ9/gDRv1StXLks0mQE?=
 =?us-ascii?Q?B3IK5Fkd9mItA8nGdiRrKDp/9iKVUuIbJJxWkBKkpKDldNkbPj1iRV9AWJWp?=
 =?us-ascii?Q?fa6J8f58iH9OZIfSkHMz0PpM3gB/mAnjORJRS+xi6KnELO+8OM6n6RfNT4AL?=
 =?us-ascii?Q?2Ca40aGWm2BnOAQWLZgqoEul/pkSLgS/ZQ8HzyLednyIq+ktMTZ2W+PDv+4x?=
 =?us-ascii?Q?6tAaBQXJuABMdo5GSG1JEaTKcCcEp3B/Es3Hd+VKqN2TU4JYHxSJ6ZqdrIX9?=
 =?us-ascii?Q?BJp4VOJPlcfObr9FATE9NcTG1Vh6kEpYgs3xxmBp9sxGFrifCNdLJU0iZ+fd?=
 =?us-ascii?Q?xdqcRe/dvJmeJuamcoFk7Ayv6ISgvWocEm2pkNYX7c7ANEXoaO3obNrZLqpn?=
 =?us-ascii?Q?H6Bz5nYYjitAqXJ009dH08wGucQ+7BAtate2Q92CDzPZvaC/4FmqnJfqqlla?=
 =?us-ascii?Q?wf9Kw0XY3roId+koblp++SGez5l7XY188N/8QimY4d6ySt52dHefS81IVtd6?=
 =?us-ascii?Q?zFzsvp6NzNXs+sqyDtwRz/jTFQtBS9bwQUE1lmG19+/ksTAC1c4Bi4QVyF2H?=
 =?us-ascii?Q?bUG7VQxDGdw8OoNNYq80lu9NLxHextc0mQ4w02lqEtesspXvCXTo/waZaYbr?=
 =?us-ascii?Q?lqAhQVXhya9i+psEg3oO9iOo0EDYGvRAnxkKpHeuoJx8V0nkbMBlkPIvUNVO?=
 =?us-ascii?Q?zfojFyiMFh/HGgfG2yZJCbKNV4i8AbCTELVedG1EVHkTHJ85O60rjYvG8qZH?=
 =?us-ascii?Q?z/Za2ysC0ySdofUOXIwx7zf9t1P94MluBeEEpeQOHzaLuGcq2NXb5mDbGrzJ?=
 =?us-ascii?Q?XoRzE7gpqlyIO3diGUocPddAzlrFD//RVQ12gRdl5gTMevGbXINagfCbPJTw?=
 =?us-ascii?Q?JrojXdrZntj1KmDvO/vT7dA+4NuIQJrk2xUYOzC12GF+jrI9lDdB?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19319dc0-a696-47c7-cfff-08def6a9d621
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:23.6813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ooDENRQHwFwnAdldiMj8fCUjVviOh7z9cZGGUwGBPCk4E1W+3Kn1I4S+qh4JE0YrJGFAKOUxCvIGlMMYqtNZqW+jI2efVV9IyJziwiCcB6rVktsIci/oN5UXw7KU2Q8l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

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
index 000000000000..9aeece0f53b5
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
+    const: 3
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 3
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
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per3 0 0 0 11>;
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

