Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981813;
	b=Zzl88p7MpXCRyOdt0cL4kTbvAYbpAvzLnK2WafSx/MelzkOU+i8IMEilb3rI+sVf1IlX
	 YF3rz1cAMl/TFprJ8OghzKyj0O5mLje8gs06MFtAn3wZ6lkjDOIOV+K7OU9ShQDS6D8ls
	 k2qf/VzqLfL+7fVHeOfs7K6Oh1XYapQJ+aiFUelL0n3AlEAG/k4rJoohuCPas8SIGLRgw
	 mKx9WkdhPVOGBLV5efdFoVe0tdEUqwKor4A7lNJGoHBrGD8Z27kWYXN1pDI1WImFJGb1C
	 2j4no98BYnd84PYZ6sP7XORy/TXnn/NotFzjDfRDtaErzIMD5BRGgpVX4iBP6CAHC2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981813;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CXYuDMS5xPT8aAqyZda72sDumVLdFUFZaP1NwOWEiRo=;
	b=qSARszxZ7cYl51JwdSbSH0sGa/DHGsL2m5DgTRNHMQ94NiznGR92r1mIfOYN3wWelyK5
	 ou3Tk1PDFKgyaXkL5alU4UQvEfCyrGLgcrG3gMGAtITleNh6VzPxhCIrEql0D71UmKf7p
	 aGeW5CpSW4XI6WpWH4uNsEy9fzkmD/vnE3vQ78hPQuXM3rHdYpL/dQHe/Ta9Jkjmwe8Ua
	 OCI4eHwiO9WRTBpm4BosGvd4yZIPJpHJXnSrlOOXyK1jJvwNqUFemV9adAjGif8eQXkuQ
	 HgSRAPk2nnlkd6OFTyZPcsxqEu6KP0Q5ohk62bMxADz5yEl/Qu8NnlXoHBedDnmD5wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C4e0ZujL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JYGInWRu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA07606A32F
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA07606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C4e0ZujL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JYGInWRu
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V0P82602501
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CXYuDMS5xPT8aAqyZda72sDumVLdFUFZaP1NwOWEiRo=; b=C4e0ZujLzOphJd4X
	mfhfIO8LLRld8j+BVB8s781KPpDG2eG8d9P1QzTUbjXNA7qct6VW4dOhjMfp5Bk8
	IRINf4aQZe6R07XTIxyUNoQvnEyTV8KMpAIcTozDcy6gafiN4q6F2cWAADWKuKZg
	m2yCUgVH37K2tQLew6DFROAebpiXc6IES1tG9Xd5ohA8wDLOWFQ1ZNr97qUz6mia
	VQ8mC0nbACPipsjWzAzVbLjSePYmYsTnQxLu81yOD4kRP+2h2iACRJFgksdmrgXp
	DEe77q90GaZ59LQS1oDxNfLUBIxIdGH6vIWw21eCXUf79RwgEnQty8v2BgfoUqu5
	5bz1DA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71fmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9995cea88so5043815ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 22:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981812; x=1795586612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CXYuDMS5xPT8aAqyZda72sDumVLdFUFZaP1NwOWEiRo=;
        b=JYGInWRuqmQNh37z77BW8I4AbfXNSz3eupsBIckKCRdxaguPp4hwa4fTvh5X06PEch
         j5DoB8jqAeHKIpruiSEx1avuMbE/waSETP//6TCRoXTl+ahhtNM4LU9GiZEG4sg7KxRE
         wC08yx9awu40OOxryJZ6+TeS5gBFh4rgBd+Bv1d5wMt9gYwKRSr91DztnhxMIc1axB74
         6Xczi9zl9jEVHAgmCLeHszo1u9uqcokGPsbHhzJGrQkl50cVIE+vCOzvc7H+hEkYnZTY
         31LY6kIOqH2SyX3uzSsDOB8qQXiHdkmRYVs5rRayDRjRj6O3R+i1x3S719gMd70z7v53
         GWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981812; x=1795586612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXYuDMS5xPT8aAqyZda72sDumVLdFUFZaP1NwOWEiRo=;
        b=SQucANfP4/O/PvossBheiz4H5nEqZu9A5hBnVNKrltK75JYBTwTzo/wG4OJ6m5m/aR
         LAXYe1X6flmpV6tG+B91x0loyBJPbKPP9de7DHudUi5OwjpLx7wgL5upAy8rA5dna0ZD
         07LXnOdnnyOQ3hM1QKY4NHhI0/x9P7usf8rYnoqsKNETF2/fL+0IeSKRYsRL8fCBFin3
         ldBxT+TYvcrPF0LuHafpzTxD9auZVAwt99TBPaPGFx8WfDOpi89iHQy8ltnF6Kk5E96S
         TXfIlMGYnjKn5VtlgHAqGQzNc18amJnrP6PY2AJefhkoOn+7oMrVhKXlWCYHwseNjzBY
         c9hQ==
X-Forwarded-Encrypted: i=1; AL+hErHtmVxkBOvw/iwkg1Qymt+MFx1U9WIQ3GKU3+qU2x32SpvCUqZdFD96T89d9GIz0ievP4FrA5jItLZ0@vger.kernel.org
X-Gm-Message-State: APuU4Z+tlr8yBprY7/iI1Ss0cm3A2Hl9k5PGlkVVkd8biadk5LGFZKnK
	ddSQJYKTsolVX7ARV+m0wENNDFwpGeuIY2YWMOxh30aXW+9Dc9j/EeCxZukGYp34T2TMSBb6B0c
	eeOBOZi7PL3wY96BtGpcevmdLmYQlfzpmW0zrJ+HiKytkIzpYfKVdlQPiYqruvn0D
X-Gm-Gg: AZFdTZeopyYsJZv7zVv4/je4prhTn2Df7ebS7VAxuinxpyqI2IEMQj0mVCLtXjWfES8
	sLWtwwa57JS1Wd6CW5LwO9cnj8mFwMPRXp6Zii0TS15xHL/rUSS6SLO7fGRfecU0NtiUoKLloO2
	5sxe5bRvKRt3h6DufqHIzHGHML2HjmXiEKX2CTE74/Kznu1QFo9T/oPqcFJ0tTg0kCZs8qLXX5C
	aKXGCYt68Jg4TGChpbdZW9NnC+kq7JZJa6FfDVAia35Ka88yUopWW4j2k5OTw7ME06uf1p3gQ5d
	qnNE4+MxzHCZc4CmtRTaSp7/QpmhtzJ9APeG3OTgkSluke3E0U6WRs/qjHAXmzCXIC0jtu+AQ4u
	GGoTcE9kb4yaS/XlN5WWUYJ+17clrdoJb3dbbUDxfLuJy3P90InL0SYx5vVgQQ0X/JhyHkQWkeA
	==
X-Received: by 2002:a17:903:32d1:b0:2ef:e97a:917c with SMTP id d9443c01a7336-2eff72026cemr15699095ad.5.1794981811629;
        Tue, 17 Nov 2026 22:03:31 -0800 (PST)
X-Received: by 2002:a17:903:32d1:b0:2ef:e97a:917c with SMTP id d9443c01a7336-2eff72026cemr15698755ad.5.1794981811165;
        Tue, 17 Nov 2026 22:03:31 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:30 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:39 +0530
Subject: [PATCH 08/18] pinctrl: qcom: qcs615: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-8-703f7badd194@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 237nJPveb6jgAzV8_-qxWhD5SRPEZGHy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX4joD4Hw4sNTU
 hx1cFVIsJXPvdBqBNT2v4YH6Ci4gZQ69ihBQW7qTXKv/6YTWAbqufj80pKNeMtSc+en0Jb7MGXe
 D/sVULY+nsRhI5iukR9fc3aA+dyGY9E06I2PnHKaTqcsz5DsxrTjiKNCxoV6pFYq8UvzOWCpT03
 YOuB7EiPFrYwGXeVpo8f/Os6rKdrN8wZi7IGA9kfFnujMrURkktICIDT+IjSSgTMCNESUTL/Kth
 PLjLODGIQc5l+Yjs9yP5/cYATNOpj9bd84Tsbmg4UpoyOiSm703cKlAAWBUPpgQRfYmBE6soQIC
 opNCYXJPh9/rIAbk11t/IEfiNRRgxdKrV6rFU1nF+1X81N20ITJHWvAShJQRyzuPCJgl7NMEFF3
 RDq2/+TuVkW6FeQox4oCQ9Cm7wARyPySnngA/UpK2fTwFFjd0dW/TF/4LpETR6cGRj+l4Rra/gW
 3Lkhgw1454D4aXSLp9w==
X-Proofpoint-ORIG-GUID: 237nJPveb6jgAzV8_-qxWhD5SRPEZGHy
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd3fb4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX0WHmL3IlrHJT
 24YIxyzKYzPxae37h66Dnos8vHRg8zL9ZnZHAwej9iboCZPtG1SQchSyDY1069PCRJcScubadGK
 EcuO83jUiEJtD4Zygn1UrzWs2/1WRSM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio29 of QCS615. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs615.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index 0e7df184122b5b94756a233a009ec0dd3675816f..169323635d39a7c3441560feb002e9e03a577515 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -404,6 +404,7 @@ enum qcs615_functions {
 	msm_mux_emac_phy_intr,
 	msm_mux_forced_usb,
 	msm_mux_gcc_gp,
+	msm_mux_gp_mn,
 	msm_mux_gp_pdm,
 	msm_mux_gps_tx,
 	msm_mux_hs0_mi2s,
@@ -581,6 +582,10 @@ static const char *const gcc_gp_groups[] = {
 	"gpio59", "gpio78",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio29",
+};
+
 static const char *const gp_pdm_groups[] = {
 	"gpio8", "gpio54", "gpio63", "gpio66",
 	"gpio79", "gpio95",
@@ -840,6 +845,7 @@ static const struct pinfunction qcs615_functions[] = {
 	MSM_PIN_FUNCTION(emac_phy_intr),
 	MSM_PIN_FUNCTION(forced_usb),
 	MSM_PIN_FUNCTION(gcc_gp),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(gp_pdm),
 	MSM_PIN_FUNCTION(gps_tx),
 	MSM_PIN_FUNCTION(hs0_mi2s),
@@ -929,7 +935,7 @@ static const struct msm_pingroup qcs615_groups[] = {
 	[26] = PINGROUP(26, EAST, cci_async, hs1_mi2s, jitter_bist, _, _, _, _, _, _),
 	[27] = PINGROUP(27, EAST, hs1_mi2s, pll_bist, _, _, _, _, _, _, _),
 	[28] = PINGROUP(28, EAST, cam_mclk, agera_pll, qdss_gpio, _, _, _, _, _, _),
-	[29] = PINGROUP(29, EAST, cam_mclk, _, qdss_gpio, atest_tsens, _, _, _, _, _),
+	[29] = PINGROUP(29, EAST, cam_mclk, gp_mn, qdss_gpio, atest_tsens, _, _, _, _, _),
 	[30] = PINGROUP(30, EAST, cam_mclk, qdss_gpio, _, _, _, _, _, _, _),
 	[31] = PINGROUP(31, EAST, cam_mclk, _, qdss_gpio, _, _, _, _, _, _),
 	[32] = PINGROUP(32, EAST, cci_i2c, _, qdss_gpio, _, _, _, _, _, _),

-- 
2.34.1

