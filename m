Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446916;
	b=WNdyCxN+WlLgJGLwUj21RCNfMIJks8K2EWtORkCS496e77jBxvuyYWKMyFrit3/qitdL
	 3DCT1m2QGgQmgn4vrs4ch8tuft/U2Jv6kionyGm+YELwdiKIFRtAXiIv73aO/M3OrmaNM
	 0oidzzLo25z22Nysy7sTmI/a9W5N1WLdr/5JDYjFoLTs6OEVbOn1gslj6Kg65Cj0+NMUY
	 d5gLlAW3B5FJqp+ZVOC59DPaM3S910vyTkmzFWX1fuyV6+cC+QwtUx4CwtRD/hpkHVE5j
	 duuS2aEeLp/i4MNdvyaAFQHBlhhCoaneOuyEBT1VewfMSrLl81JEEj2s2Y743TFnGmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HaBeftMUnhhxBncFQazPbThqnWVC4P2eztZbGx3F0P4=;
	b=FqIwwyI+AJJlxZmmFZh/c8JYfLVEpn86rFnHPSys35CWqQojCxNQ3cuAomBuRrpNvlcV
	 Fg8QpqpOtfPO7eGxETe9lwJjYmOkMB8tEaTmMoZTDMANzroHg/t8mxJt0rJbJVulnJQZs
	 RTmfC8LCDko1X+JXF1cwaD8x1TPGFUp4jswKA9HL+VgQ8cquRhbZM7tNK2BThF/WO8id5
	 dUnYoahqZpIVx8IKzxhjMEV3QGMNwJ1bhXePUPDqX2UIyNurzS2xLV7OK5vIOJAlcWoZi
	 2coDhnoiZsPl6ZuhtwiS3av+AhCRBLQFAfm2f5FiwXOxwN4Hj1VhPwJMc6oRUu9VqGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=miUWy5b5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AKazSnZJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B479606A327
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B479606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=miUWy5b5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AKazSnZJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKwQO1937644
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HaBeftMUnhhxBncFQazPbThqnWVC4P2eztZbGx3F0P4=; b=miUWy5b5ZANW8IKp
	Na2r8bcMSHfcln7+zoXd0GblNMXm4e1yjRLhErWUBO+hD1/vAY3LnbKm+BY4WZS+
	/4d8K4xgWjXVU59BlYH6e5+lPlr3l0U7sTYYKXgE3ZworqYyJeq/vs7FphF1UJ/u
	i4szEixBq8fb1kEC+nymrcg7PnT1lG9kCLdQmBIeakHJ4XYUncgm27qamWZFO4Io
	5RcqvJNl8QCw2fmOioysZA6c4GTEqkbLbEuBFeeHBElvLeBgka0rBjW1GeSbivGz
	IT365o0f4e+j+csRjCn9N+a6nEDz5N9PZ88lsWTTFeFz0n3UtBrLXhNdsuRuT6Wk
	FmY5Kw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx27gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:15:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9496156f74fso32067585a.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446913; x=1796051713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HaBeftMUnhhxBncFQazPbThqnWVC4P2eztZbGx3F0P4=;
        b=AKazSnZJ4k6jlbbfPGwKQxb43uPx8+SFUQ9QoAfAQLi1I22rlTjxKF7AWggQEAkcwW
         RW6znDuNhoDi54yImd/tN/QUQbvnaOJ0/KXgGb4MaY7S95nJEFexWks7k1I9o2bp7ln9
         QVjHDYFvmHvghykP4/DXQiq1qKDD544HOzUc3sVKGJ7zroLilpduzsJmF7w5xlZPzpNf
         HX92nFOIVogWMint8kzry228vfQ68ZnKGOT4V33/Z6fUBJEN1OOG+2o4q1Jd6blt+vkQ
         oc2aaDAwvx0TkhIod7MUT7H9BlZHuxBS31GXVZeZYWLNAGIrjKksdSJrsNbrCNlh/bf5
         ZuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446913; x=1796051713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HaBeftMUnhhxBncFQazPbThqnWVC4P2eztZbGx3F0P4=;
        b=SFqojEMSHl0j1g44VREvXU05cWD0E/HoiYWQ4LR8O1RwRSISXCjhwbFfE1ZrEJaWjr
         OgDOfelDbGS1VlGsfIjVPb3zph+M+DMHQf+HPtqO+Dw7vYbUNzgodk57l2+Rn8pddvXX
         XsHLZSfTmNFQcO1aJUOqaxpNIubRFejhD79Ul4uF8llKMZYfAZeq3P96oV0HHYMUb78M
         TukHa12+GjLQk/k91aHtZHyDjapfwxJfjzhNs7JrEjkkgyv1iukWWsqcYaYQPjjnlY8R
         znAo90n0KUz1CAoRQKJvtfBJOvk5t6BWSZ/twHSePG/JVmv7p7akgXsVVezUqei6BBk9
         BVaQ==
X-Forwarded-Encrypted: i=1; AL+hErFgbO+HkWoDFEVSJoq/XvgaKZhr1vxgnAs/5Jfr5y5aI7TlleomOUGgnMtOCg24rcABjDL0rk3Il/Fk@vger.kernel.org
X-Gm-Message-State: APuU4Z84o4Z0P5RZ6tzx6xACIc8tKSdJbp0XHVNph05aVKLv5W58UJj7
	QFheKQtOHVMv9Zp5ZnjUk5alKlLoWtdk6rmVQxFpkfCJj8itqtqulP3fIzIIUI/VsLlfwarnYqw
	tAjZH5c0rnjnLi9LrCyn1rIq68wANvPVtdhGCMNTCa8PYQA54OifYFXkq+YL67Dul
X-Gm-Gg: AZFdTZfJ2XSgwT6/Vo0rkftWIlpRpveGI52yqjwRRyr5xllJgyu0Tz6njg/0sXPKeku
	eTQ4SevAO/bSJ5kzzCpKkMkWm+m/XCjobclge+nrqmQXDsx+w9POPi6U9l2TJIPaz4UoTWRcgyH
	RYP2XCGd1axEG+ixXEpd6uiXR+WrX30PDeu6BGlMaeN+sE6JzxHf42vWFMLRsEtt/GookmE0McK
	g4ep/Cq/6fkHOgImpGSqS7+Ka3/Omd36iQjv3ogl0q+HdiDHlyiImBhHN/JvSgk+lurGuSTD3aC
	wjxSaHJEpKgI8ilhP8HPDCnA/2Xp8hEQXPbUkNWre3wzFpWq6FjD8Kq+Bu4QbtcfN2OIJJyF0Yf
	guDHcizrZUc0gxpx2Nx9YZdS6rekg5GzZ/Ta6IDv8BIdoz+G5CvO7P180PZmC8+KgU45pqYs=
X-Received: by 2002:a05:620a:6695:b0:949:a3e7:e0e8 with SMTP id af79cd13be357-949bab1195fmr1767817785a.4.1795446912986;
        Mon, 23 Nov 2026 07:15:12 -0800 (PST)
X-Received: by 2002:a05:620a:6695:b0:949:a3e7:e0e8 with SMTP id af79cd13be357-949bab1195fmr1767803385a.4.1795446911796;
        Mon, 23 Nov 2026 07:15:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109b55sm5294415a12.32.2026.11.23.07.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:15:10 -0800 (PST)
Message-ID: <320255fd-75ee-4a4b-8399-ee185758c71c@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:15:09 +0100
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
Subject: Re: [PATCH 2/4] pinctrl: qcom: Enable by default MSM8917 and SAR2130P
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
 <20261122-b4-qcom-kconfig-unify-pinctrl-v1-2-f0068f161636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-2-f0068f161636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b045882 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qJ9BVZF9c7qZnBjrwvsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: fQsASZz0vcB9YOjHNpdUSGECZZTYM9Tf
X-Proofpoint-GUID: fQsASZz0vcB9YOjHNpdUSGECZZTYM9Tf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfXwLSW9RzNP2xf
 qA25fr7lk6OjBbWy3iZA6UdOCh1FDfkOALkQ9xdioNW4pMH0Frlg8VhOhukSP2MR/OAF/8593yI
 q2TyHdeqaNGHoyvG+NPplMXe7S4/gQ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX347hOE6pKuda
 DVMtEkbvisWxT5+5FHDrHSwFoNQJg72qZzjcdZQOgKEDVqGjA97myB2M/kfWRUAZ+6UBnIk3xQp
 N3bALGG6L63ENMVmS5tc2jWAijjD+DgOluAIuf4WE+DIVMTpNdhwa+pmMyjfDNCaVOsDsZzaAe4
 MM3BPOPvo67i1WHW6P4MI1GTsQunO4nTX0s19TIRG1pIG7MlXlq1qUbA7dxyeAKEgoGVu4jozNs
 eGcLGM9FGrT90U14zIAKKz5+Iu0uvWj37Rm95vrWHvWPExHDg2K9hG5dsVEcuP7c7zI6r1OOxN4
 WJ37UUHuJtONauKVVCUDadF8EaybK4JE/SPEES/j6tNJVdXsq6sjEo1CznNOlMwgItdQYYUhr4X
 BFzhPkN8QImOa39wLVPRAYs4eyGwj5hEgdbgl6VNsWBpYyA9qeudpbGeA/DvN0zxWVcE1MbikXb
 jJQlFsq2hOPAY/ui36g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230060

On 11/22/26 2:34 PM, Krzysztof Kozlowski wrote:
> The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
> essential for booting up SoCs and are not really optional for a given
> platform.  Kernel should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Enable by default pin controller drivers MSM8917 and SAR2130P SoCs to
> match above expectation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
