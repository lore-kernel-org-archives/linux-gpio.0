Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014257;
	b=RAxIvoyUvXKXvK/xDu6gfQuzoK+WaAHGOlDFqgzLe7Y4yeWx0mhSPbWmm5FK5lIcSB/+
	 A43ObjnJQUBZ0Tj+qZB7ggX0dFy1hAvEon/oZWPsW3ZroLLurUhKfU10FR0f01UEK7vT3
	 I0T3hAgtBlEpTTX8aM036E3H3rLw1Nn6tLdf4TSCz1S6WHETMe9zlFkZDJ1Z4k0AVjQHH
	 xTaOITCdrgKYDq4HfiyNvr6bUGvFA6utwXw6rqhJB1OdemFzS/OSSNH4Dm41C5djOwrWR
	 168QfgrqSMe+4u6yuNxR0B/Wfp6C64mODIazhC2kPZMreyODHx0LGq5wu5PAgJ2xjfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014257;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=;
	b=hCJlNUlkbS67SYt54Btte4t+lj+UMPSkdTfHK8y3GHX6B+WpdSA66oeQ0t9biNXEv/YF
	 vOTj34+FUGd7Zeh8XNEdaH7rmf/+Gb8IKmKPEAdI5lzQgX9Lb5269VlqzLYe7TsT587jd
	 /YS1lmSxyhzTB/VvGmmfV5VMCdS4N05Y4NB/VmCoX3I7vLbpgdNYXDcUml1aZ/udBMJ3/
	 KPX8UbiAnBPi5cRCzQe3hlgGEQZmG4swsChz6Um7ar26Z2a/ZN1Hm1y0gIQED38WdFOyP
	 mqOEV0lN+9MnD3KR9gZuBIhPkmhG3exWOo5pdVzNAH9cVbCnVIAsrfWyedxdcoXPS0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npaCX9jt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5M9QUX0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B306760A6F43
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B306760A6F43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=npaCX9jt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5M9QUX0
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtFNf3034886
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=; b=npaCX9jtYxzYT5Zt
	t7JV3UfqfK/8A2WwX5npM8A8GheMCA+qj+c3P1NesESmYtTssFoxz6b4+uHeBRYB
	MQdKYlRY5jKKRc92oQ3Y+9CoYXD40WPyHnAURMSfEvePs2h6bFQe5ShF1QkSV9bt
	hGD/AP7gXGbyhWeRuATFmp5KoD2WAF6vgKgHU4u/3pxpu8CrfwLHnJAKvdK1lLmp
	z0P+FZXpHNqfy89HCnX/waWyrlQ5SqForeAAnhpT1gfzezJC33TMkqvbzbshzi+9
	guAIn1wCZKyXU5vb/FPwi/Qh7c1sMuHy/x+7u0eqFAk1Djt/gzTvT+nMnBWV6uEI
	7xLAwg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y069w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:30:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd6532dbd7bso1726042a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 04:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014255; x=1793619055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=;
        b=B5M9QUX0JGMgRE84M896uv2k6Q/lz0+zdEUMc22BZS0RUFWPl2um7bbjjZfAloBC7T
         ID5B0tpzFouSZFFvx7zdVQTSoanL/x1b2MIARjxBOEpvuD9vE0tAQq1NBWLOhmGsieLz
         q1GbbU1w4YnM3yFPYt0ToFQ+wV3V4KV5rrIOf5QMpKksD5Pt+qX7AjNVC15Yqy5p/KmE
         83AKEHiwkAn6v+lZ/KOql/1l05B1pSxify5pDf0nvHrQcgJH7NkjaDsrA2pn/jBcehWW
         5stxqgQJ0WuVKcpM5RT4XxWjEpDIJc/Hp8qur0R4FFcbGoTPoZlwbcvz12dZBTY9w/UJ
         gOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014255; x=1793619055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vy6MWzt+u7Epen91rEvUfbd4N+vYN7gd/DRRZU9dBVo=;
        b=BQkbx0kfDXUUbOFku4dwR+TKl5UxRMljIlXQZYT3vP4tFNU1oYsYQ6nZZx4FEfc4zi
         OoodbvU8lMKYuMumoSc3wkUr59nUKgXqBo0IaArUh6cN+ozo1zODXifQgJ85mrPv9asp
         nWY3NReIu0xFINdW/xC4kUHokQtA1T9hROiTPEp/gEwivtWjU+s2ySgyPIaiYIFOUacc
         l73IsxFA7MYtiNBHXYENwle4umq/sUaeB1PjLur2p50iipSMLM8SFLQz8CkNQXM9M29u
         TPOH6fPoRpQg+3TJUVl9+WxJ1joaIqatpgETRRFUZ15G1Q4Qt44Lm8DVXJBPpjBH5gqy
         /e4g==
X-Forwarded-Encrypted: i=1; AKwUvBzAzIuUpGfDFfbbbRN4PN0sW6GOQF3jQ5tsJyVExLpd0MzKn4oC6ialERXrF1q4oPbdNseDsaO7SLqY@vger.kernel.org
X-Gm-Message-State: AFq9FYKzeQPkwHaL74QM+dsfCPwylCga5DTdXJ6/OvOgHGuuqcGwjaZr
	f5ODpi7yLnzipcEOdgtXSctrFroDPzGRjowXYwZx7mUwWf4XwAMK7/8/AXWUziUMAHjR51BxMl4
	w+qKkDO1ylo46Zj7Em41llFF85bgt8X5uV1Xbofqotkqk1GGEtisleGjNOGGfgovCbGvQOgbB
X-Gm-Gg: AYBFou1bICTsmUxy91I7m7W5RjcyN0VsZAO43iIMWVKLo2kap9q2qhiy4ZFDtarh18i
	jVWJ9R0wywxI78aFqA2fjJsMXQC2gLNY5ain9shPI0v9dbmjQqbWp1jHMO/l+MQNfWqhCAnhctJ
	4MDk6b5XaeSVPyBLBRWKXRrVCnzN9OPkTwuFvLgr447aUy0d/NVsB4Ochlh73mIzsITp7Od49k4
	0RCaBxinm3Cu+AgXtkbwPjpDCtq3iQtgnjRRtx/pJ9myO8Eq++FN460ccMtLdhX5Gqa9ErxhEF+
	HsgHzuaHWiE6Dp4ztMVdy/zvTqP/CVR8eE8qD7hO+l30VvlxEIZM61DXLFAxDi11pDLmArfJn7p
	iEJJSJWCeWK7nv7Yt+PYFeN4=
X-Received: by 2002:a17:90b:2689:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3ade9a35ef8mr5288318a91.3.1793014254504;
        Mon, 26 Oct 2026 04:30:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2689:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3ade9a35ef8mr5288290a91.3.1793014254037;
        Mon, 26 Oct 2026 04:30:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:52 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:35 +0530
Subject: [PATCH v2 09/12] arm64: dts: qcom: qcs8300: Add GP M/N clock
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-9-ff8e4bc8d567@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX5d80cf+ZSoey
 DnsW3t7hiU6mhU4oZUEddcjzQY3pYTZWuelfJUFGHdII/PFJ6Ep2fxBRQNA3x+jDHy2Bah4vM/Z
 ZdVyFVkxhJ9P1rEub5ubHFqGbAV6O8M=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf39ef cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JIsdQxy8wyWm9aXyvGIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX3AOKg7DLYhvk
 TZGhjdMJ7DkZ4JKqTWX2JYTXgElAqq8Db7r4vxt+Hyq0A8zUnFpSXxrdRaeg2KPbVwEORpRUSLQ
 wBUggJajCVwl9Pb6zbxpcnhdq7sSetdbZgYcs/KcNOEV7sE/TlXPGMBQIXfFghyp9RGmBkxZ8pw
 5XBkR+4cZhvH9lRrv8yZlvRXYKqjjsWK4K+IyYlSjtkUnNSuYfXjaPpbK62SKTg26nOTAjG4t6Z
 R00NzYNyqTo65aYDrDqNXtHCdb8JpTRLibxVO2ZHTyyzuaPdMu6/6rSSa8eJy5QM1L9+1XmfUZL
 ZovAJNzjdwodkZWPf1rOCFDAonrHFXFBfWT2PhW3gXOYTewyM0PwoBeI/ctj2vXUgI0d4EklZBB
 1F6oK5fyYr6Vgk4LssaLgHZPksLjCoAR1f+kpdqWUI+KBE/xS1ErjF7JOSJfbQtKRTkVvJYU2J6
 ZWqP4FRygD6zlwFDdMQ==
X-Proofpoint-GUID: Lj18WpIQXLD3bDN242UGKUUK43R206fc
X-Proofpoint-ORIG-GUID: Lj18WpIQXLD3bDN242UGKUUK43R206fc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for QCS8300.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio32.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c652005dae9b93bbb8f6a28b48be3b..e122f70eaf20c65df5854e644887ad16da94a7ec 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4891,6 +4891,20 @@ sdhc_ice: crypto@87c8000 {
 			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs8300-gp-mnd", "qcom,sc7280-gp-mnd";
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
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -6457,6 +6471,13 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio32";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio106", "gpio107", "gpio108", "gpio109";
 				function = "hs0_mi2s";

-- 
2.34.1

