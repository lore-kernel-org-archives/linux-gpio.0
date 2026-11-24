Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530583;
	b=m6xnv5WQrzpmHUxmhN67HRUdfJc1oAaZUL6nGld9uEuHW3Tn3Dz0Sg6wEBTRdIh3Jwmd
	 CGGdaVaYi0qQLwSuIDV2PgnHbpPZue4uQYqm/jOtTf8/SXFcmZvVLVL3U8h+Vx7PVqZM9
	 3QelhQigtUUwE7UP9/c1iNYikS8z3KIIML6Ck4Qp6PalKVFDCud6Vs5xuKsV0rOaHQnbh
	 FfmJaPR/+XdZ3VfrVy6Oz/DF6BZx++4u31axmagk1YZAshIm6oHgecLyetnpXYD6/mc0G
	 rTHVNgY3aKslSFV5I6qNPYS1vdi5vtm4zQBocsam11hQ1dh9rLgVo5/ZJ45sWN3l0/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530583;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HEpyd5NoMdQSJDVtZfa/XKBjamHBNqS7USkhVnA86ME=;
	b=NvIdGZ4P7B83p1VZkVeSprYhnmq6FxfFZfNuh5Hb7ehLEh2u8YGKOzokWCtJDIbSclgV
	 mQ+3GMzkSZt4F9cW29YQFy85vRL7qCrrVrltu4MgZYv3eVP78Rl5uNtVglyrHCpAlTvf7
	 IqG0siW0w6j24brtqj5/7F6gf17aDfTDkWlK4Z7C5IVC3cduOzxiItAnJRa7Hhfl1rj0o
	 LcJoL2uC2Cs0QIXigwlxBlKviZOIhSktbKnfLarQt3DHnBE5nfamQbVwMbDsSM8V1OeeJ
	 rWHz3Wc1G6sQ5sMkiOaFr0ashBw4RTmnsLRwqzIY75sU6rz42b5/z3XAlg1DoD9uSvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P5AjI1ya;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RDJygbmu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D2E606A32E
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4D2E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P5AjI1ya;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RDJygbmu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAubu01025289
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEpyd5NoMdQSJDVtZfa/XKBjamHBNqS7USkhVnA86ME=; b=P5AjI1yaHtygG2Vy
	K4A7EE51tYhDGAiplmjjtG5FmLKKjylOX85FOqmd7/ldvx7ycwIBhDCG8B2S182c
	t/GNirN5ET4HWNMUt/iEOtcAK3Z5CtAzv36Tp3XGtKTgqgLeefDzeSjmgsL6jLDR
	o1fqdwmZqDICXzN8AaDH2Ye5hrXTzbE9y+HNiomQLVJB7w24LiX/4K2WpF7V+cuI
	2rPrm/l3l8TNBu759BySPu4E4nS5YnrJ0YyVylxV7jmb4V2WujljOBYASEBi/48M
	TmzKwKMRBtzpTcH6i/F5qmArHpwICFu4bNaPhUD30tORSmhVsh4We43eznilIYmx
	L0tzIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt384a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-947a607ec40so441085985a.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530581; x=1796135381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEpyd5NoMdQSJDVtZfa/XKBjamHBNqS7USkhVnA86ME=;
        b=RDJygbmuIa8RLNGq8yWQSHy5XqYGe9B8zX3s5IyCA1EcObmvSuPhE/2t1F10M0mQzv
         gApMoR4d4eH6QwDk5qmVOLi14TbLpqhSyVcm4FCxhtoDYtEneqIBaeBnnFDmYfYeHrOT
         jTulyzDpiMPTpyoSaKAdkEhRksPrNT1zlujzvnulEeFkYeYYs5Tcij6lvSk850HMoAfI
         0nyy05TPgyZt2Gsd0M/MdDSknotBDWFZ9V7tFkyJqRYb8FxEDydG+R8mom+L4A1eTaB7
         P6sC6/DsvaGOgPdjs3MakxwHqbz9tc0FJ50l0soy4J/GIq9GD1ELP0wsvJO/Z+enSgdV
         9K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530581; x=1796135381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEpyd5NoMdQSJDVtZfa/XKBjamHBNqS7USkhVnA86ME=;
        b=ge5ddpcaiXU2WySObfVbgUI6RnqdL2aErXb96RJHUqCmLEH8smEIn42+purzrrgB1w
         +crEUe3D/omyhwrNQghhCImtr6v0idqPLoGFLPSGOmKXBHDJKCuYs53nd6u6zbifwCRA
         macSRIerVR2Y/KlB1h2BV8jZhazqcgEuDqSJmO/UQR1qI99u9qpq6htOmS5UP6isH4r7
         Ul8vtf4pLKvLU7FUUak8gEh6WhYSFrN0zlAhj829Dwg+8ealdocaRakJWwvGIUpV55Qy
         AX4fU258bFNxDwB2VRerP7ke8Y2OIHPnUxdXEFxdjPw3NlDG2Am9tEbdOiNcIA4AA2tO
         tYAg==
X-Forwarded-Encrypted: i=1; AL+hErH4G0a65LOysc33pjh45FVtMCEkfVpF3zsYamjtQKE3a7x4J1GiDfCdWA9W4UM6BGzBMxidSpLUDgY4@vger.kernel.org
X-Gm-Message-State: APuU4Z9tC/J+6KLvOCTpomI9VGRJVGIxE80FRorrzFr6eF4ss2y02Coi
	+MKjQKkelFBi8ZYcm+fH4D2DYa6aJ+uDB1VNu/iabvtWHXqc99fScEjAZ667GjTGTBAW81h5lYw
	pw7RbHRous4h9zwuBaQ+3bJpO7uNWwczLtiMkfloa4hKPVQfgBARAi1B1SNJx0rvR
X-Gm-Gg: AZFdTZdn6E+nb0ZLGVYJfm1EserGI6GJijTiX8TTNl7B4TpHhxiUHaQAKIc/DqgyeuR
	C5GLi8X2yaf/QVMszP57KyCfhcDDE42HDycpnalPQ7lY9ysgoDkbQNY07Gpp1Wz7slpgnlSNTED
	k84qOGa4T+Q6xEF5+2qdQWXpKDBRcWXTe3zq6ScP/KB6f40uso2PS0Iha+T7AV+glOMAxOZZ/wT
	mbXp4Iv+qwOVnUQJUTzOhAwDNb2mZexNYHD7qXON1YRGDQu5CD6JvbEiLU+M3neItNkVZddJmdd
	JoVaDyNRMDn75c55HQZHq+0/J1Z9DBf8Wca7eNncX+hRY0y3sKiYhTXcvR4n0mxPnYKKHZxBpgG
	jU7C19Fbdn6Va/77mfb3M16f98hDxgMmLj0gZpAUERzYKK5/dFWJXVZP8pGvFEtR3U4nA1mF120
	T0fKIKYdvLJ+Yyr3K/Upysw0Es0YcrIjEVrATiYCIO1wEHs+PX1LHjjBysrlF+2mM=
X-Received: by 2002:a05:620a:838a:b0:949:7427:5e7c with SMTP id af79cd13be357-949bac80de4mr2436813385a.81.1795530580990;
        Tue, 24 Nov 2026 06:29:40 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:949:7427:5e7c with SMTP id af79cd13be357-949bac80de4mr2436805885a.81.1795530580248;
        Tue, 24 Nov 2026 06:29:40 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:24 +0100
Subject: [PATCH 07/11] pinctrl: qcom: maili: mark egpio as a GPIO pin
 function
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-7-34f2c06b2658@oss.qualcomm.com>
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iLH3lnSsVsWM7ZJmdOj9UrSc8vTvxkJ3hf/pgHF1t5M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9CEsBpNbQycOF8TWg6uYB8q2XtKY7VavZ88
 ByNtg1px7GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 wyEGEAC3PHMigkehjMMkS0o02FkvL5CSj7Ilsf4pXY/iXJNpXz5N8pmawPatVKIGkDQIIEvJC6e
 U0ICUshNdQ5Fs6lDtNVOV8lmowctdt2PFCW8RDyOnPaRowCeeW3rKN6+GomDR0Do0qpCxwCjvIr
 zl9vYAPMsZtFhom6neN6oK9NhmW+7uGuQ+b4QOkv2VCyeLP8zoMl90O03/znhAnAUBkQEPM3VPs
 j16Ny5ESzND9WP+CVxaS04n7fmKEdoGItfTC9PE+Hw/R5rBPUkDQI5KrSsBgBzwHgFy/2N9SHgK
 /yqGwI89hNoea4Z2uKD9oFO4G4T6AHFaU+j6XO7YLwdx/P5zrxgUQQw7WLE4/ygQAQjG4ZZHkLf
 nvyriR1sc2ktiNk6ITD7heUL2w7O11wS2WiZn6Tzp250RdPuOEa2qLkSQi01rvCOCDpauepQwwI
 4XHpgxyInig6SoOQl1TgKwt4HaZChWDyh2a1rkHW9WpAsMaQfF9cHJbxkFfzaBGVBaA4dEsn+Qu
 wk6MxzlV+/JPiYYdDQFvskHo9z6wurf0D8hxx3hTMxKnzYxZlGQpz08oV/ls5f0Zv9W2W7EPWJb
 LmSPg00cC87KEyWbaf3+Q/GObgou4Y8wPu7/k9Pf6O+8UMRL4i1cmYvkDPqs91804Vxb3HXtuYf
 RbirVHwwDjd8Png==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX6tljPwgxPyEC
 taISDR3NE+t1LDneiCx9heOGfTfcYPLq1MAcB/XSxsZnKif08/azFxz73JztPAHyvQmQ7jw8Z/U
 iNSu0K/uCYH0qRH+ZbhB5XeJl+sftGw=
X-Proofpoint-GUID: ZJHC8jJ1w-dzjoWyGi5aZeFrVj9ExgY_
X-Proofpoint-ORIG-GUID: ZJHC8jJ1w-dzjoWyGi5aZeFrVj9ExgY_
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b059f56 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=rzi1cwwMUWT7pCUy_hIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX9LRdcKCDFofm
 jMVGKgmUFwObqHKDozuNZUWyP9NpfdQ9a6RW92MwM90AeUS5pFb1/dbswky1A5GTal/StSM8Sth
 GhkWPsV6Q90EQF7IQbtBdDw1m2MU8bmvNtxNi3NEVcVIoNo3qpfi1DAuHswVFTndhFn5WSVuol/
 sUQSZ5GjWldqVSzBKXJPylvFZmO62UBVErD9TlFZSZuAwOAgUjLcERmnO0lQwr41UbhumakBXEG
 jsl1V01tKSAZRwJQCJjKpMyhB1bvE/JL9dJzvSoxeaKh+y38X4o/5BQ+M5RXd26WebYoKy7AowZ
 V9DeFDXpgQi2ZlBTFLXD+XV2Nm8mKBVsG03SLkTxVj7yH0eWaq4fcJt83pYCDIFKt+xvbDmh2L2
 onmqj24OtExhx1X4VacEqziNlvtg38CsHsAGPxeuKdvdQOXUZK8T/7UdFahoS8UhKuykX+Vvzxh
 t5qUNNKIFg4ObV9glkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

The egpio function in the maili driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 251b53103a2e ("pinctrl: qcom: Add the tlmm driver for Maili platform")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-maili.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-maili.c b/drivers/pinctrl/qcom/pinctrl-maili.c
index b9ff0f4479410656cc73567ed494a1cfe25bb56b..5b75994134238a263856ea2c0337ac196867b767 100644
--- a/drivers/pinctrl/qcom/pinctrl-maili.c
+++ b/drivers/pinctrl/qcom/pinctrl-maili.c
@@ -1226,7 +1226,7 @@ static const struct pinfunction maili_functions[] = {
 	MSM_PIN_FUNCTION(ddr_bist),
 	MSM_PIN_FUNCTION(ddr_pxi),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp),
 	MSM_PIN_FUNCTION(gnss_adc),
 	MSM_PIN_FUNCTION(host2wlan_sol),

-- 
2.47.3

