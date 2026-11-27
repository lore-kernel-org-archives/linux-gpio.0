Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747706;
	b=Eoe/Zb5hg1DQ9XJntrnsG11FGalZUi9SkzIJyKbLXXhtICBq2bOauaJYbIvE4ZjmPOiM
	 upJ1+CsgfBEY7bwefPpBitHIaaw939A9iw884/95EdDvW3EJcwVxzMiCjYWvKtKLyMH4T
	 BTmbRzhFXRh9P3BDD4rPGKA4eJU3WxYm2q2R6ND/3vFywtv+Cqq7fiXS8UW0vtM1S9J1X
	 dK29ywUv+IemO1RX5Kc3vKVKl54uHgE4cNRcE5mM08WGFmkjVKnqpnnEIh5X7TemEX1RC
	 hXPb8wi4KHXNNEJDUnVIgPMO3leoqN0sjwd+ib5HZ3CMzeqp6YKFqT8/B+cU4NAWqOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747706;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=dZ9cYGubkP5PHIsx/rNN59KhZLj9/vuf5xM51t+rJWg=;
	b=nYjmuqnG/hd0lFJTWc8QbuwqlPxpqGK3bVIpxWJRXphyUwYFDYUPuyz5ow836Z0bcWnV
	 b1dGk5qFz7ZnN8KWFxbo3OBcMVYXZbQki5dx2k0BPMIE1fQylilf2g93OTxohu+fn+6KF
	 wZVJ8MdxQ7ReQmdkt9zNa5AjWaJmqvKwVOCJYfRuhJHxzhAHb+vGOw9vFGF0m0o1dhp4U
	 zYrHQqW7TaLGzNRzNKk8/krSNZ4bWUrUPYe0nrZXDWSHQ/ipq83PG8t0VlL7S9YGapAcc
	 h0IQUmdica0UhV3k+hD5uPhb3ihJVDTeYN7gi8rAQ8iMvLqsfhgERpNRdF46bmOISKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3EC606A32A;
	Fri, 27 Nov 2026 02:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F3EC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id DD5B182E;
	Fri, 27 Nov 2026 08:18:22 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Fri, 27 Nov 2026 10:47:28 +0800
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: Add Qualcomm Netrani TLMM
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
Message-Id: <20261127-netrani-tlmm-v4-20261127-v4-1-a77415255784@krgm.moe>
References: <20261127-netrani-tlmm-v4-20261127-v4-0-a77415255784@krgm.moe>
In-Reply-To: <20261127-netrani-tlmm-v4-20261127-v4-0-a77415255784@krgm.moe>
To: Bjorn Andersson <andersson@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 SignKirigami <prcups@krgm.moe>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5139; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=FmP7RhS74cn2zsBh/+jKlPa8eSYJJUW0+MFcpRs+nZw=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrCO9NMaiRBd5dxMj2Ov/vgigsjC6vGkOKted2A
 JCy7LF+Td+JAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawjvTRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmORLgv9FBRIORkq1aQUpfOyE77ERUpbrMaimA6
 c5zpr6vtummc2QYjNXueHt0Tzo7zeprtRB7lQNRva+eXLwVNffp9s916DhFzR8pgebEiYVFa2a8
 ei72tzorHN7NDSLMgppPOo29Ja1sgJTtXwyw0v68KT4N1PKEMF40ChQwLa4nzk+q0+PFCynP661
 eJpFnSHrDTCELY4U5/EoVWaPcVkkVT0mPiJ5T7hv4KsveckoatrXIYwkZsBwYxbdKIskBVySNpm
 oIPPOCeX0ZBxPkWKGNRfq0pLFhRRjjz9KO6q1ivfh+uRoZhf9xTpIL0rTAxF7r0wP9W+UqiueYg
 jAhYMryfxRDoEM47fzQwon1dTu6vvkrT1zh2WLufkbfQQn19yOf/ivR1LJ7sON5XjPoPxvQl8T5
 GmuYe4z7CM3O9zec19gPuPDY5Dx9tHrevz6cSQRIn6ZW8rhdiUWgUcXH6hEciMUe2JvLx0A0zZq
 vf9rj1r0lePSWNF1MBVS03fm0Tk9t5e
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Describe the Netrani top-level pin controller, including GPIO,
peripheral mux functions, eGPIO selection and dedicated SD/UFS pins.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
 .../bindings/pinctrl/qcom,netrani-tlmm.yaml        | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml
new file mode 100644
index 000000000..609730d52
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml
@@ -0,0 +1,138 @@
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
+                gcc_gp2_clk, gcc_gp3_clk, gp_mn, host2wlan_sol_mira, host2wlan_sol_mirb, i2s0_data0,
+                i2s0_data1, i2s0_sck, i2s0_ws, ibi_i3c_qup0, ibi_i3c_qup1,
+                jitter_bist_ref, mdp_vsync0_out, mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out,
+                mdp_vsync_e, mdp_vsync_p, mdp_vsync_s, nav_gpio0, nav_gpio1,
+                nav_gpio2, phase_flag, pll_bist_sync, pll_clk_aux, prng_rosc,
+                qdss_cti_trig0, qdss_cti_trig1, qdss_gpio, qlink0_enable, qlink0_request,
+                qlink0_wmss_reset, qlink1_enable, qlink1_request, qlink1_wmss_reset, qup0_se0,
+                qup0_se1, qup0_se2, qup0_se3, qup0_se4, qup0_se5,
+                qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se5,
+                sd_write_protect, tb_trig_sdc1, tb_trig_sdc2, tgu_ch0_trigout, tgu_ch1_trigout,
+                tgu_ch2_trigout, tgu_ch3_trigout, tmess_prng, tsense_pwm1_out, tsense_pwm2_out,
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

