Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463562;
	b=HpHys82sUoelAz6TUo5pTXiytjy3PHmZwL6zwvWKHm/qUNF3Ha4B9zfXFrKVRWCsg2BA
	 8ImU4dzECFU7zeJuoegnPUZKpUGMFc+/fw+U+wwEuOct12/hBI+DOfNgABtZW8orRkA12
	 VXKMJAtZR9jVtM4+OXGxOkbYBw68nGaii4u9nPs/SckfZ/qsj27hkpgPAklvOC14cYwcJ
	 Kjx8lByRrB3WGvTdGn7nLn+Jt24M7TbjKFKCBp5voCxKVwuyMONlxL42GJvQ2hqf1a4Vd
	 +O4YOEa7AH6zjuNvqQoTbONu05foSZxwepFlGgbXwwBongIOCjoJjmTSqZzMaJonUSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=;
	b=5TMcQkN6Kv+rP434erX+EWetaZhXHHKjF6nl8NGCX3GLVwmg5MIT1wNaPmGIlhEgnylA
	 UHK+4eJ8GKLuRoIOZ3/hbqh+ayQe/nfZGRzBGIzQr9o63vj1Jx+ORgv4Im1LRIK2iFlI2
	 Y/SDzViCaBNUhlMtG+RmMDnBWUpBorDNCFg5H+CyjBfcd+OBk7tcPm7RAgJgdut8zo2U3
	 aDsmxv/ZpYCBHOrY9btofOYDgcJ/LO9yE8BsCaOK+xSINsm6lCorzyVJTNopysrMmrawC
	 iImIRdreJitUf4U2akpJyAOZGtqeIMWttQC6Lq8Dwg/fgJgrmEVTK9/eVNPOnzXKOhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1TDKnn7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkDTIqSE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62E7606A31F
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B62E7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1TDKnn7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkDTIqSE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGp8V2769030
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=; b=I1TDKnn7QhMB3PBK
	No8NilYpEKgpq1suagt+vSY0Zndoz2v9cnxfOBRkDUDFDxgeztcxIHprmYU+88mk
	P2d4Fk7zObzRHTTsxOMRVCBQ+xHmPr/9w05OJ0F2XR/C6+ol0XQGRig+2Y/0u+no
	indcRaRuB74V+/Jl+ktGR8Hsq8fsCsJSEnqgbuL3rlOlehQ/leh/Sx5QL1bDxZDL
	sg3jVdRVf61tb6CwajufuM7mLNeuHy/da5V2cLAaIG5BrhGbg4qotPO9b4ExoZOo
	cjfPtI0BxqlTZyiVFljLsQ9vjKpa4CVTyXhDQ/gB0SGaNLXr+6lG2dRonkIuL+lA
	RG+miw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb5ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386ad819860so150861eec.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463560; x=1796068360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=;
        b=PkDTIqSEy6bRPMwGBYNwbhMF05vtOcZjDqvIbI3qKKaVEtRcGBz3JzsNFVan/aYzkj
         dC0RUiWClaNhw2DO0ka6hQnpEamqX86ekSfRj/Ik2JtSIQs9sOj7Lh72O93MU/x/yQhG
         p+eI+Y+AVFaYr+8n2w349bzflzB1jY8Q/WPEV+wG2Dw6WIMOLwuLxQ38C4ba5lQBxR8E
         tM7HgrByYFFi8sh5nDy4YHNQyEwVPV+apE6NKjyk2RhS/oRg74WzaffPTmK2zub9vW+v
         UIHgsU2fffmjonD7QpyQ3TA9u4fgio3aUwrbhKxPfzTT+96leXKRACvB7b869MZ37eKS
         z2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463560; x=1796068360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=;
        b=FPHfS6Sr7LOttg0AEKOxkJdLCumrs6qMEfTKP3af7Rne1Fe4N4H2IPXWbWJHF560RE
         pROlxct1y0g1IeZTu4xDYAy7Ld/lSb4DOSZauWtRSDOmoVSy0CeHz1odDgtaHUrzDyXq
         YAI3ekj98EJLgjkhjK4ri6e/W8JF9Yw7mekKeNufxDJgtARubtqWJAn73JT9azFLL5Eg
         tUy/rrXrJFlsulqfEzT1UcQFoOd/5TcGo0UkwHpHPswSEcOICCgZREjee3T/kSRkA1Cc
         oqTc213Q9qYr9ZTAjSy2Ij3PreP9PFvKvcdfnLdMIBWWn1phsOTXDolJI+IQppgx7bXF
         sQ2Q==
X-Forwarded-Encrypted: i=1; AL+hErF4bbboZTKytSCNy1k4PpC3uuwVCJXnj28/isZFRbKg8Cc7EXI8htyF3gCs5yWViX5UafZfuUz5UrzB@vger.kernel.org
X-Gm-Message-State: APuU4Z8ETnBITz7RtcVjWc9fVgw4XkVVvN/OCiBwYGLBXkpgUlT3IWIB
	rHuk3VDGvUadKIiuQzsEtIFsbbOHnXt4h2ThrgcudE7eyBH3rld96nu5uecy/s0+Xgf71Z761PO
	g1aaGnek/A0jMD3zKhN1o5/EHycMIvxSfVEu2aWb+/9r2u8eHW+IjcglPp3Zh4IG4
X-Gm-Gg: AZFdTZfjP9sSAJkvWtNSauNZGQuUhhYwaiaQe+wHlrcj2T1TgkJZ9RfHeM6a3Qp5fT4
	y/D01H4930StYCLFBUE07rCLjc0cP4lM+us2f3XGXcI5gEWdX4XX9/mht6xg7OS7GxIljuO1W+7
	rbcaJQp5JFB4lW4IwlzjH/sG+4iH3p4ASgpviVhFLNdpwupxUL0KYKgTkpLauloerEAW9OjsTPL
	Dgi7MlL6si0MASPOr04RaW3OesSJvnv4M4egYSKQSt4ZwnnvH6B1vVHIzb3obQcEWefn21aM8cT
	vqT729ByFAZv0MOUYwAeLUwXvjaygR6M5VXofCNoGAHjCtMiOQ+fvcGsB9/ZliMe3sOPfeUXO03
	+qv8SLjX/LZ/z9GHtgfTugp0tC4ptwnjPOPnjPUTFrXIRZgLTAezmWdQ3S3qhBbb4lZyibWcfhg
	==
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr6475635eec.31.1795463560497;
        Mon, 23 Nov 2026 11:52:40 -0800 (PST)
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr6475613eec.31.1795463560078;
        Mon, 23 Nov 2026 11:52:40 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:39 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:39 +0530
Subject: [PATCH v3 08/10] arm64: dts: qcom: qcs615: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-8-98db26a87500@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX6kgs6QL/RxpN
 60B9MU9iN3PSJWCAN2ym1QI4Kvwo4NV39uZz1CIjC2PJWOM5q/9REmdDip0ejWrhdEbnziBmadf
 PeuzK0GHS/L1Fhvf5Q0f9QLfvY2qXb/mzUvKcTlMwA3/T7uq4/Txv4+9RxX9BX5Vttt3fbfqdZz
 OKQhGx8jAxO/T7uG7vfWQDae8NCsQl/Bi9u4CsYl46MmtQxG4SrUsRovEby5Fm2ff4WlF1lb8yn
 vcH2ik1oHW/wATB+FDv8/KI3OZFJMPMkJHLWICPF+tquKp9yZH8zvfTp6vKtL/LVUlu8G3AhY3Q
 N+66Y1VL9fCG3RPK5lmj2825ZvTcd/MGS0d4wSg/06ZkPM8VQL0FaUiA4ic/QdIZMOMegxQujAX
 a/mY9F0HPAdae2Vj8IpM/my+ogM5FoXSvsMfhSigrh4F0Z/1tbMenR0Ie3tyD+jyIfg3KXtbB7C
 np3XT8OiUNprbceHfvg==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b049989 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pimPiyicOD4MdmKq59kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: znJV_K7eULvDOUCMZhfVvjWsoqwJDPHL
X-Proofpoint-ORIG-GUID: znJV_K7eULvDOUCMZhfVvjWsoqwJDPHL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX+etm/VF5LGlx
 SCCf/i8HPbjAghS8oOgHNHDdW499TOojG0BmmRmHlmqWeEBRE2GIE1HECS/d+drAEFMBE/SYcM4
 dHFVWxwlQ5YcebE5zTMyzWql1b0lqs4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for QCS615.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio29.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892e7aa65296850816dc9ebaddbe3af..a6f195509ac2e27a4862e49e82cd9a0fda67d153 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1626,6 +1626,13 @@ cam_mclk3_default: cam-mclk3-default-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio29";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";
@@ -4031,6 +4038,20 @@ opp-202000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs615-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm", "ahb";
+			#clock-cells = <0>;
+			pinctrl-0 = <&gp_mn_active>;
+			pinctrl-names = "default";
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		qspi: spi@88df000 {
 			compatible = "qcom,qcs615-qspi",
 				     "qcom,qspi-v1";

-- 
2.34.1

