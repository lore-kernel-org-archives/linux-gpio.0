Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD0C41D214
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692800; cv=none; b=Fczss6B9L6FWJbwHNzFeP69SBsAQXWIhZSORBPH2NAsFFhLlToTGERaizrCspazRxEOb5FuE2CbjN+FPk742QAO/dy4phUacWBhtuQ2yc2yoo+1GJ30VctWlSCxNxeAJsYu10kt4/FzbJ3essuPULArFOOyprGoZpXb1NhR5ZSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692800; c=relaxed/simple;
	bh=4z/M2eUF++qMVVESopEVCO5xHLKHISN/jqlSOg71SV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0c3raCqvIZi0VdIxBNLpSBsmw8om+97Vt++mm7iYBOkSjcffFtA1FbeKGJqPUUXYaYKaLrvvac9e2xWK+zl1Zi24LTAl+aEJ6t3GAD6/ZS7bVQ+9Zo4kqO90hnIuHNHnqwvEDeAEhqQqUE3y/ETvAjw/aOLHl7TmTFqZUBG31M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JO7d7EFR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJX4ryXt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JO7d7EFR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJX4ryXt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QXs6282841
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3v6CEl22R3ZSvcqUczYoW5Tyuq2qb91XkxugMVwZ7o=; b=JO7d7EFRu2glBHAw
	bAN6yPdczbHuZT1pSDgP9hlRmEqT6vOP87+s8dHg4552v7Tk12oQLe0lIqbF4eKM
	op+GKvuYKB930gzHJ6FFgNUaBYrN+6lNPQJZih9uHF0xsuFfopszmdtxghveuzSe
	hgfC4jWrQsut9KLyUIJdFiyWKgoutmhpI7yCaQ1gUYaRUCBoe63lBNjHxHa43A/5
	fzysoF61a8zX/XmeAowlHubC3SrUHYe6Zi7suXXBP5Ly5q3DtG2VxR3/Ze2hVHQ2
	zWbBRU/2DtMYNstHb+mhw10DjMJw/b9p2FXY7wWP0mjywQCbB0PXYdNo0FXzQdkM
	w/WPcg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h90u5m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:33:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so1105660a91.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 00:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692790; x=1787297590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3v6CEl22R3ZSvcqUczYoW5Tyuq2qb91XkxugMVwZ7o=;
        b=ZJX4ryXtAEghn+R46jGvq936F2ElKD/9vZ0A7Nkxx9x5YhrVSRpG4cxBqH5ZlDl0Q9
         EFIcU9qxdov9TUNI0JR6jFxhmpdHSj0v6rOEImQe+B5QkD68lBEj+E8OtOUzSTjqp7LD
         tgDt23wUFWbhwBSQqCI3NdV0wlsVpBss5oXM6gAP97aC3kE/3XGxzi1Iz0m5E7Nzyg7D
         g6w6bqUb2ZSMqJXQMfDHgf2kBqViTd0WRM7JLE77M38pIOMMVepTqEgbWYRoBFz3zhDs
         9JgUvsBBkSy89tHsm13vYm866z9cc7/QkN8I1DdE2Ce1rWOFISkTbkMbMmTBeHt4ZyXK
         GC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692790; x=1787297590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3v6CEl22R3ZSvcqUczYoW5Tyuq2qb91XkxugMVwZ7o=;
        b=ByLIW5/Q3RucGXYGKNQMqGgfp6BOaWGlkEj/kYPSe1boAV54w3okgYbrcF5xszZJmy
         RQw31dxZHzxwvfLGWN2dHY016kSyjgfn9w4pIHvqjyT8NmRRLgkwCZjZLu4+df/izvI1
         mrFrLtOqO7UbzEla/MNhSNUSHKJ/qh+6AKrqAY2h6P+6WvSmvsaPPSTEQ6m7XHzDE0oA
         ZRUz6HYMvksqpHyv27OP/2f/+HLBiEJWH96LeLpAAzB5ZRi2nFYWYpxcLxhs/LQ3G6rJ
         M5LQYtXQlLHZOTn6gMwT7SGzCOnVepRUWB/h+Xs6wNVk9MijWk1nYaP9xaSFD4EiQx33
         QzCA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1YhFQ2wCKwMB+wfWtuW1DQQsW8X7fuab9uAihLoZS79ss1EO13FtZkNNO8CwmlEAxpf6Yu1GjfGBd@vger.kernel.org
X-Gm-Message-State: AOJu0YyqydKHUJ1WXyZWV1g61ccwbNccpP6UhAvGAmbK8zIblboezDgj
	un7XUkkgF7G87DTFgaHZJMtJgeS63W2CREsvBdUGsi5JbMVVtjd7VwwqiIxKhwVaf2xBA1SlbtD
	5bmY9fpLbp1GNR+8RvmnmFssX3H/hs0LzFz2GXmKFl+lI6grJhqjWd0w0uYtOkNxz
X-Gm-Gg: AR+sD12dv0lDMzSFb0Ym9emsIGu7mdQERRYWxojVvddX3bMIiRaKyNAyXJTcPixioQo
	9z7br/8j5letG+rBPk/HfnuQf/32TG7Pd9kYLU95kGACQH/yv0n3T0AJj888ztlb8BVPp4BCylQ
	umfC5mR1/93fJqPhQPehyr/rjICVZmzLkCQiYomd1tRjf2yiQi1+FEpWYQtmW6pT3qJvVWml4BQ
	EfJl6f6NEkf2BOj37jCmOSKyTNIKe7uTbOWBJ+kIrNI62pmDyGS6ezgvt0fBpu6Bcm8WmsM8wcF
	1rG57KgSm8dK/DrGrqNDXRQIrN7PYlaS/MdWGEbEhnXiR4YUnLsYbzNoNpFA4UuTcae2Jde9ZmJ
	kQ/xf2HmSPvSSM2YgwHitj58pQ7LqhD7K70J31zGXHsVE0NY4GM0KD+rwvNWw8CiOlT4F1Y2grh
	Lbgbn60zTfrnLB5S0XfMqlzAs=
X-Received: by 2002:a17:90b:1f88:b0:392:c868:35af with SMTP id 98e67ed59e1d1-3933bd46d96mr4390028a91.20.1786692789841;
        Fri, 14 Aug 2026 00:33:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1f88:b0:392:c868:35af with SMTP id 98e67ed59e1d1-3933bd46d96mr4389986a91.20.1786692789380;
        Fri, 14 Aug 2026 00:33:09 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:08 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:39 +0530
Subject: [PATCH v2 08/15] dt-bindings: pinctrl: qcom: Add Kuno TLMM
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-8-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692714; l=3960;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=4z/M2eUF++qMVVESopEVCO5xHLKHISN/jqlSOg71SV4=;
 b=hEeDgEgfigIgPHtEobpT5LzskiygxdZVnX2CdaOAWLjSjBFijGbnfdypOdmfi+V70J0wZrgYV
 9Uxtp4FCfLTAxs6dYTuBNUJPLrrVOKEgljY70GNM4h2fQK31poTO2zu
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=Ovh/DS/t c=1 sm=1 tr=0 ts=6a7ec4b6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CaveSyEksWnKhASb3GUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX1L2JQgPIch/o
 9BOmt4JIdB2n0t8U1j3776R7KYz+g+2hpuY3swuF/yeEI5cwR0cwMb9mW2eXhPpuOAoGYZdpXir
 r5hsRMiYzD9M30Gm3MQj3Zmm8ilzpak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX8F+bJ5DvgphE
 IS8t1St/XcqjMvoz8TXUD+55rvk1ZMjPiagVQpFMke5F1V6Rg4bMiJmetNozuQVc8oGy9d7bZNP
 4lpqIhuhd34etQggjxs/1ZDwbrM8Pm0wsQd6WnPX5pCTMS62nfJTalEACgdV8GdDb3g1+dVBT2A
 KRjwOgZryRs+fPhnPeBPc9tz63aVvNMTYRwVZ9MsgElQUmeMF17Pb3zOwlY6vd8S/QZZyEzXjkx
 ZMaPcyqsyP1eCRA39nuB+aQfNANf5+kbD9BFisSI5/q8A9nu4KckLrRV6I7Oc0JtmPo9S6y/5QB
 5ffmerSxg9BdyUuFTReJQ6nXHbAa6kwZyZDEIrAhoJwcKe0fFwWQiEouCC0Y2oDD2LCatuz8VuF
 fVFi63KsmCyRKdXudQlRaQO8u0MXC2vlSq46E2/LwiyFcxjFPw4itTFTX48t/tUkhfP/3sxCkZB
 o8oBe1ogeijDmpJbbrw==
X-Proofpoint-ORIG-GUID: o0F4wc5FkaJ4MKFZkGB_5grwb_RhOX5k
X-Proofpoint-GUID: o0F4wc5FkaJ4MKFZkGB_5grwb_RhOX5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Add device tree bindings for the Top Level Mode Multiplexer (TLMM) pin
controller block found on the Qualcomm Kuno platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
new file mode 100644
index 000000000000..6db65d2e1c23
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,kuno-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Kuno TLMM block
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Kuno SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,kuno-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 55
+
+  gpio-line-names:
+    maxItems: 110
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-kuno-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-kuno-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-kuno-tlmm-state:
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
+          pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9])$"
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, audio_ref_clk, coex_uart, ebi2_lcd_a,
+                ebi2_lcd_cs, ebi2_lcd_reset, ebi2_lcd_te, emac_mdc, emac_mdio,
+                emac_pps_in, emac_ptp_aux, emac_ptp_pps, gcc_gp1_clk,
+                gcc_gp2_clk, gcc_gp3_clk, mi2s0_data0, mi2s0_data1, mi2s0_sck,
+                mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
+                mi2s_mclk, nav_gpio, pci_e_rst,
+                pcie_clkreq_n, pll_bist_sync, pll_clk_aux, qdss_cti_trig0,
+                qdss_cti_trig1, qdss_gpio_traceclk, qdss_gpio_tracectl,
+                qup0_se0, qup0_se1, qup0_se2, qup0_se3_mira, qup0_se3_mirb,
+                qup0_se4, sdc4_clk, sdc4_cmd,
+                sdc4_data, sdc4_tb_trig, sgmii_phy_intr, spmi_coex_clk,
+                spmi_coex_data, spmi_vgi_hwevent, uim1_clk, uim1_data,
+                uim1_present, uim1_reset, usb2phy_ac_en ]
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
+    tlmm: pinctrl@f000000 {
+        compatible = "qcom,kuno-tlmm";
+        reg = <0x0f000000 0x400000>;
+        interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 110>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        spmi-state {
+            pins = "gpio78", "gpio79";
+            function = "spmi_vgi_hwevent";
+        };
+    };
+...

-- 
2.43.0

