Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795397862;
	b=o1gu2/30rdWFMWXPqAbOfv48RXrJkD+VSte/1VQbqATtOks2s6m7j9b1sg2AYGkPz2WL
	 QkdALRAbQ2mc+BYJZXrKHjMRb3WXxCN8W3GIA3qhNZb+IEUAR8AtlaglfaLfMN40UOOhf
	 pmrEtcV9yACay+bt2szPT41ZPW4d/v6Dt/6FP7Ovls0FNEchgRPMR6jOg26WESRhQiGn/
	 a/z0Yrdjf7gCqRJ5a6Y66dT8gj1PJR0XymYAr38/2V7x/8DGUuas2baH5ICmB/cK4PAUz
	 omTSi898w5YtceAQgx9seH/qoRLG/NNlyStSZ/fYVHIZc1krcmLMbdruEpPjxxepmSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397862;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=DIPbYMA2i6cUO+5mLT18pv+CxoGjAfoAQFU79AD8q4o=;
	b=B+YJugsF02rbwaR39N8mWBsl0OtJstp4Nw3ULeFBjrWge7P4nHudnHIev7wV2RqTP6IY
	 FUJY1ytJBci5RQ2RgB7hlgtgkAsPZIhNFYubYwndRPO66rIRUt1+NPyWbuji+hB+URg7d
	 zpqTKpfWh4nv9iiJQ1S2fm4lcEWzFETCQltsba4fxx2kbNft8g01lVktTm4IkiNtEr0sh
	 1kzVhv5700kWXWn/iysc7Ef2uYFGB8IGgfBnr/vyi7RxLLlqo5AfQ57nuevXalCART27b
	 vEtMBLAqxJdkd+BeQJv35dN4T6sw5rUC6u6gtzHEFKUZNe8KkDo9HoSWzhoSTqLncFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bcih7Vzl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA848606A31E;
	Mon, 23 Nov 2026 01:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bcih7Vzl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795397861;
	b=FGeh9BYI8UmY+U/Y5pqksMwEErS4NuOa2o9kW2EsyZBINiTBXHy3xTWPvaQnuBOPIfSZ
	 j7xrxIlrWs/BwZ+czC2VOs14nEm8UI/jETuWdwSjC8RFBN64dTPlluDOMQLfeLNyh0AGh
	 hkUWIiarMTCnxlffVzVoBnUw/VObMePVoWd2qSm35ARhS3p//zLo9TH4vVh67DG6AWpP3
	 Tw5bDnSpyJ7gTjddWkXlzuOp+uRKkn4RhqC5ndg1iPiwt5IznYhwG3yk1oftiaZhKex4W
	 Oflo+rJRl8O48eQm7e9RB/g20IdnL8b2iK57mDDJbP4GXO+Ljnh5we/LZe56HARfEVQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795397861;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=DIPbYMA2i6cUO+5mLT18pv+CxoGjAfoAQFU79AD8q4o=;
	b=XQuM8SvaW1Pq2/6fl4XapQwfgGRPHWn2mGYTTj/2uBQBTdoEgJDY8I/iIxlTps1FW10d
	 GzSQsloK68LcM6SmiTExksk/OtVniADw19YNQRxigL8yKUgbi/Fwyr0LOnle90Pptl++s
	 2hXY8LNkMDzy8KzfAj3csKIZY6/27iih4TONH505A63UfWZQaOaRTDBmly8Nhus2EeiaI
	 wslY5oPZsUinY0eUQuRx7l/SK2XtKygygjQqkbyG3QvHZhgdKNeq+2kwuilAtBvpGPVP+
	 yAjOCcHLquuWOxGCAmto6qQIgMiifK/6l7HY2voo0PMPxZ3X0X42am/g+Z6hOy+gCtw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 713CA1F000CF;
	Mon, 23 Nov 2026 01:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795397861;
	bh=DIPbYMA2i6cUO+5mLT18pv+CxoGjAfoAQFU79AD8q4o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bcih7VzlDmYbrGmChFV0RCD6+s2D+SP4r+6Hnmr7YLpMiaQADjkNCEzu7gm7gh1FY
	 V8KvWlGuUuz8tfAsaBgn8Zp2kMhRC8tFR0aKmx3rPDSzZq433MHzcn9VmDW39PvHUi
	 lvYfeQrFv1kiVge4+CrHXpBy2QaEaWsS/Ew6kguntWZEWe9D/V5ez7fUbopB5gsUap
	 k4cvqoDemJyEtEk9/PGjavzU6SNNUFVW3rtja2mn31P0V1nwsUFMkvHOVK0rmkQc05
	 cUWbKjxnOtjuMngSWO9KE6scVWvLyZUoY0Uuq+wsFx1C+MN5jjuqZJXXEAtbNeyQ35
	 3gZxqeyC30ubQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EA9CC4C2C4;
	Mon, 23 Nov 2026 01:37:27 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Sun, 22 Nov 2026 20:37:18 -0500
Subject: [PATCH v3 1/2] dt-bindings: gpio: Add Siflower SF19A2890 GPIO
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
Message-Id: <20261122-sf19a2890-gpio-v3-1-3a4857ebc84a@telaak.dev>
References: <20261122-sf19a2890-gpio-v3-0-3a4857ebc84a@telaak.dev>
In-Reply-To: <20261122-sf19a2890-gpio-v3-0-3a4857ebc84a@telaak.dev>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, Qingfang Deng <dqfext@gmail.com>, 
 Michael Walle <mwalle@kernel.org>, linux-mips@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795397847; l=3455;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=pVI8ZFvssbvuyI5yjpcZjMZpO8VtPQcany4H5g/wKlU=;
 b=sNLLVJz+S6fJypz872MCOZ5yHe66GCSDKIRy5JGgFI6eeiSfeh/F1BY69BP1qmb6Gb7zjH6Yv
 LthL2j7saW8D6naax9t1wU5lM0v3E/UUhT+7pBgSZeTzzKv0cIK9qR4
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

From: Chuanhong Guo <gch981213@gmail.com>

Document the GPIO controller of the Siflower SF19A2890. Siflower's SF21
RISC-V SoCs have the same controller, and will get compatibles of their
own with their device trees.

[Joseph Telaak:
  - take it from Chuanhong's siflower-7.1 branch
  - list myself as the binding's maintainer
  - use GPL-2.0-only instead of the deprecated GPL-2.0 SPDX
    identifier
  - indent the example by four spaces
  - drop the ngpios property, which the compatible implies, take
    exactly four interrupts, and order the properties as in required
  - commit message and subject]

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../bindings/gpio/siflower,sf19a2890-gpio.yaml     | 76 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml b/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml
new file mode 100644
index 000000000000..830a049ae4f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml
@@ -0,0 +1,76 @@
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
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: One interrupt per group of 16 GPIOs.
+    maxItems: 4
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+  - interrupt-controller
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
+        gpio-ranges = <&pinctrl 0 0 49>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b5a6dc379c09..4193b433c915 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25706,6 +25706,12 @@ N:	sifive
 K:	fu[57]40
 K:	[^@]sifive
 
+SIFLOWER GPIO DRIVER
+M:	Joseph Telaak <joseph@telaak.dev>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml
+
 SILEAD TOUCHSCREEN DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org

-- 
Git-155)


