Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683489;
	b=E2Lrgw8XHwHsR7bqRRzR+yjho9y+uaJRc7GoHBoeOe0iboo4a5e0jkGoQHFicjWk30xE
	 pfdetqrCnvzaVslaoVa0voE51SFuvTuQHXfZvXOltTVTd2iJW8q2mbs/8JVjfKaeMAgRQ
	 FwyBlk0e9Vrcq8PgqMkQTTbFGktVQxqfbuIrvRAXc2b+1LiapU7M3doPnUgiyv4gw9+x6
	 Vm1X9glLDHsxBppUsMWhT9QsVs+rMNsITWN0n4tjvTXvTq2Nt336xr2dDZzHxyRmHJ+zP
	 ykJE5pimi2w41BshvJVMuYkeafpDg/LvuDWNxdblBT+d6ZHt0C+uVZCPkfhaEXxtWBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683489;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=uOyZswI3TzM//TWA94vgQAXB+C2kSaMgvYIB5TTkH2o=;
	b=gpCff2/YoP4yge1NEMajM8PNiCUDi6mVgeRU+c50rVy2PIVbHtBCQQVp6Lc7Lq94wTZL
	 P0TmXkKl8qR/LFkf7JIiIAwJ3CHS86uRYSQf7UK6+U38sS4/V1rbU4CSBszVoC6xPwRv+
	 zzSkAyTigmPIfMqppOT4gYouxX5Gdzzn5mxyVPeXkD4ABoJAVRYZ5pov+oDDNeugq//XD
	 x5pKhQv6St6ASmhh6nhH641Qe7VZ1ZE2Vz93W21kiJTqy9n5YcQksxpcK6ZliK1JykEdQ
	 BBPs6YBWYFMni/8oJ38G8kYLsyWKaIVhPX/CC5kpMfGMw5OWo6XLgguawMrI7lH3mLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E87E606A33D;
	Thu, 26 Nov 2026 08:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E87E606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id 0C8CE83B;
	Thu, 26 Nov 2026 14:28:05 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Thu, 26 Nov 2026 16:53:37 +0800
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: Add Qualcomm Netrani TLMM
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
Message-Id: <20261126-netrani-tlmm-v1-v2-1-3426fca870c1@krgm.moe>
References: <20261126-netrani-tlmm-v1-v2-0-3426fca870c1@krgm.moe>
In-Reply-To: <20261126-netrani-tlmm-v1-v2-0-3426fca870c1@krgm.moe>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 SignKirigami <prcups@krgm.moe>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4992; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=Dz0ALZvDVuhumXhWfSDNONfpyv7LQSzTKr11bTkWYMY=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrB/RzZYPzatTBajbtBVH7CE34qtMCs++lvhb8t
 Rnxk6sRzPWJAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawf0cxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmOybAv/VHQ2UWahkXO/mPlU0r7VfdXMDhRjU2f
 rJDBjYb+d6/Q9laagv69y0oYQ8bci0EuQFzqVcyLIEpdu7xul8DgFU8o6Ge4Wfx8KTujveDQ2A5
 FWYO3gyYCRnjJOU/pbUoZQHLhuXXiZdsIo6t1WHI4s3IgMUdGPUNNh1+Z8BknYKWyahh4rK5vuV
 KH9xH/0ugm6HQ9MvDwmdin+o5i7rG7WQZzyrJfQKS0Od7aXFKtic+z01Z6K+KPO834fSKGotHBG
 xj1ah6YO6gd08JDZJiNxFEWWG3VV9t/msTPSg38XeJ2iepx8boSatUOr/eFNGgWvJOL36lHviny
 XJEuZ8hQMyWBq+HmfWOT/0UCgOTtLjP5oNyMPich29XPS79urhoUN7828WlFuTpFmRF4Ug33nGC
 /IRkjJuUvF4g/8N+K+kCLuadxVQlwYWLkGrsietRi69NkOc430Vb9GgVz1bJVNGowtEHtXF7zog
 2h2feeoN+YdDHlaQ41exCDPtcL8hq84
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Describe the Netrani top-level pin controller, including GPIO,
peripheral mux functions, eGPIO selection and dedicated SD/UFS pins.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
 .../bindings/pinctrl/qcom,netrani-tlmm.yaml        | 130 +++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml
new file mode 100644
index 0000000000000..84fcd96caae54
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,netrani-tlmm.yaml
@@ -0,0 +1,130 @@
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
+            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc1_rclk, sdc2_clk, sdc2_cmd, sdc2_data, ufs_reset ]
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
+                gcc_gp2_clk, gcc_gp3_clk, host2wlan_sol_mira, host2wlan_sol_mirb, i2s0_data0,
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

