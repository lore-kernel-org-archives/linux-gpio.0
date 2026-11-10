Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302174;
	b=o+u2dVGMp55Wz5ANIlEWn65TOoaa9fnaFJP+fWxZGRG9fE6ocsT/tdHl3S8n1Wnjxa2b
	 A4/LOnq7GLn517fS0Co8iCVbS8nEfxJHS+l3khp//Rp/1MgX+5owZHl1od36GJAbE/yak
	 qdWHxPVb4qLG+1teWmO4WO/QALcmEZor4snE/eBfGMzI1ttPeUdchoYymwK0QRhmCSI5X
	 cF/cafIQWsW72GNlKiosMuvdP1jVvOlX8W+RgZzGXT2qZ7BfciVHq/Bf0oTguHAKi3I+2
	 IEI5l3ZZn6AMrZLL/WtJHlXHPhOUj4dDscUKSKKSa/S4tzbUzJmYhuyfuOyrqZs4zKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302174;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=;
	b=yO7vmdHbzyr5gghskNtQL7YqYCHM7YWVYGKXAIzLjBMGFk7Wxj9SRvSg9pTJymfSf9Qa
	 AdbnR6A/POV8sj7sSqBYre09b3nQ/dMXNZu2ZItnACCKzQKee2dDu6QPM8Y9/yL/0KGPD
	 vEwU3BOf+AEow7jJVI5+x+FcigSPv7N0xxrQ3YsiG+NbYrby9RxdVpA0WXxMA370jv6Ml
	 7vuorCyV2RT3SHq0sh7mRwmRlbbMvh6UBNvHSdGYlh6VKQFQ3LSFMwGIFWvb66eMLCivA
	 BegxHkpYZOG4xb/R5RGRfJ2h90dejohzPt+5/WzRhKbULDk86FwsjZnYpZL0NrgumoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M1xZXcZk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPgoMVHe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A58260A2601
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A58260A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M1xZXcZk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPgoMVHe
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8Z6043849692
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=; b=M1xZXcZkHdP5kZRa
	S7BjIj09qSnLZ6/gl4fhESylDLOZgqgobSQb83wNpE6n9kYhv3shZxrQ8MH4/VyN
	l2g5F3mkbnwqKn7d45aCWZ4F5np+d2PdCETTR3OvyqL5Fh31fZfwAP2Uif4/j8Ff
	BT9S9kVCMwqsU0py68A33cdwQWwE26w5joeXhv4JKYv9tSxe9Uzbr2qBZeCPpdsq
	hOxgahLFzUhm+kOX2Ydh4am5OULhrpF0ojIhZo6VnN7wQwDjgLqA7bKAelN/AHjO
	YJX3iF8iOR6dwEbAGWsf3e5fnqKcYQHxLIY5Dftt8Os2KKL2aYAWL2WwjgMdXkfS
	8KFVrA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwg53g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:16:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ec6cd898eso35034346d6.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302172; x=1794906972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=;
        b=VPgoMVHe0tYN12oRa/KuAaocdtVbOjLTamwzxlhCyx+oMKmX4c42ahsw3vaa3fyQ6O
         sLMamX2RawLejZm1Da0Wis2qDEWQyGWlnOHzRXnECxyZQJhA/VxOMQ64kiS4zZzA6/qI
         NQVHFfSjBsPjDXVEuREh28jUH8fQ5/APUDjQHv1/BRpGh0DRnqu0lFRDN05VwsNa/NUg
         3maEtDg53YAYyORvX1J8DLD8dRpg1mLMASsu6c3G6pbayBTcyGTvIbmgTmOvOQt2oroP
         gm0DTPhE4XPGtXfyUuyY1NIESyT1W+vKDqnooQEUJ8yx1MQL4taBmEUgZ2yZ5xh8QGO2
         nT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302172; x=1794906972;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhifgSsU2O/LcZReDpY+gRcZRboLCDLzviDtAT1ap0U=;
        b=r+mmRjpYQBjqGGHnvwAAfIqWaHjesxNYbVHoRWjHF7L51v4rdnSmWxeiODf17Vyb8+
         Ixv12Z7k8eMdVvHmvTG3TpPuwbuFpQa2ozlr4YdFhY8j81Niyy/Am/tCx8qDbAHmsSDD
         D/jV9vJ9odlYUMqPfe0B9pybrCzj/iRbCNg9nePhReA8/IrNeUI9OktUAsqWh1FDoXnm
         Qcp+BCWoN2fxJla8o1xJNiJGFKTLH0mwomMc8mh4qzibm0JOM7YoyCDyv1iCalAqgR/p
         ACGZLBV/Kt8CT51dO7O8bAFlT3K54rh8kwdFC0xBUG9bUoMJ7pRRNb0useV33exRwbiU
         Jirg==
X-Forwarded-Encrypted: i=1; AL+hErHf8xpYbES74jT6LjjfOMLpPCDTzkKFPNXuRzp+Hnqh0wDy7MjceWkblEhkZkiDIooTqzPe/NIhvNNR@vger.kernel.org
X-Gm-Message-State: APuU4Z8UBm9okgtBvVVfeaHr6m8/lWL/BFR9XMtt6DFHycsiQRnIy92Y
	iQoMKKOkwwsJ0KdywNi7JdjO2t+4KdqzMYAsi5RdLXC9m6qTyW23oA8In5NfA60XIRgycWw/tJm
	dVFw/ImE2t9OJjrFa2/OJbIrmQxIfAEphg/UJEg5zGQqSBBOc1uZVdC8jGWYA2594
X-Gm-Gg: AYBFou1JSnksu/5IsGkUfr14mlv2Hny24d2sCeyjNC82hM2YubHX/5ALBPXAqkvhO8F
	ldbPNUAr2vbUUHrTR+GpV9PRwnA7IGgtQi3N2Qv0d4N3AwQ4enhr++Jq3qzh8ixj15k4AxUHz5t
	DOa0Oj+p1r9ZYKxT9hgqoM8KCIR4/SrzuX+lJ0IZM6Y1IZQ3peb+Xuo8+iu2unnyox0R7piMdlt
	g002w+/2Q2m09a4bzAJx/y+RQoXNkTIPy6i9ZD9XIoktAXEMCtdF/jQCR0SQA1TpwGAHV+Z5V2h
	a1Yuozg82Fm4SQFQ6SsP29MPPLMVmfB5Afq3wJGm30Cj8DRhYBSSbH7Udp1Gi1RTboBWlmOY9XX
	zRgjAFu1xCacoiUim5vEPSa+mPhLs27anGNRZw9d0b2ZWsqIG0St5FEEdb6MF2TBOej7FFbl3PB
	3O
X-Received: by 2002:a05:620a:372b:b0:93e:4e1e:aafc with SMTP id af79cd13be357-9479f34050fmr319499985a.36.1794302172372;
        Tue, 10 Nov 2026 01:16:12 -0800 (PST)
X-Received: by 2002:a05:620a:372b:b0:93e:4e1e:aafc with SMTP id af79cd13be357-9479f34050fmr319496985a.36.1794302171899;
        Tue, 10 Nov 2026 01:16:11 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm3833527f8f.44.2026.11.10.01.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:16:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: add missing tlmm labels in examples
Date: Tue, 10 Nov 2026 10:16:08 +0100
Message-ID: <179430216678.5751.5703304035925028288.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>
References: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WD1A93Y3AuRruOHXpXLAD_OSIgbQ6w5g
X-Proofpoint-ORIG-GUID: WD1A93Y3AuRruOHXpXLAD_OSIgbQ6w5g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfX4wMjXF9ZFQEr
 9r6cHNdmlI2Rf/zLI0kliCQ0w++Gevv5xNeaD6fx4aOBkynFllSV0syzzpCzQJnr4hYnz95DN9V
 OdRX5u4q9NQrCiIvA52aLmmCDmeaBW4=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af2e0dd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qIsIWIQgnqTSJORAk48A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfXzLTwqcY8mnEd
 MEcda43ARmlMUIKoGyLUwKkhGP+Cv36X3oQVc6oCxxbEHKykykhScaCZhrhWbAGedS9Pr25EBVi
 LY5SIztjD++Y//vQ/7tYyEaQSKtZguj9p4C8z0ckyoFz+k+97J74oRXY7PypNlCTEhDs7YJZ0gW
 uUbX41tpx9Un2yBQEOxILu3+MfeHdtE6NXO+Ea3D/DQXK8LuveVu1qeCcIBcps6yr8wXIb3QijG
 dbe2t3NmTRborzg2Zu6Hd8v5KR8CpRk3pBzmbD6uNYaM3K+UfHbMx4VtkkCqTNdiyhn7Q1h0k4T
 arxEUd95inxBpgWyqrvUioS/BdhWXcUhbxRkbR11HeWzbWkGM08YWAL2RLOd1KwRoIXOCOlrY4X
 Qny+71eQbpmUC2p0vp5St/h6BapL1BH5Lvmqpa/+0FUAu8NxF/bSP8Ekjie8YAirh7FJfgAVjRY
 jymcNAOp+hOSVjr5TzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100036


On Mon, 09 Nov 2026 16:57:25 +0100, Bartosz Golaszewski wrote:
> Several DT binding documents for Qualcomm TLMM pin controllers define
> the gpio-ranges property in the example node that references the tlmm
> node except that the label is missing. It's harmless as we ignore
> non-existent phandles but for correctness and consistency - add missing
> labels.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: pinctrl: qcom: add missing tlmm labels in examples
      https://git.kernel.org/brgl/c/54820cf15cbf657df81b10838d8d208d01d6c3c1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
