Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2099.outbound.protection.partner.outlook.cn [139.219.17.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068413BED30;
	Thu, 10 Sep 2026 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035597; cv=fail; b=su6af/CJXjMPe/daOQWQ6QCmTYiUsTSCRe7flVsIXPEXcwoOQO2ScHVdjYCPi+QazSxWMwFS4I57lpKlAU5xKLQ4kdMM8m8GHvLFKvnQ2rR6MXdDrIdXMabJD0GMUqqlGmoq4SS4FMGWxw9f3F6tXwsjZjQ0xdWalgbv7T3avgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035597; c=relaxed/simple;
	bh=fFjCz9mVHjy9A/9Ao+Y3o/oMf6LjiUqqCAFnbn/JQxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HYD15g2k2Cntj5sQV0k3K5/YReXxWWrRnzykWApX/oW9qbGQhFoLm1PA9gjtNQdsSvjLIlK3KPhQFAPn5Ig6tfW25yCscNZBhOFKUP1S47p0n4Xvw7AaPxBoZI5KehMTt4EHenWdW1XPVnC/uPvVRQ32izb99QznPb8/MBfH3SU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOFKsIe0dbeqv6afqnSDBaDK469H/GS3+NUG8R2W1DAvGz/LdJ7k32qJQEjw1Nnc3SrnnMu6zAvL5LnQEeO68CliNYl9RcHB0zNDF29C2/WA2cNK28z/F1vz5m+IHp8vLRjp1shAQPq6oaF1A1iBRh1r41CSt6vsIpWHxNJ/tK6wcbWDkYgL8jCK7pQQLkQNBg4yQmrw+Jsj5lSURXHOYWYMdMP2pUFnd2YiC6Qp9yssE2z+bjVbl22Nv+42tyRDb9t/6adKSHxFiPZtJ8WTsSyA8pZEdTcWynkp3s2szswRHsWTBsKnHzj3uAriAClPBxtYg0Rb85DbJKC54bFoaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U62ePPU7WG0aW7GVIWIBCjfXYlhuqkS/0HZI6FzIfMo=;
 b=BBllNc/EvdT3fGXgTFIW7/Q0mVON/JJvXXQzkTJGUc5WoitBhD0ORxpyNEVMb/LxD0T4amLmJQ/BVpDT/ir++AxC/cHX9FR2vh3MN7pE8AmhK3TeeyemsKIz4vHvHVaHwqQ2368nro+zeoE71x3H0Vqe+MnG3yWByhTO9vZmLMM7TGbvUF9IcYu8Fd0o5mWN8OhZPXb52Hroz1TEjya9KjqeljBSIWwGa/ukWugbKQu/cjSnaEoLEMyyPTkPmwwGDlhEOASTo8e3bQ9RkrYreKzNXE1kxNsOBDsMge+kqT0+890wrKS/DRxCyAao6cHM3SIRVnJPpxP306dD2o3Fvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.18; Thu, 10 Sep
 2026 10:04:27 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:27 +0000
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
Subject: [PATCH v8 17/22] dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
Date: Thu, 10 Sep 2026 03:03:52 -0700
Message-Id: <20260910100357.130134-18-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::21) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1170:EE_
X-MS-Office365-Filtering-Correlation-Id: 7863aa42-7ccc-46a8-fa41-08df0f22e629
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|1800799024|376014|52116014|6133799003|3023799007|10067099003|18002099003|22082099003|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	Mrl6k/ObduJ/aSFRCVGAEX6E6Jbm/bJc1Pa39Ac4y1Q4kk5V5LziIMSXFSYYMDpPrwVU4KzmZI8zDYfHWoJpgzIOcNEmICGIYGaAfAEwT6x/INNvJAy3xGWkhqXO8CpsSHLWOAKf4JWTnrldyY9znVYX2JJkAgaORHo6RLgVWjROD14cWe/DqkFNKC5z+/iukz2LyTeHmgpCZg4IU8caUDPTmTYm3PAk1yT7QPi97m9yfSBgeISJReCRcsvNve8wZS670JDLqSnGR0uBjT2IKbjvUlMeFpu6Vf9dgHlOj5QBToAlaNAaYW1Ho1U1MTDTAZ/gIjo3ogPGbLJPaPW29vN5Mqs/gClHBcTkstuZRKqJK9yqdDoMpGQVyGIV77MYCkmwFlTmYytgmO8n/zeR8+6zMZsMmKcMfNTrz44p+NAvkPtNG3fCABlyhyE6U4LPookSBEdg61YUG1fpm6ocFiUOaEgSnpesDhv2FCAXc7V5ju37FGRj58JxU6Vp8Pwfqvf+NgYqaIfZwrHG5QN9NSDZgGss+TaXqcHLBzTdIPKnQZeGe4PmCm+30R+pbbUgAweTS2tQ2Hqr83D/WikhmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(1800799024)(376014)(52116014)(6133799003)(3023799007)(10067099003)(18002099003)(22082099003)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RiGXUu/+tAGNiy0hzsrzPk7ve1AaCvSVyoOiUWQMfOyoK2U7UoHpNHwJkqUI?=
 =?us-ascii?Q?eBJbPwv4xcDHahk8H7EEpOedQQBgzZiD3Dapv608/Q4LS1vJCmKuh8szP/sP?=
 =?us-ascii?Q?cM+lFg1Z/nPNV22Vn3EC1tFMSSu53pG+ZT7w/zGErHBCWUPtk7KhopS/hhz7?=
 =?us-ascii?Q?/qN1j3agLF1SLEz/5DDcP8D4B6+Umzw2Y8uZT6GGABqGbezvdDe3VW/l8rjq?=
 =?us-ascii?Q?4XzjCYj8+lwc8Kk/4oWl5o7lG0TeQA60y2pmHe3qXvM52w54rIaYBZRAxLUQ?=
 =?us-ascii?Q?KXD6mIKBLrWUaC2XYp1UhsdhpzyKGQhEfjyvzLXS9eea8eRkyea0gA7ck4lK?=
 =?us-ascii?Q?3dO3vNX2fZuf2dFDio3xNMz1EK/NsclxsB2Wt2dQIxKOPabgfReiuIz+A5Fv?=
 =?us-ascii?Q?6AfN30qT6u9Airj3x6/7nqTKtt++/JZ5ushbbHQYIgPmsAqaPjzXl6en5CBh?=
 =?us-ascii?Q?RI5hBc+oa66UxTJ6iPnkbX/lt9qH2g6cVaDuUtzxjSbQ5zmXRHrZ3dxFNqCi?=
 =?us-ascii?Q?p08lKG+ffGlqjNj6Y0S+uPR33tWZI708VzoDmXVQ4wgFnswDF5bpeY9RYR9E?=
 =?us-ascii?Q?bauusbCmqSHdP9vLN4Q/+X4RlYtLXwCa6Jr+iQm7+CH53E7EA1jUHb9LFkZb?=
 =?us-ascii?Q?It8tuCNyxYelL7nIslBZGmvriN6b3b1PioBwiEF0Wu5LN0oDSKcbewvAJWTB?=
 =?us-ascii?Q?e8JSwkwfhlI/DpdoYtt2duL/M4CN+Cdc5vbc0M+od+aSm1TY/X/y1pkepNz1?=
 =?us-ascii?Q?hACVe8pzNNKw57sGcGyiOYgsw63sfwO0Rhox9PvNbBtg/pGC6LnFdov5u+EF?=
 =?us-ascii?Q?FoR+t2kuuqrwdRUH7b6hjs0RSDKQfm42zUNtem1S24bIj9qzOLGbmwJot71V?=
 =?us-ascii?Q?dooAi1eqcVP7cVksHyPyZ2pNEK3TvbImXInFK9y55BkqKCuw8NyW4ZpQzGI3?=
 =?us-ascii?Q?REsSQPRoQiM/PC1YzVN6c4LREKui7zZC91ueH8jkFhyq04/C9qU5Cqeln2e4?=
 =?us-ascii?Q?wbL+la31EOGg/NkG0Y4dQhdQZmBccmnTc5ai9eBLI9FSG69n7yzI9iR5PvYj?=
 =?us-ascii?Q?/NvX6oYZB09u1tiScTJ4xfxDrCd5wJl1dyZbQkphiXEK2if0+NjrQLKH/lZb?=
 =?us-ascii?Q?O5wiSZ/CnhYYrHGaozmtW5mGUWn6rBZNbYxGseofzcsfmyulGooueafakpmz?=
 =?us-ascii?Q?3etE17T/PLaQ9DhR9JDwBXK07zcRZPpakLy1gFcwM5mIy6lsualffNWrhc/Q?=
 =?us-ascii?Q?ctYTXF/9ch+rcnuOqQNs4c5L+OBgtCvlJvW1c3V577Aw7HM6Bq0qFSR3S9TD?=
 =?us-ascii?Q?FHIkr4ylDaxwxnLKL0WYPJfxMtjFIDQVSeZzQWGQsJoxknQFDfcRy4N7LQkx?=
 =?us-ascii?Q?j8HWrfJqzJotabtlP7Xa7MBoXSq1U3Zgt7eXb7tC/OMJqq1opCjvmI2FnnbH?=
 =?us-ascii?Q?NlbTY5xg/sTNK64wsb5uSf/ezQnCt5kH2UHeKco+iW3cwhAfwOe83lmw3dD0?=
 =?us-ascii?Q?zy8W+hoeKN5Ne8IdmR2M+Cxg3kRis8dL8zjSnxCKeeJYt8H8ZQcTYFARdVTY?=
 =?us-ascii?Q?1FU1HoW49r/v1omEZhC9pocffPzLv9nSLr7G1DarvasaZevdP2sJtT0RzJ0U?=
 =?us-ascii?Q?UmehKeRL6IU8uLcL50fNuvhYJuqbTP2D7/vVJ0gVwBpVP1rT6P0a7UJWQuum?=
 =?us-ascii?Q?65alMeMPzu6hKaZV/qKl45nrMZ+Bc9EIx8F3E8U+rNtOgm/6293rErKxyB5v?=
 =?us-ascii?Q?jt6Xd3++lbvrO+1KP6aD2mi+TUN9pwGCpyLYPp6kq+6MbP9C9AFk?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7863aa42-7ccc-46a8-fa41-08df0f22e629
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:27.5737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYiQsMyAaLSh+IZ+thdyE6qtIShtHqsJmobQIdpfP1NOnJho85TSqc33JE8NQpRBoLzFC1K2g4KCL9JhvLZjlwrWN/3HFe/TvsY2cxcQkku0D/1XG3DFBoHHyY/eLnTO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2 Power OK
(per2pok) pinctrl controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../starfive,jhb100-per2pok-pinctrl.yaml      | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
new file mode 100644
index 000000000000..28a4d7f30cc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-2 Power OK Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per2pok" pinctrl domain.
+
+  The "per2pok" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO interrupt handling.
+
+  In the Peripheral-2 Power OK Pin Controller, there are 18 multi-function
+  GPIO_PADs. Each can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function or generally the GPIO function.
+  Function 1, 2, and 3 are alternate functions or peripheral signals that can
+  be routed to an iopad. The function selection can be carried out by writing
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
+      - const: starfive,jhb100-per2pok-pinctrl
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
+            enum: [ can, gpio, host0_port80, host1_port80, passthru, pwm ]
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
+        pinctrl_per2pok: pinctrl@11bc2400 {
+            compatible = "starfive,jhb100-per2pok-pinctrl";
+            reg = <0x0 0x11bc2400 0x0 0x400>;
+            resets = <&per2crg 1>;
+            interrupts = <63>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_per2pok 0 0 18>;
+        };
+    };
-- 
2.25.1

