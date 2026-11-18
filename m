Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981874;
	b=4z5ZXqay90WnAof7r+20B/cFp5s1sRpEHkh/wObzC3xfk79Xn9rYH/0pGHBR998mABKn
	 EyyS4MuPtWb+SLNbbjGSl6b40VAlj9CCK5xGFUYbB5K5Ucq6nColayYrVvLod0Udm4aQ5
	 40stbihd9adPuZWUtu5NmSfE3LEgMJ9ICY9dWwZmM62vXx+0pw4kpkuNsNYtM+Gy9OTHa
	 4hPqSA4jsAXkG3nlBchV+Cz3eRlY4z9yX1aKlAlVB6Vn0nyLOqPezTIWqvltD44r8giZC
	 XuWvPji5uu6hRpVfnn/+zb6ANelcwsNze+gF3LuJ0dPXpYkBwL5Tb+trlniVQnPs5TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RAv/rkDlHZ6m8ibe6hSjsssJtaF0S9p6cdTEayCygR0=;
	b=VBN0BIOOGCPmPzyRbN4tJRrKluG2sGIQHjqLz1G54oRZZJ7dKI5rCmus7AVS2IgBPXvV
	 Ej0MdCXJ1VgQDALFzz4Yuz4ldClbsoXoLifXqQZi8B9FwcMjWoPjXTv/00Io2br98XRzp
	 DOdnwnbz/EnjFaJwMkKajlfjz1m7ejz1mvLJrnjekaB9vcEhFRHzWFqxVO8+aIIShm/6H
	 DcSftWy6ogxIBl4epHnkmotpaJabHmvP6vWmVgF1m/8GnKfbtbWZrOeo02lFbvfcyxnMS
	 f86yelNbTWdv7t+EM/r6Hj1LcTy8J0AwcQ/g6vgVnMzN0EkljHdEgPDR+DUIHR6kKZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FHNQ3Obh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJfFLjLp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDFE606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABDFE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FHNQ3Obh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJfFLjLp
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V6wx2603443
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RAv/rkDlHZ6m8ibe6hSjsssJtaF0S9p6cdTEayCygR0=; b=FHNQ3ObhT7bK5/4C
	oqmE4OEjPrUih9E4aKts1y0ItpoMxEikFCn1BgZADzr5epqfDzorCtim103Af4U4
	NfY+VSv+Cwiadyk8QXj6PM0/O6+EDRvDeoeI+Ah/yKGPzZsiFITQ9dlL/LM9iTOv
	LxUoqIO69eeT5DvPP2D2YMPc2zl9dvUyL0NotqnvZBSvDY6KU/6xBZ2hPnXtVTlc
	zYQA7SLMx4vDSkXjDjz8VgLLm6Dty59yKCWGXrjtUHUmzeMIipjyiwhcOJEO85RR
	1jRRHldj4sfNmYNbazIG4BriVdc10E0xt0xSdvqL7kF0cBBycMchzZ8eLnSouBm8
	0r6vbQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71ftv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:04:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so5785185ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 22:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981872; x=1795586672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAv/rkDlHZ6m8ibe6hSjsssJtaF0S9p6cdTEayCygR0=;
        b=PJfFLjLp+t42e9u8jOnsmQXqwt3eVACkUPH2B9fO68D8SbRsJBFcTJCKznk3t72gbg
         Ynf8tcMyXuLmtWjNmbhta/7W3eumgHJ1js0kdNAFLhj/DmK/0CoIQzb/bQ2TptgTllIc
         UvcwzWhioZtt1jqtODkmf6gDy4QyzpbFvtyUt7TtBsnAyt2/I3aHHUbGLxAaMvobbCw8
         eYD81oTyWXvl5XqHoDryf6dn83Bfa8qlzJbB1UdILtU4YAWLQc2YSaKqbW8ifbuFnSo+
         By7Ru9Heg4bWHONKElHip5VSafpYz288et8lkW0p+iGsIivL85dmooKLi3ubQkiL7Xqk
         riIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981872; x=1795586672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAv/rkDlHZ6m8ibe6hSjsssJtaF0S9p6cdTEayCygR0=;
        b=I0ifg2KSMIe5O+u4WCbCakbfrLQBtuzobOll5afIxEZiF5PD66hz5trAIaa1Qlbuug
         9znAGIAhzBmiKK0LRBpzZBybUEiOcaOpKswLjyo/+RsjwKsexw7YgNxxt4Yynt7Rsu+d
         1rvsd53NGz18CJ0Tyo+B96E6kM+Twmbj2weZDmMDdnDsBWI/kL+owrQzNrCkIoJjN9zO
         PDCR4MtkALTxVmyld7zf0zwjHAFhKZaZIJpXtALi9+wsg1XqasR66+RYAXGlDC0i4Jiv
         3HZjk27b/SV4eziU0BeKXbOWNOok3V7f3t6kxBj8rnvn/pWgCQI9wmdqzMPvvz4j8SL6
         RNjg==
X-Forwarded-Encrypted: i=1; AL+hErHoiPH3A3J6rjGQIYeCd1IBj204o8ArhR9ySRA78jmCbcwemRGCpKmxcNx0sMKOVY+25JxKPrpt1I6A@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ata0PjNZI7C7yPDhGmlUvXUfOaedzxDv5CCT/D8c1Zjmkwi2d
	FmVbmxnHU81z5rPwFsBLSAWCInS5Xx00CdNyLuRDxxkXNx3NM8wc5OTxnw9g6jJcqJqgxVX0o1j
	9Ef1aflZrL1gnkVQ3D0Ziv8mNwBtA33L/vSoAET4bJgdbJbdiBcBtalYc5ni93wVk
X-Gm-Gg: AZFdTZfw4VFnMjG+FPb/khR+xpZA++IV7A3pSd1PuB4sFIVPU0ChdWkYaQzNfM5YN4j
	jYiluaQVq6vcQuSKW0RijMX0PxbXlVsAJgkX6Cuc/6jzLiey2CtX/riHFcaW1mXF+l0GFdDAA+H
	ph/6X63geiVyR7eTCa0/46x8Uo1HIgGI+zXBwMYieQGqkkUtLwDy7WyALCOqC74frnQDpGlfneA
	TNuxLdYGDB3iXYXX5dv6St4VzrLAInG1zI/0I9OIVvYx3P4/m344jNg3erH5nDqTutnWnBgzi4I
	8FP3vv8lIRfbWTA5fjz2KT6w2k3M/A6u//YzYBCg9DsFiU2ud/KH45g6Wrt/sp0tsO3jnDdQ3y9
	M87NA4DforDmsdLOCrvYtFMnEQYlY6qngND+KU+qcAFcjFe9Tolnzb3CrKKIZtxSO8y2MvzlvxA
	==
X-Received: by 2002:a17:902:ceca:b0:2dd:c100:80ba with SMTP id d9443c01a7336-2eff7544621mr16464805ad.53.1794981872357;
        Tue, 17 Nov 2026 22:04:32 -0800 (PST)
X-Received: by 2002:a17:902:ceca:b0:2dd:c100:80ba with SMTP id d9443c01a7336-2eff7544621mr16464615ad.53.1794981871904;
        Tue, 17 Nov 2026 22:04:31 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:31 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:49 +0530
Subject: [PATCH 18/18] pinctrl: qcom: nord: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-18-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-GUID: cMWcFD5ToFHYF8XcHQy1chePXC3ydz0k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX+G8V2oz+sAAx
 HAxOy5RvphIFO/JjR9+VbiyPtApxSXzpTX6ga1xHTVlxgGu75Dp3z3zLwoiWMvdwGIcwBNb23pH
 gCRe/45SdQ71aoI73rwKtxkPB70dYOeNwGFGZXY8W5+uCNnkZFScX7gu69cpcL1u8ufD7yQSNfj
 8eYM22pls8K/2RbHw62R1MjapI9+M+bTRyK8sbRAi7akhnvxJ7FBdwJSKGjqUrjbDRNbRksQIal
 NA9NWo4Z9YT9EQs5kKy5QKpyh7GPP/jhlRkctjGTUYDyZajXdby1e0bzpsqHaQ5TIzHYmYjia3q
 W5cx1oE9r1v0YRAtYO4hNh8QBhvm22R3Sk0yi8AQpuxHi5q0S+ukcwK8kRoKzkI9W9vm9MeTWD5
 DlkoCVVo81j773mRI1LASGdnCvutPWA5iUrsytsm/boJltp2rIFRfOiXkQwD4QNx+thN4ZxNJER
 i0mGDTkvLq1TskreC5A==
X-Proofpoint-ORIG-GUID: cMWcFD5ToFHYF8XcHQy1chePXC3ydz0k
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd3ff1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Nq_pnvwty-RK0duK2HsA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX6UatUeunOiA4
 vU0K9QgZMHGJHEl8223hfSGcXBeyLGP19FAr7NIHQBlM6/vNGCSuXFdTgx0lB+y2Rb0nSmqRqzw
 8sV9G5vtOybXY9S7HDDIJ3PfuOuhG7M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn mux function to the Nord TLMM pin control driver. The
GP M/N divider clock output can be routed to gpio35 via this function.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-nord.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-nord.c b/drivers/pinctrl/qcom/pinctrl-nord.c
index 010760cf0bf5cbbab95f41946f927c7a5f5e76e9..36b0644f041da07673ac82f19392be506df51986 100644
--- a/drivers/pinctrl/qcom/pinctrl-nord.c
+++ b/drivers/pinctrl/qcom/pinctrl-nord.c
@@ -542,6 +542,7 @@ enum nord_functions {
 	msm_mux_gcc_gp6_clk,
 	msm_mux_gcc_gp7_clk,
 	msm_mux_gcc_gp8_clk,
+	msm_mux_gp_mn,
 	msm_mux_jitter_bist,
 	msm_mux_lbist_pass,
 	msm_mux_mbist_pass,
@@ -1028,6 +1029,10 @@ static const char *const gcc_gp8_clk_groups[] = {
 	"gpio14",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio35",
+};
+
 static const char *const jitter_bist_groups[] = {
 	"gpio123",
 	"gpio138",
@@ -1410,6 +1415,7 @@ static const struct pinfunction nord_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp6_clk),
 	MSM_PIN_FUNCTION(gcc_gp7_clk),
 	MSM_PIN_FUNCTION(gcc_gp8_clk),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(jitter_bist),
 	MSM_PIN_FUNCTION(lbist_pass),
 	MSM_PIN_FUNCTION(mbist_pass),
@@ -1521,7 +1527,7 @@ static const struct msm_pingroup nord_groups[] = {
 	[32] = PINGROUP(32, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
 	[33] = PINGROUP(33, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
 	[34] = PINGROUP(34, ccu_timer, tsc_timer, _, _, _, _, _, _, _, _, _),
-	[35] = PINGROUP(35, dp_rx0_mute, _, _, _, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, dp_rx0_mute, gp_mn, _, _, _, _, _, _, _, _, _),
 	[36] = PINGROUP(36, dp_rx1_mute, ddr_bist_start, _, _, _, _, _, _, _, _, _),
 	[37] = PINGROUP(37, emac1_ptp, ddr_bist_complete, _, _, _, _, _, _, _, _, _),
 	[38] = PINGROUP(38, emac1_ptp, ddr_bist_stop, _, _, _, _, _, _, _, _, _),

-- 
2.34.1

