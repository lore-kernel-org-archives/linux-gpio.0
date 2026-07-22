Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04CD3839BA
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 11:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719933; cv=none; b=KYigafApeN60QZzHopY327USl8+stXtcbjsPz8w2YrQgq8zO5cmdokzQLa64bHf4qg1pFtvDwaSqd3/MpaeBlnkwVb0Fk/W5heVc9w8qESWiZJZW0/1tkQnDQyY6bOnWKaWG5GyISFJ4bOug18ZpzSxWZ5VvzJXtBG2UDPqk3UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719933; c=relaxed/simple;
	bh=nXND9Sle9OaS3hHlZnm2qmNYfirIaJdmxVnxpKKxQuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rE1YcT/tG3PdBqLmKbUMFnAPlw2nxqwu9oCxZyRowqWyCJgTZPE4Mg+ez99JS+a4H9XJRgU7MtP+2McmjXvikKmXx4sEpUqjJxgQbKAsm4274WScHbIU1bYGaND6dlT5aPbMxLR2RyFmnFvboJHRXRo6RGetLYRmq8nR4Nncj1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGLkj2Gl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IvTOxBWs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGLkj2Gl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IvTOxBWs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xAWG1400267
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 11:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nXND9Sle9OaS3hHlZnm2qmNYfirIaJdmxVnxpKKxQuA=; b=BGLkj2Gled8Qow2w
	c08wNVRVuOwwNcjRSzgbe96UVGxhcDpWg45YV1wIQPndq2xHCgCl9l3LLHsozSQ4
	ONfauQVnmFz3AEd9f81eDbDnlbF6AlHe2VIHebAYRRNvj5cVI5Dvr3jplsF7v+fZ
	Aw22psEiXZ0+IVI1NwabLx0i4MwtmppCSMDGIOWRdYVb/P2xPoGpPgEg0QENyxLj
	/A/rktWBChJTvWSe4TiPxaCxXB4Fvyavy6fl3BqnqJV7uXc2pe2OPFAz7GyrAIZl
	vST1Te6MYkV0GHdJQsoC3K3Gat0Yx6zBqZmb5Vjw6owUrJc64ylcSt9z4XA6FRFp
	ipb+zw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr839a4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 11:32:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e01a62d99so2516642b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 04:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784719930; x=1785324730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nXND9Sle9OaS3hHlZnm2qmNYfirIaJdmxVnxpKKxQuA=;
        b=IvTOxBWsNACs60oINtlJzCTvi8xK+vQC/PJRFZ9fmI6rkUr5gh9P9G2RO4X+SREVHL
         1OPil2ze48h65mbvKm+J6ByQ0PYH2iErZRQJ0wDJnUi6A1ZRpDkSOWqjCsWlM/epv01x
         EzKteT7Ns9DDo2RBGrr+z8pCvmgtEVPuKR8Dw8f/pcgE4baBxi935sErrZi8+jRW+zlE
         qdzKRk7/DkE/LyjKqyTof2SLg/8Cf2Wjq04lnxI2qDGK9gz0Mh7hm0XAcBEgaLVSlNgI
         15fA5sOyetMDFvp0YiFWWuWqTnv9zC8oskmHPzMw1OMR1oFTnXLfizLVcCtUzW5CnccP
         p1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719930; x=1785324730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXND9Sle9OaS3hHlZnm2qmNYfirIaJdmxVnxpKKxQuA=;
        b=NfsUl/6UZnpYpN8+kfptUV3RggolHFg/fk+vIIzELTcejhSC7If59OnBcOYatMzhSL
         Ld6JjQQ/kNCe8MPyQZE4GpggG4oxuD8vtocxeW8J/DHvrjKIAAC/4oGF+gzESzraVYFX
         DDQlPL6ONB5h3bxw8rSFlXHcWyPZy8fbJGKQcNXPjlP/l2MJg8H3etMMrJCd8OPsNdIn
         2ilu4w0ZqiOm5MQlTO/JTR9h0MS/S7PwKkog/dENqDW5rmmW/9MGVfR1pIQmFYLjpi16
         W2SvbCdiVzdByZ1krISRMc0qv0bF5cwIxnQ+5evZ0ZByI9lYM3RuoXpWgf2XjNFKX85T
         WwQg==
X-Forwarded-Encrypted: i=1; AHgh+Rpx86qXP3gTEKCAB8Mwf73Gr/hkwMOSRGZ2n41TDeRGER8Jdr0dlI7gXj57io61Ki7yGjGGnDusaTZt@vger.kernel.org
X-Gm-Message-State: AOJu0YxS69/+321Z+pDnngAz9M8bFvmQlQDFX8BogHyhdLhWCgqkZl6l
	WvDT5ItUiOCfxZ5NMta+tPqBGvhWm/+8MW/2u8Z3fQ3yyJ5LN9q/iUG4qAQvj4S8TbJRjCkykWQ
	yrKiARkED8GFqjBEeaihlTxSjqAeneTM2BDnwBheohJng/kWaJtgGcepCnIjG5bG7
X-Gm-Gg: AR+sD108Sez0ohsyX1DI+XEbXUGKkS1Oey6j96S1rclYrIpukJpFM5/vruYx7Gu0Txt
	iAXjcC5973d48uRXloGCM4tb64VYlsNFyEa65vI9DGqihMyKzbbQNU8oFGyrHWDJvaUtZOI4DAi
	8rh2V/UTG3+a/QAp2Fgos+13DiofqlfWctjy+X6yEAU4JSRPcOs0KLpx7II2HEXv+7fM1RfUVnY
	fptLiDQbOP4d0pQFgu2+CM4gf5vrgA6UwQ0smbnK6rsuDlL+tCUPO+KENiM5aG3VK58HHb4tu2Y
	1I18ilrUyLfGuwa2O9qDkrkOB01kr2PadTnzbr+trXdmUvV1IJZOBWmEXrfrvKnD/XUwOhGgQn7
	t/q2nFb+WP4j2TcjqJJcMDzfamS1/L+y/jw==
X-Received: by 2002:aa7:914d:0:b0:84a:6726:62f9 with SMTP id d2e1a72fcca58-84c292d0d55mr23779014b3a.9.1784719930068;
        Wed, 22 Jul 2026 04:32:10 -0700 (PDT)
X-Received: by 2002:aa7:914d:0:b0:84a:6726:62f9 with SMTP id d2e1a72fcca58-84c292d0d55mr23778979b3a.9.1784719929579;
        Wed, 22 Jul 2026 04:32:09 -0700 (PDT)
Received: from [10.219.49.131] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175a29aesm1172711b3a.41.2026.07.22.04.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 04:32:08 -0700 (PDT)
Message-ID: <a3505150-0a13-4730-b051-2034e0e2ff3c@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 17:02:01 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] ASoC: qcom and pinctrl: add LPASS LPR voting and
 Hawi LPASS LPI TLMM
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
 <CAMRc=MfvfVvJ4anwY5WZUr5K8fSGkcvejah72fUDLc7ZC59jNw@mail.gmail.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <CAMRc=MfvfVvJ4anwY5WZUr5K8fSGkcvejah72fUDLc7ZC59jNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I458eX8SFdnRI_y5H6y0gXSgp7fYR8uW
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a60aa3a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lHG6SDQFHwzuY-o0dyQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: I458eX8SFdnRI_y5H6y0gXSgp7fYR8uW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDExMiBTYWx0ZWRfX9c5yrwiVjL2x
 mT0jLcU2jBfA0HMFGaTxKwBdnU8HybLtvG+rC3HczvtgDuQdyv5tD+4Wi2z/9jC4AdQOUZ3SDyq
 HSeqNPku0XoTEke7O3SQQEmkRGnKVm+KIgl7jErYZUOvgvPwZiHyOl6OG247sgf066EgcEHeSiO
 c5Xwt+BUtYc52EtyPzhFWmewCTznVW8BOERGstP6zkrhK/4lD2bexmZSXraos8NFvYyVxxBaWLn
 tHG6CXuZ2ISTB2sn9gR/oB4qVvgmbzHzg/F3XJguYA8YkPSdmuMxoAizmoib6ho4m69rmiKzQZh
 zpyhyayz76C4AFWpXqszIkjizRdbwJV1sGtV9ysgJk7i0P82OVgl8hUORcY6zrrhI0OCjsVE1iD
 LkzBf7JvwQLO9Z6rzVFQVJzWP5qxsq+kcyFo3XB3TvXaVX1YgzYTUhS5MbU+WbFsGmaaeoKQS4L
 1w5MMWs2Fy/NuOs6doA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDExMiBTYWx0ZWRfX5HjlJCx0LuD5
 1peyh/HN7ky32t5qAOo60Y4HRpNzRXe/11fOYZUKUBwKsIR70N6T6/QwrMvyrtzV1Iqch5TxV7v
 GCUJLOmnn7+wao93bcFuXmF7Nh3cnDg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220112


On 7/20/2026 7:12 PM, Bartosz Golaszewski wrote:
> On Mon, 20 Jul 2026 15:05:07 +0200, Prasad Kumpatla
> <prasad.kumpatla@oss.qualcomm.com> said:
>> This series adds support for LPASS low-power resource (LPR) voting
>> through PRM and introduces LPASS LPI TLMM pinctrl support for newer
>> platforms such as Hawi.
>>
>> On such platforms, LPASS requires LPR resource voting via PRM to keep
>> the subsystem active. This is handled by adding a new clock ID and
>> support for PARAM_ID_RSC_CPU_LPR in q6prm.
>>
>> Additionally, a new LPASS LPI TLMM block is introduced, requiring a
>> dedicated DT binding and pinctrl driver.
> What is the merging strategy? Is an Ack from Mark required and the series
> should go together through the pinctrl tree?

Hi Bart,

Thanks for the question. The only cross-subsystem dependency is the
addition of LPASS_HW_LPR_VOTE in qcom,q6dsp-lpass-ports.h, which is
consumed by the Hawi LPASS LPI DT binding. My expectation was that
the shared clock ID definition would be merged first, after which
the ASoC and pinctrl changes could proceed through their respective
trees. I'll clarify this dependency and the intended merge strategy
in the next revision's cover letter.

Thanks,
Prasad

>
> Bart
