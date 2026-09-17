Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79340434E39
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 08:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634514; cv=none; b=LD4vrF+/47+JDGKpbA3GxokFlTQI/WXAZGlOtYplcfdOcfHgkHNBhwzJDRhD/pKX2vAr7h81IaF54fTpjmvWP1ZM6BX76+DuxBm/3wT6NXDe+ve5maQkKLqE8pFdXr+pypPPQBn/7L4/uXNEdRVLapFvs8+O4Qzk/Fc3SvSuNRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634514; c=relaxed/simple;
	bh=KDaJqLXNcCVyqguB7u6yZb8TXNUYjurXSZy0CIDUH2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6B/phwECgK6t+e8ZIULI9+XzBvphbPaJYZR4WRVKkWLf9YKUPGkVpY4jCHuSvqbFB05WKZs/MjRmucbCqX9gAVB+bBH9agU/wqq6IqopZYrt/u11gtmQyIReRsj2d5rdgLEvyVltGTZRDqcpf9RYTm7rNfiiVplOMrXAjuJMtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U33FJM/j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdXuHhu0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U33FJM/j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdXuHhu0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60DdD1721165
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 08:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZjQDioJHJpaRJll5O5OcVoNVSPLQ8ff8oyq/g5k0SXc=; b=U33FJM/jPVwxzlKh
	dN/VZ7rR7FwaTuIESZ30pMuQkxN2KkVdjxUyhDWCXs6HnM6F5CujAZEueRJUwvOr
	keswmPgMrOJJTPsRIvslVQ2GrDV3iRvi9qANKcgfspKm0DjQq92Pn8V1Bmio2CGC
	YTZ0EKotJLR6sfPVEhqJ5FSS3UetBq6WeL7i0S5JeTKJEjPr6pLba190l+rSnv2K
	AOToNyB8HITveSDYhqaUjEMWtb9qeMsnWjIrDBqGCL+e2t2bSmR7bnEkOYZ4ubNe
	ixpm8BpMSS3ASQTE9hG1VMBvYiKEXUStfeX3bHz/fGCyJwe7kq9Enpj0pYxx+o4A
	xe5+qQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m1bnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 08:41:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9375d92d0caso13616785a.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 01:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789634503; x=1790239303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjQDioJHJpaRJll5O5OcVoNVSPLQ8ff8oyq/g5k0SXc=;
        b=LdXuHhu0dzJcyQr9l7UncFAEZHQU45DFp4Lcqc8vYGwDY1RyTFBP0m+XuJ6zb5YC9O
         cGFd3hyU/slDPICBGFj//O+6pWKr0Uonnbl1xbjaFHknPMzfK/78Z62tOigCuqvFTriQ
         faJvmUuAICKlHgdsEYeZlv+huYZ8wPjG1JVBcMjEcb95h4swY9YZyFfOxIX80EIoICmw
         B432FgYBSwR9J9TvbJUxccer1XdTiBkKbhoWj6A+sjwg+YvJR3VErwUUkfi5QqIJoP6y
         RHEgaeZUMnda3JPklxgpv7Q9KcyV3xgKilpHmqrdb1UJ6+op9EHzCm459pIf91ANbYNU
         0fJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634503; x=1790239303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjQDioJHJpaRJll5O5OcVoNVSPLQ8ff8oyq/g5k0SXc=;
        b=Y1e0SfQbbgmO3WZfbnonDD+eziA8hEFILa7K77FejyjHIC8qLcnEOD3KEbMbG+q8bt
         m0cEb2BKpKAMWCZbASfM0hQr4p2YjvZ1vytXQmUlQ9jVvFDkHbW+qF6O7TlbaUanD4Uz
         /1ZHr/3/ua+NYXs3rJARVp4i15W2MSFcEg0PljVxNnBUyOJDcH75D3XJr9LOfXTW3cbI
         qnNPOcxGzeE7wMryCs6KldOoKZ1ksnZzBh315EMPcNVQi33sxBBOi9fSzVI5dr4xsA1I
         J6H4VmMcQvdvnEz7UF40YkJJlTX2+r6ZMmRFY5YGiwiGI6UWmDkCvnIhvB9YpIbkSBrV
         jsZA==
X-Forwarded-Encrypted: i=1; AKwUvBw7eO7YWGoYqAarp+kbg48+94G+lijqePjaxvZK0uvEoK4nyVWUYw7eoyE290lq61ph5luAj367scwy@vger.kernel.org
X-Gm-Message-State: AFuF++nWwKy7XaEcd7hCzoNHvptatjeV/ygN4BMUigiZkxwfNqPFtoB6
	jsRRN/FWfB3/LtqKgnuHi+KD6b0VXXbHr+UtZGeNOIxOWU4x9za1LCpyv1AIK+6Tsw/6k9d8WTW
	z9kr+uZ4FhfhTS9sezZrQ3tzkT0qlWDRX438GVSLeT/gUcSWqL5DHZ33Cp4SoS5So
X-Gm-Gg: AYBFou1e9Tdhi9gPnAaTsiXOPszKYL+d90vQ3KyH/crdkzDMUqttzcCT0FZwZTbNR3j
	LZteWKtTk/dGnYhzGAIHr7xTsKZuiFukjIQ/bbHP+JqW1MHaWjRSjEwUu8ijZsa6OvM5tNtYn/G
	z9yU9jJ8+tfKMvZ4y42tJOn7MYTwkO9n/QetHsljVXZNHGmISX0bx0m6Gyk5MGqXJScTu/qYM4R
	KHl6gNPql4Pl4w56xDhzFgYGC+CR1kFO59OOIEVFyo4VE3bsk9xM8mIfyoLO4I5mxKRtEzvlbJ9
	xku9FLbBd15g5T+qxzBFPDxqHPo5cZsU0r1GCQQisvWatpr0R94keuuPCuZ48t/rjzyIecTO4Pu
	Tmx3sQkRJojgOpTE4MlYwFg==
X-Received: by 2002:a05:620a:a189:20b0:93b:beb1:5790 with SMTP id af79cd13be357-93bbeb16790mr525452985a.5.1789634503280;
        Thu, 17 Sep 2026 01:41:43 -0700 (PDT)
X-Received: by 2002:a05:620a:a189:20b0:93b:beb1:5790 with SMTP id af79cd13be357-93bbeb16790mr525451385a.5.1789634502896;
        Thu, 17 Sep 2026 01:41:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de0898bdsm260029866b.5.2026.09.17.01.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:41:42 -0700 (PDT)
Message-ID: <6c61d38e-e874-4278-b188-166cbfdad067@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:41:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: nord: fix GPIO interrupt target width
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, linusw@kernel.org,
        andersson@kernel.org, brgl@kernel.org
Cc: pankaj.patil@oss.qualcomm.com, maulik.shah@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aaba7c8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=NCczGnymYEpDLu10qSUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: A84tfmJuwTbYSgpXMsszhJI-Ql9bbu3O
X-Proofpoint-ORIG-GUID: A84tfmJuwTbYSgpXMsszhJI-Ql9bbu3O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDExNyBTYWx0ZWRfX/JScAyBwa79W
 wyq8yuuDcNL5vm/mIsSG5hAt0Lya4yaUVLyEn/hkZty4Po1vwkMUHCt3Rcs4/Sj//hoJ2QF0mb/
 So7z903IdCbs1I0KQdiaE0ztMQhaBqGeKDzr80B0BUzgJupZo/RpUI4oLSlOEreDhQ+RkjC+UNd
 RK1ne5Ei+XqWjQpruiF9KAXO+2hfCOvGFr/g5LTGBN8bG1u3llRlv3j4S9soTFejFeJGv5n/HG0
 wu2rVcv5p3ZIY6kQ/zb0RgvWc3DkuDCGJ5RsZbnmb7MHtptjQf/HjCJ/T4xCX9uSc+dt5DPif3/
 OtyoCNGz+2w6PNAwhJ43KexTNhi57feB10R/dE2WuICET5Ofd7ZfliipoZMUQtg1pV/ch500ehU
 k3KrympnzlQuKpuNtYOmYpA+9ZJl6hUhIK0Ye8ha6sYhyZCRiZBs4aSInaRLkYhLDJFVwCs5PSV
 AZGsu22zW1uWJBEmEJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDExNyBTYWx0ZWRfX/6OcuFT4FPK7
 c4ydSv+cDIfE3+xkj10ctZLiagGmGPDLWNsU914fshNAbG1GID0iQD1vEp3OTTLMtoI7pa4A2rm
 DrtBz9dpLQ37a2df00GJ/GHphFWs660=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170117

On 9/16/26 10:57 AM, Zhangfei Gao wrote:
> The TARGET_PROC field in the Nord GPIO_INTR_CFG registers occupies bits
> 11:8. Describe it as four bits wide so the common Qualcomm pinctrl code
> clears the complete field before routing an interrupt to the application
> processor.
> 
> Without intr_target_width, the common code uses its three-bit default
> mask. Since GPIO_INTR_CFG resets with TARGET_PROC set to 0xf (NONE), bit
> 11 remains set when the driver programs HMSS target 3. The resulting
> target is 0xb (HPASS_DSP_1), observed as an interrupt configuration value
> of 0xb1b instead of 0x31b.
> 
> The GPIO interrupt status is consequently latched, but the HMSS TLMM
> summary interrupt at GIC SPI 208 is never asserted. This affects all Nord
> GPIO interrupts using the TLMM summary path, including the Ethernet PHY
> interrupts on GPIO55 and GPIO141.
> 
> Fixes: c24dd0826f06 ("pinctrl: qcom: add the TLMM driver for the Nord platforms")
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
