Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2094.outbound.protection.partner.outlook.cn [139.219.146.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE653939C1;
	Mon, 10 Aug 2026 06:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343839; cv=fail; b=ApW51RTJeLBJk0L0QoZHFKlZYqKXfrU+U8vDx1C8Cv8CTLAxQ/mMOQF/wzQNvHBCinkuDRkGk6AdvvcWTFJys0nQz/rkKs4PGzm39j/EvwrsKFPaxPvFczHOXvIFseEtL//Ewix/U6SIsS89BZcMURKDEYJTkx7reDuft+1Bsrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343839; c=relaxed/simple;
	bh=rudm3n0i5PZ+V1YfRY2W5m/B5UNmfhmTPsvFAqyLmnQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T9blHRSFxA74yTk4wfz5Mhc2kiIT5S1iDndnGQSjMs35BjBKjvr3eomVuy2Pc2DhMTo9Bc26iO9v90dn+/+z6DbqXHguI48GyqDyP30/FrrWx7ifrZ1mLVMfGTfV70hKBjeKEcbWFxvhDAzDT4EOz7u5VOsP1dWX6/6xaja50y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4g1ammCmzG+n6qTd0zNoW4JcHEk2VOhtIaJBC4QMofZ20JKcGxud5j7ptMr7zX3hmvLo6l90D34WiveB/V/YHTblFhUDx1Y2YMgpbDxy1R65y9TNsq0q3JoXoIbay1OO5XrZb5uXsE1uy/Ed00TTQmOgWsVloNgt6ymmgVI7E/ugTBLNrEiIcgWXDf0G7Fds0lzCwsXSeig35jAXXSZPbT739OgKN8UajOt+f0rXQaB0Ltr9kO7G4Rr3yLFgQdwqyGnshuZ3t/Oyee4/Cm2JcwiKC6yixemiGiGPp5B5DtwK2G5ZRFBMMzSnJnxipsYegjnHw4WnaVllYi6AJnzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqOsnnyUxYRFUZ3rWHr8aeNRlPvJwrSpGb6ShfdFBWY=;
 b=HrlNtsXld4oY4E8IfAygAdq2ZAO5EmGOSnmz++XwW+RlZ7QWDfq/iIab5sJGVFkyO/I0Nkhzb7sS63OKTn8MPngg31c1QJr9rf9ij2UXZ5kXsXJdszkoMDC3qU3t+YalrFI1hi/g7q+PvfhnwVdUSHsPC1ASWQ4cjmiljEjdVGReUVeFmoJcer0BtlK+SOpOlDVLRa8tY1q9zrJsHEVPQ5g2lFxtEH0MbRSjswsURaRQ8xE9KrFpq3EGrlWbbzeT0y0NC3gh3BbC6Jx9ZzjECxjfFpJHg4ut7vnL+UW7d1RG6g3I9WUfPHvfuPy9bj+Vfv0td7OLRAfxdDDOgOCQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:02 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:02 +0000
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
Subject: [PATCH v5 03/21] dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
Date: Sun,  9 Aug 2026 23:36:32 -0700
Message-Id: <20260810063650.239303-4-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: d919ceb8-124a-49df-043b-08def6a9c95d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	vUeOQrgChTq7LfWiZMTtGZI6zz7vKT6DdMrQWXAV3PxM01e8gqWBEIrGn52fPXbG0nc6lnmDPsu85X/efzgfksXHOEWgFEOMwCYQOIvHN/YdaHHQaGR4KxVd9jrrjPRhhWHL7zvRE/iPKrUiWH5dRk6lk5QfMvXM6HX/Oz0Ca1pEgatTMg/nQlaVjBVdodf20VuhM9O/y+bxtUjYm3lv8sJj5S104rnduPz6QxDWwIURhrEHadMqVu2v/W8Jwl+FkGS1jcDeby8/4JQMyofB8hQUmPzed51Lub+FOh1h0I0oFZ1MIgF+R3Ko0107BraE6F7YCH0QGP5t17RbDToA4S397VhQMKTtcASKMdhO2gUzLNVdujyGnqMd9NGV5lUWT6z1srsSO6oPm410HXRff7kpXWwU6uG9z2wvynHtuUbriN7QSTf5meVCW3OY6XOo+6LzP3juVACYUh+Vue7JdC7PnWBp58hnjhIz9pDGxY65VQpCl5a+nJX0wDEJynJf6XZFkRh9WchWx11u4N9QAK57HajgCkpFhyUQQzKOoNp18lrNYT2MRduS05YgsnBIk7FJj/U3qaBgKmhG642/ag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?95L0YIIfaIVtPNVanwG3JzHGLpvw6eZ5/acSqxtg2D4LWPPfS1KXmw6RKeDl?=
 =?us-ascii?Q?11s2cmN3q9gdiDqx8peetIGHdmfoP4KcJOytu2AL/ts9SDUwyn2Kg35lsAEd?=
 =?us-ascii?Q?FqFli4D85aoP5Dj8JiGV95P9+raC0cIkzM1FYmbWNh+NHDAdjCP5wByQruKr?=
 =?us-ascii?Q?0vBU0Zq8TAAOFwABQWUk46k+N2C+wEzRxAO99gz8SXTpdKzr8502z+3axwLR?=
 =?us-ascii?Q?c4mpL5L9Yr4dsH/ukAG1m8DsPSqZ5b8OjqUFa7JQZEAu6O8naK26Lm8ul3LT?=
 =?us-ascii?Q?N579Nqfri2R+V7O2E5vBxe/tZMoxzfznjUyzCHnZmqpuQ1xLq+luX3L/Ahd2?=
 =?us-ascii?Q?B74eCW8/bOyqIifIm8rMQW4ZUaC2ezqmLoti96YS2X0fYECXtx/AQqRqlMGs?=
 =?us-ascii?Q?3dxzR6FhDJIuZ3hPtye4cPiIPORzKdDjWfd5LuEuBEA3vP+9R9SGAxcMT9Yk?=
 =?us-ascii?Q?a6UXTcAh7ssVI76U33uq9Vzh+L5MkMhLM/Z+LcHepWhVYHbXQnv4vk2Zv+aU?=
 =?us-ascii?Q?lFoSY90c/7/pPSQbwj7vRg5zztG0hhUEkxDWxknOrm1XLJx7O/N8UQ5Yq79v?=
 =?us-ascii?Q?VGWouTUTHPun49Rp/dIHk/En+gXozsQDSKO5O1V38Ep23jdU7ieUttbAGr5n?=
 =?us-ascii?Q?aIVrSkF4BXd9izRNcjAxZvY7B/6cj/duLM8G9IlbY6GgXfZbJNDK1umfMFQv?=
 =?us-ascii?Q?PLRK5/EJxb/FLXvvm8oTLYSn8RTW3D06moVol/h2LZqLZRm1upPYhvSEx3Vp?=
 =?us-ascii?Q?6te8Yun32YGIGcHxkshz4VxZhxHOfAeLWsOAgA4pZurnqw49StALkMtgmdt6?=
 =?us-ascii?Q?ZO36d2C0msIfBJeohteacglV7+s/QIRqwsEPzz6o/41F7ynKFM1V5KUV/2El?=
 =?us-ascii?Q?Y3XFb9y6fes/FKUUhQhUpIi5lZLFrXafHB2n60ZtHdchzMmHhl1BGQDOg7k+?=
 =?us-ascii?Q?FW2/BmGXQVp+goP0aqnPz/a5nB7A8VdLk/F0ZytxXQC2r2Y1JZOOvgMoYqkU?=
 =?us-ascii?Q?C53npoQb3OBNkv4xaecFy4GURRpymIix1QuZaI/+sr2DUU9FW6JcDyutuEHr?=
 =?us-ascii?Q?jNnMtTH+0pdhA5R49HUUkcyOqutMPv0Qshc6dgOsd95H0OE3nFpRKrr1HKWB?=
 =?us-ascii?Q?Hwu9kSPBEolSFt9PehAgrCnJHw8Ct5RbWBwCNcSARvCGq4v44/591No5qZtv?=
 =?us-ascii?Q?nz3NfGVQogr8tbRcShuS5WMjV+v6cmiJEeIOByQrXRclCd3ftiGxo2XgA6qc?=
 =?us-ascii?Q?YLlNt9vMjdIXrFIhMiA4272Gu/tZyDA42OwLzTSSOjq0MD4ALvzo6xAi1Qnv?=
 =?us-ascii?Q?/QTRk7L5VPCDqgmwCHduRazyW+zUnb/++VjGNbi/ivs646MjIKEDM28C4Dwy?=
 =?us-ascii?Q?iqe0K3Jl64IcMZ6fH3iaG6GwcWV3w9Y0oZ67xtQEYM82tCxO+4su1P8iFaTH?=
 =?us-ascii?Q?8PCKDzPgdrlR2QOqP0Dvt6exmipdplKvi+/gtmq6bxnOTb/xtgA6AA1OAPhQ?=
 =?us-ascii?Q?9Zp/EaSNoBec48PM1sTF4j8nypuIX9VscQFG/tgnxzJS8JiuLtuZoycxUncM?=
 =?us-ascii?Q?C/dTuVcjb1P8wfQ6muPiEyUtS9vs0YNnuwnakXUZub/zLwB/hi0cRuJB9jdk?=
 =?us-ascii?Q?Rv8oSIvm1fAzsZ2oIhdilNMeSS7EcJJPupJ063t7M1wzSEuzgcMAvp1JEFy3?=
 =?us-ascii?Q?xNNH00Hi6376w0GAbI9eV8v4p0QfvHF9+r6zYPO5lBjkZ7NOWnUUblAC6oEF?=
 =?us-ascii?Q?HR+brr0RJhsydtH5hAScjGpPN4ACH093XBPvwoWT6MWL5LJy8OH2?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d919ceb8-124a-49df-043b-08def6a9c95d
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:02.2931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtPamgDywpiBmjYFEfEXK6b0cejzyVp+TGdAom2gSaJCQQGlxGFV6eC4q0fojc9iLV93oPCpPRHraSiL+nJ6EFNrfIaDZuEEMtWcPNlDT3Y1prnz9HoBseFMIlVD3WSn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 164 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
 2 files changed, 181 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
new file mode 100644
index 000000000000..7df1a1f39f14
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-0 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys0" pinctrl domain.
+
+  The "sys0" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS0 Pin Controller, there are 4 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection and each iopad has a maximum of up to 2 functions - 0 and 1.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Function 1 is the alternate function or peripheral signal that can be
+  routed to the iopad. The function selection is carried out by writing
+  the function number to the iopad function select register.
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
+      - const: starfive,jhb100-sys0-pinctrl
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
+          trigger enable/disable, slew-rate, input debounce and
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
+            enum: [ auxpwrgood, gpio, hbled, pe2rst_out ]
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
+        pinctrl_sys0: pinctrl@13080000 {
+            compatible = "starfive,jhb100-sys0-pinctrl";
+            reg = <0x0 0x13080000 0x0 0x800>;
+            resets = <&sys0crg 2>;
+            interrupts = <56>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys0 0 0 0 4>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
new file mode 100644
index 000000000000..6d8f5516a178
--- /dev/null
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
+#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
+
+/* sys0 pad numbers */
+#define PADNUM_SYS0_GPIO_A0				0
+#define PADNUM_SYS0_GPIO_A1				1
+#define PADNUM_SYS0_GPIO_A2				2
+#define PADNUM_SYS0_GPIO_A3				3
+
+#endif
-- 
2.25.1

