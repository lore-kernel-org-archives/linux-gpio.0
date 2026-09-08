Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3583B0ACE;
	Tue,  8 Sep 2026 07:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854349; cv=none; b=Grb+zTIullSUd4zPqOpV4CvWwd41rdBB4aR9pVnwcPGbDmzW7PISHV7BIBYe/KF1gdO0j+D2cBQVGOvV8YsVfnL6d7q5kz9csl0mib1veqPBwp5gDsENjEq4Te2Q1JCNEkOiTk9i0jTlHroE1M3OfQoyBIWfFXPRGkGiSLBb9GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854349; c=relaxed/simple;
	bh=x31dAISSoJuQ/mOSZKNG4ckjzY/r4yPdo25Bm5QUu8c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Re1JRdGXFp6oq46V89AHu/sc1bbXjAkm73wUuFyMrF+3FuhKObR5gfAFZbEj7hTv5znOrFSAKutVZVVQhTiLcbfUlMUA8ZB72WpNVgAee04IugFwiNVBBPZl8rUUOsRwesV4PspDuUnyeqcBvZITgTvYP9GyTcjlUDaTwS0QZzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZmSKx5b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZmSKx5b"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M52k2072898;
	Tue, 8 Sep 2026 07:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7ACsjx30oCg
	Be4gFtl0v4H0bSufYi2QaC1nKGbr8gmQ=; b=MZmSKx5biWap7VFCTTFznJwdICS
	hoABP1D/SF4FjLkFq4Z1+OmlOf3RUEyExHevbezfmRV/B4DuSM6WIt4V/quPsTXd
	weaQ5fBT9lAKiKO4Lx5YIybApw3beUIzeMwp1hWsK4P/a5PnlOlTFPXvWqKjurAt
	QqL0k7jDcS53M95t6H5Hr5945OTeh11CZzeq1bFmBbYcO+v5TyMsl4b8rn0f6aB+
	araKuaCgVA5fEcj8c9uyK9UBzKu/xrMfumxbl+d8huhr15prJlCuD2uqI9hzcLhg
	OrTtwOHhofpe8mfEbHxmJ8cNn5aL9EomkoVJQoF+lp11I6lXH92ZUTtRWZQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfymf6p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 07:59:02 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6887wxZY1372057;
	Tue, 8 Sep 2026 07:58:59 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6887wxrU1372048
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 07:58:59 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 89459673; Tue,  8 Sep 2026 13:28:58 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Karthik S <karthik.s@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: pinctrl: qcom: Add QCS615 LPASS LPI pinctrl bindings
Date: Tue,  8 Sep 2026 13:28:53 +0530
Message-Id: <20260908075854.3015560-2-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: Zuk3nIcFRLGT0G2Ibm99PNXmMB3lSwJK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX4NSz0lHX80k0
 dsxlaz+eS1irPMdUD0WCVkMrpiQFyWVWeMxyWfguIsquC6XBWTIh1uTx3OIs6Rxs1oegMVaolKs
 7YpHV1akNfbUxmEF1wgokW+Rs7KjPbOs1PzMGsff8iX37u762j8qzwfpN1kenR7Tnpx67rQZCtU
 EK77SPXVUL0AkpiKrHGW+OMWZxcua5drlROf4NNpxH1HheB0IktmjI8o8K5LBfTxpC4V3trZdU8
 yS5AxdRaZVyL6rx/mDC9d+yLnHFDSsFBYzPOYeW+36Niy1xJVDmGOBnzmjeeNV1pJnYBXbHB46Y
 Rvzhxlt6O9Ayt3PMY8CF4Thimf3GqQnNpN8QskCwxL+BY20xBESpwgYRUCa2oci5pIzWqGNQGHh
 auJRrIcs8MYqWDDbbjIeMH/wb89S5bi+OYi1ek4FsoHbkDdDmjXO+KOApqSBYngYsyIkPDBw6lK
 tJMM7FSY1vKpBK55puA==
X-Proofpoint-GUID: Zuk3nIcFRLGT0G2Ibm99PNXmMB3lSwJK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4MiBTYWx0ZWRfX29pi0wB0Vrq3
 g+mHXnlLMuTobWiK5inwfBzTYiNrv5oRB5TuJs3BsDqu5+75rPkUmMJavF16RzdS844kM8qJH1V
 RmgtSQ+iURaismw8wsWT4jEG+41O1M4=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9fc046 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=CaveSyEksWnKhASb3GUA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080082

Add bindings for the pin controller in the QCS615 Low Power Audio
SubSystem (LPASS) Low Power Island (LPI).

The LPASS LPI TLMM is a dedicated pin controller for audio pins on
QCS615 which supports 32 GPIOs (gpio0-gpio31) with functions including
i2s1, dmic1, dmic2 and spkr_i2s_mclk_a.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 .../qcom,qcs615-lpass-lpi-pinctrl.yaml        | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcs615-lpass-lpi-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..dc1525d7bf55
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,qcs615-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCS615 SoC LPASS LPI TLMM
+
+maintainers:
+  - Karthik S <karthik.s@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm QCS615 SoC.
+
+properties:
+  compatible:
+    const: qcom,qcs615-lpass-lpi-pinctrl
+
+  reg:
+    items:
+      - description: LPASS LPI TLMM Control and Status registers
+      - description: LPASS LPI MCC registers
+
+  clocks:
+    items:
+      - description: LPASS Core voting clock
+
+  clock-names:
+    items:
+      - const: core
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-qcs615-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-qcs615-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-qcs615-lpass-state:
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
+          pattern: "^gpio([0-9]|1[0-9]|2[0-9]|3[0-1])$"
+
+      function:
+        enum: [ dmic1_clk, dmic1_data, dmic2_clk, dmic2_data, gpio, i2s1_clk,
+                i2s1_data, i2s1_ws, spkr_i2s_mclk_a ]
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
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    lpi_tlmm: pinctrl@62b40000 {
+        compatible = "qcom,qcs615-lpass-lpi-pinctrl";
+        reg = <0x62b40000 0x20000>,
+              <0x62b00000 0x10000>;
+        clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "core";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpi_tlmm 0 0 32>;
+
+        i2s1-active-state {
+            clk-pins {
+                pins = "gpio8";
+                function = "i2s1_clk";
+                drive-strength = <8>;
+                bias-disable;
+                output-high;
+            };
+
+            ws-pins {
+                pins = "gpio9";
+                function = "i2s1_ws";
+                drive-strength = <8>;
+                bias-disable;
+                output-high;
+            };
+
+            data-pins {
+                pins = "gpio10", "gpio11";
+                function = "i2s1_data";
+                drive-strength = <8>;
+                bias-disable;
+            };
+        };
+    };
-- 
2.34.1

