Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2135.outbound.protection.partner.outlook.cn [139.219.17.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAAE3E00A1;
	Thu, 10 Sep 2026 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034725; cv=fail; b=VKrP1G4Cbx1/G5WIn4z6rspwl+8mYpz+ub3Qw+pYapfHrHF7LMp38eqVXRqFOepxWk1Vzu1KaW8wSA4AkQAMpqNDzWHslmO5eDjQin38RCGz61TTiFT/88hCXblpKjsRzo3HAiJoCaNDeGowPyp/y6EMy6EsbOdbHSlioOBAXV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034725; c=relaxed/simple;
	bh=tA3vNhdR8D9CQVTX9JwiP8BoCsOg07mjI07pGfvtL6U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b0aw5blSrH8KBc7APOH0eJIUUk6IzTy14DcKeh6C0iKCyMfNLUmfqn3s5HTd1ws7rx4+tpmItzjlypeENV8w6rukxoRa7zanGyL8DhRlZfNdVAumZFPioRaGh/S9Kq8aUm+vACo+GMNyynSvg2qoem2z2AqVpThsziTbzwkXu88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fs587HHTnvxoqrfeu6Qd+RBEZWhQU7YJDQPw6EEPZocc5ruVbvphngFe78BiGZHTBxHtU9yaokjXYes96yVBV9Qffg/7LTXWY3+m8pT8OKIkvAFJJhlnkmEXZTlyK9uHDQnWm29+e00lTq1ndwVqJI3Mx7CSR/Rl8YUwYzYPyIaBCF+7asKwjyLlBSniIDOw3m3l46eeA1BE5qEKLK3SFOw+vzkL0S6SDMLcoCZDQxCXO6pwnrdgI/TlXYkQ/6N5FVXGLxtONMNQIWW6hN9Ex5uSsLvUXCH19/cvWDz2kV438DUiM8U1f6DxqqKX3au6+XhjFMS1CFZsmUTLFgl7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmBE1G2GYrLNxsb6xrIkIm46XXIAeqCm+4Ff/o4Tqcg=;
 b=epy0k/uoWffJPGS5Do6PxkQ6/6muy5tTOjGpIuCl7auslA3E3oRHSmjnEWaC0OmDvnwIw757y+P8/oENaXOJHtlVwGXLzW3JuOH/I/EGZ/1WI0GVwlgPAT4slbVODsoDAemlQjYnSUw/KCS5FYr4SYtqY4wpe/bPuZyXnr0plUA54zX6lultcKVSCeIm4iQcSILLl1/psVjTGTlWxKXUuTVeSGHcgHeE96qSKMtEHej9GFo9TrGXQtEhAPznvHnkH0YBS9ultmO6udpbjuccZTop4r93s6lJ1fk6H7Q7R/AniRwJumLqlpwrgzjVaG6h9xeEA1nwQyV3Sl5bzd5TPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:04:25 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Thu, 10 Sep 2026 10:04:25 +0000
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
Subject: [PATCH v8 15/22] dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
Date: Thu, 10 Sep 2026 03:03:50 -0700
Message-Id: <20260910100357.130134-16-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
X-MS-Office365-Filtering-Correlation-Id: 163d1c94-81b9-4380-7d1e-08df0f22e4da
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|6133799003|56012099006|3023799007|10067099003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	Va11nW+FYxvJBDScA9jK2OHTdF0x/ezqEuUUQ+lrLx5s75YbjxXMZVSxbOM+AO1bO50IStqdm2IDbYJM04uf1RC/0flLy3ZBMMFlYdbXVgIFrUDFEYEwxLlO+xfN8EDH/KAskEE42bhvQmiQPP9kN5+647Dx8XIx137GXBVP2YbyLxevgrKrgyyorrJdoZjN223Vw1txiHdUAqn086+AngzQsPOHeIOfrcckPT64zhvXR98luRZhQlzEtME/Kqo4PH/JH2uWzBHnHNwjAGc1TWnzQHmar2gCKHgsm044j4yNJ6ER0n5f1D76s1NlNunwMvUeipBNgIrOxYxnBkDsZLpi57SzvCE9qeka86nLezfEa8BPiFAIltDJQorkq4xXqhK/IVtAjSEfp0LhaWVXjA+a+2kixosiDQMFjmzqQVKlvYztTiJEmCfYNztUnOB3HXvndecfu5C7H5UhFDoLTyT/Bj54ERMnkvTyyPVDKHA5PbmogGei3YNxrv3UnRqzvohuAnNimnWBEL9rF4f7fN+en1bl0C4JOgb3eW8fE+dR74QuIfIp+nneAnmtnw/spB1Ax+n1OBCcNkJ6X8D5lg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(6133799003)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EEEV2VivWSBifDjqIr8bkrNnoupev5w6rqEFkqmT5uQJI7WusaPA72wCq04E?=
 =?us-ascii?Q?unTnSjTHgm+eP9IDxrUTO1lZBgGvDfg6aFElWVXxvCAkI+xQY8sXrwjzYinA?=
 =?us-ascii?Q?s7wNya6629CO31KXlmb/jWE6efZ2gAthS+R97pCZPn+peU4zwmJvQ5mRsvdU?=
 =?us-ascii?Q?F4S6L6w/AP1rnevoON6g/GD6DEYWkE/MYufBt4QHspG69mLKrp3sJ05HK1IA?=
 =?us-ascii?Q?a6nuCzFQGLhaHrbaNNGpWpgh2e8FXhqAB9ASB8Ai4APJVwLGJOCSbBjDxPfh?=
 =?us-ascii?Q?5aV9rms75HslAkopnEd77qNHrWbL3QaBWuLhL8Dg1qrurXNHkHCzGn0KcgFL?=
 =?us-ascii?Q?TOzPqPpOoYAITRfd1noY/bZBr0uHJV73RhwuJtH2IwPLN97lhcYxJnKmUbGJ?=
 =?us-ascii?Q?khPQOwGAyV5eBgHWLy9ssdIrCXwaAhRxJyXXfVtENVxkGNTtpGGsinA0+yNB?=
 =?us-ascii?Q?KogGkrzygwOItSwv8eX9j1EJ9U6eKOa9QKvb41jfvCB453G9QqSsuZF1cko2?=
 =?us-ascii?Q?D1E6MZJ0p0unARh7a9DxldHErJk52JnG1pwlXOr7IGApJn4G+RbuMS+hsySF?=
 =?us-ascii?Q?uWMW7KN2vnVUGlj5IYsrKM9UImCM/Ijc5vXaSO8NkPGBkvkiOHaeyW/n/y9o?=
 =?us-ascii?Q?Ya8qDLfEVp2A/XtXIoh8tFYvPjacnUzTvNbjTSe7lgxQ7IdKWu6GRT9KKLwb?=
 =?us-ascii?Q?MvtX8iaJMrV+0zkFJjzK7s6cNv1ZwB1NsOI6et1PPosBbvbf58Vr0zaQGzlq?=
 =?us-ascii?Q?DKY36/+Cjtb6L1Umc5oMGY0exDK/6SCdzw5b3iLH1qWQ0lGi0nN8YPeqICdz?=
 =?us-ascii?Q?jUT0jkdyOAYFsmEpdNetVc/zmU/hgRIcjpWiZR2XRnuZP5h53cUNivmgFsFE?=
 =?us-ascii?Q?0BC1YMuDejZLJGGglAahB9WHh6hLvXMSBKrtDgd4/MGVAWOCODfVSKRkg2N3?=
 =?us-ascii?Q?YHkG06KsZxRXugjItiSE2TViccEtU+y3jHbuD+5t6opfV/3zn4+ZnkLP3XJO?=
 =?us-ascii?Q?zbJxG+rTmajBeSRBS01t6ed11NfoScUb0DlVKN9cwZIQaGCzjmPO4N0Wvh18?=
 =?us-ascii?Q?zHxAFjsfAIiI7WAouEyIyVX23dvAT0dS3GX1qEw0nnKB3j6jVn5eonmYOlk2?=
 =?us-ascii?Q?6wmpImde7Frsp3OP+DTn7vpamoz5IWPJLLRgvKpjcDZ6eyaRNBl7Bo4zAl4p?=
 =?us-ascii?Q?tRJ8dSVvT/3rq4ofedivT93NE0E0QVhLki6NMJ7+uCt+CK5zb9gmCpKu3h3G?=
 =?us-ascii?Q?qPbvo9VfCHZacLf0/7/bVO23z1WNby7uXsfZ/vex8YA0xJUb1PDu/KbSrrQs?=
 =?us-ascii?Q?Rw+Q4GZmXfdj+txMNpclJzst302gW4zBGIIq3x8qcuya06a5z2AFkZO+jU+f?=
 =?us-ascii?Q?OTva3cPk8goYNMWiazuTYG7KIlNwIfN4gUmXzJqE8hcZ4HXAVvezJgJ0sVw+?=
 =?us-ascii?Q?ZwaxKhafVrEG0PJqdfHy4+Yt4xzukOmdkZvMznu5VCIRRC7mgvSgA0EwKTPN?=
 =?us-ascii?Q?BnN1n2WgzN9zdrl9onvFeIVsQyEdmYRNWPeyveSxxjD43dOPr2sw7bSZqGyX?=
 =?us-ascii?Q?hGDzQh3OzEXLQ1tKIRxwcs6creqZ2eDMkvnBdbVILWBBETKa1teDAA4sJto7?=
 =?us-ascii?Q?+hvih6X06w/zMJKc2qZvg5ocyfyzcbijcFOtYUx9wEgjbHRaclqu8INoF3P5?=
 =?us-ascii?Q?aIyiN9PBxGeM6WCadcsTsGYBns1Equhvxt47S8ckRlyoxFH7qDqM7ZxMtu9n?=
 =?us-ascii?Q?SjekvNmbQtoxkCGm7H9zrJzf26cDTsX/zE7ux1urRlJagj5qZQy/?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 163d1c94-81b9-4380-7d1e-08df0f22e4da
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:04:25.3645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2r4UNo9e/Iu3M4cUgr/qEYtuNOmpOyDPEXN7anzScTsHBI2txKIqwEmBW6OsD/L/Dno/c9Jxb/I/P2NWce6hfWBYouSfpQgT8Fs92qqS+oB51qq8lBWXPDm9yjmoPlz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per2-pinctrl.yaml | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
new file mode 100644
index 000000000000..18ee37a2bb1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per2-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-2 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per2" pinctrl domain.
+
+  The "per2" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the Peripheral-2 Pin Controller, there are 31 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1, 2, and 3 are the alternate functions or peripheral signals
+  that can be routed to an iopad. The function selection can be carried
+  out by writing the function number to the iopad function select register.
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
+      - const: starfive,jhb100-per2-pinctrl
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
+            enum: [ fan_tach, gmac_rgmii, gmac_rmii, gpio, host0_port80,
+                    host1_port80 ]
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
+        pinctrl_per2: pinctrl@11bc2000 {
+            compatible = "starfive,jhb100-per2-pinctrl";
+            reg = <0x0 0x11bc2000 0x0 0x400>;
+            resets = <&per2crg 0>;
+            interrupts = <62>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_per2 0 0 31>;
+        };
+    };
-- 
2.25.1

