Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864247;
	b=ykilbEjk6sg5Lm1WEc+mUvpETLemxrF4mF55PfxPIQf35EuC3pPtXNUEW9tagCZsn2k5
	 klOzoojBdb+xG1Nh6TWdmg/2ZNQkO3Na2Ac+5jh/XYPhRzK7wBl3HQZnQPflAjpdy8EMe
	 9EJ4Jp/j021MqQXjd/4gTJq33gGnQlhnSClM/8kzCGMoqDVJahQ/TlHuiMon2qWevtazR
	 s3wlgK8Y7hUYJke+oU4DDNe0q1VQfwBXyCAwbqdQetZ9blShnH53466IBPtK4Es9bu4i4
	 oMaH4xngTrSKarLdX1rOvmhCtdDFYyY1uCmyKUk9I6/+k+2uz+3XaLcYcqQGP8nvwoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=YiJhcbJT66oVDoyRDFikbfJS2ELuP4QcgS7LhI0yagk=;
	b=JbSBmSeoADula94hhhtq/LlI9V4Zwqb7uHke4bKpjfOoWWspnsdqHAqm+JNuhj8PAC0h
	 TYKXVaV9IIpSoLXyTNKYC+eSm0tCXW2jMxRBM+yblnbcyb6YJDsMHyOIgTm/nd6AdVl8t
	 +JY9kad348CGr6VhSLGHnXebKAXESNwVFYr40po/l9ekZa4+tsP0feszUpK4n6qe8UVYB
	 yOS2bHgMlpZmNCEu4CIiyUKvM2QWi/j6sdYsRP6zoZ8kwB3ne56E+e2R7VXmJHLc4+k4d
	 hV1W4S98DM0Rf4HpP3gZZu2SitCZRhIU5uWHAj3NUAzhe7ClsgjAQ0rrb3yDkfXVXew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLOP5+uI;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED16606A338
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 21:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED16606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLOP5+uI
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so25892525e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 13:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864246; x=1795469046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YiJhcbJT66oVDoyRDFikbfJS2ELuP4QcgS7LhI0yagk=;
        b=jLOP5+uI8tp7EOhzdPoKf3RR4hYfKFwiu+DoiuTy9jYVtmI3EadznehT+T3SVaY5gM
         F2BSf3M/2yKYguM/PnlxyWdlBEi5vQm8CeclTqB630c009+N0sWKaUdeeLeXRs9LEW0g
         UrPwQvD9PgGNIVl5PuRjfFLlknpaBWekmi/s8Y9AVr3IzDXGe5zRfPNxxRsSTJbOU7cl
         C2V5k0FjxpXdG0CrGsGRN0fS4jSsV+ZQEtuS2RQ62vrtfbCzu7ndO2c5L989MLpT9aTK
         pCkA8DhAs7NPKAmeg68fNAbwGLJuevOnHdtDXKmVQ8bqP6AQfyfS+quPXqFU9VDx1h4G
         3vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864246; x=1795469046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YiJhcbJT66oVDoyRDFikbfJS2ELuP4QcgS7LhI0yagk=;
        b=nrJL9IJChx7KrWRjAKrnugOroMOaeO2JYujkCOlBVcj67u9zKWD8gQ2VCMOqTqwbd6
         qnO/6PR/ntLRPHb6C3eFU35Nqnj72x1S57vckHrJgvdrfADhwADfdO32MBWHOU097DxJ
         h5bTfzWr5u/M9XCNUhyQ1TtK5BbqUk+n7d8tVpBqrSkzS++bl/9e1EZSfFDc0P4kd9nf
         z3HKothO113g2LX76sBsl5VMykV0+XznftB/Es5hmkNKnSHdVjhUj9k0czCv7C2AYGm0
         BeIHpLhsyko3RvMxgLnTJxXwvghiXK1DN891zBVJqNVH+qx/vreYLiY6K8/1reLpis3g
         8h7g==
X-Forwarded-Encrypted: i=1; AL+hErE4sy7ChRYcGq0fXHtFKEaG3LJhQoxzcKhUw7iAxlaVe+C2qBO7M0HOZgNSW0Jv/c7h+HhpLJGmmNdq@vger.kernel.org
X-Gm-Message-State: APuU4Z9r+JVLC9tzswtno4cZ5vj1QAOMg6pAoXRpRM8QuJmmG8k6ZKCU
	RJUY59Kdgg0pdr675R2SjvCPSdCSzdaE6hQN8HOoKNnCSo+YEiXkLnj5
X-Gm-Gg: AYBFou2+6ruKhU53lZbZsHxBHovOPKSTzDI2gEwRslYzuEAoawrcKHxQR3Zbx41YU3h
	jKNL8hPuNDAqIWERlrZSvILPuW5F9cTvlW0aGmDlh+Mw3cGWjA1ycqHwcO2TjPD5QoK/7gyE/8q
	ahGte8/6skxv9qreeIwRJ+wTHwGeRLx2vG4ekIO754LuXKtmDB2lGgpDm9DyQ0gqX8SvkzHh6Vt
	0vFImFGpnNpyCtrxwkTCiGvML5xWMP7GKo9l+VGfYn6EnCqiyG8wYvhpnAsVrwqzu3iJmQ+bvRs
	ODmBfbmjhHZcKC2NeCjg2nspWZq2MLpXQPGwLUetG2uE6o5SZc9nEHx69nbLwp5PTWTLH2WkyYG
	svcwZSZe6GvmSMSt9Rd5/9LXIAd4qm7SjTh4FnHPweWjCzRbVAhR4FhFP07hPTPIpGWspobrSDp
	LVpcIvFKs/05SC6LlcRhXtvMCgkqu6orZhVJ3xFIANtkJLD/LGtlTXzmdkIldJAmlvezZpa9ZRV
	kuoqkJYsZSNbLCShaEz5W9JEO4QNcGdDK/l8BuaBjJctRV2JtdJpEECxH8k0JslVmgA6QTZjAkK
	qqr+XyfWV8IvAfqPj+AT0ybM8b7anzitbBt2+l2/
X-Received: by 2002:a05:600c:83c7:b0:4bb:6fd3:5aab with SMTP id 5b1f17b1804b1-4bb6fd35beemr88531665e9.13.1794864245820;
        Mon, 16 Nov 2026 13:24:05 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7839c5c3sm16520325e9.12.2026.11.16.13.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:05 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:23:58 +0000
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: document the Halliday Top
 Level Mode Multiplexer
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
Message-Id: <20261116-halliday-tlmm-v2-1-b4dd502ca142@gmail.com>
References: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com>
In-Reply-To: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864241; l=5978;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=eD3pLX+lZgbeo9Tpx04422KTE8fYYZNQEOny9L4H/zA=;
 b=+waq/GwUGFgrVOeyOYKVmxkaTpS95t3R9CH2qYCq3/E8eJpFGQgwdsNxVeF7GK0YJxFfUbpGX
 O0aOow5DLsADU9uUH3kncL/AEGQyg2WcvXwzlbVy05NHaPV6/Lrc4bR
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
index 000000000000..58aa6d10bce1
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
+    tlmm: pinctrl@f100000 {
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

