Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795812641;
	b=mDFuWLGcvNWzVDoG8Att+ISl83OcujJbQddV4yikjgRkuI2u0fCCAv9AAdGRTlNIhDC5
	 5JR2sA+UY4x6FpyKBzLM1KoikCgHsFX17izzjUKie/d1pmhbf6jBhMgBad9yPCM93a2Yq
	 MyRx6Q64ihz+4Z6aCl13V9vqGRFew4j2AFa3xQjCbX5l7WFNp+jRIMVEYamjZ86YyrRkX
	 U0N6wXUw2pQMMrmx7hiEYTBE9FRBrPnZh3jHe+n5dYxqn+Ipg5fItiwveiMNokFE//6rc
	 yCwI6dXMsmxCtGiRnnGIqIu8m1t9zV9kA87SggSPtNQCgZ2RbKBTQB8/LE5VnUJdsjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795812641;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=v0Bgz1EHTknoJx8oeNdoRh3CgliIR7tsH8ZHa/1EmAg=;
	b=ZUFH35MW0Jn8jr1YHt9VtMDoM20MgBp6nUJy1fhgAcPxZln6yzD+JyhJec3gtorFf4QN
	 UoXkdq6kzjz2oB1sxbytpiOPQinW6rToFayT7cVnd06b3D6rKrQ71tTBQInwDoFUhV077
	 IYGhOo1jNXW6pFCryXVI1N0AB4zZTHv8u7GhmcXCOjN0LCtZ9SIZ2mt0lIrZhCNa8sNFg
	 j+XYF4KnG4xHOFfObULnVcmwY4GPpumO2Zv1o6exnDhKQBKN4O18jy82sDb26NRbMHxz4
	 G8qpq2XfB7+5Yd/7VnZGwMQILLbrYECwK3FqS6EwaYzS0UTK6hUzPYM64spK/0VkspQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6xKnT2G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDEB606A68C;
	Fri, 27 Nov 2026 20:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6xKnT2G
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795812641;
	b=YAoxr8KfGz6q8ndRc+OWwnp5djkLlpPsG+6HHk2P3yhKeNGerDF8vRWzsKzHze3WHHIN
	 fw+c6lz2S1KA4HkICYSlnpwN9i0X7Fj5O0+F30+umv0S/MgQVfc9iuRkryecs9CkA8uwO
	 N1+dRvYVVy8ZSLJtR12VMjCgONILcg6DqRXZH0CnFLIs0lbDucwmQD3aeoR+bHAfKS3eD
	 La6SCrtEhISsTwEQZzOnLI5mY+wJbSuLTtQGwU9DzifCoW6M2pHucO9Ixnq+Mgfw/thRG
	 3Mpkx/X7SDpkNcbR08o5u8g1rJZlvjI9qomSB7tCE3h8uonEV0y6dqf/ivYjlzYE/Mw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795812641;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=v0Bgz1EHTknoJx8oeNdoRh3CgliIR7tsH8ZHa/1EmAg=;
	b=X2b/PgujOop2ugryfiNGP/JTbJ5gtJkIeWTFS647GApGJxwOefLzpNWJc8AVNhiE+WWJ
	 6S40Q7L+YT4DibtypONGJUNRsVKyxvlooCRfXOb9EFvqu4nqaV1Oe0mKNHlriitVoYeNk
	 GkzXJyhXxiFPCIOmjAadyoAsUe0p5Vfefu7HWGg1odp8jc19KMVVqdHeSWw+Y9Zx12hnq
	 ZvYLNrJ0lBv2NCgJEvMzLDkBKaBcZlQTL06lsEquyyGcMJzfQwZrkjV8ZqTiq4MWNxpxc
	 +WUklO9lEZHgxyFsYIcGlboOwrIuXLv6yNmcK0WBJjth+ZfJqzvzA4zaR/joAkDT9ww==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81DA71F00898;
	Fri, 27 Nov 2026 20:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795812641;
	bh=v0Bgz1EHTknoJx8oeNdoRh3CgliIR7tsH8ZHa/1EmAg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=k6xKnT2GVqpfs/o4bHqhPmpTvlbhgx0y24BGc9e/pj30L3il2zCV03Kqbi14JNICf
	 c5Cg8hTT7K7TFGVuDLURl9f156iW9KRDZjFWwLz4rWwioImfFcT7coUn7t1yiFczFZ
	 yahj4KDfNAZbZScQ1nZNMzRBGrAbJU+YcKgHJ3udXALVApoln6HzsjjCU82Ael3rSe
	 6WcJaYem7ZlPiYNykRT66eFmpoMknyz8+hvLf6cShfhmwwR1pb7Lf34eHaCjeXnfuU
	 OYptMXn+lRyIXYLMg1aNL92Dp3Ok3z+AoCulJgWw0yZiGdtST+sBh3fnAO1DYnOVEC
	 2vlYt+sTQFUQA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0E2834DDCF;
	Fri, 27 Nov 2026 20:50:27 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 23:50:26 +0300
Subject: [PATCH v5 1/6] dt-bindings: soc: Add Cortina Systems CS7542 global
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
Message-Id: <20261127-cs7542-syscon-v5-1-d5a373c72b05@gmail.com>
References: <20261127-cs7542-syscon-v5-0-d5a373c72b05@gmail.com>
In-Reply-To: <20261127-cs7542-syscon-v5-0-d5a373c72b05@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795812625; l=4089;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=LqNLTAcu72EDE3AcsaBdidyY70NNKo0WkG3SoF8q1Nw=;
 b=djRcgSWO+zkDwMw7wDWzAQirZzaOzurj7yO9pZ01NSw+4gGR/mx7A6DzYkhFRjnTVU7SpfsyR
 ZRk27Py5e30DdRR3hyBPOsg5F62R96zbA8lUlGKD9TEhRdpegoiyA1/
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
 .../soc/cortina/cortina,cs7542-syscon.yaml         | 56 ++++++++++++++++++++++
 include/dt-bindings/clock/cortina,cs7542-clock.h   | 13 +++++
 include/dt-bindings/reset/cortina,cs7542-reset.h   | 20 ++++++++
 3 files changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
new file mode 100644
index 000000000..59bd1cfe3
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
@@ -0,0 +1,56 @@
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
+  user. The flash controller has a separate reset. SDRAM is excluded.
+  Reset identifier 3 is reserved.
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
index 000000000..136d21432
--- /dev/null
+++ b/include/dt-bindings/reset/cortina,cs7542-reset.h
@@ -0,0 +1,20 @@
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
+#define CS7542_RESET_FLASH	11
+
+#endif

-- 
2.53.0


