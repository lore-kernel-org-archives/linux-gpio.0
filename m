Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688482;
	b=aBsaShY4AfFynYHPp2lXg9K4C9VIeym02bBCYiLuoS4V6D3+ycQOMNYYOBwAdXy9Fj+g
	 LjvPz+WWN+m7QjgEO85ZH/qmhsUbpfkfE1WogqM74nJf5mBWO8OK5FPkkOxjTBB+le8cu
	 RCEO+s4qz+2/OEoEAd2HSpF90K9S4wtjC3Dbd+lObCMOpQYpkKDo9iwsnn2Z9Ndcy1Hqx
	 9iC0WrFHJHrjOuveCnb0zsNEpyKsXCdx6ukmzpFpLlCgqSyfUXysj+sUrNI0+WDA1e1Qn
	 yvGWJhRZ6hgaT4IADPmJNtMBXFVVemkiEGq06AcKUP0LMhfkvTWLpJ+GRzeiqW7ZG5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688482;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ukDnWoJ/25LadkcTLlCySW2FLPf4B85JZQ34qa3CWaA=;
	b=u6GizDRQ6paRm0Zgssq0H20xE6gneBrunhaAgKqw0WH9TwxPBKAtMKXY0tZeQUPaSrmF
	 OHcaqj1YaogvYQS1Lq3JsPeEJuQXj7nrkUbamcMYI/+12D0AxudqdwhItyISE0XsZFqCf
	 /VBwzj5QSY+Vqu4ovkLYCQdpfxlBji+zI3srfbcAbmXjA0h/Jmh8mFqdihmbGADaE/R27
	 TdncFsXeMLyd6PGBNRR+hSgVj5sS9xU+RlTzkL3e33ocMCJj4bARvFMSmMh7Y0Kk2epxm
	 w1BNGVQvbwWJA4/Hd+AIiu34lBUj1Sc972K+6TktmJaQhejEd69vSGK4QTZskHdCexA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DhTAYU39;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cENrr0Hb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A49E606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A49E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DhTAYU39;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cENrr0Hb
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B2BX1682387
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukDnWoJ/25LadkcTLlCySW2FLPf4B85JZQ34qa3CWaA=; b=DhTAYU39nrQZvrz9
	4eOYfjiYSTHXjmMERB/9xzsqhVt1ywAUDH4bjPVnONzDNWtTZ/gA5WaBDPW+PUEy
	HFd1RJOSnEyazsuGDDfaNkWYtTMkIBbmieA/DLclTk4SSX3cZDY7mDVtbojU3zwK
	jTU1tEMPmZCmrYhm2wxe/Y15vmUxCcUxKzS8goDgc3mGUVueqBnlRQ/3mfaXaswS
	/+7eMXS9bAJ7WL2yj634pB3Ez3eYRMQy1jGYM+p/ao5uBeiPKVcKg87ExDx48I0V
	yUh3sj5hPwqW6VANGJmijLenG6J8fO99DtPa8jUjWpDLAb2hAhiPF6i/ffHbkDb5
	1Ywo7A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aeknwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so1195439585a.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 02:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688479; x=1796293279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukDnWoJ/25LadkcTLlCySW2FLPf4B85JZQ34qa3CWaA=;
        b=cENrr0Hbr/czlFADbvqqQG9i0NLWeV/BzR9FQ+bFLVnHWVsJWwFuGHO2G+/FgU3+50
         dWfEaahp6ul2NoOdgTP340OrPDH0ZQedL9KRucYHVVFt0zH28T7Ga3YaZFXetatEjC/N
         adr986upr3i3ItnYNEoj9src/9+8Volp0WwDJQga8bYPz7l9znsrAnYNzxPV0mrhv3/E
         e9iCWjbE0N8MOLN7Xpvzskx4hqpKBbc6W9MDuuBH/XCcTjOOorMrc5XruYAiatssidCu
         iER1RloNdfjMIl4VyA0/f/BRDPQ5qGUvpZrWPELXCTiU9+544oiBI4FwSwekAebtt415
         Xt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688479; x=1796293279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukDnWoJ/25LadkcTLlCySW2FLPf4B85JZQ34qa3CWaA=;
        b=KSlZ1Q/m1o94w+IA7YWryLQReXmMtHtyjO66O+Bjw00jsfLkiAJaNWeWcIwHaGRNwy
         P1b4P1WbB2hURYDOj8uebgEx22at3I58FhV/9IZzMMapfbI9os9X4rPDj7uFl53LKAqL
         vEna2SYI2KY8ZGx/7xBeQqB/q3V3cVwIUXeZJPEFxMh4dBrd7PtsKOlfipRzN/ghUyzy
         M8ZstebULKWy1nv299eWIgXpxSAqBgqRk3iRKG34tBSQ2HyGLkDJ4Qmm/Im2xyjMYSwP
         3dwLuBzF8udcF34HF831D86raplscFiGYcQ8YMEcgISNZGhHW8Y67ZaZ75NxW3zjwa8a
         KCkQ==
X-Forwarded-Encrypted: i=1; AL+hErHCQmfYKSRe5ackhS5LN5jqsb3xy+ZIRrr0vwiWgjwTQ/BIjMCcaJsu6tf0JOfijlHMO3DI88xKnXbT@vger.kernel.org
X-Gm-Message-State: APuU4Z9374jMAfTDt7hnXuEKBbKWMhvQvRXkMu4+P8ufWX6dwTQYeSFF
	NO3NcNO5r6ipX/Pjes5mFzE0PUqr/qddxDudjzQ2jRZhUCCriYcJH0UIjdyXJs3/s8sEhJEhOSB
	FSI4P4gRwF9uz+lEwShw56HCnVuNSFFHgtX5Uhj9ThAxy0ZNmChqXAa39LumF5Dam
X-Gm-Gg: AZFdTZfCeH+4dsnDraaFokHwf7hJuex8w1QQ/LFftDzeygo7jqNfgFlFjc6bP4+qCGP
	wb9tttplG6Le031CXHOVqRXlBneC1r/JrZpaGmbvLVV4xukytFo5nV+1gavuttLyIZM8qxxNUAQ
	Ll6u1ZvZOCBoIlCerTOgDbyQWjag4p2FZDv+9F2gTg1JyxZUiP+Lnzwu9u+tv7oC/rV1HPwNfBz
	prnB721pwqbI0E128OWjRoxFS0lQ0ihEnoTXe6bIv/b5u0Z4ncKoBXyZ7Qb3If+5nVT0YDXtSK9
	cQRba3DK31hhJNix5Njm4kAvLLQLIJGl+HPAgmd07AQrZ+HeGhUMYANTgTCax+KpWyex8HhjxRz
	J+l0s1CbhcjorRhePFCmd32ParzKyhcTy4ZjnLjv81CAXEiPlrPesv08I/g4NQr2eJgN27wXiuG
	hNw7Qz44A7gtr9rxvu1XVEbmJ9bY6+WoLWNDCwnA1Ppbk5a0vOjZLCqbmVQDCUuv8=
X-Received: by 2002:a05:620a:8395:b0:949:849d:e3c7 with SMTP id af79cd13be357-949baa0b24bmr3543304285a.33.1795688479552;
        Thu, 26 Nov 2026 02:21:19 -0800 (PST)
X-Received: by 2002:a05:620a:8395:b0:949:849d:e3c7 with SMTP id af79cd13be357-949baa0b24bmr3543301785a.33.1795688479064;
        Thu, 26 Nov 2026 02:21:19 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:07 +0100
Subject: [PATCH v2 03/11] pinctrl: qcom: milos: mark egpio as a GPIO pin
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-3-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eFL3sb9oYAYsuwNA1gL13bp+GdJy7O1UDpqPDuJSOsI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgT+NNSktfa6agdNq+6VkQV7SM50dlhs4h8G
 o+oqCb2ZIqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 w2C2D/47uDp/aqZ1JtBZgXSYElyuLa5q7DC93iNKVCUPU+4SIag5c7bjVvseU4eZdmnhLh+yHIR
 1+2opnAbNsF/saf8qS9AIX5IQfltDF+7z+/YJtGCVJ3G1m4hF+xWmMlskfPeFZ0DJSgrmPvSplK
 GtXvUrAYF0ADcbIkyGGl5ztcXZzcQRKokRr3w+gOY5d+jyXQB0wvirkRffV6wOgLApEYEth1B5u
 fmTwgYbqfNUqnzcyaxOUEOFdGim49quKKFQ/qzOGqAgqO5U1mlI/POtufVazYiedqnp487x7jnf
 KklvJnR0rA56xpohqDVafMthX2q4M1YO/Cftr3MhcUCibMLIux4L6s9ipKruumKhVH01Bm1nQiw
 b8SpDRYOfvccOxDXOw/XtXIWig3H/SL8fhzhLa4obPs17/yJU/twWjgLGDDUbDf+pLL5dWBqt05
 nS0HrxfgqBMYxE5h7ptNqxUP93Spnn1IG6q7/U8RXNW8593svlmxmpzeXCuzlEJYZwYMFwill4m
 o1bj5phkRZ3UYhIRxECbTR/q0ezTDfwL0gQyHTxzmcOtjjECJAoNqIzvcMJiVSoqlHgGwvghcTT
 PMYOmx/tVqXjbGwycktwHmkDFuSq3/LgeFUU6Bnhxiu1rNI25dpbtN8uYFTQbJIT+VNkSjEPi4T
 xByWkjqjv/QolTQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXwH1XWD+siS/1
 v6LjQ1MXcKXjfPopqIQGo5L5dCiUhJ7ikpD9qQ9+xxMbAPDHv+2pn3cpDAveR51pkwJy3zw71x6
 plF2YB6bGbhdPjLotdxXaY1mRXidQXzj8od1eyLv5bGjg+JRIKubCG3RGG+T1POgmPfDBUXlvU9
 E02IqjWlkRVd1e4flLMX97uNJMeOsI54iwMJkqA8Wspl+zugXNhhXMx3qj8VYmC7kFt3as5vFLT
 11jaIr+JQnnyd4kQ+4NkLbR35HqAbnB9IjiTHcZU62UtoptLoabfkdDIj4M9qXP+Z5+UqUDR5/9
 JcuPccEq3ZM1+toalzzDXaEoZBelheanjCwtPBYVup6K6S9FggAZPsBIoFlybZ0dOvIAKmfBvle
 YRLhdL+k8wqOlamw8kB1QaQCcIeW2c/UHET31WOIpGsIF84kAd7HFCpmuHRQmff9PoTAIjINOz4
 L0nNNdHVYKZ+VMjtP0w==
X-Proofpoint-GUID: UHFyzHVU3tTjJj4VnGjx-G2XG1U8iriu
X-Proofpoint-ORIG-GUID: UHFyzHVU3tTjJj4VnGjx-G2XG1U8iriu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXxPSWU8SF1Lzu
 YqvXmTZHDZFGp6DOSdrlXtXkrUyKn89JMGXr4RKWRz+RNzDXmwMa8M2FrEiKhGX49XYaJyQgjlc
 BVkwS5QKlmDHTelb5vZF+e7H52elC84=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b080820 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=WQ8GYrprbdz2Ztkh-BEA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

Commit 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins
function as non-strict functions") converted the gpio function in the
milos driver but missed egpio. With strict pinmux, a pin muxed to egpio
cannot then be requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() for egpio as well.

Fixes: 480dc1952404 ("pinctrl: qcom: mark the `gpio` and `egpio` pins function as non-strict functions")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-milos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-milos.c b/drivers/pinctrl/qcom/pinctrl-milos.c
index f5079a0ce0a3ea64f301427887af0ac7b32e3734..5dbd543e6057bfba5846bf6e87d4fb6f637064a7 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos.c
@@ -993,7 +993,7 @@ static const struct pinfunction milos_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi0),
 	MSM_PIN_FUNCTION(ddr_pxi1),
 	MSM_PIN_FUNCTION(dp0_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

