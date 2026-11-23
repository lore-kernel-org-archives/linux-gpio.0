Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795465631;
	b=VjeQPm7EEXqUAclSB81nH1C2HW+B6Aqn8xOl8t20TnxG2+vC+GZNMhROI9O3Z0lnbCk7
	 RJhyE8g94bhiKnhRbovMjYLSgawG3vmtWUbbhYUelMwz3klFrElDJ9Lp0iyVrFKH9RBw2
	 +kjKuBvV5DkJnEH5piZntGCE2V/3T28kjjk5+0Ev6QLW+53WSNmKCaHCO4dmh3Yu7ZgOd
	 uurBZgn2OTbGZnRQv+wBtLfpf6f0xxo7Q/OMdGvn7nOUVn6OsLIptytEkyoOwiQDEHUfe
	 6qUR86KCCIoqpNKLwRpFK8r8bPIkOX7QmSlFTk9M2Ex06hwsyuWCI2UWGw5elv/5qnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465631;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l9bZ/Z4zkSpMsXFfmdertwdtzZqERHTevFQJLNpFelA=;
	b=Bv5DJkDa/Llhreu1EhhJ4263CRE6lv6ORlZBZZh+bpcmyq8n/qZcsgOUyf71RcrIdiQr
	 fpqnCpjFfJZrSrbQEsDsmOerLcSLjd66MOCtE0MG+xfdqgDHeabUzX8MdMVK+Bae+WcNH
	 GQZxu/5m2usJz6phAOWDkYqEtb8DE/daYMTvx38pdTkuKKYHx27he7xpZtNe1Z5rvl843
	 3jgNLC/+VcOBelqvz6ujDNf9bTKQhwi4AqGp7PBWJoOBU+0B6Ef7qeuSNnEddQSohuhtu
	 RvCFP5ch2QoafOCVZelgInyiFime/gpiolAPPMj7E3NY3SIcQo1UVhpKwtsuE0Y8gJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZxxa04A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0E0606A69D;
	Mon, 23 Nov 2026 20:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZxxa04A
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465631;
	b=ocUAre5jzjdFwaZ3XsZ1cGNxt/mhsn2oNzUixHR1eEfjSoqzz3DmRzqGbs6Xfm46P/2o
	 QVUNWIBwCf6mMeewPYPy/YnWSO6fJMbe1iJwC20CKZLqPIkAX0GQAcWfAK7sI71kz7A+7
	 PMZctTjS9pjAIL9POFxf8OBxorpgrs5+qcOD5JkFz3cxC4tZeNHgeH9IcT4S9qm+qjnoQ
	 UDwAgS0dHULEVU/mtxthg/zthBEaDL8ZoZCzKLRpsNxe24bq5gY4582bfGqZeIVXurrb1
	 LBT4H1XmLJ+OITTNtOwRxs31gRDveo/WSfHTSGa1DEKGgO6nzbYVNbLlqo9p5qqKnVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465631;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l9bZ/Z4zkSpMsXFfmdertwdtzZqERHTevFQJLNpFelA=;
	b=m2GlYTHjvOmipwh+kv31HLn6CoIRhotHcWdYhElbXBKU1+M4U8qC4tpDxtnfTiIGHqzQ
	 17mvrtPx4kR6R0nS743zfyp61MZIp8CN8P3VcndLGWiLfHPSUpSWWlZKP1NKoGGSi07/C
	 TjppSiJDjfiQjQmp/UXtFoRCkmX5uz6GXj/C2w+QUpzETlB1R6QksRwCdzg2f1AoE0ocW
	 y/HPfwMJyiEGwBetZJnZgRAAdrLEwLIwraNE0GseXeovR3kv0hLqU1cnxKcr0e/+tX5zl
	 wfg7xvTK9q9wAoL238eVb6M5LhliUL/UVTNFjV3u7dza02jnq9xAvJifbKF+Y2YKAlQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7E741F000CA;
	Mon, 23 Nov 2026 20:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465631;
	bh=l9bZ/Z4zkSpMsXFfmdertwdtzZqERHTevFQJLNpFelA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FZxxa04AzGuPYnQr2KskeCSG0MJQ0sk3iKKrqUNDBfN536EEJ1Nmd3Dl1kAWS4P8P
	 mdw2OsFEVxFKXa7l9cspr61digUMG1XCnprOgN3lTGjh6wFi5iDmjbS3vnU5kWXkOk
	 U3zeE+yw/zbzgIjbjopqo82rtsCVxpl3oZjRptqkq+6C0EpemFr9REDAfQ9QeSUC3P
	 2uxH4YXp2rxwSFER85fe4p/i/NuztU97uvzID2iRCXA35LWONgv+Gq/Gzk70/wCRpA
	 2vO2OFNWzvfmIrUH5KzhdwguAWoqZMKqCm5BY0MRXTQFrTthaGC5ME1wLrfOBy9XJP
	 RTGr+kgKq4+eg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 55A2A4C6D1;
	Mon, 23 Nov 2026 20:26:58 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:26:56 +0300
Subject: [PATCH v2 2/5] dt-bindings: pinctrl: Add Cortina Systems CS7542
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
Message-Id: <20261123-cs7542-syscon-v2-2-1cd74b2522f9@gmail.com>
References: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465614; l=3060;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=F7pjXfN4EBv+S1ypEhkh5BVaKDFizMnbeKv3RXHbfp0=;
 b=1TGJ7kWa2uzt9MgqQ3tCTh3ok8nem6Xw/M61pN6pH/tv9BLuaqQS0yQtb0leMtlPDsi2KgvMP
 7z0anRIgcsRBhtVMIDiXzg/2XN0DcBt3M9dKI+8+Qh02jDtIXHZ2MqQ
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
 1 file changed, 84 insertions(+)

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

-- 
2.53.0


