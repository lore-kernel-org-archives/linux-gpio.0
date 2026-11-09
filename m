Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254990;
	b=Oqj+V+ZQ3UsfYFA+X294Bcc8YeJ6mg+WWV/Za9I7MDHwL3bW4/nufqdOBDe8tsFeqMlL
	 WV9roj2+Cf1IYyMzpt+ZZ70yv0w+x474jKonKIYcwLYWI9z0Kfiw5PW0Dyme7JUWRQ2EB
	 sSZfR4R9Uyv+yfoR1yeE+vU1EoewarpLZvV/UkQqd8B9qlQigxxwMho2RVMm4wiwYt3dr
	 30eKcdaU8PdWE36ep5MF3EDovFbsL5jS7f4ag+TNpMwHkhshWHPmwKETI2nO1Zb//ivGr
	 PW/Z8YZFxmVpPfAUXDPaz0qZv0AiRvxoQPxHLsO91V3Koi5sTY/XtFc7MaHdLQ+XItw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254990;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=/8asDfPuN9E/dFme34IYbG5Lj3axm/bwNBj55SvVdks=;
	b=IGCD6wMvn0W5pqRW3fAUgMXVZ1dB5I/N3Y1HhJ/RwvHuYR/kqVtIKBnX/CdNCLliISNR
	 JIu0YYfQhhQAhBlOcAoJIXyHFf2ieV6coZWH2Pxj7kgO7c1OEVdMB2v0Jl+mqyEboszmr
	 bMyBNOtwspGB1seZEj7AHqzDQd4wU7HNL0UXon06OGoSupameViOIvclmbn5IgAq8w0Qs
	 8dtoQK/2+bKc1Hd9LyQJvaNJPqcoVVPOJgbCZTne9DjI/SJvOwNzJDBJgckvHLluiglWt
	 aRufsTSJ5MUoQi2/DLGNTT61647Z273vlFFq6DdP/eaPAcHEAkMXx/JLAZBuu09fEhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="M/EDtdXD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54632606A337;
	Mon,  9 Nov 2026 20:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M/EDtdXD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794254989;
	b=KYXk0HL3R7n0LpnjUsRxj8+TJev1zmAPK0j+ZiFOpYBzm2sbPbkLZEiFWzct2pmZc1ff
	 PlvWWqqz53gOHCMun9Y0yNpRUl6jSEYEhylXRQ2Z2fLKgvyKp5nXUWyVrDJrYeUuARQFJ
	 dfaNYcqyr7k9gPBXE68zZwO8CH0/5qyULZvxy83F2yuCzY5wAhjNZSDTtUnrisg2I4KTc
	 kBVh3WqpXPQEwStT0DZTlIL3Cn4oTaU9uzlFq6fm+Uo0qE/viVUiY6mynzk6gxkyrY2dp
	 LT0QInWXg3tM3SPuRXe6+QFya2jlKBJp/39k8+9oorPz2e1rcuJFV5nqT0jBj3c5MXw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794254989;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=/8asDfPuN9E/dFme34IYbG5Lj3axm/bwNBj55SvVdks=;
	b=M70YBXpPFaBDDcihPnl6tbAMxmn3DKaV1YyQWnCZcJVVGZCc9KwUoZQJeUlFE1PX8v12
	 b3xL6fWdhbwbxflsLQO/5It6Ppv88Ll0Bdd3EAkTOm9pFyBSr8Shb4WpRAoby42xFeyCL
	 XYtJcWNxaInzTJizZjkXn6zrzLpYSrgKm7pLtqOIgxzR8hwZn5J7Ws7PDlrrqrYE22Pq7
	 /NUOkQcAkH8dE1kk36/Vgd21w1rWIdoS9Sjq2r+SMllmEZRquj6T4cIwNPKlF2mT5ZFoX
	 lTz+K+EaiAElkgZSSaXFFzk1wZICnOdUhOSvRgMJxMqhhBvuvASwOXQ23Dbs5FHDxgQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32E511F008A2;
	Mon,  9 Nov 2026 20:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254989;
	bh=/8asDfPuN9E/dFme34IYbG5Lj3axm/bwNBj55SvVdks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=M/EDtdXDqhfFgq0pdWcRjU5Tr9Y0hlX8Bd4r/u0iHDbQ56PfkmVkhkv1SoZF4lBc/
	 v6A8a8Hn3rsibI+S/BGjN/porTH5zLnov8G9e9Nib+hCafgW0g6FHtdqXsdLKH1SQI
	 kTDLRRLTxRnlfTAiEZyj+bNOgcFxc+YsBxWxKon/qrdTM0G7bKvzz4TgxvWuckcuzt
	 W5Di3vu1ZrcnNCijzwNLCAVDHn5AwMreYKwC2nHbKAazVZqW3fxcEAeDMX4oWBYThB
	 VnC6c1QODxj20hFD0MdYRPIbb2g58V0y+wQGCoStY7/NZFI/I1VCq1q4M5PCFfQ05h
	 2kFN6sTH3+OPQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B05AE48639;
	Mon,  9 Nov 2026 20:09:48 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 09 Nov 2026 15:09:31 -0500
Subject: [PATCH v2 1/2] dt-bindings: gpio: Add Siflower SF19A2890 GPIO
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
Message-Id: <20261109-sf19a2890-gpio-v2-1-b885fbd84c4c@telaak.dev>
References: <20261109-sf19a2890-gpio-v2-0-b885fbd84c4c@telaak.dev>
In-Reply-To: <20261109-sf19a2890-gpio-v2-0-b885fbd84c4c@telaak.dev>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, Qingfang Deng <dqfext@gmail.com>, 
 linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794254988; l=3368;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=gBaGbabUMc2JA71WrgLEKTYUF/cvS9i4MFpvPPv2yIc=;
 b=8BufdIVM4MIYrul/uWU7+yEtqdBOSY8LbB/4Ja3VIIRcKJreWL12VNu/Zgk4sECqYwlO6pqBC
 kYUAUBVAJUwBtO5SAJNMDNElZeWAvelUeFUu51bRSCnuTtu1b/JAILR
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

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[Joseph Telaak:
  - take it from Chuanhong's siflower-7.1 branch
  - list myself as the binding's maintainer
  - use GPL-2.0-only instead of the deprecated GPL-2.0 SPDX
    identifier
  - indent the example by four spaces
  - drop the ngpios property, which the compatible implies, take
    exactly four interrupts, and order the properties as in required
  - commit message and subject]
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../bindings/gpio/siflower,sf19a2890-gpio.yaml     | 76 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml b/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml
new file mode 100644
index 000000000..830a049ae
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
index b5a6dc379..4193b433c 100644
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


