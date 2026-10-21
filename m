Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792612408;
	b=iBtdpJWXLHYXyZIY02RcfoXalwExRwnoCsoIWBiwTZGDfX7qwcsZd4l8BLj6/l0x2Fb5
	 prJMEua95dXerQIPLMYar6Oh7UEK3dCEASWWyUDV+jPSRk08FHg905aYgUDl31IN6DFKd
	 h0Ou1DvPyXtUFSfdhgukfq98i97HDf/wB/d15CHHli1ViEAqF6lf01nIi73K+rSLoXH79
	 3+qRVUZGrLV8VbR6s6PG70LQhQSNaZ2mEDE3nx+KkCOjW/FVeTx8ZgWy3ApNcBcCrR5wd
	 /9LzqboEEAa4zVu+rEEOUu4yPyj+FKOvaPA7PNyMAIqVOGci3O8gL5vpiANX3TXWcaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612408;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RzwwQpIbp0OAwDs4Pv0FKUisZKhrgfddJlf9Pk43g0c=;
	b=PUl3TvaO801ePY3lT0m8xqDF1DlnbeL33pgalo5+Cv2QHQtEDpkUyABso5N6+VmoxZtg
	 CxADnv3WWP9HQAMSfvJtghhd/uOj/HZx7n8TkXXbBJ0KzGKP19pn5gO4SUHcwz4S0qJh0
	 7bZazlTPQFB+ZMoNtAA8gsR04mWlBNAgnCrOUVUw2gb6sxtJOCdpUjNgvC8zTiS8k7tc4
	 Ywrv+LWuXfdUwPxAGWaijonZo27YG5CkB539tGYyDxQaZTsS39QhU2lTuLd024ScCT1Rr
	 tZ17TbiYAcXllVH/7Tv268k0YgfWRoaNzQ/Ggiv6tVDLK8+0ZxUSr5bvchRkln5HdMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SGAup7OW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B987B606A321;
	Wed, 21 Oct 2026 19:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SGAup7OW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612407;
	b=Qi+kUVNJYWWMLgXVLWzzYPkbcV58xeyrqWGDEpsMgKg8uD46/g+Tos3qsqObVPXmBfqZ
	 78yygiOR2CUW3Ca+/9eigc/dV/LzcC1gkRM9s4v6dZ/pcM9v5Rd4gP0FGvU6pvbHOTPD+
	 X+hWYCiscpR40+kzQXuR/EOv7qa40LXombBDm1yS7wuLwjoD9aGCId5biG5Y5sDqcbD0w
	 BGMC5x+Lqp4cf/Zurr3T7EzE/0LrhGqP5zM2C7EdIXDmZDCpylP4KObNFrMChaZGU9Pqt
	 JoXRDphtiowBqT6eSz32jhkaBKkliROM0HyBNPtncfxNnSpp8VtsA3h5i/qyqOFIJdQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612407;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RzwwQpIbp0OAwDs4Pv0FKUisZKhrgfddJlf9Pk43g0c=;
	b=0CoLlQ4gVIjFlafbAfGC3peiKfa4pgcKLxdWNkxM+EYhNbhVqZoaM4Ia3t2e0d9c6qCr
	 LuaG+pXclC36xEVll0PYsq3h91nu0PplL7hQhlWY5I7GKf25EGzurttmAp1ytjORB4Y9J
	 3ZYezMGfnKdYAVw5Sh1gFstVt26qjMJJSQ3OSF12vd4TbEXlHmUivfebJVUBsCH20QeHs
	 y/9MN4LkVBs+ZnXizZ7ot5vKaRDGLz4KSiJpOetnu4jZ6QOpbkKysv5vqog6W7FkIWBnI
	 7RL+8Dc+EYeKOR8W4Ze93BCyqZrUMiPWx27hLWaJ8+WlbN0NF7HqPxnsSzMFbIjl6Fw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7434D1F000C5;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612407;
	bh=RzwwQpIbp0OAwDs4Pv0FKUisZKhrgfddJlf9Pk43g0c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SGAup7OWOy1ark0k0tn6X2Ce2fcS9veNQK6SA7ll85ZAj6KQx+60w8eb6/mDANEUs
	 bkBQrTTGGrmyr0jXHtcataSBNUCLyWjVTW6PtSucjtwKYZvDMPqJkdNRWR2743ar5K
	 4nktTrV33ROC3F+Ms3Dv3UWMQhnm71vMFrRjiuhRj1vO2EeXfdzZAXaHdZ9l4rLaqT
	 x6fVcfVBlPivR+X5EAszGwUkI4ZNYFUgdZpZMRqs4/ppH+/uY3AEWXFK2yC0xMJeZQ
	 LwaLD/9DgZnKOIPLqMOU92TURGA9vbwFiXv8naEeNqnHfUw2MqpEF3oX0zeifBNl4F
	 xCtAZ+4TdRdCw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 03E6643437;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:24 +0800
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
Message-Id: <20261022-a210-init-v1-4-5e438f972d24@iscas.ac.cn>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
In-Reply-To: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=2509;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=+6t0kWAwiSZdwyxaiMeac4DxjPKd5CpUhqWGEpuz3PM=;
 b=ouvK5Z74x8Z1T4L8JHl1Qsx7OfQKVEiK4Jxx2iSo70XsTpMNh93ZcZcAFDX+UWJWbcvsDYeWU
 EOnc7YXUQ2gDMvH0OEqoi8aHJiSIeWKNlkX0ts+GL8fJyqSDijOWN2x
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

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


