Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2100.outbound.protection.partner.outlook.cn [139.219.17.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A7932692C;
	Sat, 29 Aug 2026 02:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972349; cv=fail; b=Kg5VH619O/Vms0+dHwZWpoTaVvABBMmlDL9DvGhOt4JHFB56LnnXs7j37BB/rkUJNjCz/+OKpOZISPJskURz3H+Rg/OCJJklKsXNJt62Q5O8fGQEIadDkAHxRZG+HVJfbKG+odzXkcTHeVFWyPw8uPusEd5Pu+OFKmFuJANqfWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972349; c=relaxed/simple;
	bh=oSXLNJznjcS71FMxNLZTTgwzRIeiC2gyM3YkpPXButE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NzmH2j+vGlDFlvIdbjqnCEW0JDkT4eKNCgQ1c03e4MjWpruLr8GNi9k4c2ee1FlMkTI3WzZ+73qcIaXKFiQ9l4pggyOZQdTKoJRhEhrbQjNLteCwt3/EfN+qYxQxa/pWYfgPdeSk9/y37a2JnsVUl64BwpPkTqL2w7Flov1U7QE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9btssu0xYULxdVz9C2l8SGE+YGyXXKxEFUR0nl+F8+Hkdeyu9lh0syMV/FJEEA/OPBv7Wm0/uZA6CBoCChlOkwH/Zb52AqpzJHB49kTwfCb6Z8CLslgVNrumOlMNvhad9+884erJJn7jnumxud3GbYZMb8r2sZBBFvXlmd7MDEvnujX0VSNrfmqr3iTf+Tc2TNk4jc++Lp/SNDdGp1sRTwZ/QPix7ER+cPK0O61CN9phq7D7cgaeSFXlP0r3wqKaMucdqCfkslECjOmRpHvWovNCxsxhgh9e4YkG/QLbEv+q41ZX60oZFc5k97+xIMWVtXzls58YIdO3Rc8Ybf08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aV3aLvhwOuIB/OKm6RBRQcj1wE1h9lzDsywHHC/uPec=;
 b=IJOMXPzPHpcTCgrtnX87fGe2b13ww+teSoUnFGAI7v+F6MuAQTevMOZHyP5Fq+kBGJBGjAScSO/loTAVUZW0qchaKrd2iMFUoR58+pMfbBMEhAHTFqn+LxjgJd7ZtdL0Sau0DYlnHg3OMB3kpq3SDv0HH8IHypaYC+KZRNsk+dlko20K78meNmGDa52kFhvUd9PMtpnorUHs5WIQmb5wvoCtuU37BNJrVHMeFw0LAPewOOtXL06Gt6jvInCVwPVJ6TLLnu4X9AqBZil9Wi8MTONxRrhLymAD1ZfEePCmYvtGo/X4GPunldQb947pdXMKG0BZ9OZpFFhWWzYyGP9EzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:56 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:56 +0000
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
Subject: [PATCH v6 17/21] dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
Date: Fri, 28 Aug 2026 19:57:16 -0700
Message-Id: <20260829025720.23915-18-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
References: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn (10.2.8.16)
 To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
X-MS-Office365-Filtering-Correlation-Id: cd5a669c-d6f7-4411-1d00-08df057953ee
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	7olMDyT0qaWac28SPFZ7sLLFsfneZAjJJdLoIL5+D8awLWukp814xqnehBZBQ42TE4tAoQR/ZEmVhwRteEiI/tbZz9MuSaGV5Jl2Y0JsNHJ5TWoBLPl8waViSxN8kcOyQ1g60sCJDC05UNp8ywapi/41FsEzAkS+u+QkRqjN98Xfabd4RlYYxyuJAfQrfGGPKCGshXvfUxRO8y1wzWYS4pfAJb9rLT1HCTMexclXS0NhXuvv3AxtkIGmnXrcbo+o7wbrsdek6y290Lmcdce4WaFpuCN8voMXf1FOzbVHKTNalrK3lzXQK8iXkikno5MQn6j0wiLoWCOoKx3a+iCSVYsBwiZJKK4zH7XbClBQGM/TpG6duKt6OF24FxulAy6gvVq1lSE9K56sZiDhZ7vKRjd/QSAsXUqhB1HTKvYNohr+DflMkuYHJ7Zw5aSWBR6+AOiBiL6ls8usZB893+z6K5+FKJTikErEAIXsnrZXABZASBmZQig/bTXgL/AXVPi4AdyhVk+NVM8ax1I49MEZ7GhZOfW59iJcmd38ETmuSFlIhWyfLv/EAA8hVqQ92J9PIyfYcx9nb9IXLPcD3Ox1lg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fBiolmXU0z6hjSN+a/or9NxQpqCqc3NjEw2rSYkY+XRzkacwe9CYKSWK3QDm?=
 =?us-ascii?Q?r0XzW24JuxpYTzSe2NQaRYRyanNcqM3O6nnlCe1+15YUucgu9qsKwynID1C4?=
 =?us-ascii?Q?RObgIa5RCrSFm4hznHwluJN3ppEse8w6bQBTh4kjbfv9hXiaNwwZkviaChne?=
 =?us-ascii?Q?BY97Onv/cOSQdpi8obSr5bEvI8v1wmd1LPUC0ODoVUHg7J94oVKDQhD5ghPD?=
 =?us-ascii?Q?4Zxi1BSTapo/swgrRVnWuUS9JTMnasflXQcOVSWbo0KwA+ecMlCExcSbpRDp?=
 =?us-ascii?Q?mYkwPtTVxg5sL6FyjV2zmuk47uo7d1FctQp3vSpNRctku3Maghrl5PYlIw2s?=
 =?us-ascii?Q?SzergfkyMxjpTei6BvZmsJW41WxWzXsPdjIbTa/MtH3biOOh45fJqBD+UoFR?=
 =?us-ascii?Q?DlOa4/8JmocR5ZpDeINdAw/ZlU+vJPimzdJA/T3XfuXaeIRrSPJNByOu/hIH?=
 =?us-ascii?Q?tNDbfJ8c0Ff+ui24E75340M9hn7tJgw3Bhx0yvIi7cbDEZR40hucFRQTNJXf?=
 =?us-ascii?Q?tPF/c3L1iKexwya7OGcY0dLRqgEghddmwgG8BlUOGK/40Hwk8ityXPOnwWHP?=
 =?us-ascii?Q?h3Wrf66LLp25B+/8JGM5wgQNmbq2zdTO0Pn1lqySl1/XKjjabDQ+dSaqVIv2?=
 =?us-ascii?Q?zyXLH8eg1NF/i5YuZtAQRFsad+knMfj8tuYPUzk57JoeaW6wHgkN3Xbb0a34?=
 =?us-ascii?Q?jhC9KFFfwIUel7vuYhjdblWiFfKqUcQyeGs0Vw7jJQuigC50Px0xpnX1quiF?=
 =?us-ascii?Q?xeY5dD8rEsvouwCHdPruMhVHaURB1UKXe21Cub4H2tl0nsb75H17ICZ3ljq8?=
 =?us-ascii?Q?GdPsRWdVcx0ng5Q9Q0qGUb4pPzEpOO6Z+Nt5Pie9EuhBhh+YFw5rOAGWUFpe?=
 =?us-ascii?Q?VoIUbbZFnuyed1TCaAo4b7NuhSJpD+4zkveeAo3Jg38KU50R5T9Rde28jp4E?=
 =?us-ascii?Q?Uqz+6TrNyngdjq908H7GLwWP/ne/PEt6VZdLEtbWMH49aCuZrdBZuBsEcgQL?=
 =?us-ascii?Q?SBi7H7gHhyINGyTansZE/2Gs3UhZL2u7NORiw5811y5PHF0WywgCduZm0LB+?=
 =?us-ascii?Q?BLGcy3xuKZ9Ovg6ZNtmUSowindazeVNl+BDbETI86yY1z1II9cijrS3XRwhI?=
 =?us-ascii?Q?2OeZzp8oUvOUJUAOBO1U0Xo8zrR7qaiO1NJ80qAIQJrrpbhi4FG7aS1Emwnk?=
 =?us-ascii?Q?jdhWqx6K3sHewQIQ7QRyyn96bEF4mKmAkpr+eiFMX1pKmInESBlOcYbzXuvB?=
 =?us-ascii?Q?QbNDlC77KxjZj8xNgzV2uNQ34onxs1ULMqurRcNBw7QUz9dQ3bkE5aUGqQFj?=
 =?us-ascii?Q?Ng65U3M3qEfc8bp4aTUAJ+Ln3oQlEGUuf5rG5TiGugsKTMzDC/pB5k9oBBIN?=
 =?us-ascii?Q?bRtQGVr5spP+buNY+NOBnJq75udN+WjUdlR7cM2lCrCMgooycxRaXrEEPw4C?=
 =?us-ascii?Q?3qmfgsbNkF55AO0rr2W2Mmf+HDrPC/d6i8muj6MnQbNRbzoPLdi7eKCJbw4V?=
 =?us-ascii?Q?ggCbZmoiVTM5Hex9v5hmmvmmxc6UU+YlQhP6FILrLqm9z2XmahfwnEBymvXZ?=
 =?us-ascii?Q?BeMPnMpJe9QpcHv7SuKHOjhs9oZ2HKYCpEKvIVyWJ/VIrkuG4uEBXYMRtRJV?=
 =?us-ascii?Q?hl9FFUEAEivt71uoLEaRVRMT9D9RyeJO3ekOXInq9ZkrxitylTXy361EwrHF?=
 =?us-ascii?Q?qjzKXGetZxrnNYLuQmgz4Kl3+elyeF0e7CGIUnV/2q1egzilnZyS1QEnSMB7?=
 =?us-ascii?Q?Ee+8YCEMd+CLAdkZ+eekUFMui89sKj+JeLxHOYuNb93R46FaXMAf?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5a669c-d6f7-4411-1d00-08df057953ee
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:56.8083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d587PXlMQvLyyt7/IbhiqXIbwrgzywydhLX6NuuYejd34EvgSl0wf6SqKghaTO4U9MDh7YPgj4cYyoIHDWOvolEZUnJL97v/B+xVY7/2QIio0KQ5pCXHKiO8c1Z1ONc2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2 Power OK
(per2pok) pinctrl controller.

On the StarFive JHB100 SoC, every 32 GPIOs correspond to one register
address. Therefore, under this model, every 32 GPIOs can be regarded
as one GPIO instance. In this case, the following new approach can be
used to represent this model:

gpios = <&gpio [instance] offset flags>;
gpio-ranges = <&pinctrl [gpio_instance] gpio_offset pin_offset count>;

At the same time, this model also reduces the /32 and %32 operations
in the driver.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../starfive,jhb100-per2pok-pinctrl.yaml      | 162 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  20 +++
 2 files changed, 182 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
new file mode 100644
index 000000000000..90cd8eaeec6a
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
+  This document provides an overview of the "bper2pok" pinctrl domain.
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
+  routed to an iopad. The function selection can be carried out by writing
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
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per2pok 0 0 0 18>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 2d5150e3adb7..4b7f349cd9d7 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -210,4 +210,24 @@
 #define PADNUM_PER2_GPIO_D29				29
 #define PADNUM_PER2_GPIO_D30				30
 
+/* per2pok pad numbers */
+#define PADNUM_PER2POK_GPIO_D31				0
+#define PADNUM_PER2POK_GPIO_D32				1
+#define PADNUM_PER2POK_GPIO_D33				2
+#define PADNUM_PER2POK_GPIO_D34				3
+#define PADNUM_PER2POK_GPIO_D35				4
+#define PADNUM_PER2POK_GPIO_D36				5
+#define PADNUM_PER2POK_GPIO_D37				6
+#define PADNUM_PER2POK_GPIO_D38				7
+#define PADNUM_PER2POK_GPIO_D39				8
+#define PADNUM_PER2POK_GPIO_D40				9
+#define PADNUM_PER2POK_GPIO_D41				10
+#define PADNUM_PER2POK_GPIO_D42				11
+#define PADNUM_PER2POK_GPIO_D43				12
+#define PADNUM_PER2POK_GPIO_D44				13
+#define PADNUM_PER2POK_GPIO_D45				14
+#define PADNUM_PER2POK_GPIO_D46				15
+#define PADNUM_PER2POK_GPIO_D47				16
+#define PADNUM_PER2POK_GPIO_D48				17
+
 #endif
-- 
2.25.1

