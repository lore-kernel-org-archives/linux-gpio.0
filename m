Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792612413;
	b=fzacvUE5UYUrnBgZAg4lE9i0au1s0A968y2cqFWradLP5e36uaAmG4hqOq3v91XdYLmG
	 m5hcHUEJjvX0up3W8o+nK8aavNH+FcQgbPDMWLgb07y/iXiyFBAw/HEEExQcAuN1eNYmX
	 IIXHgeNQ4VijG8FZktSe2gH7DJW3X8pBvXIXvHXQTkT9ZSI26iuizZd77IrU3bCUOw8+I
	 5j1qOTD9zN6uUPfBpoLigziEzTxtbyOUWTNaMrl0EXDE+5hyiCRSB1X9WfVe55Txkf5Kw
	 wBgleZJXWoHEZDhXAWl030FNth8jvEDb9+qkSU4gzBNzP/ukUyv1IAhCepnlsIBCMzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612413;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=lRLxSpFiFIG0DKYTb9oc85QDwfwqhPx68qrKkjKaNRM=;
	b=gxSGwHRZ1l6bCc2rhN8R6mgYeruOcHmByiSGZGXP+0lcdJYhCqwxomgk3W4/qDTGcUmy
	 LCNZZVnuaYBqfZVSzdWtWn/fmKMwGS9Osa/yTj4rIXjUJKSP4PA3lWfmAmS8gu82HBDRn
	 RNkzNFUZsIRzTUgLfBATGzjyUqK1dEklCSpXftldfrD3tYsFzSUhYQ54XGAVpsxJ34Sfn
	 xFqH6JlXYYZRtUsv3VNBGfJXYMndaWStKdDNI0Fo7HK26jfKpLrzxorX1uawj7Psn0b2T
	 V99IbAn4nI1t+FMJ51vKS2yRjP/rUBA/3kl2JSgaidRB7notcIc2kKKmpFt4At+lSrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DSPh0OBM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EA560A262C;
	Wed, 21 Oct 2026 19:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DSPh0OBM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612413;
	b=hfeE+y09NNz3xS+92SpJUX8oeubc3rMfJOF3gvKlMHSEG4OVrV39Xcnb68z7unljh6xm
	 t3Bt4PpJQyhStNVlfxxQQe5Vg2Re+qBGhOp/27gdKeEWp6Ywl+EiXxUG0Llh1meNJX4hi
	 OzAyELvAV7wTWSdwZvw3sd1JItrX+gH5RKVODQiXtpsiMXZmkAFv1deFixYGVPs306srh
	 sTkbbzYfyo895ibHlF/D+1XTZeZn6TsgS/lyKCQ/Oh2RdjYY+3YLZZ2zfjuylP4tuu6za
	 NFbygfV1l9SJGiuHphSKk/LBHQeGKQkS5W1/dw8Ewv9y3vChfpvkE60vV09P4M2rzZw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612413;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=lRLxSpFiFIG0DKYTb9oc85QDwfwqhPx68qrKkjKaNRM=;
	b=MUR3YwknRYLhtDftA1u6IPA4bFYsAqVF3vZkfHom6Q1zkMgFn7j2QNqwWs955u/677ub
	 pY2HE/1VuNQu7f6RYAQ/q31cpQBmFxk8BYXdORsvgs0BOWJDlGo5MNzB5zldnPr9FZ0Kq
	 aQpRShF6IE7HqkhNQKuvUIUGiys1bDB99kJPZJpv19q32B6lOKHMfEZ9+z4pHIbLkc9Lr
	 JyuCj/rFZtObTwP6ZNHWYq3hzZS10pMLcabza0mPkrp1QX76ZVBsXg77bdp6JzW1Zpcxh
	 SQbLB6cCX7hI+YLiYzDP5hbOpr/hOjnUtZKcDHR/XWfaPJBoC23QVATUDNC4d5iCA6w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51AE81F01573;
	Wed, 21 Oct 2026 19:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612412;
	bh=lRLxSpFiFIG0DKYTb9oc85QDwfwqhPx68qrKkjKaNRM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DSPh0OBMSHPl90k8iINxZS1IJq2VrxBn4+hwaXsTxiVl+9AcyJdvcg+Cq3vVBvHQq
	 UqlDLMmXkngAtmCpG0/MtGTcYmF9wvaJL+C4kQXD+jbNXkT7996yQ5fb+fIphTwXAO
	 TZPpTAno9JEGZbe7UYplGSD9e1am/RE/GNgpV19mCXNBdeN41NKZdWYQkNwCNcAS7S
	 sfQjz0U2XEXTPqpk4Bxg/G7Rjbs+0EsXYSXdqeGhJ5J7B0hqaG/G/LzMmKZVFG0F+1
	 4x7178LEv2yWManlIczR3sj+Ue9Uzs/EwM21CzZkWquIaW/sJnm4NrY9MBBMf7ALY4
	 mCtDaBOUeCv1Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 598F043460;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:34 +0800
Subject: [PATCH 14/18] riscv: dts: zhihe: add A210 UARTs
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
Message-Id: <20261022-a210-init-v1-14-5e438f972d24@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=5486;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=uWP7w6RpNZW/7YfTTpaJ1x8asm0foYPKOs5HYmLXeC4=;
 b=4MLw4y2SX8t/TUDLbdWe6mmoHfaLeT2SlEkYUSrcIbh+6+aie/eOGPiAxesaJaTYjfbMZRnNt
 EDyLpct9HTJBWb0RxunXo1DI63hGw2cTAYjJNaCuiqsLmlFXO3pTunN
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add the ten A210 UARTs with their clocks, resets and interrupts, using
the snps,dw-apb-uart compatible.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/zhihe/a210.dtsi | 150 ++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/riscv/boot/dts/zhihe/a210.dtsi b/arch/riscv/boot/dts/zhihe/a210.dtsi
index bbad51a3edb0..a07b67d10633 100644
--- a/arch/riscv/boot/dts/zhihe/a210.dtsi
+++ b/arch/riscv/boot/dts/zhihe/a210.dtsi
@@ -405,6 +405,66 @@ rst_peri1: reset-controller@2010400 {
 			#reset-cells = <1>;
 		};
 
+		uart0: serial@2014000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x02014000 0x0 0x400>;
+			clocks = <&clk_peri PERI1_UART0_SCLK_EN>,
+				 <&clk_peri PERI1_UART0_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <321 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri1 PERI1_UART0_PRST>;
+
+			status = "disabled";
+		};
+
+		uart1: serial@2015000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x02015000 0x0 0x1000>;
+			clocks = <&clk_peri PERI1_UART1_SCLK_EN>,
+				 <&clk_peri PERI1_UART1_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <322 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri1 PERI1_UART1_PRST>;
+
+			status = "disabled";
+		};
+
+		uart2: serial@2016000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x02016000 0x0 0x1000>;
+			clocks = <&clk_peri PERI1_UART2_SCLK_EN>,
+				 <&clk_peri PERI1_UART2_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <323 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri1 PERI1_UART2_PRST>;
+
+			status = "disabled";
+		};
+
+		uart3: serial@2017000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x02017000 0x0 0x1000>;
+			clocks = <&clk_peri PERI1_UART3_SCLK_EN>,
+				 <&clk_peri PERI1_UART3_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <324 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri1 PERI1_UART3_PRST>;
+
+			status = "disabled";
+		};
+
 		peri1_padctrl: pinctrl@2026000 {
 			compatible = "zhihe,a210-peri1-pinctrl";
 			reg = <0x0 0x02026000 0x0 0x1000>;
@@ -420,6 +480,96 @@ rst_peri2: reset-controller@8400400 {
 			#reset-cells = <1>;
 		};
 
+		uart4: serial@8401000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x08401000 0x0 0x400>;
+			clocks = <&clk_peri PERI2_UART4_SCLK_EN>,
+				 <&clk_peri PERI2_UART4_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <325 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri2 PERI2_UART4_PRST>;
+
+			status = "disabled";
+		};
+
+		uart5: serial@8402000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x08402000 0x0 0x1000>;
+			clocks = <&clk_peri PERI2_UART5_SCLK_EN>,
+				 <&clk_peri PERI2_UART5_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <326 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri2 PERI2_UART5_PRST>;
+
+			status = "disabled";
+		};
+
+		uart6: serial@8403000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x08403000 0x0 0x1000>;
+			clocks = <&clk_peri PERI2_UART6_SCLK_EN>,
+				 <&clk_peri PERI2_UART6_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <327 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri2 PERI2_UART6_PRST>;
+
+			status = "disabled";
+		};
+
+		uart7: serial@8404000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x08404000 0x0 0x1000>;
+			clocks = <&clk_peri PERI2_UART7_SCLK_EN>,
+				 <&clk_peri PERI2_UART7_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <328 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri2 PERI2_UART7_PRST>;
+
+			status = "disabled";
+		};
+
+		uart8: serial@8405000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x08405000 0x0 0x1000>;
+			clocks = <&clk_peri PERI2_UART8_SCLK_EN>,
+				 <&clk_peri PERI2_UART8_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <329 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri2 PERI2_UART8_PRST>;
+
+			status = "disabled";
+		};
+
+		uart9: serial@8406000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x08406000 0x0 0x1000>;
+			clocks = <&clk_peri PERI2_UART9_SCLK_EN>,
+				 <&clk_peri PERI2_UART9_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <330 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri2 PERI2_UART9_PRST>;
+
+			status = "disabled";
+		};
+
 		peri2_padctrl: pinctrl@8411000 {
 			compatible = "zhihe,a210-peri2-pinctrl";
 			reg = <0x0 0x08411000 0x0 0x1000>;

-- 
2.55.0


