Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463515;
	b=K+/5IFvbUH79MELUXnREG+u/y0dV+/s17pWAphy/ygYBGyFfZzsTMMo1lsV+7prmjK8Y
	 H5HjxbDaQbX/PYWLe1/iqM3W6yZs9cIHYJBiDCTG9mtKpqAxFkAgM4AZRAZ/z2c3jrVUh
	 OUaD++NKhj+E0VSvNu1kJK5dF4etjmlG02ofvsanaV/Hhak+wuFEmQ7jbcN7uMzsIlfXs
	 ZwK48qmR/R52S7Gx2FnMiozk927qDDKrdktfJnk1Z5Nkk+ELpPQGvI/MULApWkHa3wN2A
	 TBmp8/VniISWtopCWOaF1DkJa2sULoIk76+Ig9kVE27vsDoS5i5z2FGs5f1+eIZHX6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=;
	b=KSs+GDrWoG39rzsqmBkN/GVovb4vw5VSxmpexG4PmgyRTtCz/Kxyg/It8pfwsVDpM8oB
	 rS+c8mBzWaheo/CTUlMUdEpw1BH1atf3ZdUWskjKFE6HU9XhmEu3/nymTmzi50C8xuR7I
	 CwHTf2DDl7/Lz0Q61Afj///ksLMXIPfegjWfXpzGEKfG5RBArduFdeOmGV1k92OUBTITl
	 0lyAohYM7tYAbsXXh8xdyJF3gHYar+VvNghD91RgOWlYAoV4sBAySRgP41KIgXgVhrc4B
	 x5pdK2XhC0/5zguaTM7KQEvYi4fo1bCfUEwwEOSXDK3sYD0SL9eeLnBqdM1kMmzAOzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldjygAZV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+Pju7+5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1D0606A327
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D1D0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldjygAZV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B+Pju7+5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxWq2377190
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=; b=ldjygAZVjoaJIO6l
	Pj9FQlPlZK+MQHQ5WIvAp5lEGd34j5yXImG0EVV/lBFvQb8XTlHhve7qihg6MFKl
	mmC8wBuHegfJImDQYbzvZzhBbGPPPBPoMKDpqH71DOJxmwtHZjyojXLbD/wTCPsU
	BkFHhVrxup6jROy1QCckwDcmFtks4GX4VUwPOPfHXAGyheLPlXHDQ7OeTsUd39P8
	vR8yB9Yg3zzy+DADR2Klm/jX+DtgkIfTvMS5Tgen5+RopPHLjDmS6/pINpTpW3mA
	O7Y8v+TLL0ZOp1hjdIohAI59NjrE5cUrYnzpJ0KrQ7SymlXKG5zlHJfLQnN7FJwn
	TdxvLA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut5rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:51:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so4602598eec.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463512; x=1796068312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=;
        b=B+Pju7+5iG2yB7Gd/O+tkt2ycQff37Qs+miV6J+2bjmE+9t/JgR58KRHlu7huxeaXL
         v71bTsLdq4g43DtUdqxF199HKwsoTfy9e+nfzysp0k7xnq9vVgGBNlUXEiRFEC5ap9Ba
         vj3/2wGgcSInKOIgxLacGa9i3WfngV6M0DD5fgw/M29eN8GBm4HnmLJk+N7opPQStxZd
         C60zEBDcdOMtTq14koTnHqR3BqYfVxRDEmF5/BeOqxUniBjUX+VbCSwRclMn4yRKGx3/
         IxGOgMSHCBf4cI5SLtRcD1I9uQHBnjm39z/BIITF2og3UFHNHszbjW1KO+5x0vbDxZUK
         qMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463512; x=1796068312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4o890wySDiYpLD1MpksrkjM0MlrXqxwa0AJcHngD92Q=;
        b=UnW+14CZoxAEIEyCrtzqApKjZgs5KrlRaR5k1jeEZNyrc/5BrbQdMBmGf/KqZmv0Tz
         Ws+7WhSJdEx1InzbW8Qs0GYzqpV1jJ4s83oeib+idBDfxTrnKp2rbH7UgtwTlBwp3Bgo
         xdpy8k2nlf5UpOPJjKh/yZS8tD9rvUGA7BCGiIyRM3n1vwhitM0wkATPKR5OM6VgEj68
         ijazMEgcT4qQPJqbjhMvn8JvcQR8Oc5EXt53CGgiKEj0BNMldXB6chXCsISDbvgAipfA
         psEbO0NS4Ciq97HbgKTiLRkZgPUh7Hv3PNVIxKj4vKnUoUdunDsz6x+FSqW8s76lYGVi
         qZjQ==
X-Forwarded-Encrypted: i=1; AL+hErE0m+bvJTQ8vWbCg4rfcbXfqGdfWV7PRdUtCTItTxNe51yw2KZq6cWWpUK41FVz2Bav/v5ddSTMFwHw@vger.kernel.org
X-Gm-Message-State: APuU4Z87OlVcvfLDx86rJcwvBP/ou22ekGx3k/wwU/u0GjnwNAMSQb0D
	8HHO20RDDLVZwQo+fDT923PUW9TUNRE3ryhHN35kBVqiBT0imOoZ3cTge+JhOUHsXME4mCPggoO
	k1GCDPHpJxnIJputZwTqvHbVlj2VnJdPr8d7nEgGuU7cuUyMIFmHSYexVDEUn/YjC
X-Gm-Gg: AZFdTZd4zrFiaRDZkssjCeZUQSvzEv4P/HvwF9CMagigwZdNybkhVzJh7Ow8lAqQXoY
	osnQOGDuvo8okOEdTaJbNz5tHHxrHrEIwYx4myNiWhirL+OPXlLVLgtTqPTpf64N6EphM4ftkEj
	qWS1NnNW2ExyC2UfFJEyanMON1L9Eoh9poZLybN39X966uw6Wpp2xUHeld2jyjNPQpp83Y6e75K
	1n0/17HL8prWN2Bwi2pcq8vq10NUYuXpKDnI2ZuPUsjWv5um9BnEPimbf2xwVlhoF76owEirJdo
	mtozxlsZ2Hb5v73wbFIqAYOOZobZ6bwLrPTwRALu3G5XLkqkSj6zzSVwyZ/7+Mj2g7qHU+H01jA
	4Q90CLUqXeXDeY2B3qYs0jvW1cXpd0CgCRmC1tq196R3KGT69CXwIH4YvVyfJ0qh35g3Z6aMBKQ
	==
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr18654004eec.38.1795463512145;
        Mon, 23 Nov 2026 11:51:52 -0800 (PST)
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr18653956eec.38.1795463511427;
        Mon, 23 Nov 2026 11:51:51 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:51:51 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:32 +0530
Subject: [PATCH v3 01/10] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-1-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: nFLA7r5WmL9O3gU2uaRxMwssz8jIwxho
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b049959 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=nhq6iwPr6d6TsRTX7tUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: nFLA7r5WmL9O3gU2uaRxMwssz8jIwxho
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX2eScFojNYGnP
 9Vq7iu/kFHVjOYnzWxqkuFsJ9A8qOkobODuQ8rsIk+9AP/iHE/S3J7V8cSWp3cfRpXYYLhrnQZF
 jqlKhHdlbbAt5YzZvdiqKzYRNZPO1Zg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX0pXXuosM+7qA
 7lOr7CjZTMbkwhZgP5nNZ3jXmSczYbsURwmCCXNHMTgOv7wMfcUmGNLfX0erV3UZxzzsNgj90sG
 MYe7CgOFAnovrnSNCoeRfwc0dbY5Cj/hJjGfU15Y9EDktRchYejP63TpOVF9UiW9i4z+uZTchWX
 Eg8f6sd0mkjXwxu8Y4df1px5eQ8D20T63aOUvrezd/qOIJdXzkMfKf5wSnu7DjlapWgpgvr3IT5
 nj6MHz7ntajgrgtmaSOzvTFFUhYQYuO4xXc3OE5/Y95CaB0yKetwW/rzqCCuAPHcrVTsBY4cLxy
 0Nya1sERoYU1zaSMjwWZjQQWDY4jJO5ADGbDRtYpYCF4bVC8G6EbOiXihrBRPGMEdtqoSq5mqf0
 A6WDc83ItfQnvgWI8ssdjiwW+A5OskNJilydxcAEhr0gGwnNFFeJenJK9Uuvgk5ms7HY1ny0k95
 Mev/BUwNHboZv8QmrnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
clock divider. The hardware generates a fractional output frequency
from a fixed input clock (typically TCXO4) using the relation
Fout = Fin * (M / N), with duty cycle controlled by a separate D
register. The clock output is routed over a gpio controlled pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sc7280-gp-mnd.yaml         | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-gp-mnd.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-gp-mnd.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..76fecc6f7cb376770bfec06f3e1fcafcd480286a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-gp-mnd.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sc7280-gp-mnd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Peripheral Web's PDM GP_MN Clock Divider
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  The Peripheral Web's PDM GP_MN clock divider receives an input clock
+  (TCXO4) with frequency Fin and generates an output clock with
+  frequency Fout = Fin * (M / N) and a duty cycle controlled by D
+  and routed over a gpio pin.
+
+  The divider is configured using three registers:
+
+  - GP_MN_CLK_MDIV: holds the M value.
+  - GP_MN_CLK_NDIV: holds the ones complement of (N - M).
+  - GP_MN_CLK_DUTY: holds the D value.
+
+  For every N input clock cycles the GP_MN produces M output clock
+  cycles. D is the number of native clock cycles in which the GP_MN
+  output is low, counted over 2^13 native clock cycles.
+
+  Hardware constraints:
+
+    M <= 511
+    N <= 8191
+    N > 2 * M
+    M < D < (N - M)
+    M and N must be coprime (no common divisor)
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,sc7280-gp-mnd
+      - items:
+          - enum:
+              - qcom,qcs615-gp-mnd
+              - qcom,qcs8300-gp-mnd
+              - qcom,sa8775p-gp-mnd
+              - qcom,shikra-gp-mnd
+              - qcom,sm8750-gp-mnd
+          - const: qcom,sc7280-gp-mnd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: |
+          PDM XO4 source clock. It is derived from the 19.2 MHz TCXO by an
+          integer divider of 1 to 16 programmed on the parent clock (for
+          example via assigned-clock-rates), giving supported input rates
+          from 19200000 Hz (divide by 1) down to 1200000 Hz (divide by 16).
+      - description: PDM AHB bus clock for register access
+
+  clock-names:
+    items:
+      - const: pdm
+      - const: ahb
+
+  '#clock-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    clock-controller@88d3000 {
+        compatible = "qcom,sc7280-gp-mnd";
+        reg = <0x88d3000 0x1000>;
+        clocks = <&gcc GCC_PDM_XO4_CLK>,
+                 <&gcc GCC_PDM_AHB_CLK>;
+        clock-names = "pdm", "ahb";
+        pinctrl-0 = <&gp_mn_pin_active>;
+        pinctrl-names = "default";
+        assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+        assigned-clock-rates = <4800000>;
+        #clock-cells = <0>;
+    };

-- 
2.34.1

