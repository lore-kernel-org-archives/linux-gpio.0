Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795467297;
	b=PGPI9Yg4/MyPQU9ql1ayTYOl/zGzx0LO3vlSWApzJh8yqVcwYS7LeY+Z9xZ0wEqzoMcS
	 1pyrgsg9VNnH1Ygu3JBehB3/eQXzDczYXJICTyGDJMiON4oP0l8RQozSAFd4S3djy6t2l
	 v0saiLPq3bP3RvgorppVNqYM2YMsxiR8fIlAW4OpXIwj0vGz46C/n6IV+oydmXK5SCYW/
	 VwSe5p5CzKNbBgj8mCjW6CSCtJDyHdmtNSidED7yLLoTy0uKiFw0d43c3VCXtL0Qd1/pp
	 8pYlZ5/mG/yop3axapg0ch33cB2xWP+UkQqWz1nIIRkuaKNHVvKJGoLj1EPFOZeuRnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467297;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TffwmXw6UdCEbT8yxrtF0Jha1bBK7TnOkcuTUxO77aI=;
	b=2ddnO10i8PKSbiU8djAd4poASkRJa9/opCwmZOVjb3ul5z4Ii0aQ5dq6ZJ2ZxXvX/48Z
	 FIJrOamPVPIEP+un5QM3gM3w34SwvQhErD4v6wf+wRkOpmti/BMsYpztaKx+zntCfpkx5
	 VX6o1seYX9WPPYVkP4kqP2nh65zdfTtr+T8j51gNp0P8QeWDOgr6kbCVu9xz6fLZ/z/qW
	 5bEJkb4eE3WoIvDlksY8P6yryi23TOs0X+zVzs3r/VezVCRbUbGdqzPec08l2EBfSeivi
	 Nekro/anXnMWdY35B4vhEFGWKWNvuywt76Dg4kXLXMmXX5n+QHknZON5qb+Xv0I2oXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ma9oF9RG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B9C606A33B;
	Mon, 23 Nov 2026 20:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ma9oF9RG
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795467296;
	b=gVMD+KkfeHWFPyB2zFGYOW281JAcDMTs+a5pb7x/2/VEe4P60p2B96b0rT4wYvxLXYkz
	 4p2jMAUSIcLrAbmQDm5QboWKAdu6RqbPeLzTPA7MboOcbeheGkGlwZAUVrZjAz5/gIlFl
	 ynoWOBs/rvrHMemQC/ADvZNcLjqe261BfH4TWr0OWgtiMI/7iOsVa+umWQSSgu3WlT7vu
	 OeyC4jKTawu1BIRA/lXgLzXUGmi82diicxBg/yzrtoHryhg13cBaLWtSeLecZGl4l17dc
	 IHdVIzLDKtUK66t819s9xwIjITEtAQq7tJ+3//hk9q5L8M5Wp2bZl9G4W2WGiaXkxXA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467296;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TffwmXw6UdCEbT8yxrtF0Jha1bBK7TnOkcuTUxO77aI=;
	b=bYpQsPGL5RKvCIu/kMpoFP+4APRK7jHMM5R2m2xhnK1kHRv1XXY1d0wH/aCZhN6y/df1
	 XGJ3FWcTpG4sa7ZeqA31awzHtz0HA6XUWC997w1RvUELL1FF3j6HK63C1p8I1nkmQXhtM
	 rjbqOMExJfD3YjopSnOoXbmXQsSOKdO0i4bgfSErxZlNRirTvvpJdOrzQlu+p3mYEldBU
	 6F1IZWLHsS+6HMIP7ICMmrqqAI9Wi2Y2FVDcvjmJRMjpT6gK7+Id0vg6JqjoTcsM7meej
	 nUxQy0G/ws25xCVsosfaj95M7YEzsBM4dPTxSqDfDLBeWb8bbH899VLDxIEv2XMoc6g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 850E21F000CA;
	Mon, 23 Nov 2026 20:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467296;
	bh=TffwmXw6UdCEbT8yxrtF0Jha1bBK7TnOkcuTUxO77aI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ma9oF9RGpOCW5ADaBGltDTom634IvqdzkCLP8yujiK+XkjbtyBWqBIkugBgJIZlxx
	 BIs/SPD9x2ajk7h5B5zxpkHOQ90DyAN0gz6vgVwjCfmDuGxoxZFdFBti07fTWi0GHN
	 Exh7bKt5f+WHXorHXn98Ebjm1l/6iZEY5VdCm/McPGFO/JBOO73v2RWB85Xa3jXVk0
	 m30oNma/5wTu2eQCvz4sR7Ia0DpV7ha+xjZks2RodF1e9HL7yZpYjaOvmm4uaJ2jLL
	 Y9e+BhItFM1ZY/L6Uza2rqG/Tp+CxebbBNWnU4CZIHUq9Jjs+Qr966LXQsdt3gDKk/
	 ACxjWrMusA72w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1565B4C73A;
	Mon, 23 Nov 2026 20:54:46 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:54:44 +0300
Subject: [PATCH v3 1/5] dt-bindings: soc: Add Cortina Systems CS7542 global
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
Message-Id: <20261123-cs7542-syscon-v3-1-f1c07a1703f8@gmail.com>
References: <20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467283; l=2642;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=RyDEGw2diWLaYs2xRDfPM68eRB3ceSppkvhEOGqljrs=;
 b=cS/aiaZDhnjDOzPgoIwG4VUs5jKN8M3LapI3fooeyJQ8LGwhwCkODATkcPh+J2apKPlDe5X0q
 tegjShBG09rCJPpJTLfN6/vcXpLoNmqSOQY/g9LFCyTpro7mK7Yj/jP
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
 .../soc/cortina/cortina,cs7542-syscon.yaml         | 45 ++++++++++++++++++++++
 include/dt-bindings/clock/cortina,cs7542-clock.h   |  9 +++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
new file mode 100644
index 000000000..f4e8b594f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
@@ -0,0 +1,45 @@
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


