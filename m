Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11020106.outbound.protection.outlook.com [52.101.193.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE713BBFC3;
	Wed, 29 Jul 2026 07:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785308535; cv=fail; b=ryc2/AK6y/i1qEgsMDerh4RjjCRrgmwjiElzGYhexwd7KJJ451mN5kDMb9jg8WtWEvlXzN7uwMZsTi2YYQqXs84UO5T+PSX4n6mlS88xjbLJaUEVpsDHHIMKOzprB+Ho3gZ7F4xwxMNPxNYACzUERADEPJBvH5LxiAkRvO791rM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785308535; c=relaxed/simple;
	bh=rsi78svL6PQA40L9gUIvHefMzvaw/Ouu7EDzQD8WeEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3yUoa7ecIWjxXMIhva5cFbHj2ohe/Xt3C+vJsOsQ4GVgZspuEzwwrp/Wvbf+bXLDG/oNjDlR9++mntBHSsK4h7ozC9xHLFgu5QY4Z+46RxEoRDg1dsmi9minRtAkY2AH6SUlFQpkTUnoShWmqsCIkm1VQM84jvyrytpjpPA2Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=Hs7SyHR+; arc=fail smtp.client-ip=52.101.193.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="Hs7SyHR+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoIA0GUJZ4BqRAd/wVpO7JJ4iTV6wrrWIiZvAHhD4yaODqui6Mv1i7yp64fAKOKQXdYz/SSKuC733vLCay3gTgV6ROPKdNDOcW7fcJMxsUE3pqeUbV42MQOgu74Z3CBrmL/pOt/3ddU+1O7PLdomZdugL2oFelKZ9NeENuXSUsB5e93eaihs7j81CK78zHiahI5QIdwJ104+83yS5lCQQdsgZHIwP/6CAo8DkTsXAqbBvor7optoQWsImG53XO9sBn4tk1OTqy0ET/RVwaldJqzejmchIBWtMhsxiZhF+rFLxHP7piG2UdNVqJTRxX/qNixc7Rasr/hnsv9Gy31/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tV0VfswlaPBE1p6JkoOTNbNiWCTp/wujejH5tob18g=;
 b=WbkrYHASon+DCZJM+t37wkHP/AWRQASzIIJzRxCSKBzh0TjyanjXLCf1BzEBXTK7NO+ReB+P5/+1BmZxQSuSbBr0MKWqDD/So+WjsEEPYNh0yc9PUs2izsCMVGfO9INcZkBdIxFx3WjL6hhsVrQTMdTse+6B0h6zIbWJmC98QGSTt5+6zeENj/0k252hQHdlwuWZE3AgxtA/GF4T6xkdB37Pg7gYrtDkLNC96Tl7sdkED/PKxLZyXYUtTgrCK1CfIIy5ygMilw46icRcAWLjM6IHW4zUhb4S7XNwq2C8Pf25Uh4CNQvt2oJWj1TlKE9cs5VIj87BxRNZhmp23LJBZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tV0VfswlaPBE1p6JkoOTNbNiWCTp/wujejH5tob18g=;
 b=Hs7SyHR+aOTDlR6G1wj+NVevLMYzNdODsm38q9M/dP7PVsCoE/Y+P0iMJg8zzR9uDIHIpChXgXxVpCpOlMQHsEvPcU69gblDr2RUv6vFtl65NCEJbDIpHVii9vWQkNBbSlXecvOLqArvEdyMyzAkXiz7HIGO1CoSIishUf06JGarz2POnk9+J9miNxlynkZo7+ETaachBe03R9JQhTZAhtBYl37EXwYwH19NmAXC/Ol3ZxCYryBA8tWvESJElg68PhTmQbStDnszaiyHwiPX7sWZjG45glSPXQwVkbRvMEn+nzcBjg5okSiYZYS5WO46nYQyWOAgRKldIqLeWDpQ5w==
Received: from SJ0PR03CA0266.namprd03.prod.outlook.com (2603:10b6:a03:3a0::31)
 by BL1PPF54491B7F1.namprd18.prod.outlook.com (2603:10b6:20f:fc04::d98) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 07:02:08 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::3b) by SJ0PR03CA0266.outlook.office365.com
 (2603:10b6:a03:3a0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 07:02:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Wed, 29 Jul 2026 07:02:06 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 9C2094186B53;
	Wed, 29 Jul 2026 00:02:06 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Wed, 29 Jul 2026 00:02:03 -0700
Subject: [PATCH v2 1/2] dt-bindings: gpio: Add Axiado SGPIO controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-axiado-ax3000-sgpio-controller-v2-1-976f4ed11438@axiado.com>
References: <20260729-axiado-ax3000-sgpio-controller-v2-0-976f4ed11438@axiado.com>
In-Reply-To: <20260729-axiado-ax3000-sgpio-controller-v2-0-976f4ed11438@axiado.com>
To: Petar Stepanovic <pstepanovic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 SriNavmani A <srinavmani@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785308526; l=4778;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=rsi78svL6PQA40L9gUIvHefMzvaw/Ouu7EDzQD8WeEA=;
 b=3acNIX/dIA0UGkSyxnj2f06tNbjFYZ5cQYafOJtI2FGOkYVsih97u2vY4hMb2mwxsNKfApGrv
 gIeulg9m/kMDr4JIIcq6R4e9U4veJHmgE7Iq1wNJ1JWS0FaX9buEvoO
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|BL1PPF54491B7F1:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e38246-12d4-43d7-04fc-08deed3f4d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|921020|6133799003|56012099006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	I3Xz0MiboLt/FbRwzW3lKDfumxb/H4QwCF0+4kL7fOKa9KXdagBNZjR5iRwIfhOpiMD5u369EHhKS6xkRVOnFgEDVTJHI5MYtYoj/3zXA01+sBtbQcW7/NeVYr+BihsEO50JzF4HgO1XoJV2OHbkmWrFpy+EP/YXZy4trnCvF4BaDBppgG2CHzAhju6mfh1wgQ/w+q0CZ87yo+EHKKIAC+lXuBh8scB6PNSTsWS6HbARJ7F0acm7ok0pgJajBeOHLgGdkNxnflhymOK2axSceBzuu6RYC9FzFAhREfsiy1VGAriLGJzjzlpLhFxLFgZ1A4PH19SsmO52EawKj7o2i6dUs8+aoC1Hw1jHdmcUiYrMGUcsfWQWOoUW/xExzxN/J+v47ltrEs1T1dIGlu79EVzgLZnRJRieoF4qwZXDimA2wlZGT7SM7MrcsOW/PoViKOP4g5VVEP4KxRl0BJQjO3UcriDCDfjQWSbmVasDdsjl/yxv6cVvr1uOuM9TTh7KNjullq0HnCkcj5MSI0hyDwpImcFg127M8xHCJf0bm9PX1wyfmsPX3+G2upa4a8RpXUaZ0iDbh8akVnlrWxNJwwo8XkvzNPKp8wpRnZ0LF+oY8acCcgZaUkOdBdBybYhkNTlVh1KcPCC5cGhopiknP0OPJsh7FhAP3gh4/nUMC0mywl7HHzhT6VytkCFzFCF7
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KTQtGdBmY9IUthubgg+46bzOW/VUxHRsDsA69xKIgChSpAz/j6yu7xq/UMIk8jNNZggD7fDVkLI/6L75TWzmhBL7pqUZYbw995p+/tri5oB5Rq5IgvdNZQTs6tG/++ZsRiIK45aYyZBz1xt8AWsMXtUm3DVu4aDKGtet7v/bDTTvj9udtc8iEdQih4uIu+XYrcfSDNr2bG7bh+vYjYkc5QXJbZvyFPnVBd6loiDpZ9hhkLkZL4jHzEEB3XowfW5wCD1TT2qA80FZYi6i9pQ0JZspllTH/ndsS21fL3It3vv+4nXQYmi4L0HkADjiZFfRpr0X/vR8QKzFMPBnUxe7Ur/J2GuH/lknghE2AfCKRSVg0Mir7ey71Z+FDmmvjzXnRwQUYQSCAQbCLNUVRTP3BdQjqfA58jOYQrHp/oh5XHoe7q99XL6o8dBqZs8O5Tku
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 07:02:06.9960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e38246-12d4-43d7-04fc-08deed3f4d6c
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF54491B7F1

Add a Devicetree binding for the SGPIO controller found on the
Axiado AX3000 and AX3005 SoCs.

Each SGPIO position provides one fixed-direction input GPIO and one
fixed-direction output GPIO. Input GPIOs support edge-triggered
interrupts.

The controller serializes output values and samples input values over
dedicated data, clock, and latch signals.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 .../devicetree/bindings/gpio/axiado,sgpio.yaml     | 118 +++++++++++++++++++++
 MAINTAINERS                                        |   8 ++
 2 files changed, 126 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/axiado,sgpio.yaml b/Documentation/devicetree/bindings/gpio/axiado,sgpio.yaml
new file mode 100644
index 000000000000..448f01c367dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/axiado,sgpio.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/axiado,sgpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado SGPIO Controller
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
+  The controller operates as a shift-based interface, where output values
+  are serialized on a data output line and input values are sampled from a
+  data input line in synchronization with a shift clock. A latch signal is
+  used to update output states after each transfer cycle.
+
+  The interface uses data output (DOUT), data input (DIN), shift clock
+  (SCLK), and latch signal (LATCH).
+
+  Each SGPIO position provides one fixed-direction input GPIO and one
+  fixed-direction output GPIO. Input GPIOs support edge-triggered
+  interrupts.
+
+  GPIOs are organized in banks of 32 signals, with registers controlling
+  output values, input sampling, and interrupt status. The number of GPIO
+  lines depends on the hardware variant.
+
+  The controller detects changes on input GPIOs. Interrupt events are
+  aggregated and signaled through a single interrupt line to the parent
+  interrupt controller.
+
+  Register access is performed over the APB bus. The SGPIO shift clock is
+  derived from the APB clock using a programmable divider.
+
+properties:
+  compatible:
+    enum:
+      - axiado,ax3000-sgpio
+      - axiado,ax3005-sgpio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description:
+      APB clock used for register access and SGPIO shift clock generation
+    maxItems: 1
+
+  bus-frequency:
+    description: SGPIO shift clock frequency in Hz
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
+    description:
+      Number of SGPIO positions. Each position provides one input GPIO and
+      one output GPIO.
+    enum: [128, 512]
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: axiado,ax3000-sgpio
+    then:
+      properties:
+        ngpios:
+          const: 128
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - bus-frequency
+  - gpio-controller
+  - '#gpio-cells'
+  - interrupt-controller
+  - '#interrupt-cells'
+  - interrupts
+  - ngpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    sgpio@a000 {
+        compatible = "axiado,ax3005-sgpio";
+        reg = <0xa000 0x800>;
+        clocks = <&apb_clk>;
+        bus-frequency = <1000000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&gpio6>;
+        interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+        ngpios = <128>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a674e36529f7..fc613271f435 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4407,6 +4407,14 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/sound/axentia,*
 F:	sound/soc/atmel/tse850-pcm5142.c
 
+AXIADO SGPIO DRIVER
+M:	Petar Stepanovic <pstepanovic@axiado.com>
+M:	SriNavmani A <srinavmani@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-gpio@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/gpio/axiado,sgpio.yaml
+
 AXIS ARTPEC ARM64 SoC SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
 M:	Lars Persson <lars.persson@axis.com>

-- 
2.34.1

