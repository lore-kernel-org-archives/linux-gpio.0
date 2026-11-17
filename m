Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902009;
	b=J8rVq5N2WF4Vm9NamwFShgyT0pW5tU4ZAikWh25R52HwGWp1R0u2XTYcLAItI33Z6gwO
	 TlZj/R2MnK+UhUri9xQ78MQ0e90OmixUkZVTfHmloH0m6I2hYHvA+S/kZ3oKwyz4JXe7T
	 w6IeAoact7Gd8WNDM3W2oJ4sivmTMU1MFBtKCdtW5iYuRBtCNt4A7l72vrXDsn3vvASG/
	 q/FFiEOhTmOaktADcbGbSp9Wd7cP2BZebszHfDpVSwxzI1zFnOp63TV1EMotq6hJzQPRq
	 WRj3yl4ifwn850X56QfFwyQ8wYnUAUKXw3uukUg8iWjMt0bBlYESlb6PwEHR9bwoDRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902009;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7ACsjx30oCgBe4gFtl0v4H0bSufYi2QaC1nKGbr8gmQ=;
	b=2fjOcHHX8rtOcDmpsBTHU1cWQgXB89EwYvF8MXGbpBmtDencEmmfTnRz3JFMsF3wVUb/
	 U7mL735ItzuNgTpddRuuPYT7z/Ekp2EcZhVVUJAiim+FE8ntSYXtt/oviVBMXMZB2id4E
	 NA1nAKL1tlIiH9UU1NMJTujdH0hdvuzF+9gre0xul5uXfGjrLj1Q+RXeymMk39SuDgmky
	 o4YkXwxXAzzYkTYsQzFT+NYWJzoZEIOGWjFezmjcoen1ncw90LbQ0uBYK7Lm4yyw018lx
	 YCaTcBJyY1DIoxO3MQxnGqnsMw5yghE/ujwCtzSuB6poVJkNHU2NUziZn5o1UgvofLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CO6bqMkb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA014606A31C;
	Tue, 17 Nov 2026 07:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA014606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CO6bqMkb
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6exoP2998571;
	Tue, 17 Nov 2026 07:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7ACsjx30oCg
	Be4gFtl0v4H0bSufYi2QaC1nKGbr8gmQ=; b=CO6bqMkbV4fKeXzB9wQK6nR8Jm1
	jhy0OfZ5+u7VTtMwMU1t2GI8KTBRIOZvE2oawbq9+BnbP9xHJVmXgyWYlXarTGlw
	9EQmj7oMFOi1dMiLqV/gLYjSPNed0dbI9HoANIHCbaG0lA1sk845fexOl2dQYKsm
	PV5IrNtEWGj3CEzaHcMtSRlnVdoxJVPDBmjgII0fRCztxe+79B5j4dLiAY0FvV2m
	Qe35kngKPQTH3/olJMTuyER35x7URFk+YGcgTiGFEO5jy2VpveYBLTc77SD/9yXH
	c3JhSYKwrJwoBGInWKhXIpCM3J9GU8QG8kdOH7SXbhaVnaS5fPTUNEHZJCA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve08r0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 07:53:26 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH7p5E5128973;
	Tue, 17 Nov 2026 07:51:05 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AH7p47m128963
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 07:51:04 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id B188E682; Tue, 17 Nov 2026 13:21:03 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Karthik S <karthik.s@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: qcom: Add QCS615 LPASS LPI pinctrl bindings
Date: Tue, 17 Nov 2026 13:20:58 +0530
Message-Id: <20261117075100.272535-2-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117075100.272535-1-karthik.s@oss.qualcomm.com>
References: <20261117075100.272535-1-karthik.s@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMSBTYWx0ZWRfX6b0gVESPxXNt
 F63iDm21OYIGm2c0OwWUcVSN7X7IrovfQWAZ7rV5n3DcbCSM8D0e+TGUqiMuXoMjqm9a77iefXk
 NPjmQbaGHv/E72Ju6UZcEckVxwYtcZU=
X-Proofpoint-GUID: upU7-Wxh9fALY0-GJCiMMEQfX3HgK0-A
X-Proofpoint-ORIG-GUID: upU7-Wxh9fALY0-GJCiMMEQfX3HgK0-A
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc07f6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=CaveSyEksWnKhASb3GUA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMSBTYWx0ZWRfX4MxXlHNjmHFM
 DRv2vCFi6CFVcU05vkU48oJzN1mM+j4M15wiQ8neqr586evijt0w71rKNLnoecnr+Q5TUbUILRx
 AeLQMmjXnM4lc1N/kMtWFNFyLiK4RdqDGWDK+aw250TEW5umdp8JRvP2gmDdmdtaaZob/brLYhZ
 CFzR1WyBkG9KOvxUD1du2zH3KcT3yq7GLpDXPKRs9bFPSfarSddj5uDjR6i8A93W+Q5wmj1kqZd
 VxDUH1DP1CG3G41ecK1cxb2Fh4qn6tveWmqE/PVQaxFVI1XYBP6NQR0nbkLRy7lyN+/i/USYko4
 OqoSY1iTc7k/ekcjyLxdXQyyM0xdTzs5yLjb8no8MQJpDsILcM37BpBVOcXNOGGnTVT7Grnb8u9
 ELmunJDL2jMVogrT+zb9nkHUIciSWCANcFXG17RIgl4N3AUGbj7bF1W2cim9Jbl8yzcTpVq5PP3
 RXPWs9Jc7gIAgrJzXIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170031

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

