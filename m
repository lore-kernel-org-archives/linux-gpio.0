Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530578;
	b=O2A2A2dpBuDi0+6TQ5PtkVrbHWb0Q9C/Ef1JHFdMF3Dno/IZRdSp9sE/EhNln9OZMsxw
	 tyaAgz4lN26ZT5PNBreImaJQgbsne7zWnEMPRd6Alew2sYUf4FqjzpSpPMHfdPyrE71tA
	 EejRJWTS+fxtTINCkdqv/6N9CAp9HwBvYxRfbDQlnzvJd+7fbOjfUuFEftQHHZK0Skji9
	 7jj7FGrUNNzx7f68sSfCA7gujoPG/mtDI6kYgYxpALFjjsEQ4UWtCi4nckfcxRiyPD7pM
	 ucQK5aBPfOP2ulMXj3mDOiO9/YdtmROQQMdLmdRjT92HY8SXj8i4BtZ0sWc8/+YrvSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530578;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=17ucF1RK7QPNWx64WDpCzIjNewACFearkdqd7q27TEc=;
	b=pIH9aj0GBc/Kyb9no3toFRNN9CD4zMSd05Yqu+uYvgZr3qT9XCpcCe8xgb6/w2geJ/m5
	 dLhkYM7FAGsLfz+2InqEDTs4gFba650fPzK5OvIPt+E1A1KcpcPprVQ4ScApvkPOvYckj
	 m9KNljyjh+qUopkQSqib1W8q7B02BtZ0vMBsN7EyolmDWsa0MmWD8KrNqIMbb0UcCRsB3
	 CtRL9rKTWNbu5QSapFAZ3DyjH3BJpoRWCtFeDbWn5Put8FjYab9rsHMGBGsplR53f8gJ5
	 vxeLVNVbJpi7JMoC7y3BegFqwh6rpnJRB9TY8nN16W7PduBlkjf68g3gG9sa3orvNtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kMOtVNIs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N64l7bsV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC3C606A33B
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC3C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kMOtVNIs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N64l7bsV
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAub8t1991582
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17ucF1RK7QPNWx64WDpCzIjNewACFearkdqd7q27TEc=; b=kMOtVNIshWOq23G6
	nnwI5Hp8X+KinfBgLWYCif424xxO8QoC7Bg6VVb+wf2rWSFjL8/AnFsBYpEVweC6
	f2jeY0HLqWKkXZjeuDK9VznSbzIbSPSZn9Ks+zsSJ6zl/8g0SqZ5RR1XhxWvmtwO
	CYDKcih3e6/vsBUsDylR3hZHBUnR9drfLf7CbivhiQvVVw4dgydSfrzs87fxA5lr
	mdXVpSHSt5Ju2b/UBLd68bC7LmCeq+4ipHHfRgI5iu5dtG1X++zLKnivSaEZvBu6
	gNajik1lri64y+23HPAhZ5/M/4ygeUoHSJCJQKhmpawQ87H2swFiB/vAQERsftCi
	cUHhMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6suubc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495af07676so720015385a.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530577; x=1796135377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=17ucF1RK7QPNWx64WDpCzIjNewACFearkdqd7q27TEc=;
        b=N64l7bsVqUh8VRALY1fe9gSE53BDLj5wqdiB0A+BiNh1d+qXPPkefb9zaqZmX+AGKs
         oR9B98ZYGj1BDpU/b+gHIQZm6k3Qak0KK+zJ/65HbABjGGFx60r2qGlbpJkoAtrXrVTn
         UGMvQnV0nm67ttwBhhVzHCPzP1vdpVICkc6+wZg2wKhi5melFAIXDTDFzIbgFaymvUxi
         KIh7PzY9++Fo7qrnlV7fysv51S+1/qO4WhM30Z7AfrQBbBXd5wqORQ9kAQgNYRImkses
         wbN45f5Io6KoDomj01YPgKUrYMYyb2FAMEiawv3vt7EhmBuazB88WFODmgSKdlzU9XVo
         JOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530577; x=1796135377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=17ucF1RK7QPNWx64WDpCzIjNewACFearkdqd7q27TEc=;
        b=g4wLnf1Hf4oOh4kzN+uH4lbSE9aj7INvzN0l2U67iULKEzhwbH61gQc4yUmmmS8+SF
         ZgSalj3XS/lf9Xubfu+fYXtSLj8cJatAWGh/UkvIAZehadEh4nnIpktpD2TO9j9mj9bU
         nba4I2ksadwTT1ZPwPOahCe9EuIuODpcq8RAv85QWyf0mTukNIZWe8lv5r380ZI1hsPc
         bA9DTTHj2mlqRj7chnFRPij2w/0+y19xSlgpqnCK0wJqlz54xGTGiTPMwoxiGo+J3LSQ
         hOVVXGCSXAtminJ0vjTrbdIOlSrY7WoTh68NISY3B8UDOuJYfC/AuKDI9mTtZjX1SAwj
         uFog==
X-Forwarded-Encrypted: i=1; AL+hErG79PxgYz5o5fVj8t/tS5hJz7dPeiQkM/K59fF1II9r/yTI788Ai+JEZItk4SGf33ZJCNuIUCr3TBZc@vger.kernel.org
X-Gm-Message-State: APuU4Z8uNAcm+DUiiaFXnIhucMnbiCdxlEEPHZHIWWjlKfTBqco5lr35
	PwggHUml3h5Hprr3+EdXtXnQpfULGiKx/mgND/zBzFE4pPXFJE8U/OMSgsOJBd+/UjtJDqcNAoZ
	9oEatLdPpqnvI1vOaI3M3g9uH2jhBuFfwAVo/MO8bnoC7jMLZBsS1f1gewxtSo2Ar
X-Gm-Gg: AZFdTZekdUqRr7vjZ8sjmetv+MiEyGUK4pFs0/XuzsefhA1gh9G2zcVEo8Lv4gg8nDD
	yo5ymTFRWj7s141GQsvZ1yUOAquTSs0oZNrEoawoY7VJ5WqG0vT/+WvVezg5cWyGva4I9RN8vO1
	H800OfuLPElexEpXEY6T1fGVp+EHPud3i0Bryi9zR9D/m7oIv2FkdW3cTTTMCpul4uBlHbyBwcw
	/FffyGCz1VKr1aMhaljCZbmNGKIZ+rAGyP0isgMrBSh+TGbZs+rc/OaKojB/7TrCeGTlTXEjdbF
	y2MMUaBe4AKx1+taONP3yfw4zbFjksM6rn8JMcGRrmA/vV7LOkVR58LoR6PQKT67gU57wOM9Z70
	hxa+Mst0+3JCwAdEW4QkJFNFJTDlZRwu1vXIr/0b4of5/dc8qfSli1mtOfsmaaw0qBfUmj4tE+8
	5VvPKGT21AWkXeHbqApCW3y7naO1SMm3M8zfb1lCUn32gH511AWaxXyKQRdp7a7gc=
X-Received: by 2002:a05:620a:a0c8:20b0:94a:a2:9920 with SMTP id af79cd13be357-94a00a2b753mr56326585a.75.1795530576738;
        Tue, 24 Nov 2026 06:29:36 -0800 (PST)
X-Received: by 2002:a05:620a:a0c8:20b0:94a:a2:9920 with SMTP id af79cd13be357-94a00a2b753mr56321485a.75.1795530576178;
        Tue, 24 Nov 2026 06:29:36 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:22 +0100
Subject: [PATCH 05/11] pinctrl: qcom: hawi: mark egpio as a GPIO pin
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
Message-Id: <20261124-qcom-pinctrl-egpio-v1-5-34f2c06b2658@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sOe/uKklnGp8mVDGaaB2xvvWbRkpxBtJk/Ns6ZUM4Bs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9CVyICZwkNyPi/6+WKjYCC967i1fMr+gVQt
 jrpP8Z5fHuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQgAKCRAFnS7L/zaE
 wwu0D/4wZ1FhhV0DoNOaoB+tMtI6aqaDQ0hQzENh/VieXwKr72Wwpq2i7rpF4U7UrnMg+4lPlgY
 e4K92qckwLmN3/Z/hhuRItZC/HCmUH+T8cegtzIZHkUqqf7bEhXi2WjblK87KrGa7Uiz//JPxZm
 g/bGBeqdY+0FpKKAyQj15dqhNt/Z20YQY6IcA6Aake9JeP16v3MbotcsEvGkLQAUUnFMQW3tYhN
 Lq/DsDNSx6+UzrXLAjYEJEk+aDe8sdwPyYETvD3aquUqAK8gQN+T7gqHwRXJGx443KieNP6Lvnb
 Ye6Jwrfq4fWSN5DqPJz94MitktVL2oRuixrT0MOk4ntsSB/5xmDkFxeo+zwJv0cIkxdxIbXdIZT
 jC4deyC32w9y5UjNGuQARDL9FyGGESbxKMIGuDEVCUsx7axZq5eDZbH3UHgCzLAf7N31nDbRf8X
 d0qeqlcpodpRjT0oWkKkFq4xEuzG6cWdskmSXY5eTFTLC7lJaTvkmyBSXP5g8I901VflduizT+f
 qtKnHKh2zxyMlxTsZEomhbVwcSiI4CZv/E4YpVUfl/P64KkAIyQ4mtEeKiyt3PsxBRsO4TVePRr
 DKtsVvY1Y/drG4eeoXCasUSkmJ8xQNii1waIM6o9qIQ7BHYmWNRYyhafMwTfYPpxRCble7cWWN4
 bUUBDBtfFpuPuVA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: DNTSnbOjXDFO76Xgjc9Zov4JS_eaU-zS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX9NrrFi2z/U43
 kKPRQu8ER0nLasYnpXXAuB3vOqQX19u4vsSsZbz1XaI53jQayGjqmMPQxJ9Et64stQZGIhV/wZN
 T1W2Ae695Dp9qQsu3FyvmSsF5B4xZZ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX4slUy5/AHe+4
 oKfQAcQSAUZ7GFdFeldtKywQ3eTLSGcDeWibJiSNZNU6/Rv1NQgn2ft/tdQrIq9GPczNOfqK/zb
 WnhmxxqmsG3cW7jRMAv7Gpf8U8lurI2UAieNaHdSbLcN4oBmDjbXPpaeZKxKkahFe3fZ1loU+f0
 R25xMhc77LJkAMidGoUnFRurZqZePH/qlc57i+AnPk4sutQYsZcWUXNCKV4TgSh74jmQX5pWkSl
 ayjnjodgFdQYJYzYqNJ2AMCwi90YLztc8hiKL/DhYxHsGPdJBnjwcViE5wC2+etwT5MjuDp0prD
 0P13eTL9c5swS8Z0ysoTPbXkSGMol1+qTQHJ/9STD1xKLp2MdddhVbmkQlnAKMVR3srocZNYKwR
 lcINFg1K23RRBOABVnTxRcY9q92QiC4S6knmp2y5GGPLuTTyMAhwItrnOtLJmTPVPUtMbu1lw9I
 qSnnTuWt+VPl9auTi/A==
X-Proofpoint-ORIG-GUID: DNTSnbOjXDFO76Xgjc9Zov4JS_eaU-zS
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b059f51 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=U65A1e1nmbD1eduP8fUA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240056

The egpio function in the hawi driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 90700e10d2ad ("pinctrl: qcom: Add Hawi pinctrl driver")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-hawi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-hawi.c b/drivers/pinctrl/qcom/pinctrl-hawi.c
index 3486a6d63d10e71b0ad78f10b0a88bf6f47db738..6856ace6db1b2253da1bd168a0919e72bb131c5b 100644
--- a/drivers/pinctrl/qcom/pinctrl-hawi.c
+++ b/drivers/pinctrl/qcom/pinctrl-hawi.c
@@ -1211,7 +1211,7 @@ static const struct pinfunction hawi_functions[] = {
 	MSM_PIN_FUNCTION(ddr_bist),
 	MSM_PIN_FUNCTION(ddr_pxi),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp),
 	MSM_PIN_FUNCTION(gnss_adc),
 	MSM_PIN_FUNCTION(host_rst),

-- 
2.47.3

