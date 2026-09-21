Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E2C495044
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 11:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988566; cv=none; b=ocaPcUVaHf7Pu91EBEHXifM69J4NU23ipJvw/CVyqyCvI8dBQby5Na7SSAcUK+kGpGjrcSj7KmDmZcCt4R9qPfNZnfm/cuAMlIHkd1uam9HUsV19Rgjfz0gldwKmFqwW4ZFCL2/q8ilKU1e/37BOCTVyhLCF3lEf42Z695CgAno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988566; c=relaxed/simple;
	bh=vlkxXW/qwDDLMWmx5HyWZ1mVXU9auxRCAbXXUDGSvYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COKjxmH0blzqeJxjuLV6YsSA51ugJgJQKf5DYbcr8rhrh/FksKNs0tgjlL9QtgqGL0Q3Elx9dlHBwX7aZIU2949xamXWQCMndZ89sR1gCMA9rhqsKC68l7HAdYz9WRyVOYNCzPXsmjpBRzX1fDeusYPgifFZI8p8PHYtL1cFGuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FV4pKmqY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUOKYsOY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FV4pKmqY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUOKYsOY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdmw7227824
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 11:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HhxdGMSK2hUgq50ogbZMAdAqGDY7N/0SjhEg7XlRwBA=; b=FV4pKmqYfTBQ4LZx
	l5b784poLgcmcnlLgOzEFsncqPRNcABtEKInDnaNwzN/N5lCbkh94GYGXeDbbRE1
	bVz0cLXcAHXjQHlaISevTt7A28SaQgoRf0cRVX6kmSgnN/H4SAh3eq35JL9OULIo
	9Slvlm/Arx2TeOrtvjqibJ36m6IXrOFiyrwUcK6vfJEVuq8OopRMVav7I8KmCDew
	vnzHO0LVczDmpbIJIGNM0XCNiBHMRhH4XrFcLajeHKxCz0TLDKHedUR7sua392dC
	4Ha+mgaIr/QJlzkWYvWpv+9+6byvpECx8vDDzY2Fg+ZfhknjGwag6UZImcvRF2r7
	LWKGfA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17grk6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 11:02:40 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-483ee5899ffso668725fac.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 04:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988560; x=1790593360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HhxdGMSK2hUgq50ogbZMAdAqGDY7N/0SjhEg7XlRwBA=;
        b=UUOKYsOYZ/RTokwRGgsFfWnq4r/isyHY7SmdM7/+NamBLKMUAa060O0aZ27U3NGlsH
         yeyL6u8Vb0gILacjU1o+tQ+kifXzJOqXjRWSDr8YT4Oqvo6BKrcTToMvPE+Y8iBHz8b/
         F/xrkH73v24s6e2G7Gx8RS9QDTRp4IM813XObZ1lZwtCr+Ed7vUk9ASqVpSirCXfzaVZ
         Iya519R73cinuCdGYjS+jmyy0Oo68rcfoqRptQa56xGpeqVGCUKmnhlgpN1701ndfjpu
         mVssRjCWJRLA9A8VlR2YEs5kFhF/3Ov+3GDtiwowHYKKQMDhyK99c0/1bn1X04E2uH7L
         ZyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988560; x=1790593360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhxdGMSK2hUgq50ogbZMAdAqGDY7N/0SjhEg7XlRwBA=;
        b=fRBzPNsUmBexSNqPWKv3MuWimBRWB0y8BUvRK1s0ERht4qsELdoRgdptSPjbCtSNlD
         WGVqt3N9bI2ejFtztdcEPjfyyPx4VVRhrUTX9PGh+Tq7RL9HeGsjxS7ZkhPhkNiYeMLi
         7lp3KHUtywvbfbO1AQa+I4G8qvPGnruaSg1/wfGGeJgnntR43YN+9Q5ZVojOV4UYqnJR
         JjbTyQekXRnlwBXzF+rYrH9hkrXlhAfEUOZVZtkfV6iebiEZPt8BEoDB7SSs13yvEUBL
         GdnkcroM/+Z8M+Ez5yvwhEeztt0aZS8j9GxxCUauTPg8zuuUHfUEO1zk453FloUQLXBj
         vuag==
X-Forwarded-Encrypted: i=1; AKwUvBzQ3uYSbw81D31Iu5l09nXlAaH3ds5/FGiWVhiV4awdGdRJKOL2kpATsFnMS7KS/XQWNqvJjNYkjaRY@vger.kernel.org
X-Gm-Message-State: AFuF++ku5S+MSNaWFEYAXfgMMvFrdgsxAaAo0t24iHwuyZ4+MYEe/VKI
	8P4D86aUgYXHuOZWKNEjeGkRszmBM/G3mz2td92dEBLMJIfCJaFTjwurOZjXYT7RsPvi+e4unoK
	fNtVDAArlNgRzvErSCbKVhcEyY5LO68VAK8bSDjWeiVdR8OO2J3/Px1SVZFAxPaemdEFiQowM
X-Gm-Gg: AYBFou0WTRkznAzezjfFkSGoRUxUpgmlYyVltU0rWoMyjTIugKQwzIpNjMHm1+dAexz
	A92Oht2GONFCCOcj6DtRMhtDKFa+Lqgn3W6oDXwmMQ1LD/2RRerGMhXN664HBDemsdp/+DRXE9o
	LvG3Prf0cghaUm4VAIPlgrcMNcphVszKoxfl0yoECKruVIzbgkq+tSSovooOGf7BrnsHqG/izp9
	FHMftzmLZr/KsAKiiovt7H+SCc0lquN/E0whdCvPqfjrhVwOHSIryKTJwx/Qx9npNkKy5yy9sRi
	mbuDWLvRx4gBDuLZxYbmGL1oj90ocK6NK7yTXOQX10NA587mgjBRi0C6FjBWN53xgbFCYfCrnIH
	hlQPcv2/r3/MaEEupl6DHDg==
X-Received: by 2002:a05:6820:4d52:20b0:6c6:92e0:2d9d with SMTP id 006d021491bc7-6cb2da01de5mr6777778eaf.1.1789988560025;
        Mon, 21 Sep 2026 04:02:40 -0700 (PDT)
X-Received: by 2002:a05:6820:4d52:20b0:6c6:92e0:2d9d with SMTP id 006d021491bc7-6cb2da01de5mr6777742eaf.1.1789988559558;
        Mon, 21 Sep 2026 04:02:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35701bb8sm284496966b.28.2026.09.21.04.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:02:38 -0700 (PDT)
Message-ID: <ad57e0f2-87fb-4259-b55f-a8b259b337b4@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:02:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: add missing pwm3 function on
 gpio13
To: Gilberto Conde <gilbertorconde@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921093419.2870168-1-gilbertorconde@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921093419.2870168-1-gilbertorconde@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F9HHswkqEN6hWtsbpGOnJ-rWtgPhS7Mx
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab10ed0 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-AmX6xWfTBpQRwCXi9cA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1OSBTYWx0ZWRfX+c9gGcdNW5mP
 1VvJp3JgOQ49hLlSGnI7gBFCjn+G8oseVpfzAeLJ0TxlYSfM5IMXE2e04YWy0SN+6v5zeMmmoFc
 OEnOj/MEs01nTbWG6mKIqxQpd7tnuGIjsCwuUJ45MNJuegFlEcptigDOD/ko+VkVsjKaALtMAHG
 F6NJiD6ex6knIBXsw4vZQdnhihEIa36W3RnOmVrMwCoCsE+2QdRoQA6RekfBibMFZeMKWnurwTM
 rxk46npuW41dyZdDybwBDJ5XishO7LDIkFt1ezkYBTgXx0E0NXA3tCkSvbBZjsgE5ZwHKzRKPcM
 KikhxjnkM0t/hQ3NM/sNxmUjtI1G7NZYsgmbob6Gi+s+XbXRkJxFNdeagjxxmKjJ8qXK9tc23X2
 t+aU6TlzL8wUGUfm73cUXojZZ0+9PL7S0Ffo4JNOM7hhqhdmOOidFw4pX+moKpN5QFH1oB/rLOL
 eUtPf8j3jES9Fw0fMeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1OSBTYWx0ZWRfXz96C0qK6Ocdc
 qOTY2UOU/GBMzsQ6ho0TmDwgRSu0x58V6VnjYR3DL9Vr7lOzVtaILkV0lFX4tisT1sdIGybs4b0
 GQYo2kNmeWHY4fMjtRcYulcuaoobPF0=
X-Proofpoint-ORIG-GUID: F9HHswkqEN6hWtsbpGOnJ-rWtgPhS7Mx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210159

On 9/21/26 11:34 AM, Gilberto Conde wrote:
> GPIO13 supports the PWM3 function at mux select value 4, but the
> pingroup table leaves that slot empty and gpio13 is not listed in
> pwm3_groups. Selecting pwm3 on gpio13 is therefore rejected by the
> pinmux core:
> 
>   ipq5018-tlmm: invalid group "gpio13" for function "pwm3"
> 
> The GL.iNet GL-X2000 drives its fan from PWM3 on this pin, and the
> vendor firmware muxes it with select value 4:
> 
>   gpio13 : out low  func4 8mA no pull
> 
> Add pwm3 to the fourth function slot of gpio13 and list gpio13 in
> pwm3_groups. With this the pin muxes as expected:
> 
>   pin 13 (GPIO_13): device 1941010.pwm function pwm3 group gpio13
> 
> Fixes: 725d1c891658 ("pinctrl: qcom: Add IPQ5018 pinctrl driver")
> Signed-off-by: Gilberto Conde <gilbertorconde@gmail.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-ipq5018.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5018.c b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
> index 03cfba9534f..84392fe258c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ipq5018.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
> @@ -563,7 +563,7 @@ static const char * const qdss_cti_trig_out_b1_groups[] = {
>  };
>  
>  static const char * const pwm3_groups[] = {
> -	"gpio45",
> +	"gpio45", "gpio13",

nit: usually these are sorted but I don't think it matters..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
>  };
>  
>  static const char * const qdss_cti_trig_in_b1_groups[] = {
> @@ -689,7 +689,7 @@ static const struct msm_pingroup ipq5018_groups[] = {
>  	PINGROUP(10, blsp0_spi, blsp1_uart0, led0, gcc_plltest, qdss_tracedata_a, _, _, _, _),
>  	PINGROUP(11, blsp0_spi, blsp1_uart0, _, gcc_tlmm, qdss_tracedata_a, _, _, _, _),
>  	PINGROUP(12, blsp0_spi, blsp0_i2c, blsp1_uart0, _, gcc_plltest, qdss_tracedata_a, _, _, _),
> -	PINGROUP(13, blsp0_spi, blsp0_i2c, blsp1_uart0, _, qdss_tracedata_a, _, _, _, _),
> +	PINGROUP(13, blsp0_spi, blsp0_i2c, blsp1_uart0, pwm3, qdss_tracedata_a, _, _, _, _),
>  	PINGROUP(14, pcie0_clk, _, _, cri_trng0, qdss_tracedata_a, _, _, _, _),
>  	PINGROUP(15, _, _, cri_trng1, qdss_tracedata_a, _, _, _, _, _),
>  	PINGROUP(16, pcie0_wake, _, _, cri_trng, qdss_tracedata_a, _, _, _, _),
