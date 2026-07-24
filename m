Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC3E4418CC
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 16:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911111; cv=none; b=SdmdDvtVQ4fOPd0AZDkxPxnCBAE5go+l4PEa7ShZ6upGPHvFCxh2V2tz+fCJuv8hGU2B6Kgjn0GrJ919M7NUvRb9e5hIVCBs5jq2S0hyBDg6idnNiTPe0qU7ez2SZQKDua9kbQ8xBw+an1M31E/N2+bct9AX6iINsW4fTRp1gYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911111; c=relaxed/simple;
	bh=/eYLkmFpm1VZqXRSyDwQPpI1ciU9MFAex20jIHDOTMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9gdIj3nCuGLXswSX9lhtWTJZd9lg2GkvJ53JDLcngwszRmoONzkZr7A/jTCXUwCL8nBvySQPNBeXsGklObEnYBC+jOh+JVHauIacWIFwTxPTgnM830gx5dXbyesrrvDyaB0xYfmlb/OY660M64tjucowEr6O+XV9QSzdg8cGQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MM2VKFkt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvVdJzKI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MM2VKFkt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvVdJzKI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODb8vH3344393
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 16:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/eYLkmFpm1VZqXRSyDwQPpI1ciU9MFAex20jIHDOTMQ=; b=MM2VKFktvlveA2i2
	8Fyx2Jkv0mGZoM4vbaLoNfvHQPM9ORS2hA60hmmM7vlheR6szmWkOK8l971oLNRM
	GTBei3tyMYGVjSZ8dJ8ejLebCEYpPB6sQjWF/DRu/ffMGFcVKIHIkYcigdzHGelz
	i+bwtf9RwSE/Gse0FoqbmhJADnbhI5MnOPzqRZmKWpXKAMIQaY7yR6zS2wCkmfPz
	wBBv9vYm8gYsx8DuyRHBWw722fEqfp7Mg62spfk8Qrvjas/9YIimQ5PVSqkKGEVY
	IaN7CvM+iham6B94LpadD5hwY848UEkZib37eTaXm730xOeGV1VO/GS4YDNKH9rt
	AUaySg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf0vd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 16:38:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7131849bso763207a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 09:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784911109; x=1785515909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eYLkmFpm1VZqXRSyDwQPpI1ciU9MFAex20jIHDOTMQ=;
        b=PvVdJzKIQbD1Qn4+cSBcHwbcA0EgPdr/iv0xLS8GhTEsiLMU4sPnhmBPI9Jy+/jUT0
         SUzmqUK/W7MYE/bfOb1bj7cnmDZO8fvEGwQ6mqwRHWgc9Adfa8rdV5/aX6na98pKiO9j
         xUn5/YGlvLGgPjMIOTwQ+s3B1LQImLa6Qyc5R1EO44HLaHhrkmWQg80on+Drqr/pizWt
         xwL4/0+pqWSdi20fDAEagpgJzVV+R6NGTu2IBYAKO8N1KDKKFKLVUKfaihH6XLk9rygB
         DaL2KOPWNhxNbS5Bm+aFSypFJg2tZyEs1V+3ciKn9FqDGYJdXQgswqMzL49l0uegfmWk
         yb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911109; x=1785515909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eYLkmFpm1VZqXRSyDwQPpI1ciU9MFAex20jIHDOTMQ=;
        b=XTIl6sF7O4wfPJxT8m0gJzXANevKPhQqHoTIQwhKs7nNXCNxZOWH5f7UVE/uVY4uWl
         fxwvmOwdrl/9TzUO5asJ+2jqRgkFjPMpL35TRvEDQ5snobkTMGfR5CH3pzuj3bIgbzdc
         NV+ks40tx8H4aq2jlbE/L/e69RCEYuwcL2Ujps1yjCAYPRWsdWu/eOGTC52iAAykRqKY
         6cVxW4bgxIbLC45S42TKrI3YsWDSqfmXUMo6I3hZa+Y2YIrR7iPgO4cRHS5TuQtffKWv
         AFOsO/vHI10YMbcqRIWxqy2vg+hy79K8jKMhW06OKq8E1lFHXBnl4ylvsuy17qjVYE18
         hqyg==
X-Gm-Message-State: AOJu0YyVyO9HUPcW4bi8ioaF0U7+4I1VGGK0V0ClIzyCKPp+hnIzKSQ2
	RE9kQ/P2Sc6PpdhMzeYowpeOleZU2/neAtZSrQw9kXiCPyeOb1NFzXOjeZ+tLqgBPi66Jj8UAwF
	39AnrtQlAxFoB9amsx3YtMSI5Zo+eRK8SjfuaqiHOnvx5KUYfqCV/sjVJ0N1NFth6f9zx8Apt
X-Gm-Gg: AR+sD10on1jWFgyOyeBSoL8VvbsVOSAKqTeHHjAvO73lqSEhREEu2Lu8cPvaEpZLl21
	JVvdem/Y83MVIpqnSzxlcISzYtPKLw2pxqRQmgupHcUEG+jvBEW7dbLe2/6wbXatkZAltx/U5fw
	3qBFk/CUx7zQlniIKHOYk6Y7lczAXvPgNas7PWOeJoAopxB1RL+hqwKACOb57MEKS4uGJ9ygvvV
	SFBqIASkr0QpRUFu+02Ss/cXECp+D4TkoEAyUv5Gect+IfKW+xnl4IPE+K3eq/XZm49lXBDxsmV
	h4KltlYR2ZnDQS/756AyV+jnMWzTv8mrtJ7DjQpEAabOYK3MnSechZJUe+buYJqz2wVg4R3Km2m
	77UAC3h98K/cIffUJ4TwdCg3lIxFXVDk4NBs89ch/3EU=
X-Received: by 2002:a17:90b:1802:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-38ec6a515admr7861855a91.23.1784911108640;
        Fri, 24 Jul 2026 09:38:28 -0700 (PDT)
X-Received: by 2002:a17:90b:1802:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-38ec6a515admr7861829a91.23.1784911108172;
        Fri, 24 Jul 2026 09:38:28 -0700 (PDT)
Received: from [10.73.234.77] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm24919247c88.10.2026.07.24.09.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 09:38:27 -0700 (PDT)
Message-ID: <56a1a60b-2fe0-4306-9781-78607e057321@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 09:38:26 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: gpio-by-pinctrl: Apply initial value in direction
 output wrapper
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linusw@kernel.org>
References: <20260723-gpio-pinctrl-output-set-val-v1-1-ed4477dcd3e1@oss.qualcomm.com>
 <CAMRc=MczQePGDj4mzw2ZewPPb+T7kUqJMYu4gmrf=HboVEo2FQ@mail.gmail.com>
Content-Language: en-US
From: Alex Tran <alex.tran@oss.qualcomm.com>
In-Reply-To: <CAMRc=MczQePGDj4mzw2ZewPPb+T7kUqJMYu4gmrf=HboVEo2FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0OSBTYWx0ZWRfX27JvH/V+6Mv7
 3lEM7PjNGDEqkQICxIUAup+5F9aPlIo50RqBbYtSrCf6OFiQKDvBlj4WxdvROIEkEt7FblhdUJ7
 gXNM/cCy20jyRi1g33uIWA41Rn1V+mg=
X-Proofpoint-GUID: -Y7oYyV1sFDyn9qHnFGQwZJSpb5Vyc-u
X-Proofpoint-ORIG-GUID: -Y7oYyV1sFDyn9qHnFGQwZJSpb5Vyc-u
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a639505 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=q_0hMSrs1U3c7WclS_QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0OSBTYWx0ZWRfXxZVjFqFH2JXc
 /szlyWWv+1Zws6l9kMyqwR+ycn/QFXCpkkAGcPurycIscGaON6+5kj38Kd4FZf9RLCfxWlnJ4Dr
 qmA9FMZdLoDNGwsFQD0gu8kpsCbZi9EplQhfE18gpPTGEd1v075TEhxXZy8WfHQs1kO3Kwt95Ax
 kLClV7pCTH165wl49jfCfDCv66wXC5PbH8FyECCSs46CgLjw+XDg7w6t6EqiQMhzhLTVL7CwitD
 v+TrH8tHhI15EIRmz0mWNFxWfeUGpq3tmVDqk2MN8+EAJ+AylOzDd0hoeLgvT3VlQttpu+tYHRZ
 mn8fH0/vBv4rHbgbHeNuCn74QVJ44P06bxr0e6S06dOfz2Sga8D6wzytm83BS2zeB3bEaEAjjPZ
 OrwuTxvk6GHeuWAjahpQLGSJFrna7KkZJ/INaO1SdKBx3D/VLqozy1D4Gp/qeoocCLJv9jvenBG
 uuUuEWB0bZYs9fb3byQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240149

On 7/24/2026 12:43 AM, Bartosz Golaszewski wrote:

> On Thu, 23 Jul 2026 22:20:25 +0200, Alex Tran <alex.tran@oss.qualcomm.com> said:
>> After successfully configuring gpio pin as output, set the
>> requested initial output value via the existing gpio set
>> wrapper, so that the pin is not left at its previous level.
>>
>> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
>> ---
> Good catch, I'd like to backport it as a bug, can you add the Fixes tag?
>
> Bart

Sure I'll send in v2 with it added. 

Thanks,
Alex
