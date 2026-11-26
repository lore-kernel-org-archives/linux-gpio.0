Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709998;
	b=G3BdKRMOE9eQ38nU9zift44lZ7k7zDasweiD7zkkS6+0NfX2LNuourIKhRIDUl4TFqss
	 afARDAVy8+R5kouddbNt+SNM63HU6xgrn0xp3JXU/N33SgeP2q8kbp3i4F5HHbN8JLqLh
	 07dWBslZnQeOViNxhHOYvYcwYOc4ZyMIZm4bIvPHugK2O9Gac0AELTS2GHKjGLW1Mz/9e
	 wOKkFi2QhYxZwsfSkHNiLw8Orr2HfU4BODvgRdY+VTptfabiuYWnavLsc9xeADRUc98GD
	 RD5+krUoIHzFGbVCG+iyP3s7X6A2ZpZw3NsKunzhl97akHflgsLm+DgokpBEtlEelog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709998;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=GJy1Mn0Tj9/F+VGeIN9uLYACJ0K5Eoq8rvCXuzIczJs=;
	b=M4N8AgC5HG91Wv96C9uHT+TFqvcSfvetlS0+SNiTNG6rsnAcg7MSgi1AE+Bv9yjYroTr
	 E2RZ2+rZmVR3h7+BMLzAndop3SdJx0bdkysHm4GyVbezyDbnhZdhHG1KyYhFs41ceAIUo
	 ThzywMmJPPzCmKQRNuoDlq11OH6Maq271Y+BuZ7JdLge/ArfECynaiUf1iY3N9s20naqp
	 a4YwKS3aI9dEKLokWwCxzkjW1sNmKeyp0c0IDESE6GmWsRsqCJ1vrmJrOC83lrhTbK43p
	 Gtx0eg20WjHyH7N84X9Fp/2LGi07iU6SKMj1/aBf9mosGMioJSv83KBF7ubTgrJaVIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D45D606A339;
	Thu, 26 Nov 2026 16:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D45D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from yuno-laptop.local (unknown [103.47.186.116])
	by krgm.moe (Postfix) with ESMTPSA id 4DAF083B;
	Thu, 26 Nov 2026 21:49:53 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Fri, 27 Nov 2026 00:19:27 +0800
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: Add Qualcomm Netrani TLMM
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
Message-Id: <20261127-netrani-tlmm-v3-v3-1-3bf3f0bbe5df@krgm.moe>
References: <20261127-netrani-tlmm-v3-v3-0-3bf3f0bbe5df@krgm.moe>
In-Reply-To: <20261127-netrani-tlmm-v3-v3-0-3bf3f0bbe5df@krgm.moe>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, SignKirigami <prcups@krgm.moe>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8378; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=/M5UpUXfrpyh7qRAcGoM7FKNF850LQTy6VSkc1Iw/eU=;
 b=owEBCQL2/ZANAwAIAUNLJdlxtMKiAcsmYgBrCFwkZpz/Lgvdn3l1RFUpMDX/0HOMJlrmUaGfR
 o4JtjlNZQGJAc8EAAEIADkWIQQKI/ZJLAWGn9r1JLZDSyXZcbTCogUCawhcJBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQQ0sl2XG0wqLxIwwAtfWIbwc4CaxbXnJKGEyfPwXhqidytEu
 CFPh7ZK23kKD/X9cKVaXTKx5HHJxjIS6j0LEi9SZ7bev1CvtzLnjaLHYWUF9aQUNedPeFwGLoZX
 e/Wl+MDcZkIOrM07qmV7RZyQ4h7XDarRyOt5c1RmEm/wJCD2ga8iPzMmzuLc8j5bREg6TQInhOz
 18vWAFv0KIoel9SN2cSUpYn0UITRN2rvTerHWfaGdsXUMf7LHMpacoQCuQGv6HBO+zK8OAkBYfp
 LXipa4nLidWaXOcYWCy2/yQZVHYQelfIOR7mAGyS2TWeVjK9UhPqWArWcPEz+YRignKGPUG0tEu
 KyoLKTC6/nKMz072Yd9hP93zHfkq0jpHp1R1XOvi+XBn7KPv3b334UojEtBSuj6py9uOLiOsIlx
 KGD5fQv5cjzVxB7LtUj4fOlCfQV/Kyx+06hxgD35EsmsdZ3OF1/10riH+hrXljb+C6jnicr2/Qy
 UbwAjMhpqknzwQ/F1bZtlnh+0bfhdT8
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=0A23F6492C05869FDAF524B6434B25D971B4C2A2

Describe the Netrani top-level pin controller, including GPIO,
peripheral mux functions, eGPIO selection and dedicated SD/UFS pins.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
 .../bindings/pinctrl/qcom,netrani-tlmm.yaml        | 190 +++++++++++++++++++++
 1 file changed, 190 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml
new file mode 100644
index 000000000..c8f9d15fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,netrani-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Netrani TLMM block
+
+maintainers:
+  - SignKirigami <prcups@krgm.moe>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Netrani SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,netrani-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts: true
+  interrupt-controller: true
+  "#interrupt-cells": true
+  gpio-controller: true
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 71
+
+  gpio-line-names:
+    maxItems: 141
+
+  "#gpio-cells": true
+  gpio-ranges: true
+  wakeup-parent: true
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-netrani-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-netrani-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-netrani-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-3][0-9]|140)$"
+            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc1_rclk, sdc2_clk, sdc2_cmd, sdc2_data, ufs_reset ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, egpio,
+                atest_char_start, atest_char_status0, atest_char_status1,
+                atest_char_status2, atest_char_status3, atest_usb0_atereset,
+                atest_usb0_testdataout00, atest_usb0_testdataout01, atest_usb0_testdataout02,
+                atest_usb0_testdataout03, audio_ref_clk, cam_mclk,
+                cci_async_in0, cci_i2c_scl0, cci_i2c_scl1,
+                cci_i2c_scl2, cci_i2c_scl3, cci_i2c_sda0,
+                cci_i2c_sda1, cci_i2c_sda2, cci_i2c_sda3,
+                cci_timer0, cci_timer1, cci_timer2,
+                cci_timer3, cmu_rng_entropy0, cmu_rng_entropy1,
+                cmu_rng_entropy2, cmu_rng_entropy3, coex_uart1_rx,
+                coex_uart1_tx, cri_trng_rosc, cri_trng_rosc0,
+                cri_trng_rosc1, dbg_out_clk, ddr_bist_complete,
+                ddr_bist_fail, ddr_bist_start, ddr_bist_stop,
+                ddr_pxi0_test, ddr_pxi1_test, dp0_hot_plug,
+                gcc_gp1_clk, gcc_gp2_clk, gcc_gp3_clk, gp_mn,
+                host2wlan_sol_mira, host2wlan_sol_mirb, i2s0_data0,
+                i2s0_data1, i2s0_sck, i2s0_ws,
+                ibi_i3c_qup0, ibi_i3c_qup1, jitter_bist_ref,
+                mdp_vsync0_out, mdp_vsync1_out, mdp_vsync2_out,
+                mdp_vsync3_out, mdp_vsync_e, mdp_vsync_p,
+                mdp_vsync_s, nav_gpio0, nav_gpio1,
+                nav_gpio2, pcie0_clk_req, phase_flag_status0,
+                phase_flag_status1, phase_flag_status10, phase_flag_status11,
+                phase_flag_status12, phase_flag_status13, phase_flag_status14,
+                phase_flag_status15, phase_flag_status16, phase_flag_status17,
+                phase_flag_status18, phase_flag_status19, phase_flag_status2,
+                phase_flag_status20, phase_flag_status21, phase_flag_status22,
+                phase_flag_status23, phase_flag_status24, phase_flag_status25,
+                phase_flag_status26, phase_flag_status27, phase_flag_status28,
+                phase_flag_status29, phase_flag_status3, phase_flag_status30,
+                phase_flag_status31, phase_flag_status4, phase_flag_status5,
+                phase_flag_status6, phase_flag_status7, phase_flag_status8,
+                phase_flag_status9, pll_bist_sync, pll_clk_aux,
+                prng_rosc_test0, prng_rosc_test1, prng_rosc_test2,
+                prng_rosc_test3, qdss_cti_trig0, qdss_cti_trig1,
+                qdss_gpio_traceclk, qdss_gpio_tracectl, qdss_gpio_tracedata0,
+                qdss_gpio_tracedata1, qdss_gpio_tracedata10, qdss_gpio_tracedata11,
+                qdss_gpio_tracedata12, qdss_gpio_tracedata13, qdss_gpio_tracedata14,
+                qdss_gpio_tracedata15, qdss_gpio_tracedata2, qdss_gpio_tracedata3,
+                qdss_gpio_tracedata4, qdss_gpio_tracedata5, qdss_gpio_tracedata6,
+                qdss_gpio_tracedata7, qdss_gpio_tracedata8, qdss_gpio_tracedata9,
+                qlink0_enable, qlink0_request, qlink0_wmss_reset,
+                qlink1_enable, qlink1_request, qlink1_wmss_reset,
+                qspi0, qspi1, qspi2,
+                qspi3, qspi_clk, qspi_cs_n,
+                qup0_se0_l0, qup0_se0_l1, qup0_se0_l2,
+                qup0_se0_l3, qup0_se1_l0, qup0_se1_l1,
+                qup0_se1_l2, qup0_se1_l3, qup0_se1_l4,
+                qup0_se2_l0, qup0_se2_l1, qup0_se2_l2,
+                qup0_se2_l3, qup0_se3_l0, qup0_se3_l1,
+                qup0_se3_l2, qup0_se3_l3, qup0_se4_l0,
+                qup0_se4_l1, qup0_se4_l2, qup0_se4_l3,
+                qup0_se5_l0, qup0_se5_l1, qup0_se5_l2,
+                qup0_se5_l3, qup0_se5_l4, qup0_se5_l5,
+                qup0_se5_l6, qup1_se0_l0, qup1_se0_l1,
+                qup1_se0_l2, qup1_se0_l3, qup1_se1_l0,
+                qup1_se1_l1, qup1_se1_l2, qup1_se1_l3,
+                qup1_se2_l0, qup1_se2_l1, qup1_se2_l2,
+                qup1_se2_l3, qup1_se2_l4, qup1_se3_l0,
+                qup1_se3_l1, qup1_se3_l2, qup1_se3_l3,
+                qup1_se5_l0, qup1_se5_l1, qup1_se5_l2,
+                qup1_se5_l3, sd_write_protect, tb_trig_sdc1,
+                tb_trig_sdc2, tgu_ch0_trigout, tgu_ch1_trigout,
+                tgu_ch2_trigout, tgu_ch3_trigout, tmess_prng_rosc0,
+                tmess_prng_rosc1, tmess_prng_rosc2, tmess_prng_rosc3,
+                tsense_pwm1_out, tsense_pwm2_out, uim0_clk,
+                uim0_data, uim0_present, uim0_reset,
+                uim1_clk, uim1_data, uim1_present,
+                uim1_reset, usb0_hs_ac, usb0_phy_ps,
+                vfr_0_mira, vfr_0_mirb, vfr_1,
+                vsense_trigger_mirnat, wlan1_adc_dtest0, wlan1_adc_dtest1,
+                wlan2_adc_dtest0, wlan2_adc_dtest1 ]
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
+    tlmm: pinctrl@f000000 {
+        compatible = "qcom,netrani-tlmm";
+        reg = <0x0f000000 0x1000000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 142>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-wo-state {
+            pins = "gpio1";
+            function = "gpio";
+        };
+
+        uart-w-state {
+            rx-pins {
+                pins = "gpio23";
+                function = "qup0_se3_l2";
+                bias-pull-up;
+            };
+
+            tx-pins {
+                pins = "gpio22";
+                function = "qup0_se3_l3";
+                bias-disable;
+            };
+        };
+    };
+...

-- 
2.56.0

