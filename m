Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2AC379EFF;
	Fri, 21 Aug 2026 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312170; cv=none; b=o0heqwMLygBynqv0HL45RGqtwtHrwqX5lEdUZdOSa1fCkRdx3Dcw0+TSHxKaZF8vmm95P68hTuJn4hOcPyC+UZySGIYQZRTKwS49gA2nJ6LrzCBHZ4NYbsBdyxswSiXhU8DLJVXc5FPlM205FRPStHfbXICvm8NL1vsHiSP5pHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312170; c=relaxed/simple;
	bh=o1Bhez6qyf0vI6dDip45ZKlBNsGfUzARPydzPVrup1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KuCp06V3u2w99Cg/OqNzq31phrakHFq+xI2yAsbN6j041BkMyjR9nqtXMhqjy4s9TSdzHOG7+EyaU0YG7R3WEqBkAbt8d35xeZxluhNqK2w9+bU4JDzZRGL1gGb/pGErV1nMXi5bMCAyr4VZXDd2gc1nM/zQVzoHZ5U4jKgDCZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nw6zwRHP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nw6zwRHP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LncR1474544;
	Fri, 21 Aug 2026 11:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CXjD5M0e/Wr
	v8YrUbZUegzsnwQ++lVeh8HIc5uUcP04=; b=nw6zwRHPrxRogTyZ9MD2FiIx+wZ
	SBTfqMZNtD5WiXOaEE/9xB55+dnY5HC+aPP5k1xR35mhrhn3TVIoivHDRurlGUq1
	vystLGIADt0U+60DylO7SfoD0z2nuyVI2f7gk5C6nZKCANRef4TbWTLgrrVXZhoL
	2BOSGJGM/PU9cD1GOQ8Tm1XdpIfQ9WNMOWg9mnFEm24dqdcaPiJA9iYnEK0KCFEG
	d3WhsBKJlIerELVrXGrlDaPcs0zOOloMP6MBhbk544xt51yvrFP5gESf4036WWOz
	I329ahA/GeWdiY9lPlPOv5IbRBLgLXdpUihgZAsrK0dqMQ6cq3QpN3XXRbQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fbw9fvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 11:36:06 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67LBa2OI029385;
	Fri, 21 Aug 2026 11:36:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4g2h6m45px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 11:36:02 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67LBa1Ok029365;
	Fri, 21 Aug 2026 11:36:01 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 67LBa1ch029359
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 11:36:01 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id A53CE5D7; Fri, 21 Aug 2026 17:06:00 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/2] dt-bindings: pinctrl: qcom,hawi-lpass-lpi-pinctrl: Add Hawi LPI pinctrl
Date: Fri, 21 Aug 2026 17:05:47 +0530
Message-Id: <20260821113548.2686650-2-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821113548.2686650-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260821113548.2686650-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4NyBTYWx0ZWRfX3Mt3Ih1ITc52
 fn0Hw/wujT4kqsIo9ddZOR3RiU26cJRhCAVp1W4L1Z2tQUl7G0Zq5PoDaW06epUE/18SX8SJ6mz
 xXHkUiYw5ipZYykz2SU7Fwj7RZ7WAtg=
X-Proofpoint-ORIG-GUID: m6vcE7qoeAr1a_8oNM4nLcnySim6LOtI
X-Authority-Analysis: v=2.4 cv=L9AtheT8 c=1 sm=1 tr=0 ts=6a883826 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=bT5XQOCXPleopHcqzpYA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4NyBTYWx0ZWRfX6y/mtzBeZv15
 Wc2ub1DmGUwWPqBrY7sB6POH6/HmL7uhZEY52Vzj94xBgbo3TPxBGpWa6uPvkz8GgN0m4S0AryO
 7/AxpRdLqHxjh7e2jB9dETf6T37yP/USRIjCvp2Yof2mFZwgft0ld7JmSfomFhR0lT1z6fhnW/e
 vPBZLw2l6bM0cEQZ7vTtk90haxcaFDTf/E40W1UYoW9sHxlX69ABRyNt1BXBAay/geF5UdnyKWK
 WERI6sDams+fX6TORDSfDjmTLtA0UCZKtDi1WMfgmiTL+j8O1spvOQ8bMjAPGzcILmnKinW0UCo
 JHUqACcruQ9lsKDpOcg4Let42UzWCPjltgWRdl7WrXxxfhNYUnc6vpIln+IPWpnHoGIbgX/zqZm
 h2T4Q/sozaBVXrBu517TiqBqquC5lRfGM19XnxfBqHLMLMyv2oljD0chih9rIxORf7UDGWVYUAx
 qODOl/JYNzhNqj8insg==
X-Proofpoint-GUID: m6vcE7qoeAr1a_8oNM4nLcnySim6LOtI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210087

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
index 000000000000..af68581750cf
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

