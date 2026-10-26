Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014272;
	b=Qp5f/kpLGQJ0O7g1+vr0toOJilKKw4j+rPAdUi0P1jNqrXkp1TpPn3le3emex1wn51DV
	 W3hjqX6zimP7EqYn5HU1DKF/1fo0sRnyqyoqaE95V1vwsrRimUQ6/M38PCy+moJu5bpyI
	 YOm2EK+hFEJJa8EjHB6F715Yclm8ZLIcHZAvysgf6YOKimKVHQVuyYkVYlA2E1vAbOuHn
	 S4yeW1AVrIlsG9wa7pe3Z2pbdSAVv60VGttnorhUghbbF1lrtmvNsrUf7PW1MtKmpCuRQ
	 GY5m/0CGDG4Mv2u33XXRCZxRbh4FBPfX0rYVeY536TRFD49CqkPCsw3EZLudVqtfyFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PN5PQEqoM03ThjwzMKni5i44sYywLhtbqVb5oQyGOvM=;
	b=B5oTGGn1vFZCzM9GhKpX71WarOEfvYS/ZMhS+fv14jEEzKwAET62/sXG0F0h8TYNRdT/
	 7MksefJMn28plVeca+RFd46JUAQDiQwwQvliNwZvakzZDCv6XR+fiVa6+q/XyjjSX/if1
	 k0mXyhD27yjCU/fpuLBdZfJwmkJF4f8RFjcQvx0nDvWDfVKOkRD+X/XHJZqS5fZlVjZet
	 6KsSgdidMNcWJOwN0MQ+hGZ3WCVYNofvV9dVL8ZBTE0bz9+soh493EckU62jPvh2fUwg3
	 EsGG4bKufLmmJsWHmW80N+Rtft1LE6bBM+hJ8yqU/HH+vK0J+2q4dxwkEk7PPF1gnNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="O7RW/zIC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="jx/zhB2i";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6069E60A6F72
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6069E60A6F72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O7RW/zIC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jx/zhB2i
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtYDL1547962
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PN5PQEqoM03ThjwzMKni5i44sYywLhtbqVb5oQyGOvM=; b=O7RW/zICp5ljs+ax
	SoMTMgPqRK8nN7vWGWf9AhDVKAWbLURmQdBvAe3JTu56NjBlAdlhECA4qJOZw2FL
	2Wt/4y0vapLJLJSgdwy4dCYK1iKo5D7T+m2IgIm9nzj4TdgDzA3FOPgpZYcw3Pxo
	Is5CuB74z8yz7R1X9cfRePmjk7JXJnn24jNFfEB2LzVdQ3VKlkDW4qGbyB+Crqdl
	0ILwSPkKgCkunyzAHDwFicoJtlVssmo/WznG+dMHxnLKxmIGaxJFOdeZE/u1+XrH
	tY7pZbp/8SCRca9NE2Z/2BZSHXH6vK1T2K1b7HHE2vi1iRA/2dCQ5rW/5EoAjsvb
	dTpP9g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgst7hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:31:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso2750559a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 04:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014271; x=1793619071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PN5PQEqoM03ThjwzMKni5i44sYywLhtbqVb5oQyGOvM=;
        b=jx/zhB2ilzFQ8iNmNi3ieTRp16TCFlpanAqsjzkDevrlqtiqHqLqKr2XsbzplX8ful
         PruhOUEK6lf9hDfAW+Se6x3XpJxLZmquFKLUB0j51YMog8/Q1yYBmwgBnl24SMRwEMld
         p7pVxPu31fxta3wv4mqHEN/JTVUE0EwQaKay+SOXfFEEFXPVg8X61dfQoZVbtCGOy1z0
         o9EXESsrZ8WvFcKLVAjjDZOnYzWheqVQOifiivkdishddnkpZLwXkwg3g1tdpuZ3azOP
         0BpIami5z4NtxL06CBAlQxg3D8gl6AqY7kBdKY9/v0V427x7FdPPXMwjpGP/lavr9JUr
         /rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014271; x=1793619071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PN5PQEqoM03ThjwzMKni5i44sYywLhtbqVb5oQyGOvM=;
        b=KnWURiCnBiPfmKVQX3N+aMQjc23ZUKaJrISZbHGzVdqDQwSLcQudTF1x5Db9t3b7iC
         1hJdTzbyhPw83OIlCt5OpG3+YAw4jdWWkxmAcTbCOWrXgFr7VIN3zwMA3gcZ3w0Wqz1a
         Fn4LE5BeEudXQLHDu6pAnhafjxFlnF2MGGJQFocccg8Sl7dbXozS2NInvfaxdP1HPXTd
         cSYMpFeIJfoVVtQUn75tLGCKxIzgwJDPmA9ijJ94diJk420lCAKD+qQUh4dEZBTZIbvm
         /w0SrFyYYOM0sPSzmOnF1fqA33ib8qBvMpXR9xK3PuHVUXdPeFrQ9aI5gspTxeI0pFjt
         qDnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvj+JGmbaUi1BV/juvlSEhMKZxeHh29Rf34dPBeeHkwosZ9rvFEEgM3wZaU03ERDxhjVFz4w9+QE/m@vger.kernel.org
X-Gm-Message-State: AFq9FYLP192MOylUc/Ckw9URWUTpO9Khx6MLef2iZrkZEVrn6p9RLs9G
	kBhfGOaRyqbuNS7gSWdz/xG03PYX2QWOna2tZfOCANQFfVgdVohmtsHjXlVtAhp2aPSRVIOuwWZ
	n2uQoJIdJ6zc3HdsY7KUdkEPI37uaR1YHpyEb213NK2owbNexzu/X3iN4IeKoSUnlPlXvZYZx
X-Gm-Gg: AYBFou3NCnBgNga8IUBU7qkabXV9gpPKQSVQMny7+WFi2vqyKZrpOIrI32/tpUdLiv4
	rYaAtCD3bwfw6ucVXx2Je0SwRtPEZO+frFZ4FlYI7CKNDzyuRV/8buOoIvhrny34NyCjFiF1oWL
	M9T7mCL1rySMLooT8O8p8Gfxybj02QZIHiHTaCoBLySXbBVChPni9QZxqb1FW8fJu+ByDLwznnk
	cyLzHLA30XIEh4IJ1TYeXbQo3RuEUPMdFWkanka8vZ1Ijel8dXRrkTFXG918EZ4soG9NeeUaq+I
	Dzw5p7DhHvdsyt6bOrTu+5YzB3B++1KSSU/9jE0vLbu9Mx42bSRwq0jCZ0sYEWhE0mhNaVG1xhL
	k1WtI1gpiFSWgKHkFoTtXYao=
X-Received: by 2002:a17:90b:2d86:b0:3a0:9fe0:3aaf with SMTP id 98e67ed59e1d1-3adeae70769mr5826702a91.48.1793014270987;
        Mon, 26 Oct 2026 04:31:10 -0700 (PDT)
X-Received: by 2002:a17:90b:2d86:b0:3a0:9fe0:3aaf with SMTP id 98e67ed59e1d1-3adeae70769mr5826620a91.48.1793014269630;
        Mon, 26 Oct 2026 04:31:09 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:31:09 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:37 +0530
Subject: [PATCH v2 11/12] arm64: dts: qcom: sc7280: Add GP M/N clock
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-11-ff8e4bc8d567@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX1d8T83kKLPwy
 FnTiJUxfZI66SvlRWw/9m5idCrSuM4qUONMb9I+lDYfPRrwUfsjpXHMotQzk6nfjAKAySklWwtN
 AbM493wIeYTmqX0231LiX3y9wWtEOK4=
X-Proofpoint-GUID: cH3QY5SXQKM-VIThVSV20AoJSMKQM1wk
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf39ff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zpsMDwxbIOh_EP-Phi8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: cH3QY5SXQKM-VIThVSV20AoJSMKQM1wk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX/aLBeSj+QM3+
 tfbTg8WQS3Iv9fX/SbRqIr3QaBtNFxueGVoXR7tFpmFcLQ3CGfAagknN3EQ3tqn4PGh8goEix4x
 UjywLCTAD4RXblz30V9EQbc3dUHTXIFKTnxlsxLOdzrXmCgAudOrgtif6yo/zntxuu/lM0QMB2C
 MMztlB8ugaPYJ8p8tkPVkV6u96x1ReRbGwiPGKhmdTpGOh99vHUafG5dbqqN18zSY/PNEYFXxrP
 TMGeTXqBM/ViTD3co2A/z+8Y9Ieqvbe3P3EL+2Dr3HqOak40lsaF4fD74QnmnkUwziRis8w++sx
 l6QpCRn2zjqKVFbVmtu+R40W02pS6f9aVkv7ukYvqfQ2Nx55XZHRC/iuQYKroqdEtbg8siw/Szl
 Q7IKn+n31VzRVRxrKxAZ+6ojGZHV9jPYOb71KGKJdR1Xo9YMdBvGvGbZraW+qchAn3L+uTDnGWo
 lA3KD+/FELE8rn2xcHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260045

Add the GP M/N clock controller and its pin configuration for SC7280.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio60.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d2719775b8f5c6a8cef138a93292721..de27a051ee3b0e9046ff97b8e6fe0164985d7b17 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4442,6 +4442,20 @@ usb2_role_switch: endpoint {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sc7280-gp-mnd";
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
 		qspi: spi@88dc000 {
 			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
 			reg = <0 0x088dc000 0 0x1000>;
@@ -6653,6 +6667,13 @@ mi2s0_sclk: mi2s0-sclk-state {
 				function = "mi2s0_sck";
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio60";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			mi2s0_data0: mi2s0-data0-state {
 				pins = "gpio98";
 				function = "mi2s0_data0";

-- 
2.34.1

