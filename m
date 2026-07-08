Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E073033D6;
	Wed,  8 Jul 2026 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511383; cv=none; b=RveKct2ModMb2jsuRau9QETmTuPxxNnOE9BDdboIyNbzREndHI5JY49IpAWdDpyHWWatGyZmXMvNf28g76cxfb1sQCCIXOWrmGFBwKe8Jhs/OTeM13Mwxryxz+SRlllMmcjFMXivr37jGMfaYbM9yj2w2bNVcdD7sih1i0Z09Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511383; c=relaxed/simple;
	bh=IxmMHGlk8QYVrm0sRclpevzaV41U2O/Tz4T7FD9aDlg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UEtln/4dO7hZ7C+ZuCOQMdDbCvhEiz8WZjV36SWBi2LFhSzLnz5kzQIsKq0vYMwPH4l59i56vegO+a4yv8ieT4twkWiIN9539s+tzktlE1uhE2aWf7hmAS36EKVXJMmiuLXU8FqxGtL2D3C2GeJoaBZ4ewI0ZnWV5p/BBqSXJTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U89SzbmW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U89SzbmW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BSmq12539334;
	Wed, 8 Jul 2026 11:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SmT8RyveJfh
	yP/PpXdzjE4NBjTlADskcP+xvISj7b48=; b=U89SzbmWsaBgS8nu28IVAcAIkqg
	hkX71VXwWSJM0PL7V+8SzWHY5F6xA3HRyJ79wRLuaaTWw+axpbsQNEcYq+QfyHUq
	uNyRppZ6Vtwur6gd6DwsKCbkoUWbKHs0PETKHAmnFokf8+5M8S/mrLXQWScrPILd
	S2mDqu7yU8i9g0cT3qB7wApYBPLyrHqqSdzx47d0Dtm83IRfAkXXbnL7PbG9uSJH
	FSbNAO/g3p/1/DzLnoAZWel8h4cHjpOO+41+giXGwR5yzTD6xN92zzC2S/af2TWf
	whc3Hr1Jas2O+KaExhbgs2jGCwHDAgxMuQsN34NfeM+ebDXJOZB5sA2uL6Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqw9bt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:49:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 668BnR1r026299;
	Wed, 8 Jul 2026 11:49:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4f6u8k3yjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:49:27 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 668BnRuq026268;
	Wed, 8 Jul 2026 11:49:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 668BnRrd026254
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:49:27 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 49A8163D; Wed,  8 Jul 2026 17:19:26 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
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
        linux-sound@vger.kernel.org
Subject: [PATCH v1 3/4] dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI pinctrl
Date: Wed,  8 Jul 2026 17:19:23 +0530
Message-Id: <20260708114924.1069239-4-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfX1mvLzj3yUn3r
 52jnlneC2ZJccsQJHoZepE1RH+cHMV1YC+FIod+V3GD/WRv6hTXKUpCCKQMSqfBKYh4/ZcASNU1
 dFZ4vZ05nf97Zc6AuU1w+638BznBz9sRbo+j9cNY78mNUbLKKLfRkVkHMo5dEi/AHteeHXOGisQ
 b2Im+Frv7Nm1iMOvQ7r1xKSOnv4fDww6c7kwD23vQFWgP1BnyG0wGa0K8v2n+kdzWhHxuRHgkjI
 LNHGSMzgUlmyz5DUvZHOkaq3aBbywDXxAGf8jUt/GyN5BNTb6dY+0Dc7XOa3BFMVOx5FFkDeODd
 JflS6d/fTzNovU9yMgCt0ASfw9QcsfbNUiRj9YzfhAkOqSHvj0wlPN8ACdOm7KgFQhrHxyGu1dg
 FmuRnLAMr6avuZsJwSuGwHj+k7hT6+wL2fekPRHndhjz3/ZmSiQFbtoHdeBYi62uqgyn3+OTwO6
 jAVu0zOxQviBloqftHg==
X-Proofpoint-GUID: _unp8GLzbvEpBVZ6Zlnnhq0Xm6F8zw1K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfX7jtPyCivujvN
 sRoVMqc9PD1T3S+jq/y1SCEIKwiyPIuBeftbxrnEm/DPTe9uIEwVabwOZunz97031DqgNva0fTU
 62hUp749c7X75yF2wpdhM932LxZuG0E=
X-Proofpoint-ORIG-GUID: _unp8GLzbvEpBVZ6Zlnnhq0Xm6F8zw1K
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e394c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=bT5XQOCXPleopHcqzpYA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080115

Add bindings for the pin controller in Low Power Audio SubSystem (LPASS)
of Qualcomm Hawi SoC.

The controller has 23 GPIOs (gpio0-gpio22) with functions including
SoundWire, I2S, DMIC, VA I2S, ext_mclk1, slimbus and lpass_lpi_dbg_clk.

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

