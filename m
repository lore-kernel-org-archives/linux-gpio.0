Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11022097.outbound.protection.outlook.com [40.107.200.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2469536728F;
	Mon, 21 Sep 2026 07:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975231; cv=fail; b=BRVfn2Btw3QV7fzcoaPZVyZi9q8vXNc+dMv688XguoAY50AMtvpeG3ZGlcM442cxGcsI8P/vuUGVbniS/V2Ohq995LxmydAAVLRqXziNLi6BlcvaWcgGYubOb6QBGIcKx5kZQTNe3eI/tBgV7aKELAtQZ4Uv3C5yUx8hvNX5Lko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975231; c=relaxed/simple;
	bh=NHTVjGna6d0/QD2lfuutwWXqkrmnwbM03uHjLrDsS2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHFOglxtSXCPEdFFOePk67pgi9B8H39S7+keD+gowUhx5tFCUWF1GkZNeLWDRxesnsXwHLgbUD51Cr0bY+SWZER05gqNV/qSSqfuHlcLY++JO9tm0t1lv1AZCN2CAp9DPfUKLOeFm8AXMB10Z/JFXEpzkPxzAKsuttbHmCYYuU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=YOKCbqEx; arc=fail smtp.client-ip=40.107.200.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="YOKCbqEx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUSSJZnnkBfSZLybKMFRCj2UYdM8xofwR1qJBK2KVDdPBXZoad0ml1i3PgS/8kqgE9G+fyMk0Aqza79GMp247dk4wG0BR6XGbHqst5tq6tBiqYCoi/2/lQgbVoZdsFkbnxY9sFN95lMj30d0dMrfzpNYZbJrQPAbO8OimDj99u0zODpUVDrwy4SmcghOiEqG+W37GNeZq3nztjBBfoxqsVwj9n53Oy4iEG69n8ROdlV0h/NcAkRiywAqOvfy9pyVmzL7IjaG6IMJ8TDx6HMTAhzgy9DlaB1GFkXceFDDJ1jIsOndA2gU0OnWCFrpL50m1UyZ8CdkZ4Fw55FfLhRLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivJArAMa6iKK0YpDSAQbwyIe5gR5Nm68by5r+ps4lNk=;
 b=Lpsm56rKQRPoluI45fBjRb1iqvSAa6OKSy7N/k1nM7QCBhrf+ojKRzkirGKndjP2QYedZFiveiev9kjzV66S051LQR/U0KVc/vG1y5qxtM7v7phKuaJ39SfZTs2vxTCjkoCfU1rH22Y142e+H2uj9n9HT0Ln5o0q8nR0f9x/07SZQouzAJJLw2iyGkQT1N+KGEWNplQKzjyM6L9mo4A8H8+h3C8rXu106d2WZRcNZTgptnyXzqL77ao8MWaPvYyV/NWzwJ03E08cy0+62qhtePW4vhR/Dv+iVBqKi+6/WsXgB/JwB87HbhuY+OWB9UE2AA+aazhUmQ5LS3a0kxZtXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivJArAMa6iKK0YpDSAQbwyIe5gR5Nm68by5r+ps4lNk=;
 b=YOKCbqExA7ptWZagRclYXesp0UWifzZ4eyr0iYhgHQSBjOE1q1VQkTTK4+R4X5WKzTUHU3fkgDBBUtlf+wg3+Vnjzo5n8YcywaLM3ZioI14AObK9r57hLW/vD27VJb6AAbLpcrCpcsQRQGTGsCY1Z0KvXI/RRH4NBmBZxLtDAojT7XMjK3Se1BuaEMdy3S/NLy6chuiKqogXhivZBUeMZaexnyZoFQHHnHo/tqZe5JL1T/ndOwk2jJ2kHzGvOKbDQLFMczD4ZTlpYr1v/NGrpEuoYgUJZLO7Ejv02wgt26RKWMdyDuZbGiCJYEn299hOy5gRSMWCRGW8+6+iUfyX8g==
Received: from SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::27)
 by DS0PR18MB5478.namprd18.prod.outlook.com (2603:10b6:8:166::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 07:20:25 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::9f) by SJ0P220CA0017.outlook.office365.com
 (2603:10b6:a03:41b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 07:20:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 07:20:25 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 449CB4186B5D;
	Mon, 21 Sep 2026 00:20:25 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Mon, 21 Sep 2026 00:20:22 -0700
Subject: [PATCH v4 1/2] dt-bindings: gpio: add Axiado AX3005 SGPIO
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-axiado-ax3000-sgpio-controller-v4-1-79c444be7faf@axiado.com>
References: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
In-Reply-To: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
To: Petar Stepanovic <pstepanovic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 SriNavmani A <srinavmani@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, Michael Walle <mwalle@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789975225; l=5059;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=NHTVjGna6d0/QD2lfuutwWXqkrmnwbM03uHjLrDsS2Q=;
 b=H4vBL21nW3ovkVAkYBwLXPv5juhhYiGiZqAxiyERBuHn2tTttifeM96mzbdMj0SA7Eg8Gfo/t
 SVy/+pbKAbmBnuy4ThgS4ONKiVsV19gOoKKoRUI0/jPqE4QsKsZoQql
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|DS0PR18MB5478:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ca9b30-cd43-4e3e-ac8d-08df17b0ce7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|7416014|1800799024|10067099003|56012099006|6133799003|3023799007|18002099003|22082099003|5023799004|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	1ag+nwzbtMtdA8hCuOHvH2NxHl/mmiRzH1Y0F0+6W/aLL6UCmlziuoEatYTi3QlmHF5R6ggynZLS4Zn/upLS8An8eUPhTKA0bvETweiRNVNYmuoVEr/wnfw1CgrwCGgm9JLGoPZYMhyMuXz4fflk3qxd+NSrKuCqIWJsogqxZEtYiMQF+3+Eaj6WWbEu5MiFUGXwWV9DqlFIG2JnJsJyNCASOnSgk3piQ8USI86TQXDZ8PCgDbRF2vi0VqB7kcQ8xKtaT+eOI5Xo+2Ez3aCtn28QH3f9GjHkqBXsCU+Osja9v3dOrwXSGyGcQD779Y//55fiWIbd7u/RqLnOAAGsT8fDeCkkUy4eWKom00qWizdSf1FhzyKDB4TtniJKtM0MA23RpJaCeZjTNSgkTn7cOHZyjZtz/W71n0g18452hOoCpvBdB+e4TrGmjbTyRDolZMIMRFvAawQuSXIQw3vqbi7bjSDKyvpjZJVTfR3XyIMlkyBzhLvayAw7I3P5tdLdnoKjevR4bojG/i+T8sfBK4TUGXQDjYKgWsJWWrcleGL7MLeAVXC+QIlA7+lAbmZ5wNTPhL9rUjurM8OWOQ6sxdO+UhaH1lvr9mhQMUB9TUL+qXQefAFUFNexlH83k3fN0fo2Iu2hRAWwJFjOSjHu2eS9WeoKTiONO/SzCoQMea8uypiiQ02Bb2U1+ypXP5E3x3ACq/ME0jPbEM9Ds55iVg==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(7416014)(1800799024)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(5023799004)(13003099007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pCWTaZk2jmvTbp5NZxRlpCYLyx7J0ATvDb1T2RrLcgcY4gx0pH1GxvujRIc3IEpOXUOh+XBDTvBF5/46UUOFyt4WDIz+n3RetXfYS3HqJuabtgXFNTcdDzH2HKKwgmXcmwVhiUI38h61qHQwCJETyIgljj2U983B6eq935xzKbsB6q7iwFQNWPqr6stfHDCYq8RIYIU1DasJFhoFnqwovZbhwLHA6r/bmTtQtwqNuEXOUpcQfZISQMtSgv0FZBq2VFuv6bgfhhYdQbqSgspu9odltmh6Qag4M3L4jzUml0pMcvtL9p5x7gX0FYGGCbvZOirbx182Kgb0+vo6MWej/0z07g6TFZ/sFLiHvHaU2OAzIrdGwT6KIMB8qRtZrdejC4lebdGc2gImXug0NoJHSD0KQQCJEFZTmYVrBmj4fMV3t64vg4zTlADD6KvqTLAd
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 07:20:25.5286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ca9b30-cd43-4e3e-ac8d-08df17b0ce7e
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR18MB5478

Add a Devicetree binding for the SGPIO controller found on the
Axiado AX3005 SoC.

Each SGPIO position provides one fixed-direction input GPIO and one
fixed-direction output GPIO. Input GPIOs support edge-triggered
interrupts.

The controller serializes output values and samples input values over
dedicated data, clock, and latch signals.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 .../bindings/gpio/axiado,ax3005-sgpio.yaml         | 112 +++++++++++++++++++++
 MAINTAINERS                                        |   8 ++
 2 files changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/axiado,ax3005-sgpio.yaml b/Documentation/devicetree/bindings/gpio/axiado,ax3005-sgpio.yaml
new file mode 100644
index 000000000000..47ae1285d482
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/axiado,ax3005-sgpio.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/axiado,ax3005-sgpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3005 SGPIO Controller
+
+maintainers:
+  - Petar Stepanovic <pstepanovic@axiado.com>
+  - SriNavmani A <srinavmani@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+description: |
+  The Axiado SGPIO controller provides a serial GPIO expansion interface
+  that multiplexes multiple GPIO signals over a small set of physical lines.
+
+  The controller serializes output values on a data output line (DOUT) and
+  samples input values from a data input line (DIN) in synchronization with
+  a shift clock (SCLK). A latch signal (LATCH) updates the output states
+  after each transfer cycle.
+
+  SGPIO positions are organized in banks of 32, with registers controlling
+  output values, input sampling, and interrupt status. The number of SGPIO
+  positions supported depends on the controller configuration.
+
+  The controller detects changes on input GPIOs. Interrupt events are
+  aggregated and signaled through a single interrupt line to the parent
+  interrupt controller.
+
+  Register access is performed over the APB bus. The SGPIO shift clock is
+  derived from the APB clock using a programmable divider.
+
+  Each SGPIO position provides one input and one output, and both are
+  exposed as GPIO lines. Position N is described by two consecutive lines:
+  line 2 * N is the input and line 2 * N + 1 is the output. Directions are
+  fixed by the hardware, so even lines are always inputs and odd lines are
+  always outputs.
+
+  Only input lines can generate interrupts. Rising, falling, and both-edge
+  interrupts are supported.
+
+properties:
+  compatible:
+    const: axiado,ax3005-sgpio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: APB interface clock
+    maxItems: 1
+
+  bus-frequency:
+    description: Desired SGPIO shift clock frequency in Hz
+    minimum: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  ngpios:
+    description: |
+      Total number of GPIO lines provided by the controller. Each SGPIO
+      position wired up on the board contributes one input and one output
+      line, so this is twice the number of positions and must be even. It
+      may be lower than the maximum supported by the hardware.
+    minimum: 2
+    maximum: 1024
+    multipleOf: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - bus-frequency
+  - gpio-controller
+  - '#gpio-cells'
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - ngpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gpio@33201c00 {
+        compatible = "axiado,ax3005-sgpio";
+        reg = <0x33201c00 0x400>;
+        clocks = <&apb_clk>;
+        bus-frequency = <1000000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&gic500>;
+        interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+        ngpios = <256>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 77159f279621..5bec6ea50c70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4406,6 +4406,14 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/sound/axentia,*
 F:	sound/soc/atmel/tse850-pcm5142.c
 
+AXIADO SGPIO DRIVER
+M:	Petar Stepanovic <pstepanovic@axiado.com>
+M:	SriNavmani A <srinavmani@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-gpio@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/gpio/axiado,ax3005-sgpio.yaml
+
 AXIS ARTPEC ARM64 SoC SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
 M:	Lars Persson <lars.persson@axis.com>

-- 
2.34.1

