Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795812641;
	b=zvNl/Au0yC2hzYOnuEQH1Se+AU8cQolOMe8nNlLdPijdm3XXzufOxncb8sWvZJAFnzHU
	 0hli0XIjn0+aREhFOIISu/HWykiTEp4nIW2TSJ0TkUKE/avpo+PXdizMjLKKWTf4PRxbf
	 lRWkcSvctXbwECKKUoaL0l8n9BVkxuu6sHscc9932UPSlqZzwIMgbsiNl6lx+OxmhHBan
	 DgbyxvLa3HrRL5f8p1ndm88eMonr8qEvxWWfGwTlADuBZfMf5tDgqu5wqHlESgJsR01gt
	 JXI8yykmlu2oUK+Ozsvu149NAoDNrCnIesiPftRXJVEjLcuk5BheXXzYuftvupwpuFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795812641;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WEKnzumtYo04cvGbgDncdKdc7JLxAhxavHDx3ZIGZr0=;
	b=WcMDmYVB0FEd9Cw3UniFq/QG1smXZayHpgZifSYOMqQUsPZkGhqJJUiPLV1EZOVhLJga
	 7IQRb52TSgCSE75JylIiqh3XQrLoQDoKAQux4zCqYAP4NhPsy3rHRmbQciuofnYZ47MlQ
	 EZ5+b5ZNK1IszgGfqJtOC9PkZj1l98W8ZqhkrauaPbN0NPuf4wlKulOYEqDxi/65Dvac3
	 CoBm3BhKPnACXokZl4Lfy9nqJdrGWCWKYM9ogBcKiqwpBTpzi7upLDdDM1mtRlsh16Q8g
	 h3uMKTe+B2C7M7xJ1Sc8BT9xFXKW/bMICdJf4zziUtGtdgCLcMs91/PKD5VoxR+IMtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8SeFiqh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF06E606A33C;
	Fri, 27 Nov 2026 20:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8SeFiqh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795812640;
	b=ZyIU4DLQu3Hu+pzs2x7yASrw3MNFl7cvM3mCimQiosOkZXrV6tX8TvxhNMTo06Khjesm
	 QLX9iyVU0yI2hNHQEBsb/9DUraUVWcGZ0OVXCzCsGJbSsJLKOsv+y/8ES2um22+HhLTNz
	 PS1Z5oWHR9CRUwAIThk7K6t6qF6hdvPB3WQeo9nv+Pc5AVrBpHjKEKBL44nafks/JrOed
	 va+edFGUB41Mf5muGgMntJBjSTuZFevCAIhbDDFk/OQQoMZoH+TQT494UMFYQzWf/naff
	 JBR5mEXzomzSaW6ow7uHgTaHcj6rGBrRJOefJdh8Md1O3nb5XMBapuh339zmzKlK4PA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795812640;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WEKnzumtYo04cvGbgDncdKdc7JLxAhxavHDx3ZIGZr0=;
	b=tH6uH+jYfWveZ35WKM2tgAdhpynmroNH59Di4vpSM9cTbsiN8GmYsSHAlsz5CKHh0CMc
	 kfvZ4OrRD0DevwceIirrSRGXOLtNOMriGnxjEULS9QtJIrs3Mb6dbt8+Q0nA8lJ6cn1gj
	 Q5SGUdSeNdDVY0C8ay1iRNH6ET7vriBpi04xZvPxq0gZt6wQGnTXql8eXOExfBJBYzAQy
	 e6ENec0DndM3IkWQb+Hk9N8F2G0sWBxwoJIGuwH9+Pj+flnixXq3LUMUpozQbJLXO064L
	 mzP5LA1PL+Xc9KKPbTPoArojcxjcDh6Cq0cDYvFUU4tpNXH3/qehtReV5dFARpxNALA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2D6D1F00893;
	Fri, 27 Nov 2026 20:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795812640;
	bh=WEKnzumtYo04cvGbgDncdKdc7JLxAhxavHDx3ZIGZr0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=W8SeFiqhK95NTj+ZZO4W/fmBBcBUbjc5oyrR872mFphIiMXEeekJmbtwXapT2Cb/R
	 Hd1FA0iL5taYv/JBraf9zKJsJ8XvdyuKBHR7s9yfGKRKw/lLtC1NUy1DQIG3An+tiP
	 VBu5xZ+7H5YG1XL4Lea7ZVT3WeXtJxZ0Z5P4bsZq4QzmrO1K1W59lbvQGLQnZ+/InK
	 QYOQe+99Z3DXea0fHaYhm71QUbyireTBP1DYB577w28TUA+rMhwGcOc+ClQzrDzEYM
	 1iLn1pmT1YDPQ7fYHUEJ5QxLklxrLGpe8iMY5u8VwQafwreqc/MSM46p4dfV0T5uet
	 ur7aJXr8b9m0Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 308DF4DDDB;
	Fri, 27 Nov 2026 20:50:27 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 23:50:27 +0300
Subject: [PATCH v5 2/6] dt-bindings: pinctrl: Add Cortina Systems CS7542
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
Message-Id: <20261127-cs7542-syscon-v5-2-d5a373c72b05@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795812625; l=3414;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=4SmqTZPlqAgFVIq+JWqSvla2ObmS2GTH6QCrvyQxTMA=;
 b=EYZjkK4pe6Z9/SU5kGSbilO0zhNMdAudyLNDSLoKD0Uv4GM5GbYsMMM4FoyysFxmGZ4K89p4U
 1+VRTrseldACC1g0wF0eLDA33G/35rIBxAUIFpxDZcosapDyvx+hsf2
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the GPIO and UART mux functions and reference the child
schema from the global control block.

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
index 59bd1cfe3..384c0eac2 100644
--- a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
@@ -39,6 +39,10 @@ properties:
   "#reset-cells":
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


