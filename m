Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603818;
	b=EM0T9dMBDomUIlz2A/N+XORx+pgKqi+utqpIaJj2rKcqIRJJ/eklJfcWV3HXhl4TEd93
	 2QAwnvbJh+2xPaWHIL8o0ZfIYfZ1R5Mgdo9n/uxNRn+AHnHcEws2EXTJ/wgli5DyaP81n
	 TE/bnTylqrkxC0W04YEeqGC5GJyRPy1jU2rta0JuRlixgYPEyDIp4Gg3BAwee3OJNy4zd
	 C++WHO5oeb6zvHWleSW2BikQgoC5ywAcu5rzR9HkrYY0tzLacjR27sJvNGZthkKA7Ci5b
	 51/kaWRV3gaBvR8wh9EDUjzq/B+Cm3H8cT8UhJ4tZrEq3tSgpmET0QLt21uqEew7+XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xpTTvHWTMC+bszUG9v9rCk1gnYFkDPtYUSwzsM4Filk=;
	b=tAMvwGeREvBAvfbH0Lj01xJizHhc0thgJ/yhU+JRe2GIHaxl/axEEyRXtpGJvxMo1dHl
	 2jYkYtlXNU+VK5NnJvHCoOudaVVpsiWtQEdexRrBq9lyCtNezuGOBzNtyJHMwzV1TuYtJ
	 omGjxoaKh/Kg9u3SEBRpz9TAi/B3r4TEXNowbW8vMdmYAR58tHjCLpn+Erqaq7OH83bnw
	 D8+NJhUHLhm9VGJiMovxn9r55P/I2yhXtG25evK4En2+I+1GSWS0ogsvn7Ka35pMOalw6
	 IIXgCVnM5GPZ+qUVahHsu0WIBn+C1CIdKrMspQHKlRnYmq7/pDNsUGbaVJDcyEI4+mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5GGHLPR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ht60KZMA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8382606A326
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8382606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5GGHLPR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ht60KZMA
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mrKd3644047
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpTTvHWTMC+bszUG9v9rCk1gnYFkDPtYUSwzsM4Filk=; b=n5GGHLPRCDbvmpY5
	oQ1FCw3JrlHss9ehReHHP13EWWaOr7vdEMvf5N5yNJ+A6xU+lBOjts0zbtcqclRC
	ZrbMjX5IapYo8/NGhXiNf7LhzuqznK6thBXszY5ekbFGkSSimzZJhO1DtlggkdTv
	5W8sfKCr4ot3jn5CL2xP48Mssf5NGeLdr3jlSTk7jzkChGwyFvLHdQYTP0d7bk1Q
	YH18NB35s0qyWSvxBY+ugXp2LSE/xDpIk0BcZPwEw9EtIqVlkfnxNQUUCKaMeMzc
	qyvePOIoJv4LxXgKqNKF4J+mJYT+tzj/VlNzwS5mlRz15UCwfGzndd+ABdxBFMFS
	EmvGhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2aest-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:50:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55b9c41fc3cso16937141cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 02:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603815; x=1796208615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpTTvHWTMC+bszUG9v9rCk1gnYFkDPtYUSwzsM4Filk=;
        b=ht60KZMADnBHxNJd6igVGoRVsL5YJe+sDS/W0ld0IUhpDj7JviczUCVIT5Y+7/thQ9
         xVw/1SmoigmKvILhdiMNQx54kVrbO51Z/4iYK8ppeOPT7Av+S3W0sUd+btQoep9czHmM
         +tjRMjQIeIPXxcvHwkuPEL2sl9K2pSAgKJ79VAgVflhi4+wAVWz5iJZEwIum3sLaCJuC
         6VtsvFE/RSotIeB5108+kE76JZW0qyyIewAdjPm9LkwIhTpnSOXfz8AKmioJMyiL1DZp
         RTfntkmODyV7dHh32x4SW0SWDIqImEwEQqFvq9CeeJJLmZue5cBJMqiOm20B2wPLvgAx
         nt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603815; x=1796208615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpTTvHWTMC+bszUG9v9rCk1gnYFkDPtYUSwzsM4Filk=;
        b=EGIfuMU/sEvtSmqyabt1Uk3GWx5RYg6O2imkDXCg0Y3iTWfZG9nCYx3UMsxKFYN4+H
         o0ot3Bs932E3giCvEjQuRQc4yN5xBR07Hk9KhX+xAwCi31TlbuNf/MSqlFsQJqtsvgz+
         vHeypTIbnVY88HJxtlR5bX1asX1ACI61MbmLcBSrIanm5ZPvscZpMg9MmrHUPZSoqQF6
         BVIulwi6FqHXdejHbZia7AYARx2i1gforvA78/+eEVgDFFwK+QUDlweGGKs6dmq0kTmM
         pYsTWvHAfG5FfLykJ/Xxv5TMvyA75GYajARPejBF5JKguSCR8Dr8XRTyDZFiE7wwYtO7
         /ktA==
X-Forwarded-Encrypted: i=1; AL+hErFt5q605ijsmayyhEfTlEM75eEipx9vyMzOQYhzpHyfaIiFCZusK2dzT8mkcExpebI1n0jbjmdaOxBS@vger.kernel.org
X-Gm-Message-State: APuU4Z9TCC9Lh3Phz1qRRO6S27p6tVGr4QJevtc6OYAqb/rDaURN4/aX
	LBWkK/l1IWLPh4kyjNJsuBCDggusP8Cdeh/XfoUq4G9tSjfwdS+T2MSnNL5EbGBs3RR1Xoj8YWA
	0n73kP6kVMz2qENmqmpoxfIPXENCF7c3jFuf3GSItxDngnV/IZrsMjn78qyR8LKvZ
X-Gm-Gg: AZFdTZcA1kPkub73v1T2AmhluZh9YrSnnovTuMCtl7l8iw4/heJwkhVyMxDZn7ouQ4Q
	Jr661KDqUL1iwxvXbLJFeV2bs9IVYyvtsiNBF8z960KBV5BFF/uB2+7IrKf5GHyuiWwTxRghV9t
	fe1V9co2TkjSlTnyHRWXpsSVICTEj6wIOIvlQGnRm+3HwvlLTJsFBIoNrHyzUe2mfpUx3IJ3G+k
	anMScHj/z6034tvQikvknHQSxFig1W5s2gZDcWLQ07fBwzFErxFunSLFMJOwK2+Rk2Mty3MIuaf
	fMZrhVllvyTunnSelMew5bhE5YZqLgb8LaCmf/mz7GyEG/MR78zRx7iWupOz7MCbKVFcjkx7dyz
	y2lLk683RbqR7TjwTxE/02wK2ElLYyOxskGQD3jjTHALqN3NtWMU0eY6/FWlI+eOHb1KHI/k=
X-Received: by 2002:ac8:409a:0:b0:55d:bbaa:fd0b with SMTP id d75a77b69052e-55dbbaaff03mr17324691cf.1.1795603815263;
        Wed, 25 Nov 2026 02:50:15 -0800 (PST)
X-Received: by 2002:ac8:409a:0:b0:55d:bbaa:fd0b with SMTP id d75a77b69052e-55dbbaaff03mr17324401cf.1.1795603814869;
        Wed, 25 Nov 2026 02:50:14 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:14 -0800 (PST)
Message-ID: <57fb06f9-8e64-4f52-b32b-7987eb322cc2@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:11 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] pinctrl: qcom: sm8250: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-1-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-1-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06bd67 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=y7CeRsGPqHAPMiWuVMUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Ra1DW8lb3ka8dzHu7j5sEZfneiQQHRXG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX1jdJ2D7L95B8
 Bo0J7QOByu0msir7OdheWjB/jstWWLEIx345s050ZzaPLRXFBt0VPSEk1gfboK5YcvjGxHpLrLK
 478KU6EdLweM7805hFlnpxdm6qTmVRKog8f0E2reN47fJIZwjHQDmoO6QsTQEJgX0gSmqc69D+z
 8ouEU78jKsdliUMpX29uneBPjJNFKg4ZQRpD49hSyQ2bhuot/rHmKYU4ifxR+rGWBpAEqhlL3z6
 UhxyFfu37oV7ZfdJa9A4S4VSpO82CQw/wE3uCqJJi6JqvOZuhTTvI8wan+QweDI/vw/DLiXkEbZ
 gznlZX6jLWZH7Y5PK+xwuMbMmNNP+HojG2B/hTfZhUXAv+TJx0x4ZWeoB5e9ruOi/TZl4gIXe3i
 AQemj3JT1E31zz0XaSdJkzZCCeiFDInrO/o8aTj1YGUpG8K7K2CgmjL0GwGvnUCmXx49e54Lxrc
 t4C/MnLl1ItYSkidiSg==
X-Proofpoint-ORIG-GUID: Ra1DW8lb3ka8dzHu7j5sEZfneiQQHRXG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXwUWr5CyMB1NJ
 13IUKmHPHAr45djWHEtuEQpv0/6KZ2EMGLhrESD5Bd4407Vi9c/yvAOgcgs6foxa7v2nBIbz41C
 4/Is/omaiHE8JlAsRtXXqfBUWoBEBSs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250042

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the sm8250 driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: b39e9199fbe1 ("pinctrl: qcom: sm8250: Add egpio support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
