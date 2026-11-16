Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851348;
	b=qdvt+QICU2vheyc/C+402WYGynszq8DWaAE5olYdUVrvzNLs3hQZnJiyp0c3YWL2STxb
	 rHSQpOLWmfIlHyXoHZymGMzmuT1A0aKVjrN4FO5t6Iq5h6aGhCcLCc9JtkA7UQ8QZsLyj
	 nBEZ+Pbk1qoDNaFdNmJbgs8pw+kScRPZMpBB8Mo4tz3nWLzpT8sr4xHByLqtGpYLKVco7
	 +EP9NV7X1czmHA4tAwjywDTlixDkzpIcNUXiJKZqhSL+nB/Yx5ny9iGfvYVXVebRikqPT
	 5jtv3VZ27OiwWFxVjG9i7LxsclTNg/KG48EVcJKfJ49H2gcb163oIRNt2VK3AYwYZUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851348;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2IV0caWw5X57FnYB/7TWC5HUa1dH8csEfJ58yIfXqSw=;
	b=0/MpLf/JUenfAdSKVrdLOoxnaZwmT1r+UBnAb0by4QbHIRyk7pprDokvo46qNwXBUdUS
	 7Ql0JIs4LmqIv31NPGwrQuQOpA4PQu50LcAsSAquE+e4NdQXCSAStgqC9XNGpxk9xjX1X
	 aOfuRpE6dsJGiUyjNOch+OqAvkC1YwPcNnI3FhP0y7XIQ/nwliRuVL9VT5Sc+Xbx0v5f7
	 p+/IUKzq6d9es0dkXAfObK8LxGMgADQN4yPfRKoRAmU4C2XAPC0weNI364ye1Rpta8dT8
	 9wFr8+632vhat6I8teuDU9ji2mXXjBS7IOTf7uAtBpImSl8EX7fBeSgZE15MK3Upgsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC013606A33F;
	Mon, 16 Nov 2026 17:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC013606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:e6fc:5f71:2c1e:7d62:945f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xT0pE-004GcH-01;
	Mon, 16 Nov 2026 18:49:04 +0100
From: John Crispin <john@phrozen.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH v3 7/9] dt-bindings: mfd: airoha: add AN7589 GPIO system controller
Date: Mon, 16 Nov 2026 18:48:52 +0100
Message-Id: <20261116174854.342912-8-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116174854.342912-1-john@phrozen.org>
References: <20261116174854.342912-1-john@phrozen.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the AN7589 GPIO system controller. It is a syscon with the
pin controller as its child node. The block also holds the PWM
controller, which a later series adds as a second child.

Signed-off-by: John Crispin <john@phrozen.org>
---
Changes in v3:
- New patch, split out of the pinctrl binding (Lee, Conor).
- Name the PWM controller, the second child of the block, in the
  commit message (Conor).

 .../mfd/airoha,an7589-gpio-sysctl.yaml        | 66 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
new file mode 100644
index 000000000000..0785b61bdda3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an7589-gpio-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7589 GPIO System Controller
+
+maintainers:
+  - John Crispin <john@phrozen.org>
+
+description:
+  Airoha AN7589 SoC GPIO system controller which provides a register map
+  for controlling the GPIO and pins of the SoC.
+
+properties:
+  compatible:
+    items:
+      - const: airoha,an7589-gpio-sysctl
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/airoha,an7589-pinctrl.yaml
+    description:
+      Child node definition for AN7589 Pin controller
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    system-controller@1fbf0200 {
+      compatible = "airoha,an7589-gpio-sysctl", "syscon", "simple-mfd";
+      reg = <0x1fbf0200 0x100>;
+
+      pinctrl {
+        compatible = "airoha,an7589-pinctrl";
+        airoha,iomux = <&iomux>;
+
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        mmc-pins {
+          mux {
+            function = "emmc";
+            groups = "emmc";
+          };
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9d67ef6b4531..2041a8aed28f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22137,6 +22137,7 @@ PIN CONTROLLER - AIROHA
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
 F:	drivers/pinctrl/airoha/pinctrl-airoha.c
-- 
2.34.1

