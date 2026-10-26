Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014265;
	b=ISqWcMURZ7tyFqhIzUJ9YomETvz3p6nVLJTLaT+3WcfW9DACnMOeb6/pDQkst8pHDGBQ
	 +eZhHliXEu1pzAqU+ucsNEngsVs1EypOSAZd57ykeJmZMVERG0g5OQvlw7yRUd6Z/VEg2
	 2kczChmbD2rA7GqCQ6Lvpt7/Q5w++B1coaFfxjhAE5k9elz8hnOUdHGBW5CkUYV5F0Jm8
	 coBu34ufGeBIe+vO3BqQqmISNVeLv6T5Hd+Dz2Vp1gtuuet4IHniaEfYogqbfuP8qxD8d
	 T49BF1T2VzchvRubmI7Et4Tavexhb1Vp29d1ApFjnatwdqp/FTuYKj324ObdBH2UN6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=;
	b=wc8aFjqJ35Pv0RlXsrqrE0I+gjGrwNvhczMMjjIXu/oHb3+VsPPAXrLKTIkiCkSXDMQC
	 +FxeIAWUB0A+lkAi9q5gaouJ9vD9ivS5pHzZZ+yGvdP9U3xGPMGmVL9XjX3iLfjSP+vGY
	 dfBu/ida7aap268LH71gmX3aR0IjF5/XOP4pNqm/c5T1VkWO9sYUZj8psHI9Ou1hWWPOn
	 QbqDzgH3lfRUV4FmtSOS/9DrgyT4vcqIqTmVXcKlCvF5+NBy4Urd1KuyQD4U1C2tNGR2B
	 G1+RcrIO77Pn54y/E+wb9Di9IVIIYZ9fxK5DKdR8GJGKheUzfTgy8Pxrf5qUFTgXnxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HtLNkUTM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e2o3+m+K;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDBE606A32F
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEDBE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HtLNkUTM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e2o3+m+K
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt2VK2169214
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=; b=HtLNkUTMolx1qtB1
	TW5/7L69PCVG1AC8+nEv8EkukyHyRQJNQb40yUZKsJ5EDYqw72mO+fOSfRLbv0Ac
	zntv23IX5ptpf/UNZH1u9Nv1zjveEE6vBRXzEYa3J8aGU16C12cN9HH7k0ouPM21
	9NrCuCcws56R8cAXOFnt4c0xEw0nflWVMIRPGcWFcplZQZR/k+uRt1S2wbtNLs+a
	zH4FARObvu24avwUyZePi9mVCBUszUwSl9CXTDH/ctx0VbZ05WQesT4mBkMeDa46
	LZF66kpm7M3t2hxvp7tZyMJ0jMihkIyxTitXK/g7z0Vcd4BtWdbr6YP2ZIi773M4
	Cfi8hg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60j30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:31:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso2750440a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 04:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014263; x=1793619063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=;
        b=e2o3+m+KipyRkTqtdXlramFCzv8r8fxjwX+pyT5R06B4lEgJkSYV6/S+tmIwm3h8Vl
         swjzELFX2X+eFS2irzOdIrNiMfSbB5zT4D006UULbfbkDpUPf0AQ03MLe5IVrByBtRd+
         WctOZaq2xilOuegxSsMPZtuwo7s+QiulxYY1WbCsCaFuFG98RK+3YhMKldBF8ZMTmPMI
         Cn3Y4dwZlFvWb4uQTyw6yxTiAFoS1EyYTpUpKLiJDf/xpjY2yHvJNr9wpVWF8YwayQGD
         q3y95QRGb8DUvhOnM1DfONg0g4iGhHnTKLErYCzqnxLuZF1WapZe6qT7BqEPtZuh0pBR
         v2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014263; x=1793619063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1u7BOZ4HXoiDpqQfE+eys0BaXB4J5QVKelBVG2AU3rk=;
        b=bj2BidK2mzsP2yltNpCcGwKf4r6hyP8ZKE+/XeGSS1jykjZP0mAMoyq9CzDSAq4Vda
         UorwH89D0236uOjXcUMT++jF9EqG/9lOwZBgTU+JCTW4dFySakcFyU1GRM3JYrbyn3my
         D1240j1a46XkNsGFHJZ6AN3ZyHPhQ9o+NkOhfvZDcXp7zNQ24+eJrwvkVfYDuBCiIHe5
         adkGwaoNk1DE9s4PONNK5aIQKM8UAQgT9p9spy/YGn/07zvbF568cjdkXPgrWPWRkKia
         PrnctIX+biKnDYA7W2Hk9UGkR16CcgfsMQcYe60zNCj/1o3onPUataHbXFIAA0aa6ngD
         9PeA==
X-Forwarded-Encrypted: i=1; AKwUvBzer2QG9MnjsCiB0l/8kO30kxF9rpiqW3LkZZcvqfBVuYsBacUycyZFCC5CC0CtGeh8OdRALZfNV2G/@vger.kernel.org
X-Gm-Message-State: AFq9FYL4T9yDgBuzwX39JLfK9uBdC+/XOjKEVoxzWgc9iBsfwxvXOWc0
	5jxo3gJbLKyuPqfgsAKwH/y0aToLco2d7UJRmmRoxcL4d58LT4HcEty5uhVsYGivCgTXxt+IeXL
	7pBYNBJRZbM/ksmHiHOzA83yfShUDvXjbh/2DR5jdCIAFuXAuG+cyfLbP6p9LL53UNcSE3YZr
X-Gm-Gg: AYBFou27sRJ4maFSrwq56zg/x2cr05eBuio7EN35zyLk3CO+NvD5zdMv8+adN0O2Qi2
	R+HEF1RS+/a/8teAJSR4Py6fm7Pw6NT0qLzArUnwBl6AQDLCWnKCDqdmThIplixSfI8tVjpC/0w
	3PSoodcoyHrNM3aCONVoctuk/IYO3mZYinw4zURDAz0BsOGuwaKXfh4bzrPVHAuZFwX2FPxm1Jh
	WXYY3Cp/DJbh1oY5uTCHD7gumN4+JUksg082hvu6CJyRlvclNNuw5eVFp1yJg8mhQR5ZeqQjTxg
	QDcFEx2ftkGq+xOt+6F2oZQ08G9DmATJUId7bD6vRYPBwuxSBAMjz3p+6x5BCbjcvvkYsIfVRC/
	uuMpaRNneT+AmmRvxl+GfKIc=
X-Received: by 2002:a17:90b:4a49:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3adeb0f8d94mr5582102a91.67.1793014263368;
        Mon, 26 Oct 2026 04:31:03 -0700 (PDT)
X-Received: by 2002:a17:90b:4a49:b0:3ac:9d83:8861 with SMTP id 98e67ed59e1d1-3adeb0f8d94mr5582076a91.67.1793014262860;
        Mon, 26 Oct 2026 04:31:02 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:31:01 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:36 +0530
Subject: [PATCH v2 10/12] arm64: dts: qcom: sa8775p: Add GP M/N clock
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-10-ff8e4bc8d567@oss.qualcomm.com>
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
X-Proofpoint-GUID: Q2Q7DWo2JzuQ42kRp25Tua1IvVJQBp_U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX09bbdcPKI6fD
 0hDw1yGPLNQ5ElEc1NecX33nBzWi/XTrFxkQpxQAFGd9KStIs442aa/Pz9rt9sT5cu7TPHAp7Dx
 scOzzifeTpxrAp3t+LF9dWK+hAvfaX4f9db4gq3eroXFkkYf6L4yoV6st2nM4bTQIzCXH+UnhzD
 JVPcBEC6lFWJFeJn7jCm1gncxoYkYDUY8qDmSJvIL/y8BANJGZ0QaqQ8NfSf4fL6OyB3xhVsxJ1
 XKT2aNyFr0foV8BopvvI6XCfDRKbZWCZ/5dnjOZkWEV7yOntTH6XGwxiZ9VoG4WSaDZ6uvltYyh
 biMyINZV0VfXXZ8t1cUy25cqyMsDC5HSz2g5QIEQJY0B9D12mAJOX5k443VxouzvuupidLnCVaA
 Oyfxkqw+foiJOHb00kEkIuJwkxjLQ/Up2VghgShHwn0B4Ttz1EW6+uUsacVEPxvu91HXjcD4c8n
 MFIcjmOpDgesD78OaLg==
X-Proofpoint-ORIG-GUID: Q2Q7DWo2JzuQ42kRp25Tua1IvVJQBp_U
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf39f8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RQSmaMWm8AJIs-iJKlYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXytMbVpRxmQ40
 Vl3t/P5EK6/tgwzmGcc2EFMgHlk6D46433RVk1FzklgvnzjJAqwMDCbavYhcrp4JyJNHMeC4o6M
 29qDHLkeI//ZkWaSgmpZdqQgNInY9dI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for SA8775P.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio35.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518446ba2ea582e8362e86bba75c379..4132d288e3a16ab0a6d8b6d0816e85671bd25c73 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4348,6 +4348,20 @@ opp-384000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sa8775p-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm_clk", "ahb_clk";
+			#clock-cells = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gp_mn_active>;
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		usb_0_hsphy: phy@88e4000 {
 			compatible = "qcom,sa8775p-usb-hs-phy",
 				     "qcom,usb-snps-hs-5nm-phy";
@@ -6017,6 +6031,13 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio35";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio114", "gpio115", "gpio116", "gpio117";
 				function = "hs0_mi2s";

-- 
2.34.1

