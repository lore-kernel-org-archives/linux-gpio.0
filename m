Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014227;
	b=YMyclrztBBkJPd+Mi3p3nkZIpbPnDg1V3w2TnzWAdphepLb2a1BeHQJJba/9TRIDTRNi
	 H3m19d/G4RZek8E+6qVnOBptRX1LxouCmV5QQqVFuJ71fLy7E5JaNmaqsOCKXGApdvL6k
	 r50MmLV1Prb8QRGb5PKrSHd0iViEkUbC/zooJmewIZp+ENxLrKx07xLSduRGSsh1qWoJ8
	 WJ1PJoHlnTazPc8VbcWGnwqe1OmDwTOQGI7AVXQQ4TQ5EOSZqLykNFGTKmHYTFJ66UZKY
	 qGlLOY1ZkB2EX4Jdh8Tx8W7zyeTlXX8mkxuhX4F15EsFAcqjutePDSP0CDaEqkp9XOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014227;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=;
	b=GTu1Cr2FjbnWu6S2gSkgjlCoDmnrFdH2Npb//0RfGZBsdU654vd4yO5qnYEz5wl6Rm0q
	 34pwgDwjj4vFIFEaSsdu0D9qyL5eSemQZb9TxMvvVu1CxobNHQeXO9IAfTyFmZceI5NLB
	 1dRvVdRWLdfgLGXymt+KIxDlQeOCGZTfE8n6eqLeOfCjDz+SomyxcNODHCoL68exsRBKr
	 tMOHWEfH6y6IXgQWlMW/FyxFbxDZ0yjmu3UN4e/iWfCHJVrznWSSzQ1l2/TvHyFzCP7by
	 KMuZizCd6MZFXMjzwm/w9+Q4gWPthQRN6ALpGNpUk7yx8WwxdTKH5bBj0PzlvCCDcKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o3h9M8bN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+kgutvj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921F160A2604
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 921F160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o3h9M8bN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+kgutvj
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtYO51547988
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=; b=o3h9M8bNlWiM2sHT
	yMHVFZfz9+A2H56i90OElQKT7rXlSywlIZOK945W6NTvY/wxqxZW1g/S3fc18STh
	FN0O0tTgTfHqs8bYteDZqzxiH1QIB57my9uDSNLLUz1zX5twUfA3dA832TiADhlZ
	fk5tMAZmPJ7s1csIao3F+JgbwUgF3JRqFImX95uPHcOfu5sCFMvhFpY3bLRlzDyJ
	3oW1WTpn6voaV95CESMR4YNtw5jhjg2oQJjU0K2O90jNBBsEZ6QK1k/jNg8Vu/1K
	PYJlwHXK8nAYuONG5PtMzYEc9xBydvzzhbeOYauKpM+k6RP7OL9XoBGiBSE8VffQ
	IEl9qg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgst7ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:30:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so2897757a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 04:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014225; x=1793619025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=;
        b=X+kgutvjeWstrz3xdKP+4lUxQ2VkTjJtveTMDuddCZ8BR3zaBjh6HjSzOy80hJYYiG
         mesgjlDZVkEtKCiAkIgtjKAe1Dhx2v8ShhKE3W7CbkWt07Q+csnQ5vtvg8N1iIG+NOEx
         E5D5rfO0k/AWdIdjlAjtBG2VhcyvaPTlggNUeNH2mCG4sgvOA4Act1WBp/YUqY/585lV
         qKYQbPCHUZ0euBNhrli9Mc3h3uqmqNlCY67uFnenJGazi3uVDI46kWy6FM0PpinVN+LY
         DlAXQu3UoaPDTlc3IRvdxOTPAKZSm6q0MPvyzwm//RtiWPZsyFP7R31sBk9MePIGfhgg
         Nqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014225; x=1793619025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ESMzVuIUOfsBOdDJaEmGRNu6MjhYUn9ZY/PRW8TBJU=;
        b=Cs8c+XQ/gGDK3DggJjgTLgak5+5YeNyZaV3cJBz4ooSVgGTaDKTrRca2dyZ6cXZdH6
         Ft4fXQ8Q/AMHfvBG5TEiHU7vN/dp3Geq5NYeV41J/vUGhfktRUd7lcDsWoH1aEF67EWb
         7GdREedkD6GVrn33zkrL2Xvyn3j6kK821Wqlk9tovwM5MYcPsg0VkaO8GysGGeJSPzrN
         l85PFcdwz24diQR9j6/OdYRUeOD6zz6sfmPLJB8Umglg8uSrRQhNB7nWBxr9eY0926jb
         8c1hUsTSvDgd9AvukPTb4pqeHEN/7I8kfUTpBYKVpN4K28XXxSVjpompa5aTeKgRII7z
         fBdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLbcbcDVVMf2hzlLeNcc26I8ZjNIl0dYwXFz95Z2Kuelymsyuvj2XsJtHYodZk2o+CG/yQm7rNrfpc@vger.kernel.org
X-Gm-Message-State: AFq9FYJUwtdQ6zFhUvpcgvn+FBOrBP5Gr1kBDzew18t3cHyvisfLnmBY
	h3JYqHUedieK6Tg+p4EfxaeXj/s8/JNt1VgcuozlolstNThfSzO8SERo6QDfiwXD5hPA5REefvq
	wzf4vSDBv0yy8PMolTFNnFHEIG5ucB8iqqACZyLZcaFcSooAtQsKl2rQIrXrx66Xo
X-Gm-Gg: AYBFou1xcvkmAIWl+7rv++iH4f71LYJlVLnxjzxx0c0RvWSrihKqY9qbN4RhRdDHK71
	FznxetejeqWLAsFWxjIbF8/epNukYI5gBNlLxXrxaiIvs0RxeFM4gP2YthpT+Q/94zKE2XicwMv
	FYfuuI007aBOUTZ1mnnyOF34abOo/poiyclGRc0Uxpa4R3KlyWELVw+sOghruUpmEUDE1UBZjch
	Z+qn1NBwaalb/0We+NC3ogHAIfkdyRYl7z3HdWNKyLJMUaNRRY6b5JedUKOhjsiofZVSKgj9pZD
	wBxG8X/8W+4bUAnjw+iSCTQ2exlhMtHAtmc6xMeP7rGXbRVEN8xW0TdZUXbTITWfXanb9gKPdqm
	DUCbsP3EGuHZXlKCRLueQs9Y=
X-Received: by 2002:a17:90b:3904:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3adeaae5caemr5476454a91.19.1793014225126;
        Mon, 26 Oct 2026 04:30:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3904:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3adeaae5caemr5476426a91.19.1793014224693;
        Mon, 26 Oct 2026 04:30:24 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:24 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:31 +0530
Subject: [PATCH v2 05/12] pinctrl: qcom: qcs8300: Add gp_mn mux function
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-5-ff8e4bc8d567@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX7uMS3q9a35Bu
 01dDe57tpwTLu3gXJbBk6oh37thtqbWXvHFLbH1CoSKctDpLfRTCYLSBZ4gxbZeOfhAWlrve62I
 DJQ9lDGYRbNPrsLkCVVbtFcz8edsiFk=
X-Proofpoint-GUID: A-_JRhta7M6UisdtYyKRqEeIegFJyNup
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf39d1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: A-_JRhta7M6UisdtYyKRqEeIegFJyNup
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX4o63jAShPmM6
 wJzsyIzP1JXzg4uc5iWkupP5mEi1aqRT8KbpvPwxCiNdJbycEAZZDedMsGGLCI1ER9r8E+5nhpB
 HVheuetxdJdi4knnIYYq3YYqOcO6A/qbqNszHT/wUC0XJ7Zq4Y2EZjL/wiIJHgpf2g7rbgsOg0m
 hCiZnhJxbwZxkz+qIyKzET14OOCsLz2+Mu0YPFslYQBEZi/ZMTq+M/Tco9pQtxl5Aw+nhThTZAC
 dBNZUWhme/UBRf+BcMbXNI2xCqx8DGoUBdBh+HLZ2uzfUL4rD5oII7cNg8Ol5F5/+YlL6iEZW27
 Az0B519mdL6djLnxCxFOSbN9881THMSIQRxdJZ9lTnmu6DZMJXQHMRy4Ez6Bl6K+Brlx8wsbVdW
 2Zbs9hh9HAkzyyZmWg0PhsbdV1Dvdq6yGJzeNsfzVkxTQTxeMF+dNj0FkWhuP8tF56bqFY4oacb
 TG4y8jFDtrBuky1DX7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260045

Add the gp_mn pin mux function on gpio32 of QCS8300. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs8300.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index fec86818c51188a0949e268382fb0c5de3f66f1a..349369fcdf18342b27067b91414eacbe378224e7 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -424,6 +424,7 @@ enum qcs8300_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gcc_gp4,
 	msm_mux_gcc_gp5,
+	msm_mux_gp_mn,
 	msm_mux_hs0_mi2s,
 	msm_mux_hs1_mi2s,
 	msm_mux_hs2_mi2s,
@@ -651,6 +652,10 @@ static const char *const gcc_gp5_groups[] = {
 	"gpio76", "gpio77",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio32",
+};
+
 static const char * const hs0_mi2s_groups[] = {
 	"gpio106", "gpio107", "gpio108", "gpio109",
 };
@@ -955,6 +960,7 @@ static const struct pinfunction qcs8300_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(hs0_mi2s),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
@@ -1062,7 +1068,8 @@ static const struct msm_pingroup qcs8300_groups[] = {
 	[30] = PINGROUP(30, qup0_se4, cci_i2c_scl, cci_async, emac0_ptp_pps,
 			tgu_ch3, _, _, _, _, _, _),
 	[31] = PINGROUP(31, qup0_se4, cci_i2c_sda, cci_async, emac0_ptp_aux, _, _, _, _, _, _, _),
-	[32] = PINGROUP(32, qup0_se4, cci_i2c_scl, emac0_ptp_aux, mdp_vsync, _, _, _, _, _, _, _),
+	[32] = PINGROUP(32, qup0_se4, cci_i2c_scl, emac0_ptp_aux, mdp_vsync, gp_mn, _, _, _, _,
+			_, _),
 	[33] = PINGROUP(33, qup0_se2, qdss_gpio, _, _, _, _, _, _, _, _, _),
 	[34] = PINGROUP(34, qup0_se2, qdss_gpio, _, _, _, _, _, _, _, _, _),
 	[35] = PINGROUP(35, qup0_se2, gcc_gp1, _, _, _, _, _, _, _, _, _),

-- 
2.34.1

