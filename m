Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5C63E764C
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974191; cv=none; b=IIhYV29hxvjXykqeNE7mIXuRbPY9CjVj6lPn8dM9ZD4XN5OUg9dABYfcEdxfocLlvRJjr4xABpuAS2b946yyk/1WbQ+O2gYQGuAtv2zjniKjI1mqJaRIVNLiVMD5KduI5st6M/p9SI4VW5wzmwMSqp0AKwOS3FDykKo8lQhFMB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974191; c=relaxed/simple;
	bh=qqLvjb2Elb3FkUURTZ8DaEFjPYAiQE9nj5Xz5BxcjoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LbLEw7FxohSOi3agOiumGyi6qPJPu6doSmLkfPDaSjIDkWnRA3BKtaB5Mg3JrvFuaBv0xa2KbTuG7SdzCr81mgEYK0SdrBh/zDdP9g/aSKsnLhvcugihXv3Dgej08ERVGUBsORuJhdYO8Enaadgd/kpePEVf24owZiGShZvPm+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXp1MmBt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gTO1yiyh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXp1MmBt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTO1yiyh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6Cpw1193709
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 13:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FUi1Ed4tbVFVG10HnIR5+E8xIvkprA3oG5hrzoj+z/M=; b=aXp1MmBtty1BQMei
	PbRVOkhD3g8tb2bRrp9KrkuIaxeEg2qxHuZA66DnRlM8cyrEdyJHVsyVfdXbLk4l
	WE9kTc53n5tuUZkEuqie25QBeLkxIPPpeCl3aVrrEKYeA+X2rSbWFELSci5VH/ce
	14sKa565PKv3DUN1EsWC881P+fHM6nFXvGxcNm/Od/sHksRHOX6T7jZwVaqC0kfe
	j63F0xvREL/e6u/PCxnY6EnNvWkF+Wpl3JW6/72r2f0tktHg2PBt8c0tMpFdNydA
	Efq4tTtNfOUVG7E7iPXihypiwKKqZjg/Gxdg5rz501LpRNDJPHEAceugz2P1u+F0
	8xJrKw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke1h8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 13:43:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f39a46efd9so43733066d6.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 06:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786974187; x=1787578987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUi1Ed4tbVFVG10HnIR5+E8xIvkprA3oG5hrzoj+z/M=;
        b=gTO1yiyhQitj4WdQMbgAjWCAtmyZKfwlscEbGAMVVddT3upXi7N1nE89Bsd6pUNzw7
         bsSkx5/Dd6xp6FGzOg2IvEpD1JqsS1Z/lS4U6mZgatuMvYR/GSPyQQDla+A/ZX+qVaX9
         j8dUnnKhbyi3WreNKPFOXw9WCAeFYTd8ua3IeX/mGJT4ZlZxifJXZfhlteVcLIprDA8V
         65DdIlheMf9MChuFYiLENaroAf+r0P9wZiMUBAFVUwLBqmheGCW/s6H6gL7zCOXQXe96
         sRjU9qf0UbX2L5rX7DP0dM0aq8pQ9WRI0pRA5bXUW6AurGIaTLumXa/8W75+knoD8FKg
         fyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974187; x=1787578987;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FUi1Ed4tbVFVG10HnIR5+E8xIvkprA3oG5hrzoj+z/M=;
        b=VyKlN28CFReInRNa+B9eH3ZYwci/oGt77mkTbkMgaCZSR1IuBh9gkrXQU8CweR4t8A
         8GG2sU67wB5+dQzp9oButZOzNLJblx5YNIMhImTxx7H3EF7Vanr9fxsBwE4k3BsKImM7
         /7X2VWJbjxsUo9WrbAv5IcwdVcBpvP3z/VHYSW8E2nQQCzfc9PEfqDkcO+FEqPltZ2ru
         K5P5AfGg7Zq/QUWmMu5ET6QDdOU8uklrAB92g38LU5oTD812avulZf2vyj7gkpbdbRaK
         aTQNWiPRRVJ7gYiKwTJShHDAcCBDApoDk8OreDaNVpxuvS+kcCP79ubmJW0HdGSreNvj
         w43A==
X-Forwarded-Encrypted: i=1; AHgh+Rp7Qor3zvhaTp5zXLecpxhfDgqnMNUWxclxtuIy7vFpyujNXsbSxI4Av5qTVvXZq0x0NygetiEiuSM1@vger.kernel.org
X-Gm-Message-State: AOJu0YwZlGs6MFjdcUQWCdFClNAsgZsUnpWqlkohkYIRHpESmFThD7o0
	PUIQ5Op68LzAN5SEvOsUm/UUQsrvt4+93ctqTpn8RwY9tdEpUM+wK6+JurT9ZERwc1ZW8GSwAHn
	dFzsvNXGGa7m9eZWGKiWOhDzXBTu2R74fR3Oyfa9omYmruca48F0NQT5NadSkvVt2
X-Gm-Gg: AR+sD10kXkz+l1Kl+nv7qtNgUfbi8V5g/zUHQAJ6EqMEG9Jn+kHSwmaYbVCp1VZbc0A
	++XhM6jojqaGtIg2YoBlOtV0+dU0BNZsPa7RrYcv9QkvMla3tw13BIey5Ej0W3t54qV49SaJEUp
	8+/1J7GwVbnJftwQzcZjVN1sXpdoHkgvUNW8d+QbCauH+/w4Sc/QNLSs+EprgZ01OYs0dHoTYol
	WSlrTL3oFHyW6T8WfjvrJaP/g56D/I1aP/XHSo4IPtlu4zDkmeBRxqNJcuy+5iUL7rVkJUUPrQ9
	UijNl0Zk3Rqm7nPjY1+wKRZfPH3Ns43DITnFe2E2I34cOl/wUm1hkdIIEn+fFj2fDYBpa2VHbXL
	3ml+ITYNRBFYaG6EJY5qitExzwuOd5OlU
X-Received: by 2002:a05:6214:da5:b0:908:488b:14f with SMTP id 6a1803df08f44-90a809cfdb6mr331432986d6.5.1786974187219;
        Mon, 17 Aug 2026 06:43:07 -0700 (PDT)
X-Received: by 2002:a05:6214:da5:b0:908:488b:14f with SMTP id 6a1803df08f44-90a809cfdb6mr331432306d6.5.1786974186747;
        Mon, 17 Aug 2026 06:43:06 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.16.103])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c45976942sm9108656d6.42.2026.08.17.06.42.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:43:06 -0700 (PDT)
Message-ID: <4e7a398b-e75c-4dca-8380-440ca7cb22c6@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 19:12:55 +0530
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
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <b88c7884-f86b-460d-9880-8dbc23798b02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwNSBTYWx0ZWRfX80M4BY8fTt6Y
 zr+tR2pwJ3GUqUD0IiGeDWwHtgLqgIwMip5mUQ0GMY27SunIh5nH2VOSAZlPwYlyu0+UAVmSvH7
 DXJVBcvxU79HoWAgksnEcXGyahGEj+6YLTWLiNn2cZeVeYtoWlwA7et0cOcytt0EIBvbVGQ551f
 N7EZ3DH4wKIWpqAWHyiyHm0dpRjkg9du0C0noW2hbdwbGHvkBIR8SFwBZCAwVcwsq0IOxtNAxpX
 A48hRWvi6jeAki3ewWpCoWuo2AWx52Sts7KHGmWkm+TQujX+RmQzw8T3+2ODSmuzOTFYQsNuln1
 qykpG9mlRNCJJOmtxMoMA4uEXiL9aFq38QIUoEjPOck5CMlJ1Vzl+Wz4MJXa46yBz7mcusQ15+G
 QYNOfh7j00TdjUyg8e8AvqeyoGcMvc8muGgd3aNJybifU4EhLws5vhwzelSwQZDmxLIIRz3Pm60
 lu40iiKBy86h284M2LQ==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a830feb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=deEPgmDcWg2uv8mOPSE3jA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xskrFx3CC3nc2tfbzagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 4REZ91R7cvV7Enlg8Z1k_mkmAm-vD7jl
X-Proofpoint-GUID: 4REZ91R7cvV7Enlg8Z1k_mkmAm-vD7jl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwNSBTYWx0ZWRfX2gQOGF4dj/am
 JVYCQxVTW0fCXtW+vgw+l8pql31N9EKL5EiilQ5Uxl+7XPyfZ9lcmeJpGhkIywFbgzKKv5s6WMi
 VtMowq5JIwiQG+dz2YPcPMXdf4QYgtg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170105


On 8/17/2026 6:54 PM, Konrad Dybcio wrote:
> On 8/14/26 9:31 AM, Hardeep Sharma wrote:
>> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
>> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
>> interface through the common pinctrl-msm driver.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
> [...]
>
>> +	[65] = PINGROUP(65, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>> +	[66] = PINGROUP(66, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
> Function3 can't be selected because of repeating names
>
> In qdss_cti_trig1_groups, you have qdss_cti_trig1 specified twice.
> Perhaps there was a longer name that got truncated?
>
> Konrad

Thanks Konrad for review.

It's a real qdss_cti_trig1 line - the in/out
mirror partner of funcsel 2:

    GPIO65: fsel2 = qdss_cti_trig1_in_mirb, fsel3 = qdss_cti_trig1_out_mire
    GPIO66: fsel2 = qdss_cti_trig1_out_mirb, fsel3 = qdss_cti_trig1_in_mire

Both map to the same name because the driver uses one coarse
"qdss_cti_trig1" for the in/out mirror variants.

Listing the function on both funcsels is the normal sdx convention for
these mirror pairs - the in-tree drivers do it, including the same pins
on sdx65:

    - sdx55 [16][17][22][23][54][55][94][95] → in pinctrl-sdx55.c, pins
16, 17, 22, 23, 54, 55, 94, 95 each repeat qdss_cti at two funcsels.
    - sdx65 [65]/[66] → in pinctrl-sdx65.c, pins 65 and 66 do it —
    - sdx75 [16][52][53][56][57][78][79] → in pinctrl-sdx75.c, those pins
do it.

Only funcsel 2
is selectable from DT (first-match), which is expected and matches those
drivers.

Best Wishes

Hardeep Sharma

