Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1757C43460
	for <linux-gpio@archiver.kernel.org>; Mon, 26 Apr 2021 09:54:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E88B61006
	for <linux-gpio@archiver.kernel.org>; Mon, 26 Apr 2021 09:54:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232890AbhDZJzS (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 26 Apr 2021 05:55:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:35128 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232547AbhDZJzN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Apr 2021 05:55:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D5B43B183;
        Mon, 26 Apr 2021 09:54:30 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] dt-bindings: gpio: Add devicetree binding for IDT 79RC32434 GPIO controller
Date:   Mon, 26 Apr 2021 11:54:26 +0200
Message-Id: <20210426095426.118356-2-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210426095426.118356-1-tsbogend@alpha.franken.de>
References: <20210426095426.118356-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add YAML devicetree binding for IDT 79RC32434 GPIO controller

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
Changes in v4:
 - renamed to idt,32434-gpio this time for real

Changes in v3:
 - renamed to idt,32434-gpio
 - drop ngpio description
 - use gpio0: gpio@50004 in example

 .../bindings/gpio/idt,32434-gpio.yaml         | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/idt,32434-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/idt,32434-gpio.yaml b/Documentation/devicetree/bindings/gpio/idt,32434-gpio.yaml
new file mode 100644
index 000000000000..517d14b6c2e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/idt,32434-gpio.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/idt,32434-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IDT 79RC32434 GPIO controller
+
+maintainers:
+  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+
+properties:
+  compatible:
+    const: idt,32434-gpio
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: gpio
+      - const: pic
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  ngpios:
+    minimum: 1
+    maximum: 32
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
+  - ngpios
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio0: gpio@50004 {
+        compatible = "idt,32434-gpio";
+        reg = <0x50004 0x10>, <0x38030 0x0c>;
+        reg-names = "gpio", "pic";
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        interrupt-parent = <&cpuintc>;
+        interrupts = <6>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        ngpios = <14>;
+    };
-- 
2.29.2

