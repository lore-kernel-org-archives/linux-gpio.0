Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688485;
	b=PNR2uAOZ+5P+j+N4azsng/nJhDLfFhOVwVEkEJ65aqsJaeaKg/ZNc9NSZIOh+MYxCkwJ
	 Bsi9jFWeHnXDgXCmIVHDmfzdOyoEPpMsmLp4rQ5wANOGEfhoAtnDSY5Byda+Ffiwp8TtO
	 +aGg7KjZNOZmBsQMm+TsyBxfWxHeeld7QAB25dIia+FbSst0x3EtPQWPX9dpePfxKPFLT
	 x2XYCKM6rrL6QQy3Ck8gthVBtaXbFfkot8BRS6OcWuBUnqFKUBYC92trbjg1NSVkyD62Z
	 9bqKD2IXylnUaNKS/nNor9sNme7fD/e4pmurRwrw8IhyWUJTShG+nvekczVcCnrYlRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688485;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QzHXjq16E5JrEr0r1kM10pHg04dKKlopP9omlyRAcI8=;
	b=P9BJxrrKSnbDZcRf32oKhHawwcsucKbLLKYxlFCfmELHfRceM5wTDCaQW5JsSS17SlH0
	 geQsNt0cuo3oSMmRr7yAec5De1h254LTp9xeBBaGs7pvSt1yuRSS5oQl115gKB9rKTndE
	 veZuin9G+LZxG+7Rhy90NUTK9qCTviCaCfPPz/yToN+08lb6nBoND1q6LDW88g7GHew2D
	 aMTyyXUbDial6aW3Nb1b2o3cZl8KskfosN1jAZ8z5Fbgsp+0XtSHDc9OnVtS/y7eD+elt
	 LRaZAlTgKNOIVCUA6DhDLPkWGsJzkmsIXh8mwfFixgx5GtUO7Kl9xs8YHR4RFqmV25g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHFZ+ERz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gcWqPUnQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF4E606A32C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BF4E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHFZ+ERz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gcWqPUnQ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Ar612885418
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QzHXjq16E5JrEr0r1kM10pHg04dKKlopP9omlyRAcI8=; b=CHFZ+ERzH4RF9Xwo
	z1VDxDVc2HjBM6hZ9/9iSIr6/Cc+/CyH7+LS/kwvpm9isf4UVZVdj2ASKg7kFxGf
	EAf/IdK2nNMah6tduZKzXfAd3S5N7aWJvO/m9bsnet/xjxchQJbbwfkmACIPgCys
	atoWa2VnWqkBeobPyIH4WCEbuw7kfb8b6OUYkmr04ofOR0ApCBQ0VgbTyoJoLZGd
	CmnpRTXotuUI3on6lHvNFcPdCC/NLm38BjqeYt7kQyTvkmkR7vjmUO97+R1ADeGO
	o2+TEIB4FEfNUrxbmEu5KFHP5nxzAvoszVlDWpa49e2nE4OB2PNoreP0qRhFVerq
	u7D0fA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgyf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso1168684285a.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 02:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688483; x=1796293283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzHXjq16E5JrEr0r1kM10pHg04dKKlopP9omlyRAcI8=;
        b=gcWqPUnQ14wTWWz/4bvfgIdV+HZfBQ7zfg6SVAF+8b2rm05XAAV9JBd4Rd6QwBA1jM
         ukSBfj7Ys72T63S9ulZ89HaAZmuSva6KtapDBHzS+RUi5DZq9aUs5Qj8RWzOV/ArI+zk
         WwPxWqA3t+ukKaK0iQ0/q4NOvWoUOJDPLizUYddgaWpaCXFOpDob1q1C7ATWlFRSd/gq
         o0qwV4ltOOlp8oJ0hs/YZ6MyKwN9FbSsgc+sOy76As43jMQWlBC1kppHVTJUifl+0QlF
         /RThszp7GsGwgBqLqRA2aYgutFMY33wv++VFb6rql5OyAe+aUvyNO3Zk+eCs7TOb7jtT
         GMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688483; x=1796293283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzHXjq16E5JrEr0r1kM10pHg04dKKlopP9omlyRAcI8=;
        b=oFzhiuMHfckg3NDWQqtWFXXlsbo4XyXQT9hvBb4i4rZgxbAZUxP60bTuoYNu7u/zZn
         n5JqTyv6TU4JV8hd4CMuWmWEytzwd1xjkPLpTeZKSKrKqP/OxcxK9TZQM2208Dq5aJoI
         TiYA5JIcrQrZyGQhmlnPGEQyJHs4WGXldPuoe8Cz8LjYbte+1x381Fi0L62r4hsUsQgM
         W2twNDi2+H/7QAA+UalmF5Gty7k5jeRiKiLgZVLiuI6N5ci7/iwNaQuGupRQaPUxKUJA
         ERqemiXV2vUy9ynLwdOPlWTZfCCfBuYZd6rwzEpTqunpQrWkSF2DUc9YrmHky8RhgmSN
         WygA==
X-Forwarded-Encrypted: i=1; AL+hErF/vQJ0u2GRnEs4e1SxFb8LoIHXEVJRBly8cuy4/4p4IdcgPXlauuRes6sKc0J2t0Tcvq3VKf5rRSmN@vger.kernel.org
X-Gm-Message-State: APuU4Z+4vQFXKQ155y9nAnHfi2KUXcgHhRi0MAMRu92JWXy0lcS328LD
	/etj1j2tmU2kMqldxCdPnGbU3Itq69Lx9jKbKqbFmMkjmSfUpqg30gVVE+boXd1N34I8WpciVAC
	Gy5PexWqulGqrYhRIH1ck5XWS5wqzVkmgF/KM1UPqlBQhKIG5sntEsw4cYUGjoEc6
X-Gm-Gg: AZFdTZfj8Em5ItYLM+Vn2yNvv9DQNaZ9i2exWZPBMLcJIKrFrqbJCDTn1ahCahcdhjx
	wNsDAiUJ6rWO9M6bY/uSyA1i2sAH4hNpsNdLQsnn0kcvH5h10K4IwvClP1NNn+7EyJSD1B1CHJV
	rpmj54MEwVVQrpTrFLgoKQhatt4zjbFWlKCu2QjjCsau3S62R8Ry9vOJdhQJiVcygkyo/FzNYpw
	+zXUSeYYzZG3Esl4SV1eG9tQ46VP6OOqbX26Lr1LUMPPDDPzBf/26G/XEPgRwOOKF5qWpG4mM0q
	fW8nMr9T1F4ZrJzGe5vRKG4R05BQv60BnzmL1V8yQIRZwm4QDm9SMxRbq0v+j8Zw/nEaAc1lgFU
	ZNhjwJtAnciwpravG++vmInIb/QDsHqRsXydL8JyvpOe3R7wzdcH/HFahoRq9Un2HJEt12T8sDp
	oxIxiBiWdo2vCHPm1Y6rjmUNPOlzUSlAyaXKnY6ovsgkbB4qMzaNXias7H0QCmb8c=
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff3 with SMTP id af79cd13be357-949ba82355dmr3753654085a.5.1795688483466;
        Thu, 26 Nov 2026 02:21:23 -0800 (PST)
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff3 with SMTP id af79cd13be357-949ba82355dmr3753651385a.5.1795688483062;
        Thu, 26 Nov 2026 02:21:23 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:09 +0100
Subject: [PATCH v2 05/11] pinctrl: qcom: hawi: mark egpio as a GPIO pin
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-5-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PXcb7Wda7w4beGr4z8FvdCTWfP5iw2i4mvm4TpfkBlk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgTFsSdMu2DU7NhEmocafPG0tvuGTey1JMbg
 xvvkiJtykiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 w10mEACKw/NXXRrMJCusgib6CueanCuVm7+pDZc2nEEF+OTuLbP9D8o3yB7pR6nvUlg7rGbyT4i
 HhmWd+WzNRxRNEfcKNGzU2lXn4xqgJ5g2WW86HYIKlhNHKA9bYwYizbtNkF4cg9l6lb7z4Sb9CH
 uoS7mTdR7s0BYz8xPqKWH0mf07C6jm+opD9+g2vc/kth24NQcVbd3p93sd0gsSUK2cTH+KIkG1h
 D49rhneFdQV0NpqHOkqAO5PSQUoICTcHV133VaflKkhRo/YZLRlOluideSJyFcWz/cZ+Xo1iNt8
 PI1COK80O1sZslnztJxL54td+NxtVYlxYKZfdWwalUqfu3lltpRdgcIY3ghLSI9LxhNFGSQFZV0
 z4vJws4w0ur1m197VwvMlSNqw7E+0OZJ78EXG565vu5KwGOROP8XLhXgONs1SLy8mWsBbU1x86L
 X4jc7YZ+OU9GCwyqCdXNhGvD0iAbAwI7QrYLIiG+oKjzhfkeEX4p+5lJv/jAQ3Q9JsoowjN1Z2t
 M7klOSrSiuYDHy43yLri4l9m9RXv1rHGz7DQESkdjouK1T/P48yLMo5NHfquZJV0RrcIPx0ijjN
 4tr/u4P9Pk9uoyeifaxF1az9HRvop2f+tlHlqtdQbDNXqKKsnaBFCd4wiKAwJDKChqzOckIVa4m
 gFWtV7SZ/b7CMQQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX+q3d9d+Xu5Wz
 6633P7dM0BHx7HCmFxF9EkXZpJLF8T82YJjxlSgSGZ0GeLNc+hT7fWlQ54VGaqL7nxrXsrCWTe0
 PX94CUEU3S6n67mP9g6L/xyvK5sZlQBqWeWaU8W5CPj7G2CMqxortxdC1+SuzMKZ9C8rbD2E6Ym
 taU/jdfL8O9p3KDSYsKp0jPZXT0KZawBEXsBW1u3nEMrA6DOt5QWSbIRaXfL5Mxh1uF/5XYE/d/
 fsCVZ3uGJE7Y1TGeOy3f40AXnX9H0u/grTcsxCVntrDeszsdo8gihmsz9Gi5I3rSpVw8mJW4ldv
 yl8wSWG1guGSGRYEg8LfgoAxtr061beEWt36jzDaNOJt55kUZ0uLxRg6FU07fyY0X4EW8tNfMB5
 2ZYuFNRTI9vPJQSEZX/0oXHggJ+KozEbunmI2TFukIevnNCk5rQNix4lYo7Mww7Ph9Do4uS0yVV
 XYCh2jSAhkJl7eTnBkw==
X-Proofpoint-GUID: F6X8onBEB_801O0M1TtUTtssfzATZDfC
X-Proofpoint-ORIG-GUID: F6X8onBEB_801O0M1TtUTtssfzATZDfC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX6slZJjA9mUhi
 0EoBziMZZqBjau3Zt/Y3kTF85Vc+5WXqugly2F3Nw10dvSlJR7IhpGw7wAEQNXWIRsOW2O1iiuN
 +Tx7I+b+SxRw5FM+WIYRR5lJDp3J2OE=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b080824 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=U65A1e1nmbD1eduP8fUA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The egpio function in the hawi driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 90700e10d2ad ("pinctrl: qcom: Add Hawi pinctrl driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

