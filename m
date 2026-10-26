Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014279;
	b=zh6CGt6U/tq+Jszrnpln/yFY+u6ws6Z2pBIdk4Ra0a5Oay00kTeSLPD6asY8K7mw7Hj0
	 Jw+I8NISUGSpfipcTS28o4k/HLKEH6YxEGNRt/lKkgyUg7o27swZm4V4+FThY60EkJB9e
	 D+1jOhEWxJvfk/zsIrwzQBf+9soIM9h1inHXlaFc+3csF1kyJmVfaZie/nRyckKZH2YKG
	 3tvhRLKRsSXGiDutQu3uY8Y3GQVpeJMuUZi02/Ek0ao6DF9H4Sc+5okPh6pgQ13XoxPsE
	 H71iFeDByAczMEjG1O7MqVkb47gjFM5wBKWABa8L9MPlJ24TA9QPj0oIB1Po78RFe4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=;
	b=vPm/6BQ3rWdvjGsNiohhUHRMhM++P2M/1AW/t51YVhiesLUPfsbahypVxV8Nu2XjMrjg
	 fBRCISDbH96TI0USF8cJOj7pfn/A9MOeEvd+uDZ+Bq3464ll7+b4A089Onw3dryrIF38/
	 fzWHxKUhiYNKqYo/H0nuO0YjjFirKqfB7hW8xgL2OqelnhK4Ts3jaVoC3cnITuZKPaG/X
	 RG5TtOSfxlnWQWB5epv2DDr2D+65Qt69wjzZMMArTDdFty7ady8g2J50oCicWRfHhjZH9
	 +Sv4BOmWFOMPAyLlJZ0Ml2pFe6nuMQqtkKroGM39p1PXoVnG0CV/CNUCf83lucqh2yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CfQxc4C/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkPpEYnF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232BB6072C80
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 232BB6072C80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CfQxc4C/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkPpEYnF
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsrPs3033637
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=; b=CfQxc4C/kewcTgE/
	Qv1d7WZrlMrN1mNjVUYktg8rKXaO+MniuiEVjqBweZpG8m5lmPGysCoEkLmNV+xm
	5/8fWVO2hq3iYArAubOuj2NJ4DP8N6zggHTeJPiz564yB4twCoJpxKE3NVqPcSut
	fovHAokjYqlTt2EAyzcoeGufiXS+O4NPGJuop8gZp+Q71K0Vo0JOMIlYqXMKlWTa
	nMDCnFFXK/28dbdEz/nS04MV8NkUiQipL9GMvo03JmqxCryK6+fw654eLK+Ua14u
	uIVniQcEEs/oyCdPKXCyOvUZbBZRUEUB4TrnPL7u0o/niVqVN8EtK8u1DPwx3I39
	m8PjcA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y06bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:31:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adcb81f487so4783284a91.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 04:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014277; x=1793619077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=;
        b=WkPpEYnFcFNU7ej5dlx89hAl4uz+8lAS7V8S8D2nQmWY0vARSHfkmsuWkEAArwbN4I
         uw0oH5av1brBVAp6o15XZnaJZ6tDC0JqnXTAyBLtfJq0PBSzdJyA5ZR8xxbe869LXJ8Y
         0coZY/5zr/jLA+iIIsrencUxqFdj92fXTZsZeSf+I6t/6C20fzPd7jO71iYmeX4f7ifh
         xsdV3Feilymx8fXwYH7Cr13jvhH4zHBIYQVM2CH7n77G1aFyfxpdAzTRLP1I3RKXMubo
         ssFvf4klEuqmFlMa0nRCj7mVxA/fOOgAVYQeLqEj9PT+kooZY3r/i//K3X7aNVREEXmr
         eG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014277; x=1793619077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfWAgnXg4OH5Clvj7K/B5nMB8xGrzGYP7GIzT3Cmmjo=;
        b=Rv3J6SCnCV6Wq9XJ15BTBMrJDMAY2yKpda6HRyxAqdEBbBvy/V/iqMUiyh5wzAPy4B
         xjqBt3nEEwBAP0L8cbuQS//vWXbU8ehJQdo+v1irD3z5nLvtJ6Jc2Olc2yhXnF/0F0Cp
         ODDuwsXO4V9MEOn+m0reTxROL1jLcnO8lXbXKNSO9wqeBYxrZ/MuW3Ur/fWiaek8flHH
         paR/J12g8fpSXAVPs4HEDya3h/2f3bAWhPKZdavtfqmOyPDM0D553WElnq4aM3R1JUIU
         oqP1Lid9SavmfxtIQ2vJ/eaVlGdH/OIRrgRX6EUPQr+JyTkdbsguTwVbQ6u0rbE34YTh
         dCRg==
X-Forwarded-Encrypted: i=1; AKwUvBz0WLpfhKvQk/WzmjvIbbfsjnGOBCI3ZKAS934qhRYD/mn0hiA1mEWBD5PkQ8Jmxa5XcMBN1posa89l@vger.kernel.org
X-Gm-Message-State: AFq9FYK1wPFdgZK6Ml7bqvZy9AC6Z1eJVZeqA2VW4Auc1RQ93WP/lJ4d
	j0guiCpklJ457R28/CyrlH4irnEKcsYEok+iDpYyyejztWt5RsPKFr/Q4YEq3f+LPQbnp2Gul63
	fUKx3gd2EP1HA9xnrMVGLt6AEMoX/ZJtqroBbap31R2dm5ux2hrZcw+KglN8mpXKNGTdk14uQ
X-Gm-Gg: AYBFou1r2xK8iZd2Gxck3sCswuDkO0+ixyX1v6NBuF8d0qyzQ/H5YG8TNO5jisS1IZg
	vcxNtxwDbcocXmqZi2AJ0lOdLSxmJZBBE3a/PgQ/joVLg0KWUEsn5gIdBQw1d2oeRRTIZMyGdVO
	NfQNTTVyokHg4kRL8sSfPu4L6xzHcpGrBc3x2fsoVjk2KbZrF7ilSkJWj4e4dJEUjK5GKy9w+IV
	TY91Ra0jxEeXUbRSD6OAaBbgFsNGf64nBY7ehKWvVOoN/PgLtpaHDHJyKmoySjeRvTq2IDSqDBn
	LUadB9fhV+8ARv9DaLhKuUXK3JHhneq7qzVVU0xbNiaSVbyrz4sG5FrSBqQs99W43K1O088u1UW
	oE8ABZczs7oAm+Tz8ymisJk0=
X-Received: by 2002:a17:90b:4d0b:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3adeac04b22mr5611301a91.22.1793014276971;
        Mon, 26 Oct 2026 04:31:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0b:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3adeac04b22mr5611246a91.22.1793014276253;
        Mon, 26 Oct 2026 04:31:16 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:31:15 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:38 +0530
Subject: [PATCH v2 12/12] arm64: dts: qcom: qcs615: Add GP M/N clock
 controller
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-12-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX5iHNbgwgoPlB
 U50ifpq2Da2UIpaEpSKQokX4H4KMZIQo9hSlyQNxOnUm4UGjJVdzkQsYnRj7Ldt12/9UzmrE87K
 e+9mryyOgWb8UWBDl7z9lXywhYV67ZE=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf3a06 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Sk_Ya6Pm9egUDeeQrokA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX3IdVz+ZoGAYZ
 TXuySs87+5x2wS990b6TjWax7ik5qg64pIZxsSjrs2RrhduFaf71aCmmxzBkMMeBb25mqLpd65/
 jApWdO9Jy8XFr+FrJJoY+vdLhYwqGPqRQH8NQcoE+cj3xbBMwzwbU3RRs6RnupHwhDEiMd5k/Ap
 tZfkBTx7J6GFmc+/uZKH94NAPNRpGx8VNpFj4haBpfbQgr0lpnvprsMk3hOfQ95uaxevUkTTRVI
 jwUwTBvRgLETeA+QUK0TI5I3Vv57vPzLMhVrE57JNOoaObD+gSqkB1tGoUiTPQ70as0FnY+1jw5
 qjy4cdxYLMCKqMkozk67KjbnVB+3LWcnwE+87jQF7Xnf3UdzfkJQ/1d8YB3KE7t1nK7jPk9/+YV
 97jMDpopw57/M13D4ZlUnBwncq5XsggYv+4nyLk8MO0LARh+zHsGMgWfkigMp7hc3IVZWZBDT3c
 6gZV2Et6WYZH0qHVJ+w==
X-Proofpoint-GUID: sXUV4oEd-GajOnHlLRh3k8k-I_mlUsQv
X-Proofpoint-ORIG-GUID: sXUV4oEd-GajOnHlLRh3k8k-I_mlUsQv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for QCS615.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio29.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8ed6f2755705c38796698747dfe7bba1afd1859e..c415e782804ca8c9d09670cb8c8cd2353d796b23 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1611,6 +1611,13 @@ cam_mclk1_default: cam-mclk1-default-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio29";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cam_mclk2_default: cam-mclk2-default-state {
 				pins = "gpio30";
 				function = "cam_mclk";
@@ -4028,6 +4035,20 @@ opp-202000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs615-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <19200000>;
+			status = "disabled";
+		};
+
 		qspi: spi@88df000 {
 			compatible = "qcom,qcs615-qspi",
 				     "qcom,qspi-v1";

-- 
2.34.1

