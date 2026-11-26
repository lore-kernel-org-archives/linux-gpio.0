Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795711920;
	b=PZgiKxAOG6ZjkjfA83xBmtEC2IVfL0rfi6Cwj2HMDFRthQEYOK1Dec8htRl5IgczcNJv
	 6ZILi4B/4r+9+GsiRKr0XdpuGHQ8eu1VQ3HtPsvvGvmPZARpQrOJBpMvze2J5WwJE8JjT
	 OlZs4vH44CaHB7RvBqvI7lUqkNFzHWRWtElpeIT+f8XuDR2E0H9YaY4XImN8wkF3nGebz
	 ZfGGE5m2H4Ubq7lXrYcC1fMJLWsyiPCoUpD9YMInK4t6rVSct/0fPSPI3Cei3UM/cXO4s
	 7WI/pCTvQEba+y49cXgeBzFmG/R3t92t1OAs9sVsaPb2xfEgSDsVCbKy1AG1DletkLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711920;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RmlFWA8nPut+Bu1ZYB7NdKup3Adbm/NTN+AtpDTKVlA=;
	b=zebP6S0p/4lh43MVgaHGdeZNp3oDqiq9KiMCmf8U4AfxBkjA5NIBX20YA8tgUWby0tlo
	 piBW4/FPVpL+cN6CiEGbVG7sfIZcnzxH33fjOFOEMbEL8hME4dPs4SwXA40L5OTcR1vm9
	 YXI5dpD9txEzVORkwgkdfgDxmQ7pYojaks3ZGls2ZokZ/MjSBJ95xgjS2euflGmJhq6YJ
	 x9iHXcinrBcHPEcY7aa2iTLCPrAhysfm+sGNEVkX9LTIkm+UGVprFfxoN+NMJ28dl+tVk
	 r/oX2Btv/FAET6EMKUmyugNh5OrLG4OcYL84sy5VoHVa9h6vIMqrwldd4EXH+gQIlpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4Vs9xzi;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1BD606A32D;
	Thu, 26 Nov 2026 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4Vs9xzi
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795711919;
	b=BEmQ8SnQ4T4jjN3ZNEQcQ37FZfISt7kSSJcG8z4sNc7y+x4AH2MxCrutDH47pGqws4ml
	 g7Tij/fjlrQnWN3aiEa7zEYGhEvuatFXnBSN1mmdXMGxwHi0wnl/hKB1Efp5/AMQ48JuS
	 qnMmO07/HfPmjTH+t2fD2fUjaz3Bk6AUSy2yt4w/xefBXYk8krrQOi/X2RNoolrzxfEqy
	 qB0wPcwRl8Kt6M5Bxo52a7jAlML0cq6zvsLuTJQ93+ovwBnJQFvLqaWoOL5m/Vrap9NR7
	 avFR1G6sCs64hf2RAEeSuZgPHgwMAl7PqNZEzm0+lmGcRo7GB8zj5BhhuqPKh4PgVVg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795711919;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RmlFWA8nPut+Bu1ZYB7NdKup3Adbm/NTN+AtpDTKVlA=;
	b=RFeVyxPPCbXVzw+HJ29GtR1JexaP1UGKDJi4azVdIvmCiu4SibRkzIvg8j75eqBUESs5
	 9T44dcF5onqLZjs4vcoTQkhXr4g/gcaiI8BSmnKYDviawy6eVXVDjJSTdrgrtf0MfuemK
	 mnzKXnD8ph3SULEerLksu2oD4HR+XCwzgZ75Wg/w+G3T0y2sd1nY2HtZZag8YrRP5chle
	 Xx7Ek3NhvqTP/pG5yFMNrLxQg282jKUp0fYWMyqLTNvaON39hGhiy7fsUtvfFDFQkdRft
	 rO2jCQR8PXV2QeII1CaXJguu5Jlibp+ylDmGCSQDCrXOl6yEtOsZeha2TPoCd9VWxnw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E49351F000C4;
	Thu, 26 Nov 2026 16:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795711919;
	bh=RmlFWA8nPut+Bu1ZYB7NdKup3Adbm/NTN+AtpDTKVlA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=V4Vs9xziAOfs/4GwPdVOCwH16g9JZzNI2+yIiwMqJJkndQcbdcdSMLcGFiq+WhA+A
	 oL16D3GWpTVxxTubUnntIgQsR4cKSq/EqT3oxm8Kk1ioy7fs8MgCflmEjDu41E18ym
	 Mp5lGUpmbN7GmSHW+/JwYcVevCEpCGRwedQxxxcN1KC4jiwokKMopz+thYhA4wMNfY
	 OgI17Q7pSaN39vEop/KsaE/6lJ4VloPEvYpzhkparTbHwIdJMtVkz6AIqAbTBZokON
	 /Lc/1cNalUdxg3ViPNrdZ+I05Vtyxcht1b1Armu9kxmkHg3+FTMB9oFFfEOWvnF9ty
	 P5GlB5XkV8Bwg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6DC724D731;
	Thu, 26 Nov 2026 16:51:58 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Thu, 26 Nov 2026 22:21:57 +0530
Subject: [PATCH v5 1/2] dt-bindings: pinctrl: qcom: Add Molokai TLMM
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
Message-Id: <20261126-molokai-tlmm-v5-1-ada44435bdd3@yahoo.com>
References: <20261126-molokai-tlmm-v5-0-ada44435bdd3@yahoo.com>
In-Reply-To: <20261126-molokai-tlmm-v5-0-ada44435bdd3@yahoo.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795711916; l=5643;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=07NxyJj6byfV/chTiCSs0aVHTp28yRKPsTfaF+2gz3Y=;
 b=2RPqHbbunoaX+wyQ6XjF5cTTRpuLH2yCXb946b6jZKP9hluG6jPuvw/ZjOFa7GSWBJ+W3NNW1
 Wf/O1PeWmz+C1bvks9WbfZcSNmsCu24vrH8KfJsfzHa/l7oUjckwWGe
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Document the Top Level Mode Multiplexer of the Qualcomm Molokai (SM8845)
SoC. It is a Kaanapali derivative, but has 205 GPIOs instead of 217, the
SDC2 lines muxed on GPIOs instead of dedicated SDC2 pads, and a different
set of pin functions.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 .../bindings/pinctrl/qcom,molokai-tlmm.yaml        | 129 +++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,molokai-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,molokai-tlmm.yaml
new file mode 100644
index 000000000000..a93ef0abb1ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,molokai-tlmm.yaml
@@ -0,0 +1,129 @@
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
+                egpio, gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0, gnss_adc1, gp_mn,
+                gp_pdm_mira, gp_pdm_mirb, grfc, host2wlan_sol, i2s0_data0,
+                i2s0_data1, i2s0_sck, i2s0_ws, i2s1_data0, i2s1_data1,
+                i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist, mdp_esync0_out,
+                mdp_esync1_out, mdp_vsync, mdp_vsync0_out, mdp_vsync1_out,
+                mdp_vsync2_out, mdp_vsync3_out, mdp_vsync5_out, mdp_vsync_e,
+                nav_gpio0, nav_gpio1, nav_gpio2, nav_gpio3, pcie0_clk_req_n,
+                phase_flag, pll_bist_sync, pll_clk_aux, prng_rosc0, prng_rosc1,
+                prng_rosc2, prng_rosc3, qdss_cti, qdss_gpio_traceclk,
+                qdss_gpio_tracectl, qdss_gpio_tracedata, qlink_big_enable,
+                qlink_big_request, qlink_little_enable, qlink_little_request,
+                qlink_wmss, qspi0, qspi1, qspi2, qspi3, qspi_clk, qspi_cs,
+                qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4,
+                qup1_se5_l2_mirb, qup1_se5_l3_mirb, qup1_se5_mira,
+                qup1_se5_mirb, qup1_se6, qup1_se7, qup2_se0, qup2_se1,
+                qup2_se2, qup2_se3, qup2_se4_mira, qup2_se4_mirb, qup2_se5,
+                qup2_se5_l6, qup2_se6, qup2_se7, qup3_se0, qup3_se1, qup3_se2,
+                qup3_se3, qup3_se4, resout_gpio_n, rffe, sd_write_protect,
+                sdc2_clk, sdc2_cmd, sdc2_data, sdc2_fb_clk, sys_throttle,
+                tb_trig_sdc2, tmess_prng0, tmess_prng1, tmess_prng2,
+                tmess_prng3, tsense_pwm1, tsense_pwm2, tsense_pwm3,
+                tsense_pwm4, tsense_pwm5, tsense_pwm6, tsense_pwm7, uim0_clk,
+                uim0_data, uim0_present, uim0_reset, uim1_clk, uim1_data,
+                uim1_present, uim1_reset, usb1_hs, usb_phy, vfr_0, vfr_1,
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


