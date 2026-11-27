Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783964;
	b=vUCGrJ5otmKy5gNQwl3YEPoOrSKaZEgeAGqasXG0Ye+S6Yl5rJKJLYXPDQKlgexHw1ac
	 G9Wp2SZAJTbKDzI9rXpZaWC+ApQHVn+eWQEb117pgOLSQk7Xm/TvFmeoV8fdOAuucAg3A
	 JvdPkFpSCi6ounWPX/4hhs+zEEhzK4iGCDfrtriY0YM+2g/UbZ/56kCOInDVAel0tkRZO
	 rsX7HcGx3Zai4i0rNN0xYbLDZLE5OZ7h077p1aDUK7Cf9DydDJ5Se8SO04V7bjQZCsqSn
	 +LW8JFCpqJdKINHXNiOP6QiLmEizFKKIPEpUdMgXs3jqGsAINMvRy1PQ7/j2K87XB4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783964;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9wS7ladPh2QUCRZATfDm/ud7pwNq6oifA10HAc1hBf4=;
	b=yc3iFHFTlFh3t2CU0jysW/GB822nreHPOM2VS7mfyuVtOtp25n9ZQhR8FHOZ5pa1nD8a
	 uMmVkLNJabbiSx5Wy2FetvNKmmIjZXbc6Nzigg3mxEAI0QlKDERX9Y0xSCs6ZCugatrot
	 6apnj1ouose8n22mHk2VGGKlEHY/r1qwLXmLZeS+MM8Iu1Gw+7DNLdjFNIAnVeLb/tKL4
	 txpnELbzfURt8QmG3BwLNOpnisx/9COGOjoNA7DziK7edse6E28LCGTXlvrun8G5A4Qtu
	 ofhSUYqhTX9BNZRB2PKxgtVlNBxoPCwTOHf2B0jqdKZNGGOO4AO5hlwb13fn/hEKTOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181F8606A31F;
	Fri, 27 Nov 2026 12:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181F8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from yuno-laptop.local (unknown [103.47.186.116])
	by krgm.moe (Postfix) with ESMTPSA id 28A0382E;
	Fri, 27 Nov 2026 18:22:33 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Fri, 27 Nov 2026 20:51:56 +0800
Subject: [PATCH v5 1/2] dt-bindings: pinctrl: Add Qualcomm Netrani TLMM
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
Message-Id: <20261127-netrani-tlmm-v5-v5-1-f60f7b45c3dd@krgm.moe>
References: <20261127-netrani-tlmm-v5-v5-0-f60f7b45c3dd@krgm.moe>
In-Reply-To: <20261127-netrani-tlmm-v5-v5-0-f60f7b45c3dd@krgm.moe>
To: Bjorn Andersson <andersson@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 SignKirigami <prcups@krgm.moe>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5494; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=bnlajOQam6PHuDbWCrotANSaJHtQwuCK7LhJszj8mRM=;
 b=owEBCQL2/ZANAwAIAUNLJdlxtMKiAcsmYgBrCX0G7PYDUuD6Qdo+RFqIk5O5DNPSzkgZD6oLe
 EGciCPG3JeJAc8EAAEIADkWIQQKI/ZJLAWGn9r1JLZDSyXZcbTCogUCawl9BhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQQ0sl2XG0wqKY/AwAoLW0IwAxoeEvI278EZ7ZZnDBGVZmSiZ
 g7UZSgXcAtCihqk211dwGfQtQFvOH4sKncD2rkHIQP9LDErjZIKj0pKoDJDnmfYOmfb+6FVhnSj
 M1HF7fuP+fCKot62otLkuX0XsKYo7epPvcYxGa6iK1CVPvQJkLk13fmWR4anWU81J6oNBUH+x2N
 M06euDLedoQb+1d82ZbiUkYdkEh791X++wQitkZHDTGOJ5lyCc2aI5DQvi0dILcw5hB9Xu7RnjK
 c4mN3oYERbInH9Gm4DlaV+d+WEXAQfuPn55czliOvo+vXfX3A8+/dM3KtRDGQvxHry2BOwNrTR3
 JB5n/ZLCf2wQtfB6/Fy//QWwH5bPq2Or79bK3uOU6PpTra+4+8KJWLlYnoku2Pt+BbLIOBi8NYf
 RODYvBg2w2kYuFFl9S/xQaA7rkw3ChQVFsqzntCS3SHuh8bkYC0Gh9vx9r2Qn7sKoMpyP9XDsd5
 hTfylwMlH+qMczO4V/KoqcFzE4ayWTa
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=0A23F6492C05869FDAF524B6434B25D971B4C2A2

Describe the Netrani top-level pin controller, including GPIO,
peripheral mux functions, eGPIO selection and dedicated SD/UFS pins.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
 .../bindings/pinctrl/qcom,netrani-tlmm.yaml        | 144 +++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml
new file mode 100644
index 000000000..10c8ee292
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml
@@ -0,0 +1,144 @@
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
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 71
+
+  gpio-line-names:
+    maxItems: 141
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
+            - enum:
+                - sdc1_clk
+                - sdc1_cmd
+                - sdc1_data
+                - sdc1_rclk
+                - sdc2_clk
+                - sdc2_cmd
+                - sdc2_data
+                - ufs_reset
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, pcie0_clk_req, qspi0, qspi1, qspi2,
+                qspi3, qspi_clk, qspi_cs_n, atest_char, atest_usb0,
+                audio_ref_clk, cam_mclk, cci_async_in0, cci_i2c, cci,
+                cmu_rng, coex_uart1_rx, coex_uart1_tx, cri_trng, dbg_out_clk,
+                ddr_bist, ddr_pxi0_test, ddr_pxi1_test, dp0_hot_plug, gcc_gp1_clk,
+                gcc_gp2_clk, gcc_gp3_clk, gp_mn, gp_pdm_mira, gp_pdm_mirb,
+                grfc0, grfc0_mira, grfc1, grfc2, grfc3, grfc4, grfc5, grfc6,
+                grfc7, grfc8, grfc9, grfc10, grfc11, grfc12,
+                host2wlan_sol_mira, host2wlan_sol_mirb, i2s0_data0,
+                i2s0_data1, i2s0_sck, i2s0_ws, ibi_i3c_qup0, ibi_i3c_qup1,
+                jitter_bist_ref, mdp_vsync0_out, mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out,
+                mdp_vsync_e, mdp_vsync_p, mdp_vsync_s, nav_gpio0, nav_gpio1,
+                nav_gpio2, phase_flag, pll_bist_sync, pll_clk_aux, prng_rosc,
+                qdss_cti_trig0, qdss_cti_trig1, qdss_gpio, qlink0_enable, qlink0_request,
+                qlink0_wmss_reset, qlink1_enable, qlink1_request, qlink1_wmss_reset, qup0_se0,
+                qup0_se1, qup0_se2, qup0_se3, qup0_se4, qup0_se5,
+                qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se5, rffe0_clk,
+                rffe0_data, rffe1_clk, rffe1_data, rffe2_clk, rffe2_data,
+                rffe3_clk, rffe3_data, rffe4_clk, rffe4_data,
+                sd_write_protect, tb_trig_sdc1, tb_trig_sdc2, tgu_ch0_trigout,
+                tgu_ch1_trigout, tgu_ch2_trigout, tgu_ch3_trigout, tmess_prng,
+                tsense_pwm1_out, tsense_pwm2_out,
+                uim0, uim1, usb0_hs_ac, usb0_phy_ps, vfr_0_mira,
+                vfr_0_mirb, vfr_1, vsense_trigger_mirnat, wlan1_adc_dtest0, wlan1_adc_dtest1,
+                wlan2_adc_dtest0, wlan2_adc_dtest1, egpio ]
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
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,netrani-tlmm";
+        reg = <0x0f100000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 142>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        gpio-wo-state {
+            pins = "gpio1";
+            function = "gpio";
+        };
+
+        uart-w-state {
+            rx-pins {
+                pins = "gpio23";
+                function = "qup0_se3";
+                bias-pull-up;
+            };
+
+            tx-pins {
+                pins = "gpio22";
+                function = "qup0_se3";
+                bias-disable;
+            };
+        };
+    };
+...

-- 
2.56.0

