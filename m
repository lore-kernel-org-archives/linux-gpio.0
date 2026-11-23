Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795467301;
	b=e4nKfDnbn1o+aIxTBYarqq/qgGKSlZVU/JIGHbJHP1qa79FSFR17uzwzkv3jzRKWAwcO
	 g1fztfC26883U6+UM1Zn8gnFmhaWSlORD1mYjwGcewERtWWdUezMhHD5NueeTWUmKe7IY
	 Kr5jybT0zF+UoCoWztLMP5XdiiThrnVQ+z8hkmnV1o/AUJlXHrS3hUTyMgsqRQC8mH91o
	 CWWhMKgFOkhBVS1ivoT7GAZxmEsZcOyfOIZH7+6N24yXeN8pggNhE3ojxdw9GrOiq9vl+
	 hXAK/VlK390uh62OAikZ5i5h8VcHfwWtt42gaU20gAYlkERAKreNK9HgLvLgkBm+xDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467301;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Np29t8Z/FJ1Na9S/42SyLOTEL2I9RlgQeD2Mmwpd9yo=;
	b=EL29oeU4gliGuU1WO2N3hzDQxjEbws3HNbw7KjupFEXnrJIa0HrpNycHbNJSrmvD9nE7
	 keuVrNwzDgXufvscexR09bnRUBEF/FuIshxSGaUTm7BBbzRG0zDeig/iQ7Wj7BSCFnqKE
	 oSy/9pymHQeWU30xAiBZz51wb5JRt3nViO9Iy+SnBE++fy2pHJsGAGTwgF/yPMp1shYgi
	 9uUUjyi6PK5tA0RM27H7pRrf25rH4uJc12kUyi+O5Vn0WEl05vw8OrhJzPAWt1KZpXXeJ
	 EVbOpILvq1zB+gBc6C/9z+/EYzs9C0pCi5GFVHXIkuSHtKN8Vj7cPJT8Ef+j/kRgmHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jQNq2LB2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F6B606A685;
	Mon, 23 Nov 2026 20:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jQNq2LB2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795467301;
	b=OceNzGyrUTENh2zca2ygvqFrK9HrmB6IeY+UDwARGJYN5JjC4fl7ADhnrQF6oYfoZ1ZL
	 JEWEGQ3fZgRUpLXR+S4YDf/bDHyIcUJvxs2OUoLA1Z6A0HXVQiWgXMa7Wy15WG+ROzumX
	 eQry8z1UVltoKjMypoQ0EcnXAu20MftMVLciE6MD3VjVPaZ9MdC/sosmPXHVzZjRPRymL
	 l5dert3HMvGJjYPBAedBmGrCF+CWnxGnMrS0vBI7FjxQFgqMMv2Dm4+dLljOIznWVVW6J
	 fOom6kIUJxShs7+Rb5hzjs6xaueFCFkgTrDeqPs6SAWcpFx5ZG+HYLCOXrvvmkC6OBA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467301;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Np29t8Z/FJ1Na9S/42SyLOTEL2I9RlgQeD2Mmwpd9yo=;
	b=HCKx8x3IvnwY5FPy22Rbvw8ArOxzTlzHaPq/qZ0Xr23g4JJnwI7QV61tQDzqghYSac9a
	 +ZknSbYSkdzkCLgdsTRXalKS7Tvh6LolMNF9HQXFrVeQMP0ynC71mptMVcY6pMU468tbW
	 uFc5NaxRUGNF4ZhOg3ZmaWx10oXrPhNR2FMKYiaL31kCgItf1QIfdUWEUha+lm1jcjeN4
	 iO0KJwN3HRx27KV1uMsyTvijBKdNhh0CwZz+mNWLdFFaZkBP+c6VAdbVtewqj0UapWZMZ
	 17Jz0qFAd48lOCFyMcSmOK/b0GNNLe2/EuiJhO846hCag8kyhXakhjSrU9zKnRP1OQg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0CC71F000CF;
	Mon, 23 Nov 2026 20:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467300;
	bh=Np29t8Z/FJ1Na9S/42SyLOTEL2I9RlgQeD2Mmwpd9yo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jQNq2LB2qietHLIoZ8yUb4p1NusvFABBlI7xGkQCqAgEnUJ2rhUpFYPNCqRWDNI7T
	 LevYLsv3j+m4uDdXf/mYtSsTQvMwvsVepNz2aGHBg4Z3cEo2Quv93ehLFA+f7ZUkNn
	 Hc7YaNfFllc+JvpIGBKNXPivHtKS82yBqsYDGwaZFLFMYg/vksL36Y0yPK9cXe1l9r
	 06ty11wnMnLMmugRlN+Hqbn4tDUu3jtPjr5uvuJ0uk4LtPgpTgjpkJ1UgT27RUYcXD
	 BKRoWzCw94h2kWygE5BlyxXZ8jdw7Fs2Bon1+SeNYXHsu1Y4+JBQHNatb3IOqct6A+
	 tojtk9cVuWevg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 317B74C742;
	Mon, 23 Nov 2026 20:54:46 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:54:45 +0300
Subject: [PATCH v3 2/5] dt-bindings: pinctrl: Add Cortina Systems CS7542
 pin mux
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
Message-Id: <20261123-cs7542-syscon-v3-2-f1c07a1703f8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467283; l=3681;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=/9pSikmWwhBioyTJ6DvsVzAdek0b8eNS3ZOh6AZxfW4=;
 b=HJ9m/iqVIseSQDeTOJHVXld2jtWI3Mbch7VVY1qvwwH+wNWr8E6Zsmd6wr09+iWwXL2Dq87NR
 499L1XkMw/WAaysm4o7UjTy1dQIxF3WlGivDqUH7a7CTbBjyNpksVK/
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the GPIO/peripheral selector in the global control block.
Expose GPIO selection for all five banks and the UART signals used by
the OpenWrt port, without inventing routes for other peripherals.
Register offsets and masks are kept out of the device tree ABI.

AI assistance: Codex prepared this change from the existing OpenWrt port
and GPL vendor sources.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/pinctrl/cortina,cs7542-pinctrl.yaml   | 84 ++++++++++++++++++++++
 .../soc/cortina/cortina,cs7542-syscon.yaml         |  4 ++
 2 files changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/cortina,cs7542-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cortina,cs7542-pinctrl.yaml
new file mode 100644
index 000000000..cd5c81a0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/cortina,cs7542-pinctrl.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/cortina,cs7542-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 pin multiplexer
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The pin multiplexer is a child of the CS7542 global control syscon.
+  Five 32-bit registers select GPIO mode when a pin's bit is set, or the
+  peripheral signal when it is clear. Pin numbers match the five GPIO
+  banks, from gpio0 to gpio159. Initially only GPIO mode and the UART
+  signals on gpio72 through gpio77 are supported. Other peripheral
+  routes and electrical configuration are not described here.
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    const: cortina,cs7542-pinctrl
+
+patternProperties:
+  '-pins$':
+    type: object
+    $ref: pinmux-node.yaml#
+    additionalProperties: false
+
+    properties:
+      function:
+        enum: [gpio, uart]
+
+      pins:
+        items:
+          pattern: '^gpio([0-9]|[1-9][0-9]|1[0-5][0-9])$'
+        minItems: 1
+        maxItems: 160
+
+    required:
+      - function
+      - pins
+
+    allOf:
+      - if:
+          properties:
+            function:
+              const: uart
+        then:
+          properties:
+            pins:
+              items:
+                enum: [gpio72, gpio73, gpio74, gpio75, gpio76, gpio77]
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@f0000000 {
+        compatible = "cortina,cs7542-syscon", "syscon", "simple-mfd";
+        reg = <0xf0000000 0x100>;
+        #clock-cells = <1>;
+
+        pinctrl {
+            compatible = "cortina,cs7542-pinctrl";
+
+            reset-pins {
+                function = "gpio";
+                pins = "gpio37";
+            };
+
+            aux-uarts-pins {
+                function = "uart";
+                pins = "gpio72", "gpio73", "gpio74", "gpio75",
+                       "gpio76", "gpio77";
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
index f4e8b594f..fb074de87 100644
--- a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
@@ -29,6 +29,10 @@ properties:
   "#clock-cells":
     const: 1
 
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/cortina,cs7542-pinctrl.yaml#
+
 required:
   - compatible
   - reg

-- 
2.53.0


