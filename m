Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CEE4AE13B
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646728; cv=none; b=kVrY2pVrBZdB781iUt4oo9kleRcwj0nP9yBh/VLeaDTTrAQD4jchyF/q//PUr+FzXNbK4mbCKDoAwqVYiL2P8pVyB1DJJH0kK4kPOCSrpYqeoAkJAv5AMLC7NFD4iMzOIEvniqk62VAroLp3RyHGQ3x35o53bLtVcTSRSvYwbqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646728; c=relaxed/simple;
	bh=SC7XYX10hWebInkiKKp2nmH8rixCWV0tK6vU6OdjXv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5huWgKV/dm6bFrtHhb+BTO3n/5WQMQRDHqMOU0DfwE+p1bwceKhS4s9HVs8voFcxijQxhVbm4InHKn8is2rxjYhgjuA+ZCSoXmx8c52Rfn9eIjJr1Qf7yD1/JQw9br7bEYQBk5XTLwDo79Al8kTUUSvRotuO9OpXyq+/9ID5so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NITOPt+v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajX0Fno6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NITOPt+v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajX0Fno6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HC0Irx1853507
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 12:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRTy7m3So/X94mzU1zPkSfnnEoWD8/O+poGSv7zNk8g=; b=NITOPt+vi/kcel29
	ZME2jUz8gizGO9Mr5LqfSaccVNmQ/o3x/cwcf05Yq0reFKaVVLIuFEHTCDV58Bps
	4K38QyCNuYs7fb0hHW028Au59HGYeqznB9Z/zaJFb9bVwAwV97px862p0sfuEboi
	8NECFmiRpx/Ugbx0tTf0wYzs0aqF8H3C2yAyP4GRzkoYRhaH1vC5ZbP/axjTdrJR
	ucCUQHfeRmt3cTUbOezxTqItvku0Gm4ECNAdxBgY+rHHuSJuKMKNxpo03OlSFlhs
	zoEauNwJMAdkHZXAEeaGnie9TFyLR3zgywkQqJfr+QDNwM7Zn5JI/LEvwutlEZjX
	FuVHoQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu400t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 12:05:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6fed0652bso11020365ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646713; x=1790251513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRTy7m3So/X94mzU1zPkSfnnEoWD8/O+poGSv7zNk8g=;
        b=ajX0Fno6QBrLL2fkfhmHlhwgZGKlmXl3D9aiartKmZqgYVxiP+kR2tLflw8R7T6KH9
         cjDikIFFign0IIbc5yC7iK6nvZPUavyU2aDHbUgO32YqnjNQj6mL5GlttKk8qOEPzEYu
         VcpbobnPKomvR44pu3IbooLgO9Ta/Fyeyw3insXgfBxgQczAqE3IZsMoZhmm7uoCBNbc
         xnG4LsUlgVt1vdEqnRHnwIu5fylvyNjTXzAvbiJp6Vp9rQGSFFPg6UAxRGkoXFPvj/S2
         WGU+mgKAEuUJu0wrYOBuHb7MegcR5GYfFCrtTyzc16RumBCCkd0SM8q5Mhdsjb9IBh04
         WnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646713; x=1790251513;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRTy7m3So/X94mzU1zPkSfnnEoWD8/O+poGSv7zNk8g=;
        b=PliQ2aq451wxDsPZbeLYcxJjsnKDSZNX+e4mEtYiRXnlSxrNv2JeW3raU/VqDFHIS5
         lOSoCWnc9wpFQW5x7YxcpWmwNS/RvOsFzLakxL33KiZsYHAbvIbxSNeIlqxZBZ/88UAA
         b5UokapTiVRUBYanJ+430nT83mMWGUhbFNY/z09JBMjhBHEPtB8EWXIy0LS6vRzYGJuT
         V0kjepfWq/4hPCUmitkZrfDQgMm/v87YuuO+YS9DPDs8wRMCQELwYCnFG4nVOaZ7xvqL
         BFshtsQ3dYPr0OtlN35+2N1to4MYV7xxXMYv8PMnSz7uEAkZTLB3GMKn5jLB7qzUp+NS
         /C8Q==
X-Forwarded-Encrypted: i=1; AKwUvByYSFQvg168tHhy/Ti23WmKr9pwPr7ZBe+LqJ0frpMTZIR8nYv5b98BdfkAViFFKiaTwF0XpzG1MH2d@vger.kernel.org
X-Gm-Message-State: AFuF++nIN70Zcz22dOd8G/6UYqRuwFBe+dpN1mZrYYC78GHLqsRjKnEG
	n+hcBr/V4HJ1bFOLPdxFRze9Lxt90ReVFsCDLbcfrxB7d2LYMLUEaLLwKsmIe4Zf9L08lUbVHet
	l68Gc2HHdznRM9En8VY7Sy1qfKNq3ZtjuCSbEj+norDJZNBKJ9IasGnvR4dNLZH4l
X-Gm-Gg: AYBFou23Sx/wZ51ygPmxVkMvjmeqjNrS560djShjfLbkJ4/SKEFF+X1FZSV976TCFej
	FtLHfRLNukJOnv7nm5wpQlg4oUFIBaKUbpSZ2yv1f4pviWOHYqueTTVjplt11GLWU/oMcTnQ5DQ
	8PuR+CC84nQpf5CkUrpUNoJo56+lEGP+NmUNokRzdvYnaqlf/ZpRKgX7qaRSEXpoTiJbqr0SVem
	w6FLOBf19JR91cxbWjNzqOoUkTgz0Vi54rrFISHH4FGALIBMVaoBQBv9a3ILF9q7KgbBVXa5Gsh
	hji60bG+iwwXPJooKjBNcad7G4zKTw6zLKinJtcSkaQ0v0OC9porskScS9iJk13KSWTGGk2C5nR
	+cRJJSUtcTfJMKE0tgfsy8Lwzjw==
X-Received: by 2002:a17:902:ec87:b0:2dd:ad74:ac26 with SMTP id d9443c01a7336-2ddad74ad8amr40775ad.24.1789646713576;
        Thu, 17 Sep 2026 05:05:13 -0700 (PDT)
X-Received: by 2002:a17:902:ec87:b0:2dd:ad74:ac26 with SMTP id d9443c01a7336-2ddad74ad8amr39205ad.24.1789646712588;
        Thu, 17 Sep 2026 05:05:12 -0700 (PDT)
Received: from [10.218.25.214] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89eb5618sm25348115ad.32.2026.09.17.05.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:05:11 -0700 (PDT)
Message-ID: <ed2cba23-5511-4787-8cb7-7c8207c21f25@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:35:07 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
 <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
 <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b_K1aakoDKvBlgQ4njlLfnPK0d9g28cL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX/XDyF7udRl7U
 Io0eL2BIN5oOxHIuLr7t6gt4G/5QbzluLOQAty9xq0tsovHDqez3tZAgMxIip8Inr14uZ35vanY
 HVY12+xDjX65LYJRop5s9x5tzZi8LqE=
X-Proofpoint-ORIG-GUID: b_K1aakoDKvBlgQ4njlLfnPK0d9g28cL
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aabd77a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Ck1oJWCqvmENqo9s2LQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfXzcQ1uPMNSXPR
 ovoDwihqcxWgBnOwo9rQm4b1fywtXD08iw7tCt3Mxw8m2ommIAaAbQokTjJPeECBSTDKavoa8RA
 s0NlYDATl7B4Edxu186kUR3z4pAoFZq16hXJoP5UasH1iM2LHjy2lK2w221xaDxGPfjoMnUEsy4
 H2Zj6LQggyyjSfVaVYe3bvIhXsExxBkORmzywd5O8L15nMiEjENrx/PaQBjkxynSEbA7R5fBs2R
 FxIL94E8/gAA9j2WbGOv+6sjXLjhOj1P64eupSt6hWHy6emDu2rNfsmV81S+jS9dlLhcLUYoJ+M
 pLNFvK2efcArFvBMhPhRq73YQNabnRm/HV119dQz+vctygBpUq4csOMEsrtfKXtclhwqgOP7H83
 6l0F3d6FYijJ4rW7F1YMtKVM9TbT9meMuywfc3POxa0+oODpsAME6hQZBWOY9sttfsWGqTE6+al
 47zAlAXEoWiwJUgrkqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170169



On 9/8/2026 6:32 PM, Konrad Dybcio wrote:
> Also, it looks like the data you provided here is a subset of
> pinctrl-sdm670-lpass-lpi.c - is there a chance that the block is directly
> copy-pasted between these SoCs? Are the extra functions present on 670 also
> present on QCS615?

Hi Konrad,

As you suggested we tried pinctrl-sdm670-lpass-lpi.c on QCS615 and it 
works fine, the alternate functions seem to be similar between sdm670 
and QCS615, we will use the existing pinctrl driver and post the dts and 
machine driver changes for the same.

Thanks and regards,
Karthik S
