Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7871236D51D
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849262; cv=none; b=iKyd0kfcJxPaarNReb7me2BZaoo6wzM7NjpwPH1hWiZi+6S4W20sNA2lD5O+6Ppj9DASblCiakwj6KJbHdL4s/i+1JqIFAZIhny8+k7a1G+a0X/yi4mgarK2sXRzi8Jk29Hk5gPO/px+TJAxv07524JmUwZtvfaRIgpq5tttD0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849262; c=relaxed/simple;
	bh=EpjAEUSVSeuXg5aaJZz4qmdxvfMgj7QAYON+CspyZ7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKVL00dQRqZIGP3vkos8By9NGLxvWkmVyZboiBgewKttvked0kY3IAtSsa7qKkYD/2vMjB21UqWTXoH1IGfADLoKJw1f1YRSrs811XNSEzC4pDIo/LrqGCpe64binzOnC0TPwWWhxDrUoHXhHhO65KrNJIPpEQ2WJUUKltRfu3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzS1TQTX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/K240HO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzS1TQTX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/K240HO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbfQY3829411
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g94yz5fedosPU2VDbIoL1jhvFxXuRKxNYR8GyxIQEdU=; b=YzS1TQTXMjf5cW4U
	eEqDAGdglW4D3gG22mOeeDoKfj4kkOo+ZJNWp8rbdHRB5XdGsOHbadjiShL5uYKL
	m74+ahf5aH5dt+q7t/WUiLqNNQiijggXmwBTVpBH+X3zS2Lz8z64tSUhvUv8lXko
	FKItQKJgjJFP8e3dsuanck7evo5biLlFOFGdVhWFzgtif+EUYlB6stAN7wrNSspi
	Efnly8LzDl84/p1blOUCQfU2aYjr9rfNDGoakhisWbTFwhfmGKfz6NFxfHNaOWrT
	Q3f8UMwV3FKaHRTLZGxikov9/luY6JwA5Ge0NgeOyo15r9/wudG8nFSoUCXBASST
	u8u/8Q==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7sabv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:47:40 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab4ca7ce3fso260270b6e.0
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 09:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787849260; x=1788454060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g94yz5fedosPU2VDbIoL1jhvFxXuRKxNYR8GyxIQEdU=;
        b=h/K240HO5eCg2CrlmyAAZOfxaqGC0jsBPiuZejT9fZH32wEWaVUXzgUOgGt93d5yx8
         BIDIOUBMTAmFWVWyX0touZl5pseplXstzKtihq7vjibnRA6JmxQOjhCk1Q55BfA8M4Mn
         LiwJscl5lRwADMKaHIt7z1EJzeNNjDaKYtTAHzncnJJUb6lFphua11j/PmdLXjLasf0L
         yhGVKEvJUPn9aXt/RWmfM97eX+Ko4/D8MvsLf4XlyIEkagJtzt/7znIqQ5NAWNZehPiA
         Z+fv9Hnm4Bdis10HUpIn/qoO0bEFoDjfFsZboa9A8ICQjLpWEOggA3iiDmkf7h6ItsUp
         +X8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849260; x=1788454060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g94yz5fedosPU2VDbIoL1jhvFxXuRKxNYR8GyxIQEdU=;
        b=HY1lNBna3DpTXDuvU6PFLUX8BW2in7N9U1X9Sio9+gGK6WiesHuJVSXZvpg8wNT13F
         SA8HudWaVzskOu0lekAimzV+/sPVbsDRKU6/a9iCx3Ri/IgEjE6OEy1p+9mfXbhKHoU6
         q+sYflfGnwWEUcG+TjoAqeddCHOoBA5NYyQrF9v5AmHBngUibaNpRETLT08kpH8AcwXQ
         Wh5+QsHwOfcitOCqGJ7bCBUwZYMYe96l9AfG/puuj2ihIGcJhiHBNZcvurPjxQu0FbrV
         Nn82ACq+/ATkFu78bvI4HV2SITnUFLCxKspFFdje7Hly1uZOQ6dj8rOftoJIWRwlH6rR
         HDXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKuzxGvi/p39OndqguqCb6nJfBw+MeNxQ7S4RnCmg6q1UeO3u/qMvLSFFzDl4UQ10nnrVXdnuXzWq+@vger.kernel.org
X-Gm-Message-State: AFuF++kxENJKH8N6wDNl+OZrRkUBjBshskOyklncwcu4nFo71Bwu1Rdd
	MyRAumYpX996LnWpq4TZmDOwpTBBv6N87HvQreOv/YuVCDylosBh8NLaOQPiqduEPn3P/baemjz
	V/1snp26tyZMTv5vJM7OD87atLqy7vug2fV+uosnpYeHKdt9b6AgBUvZ3tylajbzl
X-Gm-Gg: AR+sD13I3FSA37ULJvZZbRRKy/iMTpM++5YKovBfPanC93o9lQHf8Ou6zHDRHqnKvBo
	yuUgG+i9TgNgYQquk9Tfn0OMUSf+fuoVQ2yQKziSQ7CcQjS+MceLWTwwoKPk/CBZnukSxjznYeX
	PDoP/qTADzc9/vV9a6DwFtXb54zt01NGLaaMZW/Ij6BRrN6trDkjHHtXLkgY/pW7HNofdTu1wZX
	xNiyTPNLZKLfjOHwrLl4ublMRRuL7QAZ1C5D47NuSQ/c/9n20YgOgz0rnsjIElPzgZWU5sZMjW0
	w1tVzEYLd7fD/O4I+o4/loehmciX6F4V4MCA+7c/wg56Jq3XBKtVy+n3mVxXJGhFmtyJelUk5DW
	9p5otCyr1m2xNbFM8zo3n3+NTjTseDXI=
X-Received: by 2002:a05:6808:220b:b0:495:d7ec:b6ae with SMTP id 5614622812f47-4b39824e860mr35150b6e.16.1787849259926;
        Thu, 27 Aug 2026 09:47:39 -0700 (PDT)
X-Received: by 2002:a05:6808:220b:b0:495:d7ec:b6ae with SMTP id 5614622812f47-4b39824e860mr35036b6e.16.1787849259382;
        Thu, 27 Aug 2026 09:47:39 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b36ab2b542sm4508205b6e.10.2026.08.27.09.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:47:36 -0700 (PDT)
Message-ID: <54721a71-cc94-48d3-9581-4d2b09038d6b@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:17:24 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-7-196e2b306368@oss.qualcomm.com>
 <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX6N7jWZ9N5xq8
 j7iSF79tDcITLw8BdYxVBNgdsilzfLGcYB4KWJVXbfLC0GS11dnRPmD7TIPNdulhNPYpoxP7Btw
 CF2jLMwNnlHc4c0EMn1c196y6A2b5jXLQT0WsBXEWfa49aJWYU1wtHn9r6Uqq1MvrM9DK9K2bjz
 R6yhjY6EHxSaRf/cN8kBIXe7ImTvYU7Vz8TjZ1rE796pThUke72KNQoxIMeIDbvnMa99ZDMxl68
 4la26+Ot7CjM7P+uPaHu0Op7zg9ZLHNwrr3za8O0epy3RgTItbTTEabkIkjZtbyQzrXKPIpar2b
 Hc4K9TK/CYcF/q5oFTNP4QxpNCLNE+7uM+KgWhj5nFnkarC5/+qqrmT3UcBVZPAuP/NHRbrUXV2
 DE2Wfy36MI85IbUbWd54AOKY80R2efMloIRbxjTjT95zqt58jJt+x0Z8w9fR7OCjvNTFsnAa7TP
 8VvXMP7A5165f9OE6QQ==
X-Proofpoint-GUID: VxuKgaCAy8TwOmLehzQ-2fKZtPmzy9L1
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a906a2c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UvNzHEgi-OKrLzb5I3AA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: VxuKgaCAy8TwOmLehzQ-2fKZtPmzy9L1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX4zel5BYVrQJo
 fOgYLXxAKb7DeXfHLqdfa74Esiaui4Gm67M5ozvUoQ83qkF1YVubB8hFgnjlmhMZ+F4vYJz5lNy
 /dZV4X+CMkss+XLDDB03F9XTL2R9UH0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270141


On 8/24/2026 1:27 PM, Abel Vesa wrote:
> On 26-08-21 21:39:00, Hardeep Sharma wrote:
>> Add the interconnect provider driver for the Qualcomm Kuno SoC to
>> enable bus bandwidth voting on the platform. This includes the
>> aggre-noc and cnoc-main NoC instances with their associated BCM
>> nodes.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   drivers/interconnect/qcom/Kconfig  |  13 +
>>   drivers/interconnect/qcom/Makefile |   2 +
>>   drivers/interconnect/qcom/kuno.c   | 977 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 992 insertions(+)
>>
> [...]
>
>> diff --git a/drivers/interconnect/qcom/kuno.c b/drivers/interconnect/qcom/kuno.c
>> new file mode 100644
>> index 000000000000..9a5bd53e7ed9
>> --- /dev/null
>> +++ b/drivers/interconnect/qcom/kuno.c
>> @@ -0,0 +1,977 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
> [...]
>
>> +static const struct of_device_id qnoc_of_match[] = {
>> +	{ .compatible = "qcom,kuno-aggre-noc", .data = &kuno_aggre_noc },
>> +	{ .compatible = "qcom,kuno-clk-virt", .data = &kuno_clk_virt },
>> +	{ .compatible = "qcom,kuno-cnoc-main", .data = &kuno_cnoc_main },
>> +	{ .compatible = "qcom,kuno-dc-noc", .data = &kuno_dc_noc },
>> +	{ .compatible = "qcom,kuno-mc-virt", .data = &kuno_mc_virt },
>> +	{ .compatible = "qcom,kuno-mem-noc", .data = &kuno_mem_noc },
>> +	{ .compatible = "qcom,kuno-pcie-anoc", .data = &kuno_pcie_anoc },
>> +	{ .compatible = "qcom,kuno-system-noc", .data = &kuno_system_noc },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, qnoc_of_match);
>> +
>> +static struct platform_driver qnoc_driver = {
>> +	.probe = qcom_icc_rpmh_probe,
>> +	.remove = qcom_icc_rpmh_remove,
>> +	.driver = {
>> +		.name = "qnoc-kuno",
>> +		.of_match_table = qnoc_of_match,
>> +		.sync_state = icc_sync_state,
>> +	},
>> +};
> qnoc_driver_init() and core_initcall()
>
> then
>
> qnoc_driver_exit() and module_exit()
>
> Please have a look at all other Qualcomm interconnect drivers in upstream.

Thanks for review.

Corrected in v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Best Wishes
Hardeep Sharma
