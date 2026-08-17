Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2985C4457A3
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 15:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786980351; cv=none; b=FC+wL+TvHlQqhcP0GRzScQ9bSYypyaMWD9GiMpYJyPbJF8fxOHWo8M6qH4Gy/q+aTKJ0M5jBKhT4gtRtrDgsbS0fDmXxku15xy7y1J8kKK7YynWgaMaRBJn4nS8Up5RMqcgsq2U24NzvNNrpJYTRYAi1gwOvfaLcYlyTkwgcz0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786980351; c=relaxed/simple;
	bh=XBzFWhcCyZU2yJ+/3TDI4fZANSR2pFhRn+TRORSTUgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=suHE38Z1B/WsyUhFJ5Jl6Xszledaq2Y3XeTa14Nsix2heeC8wymxRcINy7IAb09alO80uoJhgk5abMlfiFC0yQazb+XGBeslxEx/P7ElksO2NWZ0HyWoVUgfJb3pjz75WIJs4WLp1FTeQsl2GELNq40eOZ1SGvUSzLeAYc87dco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9gFdM06; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HivnAMAf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9gFdM06";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HivnAMAf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6IvI2395065
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 15:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gS0QNQ0WhZ8xM/8ZNpfDM+xJH1jiqfGWfnkppPoW6TY=; b=Q9gFdM06eRE5sR+F
	MBzVMIv2b0Wkf89NeQBw3SmTfXt9vyrpPReD75/C3+pKgN8bRPMczR2fTngt6sdb
	dIt7jIhgQEYYsst+WcRWRdPeyJNiLOujTGpb6fP+K2JXP3iCe6tQLJwojKSHp0D8
	/M9dXkG09McJM521PbGuy9wuaowRyYUDT8IUT6Qt/yfK5aBtC+CS4PTPv01VrVyJ
	g9ZTRmiM8VVThU8U8qrGxS9jRR1kBohqdOqIlaohDjKAU8Wky3Brp5j5pDHi7Chr
	EoXqcnYUK8XRa6DJb0PUrKCnPf/Al38p+h1Uou2ynOUFwJmjwNNW7c8nyawo+PjP
	XLCxRQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3txyahyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 15:25:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7530aaa7212so97463137.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786980347; x=1787585147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gS0QNQ0WhZ8xM/8ZNpfDM+xJH1jiqfGWfnkppPoW6TY=;
        b=HivnAMAf02dMsxbfhbmhhVVFRbuw8CE4WPk6tfeTwsVdRQvalVCMQS9lpU9XvRUKZ7
         4pae/UJW+JC/zPoqJ1aFN04yXTv1HcRRb8rBLvQOwjq3kLpXQCBoeD7cfpboV5WgoREr
         S808WDzb0lWTz1uCUwDDbN8gO0RchmkPRfR98ahKXgEDPMLr/pFwuhJJngsl7dYKvemC
         1fGRkREiKE9wRLQXcR/mcQxR0jbBYn3fqqvehZ3DPI0Ul99wZOIGeYt5YphbU6COMKTt
         Dn2x2i3zTa2AeLWj/qz3PoPyQPZAgpV96NHYfXJwMJzKytcnbhJOF9dLTnk4FWBOL3K9
         wnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786980347; x=1787585147;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gS0QNQ0WhZ8xM/8ZNpfDM+xJH1jiqfGWfnkppPoW6TY=;
        b=CROh6/r9x3kwd6dTeXWnaHsIpGF5mOi128UopSfS5tPA9rBi0XrldNQk8qY44SDjX9
         lDRuytBT8v7/QeLuXd3gFYgECfxn5I7yKk7dECCCxwM2yiWruOEfrO/moFuDxr+z2Nmf
         1hK8D8txtnVyQ58DY1zvK/8w/Z4KJK0SaM6T5WQReDhBH3Qo/LOEfUSIxF3PGjD2hMBA
         nbZwAl8CE8igNkWK2fAKwnLQwgmbyAHXrjzUkEoGLr1AZjoomwN+MgUXr606G3lQIShL
         jq3CTZtImhAo3qqooMpmqrjv+p8BkGESlftW3rnn1j8LX56milrwxzDeU6Ncx7zn96Pj
         OL8g==
X-Forwarded-Encrypted: i=1; AHgh+Rpx3mRmV3vDRIR37H9J3lyMAv6HYDkWgzMx6BbCD7b/uFE32M1wUKBV7kW+5+vK0dl+IR9fSSzKJQCL@vger.kernel.org
X-Gm-Message-State: AOJu0YxYW6BrSz7VKIWBFnTzrIktIPCIoJS8m9LfogzOliIE50HY36pM
	58nB7M0elH/I6oYshu3yU1oUqZQqmHn/z0ug5CLhk4NoV6PlnBp6gK7hjg96TnsIpA0itsyoEJ4
	1FMNd+aRKZCjobfnBP7hx75m1g4L5eqFp2LwtD7cxuR3v7ChTntsSyUQyJOEP1H1W
X-Gm-Gg: AR+sD13kg8/3vcbWTvoRt48irMKpPwkidr37wJG80fYGdom78l3ocrO2ZuPdEHSKT+/
	+QqngfcEpwIoW5bpJa13L5XRJVfuDApXSicjPTXzPdJIC8NYNgEHElcrl6qYJcC+yXCaA+7nS2T
	tF4DovgTzaCRGzfiN1y6VsAV++ZcNXjYNW63LmynG6EuXAZuEfA8WEZCdo08psXb6o8rAQ9tjtG
	iFk2Uws8C85cAGJK31l+GQM8G4oVjMAeQ2GzY6qejW5nsnU5VrzXdpZ+VTpH7OOTR3NY/6sfref
	vcwTvXJSRrJA7A189ZGu2j4/tnlJP0vJY83A3SeouO8TpoR37cyY/kf7qIGxHqohl4ll9Afyyu+
	vg4QLB5gSVVrTAKCkkHzQv2T2
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr1631484137.2.1786980347238;
        Mon, 17 Aug 2026 08:25:47 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr1631463137.2.1786980346780;
        Mon, 17 Aug 2026 08:25:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217ff7e1a2sm75279766b.14.2026.08.17.08.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 08:25:45 -0700 (PDT)
Message-ID: <f7386ff7-9700-4a19-bde4-df4460ec6963@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 17:25:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4e7a398b-e75c-4dca-8380-440ca7cb22c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExOCBTYWx0ZWRfX2iN66eC/Qcpk
 fzRuRQweG2gHPg3VkODpNOLFmWJ62NXb4IdpZq11K0AaAoa5RSBdUsE50oIfVTsP7oHDJY/XEAE
 x255uy7a5+VntKeOh0ChJp4JD7nrDgc=
X-Authority-Analysis: v=2.4 cv=auGCzyZV c=1 sm=1 tr=0 ts=6a8327fc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2hgIxXGGQldiWaMEjnoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExOCBTYWx0ZWRfXxTqEOR4vgeeN
 swgODOHTYLrrrHtMBGVdLQrabrgGlgDAvgxJSh7gJVnjNKKzYgj6xqsJTXxcYYUR5xKxwrTxYtP
 Pdm4d1mRTK7g1KMaZrwqUkJj/BJYXwERVdABFiiyOxyNi/nipx8yNEwIaNvC9/xp5NA/fRRyNIm
 COhiVmsXAOjNUQox086Oi5m21b5olvHkS0sEA4cfcBx4T8ReGJbFdE4gk3PL196ec0Shv77p7pQ
 R7kZqzWXNajSgdw1IbUSshWpcvUot0tuhNeq4aX4dYWkRe6y5+E5IgJmCsfk89JJHRWdBb4OsE6
 RA2+Jy/h2GqSYMJIf/YuBwkDvBSVMzZ+okz4+GMnFk7m0SRPVSClyg5hGfVDp1UHfaMCpMgfai/
 GvzOjsUCj+OKgRQ45Lmd26IKzNZrxKhb0kORAOdsBHdgvhyUvICO/Yn4Sj5ozX/jPbmGYW6rGQM
 5gtkq7uJ4FT8CZEhEBQ==
X-Proofpoint-GUID: ka5yrMjpY7z0JgBBdOnObzwSg5F3pUoJ
X-Proofpoint-ORIG-GUID: ka5yrMjpY7z0JgBBdOnObzwSg5F3pUoJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170118

On 8/17/26 3:42 PM, Hardeep Sharma wrote:
> 
> On 8/17/2026 6:54 PM, Konrad Dybcio wrote:
>> On 8/14/26 9:31 AM, Hardeep Sharma wrote:
>>> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
>>> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
>>> interface through the common pinctrl-msm driver.
>>>
>>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +    [65] = PINGROUP(65, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>>> +    [66] = PINGROUP(66, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>> Function3 can't be selected because of repeating names
>>
>> In qdss_cti_trig1_groups, you have qdss_cti_trig1 specified twice.
>> Perhaps there was a longer name that got truncated?
>>
>> Konrad
> 
> Thanks Konrad for review.
> 
> It's a real qdss_cti_trig1 line - the in/out
> mirror partner of funcsel 2:
> 
>    GPIO65: fsel2 = qdss_cti_trig1_in_mirb, fsel3 = qdss_cti_trig1_out_mire
>    GPIO66: fsel2 = qdss_cti_trig1_out_mirb, fsel3 = qdss_cti_trig1_in_mire
> 
> Both map to the same name because the driver uses one coarse
> "qdss_cti_trig1" for the in/out mirror variants.

But these are physically separate functions, even if the mirror feature
makes them seemingly one and the same

> Listing the function on both funcsels is the normal sdx convention for
> these mirror pairs - the in-tree drivers do it, including the same pins
> on sdx65:
> 
>    - sdx55 [16][17][22][23][54][55][94][95] → in pinctrl-sdx55.c, pins
> 16, 17, 22, 23, 54, 55, 94, 95 each repeat qdss_cti at two funcsels.
>    - sdx65 [65]/[66] → in pinctrl-sdx65.c, pins 65 and 66 do it —
>    - sdx75 [16][52][53][56][57][78][79] → in pinctrl-sdx75.c, those pins
> do it.
> 
> Only funcsel 2
> is selectable from DT (first-match), which is expected and matches those
> drivers.

As you described it, you found a bug (FSEL3 is not selectable), please
fix it in all the instances you've mentioned.

Konrad
