Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612126;
	b=UZJjqrFkhyImm6Uqv4e9CqUxtcl5ykvMf4/BCX5H7GhwcpfuRe64BPN3yUKeNPHKor87
	 4buRGAq7z2EMiwmImyQGsii9DLzhhYCnjvFIMZIrXc4xusvp/AMaBoDvD9a4iB0x6SamF
	 OhXvbRhCT0jhi0g0g3X0FfULvMsDMNHeHYLg4bNq4WmKo1Y8A1HYZ2f6uNawXgQ3d9PRy
	 8KsPZP+S24haUAm9flE1lKYABNpTf63b1VWf9apz/Q0FY6NXP1Hbt2tF4FZ/cvtcr+5bP
	 oQ5mlSh0o4bGsl05XWFRZjtVwFKe+d5Ug2lqne4zfuqsgdMBmLnchfTnjOnWB8XbjJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612126;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=lgWei9mlfm0zvpgdvMokrLkEQvNOUXgf0+U1xlbb5Hw=;
	b=PInJ18ToQgnHLSuH2dsMfbtE5NgMS07UYj7Zo4C57LegK5TiIq1nH+MmKhoe9jpb3GPa
	 VKA6XLgNg1N8u1evJEreS9xZvBw6BLBKxYtERGYNv7bx569WaqGriJjbVteMBV3Beu+r5
	 Lel0VMw2gkieZbxZUSePAdUM/R6KGbPng0birzO+u3ZMta9ct6cZ7mLjsNRM2ohtFwde0
	 86sj+XHp5FjScrNlX7KUXPJqGG2r9h02AsSDehvhqwsg2pYGByBUXjRj/GS4FkXsFq9HF
	 50yvZeZnOt1HnCPLS0auJXT95AkHnBob2XXVWS+LqHA0jpaA7TOdi6NVgdJS+Ck95SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3AE606A31E;
	Wed, 21 Oct 2026 19:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC3AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.1.1] (unknown [223.166.93.48])
	by APP-03 (Coremail) with SMTP id rQCowAB3gT_6Ftlqxu5hCw--.4480S15;
	Thu, 22 Oct 2026 03:48:25 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 22 Oct 2026 03:48:21 +0800
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
Message-Id: <20261022-a210-init-v1-13-09fb4d99da65@iscas.ac.cn>
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
X-CM-TRANSID:rQCowAB3gT_6Ftlqxu5hCw--.4480S15
X-Coremail-Antispam: 1UD129KBjvAXoWfGw1DZrW3Gry7uF4rCFy3urg_yoW8JF48Zo
	WayrZ5Zw18Ka48Aas7AFWfGw1rG3s7Wa1agw4qy34fJw4YgrWrJryrt3W5Xr1aqry0yr1v
	y3409a9rKa1Iyr1kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUO-7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
	j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r126s0DM28Irc
	Ia0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l
	84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJV
	WxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWx
	Jr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxV
	A2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_
	Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JbIYCTnIWIevJa73UjIFyTuYvjTR_nYFDUUUU
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBggHDGrYxtWX3wAAss

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

