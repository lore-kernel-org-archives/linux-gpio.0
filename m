Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981850;
	b=qXnL1QoLt0GjfE8HQzwqF++9KBJ/8ObY/MS9iyLrTnL41jUBKr7NCFelqh0/EJjQJSXQ
	 EFPc74kds6KeBMbLSSxxiP4b6t3r2szMlHG+u7h6iGlL2NXYDpjvDL0naNnTzm8aSUtQH
	 PJQ2vsfgBel/jAMsLaefL2tvBBt/Z6siujjpNVPgrlurw5k6YvUvR+a55aseFATM0ADJ3
	 Jvw2fcvBogRNNgvKxblBmH9jDghW2zgVGIVELWfJbpMFvwcAQksaXUubW4qH1EQtU06r4
	 nSUPnsAD4eLdD7FVWk7uVE4Eq1wYGm4F81n1gAVO2EgTtYHDzOtoTpJvT98cT3qFpAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hBqe0P3QwrEaZmx4ReI2ythx1m3sFfwGsp/92Gq3trs=;
	b=2hXzBkQOP3vANJNtKgbQEJy+6+/Cw/HU+fQf4uugACFa9/3SJWkMw0FWBHhFjMUqlrQ+
	 p1skr4NBEjUgUtCKqoufqlNVZusqbOzLqvemOvOVWw326fxT+4C8p/P8jf+bV42J6Mpy0
	 urhtM3neXcO55XikU0YnvRAsQ4mEwgm4wzgqm5Tt+o4/QQfCgp+tJ9qW4ad+aXzjSWizO
	 CiPOjLfPIEOLMORT8+bJD/Ey7Yxi6VRnuwpUz6LaHGiqcLnOv0EOSjg0doi3eAAlwkB2T
	 PPt5N7sQ35wF2ykroNtFszBR1HEX627XET8d0SZeKSF7akLFCBd3Gd3hPg9XjUY2Azg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eV2sutkW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ku61ZCG2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBC4606A325
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FBC4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eV2sutkW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ku61ZCG2
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UmwZ3371251
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hBqe0P3QwrEaZmx4ReI2ythx1m3sFfwGsp/92Gq3trs=; b=eV2sutkWNhNbZsQ5
	PoSXyR6mwybyCNybowgcnSafH3YUSmf2l9K/Y17xXAmAtw2PUc35h2fQAAOZuv7f
	8CRgkASe5yArEZgdy7CUuDj4miGuZJW4uAcszLAh2F74RvKw6IRjlV4abAvaFrwH
	GNaScSI0ZSNk9KBTxiJ339YiHe+ktxFUDoVTuYQZUNeZ1H+GMYztJDHozm8Cr7CL
	lvi7mTeEzG6zxnW4XoqOho8za+YkJjPqAqx6ctA9e15NRwNXdK+xNlyCXP7qkJXB
	us1KoGDTtZ+EQwoh1P05QfTDkCpYedDdpxs6INXjxHguynugZorKDwdarHwEAJYP
	o/kzPw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sf0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:04:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e95f8543c9so9684495ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 22:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981848; x=1795586648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBqe0P3QwrEaZmx4ReI2ythx1m3sFfwGsp/92Gq3trs=;
        b=Ku61ZCG2UTBxOjwbSUebyqAV1CxJtr/RTitusCptQNItM0eB4FhHmeyrG2piDO+qMF
         TivF6bW5GmMAccU7GV8mc6PbXq5H9O16+dX0sSanuruvfIsZZPyoiJJi7L4qnxSsfgi2
         27OeeI9aRhDw8efaFFh+sawuET5WK7R3dENj+XGUXrh4t8qDohAPJ3EPoclplFdJlFvi
         L3hTBFm09v7iu8FKT60uTYlheDZkoMRWvvnlFVs+YLnN7ef/JCBMFXH0kF10kRS6/y23
         eHQtxm4rwCuzEgnm6VTvSGzzZpR45HHCINxD7JsN5YF7Bzv49azsH4yCR/ProrAM3uCI
         sz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981848; x=1795586648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBqe0P3QwrEaZmx4ReI2ythx1m3sFfwGsp/92Gq3trs=;
        b=vkZuuaXxMEJ/c78YHXxszQWPWhpI0hEbLiS0/wwGoJKsJQycMTJyeeeU9kyZfluvd4
         XmXRNQAhGbmqJ8vEzTb+1hzcQbZZ8U52cTSTH3uYeVZv+ilmDR+yLCTGS5hY2sCFDD4+
         IdwicnKCyTRHRN3ihh+GB9AKmBfTdOjYqYpHu/z7Bhn9vWbFJHCKpjEbpO7Ec5jLcM9C
         MJGNhR/DShvCV1VXThFA/kIhTcWtIvAoSqyjK9Qr25knVTiMn3EsiGfqOlsM7qEF1BZp
         mzCY6JSZPHlegg4ymGZPFbKAvNaw0qEw6eywCyY07sCUZNq6RPH6xh6f5nGLmoc4kDPs
         y34g==
X-Forwarded-Encrypted: i=1; AL+hErG6oh2G9id+jQfMmK7Kg4AQZwGp6E5d58iIXMawgQ71saMVpTqIIolSV9gJQh4QtDsL9O8x12vG7Gx+@vger.kernel.org
X-Gm-Message-State: APuU4Z9vZucRazO/o3aM0KAw0foj9Y3c1xQGK0yTswceNb9cno2FLfBm
	NvLgvebYnLiyjp7+MqTmmxO5TC8aK5VUKHd1ApZttWSXlEiT+YKgrNb2/FZSZQB9Wbmg0aQppk/
	wDuyZNBjHqiyvDvFj2VP4NUi9yA9UjcWOAFM7XXCluUr0Domh1EtLkPggVAbKTiVN
X-Gm-Gg: AZFdTZdkGOs8RNJXXMUn+V6YEw/Mnj8Ugol7RgtoTisvyg2y0cfvrnFOXem0FP/8trI
	bSmZphD5zcfOImrT7zlQN/kDQcgHOV2yT5jYCj1LEtjQZe+UjtsPDX3IQ6wRNjPv8HO3wmIx73F
	o5f/bnjr/M2IBM6QjQ8r3th9qd6VnoVoRjGc1ejI6SQdbnxG/sh5nIc68Xfj2VDJIIgY7C0ZkGy
	HTpC1xIzdHWkJ7hJqpnMYI/uOLIwTDytOiNdw261L60tuYPDZDQVJQQMYvXpbuWxc3tJgstJAd6
	oB/43gdA0llBnhhxQGNJJ5/A0PKTkoEBF09PMTQcMdm/ywqvTGlKLYJ298IdeJYfAT0+l1MSpuw
	Ch9KN1B6IV2NAC7UTKtcFSxlIhO2PMAqWO1ssgsytVT7XYQwy0Yen0fWFJiunbl3DU8yw7qNLBQ
	==
X-Received: by 2002:a17:902:dace:b0:2ef:de6e:9877 with SMTP id d9443c01a7336-2eff7566db7mr16316805ad.57.1794981848161;
        Tue, 17 Nov 2026 22:04:08 -0800 (PST)
X-Received: by 2002:a17:902:dace:b0:2ef:de6e:9877 with SMTP id d9443c01a7336-2eff7566db7mr16316465ad.57.1794981847679;
        Tue, 17 Nov 2026 22:04:07 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:07 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:45 +0530
Subject: [PATCH 14/18] pinctrl: qcom: glymur: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-14-703f7badd194@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd3fd8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lqpqssICSlazahQHq3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: DhvsII4LFKahc6T8nM6AutpgphmxucTX
X-Proofpoint-ORIG-GUID: DhvsII4LFKahc6T8nM6AutpgphmxucTX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX+M9+/R4aZoYV
 4chTZkKWtvvwYXEVjRdSgTf0750dJYEPOVfW128L7o2DXUCIpwNsPMqSMzzzIwAnSDWyOXvk6Rb
 hg+7/rQ/0WsqvvzmGD3D7OOTxmkk33PgYhMZ3eXX7TPsXP45VdQTZ9MjDkA2EQutVqsyHLJ27Jf
 sW7CDVR3lvAtpYMNw0f3LG1tMDrVsHpWhuCOq7XrEcq+laAc+J1BK0G0yzIpOuNClPghxXv5xu6
 f34LHWezBMXXBGpDMqekWw9VChu0mmgQ0q2U8ccBx2RvqIXvyhdNoEVlZ0w/4fvSHCrkeAr5KPl
 7WzkRoWB58iSiZH9+1Tb5vAEjbH6N6Ml+NmDd89pqqLjlxS52CplabXyU+5Y7AngauvmdcPP8A+
 ECUMM58/JEqRs7iKoecwSnNoAXh4BjgjOaGdX6+yAUWKva3oeI9Ke9oE08b0jjPi5oycOfSKgsU
 jrWrDTLLRG5Gi6SDb4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX7k4APEaO51s+
 sbtEf26PYnN1e8xCeYa8T2qUfEIwNP9O9/MXF+rV5YBpCPXOKiSlK2952GwbaZc5dceva36y0M6
 Ctt1P8E90NjjHdSwBN/+ASZsayyIi4M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180023

Add the gp_mn pin mux function on gpio53 of Glymur. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-glymur.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
index 20f076e59375628102324cb791dd7b269dc10fa1..38cef09659965485b3fe8827b91b561ea8c9a2ba 100644
--- a/drivers/pinctrl/qcom/pinctrl-glymur.c
+++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
@@ -645,6 +645,7 @@ enum glymur_functions {
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
+	msm_mux_gp_mn,
 	msm_mux_host2wlan_sol,
 	msm_mux_i2c0_s_scl,
 	msm_mux_i2c0_s_sda,
@@ -931,6 +932,10 @@ static const char *const gcc_gp3_groups[] = {
 	"gpio82",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio53",
+};
+
 static const char *const host2wlan_sol_groups[] = {
 	"gpio118",
 };
@@ -1344,6 +1349,7 @@ static const struct pinfunction glymur_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(host2wlan_sol),
 	MSM_PIN_FUNCTION(i2c0_s_scl),
 	MSM_PIN_FUNCTION(i2c0_s_sda),
@@ -1494,7 +1500,7 @@ static const struct msm_pingroup glymur_groups[] = {
 			ddr_pxi, _, _, _, _, _),
 	[52] = PINGROUP(52, qup1_se5, qup1_se7, jitter_bist, atest_usb, ddr_pxi, _, _, _,
 			_, _, _),
-	[53] = PINGROUP(53, qup1_se5, qup1_se7, _, atest_usb, ddr_pxi, _, _, _, _, _, _),
+	[53] = PINGROUP(53, qup1_se5, qup1_se7, gp_mn, atest_usb, ddr_pxi, _, _, _, _, _, _),
 	[54] = PINGROUP(54, qup1_se5, qup1_se7, ddr_bist_start, atest_usb, ddr_pxi, _, _,
 			_, _, _, _),
 	[55] = PINGROUP(55, qup1_se5, qup1_se7, ddr_bist_stop, atest_usb, ddr_pxi, _, _,

-- 
2.34.1

