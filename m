Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792612415;
	b=2vvGK3YzA7ar0hWbtuXId8sF+0B6Zn1b8re7rWrj6I+WgJNh28KJukCVdJO6r6PcGuw8
	 OR6tF1SN8c0UESStzTX2984igpN9S8+QjxFEul+pEQw0Ka1KMzUTtWqlSO7LN/RKjo+Wg
	 RSgjvEBCCK3xZXxTwljWpssHIELLbrl765BD2LkLNCVSA0OiKuTtODBYyYDfNqnFTp3AY
	 PJGxixW5FrzvE+1iCgdPZtdrBqPQBAfaj9g6OvA0EzACqgNqLgHf6OsDH9GwU79NAbjHk
	 VqGKH6+QzfMmvKGrqrt56XOJrDHP2UMlNqIA1o+5lm57cEWrS9nRl7OIOwfwEp86vtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612415;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=lgWei9mlfm0zvpgdvMokrLkEQvNOUXgf0+U1xlbb5Hw=;
	b=oTkJNTZkjuJbiYofaszJ4eNGaNNxoGZzgdeYCNrZKNTxp2r/85KcgNbQhyC28XEC50di
	 xDWPPhGxyzSlAcVh9DlqaviVkdzjo0eOtZez+eXsBCud216B20iqrh/7rR1o3JStNq5PM
	 rLotrEiP7qcbJWGkulbyGB7GNi6NM6T2XD7NB8f7bI2cR5yJyFNkiEvZIfobzHa1/mhsn
	 N+Yiwv0Iyot7WMncior8oE+m/AlYznsOWd75khtl37YYF25KcBPNhMjhZUHbNe4bT38M4
	 G2BX9YpAcgdj/jKDB/fmRu4kK4ESL2IEUK3ESYbY2HZlt9JJCsRPTihcF2CyMQCGcjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PyoWzorK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E6160A4AC0;
	Wed, 21 Oct 2026 19:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PyoWzorK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612414;
	b=WOK38g2T+GFQsM1RgK8QsLllZShUnoywatfcdY3Vjn4leIVrWdQN6Qekk/u1iepzY9ET
	 m3K3F1uAvo25Unu/ZtDuFnNR9A+mWe3yiMPoCiYq5TKZPeewD63lb5X2QtsBl77zU1+XT
	 rqRKrMUbSZ2nvMwHXHpZ0BqTK2gdvmHnTx6v2jEJqtHm0RuHjD8ckT1VmkB4jrb6L6ujX
	 MobyVyivbZonFUn6ySKz2jq1HiZwcP+vKNWE0GZtEohB0xeQsTjYWbHoocNxtsvUyV5Y9
	 YLFTnq2B6Zc70olh93bMD9C6z81yqueaTZcjp56DYM2J8y/NFIaHD+sdh844NkmqyHg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612414;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=lgWei9mlfm0zvpgdvMokrLkEQvNOUXgf0+U1xlbb5Hw=;
	b=smvML8n+ho4wuMyulzdHrX5fRCPuUV6NTwbgcPreUZ5TJkHhyswXRC+JV9ZTQz9CYMI3
	 ezEQfKKIqau7HKPLW7WhQO8YWEYjbpQQiSQOS+lFiJSq7r43lGKW+xU7WntYimgF6sUny
	 2JAFZdjuDUK9xM1Y1FXlNMApuyen74YCwhlmU4SRHyFdx3hWBs/oO+ih3j5Yj4/Y6jwX4
	 yZ6BMlDtENw7Jgww/ogQlohiLY5c6A7f5pV9O69710UYaOMr4DxnyYYZVLPXnHjfF/tXz
	 IJVRI+v4Kihrctu+11Q9FQXRu6D3xRG3RkAHv8oayktkaDMUkvA4b0qJjVUa+9KS8VQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4AE6A1F000D1;
	Wed, 21 Oct 2026 19:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612414;
	bh=lgWei9mlfm0zvpgdvMokrLkEQvNOUXgf0+U1xlbb5Hw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PyoWzorKKDpUz3BYD3ZB/JKN9q9mWZRlHL19tFD5fzMmxTAW2EJFZNluYL72ybTAR
	 u3x6Z472pMUw1ODNZHmcMjjhYNhRw/C4KuYjYCIeaTiANIpjmjiuwvVZciwnpwLfJT
	 AWG7il/NS97tZ/oH52WNrOE7MN1V3mHtoUneMJVF5OYNM18BIUhYGQp8NiOKQS0ZI/
	 Jf+HjokM8sM7+P2dFSOsWKIFv8YR0ItffV5WezCa0uDWciTTV7MLcBzpnwr6QlgUDZ
	 XB43o0Y0Ke/oZEUwQhITACe3KNs4v8VC0E6EVsxSXhi6HmNajdydY5Cd3/Rb56ehDS
	 9J8saD9vS2SXw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 510554345C;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:33 +0800
Subject: [PATCH 13/18] riscv: dts: zhihe: add A210 core support
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
Message-Id: <20261022-a210-init-v1-13-5e438f972d24@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=14335;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=JTsWELdNWeMheR9ro407h/KvRS5kngNhhSQpXr9Qw2c=;
 b=VN9T6sHSuG/YSgq27FVUcbCoYhzqCfaFi31HygHpoKiH0lyPk+eCP8Sa5ERHwZWlC4knZ7cCD
 r4OIGY1vTqLAfpkAjYLMCF6p3GXk7JXf5qjR0OO6MUyjRsXKdCxZOX2
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add the A210 CPU clusters, caches, interrupt controllers and control
blocks.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/zhihe/a210.dtsi | 495 ++++++++++++++++++++++++++++++++++++
 1 file changed, 495 insertions(+)

diff --git a/arch/riscv/boot/dts/zhihe/a210.dtsi b/arch/riscv/boot/dts/zhihe/a210.dtsi
new file mode 100644
index 000000000000..bbad51a3edb0
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/a210.dtsi
@@ -0,0 +1,495 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2021 Alibaba Group Holding Limited.
+ */
+
+#include <dt-bindings/clock/zhihe,a210-clk.h>
+#include <dt-bindings/clock/zhihe,a210-aon-clk.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/reset/zhihe,a210-resets.h>
+
+/ {
+	compatible = "zhihe,a210";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aon_rc: clock-aon-rc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
+
+	osc_24m: clock-osc-24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "osc-24m";
+	};
+
+	osc_32k: clock-osc-32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "osc-32k";
+	};
+
+	aon_110m: clock-osc-110m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <110000000>;
+		clock-output-names = "aon-110m";
+	};
+
+	rc_24m: clock-rc-24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "rc-24m";
+	};
+
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <24000000>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&c908_0>;
+				};
+
+				core1 {
+					cpu = <&c908_1>;
+				};
+
+				core2 {
+					cpu = <&c908_2>;
+				};
+
+				core3 {
+					cpu = <&c908_3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&c920_4>;
+				};
+
+				core1 {
+					cpu = <&c920_5>;
+				};
+
+				core2 {
+					cpu = <&c920_6>;
+				};
+
+				core3 {
+					cpu = <&c920_7>;
+				};
+			};
+		};
+
+		c0_l2_cache: l2-cache0 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <512>;
+			cache-size = <524288>;
+			cache-unified;
+		};
+
+		c1_l2_cache: l2-cache1 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <1024>;
+			cache-size = <1048576>;
+			cache-unified;
+		};
+
+		c908_0: cpu@0 {
+			device_type = "cpu";
+			compatible = "thead,c908", "riscv";
+			reg = <0>;
+			clocks = <&clk C908_CPU_TO_CDE_CLK_MUX>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <32768>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c0_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		c908_1: cpu@1 {
+			device_type = "cpu";
+			compatible = "thead,c908", "riscv";
+			reg = <1>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <32768>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c0_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		c908_2: cpu@2 {
+			device_type = "cpu";
+			compatible = "thead,c908", "riscv";
+			reg = <2>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <32768>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c0_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		c908_3: cpu@3 {
+			device_type = "cpu";
+			compatible = "thead,c908", "riscv";
+			reg = <3>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <32768>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c0_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		c920_4: cpu@4 {
+			device_type = "cpu";
+			compatible = "thead,c920", "riscv";
+			reg = <4>;
+			clocks = <&clk C920_CPU_TO_CDE_CLK_MUX>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <65536>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <512>;
+			i-cache-size = <65536>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c1_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu4_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		c920_5: cpu@5 {
+			device_type = "cpu";
+			compatible = "thead,c920", "riscv";
+			reg = <5>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <65536>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <512>;
+			i-cache-size = <65536>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c1_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu5_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		c920_6: cpu@6 {
+			device_type = "cpu";
+			compatible = "thead,c920", "riscv";
+			reg = <6>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <65536>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <512>;
+			i-cache-size = <65536>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c1_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu6_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		c920_7: cpu@7 {
+			device_type = "cpu";
+			compatible = "thead,c920", "riscv";
+			reg = <7>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <65536>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <512>;
+			i-cache-size = <65536>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c1_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu7_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		dma-noncoherent;
+		#size-cells = <2>;
+
+		clk: clock-controller@260000 {
+			compatible = "zhihe,a210-clk";
+			reg = <0x0 0x00260000 0x0 0x1000>,
+			      <0x0 0x00250000 0x0 0x1000>,
+			      <0x0 0x10141600 0x0 0x100>,
+			      <0x0 0x10141400 0x0 0x100>,
+			      <0x0 0x04810000 0x0 0x1000>,
+			      <0x0 0x05810000 0x0 0x1000>,
+			      <0x0 0x04900000 0x0 0x1000>,
+			      <0x0 0x20250000 0x0 0x1000>,
+			      <0x0 0x10140000 0x0 0xe00>;
+			reg-names = "pll-wrap", "top-crg", "cpu-ss-clk-sysreg",
+				    "cpu-ss-cpu-pll", "ddr0-sysreg",
+				    "ddr1-sysreg", "slc-dual-sysreg",
+				    "top-crg-t", "cpu-ss-ccu";
+			#clock-cells = <1>;
+			clocks = <&osc_32k>, <&osc_24m>, <&rc_24m>;
+			clock-names = "osc-32k", "osc-24m", "rc-24m";
+		};
+
+		clk_peri: clock-controller@300200 {
+			compatible = "zhihe,a210-peri-clk";
+			reg = <0x0 0x00300200 0x0 0x4>,
+			      <0x0 0x02010200 0x0 0x8>,
+			      <0x0 0x08400200 0x0 0x8>,
+			      <0x0 0x00540200 0x0 0x4>,
+			      <0x0 0x27420200 0x0 0x200>;
+			reg-names = "peri0-sysreg", "peri1-sysreg",
+				    "peri2-sysreg", "peri3-sysreg", "tee-crg";
+			#clock-cells = <1>;
+		};
+
+		peri3_padctrl: pinctrl@542000 {
+			compatible = "zhihe,a210-peri3-pinctrl";
+			reg = <0x0 0x00542000 0x0 0x1000>;
+			clocks = <&clk_peri PERI3_PAD_CTRL_PCLK_EN>;
+			clock-names = "pclk";
+
+			status = "disabled";
+		};
+
+		rst_peri1: reset-controller@2010400 {
+			compatible = "zhihe,a210-peri1-reset";
+			reg = <0x0 0x02010400 0x0 0x200>;
+			#reset-cells = <1>;
+		};
+
+		peri1_padctrl: pinctrl@2026000 {
+			compatible = "zhihe,a210-peri1-pinctrl";
+			reg = <0x0 0x02026000 0x0 0x1000>;
+			clocks = <&clk_peri PERI1_PAD_CTRL_PCLK_EN>;
+			clock-names = "pclk";
+
+			status = "disabled";
+		};
+
+		rst_peri2: reset-controller@8400400 {
+			compatible = "zhihe,a210-peri2-reset";
+			reg = <0x0 0x08400400 0x0 0x200>;
+			#reset-cells = <1>;
+		};
+
+		peri2_padctrl: pinctrl@8411000 {
+			compatible = "zhihe,a210-peri2-pinctrl";
+			reg = <0x0 0x08411000 0x0 0x1000>;
+			clocks = <&clk_peri PERI2_PAD_CTRL_PCLK_EN>;
+			clock-names = "pclk";
+
+			status = "disabled";
+		};
+
+		intc: interrupt-controller@18000000 {
+			compatible = "zhihe,a210-plic", "thead,c900-plic";
+			reg = <0x0 0x18000000 0x0 0x04000000>;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 0xffffffff>,
+					      <&cpu0_intc 9>,
+					      <&cpu1_intc 0xffffffff>,
+					      <&cpu1_intc 9>,
+					      <&cpu2_intc 0xffffffff>,
+					      <&cpu2_intc 9>,
+					      <&cpu3_intc 0xffffffff>,
+					      <&cpu3_intc 9>,
+					      <&cpu4_intc 0xffffffff>,
+					      <&cpu4_intc 9>,
+					      <&cpu5_intc 0xffffffff>,
+					      <&cpu5_intc 9>,
+					      <&cpu6_intc 0xffffffff>,
+					      <&cpu6_intc 9>,
+					      <&cpu7_intc 0xffffffff>,
+					      <&cpu7_intc 9>;
+			riscv,ndev = <351>;
+		};
+
+		clint0: clint@1c000000 {
+			compatible = "zhihe,a210-clint", "thead,c900-clint";
+			reg = <0x0 0x1c000000 0x0 0x0000d800>;
+			interrupts-extended = <&cpu0_intc 3>,
+					      <&cpu0_intc 7>,
+					      <&cpu1_intc 3>,
+					      <&cpu1_intc 7>,
+					      <&cpu2_intc 3>,
+					      <&cpu2_intc 7>,
+					      <&cpu3_intc 3>,
+					      <&cpu3_intc 7>,
+					      <&cpu4_intc 3>,
+					      <&cpu4_intc 7>,
+					      <&cpu5_intc 3>,
+					      <&cpu5_intc 7>,
+					      <&cpu6_intc 3>,
+					      <&cpu6_intc 7>,
+					      <&cpu7_intc 3>,
+					      <&cpu7_intc 7>;
+		};
+
+		clk_aon: clock-controller@30844000 {
+			compatible = "zhihe,a210-aon-clk";
+			reg = <0 0x30844000 0 0x1c>;
+			#clock-cells = <1>;
+			clocks = <&aon_110m>, <&osc_24m>, <&aon_rc>, <&osc_32k>;
+			clock-names = "high", "osc", "rc", "rtc";
+		};
+
+		aon_padctrl: pinctrl@30848000 {
+			compatible = "zhihe,a210-aon-pinctrl";
+			reg = <0x0 0x30848000 0x0 0x2000>;
+			clocks = <&clk_aon A210_AON_SYS_CLK>;
+			clock-names = "pclk";
+
+			status = "disabled";
+		};
+	};
+};

-- 
2.55.0


