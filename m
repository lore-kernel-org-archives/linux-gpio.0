Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A6D422541;
	Thu, 20 Aug 2026 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224659; cv=none; b=qRs1xq6Trv85z+FQUQXkyajZ7p4vZa4JXTEhBDSLV2gjWqQk/KzQXlcq2EKPKAluQNWO0LYZHoXfbpWlCWwqRtlCGpiQCoNRwY0rGwpTC91WnHGaY6d9IFRVIxKEFfoEqmB/JHNdH3KTdu4PHZ9+U25W/sW0ApiFOBlCNXZ2tlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224659; c=relaxed/simple;
	bh=OYRJThUzOKSByESKx+g16X0FN0h3WmMR0rwmhZDMRY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N2dlvCs6r56S2B9nGuHUioTmvT0na+37Q6owng2cNYU+VqFKaw2nO/7kxJDR15c9QyYGMpq/B49nV6oAJi5oEqBRAXGdFqXXFuOHc14pMCcCadFV6GCB8f7iN8CKlu2cIewSpTWmkRIZHFrI1zB0ZaKUF/UAlCaPMsPS6Qrj6Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6ryAiAy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6ryAiAy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F2EFC2BCB3;
	Thu, 20 Aug 2026 11:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787224659;
	bh=OYRJThUzOKSByESKx+g16X0FN0h3WmMR0rwmhZDMRY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L6ryAiAy3FXBUVt8w63DcDacqfgLXF2nIEt6e9X5T76Jw6ljx9WIB99aWq2chj/SS
	 spI0p+Phy70RpozqFOgr7JtCjAxqbGg+dG14QE2uCLyYAUffH+srecNQlL46D+JznN
	 tEsWn5e1G4ogqzdiCO7zEjo/6qk5YhNobdSLxTNvK+jsbBlZKed/Z6q2Gy0r8dQWlU
	 DCpR8e21XiRlnTqiOH3YJQspQNwgEoN7T31qw01AqySRJN4FM7dU3lqULPhmcJF9Bf
	 ty6kpq641GX/F2oigJsIuJmXc8MXayTqW9Zjn8ubv0vqeQx33lf2OjurqC8sfZhnEz
	 p7laVElZPmgDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E8BC5DF81;
	Thu, 20 Aug 2026 11:17:39 +0000 (UTC)
From: Muzaffer Kadir via B4 Relay <devnull+muzafferkadir.mainlining.org@kernel.org>
Date: Thu, 20 Aug 2026 14:17:17 +0300
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-msm8952-pinctrl-v2-1-bf2b8b7b379b@mainlining.org>
References: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
In-Reply-To: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Muzaffer Kadir <muzafferkadir@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787224657; l=6597;
 i=muzafferkadir@mainlining.org; s=20260816; h=from:subject:message-id;
 bh=v1aIRJCdrsRTYIg1X3g+3LeLCUUm17SThJUNiJMsC0E=;
 b=dNziCrJzuZC7usaIl7XyuhDZ+vVWdScBOY1MGmDJnpd2IRbDiF20kTu6CAg1JETo0Q5tgBCr+
 /tGOYkyrY/iCgoMyAlrDuCEBd4jYS0an8zTKXYjpZlkfGsH6e0G1vi7
X-Developer-Key: i=muzafferkadir@mainlining.org; a=ed25519;
 pk=4zkv4suQ3cYcO4Z7CrV8JSSjEGLBGepUtvQCFjgnYIU=
X-Endpoint-Received: by B4 Relay for muzafferkadir@mainlining.org/20260816
 with auth_id=954
X-Original-From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Reply-To: muzafferkadir@mainlining.org

From: Muzaffer Kadir <muzafferkadir@mainlining.org>

Add device tree bindings for the TLMM pin controller
found on the Qualcomm MSM8952 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
---
 .../bindings/pinctrl/qcom,msm8952-pinctrl.yaml     | 155 +++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8952-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8952-pinctrl.yaml
new file mode 100644
index 000000000000..c4ba5169fbaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8952-pinctrl.yaml
@@ -0,0 +1,155 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,msm8952-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8952 TLMM pin controller
+
+maintainers:
+  - Muzaffer Kadir <muzafferkadir@mainlining.org>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm MSM8952 SoC.
+
+properties:
+  compatible:
+    const: qcom,msm8952-pinctrl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 61
+
+  gpio-line-names:
+    maxItems: 134
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-msm8952-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-msm8952-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-msm8952-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-2][0-9]|13[0-3])$"
+            - enum: [ qdsd_clk, qdsd_cmd, qdsd_data0, qdsd_data1, qdsd_data2,
+                      qdsd_data3, sdc1_clk, sdc1_cmd, sdc1_data, sdc1_rclk,
+                      sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ gpio, blsp_uart1, mipi_dsi0, blsp_spi1, smb_int,
+                adsp_ext, blsp_i2c1, prng_rosc, qdss_cti_trig_out_b0, rcm_marker2,
+                qdss_cti_trig_out_a1, blsp_spi2, blsp_uart2, ldo_update, qdss_tracedata_b,
+                pbs1, pwr_modem_enabled_b, blsp_i2c3, gcc_gp2_clk_b, atest_combodac_to_gpio_native,
+                ldo_en, blsp_i2c2, gcc_gp1_clk_b, atest_gpsadc_dtest0_native, blsp_spi3,
+                blsp_uart3, sec_mi2s, pbs0, gcc_gp3_clk_b, blsp_spi4,
+                blsp_uart4, pbs2, pwr_nav_enabled_b, codec_mad, pwr_crypto_enabled_b,
+                blsp_i2c4, nfc_disable, blsp_spi5, blsp_uart5, qdss_traceclk_a,
+                atest_bbrx1, nfc_irq, qdss_tracectl_b, qdss_cti_trig_in_b0, blsp_i2c6,
+                qdss_traceclk_b, atest_wlan0, m_voc, qdss_cti_trig_in_a0, atest_bbrx0,
+                blsp_i2c5, qdss_tracectl_a, atest_gpsadc_dtest1_native, qdss_tracedata_a, blsp_spi6,
+                blsp_uart6, atest_wlan1, mdp_vsync, pri_mi2s_mclk_a, sec_mi2s_mclk_a,
+                cam_mclk, cci_i2c, pwr_modem_enabled_a, flash_strobe, cci_timer0,
+                cci_timer1, cam1_standby, pwr_nav_enabled_a, cam1_rst, pwr_crypto_enabled_a,
+                cam2_standby, cam2_rst, webcam_standby, cci_async, webcam_rst,
+                rcm_marker1, sd_write, qdss_cti_trig_out_a0, accel_int, gcc_gp1_clk_a,
+                alsp_int, gcc_gp2_clk_a, mag_int, gcc_gp3_clk_a, gyro_int,
+                pressure_int, fp_gpio, blsp6_spi, fp_int, qdss_cti_trig_in_b1,
+                uim_batt, qdss_cti_trig_out_b1, uim1_data, uim1_clk, uim1_reset,
+                uim1_present, uim2_data, uim2_clk, uim2_reset, uim2_present,
+                uim3_data, usb_fs, uim3_clk, uim3_reset, uim3_present,
+                us_euro, atest_char3, dbg_out, bimc_dte0, ts_resout,
+                ts_sample, sec_mi2s_mclk_b, pri_mi2s, sdcard_det, atest_char1,
+                ebi_cdc, audio_reset, atest_char0, cdc_pdm0, pri_mi2s_mclk_b,
+                lpass_slimbus, lpass_slimbus0, lpass_slimbus1, codec_int1,
+                codec_int2, wcss_bt, atest_char2, ebi_ch0, wcss_wlan2,
+                wcss_wlan1, wcss_wlan0, wcss_wlan, wcss_fm, ext_lpass,
+                key_volp, key_snapshot, key_focus, gcc_tlmm, key_home,
+                dmic0_clk, dmic0_data, backlight_en, qdss_cti_trig_in_a1, lcd_en,
+                blsp_spi7, blsp_uart7, pri_mi2s_ws, usbc_irq, wsa_io,
+                blsp_i2c7, uim3_ldo, blsp_spi8, blsp_uart8, wsa_irq,
+                blsp_i2c8, gcc_plltest, nav_pps_in_a, pa_indicator,
+                nav_pps_in_b, nav_pps, modem_tsync, nav_tsync, ssbi_wtr1,
+                gsm1_tx, gsm0_tx, atest_char, atest_tsens, bimc_dte1 ]
+
+    required:
+      - pins
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
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
+    msmgpio: pinctrl@1000000 {
+        compatible = "qcom,msm8952-pinctrl";
+        reg = <0x01000000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        gpio-ranges = <&msmgpio 0 0 134>;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        blsp1-uart2-sleep-state {
+            pins = "gpio4", "gpio5";
+            function = "gpio";
+
+            drive-strength = <2>;
+            bias-pull-down;
+        };
+
+        spi1-default-state {
+            spi-pins {
+                pins = "gpio0", "gpio1", "gpio3";
+                function = "blsp_spi1";
+
+                drive-strength = <12>;
+                bias-disable;
+            };
+
+            cs-pins {
+                pins = "gpio2";
+                function = "blsp_spi1";
+
+                drive-strength = <2>;
+                bias-disable;
+            };
+        };
+    };

-- 
2.54.0


