Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24924D8D99
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329186; cv=none; b=FMBwYG3zejVdZrkVs+vADkQnzVFRu+C+2PtqX9bfr+S34c1nUb183HJSA35NuB0t/eWrcR//XiC1W9lSzN9g5ZnRPRjsHkQPhMlBE+efzg7gvtwvM19EkICwLxDKQDwNer4i5nL+eeH8XJSdBQDW7YCagYtQta1P5mPtzT2ukmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329186; c=relaxed/simple;
	bh=X10fgcE/VdvZBiLYK96ZfvDAsItFNmfond2stuPddA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRVtvIVq0Au1eaHyyLqWQkADsDgAJW9VHtKBnVK6DVOxsu1LFajVQEWMWZ7OPmgEXOlG8lF9UU5UmegoR7CoUvqBq2QG+GoVK1fJCuQ5woXdFpLf1JRSEIMc7IzT0Fum98kx+0FomfLDXf8tZalcTFgAztYw+k9SpohDiWk2IiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N71lhcbr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1IPRsxu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N71lhcbr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1IPRsxu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmJAY2744623
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=; b=N71lhcbr5rc5+Ma7
	v7CHr5pI0zWKHpS5WKfVzmaKWSDa0qPLNneY6rafufgyARMVgi9FcrqVaWYBBHrY
	COagBa67FingibI8pSKl3ZwRQA9CnJ5QMJBs6Z4TjfF2GhOwIr2vp3P1uMeIIG4t
	qmYRQR3ydxJpNjiwhamZ4GfR6vuUGjPkmNG/wjhw7aue4GfQo+tL4uDY2pkovlLi
	+dcVHB5V7ynk77UYXI9igboWYJBlMlZ7vZXn8ML+KVjbaIDJLqogTXzyrh2tERZe
	Q6CfduM2rbDDPPMwB9E36inNdUhnSpN0Zzd50lct6zIe71nJpniAs06X+P+IOYuD
	gULumQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdnaggq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 16:19:38 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7ec3b429610so2246172a34.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 09:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787329178; x=1787933978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=;
        b=V1IPRsxuDG6rg7FbMrCs755o/yJHxniVx8t3O/XDpKeH4JHqh1Ejeb54QKZEzfxhOZ
         D4RY9/mo5xct8nyGObaLIoZ+0V7t/vcTnzrHpjTQ3ccBZ7tqbcfS1lAXhUK+yR+8ShQc
         bRKNg1rGygzqSjmoPFo5enrWMg/tvvVdLSbuJv894LBcpbGV2wfmBnelUHzNzjOoLV8d
         N/xW0oNLqVVMi+eVmy5Dj6fAZ6BIsDVgq6QTJRFG2Ek4sDf8emYqY5Sy/z8+ALYrTRd0
         aF3qqjks6zjWzbAjPeetunghHd/HnjMrh5OHsa+VqQC6SM1ZPpdo1YmNkQi9fgjjBX6o
         ad5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329178; x=1787933978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=;
        b=pBeXh8dDKS5s3uyBoUW1S3OkBQsLKH4xpLqtkmbhzEWSj6d8BsTeWhy9SSqdy/+TEQ
         RByXPOTB7nQu0XO3XD6T0MOaoC8EqAxZ9Ei5MLjgBVB8Un55xxPVlBbjoqyRBuetK7CO
         WJTUgGMvG0PK/KrLHKaUksr7LSnK9GD+VqIo7Y2+r7PzffID5pnkpqg3QrchnXkZxyv4
         TyONrmug7/OhQ78EW3BRkUI+/smc73w1L4ghzm5lLF9GAiYbCcEv9ja+MmS45bHbWPF1
         nYzds5XiN6ICA+DSwcoJcv2yUrqypErfC9AWs0TX9sH7MbwGsP2KuV86PiuVLvmDOBO5
         TG3w==
X-Forwarded-Encrypted: i=1; AHgh+Rr4ox1nuOGNWC30xCPWoE6HgSXNpO/ooBLgLVi7rBO3SrcmNMPLQQqcFtXPEfMdU0ABt/V4jOz3p81R@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6emrFIag2PMJsBpfa7yeovXyopNS81G9HIaAE0oVAE+JbwkrC
	IkTkbrrHBt3oS9pfac2bkOqaTzfjZl9XfuZRmEyfyEnhTC+0G5WY2YTR6zW6cnuSdTCriLD69dP
	YRTEiUSsh3J5U3z5noeAeRaOTX5FASb4m+CkJpyegNiuB0Tl7+KHOOy5aW6fvFwEK
X-Gm-Gg: AR+sD12LWS5KPh1Y9ion7Rb0uoX9vnr8uAFPJZxZvyqKcOFkhViDQW9SueOhnnRryGG
	Cq/g7B3asN+j1t41L57ixywPfYo9S3zQ3atEBJ9BwL3X1dAa9BSa2aXoVxhIQvsLyAG3NjMhBZ2
	qOH/mPGT3nyYujYKtnTtQV+OMZidtwXakLiuri9UUacNbrbRemp8nbqVssSHZVpoggCFhHhHdOd
	up0eRCCH6aYno54c6EEm09MvY8eUbIP3+03IogEVz0o6mNgAmNYm7Vmyiz9ghgWKIKGyZc49qOX
	ByGd5z94VZTYpFUNxSVpwYp5Gmexq/r9WR8muEuP2bFH14HF7HNkgIOJkC7vXDhHUHookvcXrST
	VU/N2i3J6YZzJvH7tz/j5snAeVibWsDV7
X-Received: by 2002:a05:6820:308d:b0:6b1:681f:81a1 with SMTP id 006d021491bc7-6b1681f9275mr1606905eaf.24.1787329178073;
        Fri, 21 Aug 2026 09:19:38 -0700 (PDT)
X-Received: by 2002:a05:6820:308d:b0:6b1:681f:81a1 with SMTP id 006d021491bc7-6b1681f9275mr1606821eaf.24.1787329177641;
        Fri, 21 Aug 2026 09:19:37 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.20.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4632a6c360asm4738369fac.5.2026.08.21.09.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:19:37 -0700 (PDT)
Message-ID: <c82359a1-6b64-468d-9823-a196f291df0c@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:49:26 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
 <b88c7884-f86b-460d-9880-8dbc23798b02@oss.qualcomm.com>
 <4e7a398b-e75c-4dca-8380-440ca7cb22c6@oss.qualcomm.com>
 <f7386ff7-9700-4a19-bde4-df4460ec6963@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <f7386ff7-9700-4a19-bde4-df4460ec6963@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfX4wzCkqluNM3x
 eeC4kty0r8nOaP0B5VgVsFBVVBR4KgztcNwn0e5DAV7+6WnTM3LKq4IyG869nBB5GKoF+X+bwzk
 NA2hBRI6DiQYHN1Avk3MIHwMEoJPgH++9qGxfaeAkcuoGTaLgn/ce94LY/OZbPBvCre/vwXqdpZ
 gs2T4vSElhQrsx1dQQuL6jHfWeXOg7GYIHRkWOFruDVsVzp+3ONkuCHqoTdm/jFoSohHVpuHYl0
 9kCPdDY5p0qbUQqwl9O5q+11brx/8sdqsSYvkTNpQymlQR+pFu/nFeWHT7XFr6cMjKNYnzE1Syz
 S6IBxztennngWsCfgXJri08m05Zf73xAzM73C6lDaYr/RC4rqEDRRd/C20Cdv8mwU4hEKDgBpAV
 uiPae7bU35HBynZzZ7Hbjb1Xc4w6TeBIDLLhl/2hYAc1ckooZBHYxG5FiVj5jVYqs9vZKUCxQMm
 KU+h1s5W/34JLueJBJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfXyvVkOmSjj4ql
 4JdN3aU1r8awXxLuabLTP5kySgpkEoqTFZp+D0VB8DNijeP9aIbRpDQiDJg2UToJZRRC6uIyHS1
 8VZiAlbADMAa4EhsJMZi4kvOmYUVbZw=
X-Proofpoint-ORIG-GUID: PYTN26lagMiu9fm7y0faqXRFlzUslT1t
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=6a887a9a cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=+KmVXPE0btiop/5qwQKk0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=A1cAmru4g_ti7Hb5znAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: PYTN26lagMiu9fm7y0faqXRFlzUslT1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210127


On 8/17/2026 8:55 PM, Konrad Dybcio wrote:
> On 8/17/26 3:42 PM, Hardeep Sharma wrote:
>> On 8/17/2026 6:54 PM, Konrad Dybcio wrote:
>>> On 8/14/26 9:31 AM, Hardeep Sharma wrote:
>>>> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
>>>> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
>>>> interface through the common pinctrl-msm driver.
>>>>
>>>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>> +    [65] = PINGROUP(65, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>>>> +    [66] = PINGROUP(66, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>>> Function3 can't be selected because of repeating names
>>>
>>> In qdss_cti_trig1_groups, you have qdss_cti_trig1 specified twice.
>>> Perhaps there was a longer name that got truncated?
>>>
>>> Konrad
>> Thanks Konrad for review.
>>
>> It's a real qdss_cti_trig1 line - the in/out
>> mirror partner of funcsel 2:
>>
>>     GPIO65: fsel2 = qdss_cti_trig1_in_mirb, fsel3 = qdss_cti_trig1_out_mire
>>     GPIO66: fsel2 = qdss_cti_trig1_out_mirb, fsel3 = qdss_cti_trig1_in_mire
>>
>> Both map to the same name because the driver uses one coarse
>> "qdss_cti_trig1" for the in/out mirror variants.
> But these are physically separate functions, even if the mirror feature
> makes them seemingly one and the same
>
>> Listing the function on both funcsels is the normal sdx convention for
>> these mirror pairs - the in-tree drivers do it, including the same pins
>> on sdx65:
>>
>>     - sdx55 [16][17][22][23][54][55][94][95] → in pinctrl-sdx55.c, pins
>> 16, 17, 22, 23, 54, 55, 94, 95 each repeat qdss_cti at two funcsels.
>>     - sdx65 [65]/[66] → in pinctrl-sdx65.c, pins 65 and 66 do it —
>>     - sdx75 [16][52][53][56][57][78][79] → in pinctrl-sdx75.c, those pins
>> do it.
>>
>> Only funcsel 2
>> is selectable from DT (first-match), which is expected and matches those
>> drivers.
> As you described it, you found a bug (FSEL3 is not selectable), please
> fix it in all the instances you've mentioned.
>
> Konrad

Thanks for review.

Corrected in v3 : 
https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/

Best Wishes

Hardeep Sharma

