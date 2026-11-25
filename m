Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602860;
	b=HQCUJ7WAs/cA4/5TTi9bdMCfcSJK1FZY80m5dytxXsYiRqxCR3wx8u0ISyLrnU7yd//J
	 LpqU565NHAAn2ifIkaqmbwB6szykOyq6H0YkXtXeBUeC9xD+u27DE/KCwxc3zy9xIh6db
	 SqdsB2XXPT1uDMlhYEQ9LiV+slyXi7uLW8Cw311Sx/zq71B8EWGL4ZFin2cq6x5QBI514
	 wh1ygZ0inzVkCGLARe+Ag8YapKWZYL6IZvWJX92aFvdC70mCRqRvV9clBx/CFF6SDx6b9
	 HxJzBJBx8BX+2yV4nIVv/UtIFyY8x1NIrjZPxwaAS6B0a9dqZURkrVM+pm/Ld18tCOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602860;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aCqK1uXLPdCs4Ldkr3opqdXBdv0PuoNLOgXFHdY57+E=;
	b=5pHuhh/1mxg71vEHUVmgh6fGRyMa4lojasijOoll8HpYcZ2+BnqtJdLYY0uYBhM3rT4k
	 /It9HpyOsLcUfB0t+SglD641Xp+Dps6+Uq0jhoIs5E8AwwCAlP2wMfhJd/aRLhnn/mdXD
	 tiQx3icGoVrP2MppkxjS9yopDbXowl9aiABYnJBRMqNZiKTzjuVws/8zATl/pgGMkiAQc
	 B4GtU7PjjW26DGiJgOs3HAjfQRV3c+Ej3NEbFkIHKYPZCn8lcnDJ8JkGZi5XVIr7fJIZj
	 mBB/ysE0BpavsKKpwIT6/bsQxwOya4cdq2bWWjCEpdaj0d8M3RbHxRfF9gblykB6tQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lV4i1GjC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71918606A32C;
	Wed, 25 Nov 2026 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lV4i1GjC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795602860;
	b=QmorhgdhUJq+HxjOrX6+ro6UH809pGsL934LliEJJ05rXrHleLWmvx/LbSIbU3tWivEg
	 zh+caRGnk4UgND5awqrcVkrZZatNcwhokCbLUBkxDpsOTlqexWi7Gdh0dO8Nt9ZncHHqf
	 jAjvoLlDLoW4tLx1fd1YUnbfizxKLYS5f4Nt4vAifQ2Z12xUfR2MJvjMXMYzLOcFSRIlJ
	 jyPsbgS5dyHEUHCXye76r44WQWROFF/BSCnjKd2mDTATpdYK+yYoFu5ROMT17s7aJVl2+
	 szaZfuF2NRLRZfDccBn5ue4dqlrWJ4Af1bC5mwdFHsrxMTw1cIAtLc6AE2Y/XZdXruQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795602860;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aCqK1uXLPdCs4Ldkr3opqdXBdv0PuoNLOgXFHdY57+E=;
	b=L7IV/Ke0EuSZo2TkalsM4Y7ckaFEJPYmjagrn5eu3oK5aXLTxbvC5NYveiNzWZzuKpth
	 hHygkG60pps9YcwqV918hkKGzMWGYyYkETLzDxgigk1qf5PWleOPV7pOksAqv+HhhW+XD
	 g59SSAXBAz/Ygf89j1FZnjW+6rfiz4qhRE5C7fsajBM38LpSmSP1EXzTj5LI9p42rSzvn
	 Nm8HGap4Fr90SB/J7R/ZRSw5TtSenddZ5vtKi87o07goxC2IflC73MCDI4Mykfcmq8Mu7
	 VuESHvAzCNpL/ptOmqDUW1XByENpeTEP2QgtdjgU1h7LFOPud4PjSOWRb9WhvWIIL1Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47D9F1F008B2;
	Wed, 25 Nov 2026 10:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602860;
	bh=aCqK1uXLPdCs4Ldkr3opqdXBdv0PuoNLOgXFHdY57+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lV4i1GjCT7MVEeZP9EKvEKwENMcSxmXaxIL7oX6NTKHU7JPBaNW+rarO5wnZWTBOb
	 lGGBXbqLsSIkjqP5dClO8OqRsok18vrI5f842QQVPq3Z6QKj7ksdau5a+tPeoX7Ss+
	 FW1jXDhZxBBrfAH4szLYxNXHXW25tuxMgqU89kJulTCcr99ucB88uosUN64i8jU52r
	 2t19TZu7Q8GHxHwFI9jSQe1mX6/0QK36PZvxc0tFjmeQv+y31ZgB8plKZ+XjyFKVGs
	 8YLs8VManh7WD9jg17w7+TDafGg1GJCBFSdQT8o2mat1kBMsLZAT8ycq6h8R7qtg4S
	 x+BiNOWXh6C4w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C6F404CE50;
	Wed, 25 Nov 2026 10:34:09 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 13:34:10 +0300
Subject: [PATCH v4 2/6] dt-bindings: pinctrl: Add Cortina Systems CS7542
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
Message-Id: <20261125-cs7542-syscon-v4-2-3337bb0d3b48@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795602848; l=3414;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=GXF3eV4Di05M7txSyaOSbXKuZUwi57EYWkuShSLxJwk=;
 b=pAWFBWv4AImGwJ4AUClltaW/LmOcv8n8fPdvAKH7T07b5F02HYkqOM/eiyHX/CqsaatHb/T20
 OjpwlcGQkgkDrmSTRi0HIPBha1tVzOsQn52mVBb7r9Pu1sFeaIqQU4z
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
index 561bb7b63..fe839e46e 100644
--- a/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/cortina/cortina,cs7542-syscon.yaml
@@ -38,6 +38,10 @@ properties:
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


