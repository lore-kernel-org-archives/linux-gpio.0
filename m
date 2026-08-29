Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2130.outbound.protection.partner.outlook.cn [139.219.146.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F251331A61;
	Sat, 29 Aug 2026 03:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787973296; cv=fail; b=HSIjiz4ZUD86kRfWBxQ6tjzZ3ij+L09aXDejtbs61aOH/FRNY8aUbd9/mqfGpYq/K73JfhG6QTIvRqbNzYvxVxzuM59QFwENuOFfviEsm+7txsrwktR0dD/Qua2vCRn1veP0T2KmFl/s3w1lRaxMb8eJLjt9lP05lzFru6OS/3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787973296; c=relaxed/simple;
	bh=OsGDzAi8p64xn8O85TEZ7jP0MWQyfOgM+QGUF/2yiAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IGgt2PnF1K3IMUBHI2HYsry9G28asTe9paTRrgdTWX+uEX/yr5+KM5yJXWOb2lmSp/i5hWl9Tw41TsqfuUQiYEyTErNhFl1Ig/A2t9iU9lKPXg4tAgSnGnkzCXfka1RpINLfppwat4dNDDSzxyi81BPv98wbzbvY0QVHtDMh/qQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4AUvIq2hbrFtIyPbEVVurGEZ1Z4y4hK/PrOf87Nwgcfk/smD7FNGlDrJmsSFy82lHVkWK+R8ZrWPiB8I7Y2VpzZKsMplo/rAxLB/TCdKWNYtxBjUTuVo5BnNvBpjgktFU8N1Aog8GPvPPcGlCPz+MzGAIVMpgXJ1nBHVSBNNaOLM6y4b4s9dcgZfcPbiF7kLAQzvvyOVwo7p4QX1LLI1tRratpGm0dsMwNPpL1zsGrOvRlzpXf3F8M/eHQq2NbOcKZe2L0pzSh53Uh8caAXHSQsgpu2/EgXbpqepRR0LQUeTB0I0ZIi1njLoz4dHpNAljReKQblONRcYSUJ+XhHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqFzs1jQp5C8M3xa7iYvrPI43lxx10FKC7xPu0WgzDI=;
 b=KwPWHw9fYOd2Zb186Gi4Vs3LO49g7yZZyy6Sl20rXOMVniuz+TMKpnQeWSDCXmE7ZqYlCQjgW5hWsmt5LclIXNXWQy1l1OwniRKGaEb3YQui7LYDvDx1GFrTDYacnr00U7m8d4ouNqV87USrAfNm3TX2E3E7kYDWQLCXzeL0iE1P6zYZKfzmtPGUZR9tqLbpA+a/KNNtVObVt9VBLpyQap5ouMGZkCyQRSXZRYNX7a0iE1H8dzWBH6CecyKRKzs4bKj2LNbx/MkbFtIs+BXEoLYP3uJJPRwRWSzhQwGHXwiPFp7bWwg8H8Zd6C/N/l9/3iWHLkRyo+S6qgfNv7yyFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:51 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:51 +0000
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
Subject: [PATCH v6 13/21] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
Date: Fri, 28 Aug 2026 19:57:12 -0700
Message-Id: <20260829025720.23915-14-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: bcc60484-3a67-4b52-fa23-08df057950b8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	JBtTKgse1+fR/ie5DY5AZcvMgHU8i54ahLfMVD1z4c6IyWEW6n6xZlUdF/0WNcV+tvWDrim/2/fNHuLb6rlq3Ckwr37pXI9b4S6qsSpnKy/CFHOdr/Ntv/ovhL95MTTxPTc5zfYcP3ozERKZgSQtrTKS5pxKzgOgYhu9vJeHpDJ1kUS9gBHhXkSBb/umYpqq3W5baykFqpsXxPwUsjodI6FUI7MyPuFuRLgYEy3jDEzJVOEEp2eZrSqOO0Tz2HZISDOJLxXnv6TRGP+3KTcvKALZpRl7/waL9S9LaXsJiOBgiFaQcbGYJS1dnfqEYXeA9BnqvAZml77lDcIprd5NfuuZtJh8Vx8FNZx2uXABQLF6u42GhzKjzIyZRp46zintum6svKtetLEC9+a4GZRN1vXureX9URe739pi83qwPaejd60JvN5ZOI57daRUXsaO4V5EGIbql0oNCABNN6OGUyQHqG7VhvBQYNrDWbJ4tVnskGOc+YMqudyctEhfSHn/5okioYGoQKuZ5UVndFKAJ0sCM86oz9PSvyO81q5awJKHM1RBegN/POuVuZMxUA7xLEtZN9ePLflEOu331d0Fbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SD7/nKbosH1EHfCRctI5dH+SCkDIo55V1JXFV3h3fntTAzc8smBqSzZmdOlF?=
 =?us-ascii?Q?y+uDDO4Lx9x0qXYFapSE0YyUGhSUXjr8jyNRKfbzFU2NoSiLhOYpdweQLcse?=
 =?us-ascii?Q?gK0MKloKxwvdqW5SlduBZWyAIA7sFZKxI1X1WmNsbEzM4OwYGGL30zg2lLOG?=
 =?us-ascii?Q?QxkuSpFwir9hr/GQgYvHSJ8ESPtGORfr/mkye4eBSzs4ftI0n8oQK76T0jyJ?=
 =?us-ascii?Q?ZKBNfMSC+7+UzMtCrVMvBmqNHUQCLaa5HG90+Qsb+2/rDvLFqcd6iwGlbzrJ?=
 =?us-ascii?Q?ssRj+BWgjNcoSlP7wTFPpWIGpgCZcWHx+odykZIOPdrnyqHO+C9hphmthAFk?=
 =?us-ascii?Q?ExrEWcuxXGZfyBfkcVkV9I4/wCv6wM5pyAkZ4BhGrlnD8UZzSSN4q468jnfb?=
 =?us-ascii?Q?yAMoRbKQuNjRhhHHua8MC5NnLlX3s0AQbqP/qndGQbkQrcor70UtXRphXtSd?=
 =?us-ascii?Q?aMD9+B9tz5Pl2U0MI+XVL0dCcAoHGNaNx42LgWHwVi94lKxFy/eZSY93Y74g?=
 =?us-ascii?Q?kWMDvUR8/8Peyjj6bP4nUzePn1rR/i3bF5/ESXe1/b3zMEOGvT2cC0cEy8Sj?=
 =?us-ascii?Q?dj9v0JhtKDGHKFs6dlWJ36P/5KxnHKo+/J6T19cyJKQOHPr0FosAQO0T4zAq?=
 =?us-ascii?Q?SFjDcBh/Rn08KdezkPCE9Knh4kzDayaBWQMlHZWvjOxVh06apR/naIjfSVKe?=
 =?us-ascii?Q?1bt+t/owACpcT8eliSlgBeozfmDJGXeXC3j3OZPGLdFapRqTCWJzShfCp2p7?=
 =?us-ascii?Q?0H3FkjBybYAl+L2btZRjEjVmj/nxX6bD7y5sMrEma0iQd4XN3Xq0SRzbhwvs?=
 =?us-ascii?Q?HmLURvcHWZhKGLZ0mgFNysGcX8B6m7x3wfMH29KGZ/sIrQre8y/8OAQZkVtm?=
 =?us-ascii?Q?nlTzahh4+RdgsC9Xa92UhNJEPW0yUWIiOc+CU1rQ2RrXSCi7upGIHYypv99M?=
 =?us-ascii?Q?GsKEERFwGWdRMKq1QQLHO9ye5Pqc5oir2fbfvnQEZSA4b1/wsSDJovI5YXal?=
 =?us-ascii?Q?KcZ33w3F6v/eEgx82hq/r1IdxWLv2N6cwZYFJxONoq5cwdNifFlCSi2kZ9jY?=
 =?us-ascii?Q?QiSLKXvcxwSmkLaFdWMaSTUUjjoyqfEqIm4TuVGz125DSqlDh1GH947FVCn7?=
 =?us-ascii?Q?mlEkMBJuZvjWdrkqWCsPyFGc6rd7n9+5tbJCBqA3lhVwGaCD75uL5TC5Vbm5?=
 =?us-ascii?Q?W43g4iGGBJCOQW4MGpwGWbyfhnb1uFJ32JVUKrilZcgTET9lJ6gxb+w8nqzM?=
 =?us-ascii?Q?kGnMO/RTiqdQPMYv8cHGgAPa4x2XpxRuaIC0GnkEK1ZtOhcJYNIQrHdL1ByS?=
 =?us-ascii?Q?SVZfPVLEApNL4HqnFYSJs0sgmkxssPPjXZ0xfPDyzzP257TEeZshOLcsz8Ca?=
 =?us-ascii?Q?8/6SM0RRwbrkX20S62bLenjzXPF+xzJagW/vLr3eC98E5HoLkA4yZgGxzbGr?=
 =?us-ascii?Q?k+t4+FfYt/88Z2qet9+8e6ddZP1QUVlNWaIB84JdPDgjd7NqEXwIvygwLCoL?=
 =?us-ascii?Q?Qb70z7Mj3xI/MI16E/Voh1AeZvwYd+Zw5dV78XWayoqOkO6/8SbAg5rWs3Vo?=
 =?us-ascii?Q?xIng+cCT75kilMNT0L+/N+aav2+zIyOeTeUs+OaC9fuEqkj4TfGeVOxyWGrg?=
 =?us-ascii?Q?iC11KIsQjDWynOg3x9a9mwX2k3yzk0p4C9E7TWXFDxbXZHc5dX53F8aXH5Ps?=
 =?us-ascii?Q?ujb7Me2klEvEdc7wKyymOtS9nplluJQDa4ARfGkgd0BDwMFSkAuZCb5z4uao?=
 =?us-ascii?Q?D3XNQOSYPy4QprP2fVrsKscxqAprgs8Irx4Bco3oEAwKe68paTAH?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc60484-3a67-4b52-fa23-08df057950b8
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:51.4257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1n9oEksJ2ZDm71NuCO3usRuNw7rxyeXiIh6EmtzRNYvo5uk9XRsHYjfB/++DrwithTnJm1uW70bSoIwpFlzQwXz34ZM1H3JjokVNeoMg0aJSY/SIcJtwjQYmDzeVQfF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
controller.

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
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 179 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  38 ++++
 2 files changed, 217 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
new file mode 100644
index 000000000000..85b64e2bbd53
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
@@ -0,0 +1,179 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-1 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per1" pinctrl domain.
+
+  The "per1" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the Peripheral-1 Pin Controller, there are 36 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 3 functions - 0, 1, and 2.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1 and 2 are the alternate functions or peripheral signals that
+  can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
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
+      - const: starfive,jhb100-per1-pinctrl
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
+            enum: [ gpio, i2c, sfc, sgpio, spi ]
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
+        pinctrl_per1: pinctrl@11b42000 {
+            compatible = "starfive,jhb100-per1-pinctrl";
+            reg = <0x0 0x11b42000 0x0 0x800>;
+            resets = <&per1crg 0>;
+            interrupts = <61>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per1 0 0 0 32>,
+                          <&pinctrl_per1 1 0 32 4>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index e0ad453d6884..9f622468c294 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -139,4 +139,42 @@
 #define PADNUM_PER0_GPIO_B58				58
 #define PADNUM_PER0_GPIO_B59				59
 
+/* per1 pad numbers */
+#define PADNUM_PER1_GPIO_C0				0
+#define PADNUM_PER1_GPIO_C1				1
+#define PADNUM_PER1_GPIO_C2				2
+#define PADNUM_PER1_GPIO_C3				3
+#define PADNUM_PER1_GPIO_C4				4
+#define PADNUM_PER1_GPIO_C5				5
+#define PADNUM_PER1_GPIO_C6				6
+#define PADNUM_PER1_GPIO_C7				7
+#define PADNUM_PER1_GPIO_C8				8
+#define PADNUM_PER1_GPIO_C9				9
+#define PADNUM_PER1_GPIO_C10				10
+#define PADNUM_PER1_GPIO_C11				11
+#define PADNUM_PER1_GPIO_C12				12
+#define PADNUM_PER1_GPIO_C13				13
+#define PADNUM_PER1_GPIO_C14				14
+#define PADNUM_PER1_GPIO_C15				15
+#define PADNUM_PER1_GPIO_C16				16
+#define PADNUM_PER1_GPIO_C17				17
+#define PADNUM_PER1_GPIO_C18				18
+#define PADNUM_PER1_GPIO_C19				19
+#define PADNUM_PER1_GPIO_C20				20
+#define PADNUM_PER1_GPIO_C21				21
+#define PADNUM_PER1_GPIO_C22				22
+#define PADNUM_PER1_GPIO_C23				23
+#define PADNUM_PER1_GPIO_C24				24
+#define PADNUM_PER1_GPIO_C25				25
+#define PADNUM_PER1_GPIO_C26				26
+#define PADNUM_PER1_GPIO_C27				27
+#define PADNUM_PER1_GPIO_C28				28
+#define PADNUM_PER1_GPIO_C29				29
+#define PADNUM_PER1_GPIO_C30				30
+#define PADNUM_PER1_GPIO_C31				31
+#define PADNUM_PER1_GPIO_C32				32
+#define PADNUM_PER1_GPIO_C33				33
+#define PADNUM_PER1_GPIO_C34				34
+#define PADNUM_PER1_GPIO_C35				35
+
 #endif
-- 
2.25.1

