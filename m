Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189133E0C5C;
	Mon, 31 Aug 2026 11:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176150; cv=fail; b=h0jnvxzjAZzXzDsgn57QBT9HxY1fSFR+d6poQd7FOufCKQSkqZ0vKEsmBF/tm0AZ8Bwg1umnZ8IuneYu2I13nvYNreZlVPpe7349vWToJSaZESr3erhxFSd306fWPkICy4kJKuacprqhb6uehbz/GtNMkEMRddI/SrlH1dQ2hjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176150; c=relaxed/simple;
	bh=zS9mfpmAUMpFUwM2jwanogsQruwQs0sOL3J3rvkBJBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ubKeQdEasl/4Lcxy8o4anoqYWxvZ0mMeznFTJ+Qw7PqLbUHWeXu5l+cFfAIBqn0sJrUSLULX81aZhtjHyo3FzJ3X7uWkxnFwsBig2Iu3UrtiHqbGnNyP3c2/iwCs3LEaRZw6mRN9smruRF/e/dFbGNX8LLAWS9NwIl8CamEPkKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVfKF/39l02yVoIiTMB1bCgidhskAOZNGV5wXXM5dMh98JVwvKwlZfwobWGbAd4+M1MZTuhHFIzTRm88ExUqZKT4Hp+pSbGkjgun8wJdeY6Lz44PvcteeLBUKvynyvQvjcZVhUTLKLaYg8zR9q6o8SpcLzXKT5DNnG8AbT0z6zJMl4yR+9fKCKrQPGYw7cX16AKjHH0sw/zte8BB7/D981dUxoc1eFBrQuYAWZotpeNarzQW7lD/bxZ47bZFsoZWaCkbVShvmIY7Yz/g1TABctIV0qS32giJ7gmsp2+NHMByTiN2dqAKSxBftRBTrTzuWP8FRkMW9IEkxAi+WyhXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIBgh9Y6tqNLZnWe2nXe0heP1g8UXgVtl+lOevyF0qE=;
 b=B54udn1Xx8x7tPbHBvw0rcFmOaKEkmXHp1EcQkV1siOHf7Xb3Q+Osd5v+wMlwSnEQRFOGdcJ6+rc2ehPy5Wg7z/tVTnftxlsDEYoe1bO62YmGvRFE7IkcxVOfGCkci26XruKE/T1umH/yVwnZ6EvmhZEUmY0uppfNIkmWUc5qc7FYAidQIUwaXgFA9eRSUqifh+xATrR9kDGc2QnH0yNMBTihf62/ajQEMwTkFUyiCp+bOh5bqzq8huoTcUR+n7yCNq0vAs7v1LZhLely8/RFrFlSif7Fd55CvKilbWn3besmWKfOlBgrzEDdOTQaA8ZuAUVFgv0etjzzBtq29EezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:35 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:35 +0000
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
Subject: [PATCH v7 09/21] dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
Date: Mon, 31 Aug 2026 04:35:02 -0700
Message-Id: <20260831113514.66382-10-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 82dcffa6-1465-4d65-7124-08df0753f94d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	OHRolVuNhl0rA7gCio2pqXQruZS6LnGe65esPrvUW+EXhtEzmqTXJqaely+1GS8VDcNGoyT/tWUh7hsZ+8gPa7cWy3YvjYLvpUTR9LQmk7NEdWaL/nOQEYn+ELC8BGld3u8ZC5k9vFjhzM3SR/DXqkgWuWKOzwQ9dT822pTpVxiyow+ct8NOSxBcHI55KsqwlrhLCGJge5RT18ANcsjUoOt8EliWPhTmpagMIpY+E2UO67+vdEdiF4D+rJR2efjBrNL0hef/usNCEBNpr7SzJStNdH90Y+S2rD5QTeF6KCCo94HXN6iwi8e0gGXg6rXeemkIAEEyxYL/QsCmvrfSDOdP+C+6A/5kfrhtTwmM/P4c577gwX2jFo+2IgBCyVyH2Sj6eVwo31T4YqS7ePOpEe6PiO6kkcxO5ivkBV3JIfZMyCfoWLRNo3mn8a0BHJGxnK+iN+jgzt61wAQZR8o5CUeKVIDy0sRo0mUKg6N/1fGxV35sZj+ToUkNUiOfFgBYjduAgSk7mr56/S3T4ndxQlGIg+hTMLyPOmY/ee6kJUnyKC3nc4ilCGn8YKHV7pyxbiprcnqq4dRS5nlJeWsRMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zRIJUbfsW7r4bamFZeYoN+rBwMZAy+S31lBE268fonKULTLQBKYdzRpKMYAr?=
 =?us-ascii?Q?8voZnRnaF9aFapt5a0f0ocd06CTqtOa5fpKHr6EH0iEZ2ZddkJgkY3+FImKH?=
 =?us-ascii?Q?EKg7sHHAarlivv+wT6rX5mCItES6ZTJ8tTVujJwWjGhCth+Kf5//p4cwbA69?=
 =?us-ascii?Q?s/2n2Qqa3+VqZiQneNyPr0mkOyDj/gi1bEZLQYW+dqSMQS+iy4/ItHON1tKy?=
 =?us-ascii?Q?StC/mSdG/L4e+GR24XRGds5BE1n4IsIoRfzLRX3QJmAcb7qCblZw6HAHOiJP?=
 =?us-ascii?Q?Kr+wOQuWPd+em28s5dPjRISXByOO+TYWRRU1QmoTSo2P07xQ3Aj/VhtY7gNy?=
 =?us-ascii?Q?KJidJKSp5o9jMq95eKq/zL8bV7MKqErudTJBGpLXgqEwhJLSQm9SWy6HIqHM?=
 =?us-ascii?Q?JKBduxYx2+/mUUSY38qZ92TSHrkOSe/kPpjUzoYnRR7CQxp5RTGpgDg8BYvn?=
 =?us-ascii?Q?fFxRMA8/cZN1JGRZrrEwcCCktO7Ms8iQTHveMfTOMKQInLkRRWv0G3M0OGlU?=
 =?us-ascii?Q?lr6Y9tuwYbqnygUZyYUVZNfTup3fQXiR4D+wYuz9/QMUBnoegLJmyfobTnAE?=
 =?us-ascii?Q?5deuAxfFp/yeHIb3+KlkLw89CG0aSUsPNqtHok+45Xa7Q4pwHWSOjpAG29/w?=
 =?us-ascii?Q?NqKAc7oQ6OrZRxEvnl8Wxof2HOwup8j5FMUFGtiAuAUoYnqYSb3nrmwyCqQG?=
 =?us-ascii?Q?zyq1C+vR3wxr85wE0WUOJ9fW6Tt2JX0e6bzQaJprFo8Zl2snAQ+i6pP7XaT3?=
 =?us-ascii?Q?UauZ0AJKmlzenYRRJDAh7Loqfb9up9ExU86R5FkqpSLYG3Qhdk0y0CHg/LGB?=
 =?us-ascii?Q?VlU/wjKNu7Ae2jrY+VODQgN+cgwEbtdDzwlN3Z07Kd179fPXqH8dsBdCQr4G?=
 =?us-ascii?Q?MFk6O7U4heFOPQ2IL9tRGnE/AhBmHQQBFh207r/YPbicKt8JCz4QlBfqSwL8?=
 =?us-ascii?Q?DGt/tjzPMw155T9WYmMHhixTWlpBYR4mMpiPLhEsnswJTWDstfqbBTzQbHgT?=
 =?us-ascii?Q?2m7obhhzJaQ+8w/DzJHDw1eGPlHMQoa1sR8KKCmghW8dP3u6/aREriWOttEF?=
 =?us-ascii?Q?jUL/ZcUsx6qCwCmwVogsoC2g2VpLehdp04R0r0YALyNxsatDZm/4txEgA/bC?=
 =?us-ascii?Q?gdr2/kpo/CgZRZGqjSck1Q6cktwsD++HViOkrjz1fWC0QGO39v6vZ2W8acFR?=
 =?us-ascii?Q?JKoPgpSA48kPt4/znGnre5zwYkAcNYbf7DDieby9bBMmwItoPFHSr+eoZfKd?=
 =?us-ascii?Q?Mk6NJvmyKv62ujguL2DB6g42quN3fFY1LP4t4NVh3yskrlCOdeRHCqID4tBC?=
 =?us-ascii?Q?DAZmr50m0xT6PLv60olmpW7EZyBMfKso1hvWZOZys7InCgLAbLrEdQhOypuy?=
 =?us-ascii?Q?20MXeHU183EZ0PSU52gXq4CLrtJ75oQVs5tfWdESiBWqtrOSsj9LSf0ktbN5?=
 =?us-ascii?Q?4tF2dEF/pWWwvf6ANbln+W/b6o14dbyvAZYO0P1/e7Ak/TxelgIkdzjhZE16?=
 =?us-ascii?Q?vsUqt/cDArhytXpbaf5Y9BfYiMmKceV77TbXUMAmG2KxWaOFe+JuAB2h7/Co?=
 =?us-ascii?Q?hWZitHWoYkJ/PuUAWfUgES5LsUO1oF9kFY7yLTQfDLobg93Mt2RFyCbcwu8a?=
 =?us-ascii?Q?C1WTzxFmZampVzAPpXSUpbPs3pDAl/KvsZzj9TGYno0EsLmA45Q/HDzHJGex?=
 =?us-ascii?Q?Dus6Aka3jl1XTLYIFeLqYZsfH14lcPlEf83aD9X+95cKfph/dzh0f0zd1Jzb?=
 =?us-ascii?Q?Qbg3A/Wbow874NSY34y4K2LuqV+UO+yXhoLd1Mm0dY0QHlaFQ+sj?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82dcffa6-1465-4d65-7124-08df0753f94d
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:35.7529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nc9mwVlGrCJnB/WA8oPySVxYcWQmUu6mr2lhctQ+UAqWyABv9J2z5zI0ByYAufPZBqSF4b3kqB4onzsj4dYOy56h8qb97kZUeZpSw0DHm2KeEgIKsk7PdaeZ+oD5QocI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332

Add pinctrl bindings for StarFive JHB100 SoC System-2(sys2) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml | 165 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  39 +++++
 2 files changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
new file mode 100644
index 000000000000..e2d18e0d4916
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
@@ -0,0 +1,165 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys2-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-2 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys2" pinctrl domain.
+
+  The "sys2" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS2 Pin Controller, there are 37 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is the GPIO function.
+  Function 1, 2, and 3 are the alternate functions or peripheral signals that
+  can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
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
+      - const: starfive,jhb100-sys2-pinctrl
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
+            enum: [ gpio, host0_port80, host1_port80, jtag, smbalert, uart ]
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
+            enum: [ 1800, 3300 ]
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
+        pinctrl_sys2: pinctrl@13082000 {
+            compatible = "starfive,jhb100-sys2-pinctrl";
+            reg = <0x0 0x13082000 0x0 0x1000>;
+            interrupts = <59>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_sys2 0 0 37>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 30704a5a3418..e701c30913ce 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -38,4 +38,43 @@
 #define PADNUM_SYS1_GPIO_A22				6
 #define PADNUM_SYS1_GPIO_A23				7
 
+/* sys2 pad numbers */
+#define PADNUM_SYS2_GPIO_A24				0
+#define PADNUM_SYS2_GPIO_A25				1
+#define PADNUM_SYS2_GPIO_A26				2
+#define PADNUM_SYS2_GPIO_A27				3
+#define PADNUM_SYS2_GPIO_A28				4
+#define PADNUM_SYS2_GPIO_A29				5
+#define PADNUM_SYS2_GPIO_A30				6
+#define PADNUM_SYS2_GPIO_A31				7
+#define PADNUM_SYS2_GPIO_A32				8
+#define PADNUM_SYS2_GPIO_A33				9
+#define PADNUM_SYS2_GPIO_A34				10
+#define PADNUM_SYS2_GPIO_A35				11
+#define PADNUM_SYS2_GPIO_A36				12
+#define PADNUM_SYS2_GPIO_A37				13
+#define PADNUM_SYS2_GPIO_A38				14
+#define PADNUM_SYS2_GPIO_A39				15
+#define PADNUM_SYS2_GPIO_A40				16
+#define PADNUM_SYS2_GPIO_A41				17
+#define PADNUM_SYS2_GPIO_A42				18
+#define PADNUM_SYS2_GPIO_A43				19
+#define PADNUM_SYS2_GPIO_A44				20
+#define PADNUM_SYS2_GPIO_A45				21
+#define PADNUM_SYS2_GPIO_A46				22
+#define PADNUM_SYS2_GPIO_A47				23
+#define PADNUM_SYS2_GPIO_A48				24
+#define PADNUM_SYS2_GPIO_A49				25
+#define PADNUM_SYS2_GPIO_A50				26
+#define PADNUM_SYS2_GPIO_A51				27
+#define PADNUM_SYS2_GPIO_A52				28
+#define PADNUM_SYS2_GPIO_A53				29
+#define PADNUM_SYS2_GPIO_A54				30
+#define PADNUM_SYS2_GPIO_A55				31
+#define PADNUM_SYS2_GPIO_A56				32
+#define PADNUM_SYS2_GPIO_A57				33
+#define PADNUM_SYS2_GPIO_A58				34
+#define PADNUM_SYS2_GPIO_A59				35
+#define PADNUM_SYS2_GPIO_A60				36
+
 #endif
-- 
2.25.1

