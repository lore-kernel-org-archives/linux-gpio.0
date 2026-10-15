Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DEA4A8A32
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048557; cv=none; b=P8W8MDcFLTB7ZfK0PXA14abgVJ6FDkWPWlZ8uF1ns14jOgGfoXZJcW0lzbDcfk8c3iaWR8VTiGT3ilVxAwFFVilq4AeSU3V0Z/oFy9mdgAt3nEPq6Y5gVP5scg24qG5nLWnSovLGaFNlRIa7faZIMEyhCj07C5iP0ZbNiJpd0wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048557; c=relaxed/simple;
	bh=vjC+BasSM2A5pqOKU4kst3CVWxdJ8H9DWDf0gHYFgJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uE9Gqee6hgMaG+9GN4piAmWVjs/BPZ9HGjqKg5dRWKq36ZclNHkYCi6SMz4tQveYu6aFyx+/4XWbY2OZS4Ie0+N6s3fKmOzjYOlrNMD/nP1YYnupvfrhHkjCnGK7z2z6WdjLsTPpW++fRzER2UA3/0KCDUK/kSsvPITdLaBtEC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xs0WUlmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jirIuTnH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xs0WUlmO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jirIuTnH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F74v1M1672580
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YcL9Tn0lD7wDtND94KTiC4YZKyvPoN5Qhi+HsYjbYmQ=; b=Xs0WUlmOsjvUIFWm
	VGjcxKvZv+I1DWj4+mZpbWUfagOhDigL5ylhevrFn31lYSj0HV9NGxg+gKJF0gAi
	Pn6kCSzrDslJzpMItz2hxi3qXfs20wR7NT9YhjFv6mzs3oOvaY+eBKiU2iMH4RNx
	oZ5nBU+cWITt8NPaN0ciPBWmP9GeFz25yHRZWA7CMJWkhTO72W9cMCZvxzsq8Ut8
	ORjV7FXDdQpFHIOoQaP7YmFLYX4bLnPNV/pjLaKoE1464TPWqFLXVOso3NOnlLWq
	jsmpKzBfHpCGm51RAHfx8rO9U8D+/a2izpAtnyDNEAVyymmLQRtVHkXAyHPEIahg
	INctFw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhb2wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:15:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2367960a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 00:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048544; x=1792653344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YcL9Tn0lD7wDtND94KTiC4YZKyvPoN5Qhi+HsYjbYmQ=;
        b=jirIuTnHUksjcJ82dC1k+2LvN6jLQxqnJIGpEDyyS1xExEGWg6bw8KqG/Y2zYfpGo7
         ScYf+CJOW53lcoBcpOMicRCSOPlkvvCuxCr5b3Wsv6EKrLUv04Q1/ymd4yDQCTD3Iu8d
         DBjPgKdc0id8YKYDr7FAJGFaAwO3vketpNf1FLcNBxPN3NVBJvwpFS1joofuQIC3XmJg
         MNPCXAt0HrSkNYfDictiRtuHqRaJMgVnCDSX517U2HtLUEIxofTI7jj2qxJR3crlBDHZ
         L6qJ5ypdxmiXtyLXldMRILN3+ZHYOwwyNqWlCG7F/kIUAfScxH4XkCCGx+CxHHHajypm
         5F1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048544; x=1792653344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcL9Tn0lD7wDtND94KTiC4YZKyvPoN5Qhi+HsYjbYmQ=;
        b=CzSexmdxdKmsnBDlp/RJtJyZjMRwBjyWb2dkRPf/CYcURtSKj8kj31kCjmCpWxFpQT
         07tRSYRnvjB/gn7OnLFN5TrgWJ5yYeOjmr6kYKTwZBEtqaYR14BhejvXJRPFw3GZrJyH
         tZIIJg5JPW+6qtcznEpBJOt/b0j4IMbWZS8fmj/dwKAXRhmnFboMiw2/l9FcnSLXtKGl
         J+jXbIRLoDyFqRtwy7QbHj5uBnJTh/rIyDFGkrgJVVFD9nMNfQQ2SnB7NsZHPpUB81qZ
         FLZ+wcxFh00SNgeGu3xQJ4x4MSYdi++IudxRl2hLohEv/EkAaUNbSgfuEvgsAKbnDdKH
         tM1A==
X-Forwarded-Encrypted: i=1; AKwUvByE02BfjWdNAENMUtgXjfOc2VU7oUQcawMMseTLIL6LVUcFzogxDrrc2Mi7pKfFpcwcUQf1GWeF2lfQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIfSfwYgqnTspi/TKhshCD6+zFUMShV77txlrJZ7VIwls4OAKMK
	YbZ8L4kzXNdwE0l14Da5mOiJN6wGjQp+Sf5Qz9SJpqxdjJ2asn08HPe7SNtkEZxzz1GadZ+EYFB
	iVVBKwTCu39cW2UiexILrmbsq3OtIcZW5a1Oe55uOh1r/PBnkXxtNiwWzd186UkUc
X-Gm-Gg: AYBFou1i0v/KyiRsRVmVdN/rxRG3aFU+fSvFc7GEwfDmjEDp2qX2MJmFZhN+STYmq1c
	ykd9HB7YBmZgf27EkUJhKzTvIY4L/UmriuhYQ1ttq/THI1C8gqHgGx4111Deu/nVhA53W30ZEJU
	fpsBjegJO1rFAECPL/cmRPj/LnGMEUB8dlozxv+ePSuk4dTRP/c9Ly0DO4c0biKmW2bszCJmK6M
	COcukGrRQOno2LgPqI9hPtLQ0djd771yBYPPUdaD5yinXmpdZekWFCAUXkzuwQMSP6ACzvpev0U
	s430t8WGTEihFndAQJwy4TvUSR8kfz5FrCKgamQpNuAcEy+IAsT8gQ46aKEr0kvbUUm3P6HpmqY
	4BWeF241drzQVJEz+nuoWXnvi6xM=
X-Received: by 2002:a17:90b:1d52:b0:3aa:fc22:8ab1 with SMTP id 98e67ed59e1d1-3ab3a8a1ad5mr16246283a91.35.1792048544136;
        Thu, 15 Oct 2026 00:15:44 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:3aa:fc22:8ab1 with SMTP id 98e67ed59e1d1-3ab3a8a1ad5mr16246267a91.35.1792048543623;
        Thu, 15 Oct 2026 00:15:43 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm1617534a91.0.2026.10.15.00.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:15:43 -0700 (PDT)
Message-ID: <0691ab2d-1ca5-4140-af77-05bbf718d205@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:45:37 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: Add a driver for PDM GP_MN fractional
 clock divider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-2-1522662b6c53@oss.qualcomm.com>
 <h7ai3qajk4yq2jgvy6etqpchxuxo56sxtvcgvh7xhodw6jkias@ayn2thdck4ct>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <h7ai3qajk4yq2jgvy6etqpchxuxo56sxtvcgvh7xhodw6jkias@ayn2thdck4ct>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q5zSn-5pHEHrKCZR2vWKpU2jeZCUo-6T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX0Ro+RF3XpVIJ
 Tbc5NrkEBQNDpME0qw4OVm4rL+gjSExgrlROUsqzC42awDZPAtdnK3OohUu+OTquUck7rKZUMYO
 UPv8z4lxsJrSkUl/V7nLS3jWA8qQ8Ss=
X-Proofpoint-GUID: Q5zSn-5pHEHrKCZR2vWKpU2jeZCUo-6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXxV4iQnPjGT07
 b0dLP/uKBbjYwLtt0x46o/e29ZZ9sMXUxOG5ieBYJX0nOHH9BylODbjVkBJiH/rIvDLWg9m0VoB
 WSxZFhiELDnKRtEOonfq7b1K4tQr1bm1Fg0W9I8N6wL7r5xSABzSnun6AwTWl8P/dOmZ9J6UQBS
 OdkNEoBrjkuPaGEVTldIlc6CE/+9yK8m3h8UnAZ5hgYt3Q0Dx/OUxYtnlSP9SoSElSUOVRfiGea
 b9x96OFE5cV8NPezYKbtWtnq0Wtw+pPLP+yM8sUjnqODASfzxZ4qVmz2CtQGso3xk4ZopwHuEMp
 8GvcYr3PxCapaTsXTvO1Fee2qv2YkS+Mbe9UM/8CRXK2WeSkGcyKBqzNtZw/4me1d6ToEd1LQ/G
 g2eywst1K7p+n5jF9DZnMIk3TYsD9yUyVotiSkpFPXQmcq7BmAbc74o4xczId6pORC38+3THXY1
 iU27kzTsPXYFxpacL1Q==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad07da0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=a29RP2Si9AT6pp-L1QcA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028



On 6/8/2026 9:01 AM, Dmitry Baryshkov wrote:
>> +static int gp_mnd_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>> +		unsigned long parent_rate)
>> +{
>> +	struct clk_gp_mnd *gp = to_clk_gp_mnd(hw);
>> +	unsigned long m = 0, n = 0;
>> +	unsigned int d_val, n_val;
>> +	int ret;
>> +
>> +	rational_best_approximation(rate, parent_rate,
>> +				    (unsigned long)GP_MND_MAX_M,
>> +				    (unsigned long)GP_MND_MAX_N,
>> +				    &m, &n);
>> +
>> +	if (!m || !n)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * When N = 2M + 1 the valid D range [M+1, M] is empty; no duty
>> +	 * cycle can satisfy M < D < (N - M).  Reject before touching hw.
>> +	 */
>> +	if (n == 2 * m + 1)
>> +		return -EINVAL;
>> +
>> +	ret = clk_prepare_enable(gp->pdm_ahb_clk);
> Can we use CLK_OPS_PARENT_ENABLE or pm_clk instead? Having to manually
> toggle the clock looks like a coomplete overkill.
> 

Sorry for the delayed response. Yes, I will model it as pm_clk.


>> +	if (ret)
>> +		return ret;
>> +
>> +
>> +	ret = of_property_read_string_index(dev->of_node,
>> +					    "clock-output-names", 0,
>> +					    &init.name);
> Do we need it? Can we generate the name instead?

Yes, I will generate the name.

> 
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "missing clock-output-names\n");
>> +
>> +	gp->hw.init = &init;
>> +
>> +	pin = devm_pinctrl_get(dev);
>> +	if (IS_ERR(pin))
>> +		return dev_err_probe(dev, PTR_ERR(pin), "missing pinctrl device\n");
>> +
>> +	pin_default_state = pinctrl_lookup_state(pin, "active");
>> +	if (IS_ERR(pin_default_state))
>> +		return dev_err_probe(dev, PTR_ERR(pin_default_state),
>> +				     "missing pinctrl default state\n");
> Isn't it done by default for you?
> 

Yeah, I will move it to default.

>> +
>> +	ret = pinctrl_select_state(pin, pin_default_state);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to select pinctrl default state\n");
>> +
>> +	ret = devm_clk_hw_register(dev, &gp->hw);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to register gp_mnd clock\n");
>> +
>> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &gp->hw);
>> +}
>> +
>> +static const struct of_device_id clk_gp_mnd_match_table[] = {
>> +	{ .compatible = "qcom,clk-gp-mnd" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, clk_gp_mnd_match_table);
>> +
>> +static struct platform_driver clk_gp_mnd_driver = {
>> +	.probe  = clk_gp_mnd_probe,
>> +	.driver = {
>> +		.name		= "qcom-clk-gp-mnd",
>> +		.of_match_table	= clk_gp_mnd_match_table,
>> +	},
>> +};
>> +module_platform_driver(clk_gp_mnd_driver);
>> +
>> +MODULE_DESCRIPTION("Qualcomm PDM GP_MND clock divider driver");
>> +MODULE_LICENSE("GPL");

-- 
Thanks,
Taniya Das

