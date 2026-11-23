Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459282;
	b=ShPE9gS+R6KeF4F9gbQdwcWs+UD2RUxf3LyUoRVrHEMoDpMBfCOLHRaV0IBGEZHhCD6U
	 5J4uOK74rJR5M8BiA8EMlh5QGUI5dZcn/k+6SV8F7NMBoKn2GjxRcDjyCgDzZlEJBgKZt
	 y2cilPMFkYrWP/J4xyLaoTE0iXE3JK8gnhZYg6AJqe9H9tFKwiYDLdhyDWCsRfpoQfl/f
	 kbViUtNcewdquqr4zlWFe3/57w5P1NyLDER3GCl01CJZJo7P9RypMWmzZ6oMLYR2gAP1Z
	 SpMb4knIwxpza+9OMZsImOdEF35DOLpXq82uHLb6REKRNIdvxfswq0jKB66TAMs8pxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459282;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=etweggmvewghqZeCOi7wUZ9wIdIXkNXXNOxh61ejO+Q=;
	b=QGfGmtI96mGwZdOT3kVEaWmB3X07qmL4Y6BNkAkKAwnXLumx+/opQJk+ee562No0fsxn
	 4d+hjaF3E1o6bqMWBHHGa820FxHGFdhndMpgKdeeAJ4UqF9OBigWKyEUJZQAUF+x2fF1a
	 OBwUyuAE/ZrzjttYifxOfeaxHeMxSk8+DW9wtxF2HgUOv++G55ymP/jX3XUnaHbzqD0Gu
	 Xhk1UhshDtkFXa9SwYSQ8fEht9kRsdei/L+S7th3OZBUv/DZWQk+G6dUMHAcWNq6W3CW+
	 hsCaLdsF7JvzRVhTNbHVzsE5lsHI9QtE2n8jUwVt6oebzfZ9+fTNdOK57NrgaKewNQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LqanlPaV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921CD606A31F;
	Mon, 23 Nov 2026 18:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LqanlPaV
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459282;
	b=V5m9pbVMVm72Nlidenx8lzySdZYL8J5iRz0ttsop3pTmuzyNmQQyzcSDy3kZSw10eF1g
	 fAw1AEB6/wD6xgugdXos5yO00heCZyzFDTedJpls6HSyLii8aukAFasNdo6gfKGMUmC7X
	 AijCWuHw8jfM99OFW/we8ukfUhKv5ENL/pCWmX7MBpryrQ6NyYk5BZEGP7WtrNjam2hcS
	 KLdWn7Toby0HLNrI6Ba5tRJahVDVDy20MDSMIAPEbdnpQOAj8GvtRz98scbd4uzga1bV4
	 U+0MQ9LxykUp1xOOPQtlgTNyklLW3MAB4lL7rfC90/vsMw8KrGLvrxN/sOOoet5LYkw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459282;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=etweggmvewghqZeCOi7wUZ9wIdIXkNXXNOxh61ejO+Q=;
	b=Rt2xGV+dRG414T+HDb3PGPG+CITepVscNf7NAWnTvMiM8LvGeWUmnOgKhBdVi7jgr5qs
	 5P9SBrsRQQH/JQ2aIpGOCFsrU/kIYqJlmAfRQn8uBBHjON7U/Q50kLwmz3HyAG3nmI/Go
	 oL7tBoPQnMBgUnkfx2dj0seQcusquYaXySf1w7WQpbFmLiT0pI3i5AAF52aq8C2FoW/ni
	 eM181/RyfjCYS7aBBbQoOZpGXszWLOGFHESpRY+gNEnt/hc5yxB0UbulZnSiWJVAJMrBn
	 2kAMFd2Wf4X7XXrPnHeeZsHpFiaaGNAR58Vpxam1IRFLPTlKuLo42+BXskQNCmjtQZA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D3321F000E1;
	Mon, 23 Nov 2026 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459282;
	bh=etweggmvewghqZeCOi7wUZ9wIdIXkNXXNOxh61ejO+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LqanlPaVdVslqpa8pijZ/2zTI3tQtkLc7hDsR5HQV0dh2maatazdvZDBpsWyMAh6X
	 +kyy7UDSpiOJ2BCERZHZT5zexmnNZ636tdgQTREkzMiCU21YnluXI4em+6l0oKRGAe
	 QI701/xs3K1vV9Yw/a9uc2t/POQZnk60VBPVS81mnWJLIfV1eiRRbRouqM3gTbu2YX
	 kUalMz1gqJUsbpfpyeqiK/vysa6HurHBRaVb6welvdBMdHDFn3ord/TsaNFWw+8ZMC
	 99CbFzsqNRLLArXXgBMUrYGssgWFXoGlb+tNmpniU+p/oGBK87EZzcxrBgMy86cJas
	 AQ4L3d8W0fBhQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 315BE4C5A6;
	Mon, 23 Nov 2026 18:41:13 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:12 +0300
Subject: [PATCH 1/5] dt-bindings: soc: Add Cortina Systems CS7542 global
 control block
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-cs7542-syscon-v1-1-49858e631449@gmail.com>
References: <20261123-cs7542-syscon-v1-0-49858e631449@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v1-0-49858e631449@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459271; l=2734;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=FpK/rtN440rKXrT4wuja3g3AXioE5n0xbhhWrVDfiGg=;
 b=dMCDcND35ZLUQP4SaDj3fquLpIXW8sGrBp5IFWt31xYIFau+g7bRCwpKRiJdVq1YMl2o0cVpo
 gmIpD/GJ7YFCEATjt9Hn8mHKArGTmC3F5daYW6+oOYiB9smjW1mWfhz
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the shared global register block and its strap-selected APB,
CPU and AXI clocks. A pinctrl child will share the syscon regmap. Keep
clock IDs in the order used by the previous out-of-tree CS75xx clock
provider.

AI assistance: Codex prepared this change from the existing OpenWrt port
and GPL vendor sources.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../soc/cortina/cortina,cs7542-syscon.yaml         | 49 ++++++++++++++++++++++
 include/dt-bindings/clock/cortina,cs7542-clock.h   |  9 ++++
 2 files changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
new file mode 100644
index 000000000..fb074de87
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/cortina/cortina,cs7542-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 global control block
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The global control block contains the boot strap status, GPIO/peripheral
+  mux registers, reset controls and the secondary CPU release register.
+  It provides the APB, CPU and AXI clock rates selected by the boot straps.
+  The clock specifiers are defined in dt-bindings/clock/cortina,cs7542-clock.h.
+  The pin controller uses the same register map through its parent syscon.
+
+properties:
+  compatible:
+    items:
+      - const: cortina,cs7542-syscon
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/cortina,cs7542-pinctrl.yaml#
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@f0000000 {
+        compatible = "cortina,cs7542-syscon", "syscon", "simple-mfd";
+        reg = <0xf0000000 0x100>;
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/cortina,cs7542-clock.h b/include/dt-bindings/clock/cortina,cs7542-clock.h
new file mode 100644
index 000000000..34d544238
--- /dev/null
+++ b/include/dt-bindings/clock/cortina,cs7542-clock.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_CLOCK_CORTINA_CS7542_H
+#define _DT_BINDINGS_CLOCK_CORTINA_CS7542_H
+
+#define CS7542_CLK_APB	0
+#define CS7542_CLK_CPU	1
+#define CS7542_CLK_AXI	2
+
+#endif

-- 
2.53.0


