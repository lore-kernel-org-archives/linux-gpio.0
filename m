Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463576;
	b=R5T3WvoAjOpWEQORnychBLb2ph6fLO5M+qaYS8KG9d9daALBoWFdYvAKRD8D+P8uLtBz
	 34ar/3DNH3jepSIBsAUzlFraZLHrkxUUvGzQp3a6NYlc01TP5zw/eHUSyVZO4UogYXmoo
	 Nl7TxKB4podUu25I+z3VhCTq/Y6miwlY1li/RiYkNldGXzud06/Q0WaP2CaRBztgYJRdm
	 lubkhRHr41JyxMaVYf0gNE/hvM1Sp4UICcWhq82yZwgoyVj83iYeWP3PbM+15OKwrmRt6
	 Czq/Fct/jgAO1p+up6Zg/MpsOJtQrStDgTCx2CO+vkCK5W76psv9AmrSLH+wmuygNiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=;
	b=TgLNvc8OA/paKo8QlffknPNJqE9NPLvymeSN3C9gM4KaEar4FJ9k8TvlDv5y7HTW/LX/
	 iLm4pXBpPD9iGjtBfGSgDvANo3tcBFrf/a1XxZWIoQdcTusRJE/OisKbRbBBW51b6zOQG
	 FEh75ljgQ+S8L8CCl+bka4CrwtacWkCwAtPbdo1TwVAxp6DKeA5gwoKhVqsVrqJ57jRqV
	 C07PJ0PAotF757tNEJQ/NfcFGOGD1oF7LH0N+GV+u4eSeSBLuI61bbP5h+nhShl2JjX1V
	 uNZmU1LCZngBLhx9fagmhf8CgUQiSMhYQJx/LWmLMcT4TMoRr1tgKahqmJFAChB7kmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Y0hE/zS8";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+p2zF5J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D896606A332
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D896606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y0hE/zS8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+p2zF5J
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNKHq647193
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=; b=Y0hE/zS81YmcykKG
	Ecx7laIbm0Hzc+GkteZPg8CAdeAGeIjeZGQU48SH2sird9V3JAO/iFfkwoCUTVoJ
	ZVi5+y6FzW5bFIjuu++7tSfyGdhekHYdXAcIG+2YLz3hoiAkU3sxbxbwF4LXshGb
	vNLB5AFID6gDFqP4WY5cUG5OCgZdveos6bv4aXOO6YMNMBQA4PjtBkDs15bGO3BN
	akrCYrB79oU/0eLleq1UD76CjvGxhlmQ16hBlJvyr8Z7CcNVqJrDBGMMo7JXwqH7
	W7rbNxoe6G50pzt5w1fRbLAJ8QtqYe4856foBuEFI9l2iJpcUtqlAbaP03zl5Pcx
	1FV1ZQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg3j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386b8624cf7so1965947eec.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463574; x=1796068374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=;
        b=a+p2zF5JtQFLdHMI8jOzvdShY4shu+kItzg/zAcqC/LI6swQaqMkUdwPPxgkJURXip
         JevgGuQq9EkEybxmx3eOp1yxtn1hzXV4RPTixwSbRKueWS4BhkPotrxteuz39b3sqbT1
         on1egO5aBvBWjKRhbS+9NNQWd2a0PYH7YBdU1HZbnBqtgFhcEWJZku9wHJpKXpxjAocd
         fy+TaU8Czy7pGr23G3n/RHtzgT333voY86WR9IHilbePBBuV7vu6oWyrTMmNZoYvKeS2
         etZL69TAVtHMOk719w9WoSvNq9WoVkRoTRWwkPRkn/jBs1NBKuw8Y87HNLRf+Gg40A5z
         7OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463574; x=1796068374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=;
        b=KRQUrjs5nm/ZGknTZMYnTfIZlbBtcZxduXXu/hn2Ag3KVYwuj/HvANf8XhjobDRQ51
         w66PooEI/v5uBEGgiOg7vCPS74zsYUpvL06XzGERUUhf0vchphaYbfYkfTsyKI6Th5w6
         yuHmPoxgoQxvu6XHpIkFb+Y+Op6AIW5UtzzojMh4X286m8vDBKjX9kbhvkDjlU+IBNeX
         SnzDJXa0NopCVH3VhNj3uUa+9Ge5qghOUGTh1YUm8Cr17Oy75hLgj6PRSvxUceXdwEey
         i6Gw7YIMPYXgH3hod4vpKVyYs/ImIGc2KIJq0BZ0jUd1ruQolX/GuJxkTLgpnZq2agz2
         LKvA==
X-Forwarded-Encrypted: i=1; AL+hErHW9r4Dwz6eixeU2uW9qJiWNbv9n/4TEckRaGMSu+49UnbIsA11exi2IU3YY32kGJLzyYv5iObBAiWp@vger.kernel.org
X-Gm-Message-State: APuU4Z9vplOdZ6O3i0Ux3SPC+HYp6Dn4JexT2UwlG0F0vaHqnJX9AH2x
	u+rhVDKluEG/mmyOOiWotuN5K902f59k7i/+RsZEm9enPS+7k8RVNd30lyKoUpw0pcSuPop7zje
	vb8hL/qMrgHcWzMB9ug7hkYmSxlKHYI3tXadj+guEIXP5yu0fSlqLm3ktGIw5tTOh
X-Gm-Gg: AZFdTZed5AjxCzXWMGbQdpakByL6kVEczw7g1ijAWMZgwqUEEvh2wp1wOeqZZYYNTkd
	2XiDJp8x7VFculBW0OkoRQCz1GHNpaDG1MlN/RjQ9Wm4MYrwPz3/UENyDgjgfnEbKk2LMbjyQAN
	4m7B28hRtgHIaNMT7AzTzU3ZpFihjBifF2ADROJmz9+tkvGU5SjYWoq9x3hqf5gv3W/EO+4tRNI
	IGDoOddpZJJi+xpC8wZH5rIQbt+GqULCOsnSdiuS/9kwoXHclDPXF1QhKkmUBR6dExMD6L47yxW
	WiyHR6I1FPTBd66wJYw9VV5w79w5YasBdwXEyGpy0c0tgNCsR+evsvn5xnPq2RfLd5RkwwmWOB1
	2oo4BU5NxCuo5aEUVLnJiBuO2okLOOtw+n6GrXDIOBV5t6Xjpx7yh8TchdwjP9OiYSJr9m0ZDqQ
	==
X-Received: by 2002:a05:693c:41cf:10b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-386b1067b60mr4405175eec.41.1795463574046;
        Mon, 23 Nov 2026 11:52:54 -0800 (PST)
X-Received: by 2002:a05:693c:41cf:10b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-386b1067b60mr4405145eec.41.1795463573559;
        Mon, 23 Nov 2026 11:52:53 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:53 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:41 +0530
Subject: [PATCH v3 10/10] arm64: dts: qcom: shikra: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-10-98db26a87500@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b049997 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tsJniCoxF0iYytplHVkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX2914z1e9SJB9
 8bN6McyHL9U7fibuXEUuQ5FWdjzlulZpieB+uCu5ZHWQ3U3KX6LRqeTMWSwM3ne0PKE23tDOyvy
 Np8iBROvtBjNs40I+Nusij/5/1TvIoZ6VSuLgDMS9YyGwiHuRCfMAvuUmnctshMzQ8S76uPxvTn
 7nBu3bf586nMgv5xHbVtMawwphnrYZt3fJCBC/aXU5Hf9h5Vstd2eru2sB09FmUE6yE7GyIVzMP
 ylDehHmL+RWH1B90ET6PGI4QtzuFYwhynHaq2cW9gstm7swzrKjgv/x8J0oUi13lxLuobCpcbcW
 T+yyI0sSA1PXItlVB7Rw59l6bjvvt/RJ84dQc5/6G1mfCDvKUkF1bl5v+rXYb1n12Ruvtov2ryN
 tI/SppynalLTgwJQRb/4IXmh/6wJtrtjjk2fQYQfuX5slQvzAjxaFFIfwjn0Kki/8YZq34KSf/l
 ZAvUQPYS6AjBpIm3n9A==
X-Proofpoint-GUID: Ps4cCVm01ucVDec20PpiWJcZktixkiKR
X-Proofpoint-ORIG-GUID: Ps4cCVm01ucVDec20PpiWJcZktixkiKR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX0ol46d31rnL2
 x7mUCf+nmuUVG48E+fBp4LYOWHtlHGTAMBwR/ysjEHTNyoe7WXmjuzXp3cFlyEA4N2Hk3M4ucwg
 +SW+f9LUVNWJ+Z2EGmJIsKMfOyRofqw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for Shikra.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio87. The node is kept disabled by default so boards opt in
explicitly before the output pin is muxed.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582c643f97e2b0725eb88a9f262d83c..a5079b82f22f518fd9e858303292bb7ab874e1b9 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -992,6 +992,13 @@ sdc2_card_det_n: sd-card-det-n-state {
 				drive-strength = <2>;
 				bias-pull-up;
 			};
+
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio87";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
 		};
 
 		pmu@c91000 {
@@ -1303,6 +1310,20 @@ sram@4690000 {
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 
+		gp_mn: clock-controller@4713000 {
+			compatible = "qcom,shikra-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x04713000 0x0 0x1000>;
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
 		sdhc_1: mmc@4744000 {
 			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
 

-- 
2.34.1

