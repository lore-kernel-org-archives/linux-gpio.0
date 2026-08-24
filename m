Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E193E556C
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561067; cv=none; b=reo/V++JRGnL/u7Wf7toBJrIrOz5btA0li2Y3URHWe9yLzqyegrFKOZxu+KH+bNr9n3RQYL64kJ9/pasQSWmPsNuyyXws0+PTyZy0ZNsmz3gNsOcyFAIGmcB11L6nqRbbXjIOW4InW6XiAH22nCv/i0FgDxaA/+R6Fg7ADQIygQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561067; c=relaxed/simple;
	bh=8LDC1fIZw0VxIOIyC0NqqLsIOXCsh1QsQbMQUEg97ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgqrdpmKeua0YPEgzVoGG+EoswiaKjMSdPU2O8IaUdZNTyy1UITm7+fcG4VIp2Eba/PQf1Rrvtst9EAcCzftvLuyWDbK9LXKEr7uz1KsanbSEUGAib0HFQ72W4bdhklrPeQWXWZazNE9Lmt04DBg5AU4QGu+W1hOB7GV6gh3pR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0rP1khS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Is08U2Gz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0rP1khS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Is08U2Gz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RFRt3067007
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 08:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRC9/nnQFMJjzCuQLMerdD5jbZ2DoD+xn4FWz1VE4JU=; b=U0rP1khSVvAPRnwE
	xK6VLxvFpoygXy72UCylJkNiHNsQFo8nymrX5leovkgjM7NCE82lca3/TdpIP4aE
	v7K027GBXgoLk0nYuzzL76XufILLmW1Fe2CaatawxuouTfWMlZya26qKqfwSyVBY
	1tDcTgyBtRQVJ3hr1B4mUcbp9yxG5nV6X2+zAZ0k7WcYkdVDbzgVQROnUjDjiTOF
	bGX4YmTH2LvQ+ipWenP/IGPQrAeOYAHPHOL+FUsyTVHm26u0GrnzltYhKv3Zu8oX
	/lckpaPy2YxSqYvKcsCIwSqKFMVAcbMcIV1bOrBkXZrtkRQ0l+kmcvN2hxjvx3eC
	lYzYZg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jphqw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 08:44:24 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737c728b37fso73304137.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 01:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561063; x=1788165863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRC9/nnQFMJjzCuQLMerdD5jbZ2DoD+xn4FWz1VE4JU=;
        b=Is08U2GzVRuYm4Fdnx1PsFNBjICmeDTaR/LdVKe9mXnH20dchYTTjDhQMPA261WsLH
         wz/EkEejUrcFeKpQ6OtOdhaDaMcUnDUA1lmK8jCrat3v9gOGlNDNTL5hH96jlqC8H2BI
         Hc7OX2ejNezRsxKlL8CFTlqDpVEULT6Q1Sk72cTmjbEuIUP5otcYEtPJtCD6t9zfcFLX
         mjvHCYW58uTT7kD37myhPrbeN1zUO1CFIPwz6gRT5smeTo5Y9muRMImVT3rnEMRIB1rP
         6kN1oeIkMctVzlUh9bG9Et1/aGeGtBlmQ1u3/2Egd3UogcJaH7/FcLdD/ogpWGhbsyFW
         CHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561063; x=1788165863;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRC9/nnQFMJjzCuQLMerdD5jbZ2DoD+xn4FWz1VE4JU=;
        b=MZbSZ6iBT9UnbUYDbMEcVUyiB9u2g353J45Oj/XLnTn3A6VLppv4cYaWSE3IIVzVqS
         ItWrt2QRUjaNDNmLMAbc1Hgd825E4WZ1hT5wdRIV3DCuLYcrZ+JrKQEEierJ2LRZhHOC
         SWwwKJqGTSBTkmKKWr47ER59p87vyIgbmeQmO6px0Ob8QwujosB6F4pMfySAEJh8wBzF
         hv2ZYe/jJbjaPWAKuFVSyzCLN8V6FaMZ51gYUyyF2drILBvBLBMa3YdNfjGOOoxYthn/
         Fe2OrYUhzkXZqv1wQv1qFMJcHk9vn0exvtA4K+aQo+Jymmbi3cuV6xb3WHTFZWNxGcPm
         r2sA==
X-Forwarded-Encrypted: i=1; AHgh+RpWKodl5HoolEaoiXVO9ftrXnQrD/F60TpZtJ5fgyO8XhMTDsOy8T8p/L5X767GGZEqUa8Zx/Y6EFZF@vger.kernel.org
X-Gm-Message-State: AFuF++knBcV3lo3sHh8yGBRAZijhjO1/VcncxeTJMKo/yPzYT53qVp4j
	w02Vto67EElW0TM6dSWy3P/jZK2DV7NgT5pLjdj7YxKe5gVd6u7BQuV4WcfKrppa85qCvuWZEjo
	Ol/tqPMbx+2qaJZ2h+7Qqz7prTU0VmRSJoQ2UkMMVtFVGbsDaon0rwi0BFiXIhVUW
X-Gm-Gg: AR+sD10Uab/rFLEf7n46AbvgHcyvQR2xJk4i3Xi8YqBwrSAPQ2oHWPhKPqEUBKfX0Wi
	tyogICSC8bwH3zInDSlG7rGQb5Xc9np6JHm31PgCHkgtnDg8H+Q4iyLUUn7neMnH0d3l46+9oj+
	3GNMIR8+gFQwWIoKo1i0pRJEj9l1R6Sc4uNdsvGrn8rsRGUE0p7bWkHQmxt5j4nGSDfCTlYZzl/
	b5ktfGyNvxbkMr5J81eKGwvs56aPqs1+kb0jJMjZnHpHOCMZrKE1Aejs0KPSWJKVZ7oDMjfetIv
	39Je0gaDFm9SuFB5Ls+eiLH12Kkk0JoXIfCkOvrdyvqvaoT1PgD1va4cnvbhsjnAwwmdILe1WAK
	K9U6z8dIkDuc6jrT9XpXZ0wMZ
X-Received: by 2002:a05:6102:6893:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-77a6433632emr3272584137.1.1787561063291;
        Mon, 24 Aug 2026 01:44:23 -0700 (PDT)
X-Received: by 2002:a05:6102:6893:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-77a6433632emr3272574137.1.1787561062820;
        Mon, 24 Aug 2026 01:44:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e0190d3sm7562369a12.9.2026.08.24.01.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:44:22 -0700 (PDT)
Message-ID: <06acd175-0078-43ce-ae58-567005f62562@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:44:19 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair
 functions
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260819152356.904023-1-shengchao.guo@oss.qualcomm.com>
 <000076bd-b3fd-42dc-bd43-96ee9492a638@oss.qualcomm.com>
 <aoZVKWTtdCQSSvaH@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aoZVKWTtdCQSSvaH@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NiBTYWx0ZWRfXx3gmlz/pHR3r
 ORz/BHHX7avtU4fm0Q6Rbih9AhsXve/hpjObPEIhOcOnl7HDgn50AXb/wUGTixYcF9HC2L0j8Ha
 0ig/Mj+wAhfWqLfEN8ULXB6zCEgN4qzhBq/APqz21VZ1nrIAC5gHr78AZIKYzxe59+0OfkoTmLe
 FsoaGImRDT+A/XsuezidvtkA+v6PKOq+mWipVCOoI4/6imLzXtcZIIimrh65kJpycoIHnwqFxzA
 ljrftm5VT5gG+8CrMAtW6ydf0G+6pndPhKYRp+Mi5gt+K+YiwCD9q7rnvB3R8zCliGR21yDb5JC
 ERg/iHkq0sGFaOLdXFV++CrErbPqw6VfyLPXsoPwia1uxEVBgkLWzqXjWuThIwlAv5igVd1ytWR
 o+ZzrKcD5gaR5jlNIfsYOHYGgo7xPC07b3uwWVFz9p2uvtOa+PAZ+Ieph8VSWMUF/5mrCeRBc+e
 vjysfmn1lpSQ0dQzG6A==
X-Proofpoint-GUID: 7Y5_3a70L1tqA6o9uq1G9J_AWf6CldI8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NiBTYWx0ZWRfX5EnOxCR24Vok
 bPLA5mSQNeBDUWw/O9LWkyeR8OM8IuNpvpqN5L53YD3k8Rr56ydyFft4ifWi75DSzDuspA1+PjM
 sjAaLqFMIOaFfZRl5X2roB8ma0B4nTQ=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c0468 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=eCN_Hj2St81N8EpzqcMA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 7Y5_3a70L1tqA6o9uq1G9J_AWf6CldI8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240076

On 8/20/26 3:15 AM, Shawn Guo wrote:
> On Wed, Aug 19, 2026 at 05:27:34PM +0200, Konrad Dybcio wrote:
>> On 8/19/26 5:23 PM, Shawn Guo wrote:
>>> QUP1 SE2 and SE3 pack all four of their lanes pair-wise onto only two
>>> pins each: lanes 0/1 (I2C SDA/SCL) at mux value 2 and lanes 2/3 (UART
>>> TX/RX) at mux value 1, on gpio127/gpio128 and gpio129/gpio130
>>> respectively.
>>
>> [...]
>>
>>> +	msm_mux_qup1_se2_01,
>>
>> other drivers where this is necessary stick an 'l' before the
>> lane indices, e.g. se2_l2, let's keep this 
> 
> I can see that for single lane function. But for lane-pair function,
> it's not a new thing with nord, and the naming convention seems to be
> without 'l', based on what I see from shikra, eliza, hawi and maili
> drivers.

Hm, seems like that happened by oversight, but yeah let's stick to it
now.

>> The bindings change must be separate
> 
> I understand that's mandatory for new feature changes, but for such
> a bug fix where both binding and driver changes are closely coupled,
> it seems more reasonable to not split.

Up to brgl

Konrad
