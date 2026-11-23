Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463569;
	b=y40HgaJ/UKPSjgdpAngVQSp7Tw+64oh3ZBq7ymktNFNfFWBObdRI7hvs7R86ts25hUif
	 YpcN6ApVRB+E1L1T0F4YW2tUUQQ++tyZokTJeX1o5nCp/mepUNIl04pCOJXluPY3DVADd
	 9sDKy2WfsB/L0tjDj4fKBaJrwKJ+nejVXu8fEGyNNXasBjflaycOEDjZwmZuQhJvDtkgx
	 +uK8qh1A/8jRcATeYDN9yhNoTtpsZQQzrS3/KnlBNl7wORoLkRY2i68/dqU1ql4LISeg/
	 v2eNRQOU3o5x6IUPF8UIzJEPjenhKpcAMbNdGJalEu4HXRhIJt5ckIZL3ssbTEQRVtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=;
	b=xxAPHC5CklLmCzBZrAdB6w74d7kn9G6vo0macHybUkN1PoWoNDpiQsa6NV8TDWr1MucO
	 STROtxe4FITgs9CiOiD1PAENnzTbA6G9Be7a3zgYLGGN9JbQv4z3jAk2DSekq6oIsytQ7
	 kzKH6NJL574TjWnvq8y7u0fqcFZtJhjvsQj1UX4uCrRg9lHr1oBrMu5LVk09WmQ2kRxEP
	 +ArVfy0BZ3U2cvcdqLAFVmYTYQkdGn1edMncaLFsDJgfyhOEHbN1d9ld5BLAI+tmI7ixe
	 dm/TAhr6xx10GMwuTu02WAeJUnUKyVP8BaR6ajQ6qTfU5lJ4py2ImhrwJm6qp3N0CJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk5OOLF6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OnDZg4iG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355B5606A332
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 355B5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk5OOLF6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OnDZg4iG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJ1pn43211982
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=; b=pk5OOLF6DEIadDHg
	RlXb7d7E5t8XB0z+6gUx+XTk4g4tndVYynxJLHXJ3406JJMyjVhNipZvsMqQ5whq
	qxWl2KSc10E4Zj3JuLvUvYOMq8s9xlbhQvfyX0EZFCTYC7rEIOrvzHA13SZ42zOy
	oQyn6MDdBvfdss3jnieqzm5p8YJJtfSl8M8IILqV/7jqtjiiaThWR/f+KT9APKxs
	U4BNUkwPG1oy8K5PFX/k/1iJgEgYDIgX61+RHqTVmcO3JtNWqd1TRCWc9/s7WtOM
	K6vuUOg3wkYYfXld5lOhtesBCCLyj+oICCKZuZ/rNz6vIcKaqfl2Qk+Cv7cwCXDH
	MAIxKw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nr6vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so9962610eec.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463567; x=1796068367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=;
        b=OnDZg4iGAVxr7B9cAwmxCeK7c8SLlFnSFrhFxjIG06TPr4NfgiWE68xrtZrrYTh6NO
         JUnoGr1GJuKxDdswmrwl8+j2YshJ3l9lCbaDvNfquVxjSJt6f2AZsqbV9MxkomkAGWuH
         2FHKcu+yynt82XQ08MEiGmfWSxlYrNaZu0TFY6pyiD5Zbf5/5L98iWWNkNDR2aZS78D8
         gsElgimNLkCRrDQH12EFVwhIr6++iyqQFEe3ZDYN1l0QXmuzfMs4PL9ko+OLAYvcq2uO
         k8esH5/3GzN4PFWelqScIdX75dBazpDAq1PSA7JlZIO7X9I7Xhmpa2oXxPE3oSfntaMN
         P1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463567; x=1796068367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=;
        b=XsDPFQ313eLVlylGHyDux7fk75dF2j8PRsDVeMz9G0g92QwVi9oplQnuiKQHzO3ToW
         Ott7Zh/sMI0db1oAa3OKrfN0KSHFdjPF3y2E5OTCV/3OK72M2Kb4LdEUAnVKRjX5Kjfd
         tv9Gplt2ZWrzUp5RNqERbz3SZ/w8at17sdLhUlD8/8v+J6+D8m2IA+HLX8IeLoo6vcID
         2da9IGZCLJHdMUd8o2gqA1LogtSxhuVEhOk/ehtbYPIk3cJKCuYMyHA6+o1hX2kYP3ib
         m00Zv37+yoSDCuwFiGxJ99CVVSPbh9Q/m3MvcvD3qmgRdeCmN3wmoQMmj8hSdTJaH6VV
         kB2Q==
X-Forwarded-Encrypted: i=1; AL+hErForcP8FL5ruHd38Ubk4cDC10BnGBAtVf8KrqQqk3UYumqznyeR9E48tQvHMLAi/n50T0CM6HXoMwiH@vger.kernel.org
X-Gm-Message-State: APuU4Z+S4y3MEmWGJS6PiDv0rsOdyWc3bW7UHatX8nWXKz5AfXSsgR76
	A95Oa4yOUDe0isEQDc2lydNUNtx3WFG+qy2LISRse1Df/dkHyuyBuGo73A15NLTKhFL+jC689Nk
	NLLO+HDe6SvS9NRRa1SNAD5TKkcPxW+2zctmbCRo4o3DUqaN+CSJHgx51eraiSj4o
X-Gm-Gg: AZFdTZcbzl5bffv4TLucKlsi5njEA+sX0fjPEgl/vFvnE/E+o2PCNzYMmD66pxjXwWg
	G/W33XyCdkFeaAQxVDdT3SngHos/C2eUT0y/9X65iUnvN46P0Po01HpMpEjQ9otn2FgKzpcpyjh
	xKHMy+KyKJeaBYOvjCKzNaVeFq8/yrH1dHqb8+gRy8IDyzGgcEK4VxJVKMZN3vPyVSXXzBSGCHb
	cz3PETGf7cN4LxAetoY/U7sRQplURBkTio10MfTG6Vdx/dM6KeCzffr8PoPRYmRLPwe5a1Y0MmH
	QRRE9O2mh1peaQC07v9ni18xe5A1Y0MXM742QOCIyqskzn7QGtFEJ4txtqmIdkuYVuxjIO5pF3Z
	aijRr/Tn0wOG3LEs41azefaD+IlxQrgrgeKcTSG06K2kr3SEu3b19dIoZkN+Q0zXG1y2LXJGMmQ
	==
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr13083792eec.32.1795463567262;
        Mon, 23 Nov 2026 11:52:47 -0800 (PST)
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr13083765eec.32.1795463566804;
        Mon, 23 Nov 2026 11:52:46 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:46 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:40 +0530
Subject: [PATCH v3 09/10] arm64: dts: qcom: sm8750: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-9-98db26a87500@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX7gV9V6q+nULz
 aZ+vaCCtLShiTBBocejR4lFkhy3O2+XyG0dGstJ3MfqveMmS4dn+gAvtIFM4j7OstvSgLD3GOTu
 WHvAqdGtSqcvqbSkX1j/jefF83mB3W/SduhsVSoh3/XqyyIJCwtgRHv5QAAe8ZyClRzIeLd56uf
 Ia38/+VM517PUMUhrwgB0MqWrijgbAmpGfKFGt+PLx+A9WnD59RDqJYMlmMVO2n64hKnmFmIZmy
 Ua4bwSKgtg6dJfo67TNeDrINEdDVCC2P3r3ajsa1OPQC5UO4VcEL74Sfbs0vc8Xca2kYbOD4pEb
 ikpSHhQ4XQ2Nk6L+m+yZ4nxEDH5dsBCl0e7QWIIerMwaT+8VKFhfiVQhjsIt3YCld2/7E5gd9dA
 zc3ogj9/AY7MlNGCS+XQxydJyIvqXriy61A0dtejM5j2mR8VAu3BAW1uvd2wVkMyA+ny9ShqJH7
 sYYRdVSlHbqOin7zDTQ==
X-Proofpoint-GUID: JgfOs890EHPOhKEOoNo6_Be-ffYROI9Z
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b049990 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hYfjAn83TXJ5YwiWwP8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: JgfOs890EHPOhKEOoNo6_Be-ffYROI9Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX0uye08YnG4Wq
 VyzsQeQLd+4+7TIWkuFxgP95JT0qQauaJxQRGRTFjz7r7Bl5D8EUgy5aH8kV0Na/O3suZ783EfX
 i0ljPfoYCxNyxuCHR7WMqdbaQET+Dds=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for SM8750.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio53. The node is kept disabled by default so boards opt in
explicitly before the output pin is muxed.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index d8a853c31eeb15fb1d0023fb8b5a5a59a9ed763b..fcc78bb3c8334b20561af6be87818af8f5ad461e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3067,6 +3067,20 @@ opp-202000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sm8750-gp-mnd", "qcom,sc7280-gp-mnd";
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
 		usb_hsphy: phy@88e3000 {
 			compatible = "qcom,sm8750-m31-eusb2-phy";
 			reg = <0x0 0x88e3000 0x0 0x29c>;
@@ -3921,6 +3935,13 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio53";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio64", "gpio65";

-- 
2.34.1

