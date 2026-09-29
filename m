Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCFA3A4523
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 06:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664670; cv=none; b=gIknIMSvQAO8iAW8sl668AYRgOyYWKaLT/lRSvncWwO0HWfOYi7OHACY2LcPNvZ8YANGpTBc00CJ5X/Ue6Ns/2ojvJaOO5rBOV256rH/2M6ROQBvWbkuWiQHDAiZQ6JViouBYkHBDsqzglBcHK7QoiQi5kF3zR6VjAwbvu1ivH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664670; c=relaxed/simple;
	bh=xBcsERAGMD9eGee+SFf8E3U4t25wa6AVynACUUStgmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+wKZgaSlqIYdvBAZyqUsreWGE91tCaAmO/qgEZw+10X0R52zdAcI9G98mh+K7hVOlkYJlDoOdpJ/s/kHrOz/07W7K7Wsj1wqdfE0TCW1Okp06OriMN2Ii1pWLEXYoWyiuKgwgtTtAs6Kw3O/LYP+9y4irJs+V0kVVGDn3NtlC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nn1oTJqZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atOMOI3L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nn1oTJqZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="atOMOI3L"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T475YR3390855
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 06:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ETLrKADipHnQ0SvOXNNqJhUBO4FGwFDlpJ1cHVM8gQ=; b=Nn1oTJqZKgpL34gB
	PYd6lvc9jUtOrzbjx11pTeoFrNmIxW0en6/g71KyXJ39sqFDHbGo+3m67xNCmTpR
	2mgvv2L2qO/RtMmJ1afjOzAOjbv+lTkgTSS38pdoSBL3rvCe/ZHwegTryIPfDtZH
	SCZ9v9e/+7uRFb55nJlWPu+65DCT8HKA61N4fHPjCWg2biLYIIaNzWCY+sX530EH
	KYg+SFS+785CLIpvlQBejGqM9Li5S6vI2b76hHK9tPk8eU/siHnaW3vMKyQm4Wq0
	ndPKEVAhMCVPJw7dUNvyPVjVPBKiKY7/OfcDss5JTGsfnIhKHo/phICgg6f+R6kk
	JPbsUA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkhd08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 06:51:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88620af3beeso2701b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 23:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790664666; x=1791269466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ETLrKADipHnQ0SvOXNNqJhUBO4FGwFDlpJ1cHVM8gQ=;
        b=atOMOI3LzLpcYZDBF1czx7FzQ14ZzzWCbOUmsuquyWyjXWzqYRyuS/dsjAV/OKN49H
         nb4UbPHuz1qteIL0m6OJPc/f9TrrXSC7dyiwxsxTsD4VJgP++6MG3Pdy2LeQxwwTNUzW
         MhMH5jZIMT1csecNWyypi5JtbFmdvgklfU+BEQ+HQybPLrLEBfMbpmpfP4NQD8XOEnM4
         FaPx+mWd8lCkvOeGXUrzbz3jG8tf/lVwVs9ze85sSfMDJAxn1rpUQlRjsO3bHuUCWTLb
         YrjiHpMj+9xCuVaojgieWvGEVydTD4deFqPT/TnF+AFIDF1adV4UQpxXcsHMUvvXs0uK
         g3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664666; x=1791269466;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ETLrKADipHnQ0SvOXNNqJhUBO4FGwFDlpJ1cHVM8gQ=;
        b=bicMsk9EC7/+hNvQNGETekF10m4n/ikHUgw9OfzSBgcBSvhomBX4o6JVKJqhXcAcUP
         Ova17mFKHTa8qVL0zBc+GPHNpG2l8/W5m7s587CohAEVg4Uw/CpFz1uJplwWd7i4hvd0
         ElJtozLdaI6dGi+Ig6rnLKc4yME/MumndRT7JC3FOAn8urNBwEEaTsKzGr3CsO2fyBV0
         BKY6KRKJROOatnvCkgWK7X51N250wVBrw4ZS8QdL+bLSsKar2eWPrZogsPaYmCjeiOeB
         JXIGLcgYmfaaZW50IO4XPFW69Q+/r1/oZENAtx/TRqmiciutcLgUOw+nMMbt0+SgRQQ8
         43zw==
X-Forwarded-Encrypted: i=1; AKwUvBwyTbafOgxtgZTNdMJl+dvCiOxmHs7iRd/qxCG7yrPTxPRI49HuMXNLq9dATCqFg/M7XQR4cnjaY1eg@vger.kernel.org
X-Gm-Message-State: AFuF++nkhtxROJNgF/dL1oVJ3mV7h1vb8JLtgA+isPQCJitnSQSxios9
	x68dc3LgJfCS+PZpLXfEDbxcG87dUB+aJjAG5TDAqQ1pAJ0IIavLsVLaaLEiZwenJ6mWAUzrmwd
	ugt2ya8sIcAaNSGWVBfU5oSCzngG9G8y0ekDbCoKVGxMl4sP2RaijpFgHBRRh1Unm
X-Gm-Gg: AYBFou2t5bTz3/tkvuZZCU7uPFNWlNf+pbw0z2x40uGyuRlhAFhm3+g+0MIHYPPjr0M
	SzsdxVQl3RHFJr612432tOw14xC75QSpKvp1QpbD4MJk0gUcpCV13bKhPEr1MakliIXWt/qPyB9
	i83M+qG6MO2FrqXn1t+gjwlYw5BcQEmhB+rjfItDP2yZ7QD9B/qznkknIzb7+jhGl/49eM1FZYI
	ujlH0d0cUKt2/145snx5jbYjvSQe/58p25g42RLSbeYv9K7hBr9xc1vRyatW6Adu2UEF95OimmE
	pheWreKMNmvLv7tPBkPILt+AUJu7WCBD/bGg6kmBsG1B4/Vx3jn1SoQxi0S7DDArPZ/XEOI3IsL
	mNIRLhELi4pCdBkTx0rMqqscSdLRPvUZhkwmqt1hwMAue/3KYgsMLwQqNBZHMBmF8BUqaShPZa5
	LToOOWOLZuqn8SqoqZHs7G
X-Received: by 2002:a05:6a00:2d25:b0:881:236b:748a with SMTP id d2e1a72fcca58-8855fb8b546mr1025635b3a.16.1790664666096;
        Mon, 28 Sep 2026 23:51:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d25:b0:881:236b:748a with SMTP id d2e1a72fcca58-8855fb8b546mr1025611b3a.16.1790664665618;
        Mon, 28 Sep 2026 23:51:05 -0700 (PDT)
Received: from [10.79.116.189] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e28d7d23sm258534b3a.56.2026.09.28.23.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:51:05 -0700 (PDT)
Message-ID: <186fbca3-3676-492f-9c8e-fc7a75d5ead4@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:20:56 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
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
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
 <1a167d6f-2dce-4d06-a416-9fd1e25c69a8@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <1a167d6f-2dce-4d06-a416-9fd1e25c69a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX/+L7v1xbjtFo
 oJGhHnzJypJAXzvSHO85/AKU/AO5QSh1Mjk+hU/GX7o/E10nWqAbN5bkdaMk9J/J3/ERP+/BW7H
 0xDsfHY9sYuohtQ7/TRRTmTL3BvMv7RTbs4I2fBgoUqP0kPrVriZgJxWBEZRwWzLXAtlFDDeF7V
 ZIPWY8HpYzAknVFxjwI78iGn2Zz5UwGnQo+lIQ3Q66SxHRz/rLj+pQ91qCbOvyx3FdJdaa8p1If
 QbuEyQyD8d2ym/0x+YxYtSwRxp+MaoLWueDOGevDarkG+AqSSMFX6CgA0lrQadwwkoChYLujYsZ
 X9vNZcR7v7/5FaS2FThV68xcS/QYXnjO9W8kyJEvwDM8XIFKtr/l6Px0zJOdSHN7kvxJPUKoXMr
 znhjTXkTkEokkhHvV20RquTKqQSTTgIE1SYEFo+OpAU2uKWgXBFnhp6SOmSd0NQ3L97aC/n1SvB
 AsB/rmONw+wtHryd7/w==
X-Proofpoint-GUID: ZMC9BbCDu0F3mQ0RrlKjvUl6yfxWXhCw
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb5fdb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PaPtSKYIirbzHVDMbN0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: ZMC9BbCDu0F3mQ0RrlKjvUl6yfxWXhCw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfXwn4VfkRH87I1
 0tTjQ0ZyFIEkmq/r0sQHZbCT+QeVMvHof2wXz+DDxYZZ/WIRqRDGfG5QAMWkfwhSVRVAwCMrgXw
 jXAIN8n+YD19Es92z1ot1+JhbDY/9CM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290027


On 9/1/2026 9:26 PM, Konrad Dybcio wrote:
> On 8/27/26 7:51 PM, Hardeep Sharma wrote:
>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>>
>> Peripherals included in this initial set:
>>    - Single Cortex-A7 CPU with PSCI idle states
>>    - RPMh RSC with clock controller, power domains, and BCM voter
>>    - GCC (Global Clock Controller)
>>    - TLMM pin controller (110 GPIOs)
>>    - Interconnect (aggre-noc, cnoc-main)
>>    - GENI UART console (QUP SE3)
>>    - SMEM, hardware spinlocks (TCSR mutex)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
> [...]
>
>> +		pdc: interrupt-controller@b220000 {
>> +			compatible = "qcom,kuno-pdc", "qcom,pdc";
>> +			reg = <0x0b220000 0x10000>;
>> +			qcom,pdc-ranges = <1 148 6>,
>> +					  <9 156 2>,
>> +					  <17 164 7>;
> GPT reports you're missing a whole lot of entries here and that will
> lead to the wakeup GPIOs silently failing.
>
> An old local script suggests this map is correct instead, but please
> check yourself:
>
> <1 148 6>,
> <9 156 2>,
> <17 164 7>,
> <26 173 1>,
> <29 176 1>,
> <40 187 1>,
> <46 193 6>,
> <52 266 32>,
> <84 249 1>,
> <85 256 1>,
> <86 315 4>,
> <90 43 1>,
> <91 45 1>,
> <92 154 2>,
> <94 158 6>,
> <100 171 2>,
> <102 174 1>,
> <103 23 7>,
> <110 147 1>,
> <111 31 4>,
> <115 175 1>,
> <116 177 10>,
> <126 188 5>;
>
> Konrad

Thanks Konrad for review.

fixed in v6 : 
https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/

