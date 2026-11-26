Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688479;
	b=lIhHsZYVuFV1Bsp0TxYwA7qkSPy2xw9BQ/mHS20V+OSN6B4HufjoXL/hYD1bCrlvafsz
	 sbPQvw5aBnVcjPM8TVfF3zFWhwHxMlvyB3HmtgqmPF/Y2IDQ1vxZ4m22JBVxRpSlrnqta
	 agyUwAjLZ7UPfjOwFLRzKQTvfFMm2Wpf6FK4YmIqbQ02qKLKq+ztV1BS1PLpTKkctCJ8b
	 hJCxlc6zlkMM1Few0sEwtkASjNQcnaFYJLzJ4sZsiEq1KU75rjhvaod/ZkudYUVwsu5s5
	 fXlKAYIAD/ViE5Dlp+vYIEUKdLwvUD9bxXQuCDVR1JL4970vVE7fSw+KDSU6glDNaAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688479;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qo801jVyZ5pVTOXgEIn9rvYs6UFB5GmgcoBnc5l6JTc=;
	b=1XDeLpaHqfhxf1w4p58kKRXRrQrv4pdzZrbNEt5KJdaKd3WlIJ+GaUP2dGLf1cPjBrmV
	 xzO7hWKJYxgTBLMo02s3lt4cKp74y4CoD7UI6bCGs0h0H+RRCZejuiMuKzXDOfTHEL3kW
	 s3XnZVKb+qLrEeWd8/nHyvp58Xo7qGaIRaC9AvtHGpBPAEGXq1B/YlL/6avgQNXky9mW3
	 fsE5rHLzTYyn8kOms4yk80/LdxXyTvEqngs5+DRMK7sw+zE/bBoYDB6rI4lQwfqTGig6l
	 mfCOLQXWrlN7h5JVLyAsB86lUdQ2L5LNn1aDBPbyeyWQgXPAJF/R4eTI0MaGpNtgvhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XpN26L6Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jgH4BPTp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56563606A326
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56563606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XpN26L6Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jgH4BPTp
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B6eb3548371
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qo801jVyZ5pVTOXgEIn9rvYs6UFB5GmgcoBnc5l6JTc=; b=XpN26L6YK+YRDEHV
	jDi/3qa6IcnfYcuMF9p6yjcTeBY+lQKCwiuLomBx6ItfZ8sNGAEPCz3wCq+k3q42
	0WidG6V4QKLQiIcWpCOi9vUmo1uqyFGZJiP8PE5diCpH26q51PSciRNcF6U/uwJA
	Rm/3o5/ldRyio0XIBx7qgQkXtQi4c+87tNs+4j7Obg0t2GuhNulaYBmXobnoOmn0
	xd0RBdCPStObzGRsofuTyIabvvFR67AZbPm6GmLSvN3/NFG1gsyaarpdzAQSwB6w
	Bs6sEJmn8006H0+gAlLKUICbihA0OVNhgABgS8Kftu/SFg8PiTyYLJNvXKWcgYIg
	4GADGw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaug7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55bc8181defso121769701cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 02:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688477; x=1796293277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qo801jVyZ5pVTOXgEIn9rvYs6UFB5GmgcoBnc5l6JTc=;
        b=jgH4BPTpvhEBth9+QLr9GZ4vinwe2B/U7VKnWgF+teJJHYSh05pjv01CM2LmShGfIa
         b94miwF0eW/IKZh3+cVjHYFb0b2wDHVqqpPQ78XC9nZF10IabAFwAujzkBZM3vIACbWu
         uyFUqc3PUNM5xLChdX0Q6WIdf7RKfSLsWZzpLjQ+qsbbJ5JL6bxQq9bApLAdt8B11Eoy
         l55VAl2KttGCbuw+5AW839yL2Ug/EOfZGUeCWiaerXGKcwe2tdtN7Tn7gs25YNWLy+0H
         K1Q7hxKuKsz5FyatKfQr5X6GxdQf7SYIJcDCrBOiMUqj4M1MYM7YMCiEueZyo94jyGDh
         +tOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688477; x=1796293277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qo801jVyZ5pVTOXgEIn9rvYs6UFB5GmgcoBnc5l6JTc=;
        b=tJYSiEaf9aqLesKAdPKrP9J4kdd3YfRKbFiYR1OOxbFQYGL5d9UACoHDXC9aqoN7Fp
         wgI/aX6hi3IJtFR/f7LucjWFCKWNvpQAOstv5Ufy5GV03CKnS8zy70Aexl4Fgp6cds8s
         /XiRH8FSExcOrBTLhQ0zzZlhp+Rpj7S7cCgAGuPkU1G3zAt6A6l3O1JXM0ziGbcv+e8c
         6q7lCM+T5+glIcfjd/hlh3E2QH2oNL5633kEWzIa9f2/9FR2WpiOHGBUV+lalwx86sQz
         B+e9jbFQau7yDz73Y4ivMR0ldt5eiFEgKJ4DX8gsFqQHwDXdyirjXR8WRIk6lWEQpnWj
         MTdw==
X-Forwarded-Encrypted: i=1; AL+hErEOQdcdKAifYGMBV2ncBqq391Y5sDxisFA3cH8CBPh99NtL8XpBLmgJRrTJF+UYdkReaHRJtOsMGwCV@vger.kernel.org
X-Gm-Message-State: APuU4Z8EqnUnisIzFGaVX3AtFllL5QPAuoSecCb+G8AwNfIsxjcVTDdX
	Ltj+p2QZfvZ+LT0DM3xKKIY1AtWL1MACgUvglRkhKxfRFxYB/OCy4Upcmb5n64AC6W1fUxrwb1T
	nzLK3pyF39Qf2wE1r3J7d8oZ7JQaw18WHhDd99sq++oZvBvDc4aKiBDe/tPtCf1DK
X-Gm-Gg: AZFdTZf0G5CgIbYE1FsBlexiS8y4STinmlYOHNq0NS/1svo98cvxDCS2J61j3YsSZG/
	xq42znGJoKrsN2NN+zriWhhsommji9CxZg6M3EBXftIPBcysFlOI0oizAdcLO+iBjuzQZ50JNHX
	5ziAnE3UrqiSiQyGAX/EIgT3VUtjlM1y+Nrx5RgDNeDvLe+5emd4URpnCatoJverqRNeB7p/N+F
	jxmBpogU2+fqwTPowbvMBYylLn7btKfv5V8ET+iXw2guXRB2F62FAVdQj8qikEK664gxvHwY+Qv
	Dz+TGlnsnIgIlCy5PvsMZn/L3Xv/huLUq0zH8R368FYo96+ntTXAoNcKY/4A6Nf3rAkqAF0c/sU
	HHtAwsWLD8mBCqNRixItFB+kClhbDffHFDy+KCUtk5aOetNsjJLBVbLaZ/E/xQXzP0jTBVvYoTU
	oJP3G8HDEEzNseIQUCUDzgCmB4/0M+HpIdLacShKoOxOxjRrf7Sf9E6pevELYH0dM=
X-Received: by 2002:a05:620a:5390:20b0:94a:11fe:4d50 with SMTP id af79cd13be357-94a11fe4dcemr217779185a.44.1795688477472;
        Thu, 26 Nov 2026 02:21:17 -0800 (PST)
X-Received: by 2002:a05:620a:5390:20b0:94a:11fe:4d50 with SMTP id af79cd13be357-94a11fe4dcemr217775885a.44.1795688476986;
        Thu, 26 Nov 2026 02:21:16 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:06 +0100
Subject: [PATCH v2 02/11] pinctrl: qcom: sm6115: mark egpio as a GPIO pin
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-2-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jde//jTRCulxTkhEiQMYDQlQZELTTdBs4JQ7/coq/oA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgTbqboIX6vcqucrE+MAjA5lt+0osRrCXuSw
 tYSmaZBi3eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 wztUD/9pDv1z6lu7SfkROslLyD322kNPF/CBj40T5xTwPuxA6AxaeLRMHwX7CpnmFcYQARdq1gO
 9E2vyZ9Dm/XUkkwmgOyttJLNmLwomWAOt9vkNqRK5UpMFPq7Z9ZGH7VeBxl+wUwJaIjZhu0u7Hf
 jxJAEh+LT3yexqSTeaSRCscQ32v1JONdbxtB0eFVJxJNAC56fCVmI1wk8Nu+WgI7NXCOu3qDfSA
 6SLhWMN2T92ZngDI/F1mnWlOvf+eIsJBtA8Z/yc7C8QAkuuWrZgrOIpRmqqKDhPdnCXJRL6B8o2
 aEBoPUpozC+5AdYNCUikQ+B1ZEg+MgtXNeSwTCVBtCE/j+C4ieQaEW4j6DPDQJTajm8A99enYS1
 grvpL+fQJe+MQkUbVrNM5FJCN9wv7Pqla1EVVR/Gj1NOLqnlLlI0GDtkqc4mHv5vGfDvmlcwwNc
 /McgxfALGXJqa+WhQk3U/JjANk0cbQOPx4YgAMqDqJw6Rkf1RmajrrUDY6zQnnC63ISCkttWovT
 GvGV5Y+YTJKU9XbnrguZmeFgSdIsk9bBXWNpQd1e+MaIUAtUlCCPNDE80jtNZSDJfbn9SetGxMa
 Cf0sPn9ICw2QBOm546NWVbE3EMkDtjiDJfGuh6oLRUE1tFnI3LXQ/GFG/HtBnnJZF9WuJKpycSz
 JKARuVErrNTITGQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX+xomrhyy0kZ9
 IOcqSoFdzLhktGYjbJDtDwR4/J6jV2BqQmxsM6WM+sG2owQKDtig0cQmjIAiC8EH42DiBVkIM3b
 5JFQkS8Vja1KwHw0A3alQORvx4M7mIY=
X-Proofpoint-ORIG-GUID: XMrxqCpAGepSOP276Hac6PrDH3AyNQRK
X-Proofpoint-GUID: XMrxqCpAGepSOP276Hac6PrDH3AyNQRK
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b08081e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=8nAbR0bechdim5sVv1AA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX3pmRWyMBrIh+
 LsHNoBABy+8UhP9cMS/wHlb7afMa9CBmKrPo4Dsc/VDq4AFFpbFM8YjKl2xbMB4axYcOPtc+tg6
 QJL4ntp28Fe0r+5QeazY/9jGPo4hE8bCaIhpGDEcCxPley71pOIcG8Aar8bTQhOWwBp3dG3QMZK
 Y4JH35aSTU4jBkO09P9AcO1sCzqIC+tQ4g/Ar3xE9nx378FZJk99IulTPl2nhbfMuVXSyQYDJHx
 2CJQqcWnpatB8ApXIDrX8nX/7Y6i6T8nZr+WZCdcZqcoCFA3tpJfGCZ9icr8ty9HWLYVHK2py6F
 DF0zNLQvK9ipH6sfaQmKpBwkre8FehTJb6UnmL6t7hpLZlVYrpE74q1PVMCg6HGRlXgjHuc/c2Q
 zyXIqPJcRtcTLgyb+KvLSrcCZL35Zw9Zd6pgnURrqGNQ5NLrHrgSRGeb6gAXfHxCeMhjWcf/6Nm
 JEKn5R/iN+OzUacPbUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The egpio function in the sm6115 driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 0524a508b2cf ("pinctrl: qcom: sm6115: Add egpio support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm6115.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115.c b/drivers/pinctrl/qcom/pinctrl-sm6115.c
index 0099c474c44222c71ef281dcdeb25b7eeeb4deef..7aae2bb15a435a6f64e996a864c49371dc1fcef3 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115.c
@@ -689,7 +689,7 @@ static const struct pinfunction sm6115_functions[] = {
 	MSM_PIN_FUNCTION(ddr_pxi1),
 	MSM_PIN_FUNCTION(ddr_pxi2),
 	MSM_PIN_FUNCTION(ddr_pxi3),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),

-- 
2.47.3

