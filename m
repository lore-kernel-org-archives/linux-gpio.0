Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315254A0913
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048517; cv=none; b=ne3FtlUyzcz+Qn3q40e/htGSy9LDLvaTqduAItPVaQT9DZrBez1Adcb+Eck2zBAVjpWKrtv8rVXCWj5U35hzluHoCfFyjXGtvGAlwPYOsnWpBwY7v4QM9rTwbmWMr6T5YEpTcRnPB/9iOFys1Y5v8+EchpVd1M40LwLPLPKuydk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048517; c=relaxed/simple;
	bh=mfOTURXkLHsUM2K+xfvN1AuN6AP8ZVFosHyF8KwfQ8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jq+hS2oeBcX/9Z6pkkuPbC/Jp+99WnuAfeUhE/LI+TbN92sM4JiOJYnoDwM2FNG8D9pwwfDCeVvhFacb95Hv+IZZDKbzQt4zO5X8iqgZVUNbxuV7huf42tPLBa4Sg2RBjyGWAtLFvtad3IQJQn75i7V4xFpu7QP91Hatbx8y1GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hd7cS0W8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EF1xYKHs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hd7cS0W8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EF1xYKHs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3xf6B2738953
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5fiZu0AOBD5KzQVMVHnoqxelmroz5f5CORHmW4wi7g=; b=Hd7cS0W8Jl1T4G3W
	lIcILYHUthYwwNp+VnnsHgPvPOzdatwqQoxBL97dDpY1jgVW9T4AMHDUInX/948F
	QNKPhMrinCeS6Wo5YZSff7JWxGVgC3a4+HJmtzEdtYF10OTC8gsan+QOl1aUyGWa
	4Xxohs22R7tprpWhHlPWk8MCeDUzJu4Qa0P/KtFxydFbOd4W1Iy3Z3cJfL82zowZ
	hFjjQNlY53V13GBNZldvFsbdDrrLoETLWo4xWWzSZs9pZYOOVJu2Nd1va1xp4GBu
	Nu/uAb+R2L03pCkEQvT4YJXLboMuBdGmX/ZWDW0b69nwcr0xDu57hWA7fW0OS/6Q
	mX2uhg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds8npe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:15:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a470ead068so5858102a91.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 00:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048502; x=1792653302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5fiZu0AOBD5KzQVMVHnoqxelmroz5f5CORHmW4wi7g=;
        b=EF1xYKHsFTdPceAWMGtL+ZR9KxCMTNHVEkvPESGt6tadU0ns4NJZGUinmYyVn5JVKf
         Vw7zU0TIV+xEak+5B0w2c2LFAKjKRNG3Gr2clSi5t+gi3vrfi6tue8QZxVkqNMU18yZM
         qBY/OA7dG47hVKombAb5ysSdX7d7NRB4pO/LU9Jc8Vxkb+WOhZ4W0c+s/taIui+ZYq96
         Q++LroRBGutMLnvCFx8xe4BbCY010qzC5zIzyyfnd0e7sjzb4VarU+jwZ10iBu2Rw+d6
         8tr/oiYVGpvFQ71FuoxMJNfSfswBHy8KRzTMFQKgFM7H/eEHsDG+ffgurMVCNsJED4Qi
         eA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048502; x=1792653302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5fiZu0AOBD5KzQVMVHnoqxelmroz5f5CORHmW4wi7g=;
        b=duPPUuRNRIauD2Ek9oq2g6ejUJVVgHhmQGRa2oYGmowLwZ7Dzz6WbeHaq/HhLYyyib
         xqB9KE5vjQPbGqOO1beJdseurBfB0XthM1YyNKzvcvPQdMW+exD8J/2BIgstNVE4+DSI
         J42Hlax7kC+jEkcfqDEmZ6L/0ZKwk0rwxxSkam3PWalJxMkCBoF5ELbiDkxjfl4jMzKL
         rHOmIjw67ra2WLi7wvkwyMNXIKIcPEEbKnmuYPPTsIfuUp6UTT1L5iCMF1q3SACpjW/y
         WTt5VeBMG1ak3MdEef5AkLWjLgXxuQG6GaTVbzqnslkup/murshsa/cRQphPB3ZpDtuC
         OcEg==
X-Forwarded-Encrypted: i=1; AKwUvByjJbPMX9nhGWqPIbYgYtOzPRrmEbu/z98qWRbIsSVp8Ea/IPe8z8GiinWGaeIg2OaXgnJXLH9jD9y0@vger.kernel.org
X-Gm-Message-State: AFq9FYJf4clwnypI89uTDSMD/xIK4GBBDcUNZubuxxouPtaKSx0ESPck
	fOu57yueW/DYFPli38caqLxgy1kv9j1o2L+1VMzAzc0OAgZO7M75FG8oy8+8hGynQpk/me4p42C
	6BBO8iIXxjTIy7NY2QYHQWBgo+nDe3YYEqVomg48ynKPP8rkVP1KI3OCGiR9mG6lj
X-Gm-Gg: AYBFou2Km9lk20D8xqRHQHb7LcWNKbzFMBPDD+JkJCApNdW4fMb/ceCzvDaH8Crd0VQ
	6sNpAt6BI/8omffadkPOHJWRURQNevCnU29xf1SvuWdVzpGwunng1DTJbYJTpFtC/VDPSYG2oNi
	866quT9K6Oxiswv2LPM1MsToyRXx2tI4zI8Yl68E4Ny2zPnlinyEsCuNcjlvWaoDAb+/dxqo88P
	/8KCJmwy5F70e8NwYM8dTxColunAhQHPTkgTQFrGKReOpsrAcEmWEpvbMrRbD9ckdJUGn/OvJ1e
	k7rotPuiEsn/sQd31YDrVhMdqFEuQGcMZ2crwJ09bnLjj5uCreqOGlrJqCX/vIGhQeujYYY0Bfb
	byveyw87Y3vRDHkqjTLOxiUtDN+w=
X-Received: by 2002:a17:90b:1d4f:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3ab3a94ff23mr14061594a91.18.1792048502016;
        Thu, 15 Oct 2026 00:15:02 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4f:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3ab3a94ff23mr14061583a91.18.1792048501560;
        Thu, 15 Oct 2026 00:15:01 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3221300a91.10.2026.10.15.00.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:15:00 -0700 (PDT)
Message-ID: <edb0c405-e0f4-4d17-9948-5cd1703d0c44@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:44:51 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add gp_mn pin state for GP M/N
 clock output
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
 <f6fc66d2-b40c-48a3-9dc9-bae849353e74@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <f6fc66d2-b40c-48a3-9dc9-bae849353e74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L1OhJGm-EU4Vl6_Ux3rfwHRyybppkFX3
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad07d77 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CaCc2b9mPIm3Huh5NNcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX7F2fch+FuFi5
 gaAeG46FK4EEcT+ayXHPLLiNLaJrBeXA56K+1cZYh4WasCvoef22B/jEq8Os/2t+ClVKGC+gOuh
 arCYpWrOrLLEnkxw8QRrGIV9b0BrN+BS66AyKXlsMvsKWrzpuvlvAmquKxZYmy19S1KZhgsr/Eu
 VeWaMHOZFR7opWpNIfBXNqjAFFG+yS7Zq4W5WGDYzjuT5JuIzaNLjFhCdFdUR6Nl8cpKC1S4xuV
 Fv2nOX6Kqd5PXpid5oERch3HOqyEsYdUDPbJU2NPHl/nllbYM7woREKEjQDOA50eGJWO27cB1pU
 DX7iZGsFL8S4gyxTW27veFMOxPnzGFtccj3cCKUjFUZQXrYk+OaF4nzvLCyesZTY8oBg3BWPDpL
 K+gZtgPkyG4WIAa5757IyQJcQY+ZR1exgMuJbqdakNimTI6lVqgQ0UkVSdSNxV4X6wBOTsQbEIi
 L1vvzT5g0em1cx8vjWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX8TnFeRj0FKsQ
 60lpPl7EQ4QiRaNbq9YDHx0oA99xv5BArHWBgfyxeN0ke/YAD+aZuIU+Cfq33K+vlCgufORWQSN
 y0R901MFg9O9cRPmJ2YhpwEvUepHqZw=
X-Proofpoint-GUID: L1OhJGm-EU4Vl6_Ux3rfwHRyybppkFX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028



On 6/9/2026 6:58 PM, Konrad Dybcio wrote:
> On 6/2/26 5:21 PM, Taniya Das wrote:
>> Add pinctrl states for the GP M/N divider clock output pin across
>> multiple Qualcomm SoCs:
>>
>>   wire it to the GP M/N clock controller node via pinctrl-0.
>> - kodiak (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).
>> - lemans (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).
>> - monaco (qcs8300): Add gp_mn_active state on gpio32 (gp_mn function).
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> Please squash the pinctrl addition and clock controller node addition
> patches together (single logical change), and separate them per-platform


Sure Konrad, will take care.


-- 
Thanks,
Taniya Das

