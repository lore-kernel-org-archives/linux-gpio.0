Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794773965;
	b=wQ6Yh9JEOjjGKEX0UxpjGdgrvsII8d88vf0Q5tuvXy4cpnm7btSUe1D9Ko6wjQprysea
	 i+j1YW5PxU8psXPaXXUKwg+MndEqvoCY5KRCb4VRfji+FJn6DJ49b8r0tVy0rFFiKYFkw
	 DtlfwpCeTdSWsSqvFv4PWgHK3/chx30cppXfhNO3g59PMGoF+9810YIBSFXjP5m5KUHJX
	 0QLB8kI63cFX90x5v6FGWyvhhj6MoiuzpKYgOdlx1dOrxk9f6n6u1NhNoqJuWJV58W4jb
	 YAuhYCISHl+0bg8Uflt4F1L1f+0+MYGpWLM4LhJksZBcxxPKe7Byk0XNl/TwHO9t1Rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773965;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GUFNeGdkjDpExHbrluRp1pRBSeRPK72UmgM4tQA34i8=;
	b=iJTQ8FLA7Fj0RtyEpR6zXxjrEqYcmPuEVZypQoeOnbyi9oZqR9AOi8iFxuK+0olaiUNU
	 fn+Zg1wnHdVtkdG24P2rB9QhKS2lUB8SifHVU0urGyBTI7mtJds2fh5M+8xaHIDF3Vhnh
	 2f7QMfrRtq99ahLJIDkTw/6Egdh3zIfhdNN1TYdIrNTI/YYMAIu3GEQgHSzXE4IMP6HTE
	 IyiWioX7VeJAlJCm7BgRz+fph8Cnvpty7reU6NHGc6NRxU/47gM1saGbollYA+Bv+MP2z
	 pxDjcyNols4BqFo507txMF2T6iWW+C4ZnHQk8fFFOAZEpwcQEiGtLe36A4RvV4hYf7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ouBDJUJf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3C4606A331;
	Sun, 15 Nov 2026 20:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ouBDJUJf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794773965;
	b=BDUrqytrJ5scloBUsbEj0/UNOO8kzFTKQQHSk0+kD4cs2c56PAku2HCDKWwE2BUgBfc6
	 0LqlTCBS9ZvH1Hw5Ia0ESTkFQnzO3QweCJblHPb+1iw8LX0AMZgfTNt1Sa73hzMleAEaF
	 lyXrng2hPS68IO3E90qkfjdUXswd8haiiiP3S+kZwqaKvgK3RIL/IcvVnJa5FMt8EwseX
	 fEVhrl05/VEbJpMv3Jnm2XSgxNqUjS2p7OBH7Trv6uf2ukgD4wDHDrh2Pz5uy9wkesCh4
	 1YmkFpVlg7NxXkOKs1rTJkRsBzjDATnNeCbBhWhaoi7iqdQOBMNjgh4IEubHCzbvG4w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794773965;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GUFNeGdkjDpExHbrluRp1pRBSeRPK72UmgM4tQA34i8=;
	b=2rVoWhdTwChuLWwmp+FDbWild9bTZvXxN8F9HDHyqj9MFFMH6h3oy6kLTLYGUIME5/aZ
	 dNYTYSj7xheRRM8mQtUQwjB6NTj9wJjS4RLGilB5vyD3V3wrR8SaPmW4ijyjSi5//RsKd
	 loQ5awoG3zbsV4/L1JNtW+eFO0dGOxttam7/flDO8okBn0TMM0pGNuFyFLhIPm2QATet5
	 J3KOFKG++XdUU7WP8GS7N5Ks5KNKIj/y2xod1UEBUHenqW9YUGtDIfFoM19lBYDkyjPZo
	 ybB8NJq8+ivlJiRlgvCPHuxesKCAhywikZXz6CCqTX0yoZOOblvYdycWpSHYgaQjReg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C3A51F000C5;
	Sun, 15 Nov 2026 20:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773965;
	bh=GUFNeGdkjDpExHbrluRp1pRBSeRPK72UmgM4tQA34i8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ouBDJUJfM4cNNC0V/8be8tbKQO7j3Tm+rxj42uEalYTh3YzVwHea4O8Uj/+j8GS+E
	 F780FUnuoJJPhn38cD9aU4gipa2iTmfvzwSs7C+0qgKESx5ptXGNbnOULtSEo82yce
	 7kjE0XuS/wLVBHp219dgRYqS7/eeJK4X2JdUw+xu5Kv8JJd9rlQvJi9OoUNBmVwgCJ
	 0KWxybY3QVs662oulu03ZbjL6LdQcQ6wQl1VhF/d5/X/7rI5S/Oes84tlqQI3oL756
	 LDt3qSjXMqN9uGK64kcTA62mk1/Ji3yjv4ohbpJQmABO8CF78QpwGKbMdlnaZlWZpQ
	 Lfl0hDZVbmnDg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 284794A188;
	Sun, 15 Nov 2026 20:19:24 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:49:23 +0530
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add Molokai TLMM
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
Message-Id: <20261116-molokai-tlmm-v1-1-3ba4840002cb@yahoo.com>
References: <20261116-molokai-tlmm-v1-0-3ba4840002cb@yahoo.com>
In-Reply-To: <20261116-molokai-tlmm-v1-0-3ba4840002cb@yahoo.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794773962; l=5422;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=59MoNn9Vh1EpMg7OmVKlVFeXZGrSNTVWeBRj7i24iZc=;
 b=n+3RI35UfpYKNPMj3Hmfs8lRCNIHu5tYhPw1PicOT9q4WdYS8wNMtHpsfV7OhlQquZYMI02FA
 GnvIc+d7BAlB+mnC0KDBdGuNLzQVqcOOm7zd419Tr6ogsgvkv/tC7rG
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Document the Top Level Mode Multiplexer of the Qualcomm Molokai (SM8845)
SoC. It is a Kaanapali derivative, but has 205 GPIOs instead of 217, no
SDC2 pins and a different set of pin functions.

Assisted-by: LLM
Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 .../bindings/pinctrl/qcom,molokai-tlmm.yaml        | 128 +++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,molokai-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,molokai-tlmm.yaml
new file mode 100644
index 000000000000..9196902e37d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,molokai-tlmm.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,molokai-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Molokai TLMM block
+
+maintainers:
+  - Venkat Yadlapati <venkat.yadlapati@yahoo.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Molokai (SM8845) SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,molokai-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 103
+
+  gpio-line-names:
+    maxItems: 205
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-molokai-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-molokai-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-molokai-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-4])$"
+            - enum: [ ufs_reset ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk0,
+                audio_ext_mclk1, audio_ref_clk, cam_asc_mclk4, cam_mclk,
+                cci_async_in, cci_i2c_scl, cci_i2c_sda, cci_timer,
+                coex_uart1_rx, coex_uart1_tx, coex_uart2_rx, coex_uart2_tx,
+                dbg_out_clk, ddr_bist_complete, ddr_bist_fail, ddr_bist_start,
+                ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp_hot,
+                egpio, gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0, gnss_adc1,
+                host2wlan_sol, i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws,
+                i2s1_data0, i2s1_data1, i2s1_sck, i2s1_ws, ibi_i3c,
+                jitter_bist, mdp_esync0_out, mdp_esync1_out, mdp_vsync,
+                mdp_vsync0_out, mdp_vsync1_out, mdp_vsync2_out,
+                mdp_vsync3_out, mdp_vsync5_out, mdp_vsync_e, nav_gpio0,
+                nav_gpio1, nav_gpio2, nav_gpio3, pcie0_clk_req_n, phase_flag,
+                pll_bist_sync, pll_clk_aux, prng_rosc0, prng_rosc1,
+                prng_rosc2, prng_rosc3, qdss_cti, qdss_gpio_traceclk,
+                qdss_gpio_tracectl, qdss_gpio_tracedata, qlink_big_enable,
+                qlink_big_request, qlink_little_enable, qlink_little_request,
+                qlink_wmss, qspi0, qspi1, qspi2, qspi3, qspi_clk, qspi_cs,
+                qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4,
+                qup1_se5_mira, qup1_se5_mirb, qup1_se6, qup1_se7, qup2_se0,
+                qup2_se1, qup2_se2, qup2_se3, qup2_se4_mira, qup2_se4_mirb,
+                qup2_se5, qup2_se6, qup2_se7, qup3_se0, qup3_se1, qup3_se2,
+                qup3_se3, qup3_se4, resout_gpio_n, sd_write_protect, sdc2_clk,
+                sdc2_cmd, sdc2_data, sdc2_fb_clk, sys_throttle, tb_trig_sdc2,
+                tmess_prng0, tmess_prng1, tmess_prng2, tmess_prng3,
+                tsense_pwm1, tsense_pwm2, tsense_pwm3, tsense_pwm4,
+                tsense_pwm5, tsense_pwm6, tsense_pwm7, uim0_clk, uim0_data,
+                uim0_present, uim0_reset, uim1_clk, uim1_data, uim1_present,
+                uim1_reset, usb1_hs, usb_phy, vfr_0, vfr_1,
+                vsense_trigger_mirnat, wcn_sw, wcn_sw_ctrl ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,molokai-tlmm";
+        reg = <0x0f100000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 206>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        qup-spi4-state {
+          pins = "gpio48", "gpio49", "gpio50", "gpio51";
+          function = "qup1_se4";
+        };
+    };
+...

-- 
2.56.0


