Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB6B3F4829;
	Tue, 15 Sep 2026 09:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464086; cv=none; b=gYkwKSRw3qM8uFrS95d/60hp+0ARRFImFJYtewa1VPC4CCPNMMe4E0NfyQrkIm0Md18kBNlz9QEUl35++87Wp3ggc411JDKCsARALbG+QopP2jB5y9a1Yo9Wco5WZSoaE9BiKoT3TFVLTA8lJtWUvLKzq/e5Rb+H3H4v0dQHe/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464086; c=relaxed/simple;
	bh=prjZvtMShTVNlNJvc+00OIgUJQRWsNWw+sz0GtxAw8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lgd5gLYHvchtImidwsNnq2TKKxUdLlVfBFKa1+MJkcFFV/sUL0uKcG+lFtx1FtLYjqa7gQpp4PQP82pGSKyUzHF8PCye/uKwo2dPLHjw43K+7F1HqLdYyNTReVVwzGFh87oeWAyvC8i0ahMEiQ6f9WMTmIAm6dmP7ccUbgIzEWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from albans-vm.. (unknown [213.61.137.106])
	(Authenticated sender: albeu@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5364A13F861;
	Tue, 15 Sep 2026 11:21:11 +0200 (CEST)
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alban Bedel <alban.bedel@lht.dlh.de>
Subject: [PATCH 1/2] dt-bindings: gpio: Add CAT9532 GPIO
Date: Tue, 15 Sep 2026 11:20:45 +0200
Message-Id: <20260915092046.931449-2-alban.bedel@lht.dlh.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260915092046.931449-1-alban.bedel@lht.dlh.de>
References: <20260915092046.931449-1-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree binding document for CAT9532 LED dimmer as GPIO
controller.

Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
---
 .../bindings/gpio/onnn,cat9532.yaml           | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/onnn,cat9532.yaml

diff --git a/Documentation/devicetree/bindings/gpio/onnn,cat9532.yaml b/Documentation/devicetree/bindings/gpio/onnn,cat9532.yaml
new file mode 100644
index 0000000000000..6f3e3d0f4f29b
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/onnn,cat9532.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/onnn,cat9532.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: On Semiconductor CAT9532 LED dimmer as GPIO controller
+
+maintainers:
+  - Alban Bedel <alban.bedel@lht.dlh.de>
+
+properties:
+  compatible:
+    const: onnn,cat9532
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  ngpios:
+    minimum: 1
+    maximum: 16
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - ngpios
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@60 {
+            compatible = "onnn,cat9532";
+            reg = <0x60>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            ngpios = <16>;
+        };
+    };
-- 
2.39.5

