Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A671385D7D;
	Wed, 22 Jul 2026 12:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722319; cv=none; b=Ztk42UztslhXhuy6l1wQ8SzkwNHohyF0zu7k4lW8Pkxvl48znVRBFjeB3hsq5P5QCPS1i3fcCKkDZB5tpWEnTKFIXm4znp2ku81oNzUPzZQ2e8Xxo+qxtoAJR08l9MNY4kgrU/qLcgeIiDCJCxdDQmLb7BD/aCQe/EddQkEGhz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722319; c=relaxed/simple;
	bh=Z1GnBoJFhlQciHigAQ0GIYROdiFc7+KkzY90/kPIztk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FDpPf4aqQbbCBjJsGUg9pWPc0/2lUV77eAMTwwhiqqQ8+Bf6Ud/ftRTSPadAKgYnBbLRBT/5XBZCXyIiNeg37CnMyibH0SacRphKF9s5NexBq1EZgtqL7ZVrJRzrK7ADNTQbuj0VkY0WScfs00GHKruc3VwpXG8SClgfnwngXao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hw/6deuZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hw/6deuZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x5qD140594;
	Wed, 22 Jul 2026 12:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6rxs7kqk9DJ
	mL6vhgNR7e1CxpZlb4ikP21eVc/uXsrY=; b=Hw/6deuZd7dJPEHQE1k5ECabPZx
	EZUUPH1rzhFiykoumH/1WC2Z8bqE/TTxUp++85N1bZ6tAzEOh9qF2Cy6A575bhEl
	KTLnQtS8gtR88i1pVDjbNmzVhzZZxtuBCj+6HgHn4gUjB6QR1xUxU8AEe3oPKuXx
	+eZXEudiYrywBdn4gfXlEaLHFLEJCTJf5zswGM+ctEkrcL/ibvWfW55Rz+wWX8xF
	C6IDjwsHUF/+7ufILjLlW7DAA+TGiDQf9AOLBcDBzIqsyB5Ca6L9adDcEhFaMXjn
	3cr+ytWKrTP+CfYPDrME2m2V1JbY6V0JirRttT2OKFt0h/tLFdY7ZhZWL4A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2rtty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 12:11:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66MCBhu4015000;
	Wed, 22 Jul 2026 12:11:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fgj54dv4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 12:11:43 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66MCBhXg014976;
	Wed, 22 Jul 2026 12:11:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66MCBgec014973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 12:11:43 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 89FA0C08; Wed, 22 Jul 2026 17:32:21 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 3/4] dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI pinctrl
Date: Wed, 22 Jul 2026 17:32:16 +0530
Message-Id: <20260722120217.3609506-4-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722120217.3609506-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260722120217.3609506-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDExOSBTYWx0ZWRfXx5XDx8UsvK/L
 oE9tHEthvtb3DkBvHeRktOqgUR/IGksBjpwLlo4YERfDs9DUuiT7el9hHQer8GgG8g7U9YeX7rn
 fuMeg2nQ/GiTmjIiX3f9ceYLiLMWn2zKGOSVIFYE0xl+f3678X6b7me9w7XikbrWPKzijOuvIi5
 ybUN3YJwIycjVakbYl2RC35iS8z/7LHWTYL+svM3sDBEJoy1ZDtDWOJCgSust6PO4WpMcB/btE5
 jY0F/+A7l5mVtpszKZwRclQAk7psn4ue2Eh9GgVB2O3dNCnD290yTpuQWZ6vcbm/frKq4v4vWLd
 iuNokkGc1+UrBhPPd0fLJMqzypnaKYQtnp8TdsUoNS9NZUanbChW+boVW8TKnVQCbIYYO9FPq5l
 VANO3DR+8EpGJ1+2D9edUReYnLsomXvLMjNPjb8Y2+4ON8t6ZJjdYUK9u4N1uzE+dh/jVCZlnz0
 T+rq5rBAkd8pwbOuFPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDExOSBTYWx0ZWRfX6X5TJPuT7Pfc
 RXVevkwijxFomn+z/kgxzmwOrxoY0GHKx/pfwUR8UhNTJneN0T/ezmAuOHNyl+WFxVQXQEthOVd
 lhMNprhTJ5NIC5nB9lH+IWbAId3vA3M=
X-Proofpoint-GUID: 80s5bk7vdWZ-ahUWZjnAJr8LshpdLGF1
X-Proofpoint-ORIG-GUID: 80s5bk7vdWZ-ahUWZjnAJr8LshpdLGF1
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a60b383 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=bT5XQOCXPleopHcqzpYA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220119

Add bindings for the pin controller in Low Power Audio SubSystem (LPASS)
of Qualcomm Hawi SoC.

The controller has 23 GPIOs (gpio0-gpio22) with functions including
SoundWire, I2S, DMIC, VA I2S, ext_mclk1, slimbus and lpass_lpi_dbg_clk.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml  | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000..af6858175
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,hawi-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hawi SoC LPASS LPI TLMM
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+  - Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm Hawi SoC.
+
+properties:
+  compatible:
+    const: qcom,hawi-lpass-lpi-pinctrl
+
+  reg:
+    items:
+      - description: LPASS LPI TLMM Control and Status registers
+
+  clocks:
+    items:
+      - description: LPASS LPR(Low Power Resource) voting clock
+      - description: LPASS Audio voting clock
+
+  clock-names:
+    items:
+      - const: lpr
+      - const: audio
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-hawi-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-hawi-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-hawi-lpass-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|1[0-9]|2[0-2])$"
+
+      function:
+        enum: [dmic1_clk, dmic1_data, dmic2_clk, dmic2_data, dmic3_clk,
+               dmic3_data, dmic4_clk, dmic4_data, ext_mclk1_a, ext_mclk1_b,
+               ext_mclk1_c, ext_mclk1_d, ext_mclk1_e, gpio, i2s0_clk,
+               i2s0_data, i2s0_ws, i2s1_clk, i2s1_data, i2s1_ws, i2s2_clk,
+               i2s2_data, i2s2_ws, i2s3_clk, i2s3_data, i2s3_ws,
+               lpass_lpi_dbg_clk, qca_swr_clk, qca_swr_data, slimbus_clk,
+               slimbus_data, swr_rx_clk, swr_rx_data, swr_tx_clk, swr_tx_clk1,
+               swr_tx_data, va_i2s0_clk, va_i2s0_data, va_i2s0_ws,
+               wsa2_swr_clk, wsa2_swr_data, wsa_swr_clk, wsa_swr_data]
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+allOf:
+  - $ref: qcom,lpass-lpi-common.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+    lpass_tlmm: pinctrl@7f60000 {
+        compatible = "qcom,hawi-lpass-lpi-pinctrl";
+        reg = <0x07f60000 0x20000>;
+
+        clocks = <&q6prmcc LPASS_HW_LPR_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "lpr", "audio";
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+        tx-swr-sleep-clk-state {
+            pins = "gpio0";
+            function = "swr_tx_clk";
+            drive-strength = <2>;
+            bias-pull-down;
+        };
+    };
-- 
2.34.1

