Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184127;
	b=fBc4AuSnM9NHA86tSLb5982TXmWUTWoeO6gAJHZ6/pXRY/ttB/feFFX0U/u0qCSAFx7Q
	 0Kd5hnEXFAR5xLzXU5TNHE8XqKYQPCWvsC/llhb/m6WJkKFLsc/RYEIA35VS29j12u8AO
	 y47o6p+k3bXr2wOaKdXNvxUAc1SFW6PxX3r+V3KbNStOYpmt4Ir5+HELFduH04HnQzRRq
	 dxhh3Hb4WTPJAwBAq5/GVuK/usU3+ovypg/TqXBRAbFu54EazseX44rS8mEUKdQaUDUCt
	 CsULUPbK/cYSYPT24x7iiO/Tp+hqd0LZbv6pFy61rmj05jEoLl2NArZIYr+ebRKCg3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2CZ2W+FwZtB0njIn3FCn/JS7jnb+oXPr0gBpjVo1AC0=;
	b=Luv5EHMk9XEE3cAoKuWUOS9skhLnH/7/TIGIgWF2/ZmcfX7w4BhACLYooEw0/IfSAv3m
	 oAyjaw6caBYhRxjp7EyoyH8pEwM8lZ9UIhQDajcIJQwRt9OlWYLDBYYOQQQ6b3/R7fin8
	 brHVW6kWsuZvfWdc7p1t3F6wIH6Tty7SFc/Y4xNdq3Je9DksQfGxeX4MBkxOCM7pbQrvg
	 9LbeUVxYvrbcSsu3QBgsHkRoHKjbMRZbS8I9Fs9627Wq/VrVc1K00c0wutLq/jvx10ZNP
	 sNDC+FPjMGV5V4+AQ5llfnHUIK9FUKVAqSO22u7RiYM0Hi3p4h5QLIr9BZi+4sp8bzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VozrAUCC;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EF7606A336
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 00:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62EF7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VozrAUCC
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4922523d1afso151575f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2026 16:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184126; x=1794788926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CZ2W+FwZtB0njIn3FCn/JS7jnb+oXPr0gBpjVo1AC0=;
        b=VozrAUCCrlumMsUMuHo4TEKi3RjpViePUhLV+6ID5Mj2LSnoQwmCfOecgz/wADuJee
         XM5oZXPS/DgjtdwE2g9LMZFndScws3MdNZeQYfjvGQfaLu7Ur58/FFjtKp9iZBVj2J6/
         iAtUoPs74sCcPvCZ4KVh1/08EVC1W8TT5UIMfjQBfKt4kIaukNYlcryHjfJC4lZ0Ce8H
         UaCt6fsaLRCl0oeL+hHZTq544aVb/RE1NbzE6naVMmus3eiTPIWimZ2B+oG1Cr1pQzQ8
         PdnaS4NJzIoxaiZ4uLOU2lCTnGt6xf1/9j8i97OeqtRF0LE9fLhNbt86EP0gVq1RwiSH
         Y4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184126; x=1794788926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CZ2W+FwZtB0njIn3FCn/JS7jnb+oXPr0gBpjVo1AC0=;
        b=XS7fK4IL7mrgGYxBj2CDaYeMoCBdGAVAa9+vRKdZs91OqKINwoJNpqLoNNtpNyWtHr
         2BPi4IFM6F6ni0JO3enKG8d55cqSoIospAZnsOBmX6K9E6A8vDTU7icow7V8QrloD9Nf
         8VsBp/ujVgry1HiK9q0LgtjYXc6hl4ZDvWyJPO2Q3Zl4U6N9q26R4+YsqKQeaA7Snz4f
         WHiCQOQex/unTZVBgt2XuNyQDLyBKUsxEojU8sI/m2HnWKwPv+ffLYsV8ZJODGuT0o65
         6ddKRj0s5YOtfVj8d3Omkh4nLtDODVUTCmKg704y4PosZ3hCyBB7Q+SpNX3aWmJlYQW9
         I1jw==
X-Forwarded-Encrypted: i=1; AL+hErEgOb7F6WgWd1ZNkhhKIBIN9WUUB96LnsKYb9zegm6KyAfeCEzdsKaDSK5b0N08Z/DQT1NQFXyEzx4f@vger.kernel.org
X-Gm-Message-State: APuU4Z9XVndgIi4UbEAxXmjDm88ADZrPOFFu21ibHXM4Pdd6tFCVjX7Q
	Al7K5lZZrdJ+tWUJ9x1OmGCjfuwfl9TVrfV6LRJ2+NCCkocvLK6Kpr8Y77VEUNj3wWk=
X-Gm-Gg: AYBFou1Cr32ZkObPIGQ6dQw7h6HJogXJ9I17Bb6l0gMiizpCpam5MbLGjzScXnAiUxw
	Y1fI5hvhLE3DRDEiJh9e3Qsts7ZFwMC0jzqOKGWp0UrQTqtldwGtxrgfNgg973+gDmLezNHQdS3
	FufiRJQlO9BmFbxNDJZjmJ8LUXywRqrw7YBXP2otK/jZpCLaPdbxrBiVHLlK4UJ+J0Cot2VeRVn
	BVrI8IS/7CByJxW4MfrkVJiA/SXLujuMYna1bHgjHmjOZaOQmkSvfAvdJiPFYzaonsRbZwKaHUy
	JFGXOAyKBTg9Np1aI+hbb4AyWDpnr+X+ibW1d58xXTP+GBNbqw5vDBsHxTpSrYWhgjdyGHxVzAi
	F83yvcFyDsEDWq6IIPFFPa5MPqrS3HNLbYIJgcsr1qMRslkjlM1Q4+ECsld26uQa/yRi6QvJRKZ
	Gr0w8SruPmYGSY0EoKmZawP6O+QGBnQT0fotWWZr7pCnVnDdWWGs34yy2vvN25mRPytRRLxOUPS
	tKCGIy3bT9va/DuSAGHVbG7sU8njZmDYoK6gtUpUkP3W8Ta/PJZ6WLvjMXIziAjz0cYykKG7QW4
	k3LTrNtiANAyum1dfKLYEWCFoV0MrLSD+t7anHfH
X-Received: by 2002:a5d:456a:0:b0:491:a219:8506 with SMTP id ffacd0b85a97d-49584599738mr2961808f8f.48.1794184125902;
        Sun, 08 Nov 2026 16:28:45 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49673b94dc1sm2688388f8f.16.2026.11.08.16.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:28:45 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:28:37 +0000
Subject: [PATCH 1/2] dt-bindings: pinctrl: document the Halliday Top Level
 Mode Multiplexer
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
Message-Id: <20261109-halliday-tlmm-v1-1-a181d54214cd@gmail.com>
References: <20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com>
In-Reply-To: <20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184120; l=5972;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=q9T+NC4u9aHo09uZQiFW4fqfa5/Pc9nEwP44Okd4IDE=;
 b=EIHF9+Jd+cvdDl1qjO09afOx5BezUxOdifmNW9CWb/F63EEW94qnlfIxEliEUpuoOHF6MxgSl
 3j+6rojxDnsBEJ/eA8tJbuR65OnARPKDYOupJWZ9yNeAW0K47kacfDZ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Top Level Mode Multiplexer on the Qualcomm Halliday SoC
(SXR2250P).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       | 146 +++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
new file mode 100644
index 000000000000..172de2d98997
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,halliday-tlmm.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,halliday-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Halliday TLMM block
+
+maintainers:
+  - Stanislav Aleksandrov <lightofmysoul@gmail.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Halliday SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,halliday-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 112
+
+  gpio-line-names:
+    maxItems: 224
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-halliday-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-halliday-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-halliday-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[01][0-9]|22[0-3])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ atest_char, atest_usb, audio_ext_mclk0, audio_ext_mclk1,
+                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c_scl,
+                cci_i2c_sda, cci_timer, cmu_rng, dbg_out_clk,
+                ddr_bist_complete, ddr_bist_fail, ddr_bist_start,
+                ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp0_hot,
+                edp0_hot, edp0_lcd_self, edp1_dpu0_lcd, edp1_dpu1_lcd,
+                edp1_hot, gcc_gp1, gcc_gp10, gcc_gp11, gcc_gp2, gcc_gp3,
+                gcc_gp4, gcc_gp5, gcc_gp6, gcc_gp7, gcc_gp8, gcc_gp9, gpio,
+                i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws, i2s2_data0,
+                i2s2_data1, i2s2_sck, i2s2_ws, ibi_i3c, jitter_bist,
+                mdp0_vsync, mdp0_vsync0_out, mdp0_vsync1_out, mdp0_vsync2_out,
+                mdp0_vsync3_out, mdp0_vsync4_out, mdp0_vsync5_out,
+                mdp0_vsync6_out, mdp0_vsync7_out, mdp0_vsync8_out, mdp1_vsync,
+                mdp1_vsync0_out, mdp1_vsync1_out, mdp1_vsync2_out,
+                mdp1_vsync3_out, mdp1_vsync4_out, mdp1_vsync5_out,
+                mdp1_vsync6_out, mdp1_vsync7_out, mdp1_vsync8_out,
+                pcie0_clk_req_n, pcie1_clk_req_n, pcie2_clk_req_n, phase_flag,
+                pll_bist_sync, pll_clk_aux, prng_rosc0, prng_rosc1, prng_rosc2,
+                prng_rosc3, pwm_0, pwm_1, pwm_10, pwm_11, pwm_12, pwm_13,
+                pwm_14, pwm_15, pwm_16, pwm_17, pwm_18, pwm_19, pwm_2, pwm_3,
+                pwm_4, pwm_5, pwm_6, pwm_7, pwm_8, pwm_9, qdss_cti, qdss_gpio,
+                qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4,
+                qup0_se4_l0_mira, qup0_se4_l0_mirb, qup0_se4_l1_mira,
+                qup0_se4_l1_mirb, qup0_se4_l2_mira, qup0_se4_l2_mirb,
+                qup0_se4_l3_mira, qup0_se4_l3_mirb, qup0_se5, qup0_se6,
+                qup1_se0, qup1_se0_l3_mira, qup1_se0_l3_mirb, qup1_se1,
+                qup1_se1_l3_mira, qup1_se1_l3_mirb, qup1_se2, qup1_se2_l3_mira,
+                qup1_se2_l3_mirb, qup1_se3, qup1_se3_l3_mira, qup1_se3_l3_mirb,
+                qup1_se4, qup1_se5, qup1_se6, qup1_se6_l0_mira,
+                qup1_se6_l0_mirb, qup1_se6_l1_mira, qup1_se6_l1_mirb,
+                sd_write_protect, sdcc5_vdd2_on, tb_trig_sdc2, tgu_ch0_trigout,
+                tgu_ch1_trigout, tgu_ch2_trigout, tgu_ch3_trigout, tmess_prng0,
+                tmess_prng1, tmess_prng2, tmess_prng3, tsense_pwm1,
+                tsense_pwm2, usb0_phy_ps, usb2phy_ac_en,
+                vsense_trigger_mirnat ]
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
+    pinctrl@f100000 {
+        compatible = "qcom,halliday-tlmm";
+        reg = <0x0f100000 0x300000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 225>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-wo-state {
+            pins = "gpio1";
+            function = "gpio";
+        };
+
+        i2c-w-state {
+            scl-pins {
+                pins = "gpio58";
+                function = "qup1_se0";
+                bias-pull-up;
+            };
+
+            sda-pins {
+                pins = "gpio57";
+                function = "qup1_se0";
+                bias-pull-up;
+            };
+        };
+    };
+...

-- 
2.55.0

