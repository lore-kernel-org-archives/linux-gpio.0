Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2098.outbound.protection.partner.outlook.cn [139.219.146.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A5039CD04;
	Sat,  1 Aug 2026 09:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785574875; cv=fail; b=INmVPJZcPxMHT38DgLmjoZpnUrRs78tnVmW97an7drRCCI/X0JUGmDiupPg5I6tJyzYJBnU7hQ4nQeOmL1QGL2QtoSIW9CCJr7Yq/O8dnmtM3VcwfHOFfjgqtR7ntK7dzQFH1z2RlXY+QeI/Bv6zyODYY2QmV0507oY3DXilJnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785574875; c=relaxed/simple;
	bh=V1gUZ+5XR1Teg7IRqqrU1YIf5Y1TdqtvBdEjZomQwSk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kYFAK63ak8rqsDjOpkKk8qveM4798VX098aauXbLdBjwao3agNq7pg80j0fTwPMT0HfEOd5CqAFxsmRODTNc0p6R4JX0TKoYICkhMJLqCCZS1nQm8p9CGKTCB7il9Fq/xffH14B0vE/9/Uh7m98KzDMD5Xf5hEEblXhJW/TdjFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMNWLATP/U3ASSyPHaDqoxUKwoSY/K3tDYSg+MzzP3DutYcS+pIPQdfCIgOpB45CTqldjqzNlloEvGidlmalCOMDY+e6X02JjcXVrNDJL2rATIUWKhYg21ui3OknEFH8/8QybfaIH5puTFtOdcsWTgpI4eZl3dMMdgPZUeZwxz1og1Nl5uIDo3Ca7F3zTyikFCPCWhouFE99kFgWoWJKvqRAoAX2kb291LC5y0bihsuWRF2uZme4tm/Ym86CgfIC4PzUU07FYPlMDuOksbhYvgyZ8oRp0GuFz6EfDO4UmjbLas+BHjV1SktG40Nk5b+9xTiwgdNqBAqNo87pdxLbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IabkKdXFay6DX91OfNuuLVBl6EYioAwtLpMoDoaJsE=;
 b=go9GL947r5ou75QXgZGcRh0rCT/oJIU7IVpLNlCM0xLy8JGXkNh9X3xYAcFAKsgp6as+0pkxO1GD0VTwerzoDwqjcHvppg2i2pBgq5BtREQBCVnZDz6aVrIu0zYMV4QWYrSopM0nokVpb5+pMZgMpKx6WGUKNBwK6+YrjMMSvbxiOjNw8M3yX8Sf0OxBLWhmQoQEqr2XNKpT7qk8YFsQR3lAgOAA+jq/IJ4sbh2ZKCTnGmYl6Mv6UVoFbgZuS/5q9O2qv6PO1JHictbInL1uTOc643AIbMDmeSmj5yRRJg89f7AuYh9znljirSHvSRK+ei/l9jsVHjMsOtCPMjO7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Sat, 1 Aug
 2026 07:27:26 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:26 +0000
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
Subject: [PATCH v4 05/21] dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
Date: Sat,  1 Aug 2026 00:26:55 -0700
Message-Id: <20260801072711.153217-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0027.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
X-MS-Office365-Filtering-Correlation-Id: e4142051-4dc0-4037-5a05-08deef9e5656
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|23010399003|366016|1800799024|921020|38350700014|6133799003|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ufqaaVu4npDL2UJBjmeEL5CI2ln+nBVeiBzLjGOdtGanSi7y22qYkuENUy9lg+43/xt6tZobOqgq1gbqpwHDiVxqjv6t7HKxjJAQgEuN0FktGQcTzPAAbGGyYK2O24O+12OB3E7nuuuQwkNVzPebOiDCk3KAcbiousnUKQOgI07GCZ1/Ovyxpo0KwgIwIaFGbCpPH0ZV4z2xx+o+mJyMQAQmRjeIQPKHcvbEv8ekK7na+7MCmedEc1USbtNuhuVvVINf0f2s98bItwwZFg8asRZrBwaGpZh/SPZQTvYOL1767nO28H0wquyzRaUJDXAvr1cCMnHoRVJd8HSdHamUaJCumCRdz+7uW3ALM8Nl2Rxs4aFBNfurkCdHLkMXDJqTEQsjwMkBBDj/SQD2CO7Z3W53u3KwPQ5oUUgDWSWLczdv9uO/H3v1NGUuDeztn4c8dwhTat0SFtIaJp4gbPpJlVZknYAyh+59Ikz7+boi8KLHs3Che8lFS/iVYKmwX+wXK7lkqQn2UmXpV9zonBVLQ3gYW5Nx6mEub/idTqmP7v14b7OdgzmxKbATq6+1/JUAT3WvH6T+B9jcY65FOeHdog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(23010399003)(366016)(1800799024)(921020)(38350700014)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zF85szuIABckGDQy+GQ90+7/8x7TfTKWwF3a/YEJdCm3VIkulh+5FCImdw/4?=
 =?us-ascii?Q?d2Dtc0o7aCmBCb1RSAJF2vqdCXIlaHVrxM6sASh67j+//uP0bqtuxPw1uKwn?=
 =?us-ascii?Q?TZkLBb6VNIusmHzEwGCUNoHuMpQEmFCdmUFjPW+v2oT6Fmyod+4CBVh1EkwP?=
 =?us-ascii?Q?X+JFLL7V4E6UtGK0tzLCDGGHl2sLnF33Uo8QB1KPhqRNNhSaemRInvFKpsRu?=
 =?us-ascii?Q?4OMS1bflFY2KFmuI2G7JWA+7ZRoS6rCToUjp7lnMfVVemi3WGbv25MQ5nem+?=
 =?us-ascii?Q?kHYmLftYpXW/NTdJWZjA8q5+TAOaBB79kn620mnv/EqkztWJBrKn8ViAan64?=
 =?us-ascii?Q?5kaUpnl9faVpUFbSBexIrCnEuIttis/DWLTeeROkiPvG/WOJwYkOOG8+f8GJ?=
 =?us-ascii?Q?YTpcHMrdkAjuOmrHda5RM80Q/1aKoR3JwF1GLi5HIavCOjC27K3rWh0EiUr2?=
 =?us-ascii?Q?t/v3Y3Riv3prvO6MonTLFXpGELdw9XazLT26PgJXgyuSmksG9p5njYQh+48m?=
 =?us-ascii?Q?JrDeZh6QqptBU8RQEwKr37urBxTYRopH86SHKt20u+fgG2c0hVbXxybjVz1Q?=
 =?us-ascii?Q?C9uTs1+QGpuneba3RVJXT3HXZ3SYFf8s5/FBz+o3t6CxFp2pyB5v/qwGhcjW?=
 =?us-ascii?Q?FiQYAYaZtHcDMjIrHMhws6yiVsHEFT1d8ZHMto5kHLoIq2R7OjcF8GZOXYTs?=
 =?us-ascii?Q?O1DQ1wP4U0XkQK+EIk+DWqYT1qKgmPtoiq9jMo2ZbQUTHeXd8hk9VEUySs/W?=
 =?us-ascii?Q?ZIMmbX/dREKW/NxswsJ1yfo+JBQmCH/sX686xYotAirweWECXGcM7AInqYOT?=
 =?us-ascii?Q?DdjrRPGaCxZ1A5wBr0ed3fTUx31lJh++401e6VjIe1OcYgyb5PbdvvLgct85?=
 =?us-ascii?Q?aSvco2MjKhavo1tiljLtxylWxyoYn6mTv33FXQ3HUAr1vgfBSua/K2tPoSJ8?=
 =?us-ascii?Q?QenudFpm55N+1TD4Qp89sMBTG8oiURQLhXK24VCIBFTbrknXklsyCnAgsuFR?=
 =?us-ascii?Q?axmjjM2tVe19Ab1kXG2al+AD0ghGXdfJ3Rx+G51nIcsP9uic9eO5+P+PaE85?=
 =?us-ascii?Q?vHhlK+YpBLHiU9zmtMhzBJZJw9tbmeiozY/WM/HjRXJHvQ8ICRtKuB6zVWIS?=
 =?us-ascii?Q?inXOHu06suufLEYzeV7dTbHv6EPnpWdDpq8nHMi5rO62I0Xhsoit/6E/GA5+?=
 =?us-ascii?Q?xH7yJP6LNkevl+8TWt1x+uUkswalUuAKFSVTbLRHQnHILd+cA9NxlQue2OFC?=
 =?us-ascii?Q?MYA8QLb9K0l2st3trRY560LPZJawO2+7Eu1C5juidWBHkBJa2Zjb8Eera+eu?=
 =?us-ascii?Q?NH0ZYwDC+a57BJFGH6uhXSzkFosIeQKr75KJJWKHKp0pcCC3YS9dclF3pwCz?=
 =?us-ascii?Q?Fx61yTRvyBr7MPLx8EMizxJfyHY2v8leJQcclVL7B8VtuZD5aOQMyW9kldUt?=
 =?us-ascii?Q?AL5BlrqLCdO0l/YXIKxKgr7YKiHA5HR3umF438e44l5JrPiDcz/ZWvycNJHN?=
 =?us-ascii?Q?Y+DVQByNS+6okw4ie3ywHwyEI+Y1oa56M2Q7RIwZh3GBtqRZG0xvYKcPS1SG?=
 =?us-ascii?Q?BW31J8jCCHWG3x+ofu9z2bshYkej89N4E/U73o9meR+l+NxDn7wX7UC8YYah?=
 =?us-ascii?Q?esXPHcialRhDZ97ytAWf/o1SptOC9ugIW6q8Mz8PNY6q31pIAj4lwRD9DwMF?=
 =?us-ascii?Q?LXt8zc5aalqA5/i+4t5YctQ4adqXbg1ZnMv6kgRmB0DQi0j4L5KWqQD3kP/h?=
 =?us-ascii?Q?cftFIGauNH8hSgUWrRiczQ/eQgWlB0JwBbO/vknspUeaZkXWc/zw?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4142051-4dc0-4037-5a05-08deef9e5656
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:26.6166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ee+D1YZbn1THztQNOxb5AGozOqHbCU03oo6puCgc3h4zPosXayVFGUQoWiwjG4sst3m3Df676q7jLyrt6JuFnchLMG91qKFH3s9yj5qOdtHS1gv9OekHAkXUEbbRIWVt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../starfive,jhb100-sys0h-pinctrl.yaml        | 162 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
 2 files changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
new file mode 100644
index 000000000000..80acc64834df
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-0 Host Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys0h" pinctrl domain.
+
+  The "sys0h" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS0H Pin Controller, there are 12 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 3 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Functions 1, 2, and 3 are the alternate functions or peripheral signals that
+  can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
+
+  Each iopad is configurable with parameters such as input-enable, internal
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate, input
+  debounce nanoseconds.
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-sys0h-pinctrl
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
+          trigger enable/disable, slew-rate, input debounce nanoseconds and
+          drive-strength.
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
+            enum: [ espi, espi_reset, espi0_vw, espi1_vw, gpio, scap_trigger ]
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
+          input-disable: true
+
+          input-enable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          slew-rate:
+            enum: [ 0, 1 ]
+            default: 0
+            description: |
+                0: slow (half frequency)
+                1: fast
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
+        pinctrl_sys0h: pinctrl@13080800 {
+            compatible = "starfive,jhb100-sys0h-pinctrl";
+            reg = <0x0 0x13080800 0x0 0x800>;
+            resets = <&sys0crg 3>;
+            interrupts = <57>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys0h 0 0 0 12>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 6d8f5516a178..38d5a94e92e3 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -14,4 +14,18 @@
 #define PADNUM_SYS0_GPIO_A2				2
 #define PADNUM_SYS0_GPIO_A3				3
 
+/* sys0h pad numbers */
+#define PADNUM_SYS0H_GPIO_A4				0
+#define PADNUM_SYS0H_GPIO_A5				1
+#define PADNUM_SYS0H_GPIO_A6				2
+#define PADNUM_SYS0H_GPIO_A7				3
+#define PADNUM_SYS0H_GPIO_A8				4
+#define PADNUM_SYS0H_GPIO_A9				5
+#define PADNUM_SYS0H_GPIO_A10				6
+#define PADNUM_SYS0H_GPIO_A11				7
+#define PADNUM_SYS0H_GPIO_A12				8
+#define PADNUM_SYS0H_GPIO_A13				9
+#define PADNUM_SYS0H_GPIO_A14				10
+#define PADNUM_SYS0H_GPIO_A15				11
+
 #endif
-- 
2.25.1

