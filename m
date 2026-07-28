Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AD9424641
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 11:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785237004; cv=none; b=j8TI2VbrCC5Zr81ZedZaLddVLmh4gOCD7ywOuFOWilGVRzwyOmoykrTU65ZPV+WnTLf3xwMq0WXQCv6ncZqDgNfF9JHVKTKrkhLp6zTmBaKbfIdqsioYmpapVsPN6IhHLSEKIL/8J/DKwS+GjQnRFm+MBvmKROnXUVnaQLIV55M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785237004; c=relaxed/simple;
	bh=sM4HBAS/FBe+IYWLomoYiBdGUEcf9thU2gMTBPh+k2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXQyxDiaBHBLjIZ3TCDq2yR2wc6PSgs+93xKuylZ0DcRdH0HBuqegbPcKSQEjUGDPNsfegsxJ4xC5oQXbQ8RQnKu5v7gpPGvr/CRwG+lwoUNfcolMXLYFyXd9JDEB1BTy0/Ss08h7X5muig07RLoYklJqtcx7OnPczKVNPFTToY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4ZbG/1R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFKovgbf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4ZbG/1R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFKovgbf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SAgYaa2511099
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 11:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Xm8oefJ2aOQq++XmyBNq+isCGh7+eMvMlTi84Tnu1Q=; b=k4ZbG/1Rzpsu/W/M
	Pnh04jQeVYUAYXZAYjbw06S/TXZE/OpCM3g0J2r9k5NB4mhLsHULw+bUI1b1lASF
	mHt6K7mSJdzlqnvm4OKepV3dSr86UqEFQn2xu41/LUJlB3KPCJmYr6WF8LA0Us1G
	8QYQm+K/XW5J21SBqDCl2975l4fZBqu/ibpUTP/YLasU47gtvJwieu+sY2uE9Mar
	HKekX4MWM//20VwVHeogRNUnVHzIIxKuON+HcJ84w+5Kq/S1Pes6jRtEFxJdE8Yh
	+gi6EvKxmEr0SlT888V6DKyq7nZg9a6k6bJM2hcfP3UHLzsK4qGXKp2qy5lnO2hv
	Xc/80Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8bwah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 11:10:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ca37ce4c3so6834291cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 04:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785237001; x=1785841801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Xm8oefJ2aOQq++XmyBNq+isCGh7+eMvMlTi84Tnu1Q=;
        b=hFKovgbffHq0tKulg1U2Zsl7fQwinFm4XW07SarXH3qTbW5k9RQ1GsmYyU50xuXiCA
         plO970aFYBcYf0gUU8bJqoWNR+GM82vfCuF5ZNQBEcAKA6WQFTp+fcgf4un+WJ4RupmE
         bL0/1atLuQ5d0RniJOyqXmwmBzux3HDhSsWJYIOyxSHaQAeTxJnY1zqujt73n7Ybpupb
         ln+ZLsZi4cfeZ3BetaHRwN8EQ1LrVXEsbGv0x9E91tupMpccJgbShLWfuL5RTxthsEbl
         k0M1wxg4XHkIxDaCK4B8xbOOJKHoo9dhtsAgTyLzQC3sPU5oxEUFCw8EygO2bJjoY2+v
         TtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785237001; x=1785841801;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Xm8oefJ2aOQq++XmyBNq+isCGh7+eMvMlTi84Tnu1Q=;
        b=FgjDtObJgHIPlYyNRNnMdnJW0p4NORN9cbejkChathuuV1pEZfte19t8rbpeM8NSxn
         6rYy2k2qc7JQzkQ3PuKjLtf95vmFz6LKQ32Mi/IcKo2IKkoq9mXprutGttNM3Z0e0Y2A
         nZiLOeRfzdv24D1WLhF6KDvDPTB/B8KBowqqmXLR8Dk3R2AApYXW1l4CeH293VSxYxM8
         MEKoua3NbnNXlMfZlvr0F8fpTv52pvTNZdTzcW7SC704C6qMRUriiOgSBDJW85qb2rvm
         XRWSMXCnFALTHFhJH1dJ/VgHSvdUENeQbNMyO4TqcjaNszSi6WBYN0EtUWERv27syqEa
         bBow==
X-Forwarded-Encrypted: i=1; AHgh+Rr4WEs405DrrjhKWb5z6t3l5qMDTlZwfVs4R7B0EEss6AaIEQGMUn0mKgR1v8vWJJkcGsqfN3IgM3AD@vger.kernel.org
X-Gm-Message-State: AOJu0YzIMBjd+D5N91U+DyCE4yPNLY73+zWwd+5uGb32kJJ5CcEMQtCH
	+usD5nNfjsmjrGG4uxD0oxyPVjftyXsxF9en3I5fP9vYMAXAA7omBRigbk3xkAB59WizoXSJ/ub
	xihRYJdJJkt24FriMe+Q54JXenCYtwZK0wnoHkz6dYqB0l5ObuvteXTD0afz1ij+o
X-Gm-Gg: AR+sD11q7wap+cRLXHSnj09RIKEwX2etCHOmRsQfPAZ5Sm2eLH+tYyH3RHXobniCM5/
	SRu1iaf1hAGeUQTeuX/eFvtS7CtJ/XrEKd9eDlhdk93KtqL3lCvAw/7qqo+OIKVsbYGODhbeX3u
	TvK0/6r9I8Wf2J1raPO1PnAgccl+W5uIzO96ZoyOJSCRLsFU0LQy7bMuInXNLqn3PZecfS4rFBl
	Xwf370BbVX2U575UGHpQQgiR+nrBgSdd3b3AtK5PKj+1EFnx8swaLVo4agfLMKsGxB8xqdEyC63
	RUeC/5B8LxX1guRjaUvwxIDcuptN6cqgS2k5JDTQb+uaBa4eDxfrMXLc2mlmguvd/4zxBqWp8bW
	Xyq913WvEdH4P2mC05bi1qPAa
X-Received: by 2002:a05:622a:4892:b0:50b:3489:5495 with SMTP id d75a77b69052e-529d7112afdmr13349281cf.8.1785237000979;
        Tue, 28 Jul 2026 04:10:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4892:b0:50b:3489:5495 with SMTP id d75a77b69052e-529d7112afdmr13348971cf.8.1785237000516;
        Tue, 28 Jul 2026 04:10:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c4196ed98sm678079166b.30.2026.07.28.04.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 04:09:59 -0700 (PDT)
Message-ID: <4ac04a13-c2e8-43f6-a7cd-8f113803de41@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 13:09:57 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: shikra: Fix intr_target_width for summary
 interrupt routing
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260728-shikra-pinctrl-intr-width-v1-1-46583734d808@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-shikra-pinctrl-intr-width-v1-1-46583734d808@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5OCBTYWx0ZWRfX4WYl8dROlynz
 3r8TPy1Ke/HX22VdWFN34E7uj1+A4k6Qh8LYk/FDi6Meg6GKwmQr0CA5rLS5wWdVFXnibeJrZ9j
 foTyHiG8EIp4q9gZo9Jv2JahGHEyU84rXTkaZrO41fTRUH42+j5Mo/EaPU74fgQ0SsdQha4obuD
 HmjxbQ9kbdm72C9RuAl0QlAWjlkCHDdENLDeoAkZQUk6m8Pr/iUHXkg/FdYuJMLPMM1NbAzmWFl
 jTI7ZWirvoCdMMLXQuATgDieNfAfglvdru+Ayqo/IpGAgQjxecx5gyAjxot2r0Rzpl60ZVDWwM7
 /FRkhTeGPpl0PD6zKRhGG5nFl3R9Iv0Q7yFxzSzTWGt7H1Go+0QAA2AqpNP3a8KOZofwlwncXFV
 AwZNUrU3IWrdXTwLqJ6dH2ZwsCr7STnNo1xZbxmpILEAP8Jp93xzpviWicVaRiAx75V7v1DqTra
 J5kRfErE0YIrWtdGlGA==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a688e09 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=z-2MmutFRShFpDa9hlsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: tMMdNGEvwb9cShPZpV4w-QCmfFiWGZTw
X-Proofpoint-GUID: tMMdNGEvwb9cShPZpV4w-QCmfFiWGZTw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5OCBTYWx0ZWRfX16xrgNAIr930
 1KLMljvtgcnFZ5KDWhLVKau6jwWhBPDWdxOlFe1m+7WoRRUCLJW/VJUKcvsc4jfW5UZ40DQJTzu
 gQS6Ot3hlPogXoJIzV/NzDPUaT78taE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280098

On 7/28/26 1:03 PM, Komal Bajaj wrote:
> The intr_target_width field sets the mask width used when writing
> target processor into interrupt config register and deciding which
> processor receives summary interrupt for a given GPIO.
> 
> Without it, pinctrl driver defaults to a 3-bit mask. On Shikra, this
> field is 4 bits wide, which could corrupt adjacent bits and mis-route
> interrupts. Set intr_target_width = 4 to match the hardware.
> 
> Fixes: 9db68ec534c5 ("pinctrl: qcom: Add Shikra pinctrl driver")
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
