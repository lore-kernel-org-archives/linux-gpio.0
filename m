Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612126;
	b=hsjxsTKxd7DS3a1QLEbd3PHYAt9rGh11hvF9Xl45RpD2qqSQ9E4yo2ljfHjtflXCc3ya
	 yWvu5mPYClDzWo3TMy3RVMAC+7LsxGy0hFTfJ5bUQsOxXvKf2AAYsq/djc/ErMTECGS8P
	 8ErpRRVcQPIg4zHRn/B8Xaa1x92yrXNcvC62ibleCsl8UhxPy5FPhBOT90aJwKhU/gxV9
	 XfBJSd4cFwF4cViL/z1DmKCRQpcDWFxaQrZMtRG0cktA3qbWPzwvbWp9Yv/LGg2hs+Y8U
	 O6iJy7WxEkYf+UF2NnK9DvJaFWOlkU0TDW7aJc6dE4O+Yv+nxyIoaPpMDf0hlzklVuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612126;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=q/P/8wd7aMdm6RMiCXt6tRksofYG+2opW1qNdw3VqHg=;
	b=11uYwKJM/EDzZjCS7ztiosF1fl0JpaPwgaa0lMXE9ho/xO5g+YRq+gVeWMJDp+HD6GgU
	 p1bfYY66qTE6IgXe/kci0KQekSvYrgsQrFIp+g7ojexbUuS+erN5EUQ1aUzoZCZXIaocw
	 4kiHKbdLO/P52gFbImiIOu2PwDtgixjKukduS+BLp1yRh/kCeis4en+O+0Yf+zl25rQb/
	 NIGGE7koAOdEXuQgYgJdRGJkAXoEk2i6jUxNQHjext4+gDPS5zcs//HRh308xIk50Sxvz
	 +YA0VSn72ZC4WK9g/Bl4nSBbh93BrSVDW2zrSWkMFRutTtm9PH66ZL1EOpVaivc646g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A93D606A325;
	Wed, 21 Oct 2026 19:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A93D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.1.1] (unknown [223.166.93.48])
	by APP-03 (Coremail) with SMTP id rQCowAB3gT_6Ftlqxu5hCw--.4480S6;
	Thu, 22 Oct 2026 03:48:16 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 22 Oct 2026 03:48:12 +0800
Subject: [PATCH 04/18] dt-bindings: clock: add Zhihe A210 AON clock
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
Message-Id: <20261022-a210-init-v1-4-09fb4d99da65@iscas.ac.cn>
References: <20261022-a210-init-v1-0-09fb4d99da65@iscas.ac.cn>
In-Reply-To: <20261022-a210-init-v1-0-09fb4d99da65@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-CM-TRANSID:rQCowAB3gT_6Ftlqxu5hCw--.4480S6
X-Coremail-Antispam: 1UD129KBjvJXoW7tF1DAFWrCr13ZFWrAr1UWrg_yoW5Jr4kpF
	n3CF13tr4IvF4Iqa1FkF4xJFn3Za18CF1ag39ruryjvF98X3W0yF42kry5Za47Grs2ka9r
	uaykWa1ktw1xu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUml14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4U
	JVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxV
	A2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JbIYCTnIWIevJa73UjIFyTuYvjTR_nYFDUUUU
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAQHDGrYyXeSswAAsu

Add bindings for the A210 AON clock controller, including input clocks,
the system clock and I2C1 gates.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 .../bindings/clock/zhihe,a210-aon-clk.yaml         | 58 ++++++++++++++++++++++
 include/dt-bindings/clock/zhihe,a210-aon-clk.h     |  9 ++++
 2 files changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zhihe,a210-aon-clk.yaml b/Documentation/devicetree/bindings/clock/zhihe,a210-aon-clk.yaml
new file mode 100644
index 000000000000..bc1587e3fa81
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zhihe,a210-aon-clk.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zhihe,a210-aon-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zhihe A210 always-on peripheral clock controller
+
+maintainers:
+  - Han Gao <gaohan@iscas.ac.cn>
+
+description: |
+  The AON clock controller provides a system clock multiplexer and
+  divider, along with peripheral clock gates.
+
+properties:
+  compatible:
+    const: zhihe,a210-aon-clk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: High-speed AON reference
+      - description: External oscillator
+      - description: Internal RC oscillator
+      - description: RTC oscillator
+
+  clock-names:
+    items:
+      - const: high
+      - const: osc
+      - const: rc
+      - const: rtc
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@30844000 {
+        compatible = "zhihe,a210-aon-clk";
+        reg = <0x30844000 0x1c>;
+        #clock-cells = <1>;
+        clocks = <&aon_high>, <&osc24m>, <&rc26m>, <&rtc32k>;
+        clock-names = "high", "osc", "rc", "rtc";
+    };
+...
diff --git a/include/dt-bindings/clock/zhihe,a210-aon-clk.h b/include/dt-bindings/clock/zhihe,a210-aon-clk.h
new file mode 100644
index 000000000000..29d7e9183adf
--- /dev/null
+++ b/include/dt-bindings/clock/zhihe,a210-aon-clk.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_CLOCK_ZHIHE_A210_AON_H
+#define _DT_BINDINGS_CLOCK_ZHIHE_A210_AON_H
+
+#define A210_AON_SYS_CLK		0
+#define A210_AON_I2C1_IC_CLK	1
+#define A210_AON_I2C1_PCLK	2
+
+#endif

-- 
2.55.0

