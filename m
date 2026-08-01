Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2114.outbound.protection.partner.outlook.cn [139.219.146.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856BD3B27FA;
	Sat,  1 Aug 2026 07:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785569279; cv=fail; b=V879lLUFUCQmaNBlG493GBVmeovJ+tsBxULDYrcrWyVWfwhSzHVH64VQ9jkcccRdrZKDmpgjEDADNudpWfaurxWhhAHY5dm+VKUKPmdRrjuvnbBPemY2BiDqD8q2rxSK+D0S0AOOvDzs4qhaQymlOGoLEd+XPVGeU3LJMZrRMhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785569279; c=relaxed/simple;
	bh=XL4u7Hv+QQVSC8zjGljrK9S9anz8Ccuh4TqRyu39fZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ls7Qil4kNyuci6OggWSIW0e8VnkTU2SZUMTM9QidLfyk2uUjpAq3Z20odt3MLpEDKiJ4hxDjU7nUMalg5qIFl5MtaQVjsP27BhxNgsku5B+Un8aTl5I5WBN41w7abbNJ4AnslMKsTaNjJ9m1gnntGh1MlPHtZt4Y1v1hWrjrY7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XO7sRgW9qLNfEbwCbDJnBl5KyQkt0BxIj+M+MUt+i1DBHDlnwOlBwpSKjholZ03BRUrZlNPFGt/hbMgGWWBmr3sCJPGsSt+jsNVOTWaaLPL7ZDDiKHCuibzwgAUrRgRHKNG57Au9erdiL8xqRMuGILURtw0UdSiacM7wDbyuZufrNoi+hMX2pGFHm6+Cmht6Ybpfg8Su9UlCzBTqt9qhcNsQyHghPKyd1hm2EgrFhFxEDjv6YoGiFfxptWvP6nQ7RaPWSmsGK95mmg7dbe3c0wThX/PcqU6scbHA1vMBpARz7hV52v0dPc5l1rFcpzxuAk8gx82DqC6j9RRuJNSFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJyHeWjRsRy9PqS+dQ8EER9q4nwbJ+ZQReR3960RbPs=;
 b=FsesKWvxhC+kT13mR+NQolgIGcSpjyqoelUUml9CrlRaqs4aM/3n1gmAMDXLfwuTIMmwUEIQMJqXB96KXlx2C89I2nMoelm01VLCJ1JlF6Cluhehx8UVvBucYzJxiHq5DKnn30T+hiESVua0iR+H/Ol4s+OWx2E8oXVCPG8Z92ZUoKqJNDd0C8nfQiUBVGB/uivdlgjtk/nDIqapwioZhgMcpiAoNaMXaYUAdZOuyT7sJlfBfJRfVLQe8X3hpXP9oq6mPDY4tz9NtsOxrvDtkbRVmTY4rY/EQWEoBaGOZhtI6X7i+69e/uTtzVwAAXcz8OJl5/O+R+CQxF4Gg2t5Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 07:27:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:37 +0000
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
Subject: [PATCH v4 13/21] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
Date: Sat,  1 Aug 2026 00:27:03 -0700
Message-Id: <20260801072711.153217-14-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1138:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f0a0ca8-7454-4bd6-c83b-08deef9e5cd3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|23010399003|1800799024|6133799003|56012099006|3023799007|18002099003|22082099003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	TRHljtxbrsu21Zjcoi/9HLwdXmfBQtPutgm+4r43LOsoWcCFEqXENU3XKfz2n4InjnROe1U+OBdpAJemvmcxZw7KBIVeCsQNkCDEl/9uK+nITXzDz43uTvAtfm1Q3PfaRjsJXaIgU+XJtNAG2v5Ck10+cjsf6/4HNfmHpJlcqLV0XR9l6kNqHgtsgFIvIPS7dd9faLr1kVq4lqcmekaU9W/mpYsicOkMEGod7QhoE4VcNTqJHnZqvMeSMQ1ONHtbyhHsThGEzSyP3sd/X9/q4wshsW3gmdzR/Of0wV5uVnQmzUnSZqLqYxkWbebmBvPm0K5p5Z21/n4fdR2Fa9o6TdNGsivyzPudNOzRTxeX1fZs7ezE5clL435MCDk31V6ydpp0AWQySd1G5Xk3UwKaNA14tBwaHxmbwnYgYrPLlLxzPqsuF3UiAl2TClNlvSXWCMyzT9g98TliV2++6kSlPY5uuqpBSJODm5GmxolTnUxg07SkjG3VXbVZq+qf6I4szIrJZ0LuGnl6reNU3kwPKX2PW6+tbZ7zCGK6b3hR6twVoUunCxwaYK8ltt5p5cnhLZRRY58usAwnLJCdH2AI4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(3023799007)(18002099003)(22082099003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V8bwGMJwF9Eoi4GEj4uOAh9gs3jSDJBq6BK7eCTFk7Xc+NKC8OrEIFaTPyMR?=
 =?us-ascii?Q?Y21trXFmu8/IxHvFHu+ncQhz5HMXlpyUPTsN0vUxAZSrhPx74HXp7RiTZG3T?=
 =?us-ascii?Q?MVH9wTlXfgn0ZINX5TIGTfk9DJwgd4vnxf4PMeUBqtFOXYIgqer0cBJwJXZE?=
 =?us-ascii?Q?3lY1GuDCLC9ocyc/sEoSdow4EnWfEzO4QuYBi30in6vRqIp+abjAeWK0NpA7?=
 =?us-ascii?Q?NJxdZQWQCEblW3sajJv7Wst5fQ7EH+c7ERQRSTlYEpZBMchAo62a+IU9N9oK?=
 =?us-ascii?Q?u4tNY0gr8MiFQrGvx3q/9YdCxwby8pGeUQw+WmMII/pwK2RFAma3ua5Jvit8?=
 =?us-ascii?Q?yu4Lnyzlqfd+WBoj2pkXihgPcoPmN7bCnwjiHXLtk0tyxwhM/xQ7slEafMX4?=
 =?us-ascii?Q?V05OdE6GRPMEO+SczvDTUAGOmF7hd19y1rOVnNdkpr4qUeRCs2j5nS5Xvckl?=
 =?us-ascii?Q?AW23Mbb1m8i7v+GUox6eBnmym7dbJvIP1bzm7DB1EljJpeylMud/D+h/byrF?=
 =?us-ascii?Q?3ttxXHv+rO8wzTHWZqI9ecsy59ogvfZG9BoaQDcY38fMpiIEdxUEwzsRcV/9?=
 =?us-ascii?Q?Ci94O65mb8MkPNfeRF8dDcODUCTdltBQApM3jbZy+3MTR0VODnya2xOH0WOO?=
 =?us-ascii?Q?9M5xgQZ7FXFUNnEAQxhjMHDvoJzCc0Qd1tP/YkrjaUW/nDTuYQUWODRbBTCV?=
 =?us-ascii?Q?HVGGOxALAcwUNiCjAWNPQNb78bmHbGjYRKAFgnIowlBsvtEaI+X6xwZi7TaT?=
 =?us-ascii?Q?iXXKUrMk0cfsfsrEFxaCvobXjEbROGkI3AQv/pZUj4m7bV+uwEfsjdT8fOm1?=
 =?us-ascii?Q?jS8vX6/UMYksMtYWKpm295dA4ilEdeFl8wJCHXdI00svTqhMhiEEWseUpkaD?=
 =?us-ascii?Q?4wv1fyT5dnZwW4wCnt1egpWSUTSFpWXwKpWcpYzkpQ8cIuLfl9ld7JfC/qn6?=
 =?us-ascii?Q?WIZdg1NgCTm2iRxzc59VCSeiYO1d/LOLutWHjZPWFvLTuacus749VRj5amFv?=
 =?us-ascii?Q?HHEzRdeqTXkZFTqiQgOwEtHH8d3AUUTiFjcS31izaa5YZtSEviPWJQC44lYZ?=
 =?us-ascii?Q?FOLXAyeHghIsLAanbUWMvXwyaLcLhKDRThKYAU/K9F1nLA5V7Kh9eJVSMOA7?=
 =?us-ascii?Q?W0sb2BMiz98pdXtAk6+b31O0ZQcyx3o8TYVK1wnNmWQadTO+FsEcqDJv+7jI?=
 =?us-ascii?Q?aSLXkvEVenbYnjRcvW1F0rjUnLFyslNUWRIcFZqpWrxWPHc/fV9xJUej0vLW?=
 =?us-ascii?Q?lKKO6LQSwSXvjXFsao/3s11wJOjUvAv1gkqX3ktm8g5uhZcddef/eoG55gV5?=
 =?us-ascii?Q?ez8d0/9mGGloKFCb/lNWTfCOwjPc9sRHuc5CVNJvW3xVE/rlQn+0tx2i1x2g?=
 =?us-ascii?Q?CxOteBNq8Q8nKq64Ihe/iRfjtwTvJWBGvufs/Jhn7wwO6/N/i/bl2buUsc+c?=
 =?us-ascii?Q?f7a81MVZBMzrdY7fFuTg6Id5k1LVo8V2pnVZKviBpz09kFNfsGjpGcJhI2sp?=
 =?us-ascii?Q?e/IjavbIuDr/ESx3b2uZekgZqcZ6BHJN1H6YxVZZvr9t2PfiaymtZujnEqj7?=
 =?us-ascii?Q?8vECmXhqZLq2fakPBRLf50M5lGTPyKZLUNqhPY0X63roP8DJIVivejqWMAZf?=
 =?us-ascii?Q?5PfJB6gMDJZn/mnqEi5XIgqt9QNKUiZJyqPJxAiqqAWACH+P1/KElSFgDkMk?=
 =?us-ascii?Q?7Q2o/V/+c7094j0tSYRpYtdEx7P0eHvkHJ+Ln4Eb3dGTgYYDjMvkv3VWi3Pn?=
 =?us-ascii?Q?+T9hp7U7seIoFxsySpiWD1XnLN611xW/KPfkPaS/pjQ4uscM1JmC?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0a0ca8-7454-4bd6-c83b-08deef9e5cd3
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:37.5237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cf4TRjxPHgfkj6R59WDtuFSTOZ0BBpMPJSYWKhAEDkKzB+CW0QqysnWg1aUjxq2gO5ydfKLl1DpyqTfoS/BU7VQ9fh45QuHjLXltXkuuwRsffBY+BPwM/Zlddg1clEpX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 179 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  38 ++++
 2 files changed, 217 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
new file mode 100644
index 000000000000..875ceff8e710
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
+                0: slow (half frequency)
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

