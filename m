Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2094.outbound.protection.partner.outlook.cn [139.219.146.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37582396597;
	Mon, 10 Aug 2026 06:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343865; cv=fail; b=fNbWksPFCnOI7Fn67yBz1MZSEnhsPm9OaGzAsfA5q3o0PWuqQB3lj7YwFax3o/9nN7BcaM88b+Oju8UVYdoPOkCx13mzBcaHt2m15zCBtZX40BmOLOtfeaHuM51Kl6r4lQonbdPrMQHZsXUCz8RuhpzFI16y2OOM21egeueW+Uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343865; c=relaxed/simple;
	bh=AwFC5wLwK74+ehhOuo6O1ivDhFReBOm8qDZMOp72hFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AUoWJa+f+Pxx7HFUqOUE0BDgUzwCOk/w6QY9i4z2jiWtp7I6sdsOaEtYypfFGQnJnVFnuuf2AJJ/+47JK3wbDi8s06JmKiUifMdtMpAn4/785Kxt0yHxcIw+Sk8S3aCCpB0Qgmy/1i4SQ5r5puL2Pk0vgiP4JPCyJ9yuLPYYvSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJk3P8LhwYz541/RYbZb7K70Ok9h3iRmA4AwlQB7gbJ5ecECBzlikTJecBAREq+fzHT2WdIr8/++OvrMm4wOQiQw7z7IlpP6NOTVlJCfzJ+or5EwzugrYtGtrldSI02aZe8DWcZAi8wpthHxmAwYFXUoMhQzA8fd73U7TtZ29JKbNtkiEaPqQ+5CZP+Be5D2VpOOXyKPnsvxTRBWNkpEfzZAosEwCXuKiQyOy0EzlZvfXs0pmIcXaMaFireyC30ZtwMCag4gzQcUU8Pbw/RFSlZRfsOaq9CZpjGbIQDEuQPc4sezOJwsKjoAdpLeyx2n/0F40lUm9DJ9JCxNtkkFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwrnY+p0kwLEKarsbcupTNCeuDNbMgnhpuwpNbTSga8=;
 b=D0UGGKI1LhlCCb4nn5dS4NNY141wW19eRR47pVsTokf7XO3GH6W3hDTgiTiXf/keNOSLguVnCX1n+l+d1nnvDIOt9KSAGaOrf+r914kd88XnRmwXQyRJbEkeh9nmuQHWAbVknZdAy4LKp/e0TxuOY0IWnjNdRyaQJizDYxmlS+9nXF0MZwaANPNEwYejiP1IimbvbBaw8tWDoNWeeJSw7i4k96dpUk9oAJrXJQeFViwHeE7vp2DjqExO1EScpFQ8/wvw7x9eeK/xPlt5ZqPGFriOU8u4Fl2Nz3jPhGm6mUMXslwdWOx53XiwnUe+n6s6eFeiYa+IbFf7O9ZVWXoCgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1315.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:37:13 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:37:13 +0000
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
Subject: [PATCH v5 11/21] dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
Date: Sun,  9 Aug 2026 23:36:40 -0700
Message-Id: <20260810063650.239303-12-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8ed11633-bd47-4d81-15d3-08def6a9cfed
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|7416014|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	qBdnLDQb3pgy85TdzxMxFhLUMM0BpVx58zjya9c5VOJ4XdYRHfJ/yAiTcq9zGEWDzS87xliBx3LRjZkvRNR6IBEN33srsmFL/IH6ajlr1Tx9f5+2jLUmyGtCnFkE3FhObhvA84WKp5P4q/OSaX2jBOWgYlXOUYwHgyQl6XggYZUp4PY95fjGuruTWgANdbRQIpq/x4OyHVdUZNBqc1QlVZ10kxuOAS84CI68nNLfcvvbLOWoFtw+gp5DWTZrAmu51iWeJfDxc0AZQ+YSvh88swBei1hs/b3O5J34yuREr5vt6EoU2njnua7jno1Z5grwUq15d7GrU+U2o3i17Z/dvkZntGyJwUuIOffYc8Cqa7PDo457WW5L/tErdRZtwpsvX2Nno6YA4tSOqTi3IxotogRzj9yaFlDiEDKzT9VQu/vVXx4FcpupFEsaQktqXLGVbouAPyadU9DmrTTJ4Av3pRkJrQnGHWDmvoBHy2i4jEZNFpUk4xebpYpz3CBgKF7UXKVpN5P6L0gCt3lMjTi3Lmml8fu92yKJwTgF/aKeezsQSaaf23weTMyir4URhNmqQamq/FZHFskEC4Co8fqe2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(7416014)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RIu7BVvbOd9GaHzFbXrW1GDxjElWdsYqXAM8rH6GGneNtVFd4yk3ZHee1DKA?=
 =?us-ascii?Q?O/0aMjASkL/0A5n9c8vk5wUba6ypLxuY2fdXowawdI0aF8J6lh4uaH/bvtJ7?=
 =?us-ascii?Q?CZ7/FMbsCvG9UpMmfkKpz/82vSzIU5RhxntpcsIqVsLCMwp3tIuMucdewAcM?=
 =?us-ascii?Q?YJs0w1trBOrrD3xP+/GOMEAY7HZOBHYVBAOi5brGa4I0lT4wctxgOxGb1t8Q?=
 =?us-ascii?Q?eJhus9sBLcVptDW1z1FLx0mGdYjUGJpQFcIMpCU3m2GBitrcQNsi59J7A5SE?=
 =?us-ascii?Q?lvFjhcdB7lPhzQTDiloAxw76HN4dZPG2/Yt4cFW4I33/Jub0GuZj1cO9jXTp?=
 =?us-ascii?Q?+XOCnlRle2QyYSdPZCFr4YxYSJz2tpBvysJWr5kWmILnEQ+PZmYcAbhxRQhl?=
 =?us-ascii?Q?EEEZNWHr8Z9dnfubUf/i+R4RrM2USCXbxcYUtDIimTr8c640Psd3Th47ULta?=
 =?us-ascii?Q?t2y0hk/+nhYaUxOTCFFO/dLvQLgHwXgo7+x+F+oYFznOxuguMnE3D8PXiNa4?=
 =?us-ascii?Q?sTegglJ+gtfccm8B6ZwAavkSNiHgJuSLUErnuMkMK9J2DYp7m0wBGRRaCNmZ?=
 =?us-ascii?Q?SxWRbE3FPgCzpJvoUQEcFlQB7v4JH11LeLKMKreAkbEwiKlNLOzOxjlioJ+C?=
 =?us-ascii?Q?/05p+rQiYqZkv06VBaoenISPprfXxrhL/JKL0Kko1Lqw7jfKboB9h4ge6ccQ?=
 =?us-ascii?Q?FsbqOYFCjdsmkkg/yJ/PYguKa1ZX+0A1SFiU+ZBUEiBVXuHqdDdEF0dE/+B9?=
 =?us-ascii?Q?wyUzL1Xvli3DtjfdeFphyoWhWQuCNVMd9rAQyT/qz5svPu9myIuUhr5EX+Oq?=
 =?us-ascii?Q?/aS5ALq0DhDtcltYCERIJpqnYameUmnEm4c0N/fPdBd6PibL8Hth9vHIq7jJ?=
 =?us-ascii?Q?ymzaMhTlSYS7/kB1wyqtxfYm02ecapc3AMlqB9rHprxqb+KUcxp/ejNL5bBT?=
 =?us-ascii?Q?4MV8Q4KSRoDfi4RoftPucjiF0YBOVWZW2zrlAZhKAx1vatoktIE5P9CeFBAw?=
 =?us-ascii?Q?bWcxVzwRNKiMnktkYVE8X7n4csyS4S/2Y7eAOxmCc8EjJmvYZTzE98X8I6Wj?=
 =?us-ascii?Q?pb1qGt6EpN+hudvoSjrh1m3eXxvt/E8Z+FIqgkcp8U/oyRMCMg4APX4wQWRK?=
 =?us-ascii?Q?BXuKHLKm6lqiqYlDarKGOTvEKhXPeN3UfTm0Cz+7xoBg99OLowJ7kpabaHGY?=
 =?us-ascii?Q?geC6arIYgnw8deJGP8QExRL5zquO9HaE/dZoQ8AZ86YlufxHhDDQLihxlsmh?=
 =?us-ascii?Q?9lXxd5ulrDOV77BwPW0x4zHQervOo+B+EfIKWawfQacAEXpotRqrO+VdC6PH?=
 =?us-ascii?Q?aOwa2izVESD5yEsyGYeujQjIPfxEFN4UOh1e3alzaKi260KvfxPi8DBLNStP?=
 =?us-ascii?Q?V+05kXAfsYGM7uvbj9xPAxuNLNkEBAVCEfkml/EyUNS02sJtrNg9cmGYm6BN?=
 =?us-ascii?Q?OqsHywAuoCl/VQ2TBa1q7Qr7ZP9SkM59SZCs4GfiFy2j25u3sVSVjLAn6GqT?=
 =?us-ascii?Q?ZVwplMmp+LsEQwD2TkNCel74zwrRklSJFh9gM3JQE0Y8pWo3P7t04rkhdv++?=
 =?us-ascii?Q?PUb4doKzsiUzbTlRURhfk5VwNty31EFQX0BlLexLy9odts60ISM0BtFRTjsG?=
 =?us-ascii?Q?Fks1M0+L/r0kXzeGc6l1Serd3HjygiNJ3fOo+4kkiOtadyYVSNpPny1IgB1s?=
 =?us-ascii?Q?Lz2AseEJzt2StOKB0GUkFIypEGw57uvSrjwa2Q/ocyVTi9x/TdqOQWeuXGVk?=
 =?us-ascii?Q?JQlogWBbshCsJaPVEHF1t+K6SB3yVCFqVZtmcvsswdNcps4qdqrL?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed11633-bd47-4d81-15d3-08def6a9cfed
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:37:13.2710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKfrEpHGZFpoOVElIoSw45d7iGgKCfJIB/doehoMA/e5TGNERuLYcyMZTLCT2k0Y1pCfDpG39LcPaDljeoEAsFFbK0cOx+/X9oLI8bOD1W9iBdK/KoXdEQ7PpjMoKnY/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1315

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml | 180 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  62 ++++++
 2 files changed, 242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
new file mode 100644
index 000000000000..596b284769a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
@@ -0,0 +1,180 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-0 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per0" pinctrl domain.
+
+  The "per0" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the Peripheral-0  Pin Controller, there are 60 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several hardware blocks through function
+  selection. Each iopad has a maximum of up to 3 functions - 0, 1, and 2.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1 and 2 are the alternate function or signal of an iopad.  The
+  function 1 and function 2 are other optional functions or peripheral
+  signals that can be routed to an iopad. The function selection can be carried
+  out by writing the function number to the iopad function select register.
+
+  Each iopad is configurable with parameters such as input-enable, internal
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate, input
+  debounce nanoseconds, power source and drive type (open-drain or push-pull).
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-per0-pinctrl
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
+          drive-open-drain, drive-push-pull, power-source and drive-strength.
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
+            enum: [ gmac_mdio, gpio, i2c, i3c, smbalert, wdt ]
+
+          bias-disable: true
+
+          bias-pull-down:
+            type: boolean
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [ 600, 900, 1200, 2000 ]
+                description: Pull up RSEL type resistance values (in ohms)
+            description:
+              For normal pull up type there is no need to specify a resistance
+              value, hence this can be specified as a boolean property.
+              For RSEL pull up type a resistance value (in ohms) can be added.
+
+          drive-open-drain: true
+
+          drive-push-pull: true
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
+        pinctrl_per0: pinctrl@11a0a000 {
+            compatible = "starfive,jhb100-per0-pinctrl";
+            reg = <0x0 0x11a0a000 0x0 0x1000>;
+            resets = <&per0crg 0>;
+            interrupts = <60>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per0 0 0 0 32>,
+                          <&pinctrl_per0 1 0 32 28>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index e701c30913ce..e0ad453d6884 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -77,4 +77,66 @@
 #define PADNUM_SYS2_GPIO_A59				35
 #define PADNUM_SYS2_GPIO_A60				36
 
+/* per0 pad numbers */
+#define PADNUM_PER0_GPIO_B0				0
+#define PADNUM_PER0_GPIO_B1				1
+#define PADNUM_PER0_GPIO_B2				2
+#define PADNUM_PER0_GPIO_B3				3
+#define PADNUM_PER0_GPIO_B4				4
+#define PADNUM_PER0_GPIO_B5				5
+#define PADNUM_PER0_GPIO_B6				6
+#define PADNUM_PER0_GPIO_B7				7
+#define PADNUM_PER0_GPIO_B8				8
+#define PADNUM_PER0_GPIO_B9				9
+#define PADNUM_PER0_GPIO_B10				10
+#define PADNUM_PER0_GPIO_B11				11
+#define PADNUM_PER0_GPIO_B12				12
+#define PADNUM_PER0_GPIO_B13				13
+#define PADNUM_PER0_GPIO_B14				14
+#define PADNUM_PER0_GPIO_B15				15
+#define PADNUM_PER0_GPIO_B16				16
+#define PADNUM_PER0_GPIO_B17				17
+#define PADNUM_PER0_GPIO_B18				18
+#define PADNUM_PER0_GPIO_B19				19
+#define PADNUM_PER0_GPIO_B20				20
+#define PADNUM_PER0_GPIO_B21				21
+#define PADNUM_PER0_GPIO_B22				22
+#define PADNUM_PER0_GPIO_B23				23
+#define PADNUM_PER0_GPIO_B24				24
+#define PADNUM_PER0_GPIO_B25				25
+#define PADNUM_PER0_GPIO_B26				26
+#define PADNUM_PER0_GPIO_B27				27
+#define PADNUM_PER0_GPIO_B28				28
+#define PADNUM_PER0_GPIO_B29				29
+#define PADNUM_PER0_GPIO_B30				30
+#define PADNUM_PER0_GPIO_B31				31
+#define PADNUM_PER0_GPIO_B32				32
+#define PADNUM_PER0_GPIO_B33				33
+#define PADNUM_PER0_GPIO_B34				34
+#define PADNUM_PER0_GPIO_B35				35
+#define PADNUM_PER0_GPIO_B36				36
+#define PADNUM_PER0_GPIO_B37				37
+#define PADNUM_PER0_GPIO_B38				38
+#define PADNUM_PER0_GPIO_B39				39
+#define PADNUM_PER0_GPIO_B40				40
+#define PADNUM_PER0_GPIO_B41				41
+#define PADNUM_PER0_GPIO_B42				42
+#define PADNUM_PER0_GPIO_B43				43
+#define PADNUM_PER0_GPIO_B44				44
+#define PADNUM_PER0_GPIO_B45				45
+#define PADNUM_PER0_GPIO_B46				46
+#define PADNUM_PER0_GPIO_B47				47
+#define PADNUM_PER0_GPIO_B48				48
+#define PADNUM_PER0_GPIO_B49				49
+#define PADNUM_PER0_GPIO_B50				50
+#define PADNUM_PER0_GPIO_B51				51
+#define PADNUM_PER0_GPIO_B52				52
+#define PADNUM_PER0_GPIO_B53				53
+#define PADNUM_PER0_GPIO_B54				54
+#define PADNUM_PER0_GPIO_B55				55
+#define PADNUM_PER0_GPIO_B56				56
+#define PADNUM_PER0_GPIO_B57				57
+#define PADNUM_PER0_GPIO_B58				58
+#define PADNUM_PER0_GPIO_B59				59
+
 #endif
-- 
2.25.1

