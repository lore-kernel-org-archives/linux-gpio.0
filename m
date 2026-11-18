Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981826;
	b=GN9uMSVRxVfVicvBMm7UU+kMxXrf1PIh6gzSy22vHODUxzfagSgRBRcCunPps0BHYuk5
	 U7r+U0W8vnDBv8w+VqrXutjpcL9NLF+HuBL15zRypIimC6nRaWeTqdZomv5kK0SXKkLwE
	 i+LgOzrVi5pYiZjwASgL1Lp49n51aRiYphV8yGoHYWRZ3xT9AYfsKpaJ0pjGnvQj0KLeh
	 R0mUb0antVp2hwjBhEpWwdWDfLlCvwLDMRmTEA5ut1Bx3xUrbWToARF82g7xBzblxq1AB
	 RZ25DW8NHAClcFP4scMXLdT3XEKrdD9BCBnvHy2RMfMEu++NDbyaAKukJYVN+SRgcgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981826;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fm6WDXdnFPYyXzSqNfTyk45vO0kLnbzIkUN6pRG5oMU=;
	b=3XGq01eOPrQl85TZ+9olLFT/0zca4lBa6Z2axbZs0MMIBAepRBJkixtgXv2HGamX7TYf
	 nvZifyNnDkymBas2lym+a6zEpFD09ItvCLfSjSCgMtazJa3CzJlDd0Bh32m4d4a0tMy6N
	 /qCtUM0TutBspz+UFGVv5jtT4SDfRo8YgtPXslP8PgjnH1e1h16iwaSt5zDPRbgXywWKU
	 XV8jxPpGlkgfRk8FGi50XrOniCbdMiFB1PMUeFc4oOmSC7bNX8TSH28mWWWCKiZIG9TVd
	 vl6ixsa7LBVOaV76gveRHe9VE37SsxCtwTve84PjG7r+I3Tj+8nlOWS4Zm78245T1kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aNJMXADi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OtChCArW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5559D606A332
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5559D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aNJMXADi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OtChCArW
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uw7R472554
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fm6WDXdnFPYyXzSqNfTyk45vO0kLnbzIkUN6pRG5oMU=; b=aNJMXADihIjrDUgZ
	Mgm6RCvO0w5BkQeqPTUTyYZ2DQokogfrClf1EnFLlb8MaBhcvfh/x/m4OY3rBZky
	Lgmqy448K12R1ragzJ3ZzS6r7474G/Gpj6QA/Kfxtz9quslqRhTp45sDyiqnQImI
	Uz6OA5lyXlacBLJY9nZ33Fj7Y5ZfdvfeWy4Zb4M3YaMxC/+X+GFVVBymrDuKJu3o
	2tBA8UiuCpJnHod+qNCcPlgALYlF0kEWiqT2wDfoye1W0guh6Qha8Vi47Dc5zvqf
	liyCajOmQ4wDsIy7vein2St+LJymr+wanWHfpMLVXLSvtNQK32yRL32roorwokcO
	glhCUg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89ehp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed2c307e62so8198705ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 22:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981824; x=1795586624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fm6WDXdnFPYyXzSqNfTyk45vO0kLnbzIkUN6pRG5oMU=;
        b=OtChCArWhFcoQUBO2vUjXk36o+oHIWBnh1hEaWJIcH7/OoRy8n3W1j7FLPwROch9WF
         9/Xj3LEZwbgVAEb0gdOQThRpspO0MgDPKLsxCBkQIdIRwCxb7hpu9EUFDL/Wmz1uS8Q5
         uxqq72WBPz1R54bCpgtJsODBf5rA5iVIEuy1fGb2m8mYHP6p1TOVvZBScIgYVO9lagUI
         sKZIwY9MR/YE2Yedoihks6L2/ceCNAswzOHuqbppSERWlqo6F4P3ah2hcQ4p3bRDjGW/
         xwIfdfEC6POS+9jMJPQQcaXM5BfyfEg6wzVGopzxlwLRUQp4w8EOUYhIi0q6g6mpB0EV
         ldmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981824; x=1795586624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fm6WDXdnFPYyXzSqNfTyk45vO0kLnbzIkUN6pRG5oMU=;
        b=QAfaLvxrpZIu+aLWTxfruXnA37AGBneSOe2UEt6P+Zg1LfWIVIgnQVNjlKdWVh5zfn
         befFOvcdghjifUTvWg4MwniMzWnHkOztvsWn1uIuNXhu2Kuzboci3gFDk9yj3lEEAWkz
         YOlo1/D2n+BIjz79yirydyL61V/A/sDlHtDNGRVjrtCQ4Z9iBg68J0ZHIvxpA5CKB0kT
         9rqR6xTn9lxCRCrgN4FPCO+At+1FVDCvyOK8IwL6fCrlGQO9nA8Wh7NiXEsIJMoCyx8j
         VjL/Hnl7B3iSgUtASpB5LPyRa7IKq5RiHcIez8olIbtBgn/YCOVIzgjC/rJZCt7Mvkz3
         ESyQ==
X-Forwarded-Encrypted: i=1; AL+hErFVvaOuc63vUiINQYer8BZybaouddFbkFLQaD4lyw3GHyUo9XwNg+boBmaAb3Jo6+HhWqrKW9x0ViOt@vger.kernel.org
X-Gm-Message-State: APuU4Z9wVqeWiqs10cEbro5/9qP/7YgDsqNbqCWA9+Cah1AzyXe22mPz
	4F7W/yPuB4MPKZ+lLsnkzi8sVK49wuP/ke16ecf2fxrJznCkJO9nh4RZ0cMHCwUWcXTj3UQoTY3
	ZFRbR1qBbLYDUgWCtoPQ4RrPKqUd6YSztn0SQoombP2mf+aB2Ub103XCK3YEUhu6L
X-Gm-Gg: AZFdTZcSu9IAVlut9dCQPoRHnZadMYqX/7tRLsQqZTSd/D7XNA8wlO45DF23cHJuDpr
	hcP1f71vD5+gD6ACCGbUlBibPSxvWJPv6wdSVK8vqygYkq2lTbqxEl4Vz51mvRf2O52iz7n3Qbq
	CpGzAp5Dwl8vB0Kysjxx9yBNsCce9oDhrx/Ffbd6njgtHpGC5jVsZwcjN0vNU3Upco8XdQLrTcR
	6cmbAoVARZt9VI447NgxuBgJZsQiRUW9FCFBa+LW8NLTqX9PqT0gJnMqkSgiCDFz6+ClxWgSP43
	myUwvIN9WhBblzoNOSJErMULwGW8fxFLVe+e4ULG9nwtPf42td6Ut/vM7brMfRAD2J4yRjcd0g+
	i8qkcRTQVSHnlAeAIaZW351R9d4tarl5PABhZDC5CLu1pdY71vbkF0YXBdKK7p9KDE+4PteCYyQ
	==
X-Received: by 2002:a17:902:ec85:b0:2e8:4066:d247 with SMTP id d9443c01a7336-2eff752393dmr15745455ad.33.1794981823889;
        Tue, 17 Nov 2026 22:03:43 -0800 (PST)
X-Received: by 2002:a17:902:ec85:b0:2e8:4066:d247 with SMTP id d9443c01a7336-2eff752393dmr15745225ad.33.1794981823454;
        Tue, 17 Nov 2026 22:03:43 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:42 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:41 +0530
Subject: [PATCH 10/18] pinctrl: qcom: sm8750: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-10-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: d--9_LmaXNdXykc3104a_iVBdqWFmnut
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd3fc1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=lqpqssICSlazahQHq3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXy09NyrgFk+tW
 ev6pJtucqDYtsJNtrORVNnVT/eqWtTsWqzdFSylOqdItABEZkATJBpnxRtg+z8wwsv0i5BOZ0BG
 p5EHa0LT7uoPuGphPA4VVV0nMF0IKe4xK2AxmEbXuzlPiyk5lTkY1A491mxMx9d+JEQGq9T0Hdf
 rAIvt2WM2AePlg0fYqdxVCqyziJbNAp3Z5SjHJdvvKFB5j3zEPFsQ0isp83smbTh7GX2KM/iyvJ
 Ukgb5nsiWrnTlth0NtFG3vjCJjG9hCTb0cEe0XQSbySB5Hv5tKCuJRtkPIOlEZ9uoAGcOK7h5Jk
 fA9PPxOXo5ITA6CKNaJ6m5oK54YbxOZJylEgZkgCrzVJOuMJzrvy9REol7C2bKBL5GGAFDhL9q2
 RUKXZEp1aBN525ht4fK/KLWXAsOPkOqZPanjeM/CTx2GCqKcYXZdrbA7nVc4ni9nvzanByO0Dwr
 0+6b/VlpsPmA17GvmtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX2wZgDtlVwL0d
 nuWxcVbRH3InH4+3fqpvEzFXhjyZSovQzd3lotgHaDNXBGZxw1M3/HlEWpE4Sbe/VujUthbTIzw
 jLHCuL2b5p6n/P5gYJ9j3T63wSdJj/g=
X-Proofpoint-GUID: d--9_LmaXNdXykc3104a_iVBdqWFmnut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio53 of SM8750. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8750.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
index f27e55c088d51becc98d78a87b25e39da565b3f7..9bb280876431f6b22cabe4e9b39780f10494d738 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8750.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8750.c
@@ -584,6 +584,7 @@ enum sm8750_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gnss_adc0,
 	msm_mux_gnss_adc1,
+	msm_mux_gp_mn,
 	msm_mux_i2chub0_se0,
 	msm_mux_i2chub0_se1,
 	msm_mux_i2chub0_se2,
@@ -875,6 +876,10 @@ static const char *const gnss_adc1_groups[] = {
 	"gpio77", "gpio99",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio53",
+};
+
 static const char *const i2chub0_se0_groups[] = {
 	"gpio64", "gpio65",
 };
@@ -1322,6 +1327,7 @@ static const struct pinfunction sm8750_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gnss_adc0),
 	MSM_PIN_FUNCTION(gnss_adc1),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(i2chub0_se0),
 	MSM_PIN_FUNCTION(i2chub0_se1),
 	MSM_PIN_FUNCTION(i2chub0_se2),
@@ -1485,7 +1491,7 @@ static const struct msm_pingroup sm8750_groups[] = {
 	[50] = PINGROUP(50, qup1_se4, aoss_cti, sdc4_clk, _, _, _, _, _, _, _, _),
 	[51] = PINGROUP(51, qup1_se4, aoss_cti, sdc41, _, _, _, _, _, _, _, _),
 	[52] = PINGROUP(52, qup1_se5, qspi0, ddr_pxi2, _, _, _, _, _, _, _, _),
-	[53] = PINGROUP(53, qup1_se5, qspi1, _, ddr_pxi3, _, _, _, _, _, _, _),
+	[53] = PINGROUP(53, qup1_se5, qspi1, gp_mn, ddr_pxi3, _, _, _, _, _, _, _),
 	[54] = PINGROUP(54, qup1_se5, qspi_clk, uim1_data, ddr_pxi0, _, _, _, _, _, _, _),
 	[55] = PINGROUP(55, qup1_se5, qspi2, uim1_clk, ddr_pxi0, _, _, _, _, _, _, _),
 	[56] = PINGROUP(56, qup1_se6, qspi3, uim1_reset, _, _, _, _, _, _, _, _),

-- 
2.34.1

