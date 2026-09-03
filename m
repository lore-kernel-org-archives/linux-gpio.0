Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11021090.outbound.protection.outlook.com [40.93.194.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB813FDC06;
	Thu,  3 Sep 2026 07:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419502; cv=fail; b=TVQTcqyJHw7RGhuEferOMFWKx7P7DNRry+881B3U54MwMrSZM6h88z9hZcN5rkjFtx4MeHw9LdsiAtF2X+ghez/n3QAJIm/xpRbbI5NRfMN7cGzoaS/BdKwIx7ajXcHsz6mU3W/g6Ylw+PNMqvUCAnKcOUiFuIUbWd4vY5ikPnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419502; c=relaxed/simple;
	bh=ANrmja0bW//C1aSsKiaexrS8S2QFRohDOTirNeLM2d8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nnSSkF/OAXABYlNKWjLbQhgn/7Aa/mQ4MB9Ep3mfj6W9uVICdWu+kKF2KIvENDaXhjqMyI46SCpgfZOzUGblOSJ16WMh+bv2mNADS/dXGzQ7epubpg3f0FlH9dERUyutDLb1GfJoKnx13wuC1G796Aq7UBE69L6lXqx7T6u9RbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=NMHQeNFX; arc=fail smtp.client-ip=40.93.194.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="NMHQeNFX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bn3Kv38I4HGFumTSsww0K3AUgCZillgkeQSZHe7KihkXgUvg/+CMcI//PRxsSCr06Q7d4den+VBj0LekA/5mDKTKOaH8vLtw7fYBBM91GgcVM1k+Hb0/4hcW5dDWNop2ZmkR8O6ArIPXWZeq6szFfd78Dhn3B/xqcf/d5mkgnMNlXsCOWA+umtFmH9j9GPeIc2ywc0KlcVuey73Hvx5v46du+cDmp7aeR90Y9AHpp9DBmQwQyrInyJORgvXkfDl4rRaNQlWtXT6zIni5kR2uWFuOUfK9tO2gwASuMtwTBtos+73KyhVV54uiVLpexg9Pgcz5QN8YBaAXKOO25BjIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ewhUnryhb1VtoEUD03QhlWRXSYNd6vUN7hHGsE/QNA=;
 b=YYpL3jPNhdO0Zji8ryJzGNGFDCf84L0OlKN3RnMRDSl1QK2GLCswbMdULOF7gFyYAUnWXG2n/Frw96lUnX/XeOCKlU5CRK+qQQO15xnCwRBUuTNH02fAxd14Q45FW9Ks73JSL8gBhEiBkeMIT4MsApidpuPK1rZrdbe2kTM0Q3Jx2BrFsMmH76bWSQUcD/1YqvI/+/YxQtjRosEpXmf5kE/foFfYHxI1CSDs4k4VwTaftx21NW+kkiAbh20Pl1IRX30ycDjlE3jqqtFqDRHfDQ+yZ5ZMLiKYVzVOkJEPgsqwwEBjysZnUemZfgOYQBVJhl6vxYKl7IICa38wJAJg0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ewhUnryhb1VtoEUD03QhlWRXSYNd6vUN7hHGsE/QNA=;
 b=NMHQeNFXSupgEiGzBisKeqfH6yVMhO9Emyka2N6LvhsFsMftG/Qm/O/0R0wlEbbkeEkwCek5l8LvCD4rxPvY8XbEXA+wlqD4a/vqXT5JDssdLXV9rWzo+7qsDrhwCIHV/iFJpslWXw6YyyaGIZ5H6vyhUau+HOKrcXYgu7pA/O0HNySmmI7P1j0Ama4oWqRG5ZcxqQOnI+XiaGjAXDU011dnae5mTqTf33RYk5JX2qSLGj+fsaN3F0OlE0IP445de+A6ajC0fvpSYHv2ePZmW5ZEn5eJESeT2NCdjCap/dZA3LI0ljaQf8ttO3fXBnXBSxcwpumzB3aMQLWa0Vi7iQ==
Received: from BN0PR03CA0048.namprd03.prod.outlook.com (2603:10b6:408:e7::23)
 by SA3PR18MB5390.namprd18.prod.outlook.com (2603:10b6:806:2f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:11:34 +0000
Received: from BN1PEPF00018072.namprd04.prod.outlook.com
 (2603:10b6:408:e7:cafe::99) by BN0PR03CA0048.outlook.office365.com
 (2603:10b6:408:e7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 07:11:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN1PEPF00018072.mail.protection.outlook.com (10.167.245.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 07:11:33 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 368394186B5D;
	Thu,  3 Sep 2026 00:11:33 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Thu, 03 Sep 2026 00:11:32 -0700
Subject: [PATCH v3 1/2] dt-bindings: gpio: add Axiado AX3005 SGPIO
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-axiado-ax3000-sgpio-controller-v3-1-b30820e1b858@axiado.com>
References: <20260903-axiado-ax3000-sgpio-controller-v3-0-b30820e1b858@axiado.com>
In-Reply-To: <20260903-axiado-ax3000-sgpio-controller-v3-0-b30820e1b858@axiado.com>
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
 openbmc@lists.ozlabs.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788419493; l=5006;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=ANrmja0bW//C1aSsKiaexrS8S2QFRohDOTirNeLM2d8=;
 b=BGkdGBuIGkjcm6Cmov4is0D4xRNnSu23u1tiE26yW50tj296IX1Nm9PfOnVuqLBvYvr5ALZ/L
 xBGv3KW0OWsAcYxxnTc2ui0rUA1ENOJgYvr1hohn9kFTpSxUVRT2HqD
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018072:EE_|SA3PR18MB5390:EE_
X-MS-Office365-Filtering-Correlation-Id: fc40d291-a60d-4747-3338-08df098a963b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|23010399003|10067099003|56012099006|5023799004|3023799007|13003099007|921020|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BRKRNZDcMdkYJFkMwZgYHhgnWEYnYpzo/LhIjRCwXnz2Xf8TypJ44vOXrAEmcYo9ojoR1vm/9bjO3M91SCBZ6yXjMPS9y7B0NYoEJWfmpFgkDHqZsmxcPjGIx227Em6ykLaDtEfNP6QuHUmUfsx+1ijSPFbKQbZOD+MRtqcXEl5IEEcSt6hE6Kz40q0brfNFzCLw8Hpudy9hDRnb8dLGhJ6xkH5l8lFwkrDXtJES//iz5DG6WUgG/qUBcR3drT1+lwfGSMTAatMGeCwD3u3mzy49of7zmdluOuQ9CyDvMYf2twHhDVtxazr1zxgJjTaHJCxwTUzz80439JKlNxJDRDvjpDZuF9iPXh3MM/DqP721a9x+OkrfuPO3OeUSl/4F5ka7Fxg5aaRHHCz9LiCHEusDSOQq1w7HtklkgAiBEEYUJxuDR0n5tMMhNI0EB+f3xgwVY3MyA0a1j2jcV+B7huikLbbZXXyCrvjciMbOL6PWc+pjaBgrbgFLyrE124ylsb8f/1aA+I/ky57QEBYD8UrZU9aMkUTG1es1quLo+zvszHNeUctnphrq1okP4jFPvsDjoiszRHEyPw8ZLQD2i0EyNIVteYuMz6z6mNhiQQj7avO7pUZmul5gzG0rAfh9kTMdC0UDb86ObrvjlHi5Xi730tM11YeUIHOIK+hyuiXGOAdEZHXH6O0py9tIaW41
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(5023799004)(3023799007)(13003099007)(921020)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N8xXq8+t4VKRrnlxRkz+DMNF94YSNTn7gtOHOfE5EJYA1QxiUwYXS+ZVmmlaTvqU0zwvLvajxhGQLggkxEzTWwTCfpdDwATOXgnCuN51yLiQV1QGvK5qQ8+QlBvKKWiuZ3UoTCq90S83tRNP6Fzuf6Fdi5gr0MBwiXnixXjfDvmAoy0aXxI9c0jZUhWS5ytf7Pt0/JoMFXQs3KtmzFei4N0dl/xq8GC/ji7r1zBbMQhVbtLXnlaEXjjgCTdPPGQVu1LEjvpD3FnXjjL6dBXLLxy6zQNxDkIV2jX1CdogFua4l+D3R7FNtKsYBydRpJkGCcV8qxh92y+bM/XgI7X7lpr9aIuuhnYvtbZ4cVqzFSE8yGAySUOXDYZzJ2HLbs0kOmjHWt5osAYzp7WpuCc32LUyqAI07gLBd2b/hMc+pjvGqqvT1djxAslQ7tWCwv/L
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:11:33.8824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc40d291-a60d-4747-3338-08df098a963b
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR18MB5390

Add a Devicetree binding for the SGPIO controller found on the
Axiado AX3005 SoC.

Each SGPIO position provides one fixed-direction input GPIO and one
fixed-direction output GPIO. Input GPIOs support edge-triggered
interrupts.

The controller serializes output values and samples input values over
dedicated data, clock, and latch signals.

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

