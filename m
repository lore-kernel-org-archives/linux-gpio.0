Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2100.outbound.protection.partner.outlook.cn [139.219.146.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF6C37B40A;
	Mon, 10 Aug 2026 06:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344801; cv=fail; b=Q+DPLwL/sM5tTS0WFzTdvY6LLuBkMwNRo7ttUkndpxfWXCM53j/EDA9pMZBcTyh0ZjLUiEXePzZcpyYlj4nAJ/0SNJ+FwfE7/Zw1qv4E5AGa2rGz/kD18Sv07u19j3Frdv7w0EX2T6kvhCRjOcKdqQJD2v1msFTQcdZ3FfWuyao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344801; c=relaxed/simple;
	bh=Mjch9287tK0mSMv5nBLm1sBlUxkVNt+KMBJg8is3QbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D5w1KzsVVzzt7NZZB2TVh8GVPlJ1iZhubjY1VEaj3sQhERPDKNpI7UfP9+B9eMTjEz0OuAnaTQJ9gXUL6+aEEUGjbr/CaqUFEGzAGrgZ6CLzB7aV6rak8BKq6uY5o9BlM4sMG2XBG+1TkvbyFW22mexUzl9EtZFRdy99hT/bnE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHtECkZLtw6lx4Lr5SnjLo4WbZUZkxOqej9X208p+j/9NyDC6t3ZNeQm/4JmtquT4N4w6qzvmHYqREzvNtMeD4NmQMkEtWUYAfKpwt1a0lv/qfxpWUnBb95Rf/gRSsErLkNOY1CMovMUIj/LxhebLHlPVB+U+jvm5sghmr4bNmab4SnKSvJooH97DOOJTe97mpkG01uTxwJvdvsT0fGegDkTwbOwF2qxoA+XdtAHkIgEmVNDbK46IC5QwVgDn273qqcHEFQGSKhPYZ0NbR8VeQAR6vCyfMIuJ5uVmYvzPuoNTNvyjO8MKpkaK5MV0Kk9o1VNNp21pHfVlJj8xarYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSBLuK2AxPeUlcFVB5gSSThNBi0/CA19WYsLzLjI7ts=;
 b=cOY2yTGsyKvYJJW1Uyd7yTrLtC3mJFFpuufhdUmtBYcWOefh4sygSg6slkFeagMPIK1SfcRMlnQyPqTZnxtxZA1bRFizWqhvct7TKANvRLUerNWeJQiNwtD3cxjKUi9elVFpPKHzR5OeSUwd7JggxuKdqFiasljS0iW/4odCcaFSjV52n6zi+YhaLoK30sj6byjXk//yH4DnZi4TmOlfqN9TdzoGy1ynhcsQSKKmzC1v3SlGxdd6gApeAYsR/1/MU+8f4ctjIs+mgQajcfoU6bRI/n9D7OiRD5bKzpRWbeYK5u06B41HOifDP+ssKr8O0aQ2H2OHDaYKZqQ0zbIRiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:07 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:07 +0000
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
Subject: [PATCH v5 07/21] dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
Date: Sun,  9 Aug 2026 23:36:36 -0700
Message-Id: <20260810063650.239303-8-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6cddf68d-adee-466b-6907-08def6a9cc94
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	mxjKAwUBQnO1ocnkUvwbDcqmOe0/MLfyo5H9ORqaQCq/7pE/9jHi8L2s6Qn0jnyT8rtGh8A4qZ5qXsUpklBnhRX0WnEhWvDii2NXWQ63lCCBbRm4WfnlQa5K7BTvJLetnGTrr+jmmcsHlWZ9lGhhYe80BYUtz4O8ygsvDBL+aGFcmYZ3RzdcgyDq3UBx+ot9ihFnQrOOL52qsn0IcSy0dDFs1rvlkcKXf7SOTousU27ATPyDdQNMEOcl3NZU/cU/SfePhpWeaU7lCtY6aLMWSwczO+SzuQ/cVW+LDNjXFJZ4Uu3qpbGNyclEUrO4q1sosT0Z1/FYC3x9mvXd+YBW898fiTzpOW1Swclwc76cGCKTkzuOUFPyWueMs6sXQYTD5nkjzQTu2Cueu1unzqRPDSFNnq7NbVeneCL50nbK5aOIk09LXsuwmfFf8yLX0Z8DcKvHPF7xoocW1/vDnt7svdDBYMeJJRy8rB8oRlUX13cMjkSGxbOoOh0rDvP2HR02pldTr0EVduILs9QvNerSBUJTRDqI6amUtouGPZF0kFK5wW9usiGSHHcNBnC7Ry2iXucJE7Q1IpLlGXxjCNG67Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SNTt/t12LSP/9p5j4/Lf2UhTQX1I04GwkOHj3hE8KWq4DvvsePzXjQ9riOcc?=
 =?us-ascii?Q?TfIYVdX4oZH5V0c+a+XGo7vhE6gaEsJe7yxFKnGAhIyEF3kgi9dzhzadWEKe?=
 =?us-ascii?Q?8/Q3h1WoZ/mWt6ZtEPe2vHIjtytbqLFKOCsaSH0Npem9WQck8yrHhz3TmlHX?=
 =?us-ascii?Q?kx54a4oOD3JbrEFCTPISmhokJ6fADw3lZtmCqkG9RmgK8QalCJL4wvzmkgxY?=
 =?us-ascii?Q?0gB0HtlrdbvW9vrUPtJUAqdBuz79MIUXjIEQKLx4mYB05R540wy0i9z9gB6n?=
 =?us-ascii?Q?6ksuyITR2ScLw35o+UM3uYzkQA769XcP+/F5MIw7HMdHAgVHi32PzE1SFksb?=
 =?us-ascii?Q?d/zmp0sAvAVkZBlDdX+spIgTwhDOY/b6iyVI7NCZWZf15jaefqKupF/LCOaE?=
 =?us-ascii?Q?g8lrwNEhd2N/o5Ap7KR8q9HfsILS2mx+VetWxRDIPMDR5TyDP+7xSlRig2w2?=
 =?us-ascii?Q?poFTOgyPwU6aqQmcNOKetM6+iH4pOv0nJa5xxp3jvLL+y6vw2TZLDKXD+554?=
 =?us-ascii?Q?6BH76mHfEhAZfqtLlqCshgXryFB4Fe1Oonaw+Vv1PJAJhN+9hF2mtgipYkIU?=
 =?us-ascii?Q?VTcA+JGRyZnxfwh+X7euBXMAIVTITmRg2izpff31v2qKDr0D/vgx0wuwRuZA?=
 =?us-ascii?Q?oOJLxblqDykKDAODUSurmWY8+VotZ30k+xJg2yjh3OyCKj4Etyj3/ZOs8Pw1?=
 =?us-ascii?Q?CoGWdk5TKGOuPR3/jd2n66ZdtdcANIkjIPPr4ULSSPY6oSwM52LWysosDz0d?=
 =?us-ascii?Q?6AMSzpW7jG4B9MVWL2+5PqjAjzk2i75wDJDfm43vH0swPVHnzaevwMHPPA/Q?=
 =?us-ascii?Q?YSx5n88LESxsnyASRm/9Yzd4wOSTj6SSnKZm7acCdzqVGx5BtQRa3Cgeh0Ds?=
 =?us-ascii?Q?c/0ilY/q3C07QP6UoU/91DXIN3G+vya189qbEG3ud0EFcBXY4c8M7WovA9Ln?=
 =?us-ascii?Q?YyIeS3cUOT9KluD8joxHnpXWKcujUIYGmT7DdM6l2OY4Gbhyy9ex6XbSYJpd?=
 =?us-ascii?Q?hA8x83kfYmxRsgNMNvaQI9QvB7/PgixIYr8BAQ4wNzw4j70fS6l8Je6HZk68?=
 =?us-ascii?Q?i6Y4kR8V2FSGPRkYSSBdzQevZ6dLeiUFLU+Sn+jJhVjK4LmPVNBovx4CCNp2?=
 =?us-ascii?Q?rhlCvyO5yW3ltSHsmOebCXgBVvzb4UTyrZd6DrCXj8KNYYzK3yu4obnWlgiA?=
 =?us-ascii?Q?f6XRAPIOGipmZsUJcLWxqAnnnRGGPCVHTEGoxDqhq5YvVFvHxCYUqMeYsb15?=
 =?us-ascii?Q?CYwT1QyfrRTXjXD+tEl7sQIhC8Ulo/U9+J73LUBeR5+gayNNXd5gUxax1se3?=
 =?us-ascii?Q?PP2gVW2dmAdDxM1ReH9UyvdcnA8H3PrS8EgbGlKJXdmAEgcRIEGV84ofM/xk?=
 =?us-ascii?Q?j6/CihJKFmggfdQy+BWEOOaBvKJePCuy01rbatZY3/VpFUS8cAVVg4oVh4kq?=
 =?us-ascii?Q?6obO/I1f/itXU7zM6B9AeYS4QB5Oyx5p0aSl290G8oeHzfe6y1f3DGk/b3AO?=
 =?us-ascii?Q?VfERar0ScaF6QJ2XyQfk2gKsbvMusY81kjV0X5Jd1nPf7BmMIDzHQfRAjp7/?=
 =?us-ascii?Q?8Cz6sjxrPfbPR8tkhkqRQjJwLYQrOkRwUepZ0de2+AIgbQ329z79jy+7DPqM?=
 =?us-ascii?Q?8EI7KJO3yV/x8l62V4sCCxbFEG/nUHSiRx7UkqtEcwrRIfG1Ki9pKggkLJzh?=
 =?us-ascii?Q?zcPirVJDEBOa2C5UwCZXHq4kCx51ocKwzFBDf0MPpg92SAbAapJCL+yuLEeU?=
 =?us-ascii?Q?PA36hrjQv4Om4HJ04hrDCyOa3QUVjhc=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cddf68d-adee-466b-6907-08def6a9cc94
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:07.6905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJeZkK0bta+x3DVGDo/3YzzXpmm5NNLMzTyc/9cnGyMQNAxOfUob6LPmkasu0BnOmg7rmmNYt9UpLbxWpLpldtu1klfbn5z6pwHsiUwj++s974ycQMePRQbPDvDjtEGd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add pinctrl bindings for StarFive JHB100 SoC System-1(sys1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml | 164 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  10 ++
 2 files changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
new file mode 100644
index 000000000000..cffeee8e3da9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-1 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys1" pinctrl domain.
+
+  The "sys1" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS1 Pin Controller, there are 8 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Function 1, 2, and 3 are the alternate functions or peripheral signals that
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
+      - const: starfive,jhb100-sys1-pinctrl
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
+          trigger enable/disable, slew-rate, input debounce nanoseconds
+          and drive-strength.
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
+            enum: [ espi, espi_reset, gpio, host0_port80, host1_port80 ]
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
+        pinctrl_sys1: pinctrl@13081000 {
+            compatible = "starfive,jhb100-sys1-pinctrl";
+            reg = <0x0 0x13081000 0x0 0x1000>;
+            resets = <&sys1crg 2>;
+            interrupts = <58>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys1 0 0 0 8>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 38d5a94e92e3..30704a5a3418 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -28,4 +28,14 @@
 #define PADNUM_SYS0H_GPIO_A14				10
 #define PADNUM_SYS0H_GPIO_A15				11
 
+/* sys1 pad numbers */
+#define PADNUM_SYS1_GPIO_A16				0
+#define PADNUM_SYS1_GPIO_A17				1
+#define PADNUM_SYS1_GPIO_A18				2
+#define PADNUM_SYS1_GPIO_A19				3
+#define PADNUM_SYS1_GPIO_A20				4
+#define PADNUM_SYS1_GPIO_A21				5
+#define PADNUM_SYS1_GPIO_A22				6
+#define PADNUM_SYS1_GPIO_A23				7
+
 #endif
-- 
2.25.1

