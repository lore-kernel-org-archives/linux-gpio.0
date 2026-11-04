Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776904;
	b=uwBzibtVFcYDFuP+f8wEQTtSfkD/oOs020rzGG9K2s4fNjyzMlxukWFc+d7ZvlIjQzSu
	 Ghn+XrmgJG7kAbLW1yxu6m3fzWGHiK4XRJeWfJ3E8l56WtrvxHb1/He39JWvTh6GPZ69X
	 QD5uXOMRvtW3PcKC3de1/2fVCx1tPivJ4vWmSlqYvg2kwaeGjNT3+CdVeUIdhjCl4Wxxi
	 8qV+DxzT53uUtC2xhADG2OlTcUw2DINWr7kZZtGWuOZT/bnPSJuEoS09oMlfiu8CgNdqC
	 PVCcL7ioGBhcr2D8xqatUVe2/xfemc/PMiIYhoQ6MqxBWEc3/0n5H+PafIWni9LH93A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776904;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=b34+ShEsShkXpSwXXW7Hk4IP2Jyg4COiaFEX7DHSits=;
	b=iVzmS9bWQ+833qhFaLLfIhg4VIO5mo5DIU/x9v4B4a5jBp3M9vNhPyNW3p2oPaWifMip
	 Sq9A4ibO0V/uBStdBH4sQFCRmakpyOflu/sJUiwhto9VPbHarBvxI8QH6DCGvmuokQhwa
	 YtfWel+HsYVSMGuXVsJvznMBOB2sHLg3e10VdhtX5486mBY1cCk08vPfHhWOGsYk1NUrl
	 uIbc3VLyqPopSSg7VzvYkI6/7qHT/0nr8mz7m/qNQaafu6RKGwp/sEvpGRW2gBb3JHD6Q
	 SVq/B7CkhV+VmzQh2FYBOa4WQQISy3gBxpxQMNe2Y39V1Nko4UFKQAShIPCDA1t2ymQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jEQuK9jT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FFC606A329;
	Wed,  4 Nov 2026 07:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jEQuK9jT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776904;
	b=xlz08wnTLhQDpk9Dl0HI5bjgG2b/7gaeI92sZlU9t+scvPuStbNhANZ0XFIUc3ztiK6z
	 UBwf9EgnDAvST7OJ1WAKmQRdRZutBbDxAyjApLgk22RHfWLuGGWQD/1untOdMMR4cjljE
	 HFgwqPge6QCZios0436dDSN3P0AlIs3a5CxvzXMR1mnnRHQ9Cfw+/CCaJkCTN7eg+RO+S
	 y6MIK8KNOw9zeHPtrWoNc0K/lEyga7ACqDUeeQ+r3/J2omPwekCHBA16coA3P9PrC3lTX
	 WQ6538D6a11d7vRvuK5XzUlnmKqvQSdE1AclzT8IAICJxvKY2J3P83+EE7tf81xkD8w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776904;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=b34+ShEsShkXpSwXXW7Hk4IP2Jyg4COiaFEX7DHSits=;
	b=g67pMgASvc5+/gm8dzrasV8TcNgo8qOMsy5qhIU0VyYeNcyGoua/L3lXUVEOTeQ9RE55
	 ee0gvVmbYZCQ5hW0PMtzL5r+8pNj5MAoWOR1dnoaysNfb6AjraEWYwMJIL1k3tZMKdARA
	 3/ckA+NUhU2sJ76jRNsiDuo0EnfrrVR/HyU6dWjpTGTIDJrLz+EDNgLGxq/77s264lq9a
	 N2Y6nPlNN50uQ5TRg6Rymop6BQHNec+SBOm6OUblcCex2kNSh7Qre6bplWq3V85ik4yXS
	 nszEMxIXBeS4iQkZdenAKeVjBCM5mqRT+0GSJkBMMpgwSJkQivvrzoVz7jFoaz3RvGg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 768991F00A02;
	Wed,  4 Nov 2026 07:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776903;
	bh=b34+ShEsShkXpSwXXW7Hk4IP2Jyg4COiaFEX7DHSits=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jEQuK9jTWtymiz6VF/UY7xN99Gpv5bVEFzEv12cVHWtWG68TW2Ks+GldPkzMh45eH
	 8ZwTSJRK2VLiEiQNc4TOyydDGZTCw/eRauYSgAMcgvTAC17zKdDJK1eHm0W2VHSzBU
	 OQGA5jggCmMX6HXMMovDCLYv3Cop0kd67QDAOV5cMG0DIPbMD7O4ZAaFZXpT3+Dm9C
	 JX6XyrYF/X3mC5DM4Q0yH3wyGhd1MMKCBLzYzqW6TS7yCOt5x0Wo0Ug8K9LV/pN19u
	 sfSp8c3J54jlW6Tj6tiyOrU+1xTf/sunlu9DzlLZeW4tzKIc1D749uist5n390kAqW
	 wgt9AT6qv8duQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0CFC946D0F;
	Wed,  4 Nov 2026 07:21:43 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 04 Nov 2026 02:21:37 -0500
Subject: [PATCH 1/2] dt-bindings: gpio: Add Siflower SF19A2890 GPIO
 controller
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-sf19a2890-gpio-v1-1-45e463c48728@telaak.dev>
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
In-Reply-To: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, Qingfang Deng <dqfext@gmail.com>, 
 linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776902; l=2771;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=uSoSG67SFdVKXQExecXvufj+C6sUxYM+E633nWAqYG0=;
 b=bfAu5bt6JFuxnloUdHZ/vmb8chiKz/fFuEkW8z09xji/E5Zu8jEAqw/eKZpTlFaYpQg/cVesb
 EZgRN0aPLNqABkxUoOUXdCbwMCiALHSl3gjHLnKMFlUS+TPWDxsIZo5
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

From: Chuanhong Guo <gch981213@gmail.com>

Document the GPIO controller found on the Siflower SF19A2890 and other
Siflower MIPS and RISC-V SoCs.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[jt: from Chuanhong's siflower-7.1 branch; Joseph Telaak as the binding's
 maintainer, GPL-2.0-only for the deprecated GPL-2.0 SPDX identifier,
 example indented by four spaces, commit message, subject]
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../bindings/gpio/siflower,sf19a2890-gpio.yaml     | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml b/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml
new file mode 100644
index 000000000..6708d92fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/siflower,sf19a2890-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Siflower SF19A2890 GPIO controller
+
+maintainers:
+  - Joseph Telaak <joseph@telaak.dev>
+
+properties:
+  compatible:
+    const: siflower,sf19a2890-gpio
+
+  gpio-controller: true
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges: true
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      Interrupt mapping, one interrupt per 16 GPIOs.
+    minItems: 1
+    maxItems: 10
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  ngpios:
+    description:
+      The number of GPIOs available on the controller implementation.
+    minimum: 1
+
+required:
+  - compatible
+  - clocks
+  - gpio-controller
+  - gpio-ranges
+  - interrupt-controller
+  - interrupts
+  - ngpios
+  - reg
+  - resets
+  - "#gpio-cells"
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+
+    gpio@19d00000 {
+        compatible = "siflower,sf19a2890-gpio";
+        reg = <0x19d00000 0x100000>;
+        interrupts = <GIC_SHARED 246 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SHARED 247 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SHARED 248 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SHARED 249 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&gpioclk 0>;
+        resets = <&gpiorst 0>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <49>;
+        gpio-ranges = <&pinctrl 0 0 49>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };

-- 
Git-155)


