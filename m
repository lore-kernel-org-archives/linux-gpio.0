Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463555;
	b=DcwFof8wrgaiTPYBIyPV+C4JGYJ8FfTRZIijtluo8o1IkxAybMp90SDXea/DxaWkoVgr
	 mDrdPBN3/+wvsAtkQjR497DiOjwuWrpYAcvk86m+tRy/DwJcVFUFRvyf0IipywpxrC1Kg
	 8CLLqcMTftzz2vcVAXhQRiQXT4z6Twawm20+EjbOgnTvj31qSU+KAiFjdhA9LbXp6XTks
	 h306NR+Gy72Fbsrf11iK20n6IEsRF6CFFqgxqUMM5aVPKNznWXrm8FocV21kFGchD9dxQ
	 zmAREFPnh+qdmGLAMRVXgqDj0RsLI1xpcFPrb9lI8IesE9Qw/GHI4IqwjgO/1VlLneQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=;
	b=YN42m4ZD3AJJDf2Ui+VEc83AKGRjYypEWcHXFRvrM/yFT86QiR1L+dkhylJCCHUdNM3Q
	 jnMUhUMYBi/+7hXnrACwhVY3PdiZM6SqJXKiTiX0eiqpExy9YH56sjF9VssNAUr630+2+
	 kDnB1N7M1UlEJgO6Tm0fqQreg+b6l8ZCG/TcjSjLgGksUOBMrPPgj9wxWTpZSyP4bHhcg
	 ygAIwOOGN59TgAJCbJ4LlpyS19af/pArK4qZoqQSgp9GUherHiAxotJyV9ChRsmwT7Nkz
	 x8gsY0D//Ly1k83lJ/u6FZH0+WOTcI4FgepXZOMIDDLNX6ZBGpRjtsWYMPED/nvsgQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jxF/MHQN";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPcvWDat;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192DE606A31A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 192DE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jxF/MHQN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPcvWDat
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3Z12769536
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=; b=jxF/MHQNRK4rlZJC
	uidrjDDFeqZL8iSWhn8PNkEDS7Hgx79vauSEpalFIzPwkujyOatXfBEmhCN8bLYo
	IF/9hKoafE//RYaWdUD5A7u+na6sQgg1fj5lbkPUyDvPDgxY+xgkhSSefAEXX82V
	nG+oXN9KPMzjqvuFdHOFftZVkS8e2nn0HGeVbtGJHsXvogoE3Ti5gsr4ktTYHIIT
	w7G+T90Ta867z4di7fLATnB631mFFTtJ00YQP4qDmgDKkdcK63WosjtBnTjPxGGA
	z7o7oSHypZ2FgIfxcDT6RymzoCQrcFanGA7LB/Hy0sy1D/2Z/7PvWuO1HSssytGn
	JN3CTQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb5e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383ec96a7deso4198817eec.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463554; x=1796068354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=;
        b=MPcvWDatwtYh6jxBLmMD/rCxLEpOWjqi99GdC4qHws8IQKaPyjrlfTNAIdds4dL6SJ
         uF6dTCwxRggaiHaj/9UhLQ7+YS0Qqrz4NKwRvSm3wQuTzIABkvoa8u+4zF5xEp8iku0q
         phCUv0sI2/7cYbOf8bfFwUb3fnyAnmdFPZ5nLg99tIooYdhRHIIcEzmQgcUpgxXKWVAC
         FWuMNPO+7lwpTekAFiErnPP0Uii1WIkBaJ9KHVXzEHXnyRWwjg9qbPIXAx8L7+qOBeq6
         FW/i0Hf14B0T2geGFsD075VipG73SJThA8g2sbQjwQSyPBj0NjV3erqQ4MF+olIkWCnf
         dkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463554; x=1796068354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=;
        b=LyUUY7P263NTUnYHf07n2DF6QSeOWhmSidEyTQf9i0TUgRHe1WatkQ9jiC3K9IjLF9
         JJOdeSeE4wiNUJZrfmZU3KTkJwsiuLkLsl0/EcEQxe2vif4wQnt+tpLwxnO6IUKWbjm7
         t8Pjtl3p9/LuhM5I1Wj0D1SFfw8loubQjec15OR3feJtTz6So+Z6MA2vHYwTTZfZ6yWc
         0Lr/vbmko1Q+oEHR/Xk7X54M7VkhStLKC3x8JIffn4TzBkTzV6t46RiVIkQrf1qa2h5x
         l0Cw2bOnInT0BaBwmjWU5UTugLr4r0sMYkD+pYXTCULtq+qjcEEQ2LR3H8tvTKDBQKZS
         ckIw==
X-Forwarded-Encrypted: i=1; AL+hErHx1FEAq5JWzpqKnbkBqWQTBCjVlwcKaZHb+jLKGuP+/vQmMxrCb7bK6nxcDYxgfBnF7tu5OnqRvD1n@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hmk3MVUswQf8rs+djSRz9M9alCBXTy9hL25KCqy8jCj7xDTFo
	fG3jSmTaV6qJHJKTE4B/nmA/a9EQgT3BGXA0OaZtTr3qf6AyKLsA0WM/QgbvMtEydFUXVr2EV8i
	XrTajDr955TydA3sPF4s5fIDq1RMDMuGW00cUFrIbVjNjTN6iMdNdMdwx1WvL8DIF
X-Gm-Gg: AZFdTZeJ4ZRqjjeBwynehqwoiGKzEJPVYjzrZK9mGQdUhZsEmG/ac6QorhooZ0qNExU
	q5DE66I2y8ottwCdsJLfGqM90bEIgF3mzssvuWhIdFre05M+miyFlE+mwAJHWkC8ajYiYP1KNiU
	bSHs4cNBHJYKkkaXUmLQAUDOYawGSEl29GppPlYRQ5n18/687jD/DKza2/mPmZi3YcvdteBQDMo
	YAbGQY83cSqvrIKg867CUscNmhKoHXgCp68CPEBXn9WD64fUMSBEifxDkWQfEs3dhaYRg59AQjg
	9/xW7M9NUpSNZnk3sto0SR+1e3NAOtMMQDMn7KggmgHOGCupyZitaN0kxcWStk5JY8K2i/n3Kol
	1bUFBMH81oe5lvzizjpqtMS5LeF7zYh7vmf+2zZh1UcaagEZmv9H6Dgnrwk4qogQSZ3UGbmlhcQ
	==
X-Received: by 2002:a05:7300:7b26:b0:380:f32e:d257 with SMTP id 5a478bee46e88-3856f6524a1mr12179015eec.13.1795463553632;
        Mon, 23 Nov 2026 11:52:33 -0800 (PST)
X-Received: by 2002:a05:7300:7b26:b0:380:f32e:d257 with SMTP id 5a478bee46e88-3856f6524a1mr12178991eec.13.1795463553150;
        Mon, 23 Nov 2026 11:52:33 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:32 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:38 +0530
Subject: [PATCH v3 07/10] arm64: dts: qcom: sc7280: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-7-98db26a87500@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX/HW6L44pSF2n
 Q6jtzfmLFZexGQ2aEFg0vxOqY2I5oILBQeMT0DTIIKYT9Cby3hLOKUVwiW0LFmoi6APRDR/aScG
 buw0XKj0JNKVzLfayc2xoXzPNgkU/3cu11SsAEsXu9AXC04JKF8p+BISyOHVQ7KeU9bl5SN8gE7
 Fru5PLZt9tROj2apc9DABdjTFLAZib3uL8fUNfQ9SbvlTzHlGpi7lfIR09zwGY4On/NBg2l9cYu
 FSaD5GhZgiBD/eDrokZb35TUlVPX8UI7JZ2cd0VkE6unIqGaTZu3niIhAEsOZuuPTavd+N4a3a/
 tOCLEtYcoc8GFZjStOIy3CgGRlpsvZ/wDq+Dvkn8hIynKcITmbIlq/4EkJv8M/Nl9K3H27sQ3gk
 eBYYQiIp55WnnKY6GQBJ2UiTgMRaCkXhJcexKhIQvgTb5XYChsFY16JS+EHluQ25Hsuq2QhgjH1
 wd5PCXl4kbSOWsVETuQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b049982 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=f-mW_kVclKPPUklfXV8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: uDywSR1ndYlXJAeY683-1z0yBOKck3dc
X-Proofpoint-ORIG-GUID: uDywSR1ndYlXJAeY683-1z0yBOKck3dc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX2DyQEAxNCohI
 1tnYa9JAbromqkIB8pz0SRbys/+ReSdhTkfa20EHKy5pSQNk4U9J9O+B2PzkYumcwjPmtcbEyE7
 qAwfr3MVTajzBeodg1hpSWkW3W+26DQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for SC7280.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio60.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed60cea1514097354b8f0f59ffca2fc..773f4487d78301a18d5c27e9e97462e60adefd0b 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4454,6 +4454,20 @@ usb2_role_switch: endpoint {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sc7280-gp-mnd";
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
 		qspi: spi@88dc000 {
 			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
 			reg = <0 0x088dc000 0 0x1000>;
@@ -6683,6 +6697,13 @@ mi2s0_ws: mi2s0-ws-state {
 				function = "mi2s0_ws";
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio60";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			mi2s1_sclk: mi2s1-sclk-state {
 				pins = "gpio106";
 				function = "mi2s1_sck";

-- 
2.34.1

