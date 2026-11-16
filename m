Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802186;
	b=BuLFZOjl7YTa73yqkBHCcSqVyxl0kk6kUegVQuyjVddcRsTocs1XUnjXIgaBykq13Cgl
	 q4nLD78VZFOMX4fvRql17BogRO/1zpjJTnV9bLToFqVeQWhILCbF60RIjHxRN+xAgTkbX
	 fbq52Xg74D8wgQQrX7K1fMLSe3MJYlWTE9LgAKD1KidI0rTcSYKu04lwl/BZ1v2aEn8v2
	 vKTAtDFcgo1umwhfY+vqmzmMTB6rypLUQ+aFOHD5bFMZ+4znS7fwUgCvF6hHMZpaOAt6t
	 RRWK/MTI3BOsL7P5YaRw/0oOFJSFjtd8SXBggpJ6JgLO+xPYOZHmUCUmviwg19wcSwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802186;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=9laODPVsYIvfRtRp3n9an29q85ZUKSux2XuPz+/hiII=;
	b=LmDiv7N6pvhsJBHaVbu4tW8oRObmuDADRua6j5iFF2+GOx+qWScDnl7YtldcLDLseisb
	 7QaaKtPrVK3yAqsHjVg2Snlm8CpJfODbMftVd0cOED8Tu8VpE4LGzuVaewvvh8lq/1mWm
	 M8lfU6cO8eG3l1bU57ATQjj/rJrtw6FSkSA1vE94pGKg7qKFq9uQ2TQCHmh31uuHY2F9y
	 uTD9Y/QS/8PPCGQm+G5wmBL/XyDL8oizVU09QyVoa7XGrLtHlaMtIpOhVhpsQxiX59Dub
	 bhiA7EWXJrXJKA013HBx6QNzuKtJ3N6iOASxtVR25o8k8NgeySRF1x2g+G7rYdwXXZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C179606A329;
	Mon, 16 Nov 2026 04:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C179606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AG49WK7084335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Nov 2026 12:09:32 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 16 Nov
 2026 12:09:32 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Nov
 2026 12:09:32 +0800
From: CL Wang <cl634@andestech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: CL Wang <cl634@andestech.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tim609@andestech.com>
Subject: [PATCH 1/3] dt-bindings: gpio: Add support for ATCGPIO100 GPIO controller
Date: Mon, 16 Nov 2026 12:09:12 +0800
Message-ID: <20261116040914.368298-2-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116040914.368298-1-cl634@andestech.com>
References: <20261116040914.368298-1-cl634@andestech.com>
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
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AG49WK7084335

Document devicetree bindings for the Andes ATCGPIO100 GPIO controller.

ATCGPIO100 is the name of the IP, which is integrated in the Andes AE350
platform and in SoCs such as Qilai. As in the ATCSPI200 SPI controller
binding, the compatibles follow the platform and SoC rather than the IP
name: andestech,ae350-gpio is the fallback, and an SoC that integrates
the IP adds its own compatible, such as andestech,qilai-gpio, in front
of it. Drivers can then match on the fallback and still add SoC-specific
handling later.

The controller has up to 32 lines, and ngpios gives the number of lines
implemented. The debounce logic can run from either of two clocks: pclk,
the APB bus clock, which is required, or extclk, an optional external
clock that allows longer debounce periods. The interrupt is optional, as
the controller also works as a plain GPIO controller without it.

Signed-off-by: CL Wang <cl634@andestech.com>
---
 .../bindings/gpio/andestech,ae350-gpio.yaml   | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/andestech,ae350-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/andestech,ae350-gpio.yaml b/Documentation/devicetree/bindings/gpio/andestech,ae350-gpio.yaml
new file mode 100644
index 000000000000..01badd2a1342
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/andestech,ae350-gpio.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/andestech,ae350-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Andes ATCGPIO100 GPIO controller on AE350 platform
+
+maintainers:
+  - CL Wang <cl634@andestech.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - andestech,qilai-gpio
+          - const: andestech,ae350-gpio
+      - const: andestech,ae350-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
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
+  gpio-line-names:
+    minItems: 1
+    maxItems: 32
+
+  clocks:
+    minItems: 1
+    items:
+      - description: APB bus clock
+      - description: External clock for debounce
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: pclk
+      - const: extclk
+
+patternProperties:
+  "^.+-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gpio@f0700000 {
+        compatible = "andestech,ae350-gpio";
+        reg = <0xf0700000 0x100>;
+        interrupts = <7 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-parent = <&plic>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <32>;
+        clocks = <&pclk>, <&extclk>;
+        clock-names = "pclk", "extclk";
+    };
-- 
2.34.1

