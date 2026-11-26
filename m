Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703535;
	b=16y0u4nRxN+UvSWzWBh68dRKMs0GFseCuvf+uMLQDCQXkQhAYX5FFhzY4kRCOc4IbRe4
	 1s99Q9kSQOClAT6JJntnzxMrIUyESmCJ/+6dKFbl4f0f7WltDVk5bh2/aY+WGt77WZBIM
	 DpNkm0QVnHbeNMLJggpknibHF0QNuqfBTjeXKzTpjq7JPiJzdczDNBd+MmH7f9wdQ7/WA
	 8TW4yTkIePMhcEzvG3/hXXSX3nii2aSshgDjR5dvgV67HjJDs3NjKQ1bkM8LuV+xXF90b
	 5M6uwrqBUInCBFt4drSVtZGqnxDgFRHppeVhn8unvUpu9XYwUC2s+NI2d+8AyvlZT2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=;
	b=0GFBcrcMnFi1KKeKyhVe4L/JjXO+FAVFeiPvNMyHILwSi2ICxYk5pjfLUwOnzR8jILQ6
	 JgDpTFjrWxzQzlUtR1vIsH5MeXNZaYgDhJnNvtMngb/qnICJ9tuyVFtDb+ukfFwAiflfu
	 hlO1bZwGjjvTAQM0tPUXND6/HdvQngJcSNMhf47u//VrgEGZETeWSyinU1R6bv+1JK+Ng
	 LzHoo/yzQKC9jd1h3hP7a/hpo60OWplabgwVjUEgYHZxb19UyRJrKmuvru6qgEm576AEk
	 w4CzWWX720PpRTm1BMYw8eHvYVoJ1DXL5UI25UBOPKe1D7EWBZ0lE5PjkOPEUo7mNjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zuic+b+Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iRBVgi0K;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DA3606A68E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30DA3606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zuic+b+Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iRBVgi0K
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVhTO1883403
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=; b=Zuic+b+ZyUBYCnYB
	Ye31Y4qBd2rm+sfBodz25oJpX2oO8njVZ3iT96cRqLD8R/m7BnbEP7wTfYBRlJ9m
	pXTy0u9zfxXuJJ7QD+Hj9MgnsGHdl/ZtQkcDWCA9EEDYTqaD2qKzdpkB46Bh+Hg4
	uNtratNK0owXs+ywKZ8YU5q1oiz3O5ddToJLkSJQ7dSyvnZUhxnQWiX7uBkNv8Jd
	wWFYC2RFQKK/01Sy5OHaeh7BvkdKsxwPJITg5FWTnDUXWolrZyFmFXwNXVqNEbfg
	Uu54Wdu73yaxZACxCoxO1iJbKY3mZdAA1T2dHhE468o2DawfxaNAYpfsYm+d1c9i
	mDRKOw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y3etu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:32:12 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-57ce11e8723so739205b6e.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703532; x=1796308332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=;
        b=iRBVgi0KPqA2po6wPT59BWRrwvz1WPsn0U5gV5WXd81WZSi/5aM+VBhGLAZFkWm/sF
         Dv4JDvAI1EA0xKW1LFUo2AyE4CrvrW5FEIB5UOvK6fHNIbR/DCJfbn5me4DkZ3X+wJYX
         AkWyOO0ev6uGnZitkzC8zgtau3h8UM6Z+ckfah5d+et70MHGaY8Ht6PEp8SuY6LqPMpb
         euXx8CGzeME1FP2o6EJlzSZn1qh3vXBQgDR27N1Y0Tvn8x82yOZXn3mll7jNjn+UurUS
         MlihYhCDK7Kzlsm8oKTMAqGMSTfzC7Ipw3uOwmzB1NS7YAkgu0tiVkaQfmaUzGL09o90
         LCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703532; x=1796308332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=;
        b=mboryI9uW3iV+2/3xfEyY6gAbbfx4Cu/dfU1lDxwDZ5Q8Nt7oSz7137ES0sNhgGyPB
         xbWR+Y6Jjjfl2Knmu//42ooMeE47tStNUoed4dT5X4PfapzroUriJPCf89aoqJKlhRwi
         SsPqdzLTThiXo5JaTpI8deSlXla6mtJ+8zXEpiMSK5byOL7k6T+dsWrzFQFGCLp+STc0
         X/z8CGkNAb/ik7jdKydL9iyC+oE2LGgMrZoTUWqmwL3ajQqtTMLU0Eikgzhn2l24noHG
         X4sW0RHI6FPb/8sq89LFQN87RIVJebTfZ72M8ZHFltP3iUQHrj3a67KsOpy64jLc9JFh
         F56Q==
X-Forwarded-Encrypted: i=1; AL+hErFwh80SZjq4L6nHVjZWvMgxyh4jcZ1PvTzfvecGttLafi2kZivZhx4Eet3mLlH1c/Hky8EqXh/YLXie@vger.kernel.org
X-Gm-Message-State: APuU4Z8F4uCKdKLnVbOXIZwln7SYQgvBlhSa1+r/FVzrkoz2y3AjEzFc
	gn2bGdvmy24mV0/wN+uaOys6ha7AltFxcZxPgf6ytS9OeH55yI9/pZYxfpUb05B6Ry06mUnAapY
	ZPE0k13AKa5SE43D0xh/RPwdvAhszACawDF/Xqom5A0u49FVmWIDaW4fueluImCaC
X-Gm-Gg: AZFdTZePA1xjCvB4Y1XnmSH0B+nisiieP9FwaSanfLknnAFVEuusmqQCwz+8/1/FnUn
	OrReTNJkoojXmNz1oA8AG8ZNRLcZ7WzpmzmgUxvF5zQt2T7iYwVJjt4YLNfdu9Txoa+6hVXJGQ4
	hc7b3YWn8Ciy03pxtbWkkTZIqN80MnXLw0r5ptqgDtQDQ7WqDzZyyOR5HxlylC9JKjDU4to3c4Z
	F9FfJ5JxlP2A9WLlw9ouEd6QRBM4CgkFFNgdrr7nNSST1p77Y4efR0DIGoM+Zqsy6Fr+otT3RAP
	G9uV5kZ0lzNxklfwVBlel2xpEBWzRNb9VjRabsGFsEzTvvfhyUDTIiZNhkjaeO4YDe13QG/ZnyT
	xn13OHzmLN7NQYEuHuZRbN/v22xDE/4PRNKULG3fgfT4W3N2wWUj34ljdz+qmeD0FU5SvKw5P/7
	sE4sdPaqA=
X-Received: by 2002:a05:6808:bc6:b0:4bd:73d9:85c7 with SMTP id 5614622812f47-57a024f2218mr31443867b6e.0.1795703531651;
        Thu, 26 Nov 2026 06:32:11 -0800 (PST)
X-Received: by 2002:a05:6808:bc6:b0:4bd:73d9:85c7 with SMTP id 5614622812f47-57a024f2218mr31443826b6e.0.1795703531228;
        Thu, 26 Nov 2026 06:32:11 -0800 (PST)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm676995995e9.10.2026.11.26.06.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:32:10 -0800 (PST)
Message-ID: <84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:32:08 +0100
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
Subject: Re: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday
 (SXR2250P)
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfXx4fDXsPtI5AD
 pPMmscz8+7RULlPE+8okzKzl94P5BAwp/iSQacKkRpmdJZSp8HpqGpTnXsUgu8ekugyUEy9y9Kx
 x7Z2sGH/+5UrM+Veepjjda8ARAjxGLnGS9xEgNsf1abPMfCvBDv7pCX5Wlu8kABJ7NczHzMURwX
 6OkDhKF2mO0Ko8OsBkZFZfeZgppBWGSawwMTN9SM+67YEv/7vaVsPF6f3UwcTpw9MSXHIGYUr97
 jpYs6SnPImY/UprO45HQknBrHTrS5eT2aK3T/NuWbki8glEVyD7hqIw89pdxfEEZWtmiwgv7UgS
 o0ZGbdpDEUoO8cENd7/aDxDFBeqGCRYDKsUnlaFeW1lFci9w4WIps4feZvpoQWl8PVzyGGZl5jD
 UZV8mp1wzasXgM8cS/VvObH+A/GW78S0B821V1jwP7tE8on2jMDg70RthJbpSH6oqbZf+yAItun
 UcdPO8lRaI5dNpF3qLw==
X-Proofpoint-GUID: KydCWlN3nvFxB9wFkkNaM_-SwXlN8Z18
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX/1L03APbw/bM
 WS5ESgcTfNsvHYsXO3/A6HkLzD4W8vtNkfKgb26+hZNsSlE+s1LZquORrZa4LJsRGeckPgDltrc
 xbz3rqgOKG8Hk87zXv4Hwld/XU4IUds=
X-Proofpoint-ORIG-GUID: KydCWlN3nvFxB9wFkkNaM_-SwXlN8Z18
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b0842ec cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=dvIHkycpzy01oOa2bCIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056



On 24-Nov-26 16:29, Stanislav Aleksandrov wrote:
> This series adds the devicetree bindings and pinctrl/GPIO driver for the
> Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
> Snapdragon XR2+ Gen 2) SoC.
> 
> This is part of the initial bring-up effort for Qualcomm Halliday
> and Samsung Galaxy XR.
> 
> This work was made together with Claude, ChatGPT and Gemini.
> Reviewed and tested on my Galaxy XR.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Feedback from an LLM with doc access:

gp_pdm_mira: GPIOs 35-37 at mux 2
gp_pdm_mirb: GPIOs 88-90 at mux 2
gp_mn: GPIO63 at mux 4

Konrad
