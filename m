Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A62339380
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 17:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786383078; cv=none; b=K+oAEzEibr71it8QB/yQSZKiVLkH68q8PlGxwJ72GkY4DaQHeR00K89CrF6t7d4Njo+WnSilLDugQ2ydV4bNqBMKjQIg2+si7Up8nYl+LSBUALQaZnvV7XBSDRrAyvPo80ichapThZuYOU2Zfu5hYcaKpCaZBTXWSakfm3FypLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786383078; c=relaxed/simple;
	bh=IZX1+SWX/38lynA+Ft3i1yBNu3zeX6ISAfIUOjB7vXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZM+NS8gBgWzLTBMcXnnmEsS51V+sBHxg/NAnE2fDSEVdq/gv/Poar6XJgvt6s3/2r4ojS27zATb0hjMG68MDzLIJSEvwvCPNSO8uEF3gvtggpF0NV0uwETbtqW3ku/NKvolhXfNt8w0Ww06P+5s+f/YkGV2+24jCrjAwa3RAiUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TwrA6c7C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aA0rysVI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TwrA6c7C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aA0rysVI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AHLO1q2589179
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 17:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZ442TsvKUAi0vjPM+nquBFrlm7N1BsFublDEWJ8e3k=; b=TwrA6c7C0Yk3jZG9
	OVdVPcWJbkOjrJsr3dcIRy3Kwss71Md+2Hihvg0xw/cQRwbnpLpw2XuTuGoLaKGj
	U8KtTXZowQ8YizSGjs/qVJaRtj0Ke+99IVONL3/S/dXjC696sNPwwC5EThBFIxus
	4CqO0o8eAyvVi2wAKoxfUY9/pKzx56VhV6DkAHAY6hTtfYHw1I9ntGyEj52KAMC7
	LeuR+Q5cItwCINvmvlFl33epRDBRB/i+JEFAZh6LP1gNaSXzL2ucMrA1dDykr4nc
	mSkfQoLT/BUmO0up0wYXVL4b94iagvt0FE+1JjJWH/DU5VpDcO8Fgatb0k0VPMJo
	T19Nhg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfr28w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 17:31:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so3518799a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786383075; x=1786987875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZ442TsvKUAi0vjPM+nquBFrlm7N1BsFublDEWJ8e3k=;
        b=aA0rysVILF29VUj2K0qecZfUjcdds8RcSSAiFfUq1qLSMwDT5iH45SHTYyAc9wJ2KG
         5aqfuCEyY1GRAV2IhGl10o4aQhzFGd84byn8NWYqgwL6Aw/hF7PiRgv/sR+DXSDbeKKU
         sOnN6aRmmkK8KnJK7qxGxI5Um5lQ1Cqij7EUr2u2sTcdeQ6b3h95aMfBArRA+oPLKHQE
         hKEWUvFQbaw8AAEs1sbc6tGsWXuwREdqg3oE0Jy+ovwOA9wVtQJeUr8KwFGPhK8DD3xx
         HjFLYNPg20pjBnkMRy1w06YHnl7vRuLdMN6GUMTiLBEo1hDjO3KvGP7c5xrM7yB0lAf+
         7lsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786383075; x=1786987875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZ442TsvKUAi0vjPM+nquBFrlm7N1BsFublDEWJ8e3k=;
        b=o49WQ0DxGWyClgm8nv09UcRt+6LWaud66ujSkTJRdaPa8z31m93NZZs3O8zwSRtaT9
         2rMgTP+zWNcsVVghYLGe27WaWisrVdEXiK7v07+wuBx92vMOD1NAk1Ccq7EiwuSS/Juu
         DQj3JWmNt9bHaxMlwSK0SxfC52gIVkNRkcUgdLv+qFQMgmOXR/3HOCC20T89ts76lQXN
         4IQbnHC6xYc3iV7/ER+SvZmRbOLq1jseXgN63W826yUTBzEIhNnha6TkGG+CCwhs299v
         OwtUrKig99PCzlVvtB3KhHnexvJv15H+6h3ShADc0vcHJIyRiyn+MGkqSC7t+AQj4R65
         Uqcw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2USqQVlUCfIOIeK29W3NBm4IpYWhoS5sEsECZjpCPkZ3HZgTEbGiqWkjeKAkQMHbI9U4IUjxwTcwQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwwA1s0aLML+wwik13M2VrKTWSJ9khw09s3fNBco52tKhS1CL1/
	7jMf4WIlmfpnLgPIi4pMa3qB1OqFyXU1e2HwgM7U2mtPq66C5K+3FiMhLehKEGz23/CjaB/6G6g
	flNnUC4kd/m41RJpIxdomIjANtqX9Z6/4wN1oD8/1mjXNzDqrget5eIJZbQqpD1QbUS6xjZ2Q
X-Gm-Gg: AR+sD11xSkytW0SucyH8Bw46tjOvrx+LpZfpAGdo+y8F49gJAWHBdnE+/IABzwtz4Qg
	4QMt4F+uC1b13Tsjdq+oA006G4WpnFRnT0eLq766Gbpy2ALqYkA0+jFwurVeRZbE73NPU25tdxF
	lUSqrIXL8cnG7JftcAHJFL9PCSIMQ/earjcIqgxPXJur16Wdoh0sc0o3MISb/EfuZ9W+5TFAiI0
	/7l1pjbKj6i6Gn6jt2ppkeRNT/TIquCy4htW/itsOdBBcxqId2NeRW7Q6pJ6sMyI7bEAFcwwuT3
	cZd1fs6n2tnLAkh5Cujl5VKicUOhjH0+tegxVJZPRbMwKI1FWNpT+A0Np1eFzEa4hCZ88YIOfU+
	tGr9z97HE5AG7+6smWtQE+8J+SMl5dOQJ1r4f91xsZVdcow==
X-Received: by 2002:a05:6a20:6a1c:b0:3c3:64cc:311a with SMTP id adf61e73a8af0-3cc1a35392bmr3923886637.22.1786383075112;
        Mon, 10 Aug 2026 10:31:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a1c:b0:3c3:64cc:311a with SMTP id adf61e73a8af0-3cc1a35392bmr3923808637.22.1786383074568;
        Mon, 10 Aug 2026 10:31:14 -0700 (PDT)
Received: from [10.177.239.142] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f198d44sm4381373a12.5.2026.08.10.10.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 10:31:14 -0700 (PDT)
Message-ID: <845345b5-bdc2-4f3a-91c1-b457059ed063@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 10:31:12 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpio: gpio-by-pinctrl: Apply initial value in
 direction output wrapper
To: Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>,
        AKASHI Takahiro <takahiro.akashi@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260724-gpio-pinctrl-output-set-val-v2-1-cad55d025636@oss.qualcomm.com>
 <178515087648.51358.11576417960376426909.b4-ty@oss.qualcomm.com>
 <anUDvrtSPm_wuBWK@ashevche-desk.local>
 <CAMRc=MeLUhxzbQuVONj4dESPD98Sx-+yx7jjuNpovLaPazyj=g@mail.gmail.com>
Content-Language: en-US
From: Alex Tran <alex.tran@oss.qualcomm.com>
In-Reply-To: <CAMRc=MeLUhxzbQuVONj4dESPD98Sx-+yx7jjuNpovLaPazyj=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: N3K-mjdGp8_G_XxlCB4iarR9s9TCViQ8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE1MCBTYWx0ZWRfX3hHcDY0jL+zr
 J5jXdvZPgDMD5vN9UeNzSvy+WFVIuZvP5bPCIwYiyNokexLZN3evDsImWyR89m1Fpar+fjYiG1T
 ZtXdNBnwltOzcvmCmo3JJE1nHQBJi1M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE1MCBTYWx0ZWRfXxxx8fVabO3mD
 iXVsMBPKfQEBLgQj4PN0QDx7ELdGBZhHyKfrp/tVAoqyJpMoUvmSOuX459TXs0RFNwnTNHUAwvc
 xBmoy8Dh67ujnXdbLi6df1OEedvYi7JCGFDMGdWW3eOLm5pTuvYY4V6HsxRqRrlDLAr3L0zSSmc
 66TYBEl2RHuShmnwjkARMs2UwpOTvfEasXaRUA5TT6vRqmWXL0GRVyjH/ksvxbhVwvV6PkfGo1i
 hG+UYts/ehxc0SnZD+iV4mQ7u/4SbrNlVlWOZTpYO6AuYshbynQFetJcKbHTg56C5FxiDqVL7nD
 g7alog0VyzYIRlMmbl5ljRqHwhMcnzGouyHDhXMU9QcmbLN1MRyYzTlkWnkDRLizTec5y1Hv5MH
 e9KVimIbZp3P7Fb6s1yHWplxSZFVVd9XFTdIW9EjYUjRJpZbIh2QVCqjcOwec16CmokDO4g6dUo
 n7eXCUDRcMyg3y21HGA==
X-Proofpoint-GUID: N3K-mjdGp8_G_XxlCB4iarR9s9TCViQ8
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7a0ae4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=F6Umm1qMrcHPkzVxivsA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_04,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100150

On 8/10/2026 3:41 AM, Bartosz Golaszewski wrote:

> On Thu, 6 Aug 2026 23:59:26 +0200, Andy Shevchenko
> <andriy.shevchenko@intel.com> said:
>> On Mon, Jul 27, 2026 at 01:14:40PM +0200, Bartosz Golaszewski wrote:
>>> On Fri, 24 Jul 2026 09:42:28 -0700, Alex Tran wrote:
>>>> After successfully configuring gpio pin as output, set the
>>>> requested initial output value via the existing gpio set
>>>> wrapper, so that the pin is not left at its previous level.
>>> Applied, thanks!
>>>
>>> [1/1] gpio: gpio-by-pinctrl: Apply initial value in direction output wrapper
>>>       https://git.kernel.org/brgl/c/67ff4bf723c8bd1f1b10450fa3e8f55762418104
>> Thanks, but see my comment.
>>
>> --
>> With Best Regards,
>> Andy Shevchenko
>>
>>
>>
> Sorry, I was on vacation. Alex: can you please look into Andy's comment?
>
> Thanks,
> Bartosz

Sure, I'll address the ordering issue Andy raised.

Alex
