Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602861;
	b=av1KU5fYzq0qhfzgqsJOH409opk/YtaEg8kRZWpnFcrmUz7IYuWEEc8RxRKZZCjUYR7N
	 kmwGkJviGo+9kAFOu4P4J3HUTjhQ7AQjLKQzKBcIJ8po36NZmQ0m4hEw6eNB5erJm8eJV
	 UffRjUKoIqyggWWPO0IGaYZsKt1ukI4o7yYGA6nqduXFLf4ZW0lIcso2zWGLgMrJHxL8T
	 oZ+GnNOSE6ECiG3iC24J7ZrLqWM9XmYsxEz9wuZ5mThkI0OvTKA8kh1AhgdgP2CY2zWki
	 HnjnV01mm/tY72rrDVOuzFyyPKSrQ4DBGQfMAzCYRRT1R+Agt7GBcHVeA7yIwn7LugQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602861;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dbB8vlDFQn5XnWg+n7KR96SKHqcyEBWit0sDLa1+rqk=;
	b=l0/JpdRII1lmmMwfAuesGmWFijgiQIkRvRJx0M4eIYj8hVh4jgXrVUccczAts9oQbFwA
	 lQ54R+h4kJ80X48aeoahmeRMgnGlprbpxrd1fGWwM+GoY3kuAJ7RitZ1EpOTV+DhOdvWF
	 gHB+kt6Ppst21riTv3zaXLst8X4AZfPi0PM4DE3yF8ftOTVSQiP8oxUKSNnQnGRncgj62
	 mKU2xCs7AZe43JYogFrhJEvoQxtIeymHLcKsIc4yiadBy5ckba1VVXMt9Fgvfhq3mLN2w
	 lnMV6OvI8b0dZTZ+FpO092Cm30hc4pkjOCF75YhJUCoe1dA8Cv44iGLearhQyr45jMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZT+BLMa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA71606A68F;
	Wed, 25 Nov 2026 10:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZT+BLMa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795602861;
	b=Gk0AvEjTDm2Bz7H0qt0F5sr1DvIIXS5SI3GmdMDrBFkw23tUMY7GMhiCExZXAdySV61J
	 1CbH/9WQdRcP2YtH4ppmmhDfwfFqIb/xD2Jj5vlevSvWSSU9dI01K4BfyyyAvBsDE8bhq
	 W39qxExJwVABEW5+6nhk1ibXVTqt1jRx+DT6cHYiVwBuqbaCMEVJumPKkXOosLZSeoYn/
	 B/aiZaulynuCRBZDVyX3dieRSrFNWGR+gWQ4eS+EVPZ900cPwBb+4W5OuuDJLpPug4ssh
	 ySmZ6FM4OzCymGRNvtdrRPJ78mCDBkUDf62ova/07JK/KRT7Mn6j7Zv9mMzrl81dyxg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795602861;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dbB8vlDFQn5XnWg+n7KR96SKHqcyEBWit0sDLa1+rqk=;
	b=R85zXin+y91JqY9GBvRMVgGwta9poHNU17cWGneytxlA5G0sUSfagLp9c1FA9dbHAkyg
	 ovqT4gvVbWTgLqL2buNKl2xBePkb9O/i4w2p74J0Ld56fhGrWYvLrsBSgTSdIGxZvXI0K
	 BKVU50yfXA0B/I5LisxUNng5TS17IyTrv8E28SkFHGY0TFpzUMVcMPop+EYg+T2uwXwln
	 CK1lqCZGH+hhaJ4c0VEiTc2GAV6vbEX3Nw24kJsmo/koSaSxau9a9HgnF8q9EMTkFgVnZ
	 TGQ4PUkyReMxRR8bGzIRlPUGRKr3lYDWHGvlyIRTBWpBM5VTmPo8lSI/8QpBuxKtkjA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B0711F0089F;
	Wed, 25 Nov 2026 10:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602861;
	bh=dbB8vlDFQn5XnWg+n7KR96SKHqcyEBWit0sDLa1+rqk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EZT+BLMaW77A0AMPUEZ8WvMWpwHXm0hjA8h8VLRxDrpmRyh7gSjLiKEnBx51yiSF1
	 ITiVxfPxnb6JFohMkzbl1AjISSdltIRQfQsRu+AuCuGVJ/VkbFzjvRolYEeBnPI73t
	 49z57t6uKMByy+P19kTk8DL/llrpD/Jyu+NO6CEUEmeLCKdZwQR2k+oc3KCTXceRjM
	 XUQ8mLDC5LxoVpumOdnVFdn2EmBw4ryOplsBV0GCy43q8N5aukykvSyeV8zf+6DoNv
	 PmBe1kxJeGNe3Xje7tczPfAq5y+hwndMH4M0yrJn8PBqrMBAJKPzFR4tWvjxYdQtyk
	 hN25ec8CjTbZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A9E284CE4C;
	Wed, 25 Nov 2026 10:34:09 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 13:34:09 +0300
Subject: [PATCH v4 1/6] dt-bindings: soc: Add Cortina Systems CS7542 global
 controls
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
Message-Id: <20261125-cs7542-syscon-v4-1-3337bb0d3b48@gmail.com>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
In-Reply-To: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795602848; l=4010;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=oMbBnadNt9Zr1iGu4MirHsHTm5dEUH08qquCfQb14rE=;
 b=DoBnnbRDu80WwSff4+ab4qgPwFmqoclnUkU7h7nAjaH/T7eLngif5afGfFuW7cKjZvdP71WG1
 kJH3cw9f+H/AHyGmmv4hbhHTlnbtrWanMxWMmOnV7GW9q0LjbyXWVgF
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the shared syscon, its strap-selected clocks, three PCIe
gates and level resets. Reserve the former group reset ID and assign
individual IDs to the seven network reset signals.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../soc/cortina/cortina,cs7542-syscon.yaml         | 55 ++++++++++++++++++++++
 include/dt-bindings/clock/cortina,cs7542-clock.h   | 13 +++++
 include/dt-bindings/reset/cortina,cs7542-reset.h   | 19 ++++++++
 3 files changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
new file mode 100644
index 000000000..561bb7b63
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
@@ -0,0 +1,55 @@
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
+  It provides the APB, CPU and AXI clock rates selected by the boot straps,
+  and the three PCIe clock gates and controller reset lines. Individual
+  reset lines control NI, FE, TM, scheduler, QM, NI XRAM and the entire DMA
+  block (LSO and SSP). The network engine consumer must acquire all seven
+  lines exclusively; it cannot run concurrently with a separate SSP DMA
+  user. SDRAM is excluded. Reset identifier 3 is reserved.
+  Clock specifiers are defined in dt-bindings/clock/cortina,cs7542-clock.h;
+  reset specifiers are defined in dt-bindings/reset/cortina,cs7542-reset.h.
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
+  "#reset-cells":
+    const: 1
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
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/cortina,cs7542-clock.h b/include/dt-bindings/clock/cortina,cs7542-clock.h
new file mode 100644
index 000000000..c68c6ba20
--- /dev/null
+++ b/include/dt-bindings/clock/cortina,cs7542-clock.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_CLOCK_CORTINA_CS7542_H
+#define _DT_BINDINGS_CLOCK_CORTINA_CS7542_H
+
+#define CS7542_CLK_APB	0
+#define CS7542_CLK_CPU	1
+#define CS7542_CLK_AXI	2
+
+#define CS7542_CLK_PCIE0	3
+#define CS7542_CLK_PCIE1	4
+#define CS7542_CLK_PCIE2	5
+
+#endif
diff --git a/include/dt-bindings/reset/cortina,cs7542-reset.h b/include/dt-bindings/reset/cortina,cs7542-reset.h
new file mode 100644
index 000000000..4998ca11d
--- /dev/null
+++ b/include/dt-bindings/reset/cortina,cs7542-reset.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_RESET_CORTINA_CS7542_H
+#define _DT_BINDINGS_RESET_CORTINA_CS7542_H
+
+#define CS7542_RESET_PCIE0	0
+#define CS7542_RESET_PCIE1	1
+#define CS7542_RESET_PCIE2	2
+
+/* Reserved legacy composite ID; never reinterpret it as an individual line. */
+#define CS7542_RESET_NE		3
+#define CS7542_RESET_NI		4
+#define CS7542_RESET_FE		5
+#define CS7542_RESET_TM		6
+#define CS7542_RESET_SCH		7
+#define CS7542_RESET_QM		8
+#define CS7542_RESET_DMA		9
+#define CS7542_RESET_NI_XRAM	10
+
+#endif

-- 
2.53.0


