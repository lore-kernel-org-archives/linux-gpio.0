Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795449805;
	b=EV8TLG+Lk+qPY8BECtnZrghZVqGzU4TDG9EkMEM4envWo2DG4AzIY5SUPP5P2veEq2E3
	 q14RIVdV8RtZehjnjnS/coPo1gkk7CVxgt23Rlta264sQlE0iJkxRuBInYIMwjSNQLofH
	 yB55RtYv0IeBQQLsfMAc+he19WMD9MMGUz/+WMkVkEYIpCxHuH6nRZTk5iMhT34fI4TWh
	 eqmmoviQlmcx9FOoAlisYFqSMDCGH+fLUnAE9D4gKXPXEctoEe5UOsHcJTPC5vnZVLJcj
	 kB7zz/MUOSbvNbqF6e1NWt8stn9AxFibr/trJDIABpP2BkVGxzL9PbowFBb4Lui1ygw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449805;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zMFWVq1oRTHvyVD0HktqFR/wJXTEM15cFjH26M99wow=;
	b=bYbPxkGrZdgKeeyAXWyuIofWSrZw4O84uodTL6u8wyyJmQed8StR+ufy+XZvMCLy1meE
	 7cFcpH248OlV9cU1Oxq0fNnYf3pIuIUXLFA3JtszKgAmNozrPGNVWGeDQBKTFLZPwOLdk
	 PoweP1QwlgLTRNtZ8NcLMnKEKvW1OE9ekjLdyZlkrYWe3hAdJuWg9PeNAcgG6PSdgTH+T
	 tk/jsYFrMJF0jR9i9AUkSXPqiUtviQErdY9LgEeeyTRAy0clFLc7EXqghgZ3pUgRC2eQn
	 eVjPnFqFdnB+d2F01DP233L81WKLZR0vWzJQOJi4xYdiiw3rsHrODac6LpIvgRgqaew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hderpzqQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDAE606A327;
	Mon, 23 Nov 2026 16:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hderpzqQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795449804;
	b=cw+eeRErDqCcj+pKIrBpialyrzSfwq4PFNnERv2mXlXIsXEs5Ilny845QogA3cUkR4iD
	 3/VP7diwYFDsKdJMREZDu2V45k+15CI86maN+MJuUfihHDs7oGfARf131yxONIepTWC16
	 SiXeN36+X3ld2xPbx4xizgW91iSil/B2VVqwD6j1yc48BZnW3vhU83kiQ6m5LT9SU0P5M
	 pC7n91TReXh3p07B+/X/Rab2yHcSGiRlMJC2uTUmPCJHNMxprwQ/tvixD9kTq94x64hts
	 mI2c1y8IWcgZ30GlY67lPiBJCRVE86FGqNb30pookjyL4DJc50v5git85jHWicrtZ5A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795449804;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zMFWVq1oRTHvyVD0HktqFR/wJXTEM15cFjH26M99wow=;
	b=mJMQaP6AH0CBDKGUGp4HUQdIhq1A9WzN9i1ls4l3We0skoRpcWp7xPcGfB7hee49PS7g
	 NyKHXbA3Bji6ngp0LuuQj6XAYxK9auM6wwazlrHwzT6FdhqGtk0Pq4FOVxlgf9/SEg2hT
	 +SD9RHKUWtkTJM0py5gSANFlR0v6Sf/6StPcanM02DMgQodmkNdKYrM7e6E5l9Or/FW39
	 PcZaFHmn+hMuVxqucZo2ONvVvt6j+uzUCPftfTm583pCqSQkbTw1nWSVYX9z/iKNSm3E+
	 OLFyhNDB+f0Wi19QS07PXzouIGI/SyIx0EM+U095lHApAAw+MY3pC+ghs+nmwzREMuA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E0EB1F000CA;
	Mon, 23 Nov 2026 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449804;
	bh=zMFWVq1oRTHvyVD0HktqFR/wJXTEM15cFjH26M99wow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hderpzqQPMz0bk69n5f8BdVN/Mcrpe+PlbcaFNaqEav6FIxgEI04asd4epEhZssKi
	 XPGeAC5cKQq8LgahSR9pscvr3GMJVzJUzNlREkROyxHjaGWY/Sco1Hx1nGivi1s+w/
	 pyyJ/kp5/iHBIgVsI9jziZ5CwgJJVm1i0Kyk/oD6El3Nh7J9i3g5NyS/VMAEqY3pTF
	 sYaycmN+mGksAbThrHpcISA4lF8vq35qryiYob8PphfM7Rih1tBFRTGZMtHGezqOAQ
	 uP9GbWhAh5NHJa/A6QzztoVQnCjQLv7uTaJh4OHr8yIGy2vlBr8PfeK6zpJDfGxL+3
	 jnJr/VzSwqffg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D13AD4C541;
	Mon, 23 Nov 2026 16:03:12 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 23 Nov 2026 21:33:12 +0530
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add Molokai TLMM
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
Message-Id: <20261123-molokai-tlmm-v4-1-eed6eeaacc70@yahoo.com>
References: <20261123-molokai-tlmm-v4-0-eed6eeaacc70@yahoo.com>
In-Reply-To: <20261123-molokai-tlmm-v4-0-eed6eeaacc70@yahoo.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795449791; l=5481;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=6MM5+Kj4DTA/tUIBRqwFXc/0ZztmSLD9PkILcATPCBo=;
 b=oPxahDfIZ0FoPR3IiL9X7BYi0L8u4CQU+Y2xo2f1QigFwGbS1it9Jrz3zZP7khFpOPQaQrftH
 sqvucgC+kppCDo31vg1g+hLddWtvtzTIFdeRfofy+eoVfPZqB3JOrHb
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 .../bindings/pinctrl/qcom,molokai-tlmm.yaml        | 128 +++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,molokai-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,molokai-tlmm.yaml
new file mode 100644
index 000000000000..eb6fbb529f79
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
+            pins = "gpio48", "gpio49", "gpio50", "gpio51";
+            function = "qup1_se4";
+        };
+    };
+...

-- 
2.56.1


