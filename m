Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249344A207E
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048487; cv=none; b=YtQwf4rXxCvd06L2ucsyz8tUgUQpYX8ArAHSaPgFKKLpM44GJ92IU1qHwAI5f2uCbOGqya9uHBqdel8MOoRVUbDgPDL967SCHoPU8lHCXZ3V+L4tvL++hrsVs2ooADdMKcLQ0p39NAtLqVtQfzLdmA1ExBJvK+Q3JbiChKX57eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048487; c=relaxed/simple;
	bh=uko67U/o+/uE1QxwkAOnARE2HDN0VUWZgA6HGN5aKVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJBU4ja6p4wpx8t6wv8yZ42s2dazkR69YelVZYZ4+xBJBnCMaPOUyUvzijiwUwzJl44lYwDh7H7Xnx8H4dmKAnS6cKQaVloWQh661xjCM7DTlpbfptVi4RENLJg8KBVS/po+hA8tGEFi+WB+6soH5Vd+koQoqP0Jvqxqe8WlGiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTD9IyRa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmdoeNGx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTD9IyRa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmdoeNGx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6mESt586467
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	US4YUTXOt7NO/nrwbDxwGiM/cowbEz+uGqtDsmS+LQA=; b=CTD9IyRazc3AEoBL
	FWTpki+wdfWOWtwGXQbVlwKeTCzDT1PUHWMwd//DAIBTtTeoJm5c28k6RR6cpLBa
	a+xDsTUtEiZ1o8S8nhzp/vQXfOsKBubqQvgkEgDatB/TtRTAemnRUGPgetouy9en
	ttgJFvPR0Zn2j3tbogHMTOhQGDIA8HB8vn0fhqYHKUI4BFakGuRTYRpdaQfSwqR7
	CQ+99kXf5cTyn1Uk9tqSEbfdLSmVz0r/CNsfX0iRY9FHCVEpLWA6UvxdUzswWgfQ
	EPQKlU+uX7rEz+r6UG1CGF4tqb9Ju8yHGwSz5N3F16zalFwOi2l9btbBWohWN8T2
	Xdf1TQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdesgba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:14:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso7503782eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 00:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048469; x=1792653269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=US4YUTXOt7NO/nrwbDxwGiM/cowbEz+uGqtDsmS+LQA=;
        b=bmdoeNGxNRtbjnHwhfgd83lQMCcmZv+J36UPT0BXN/LaSPodBgGjXPWjDkcnt3IamE
         ggv5Yeg+Vp9Ugd15QdS+Y7vSZMAyYTHpX3tdUz+4X45ovPX6KIuVut7kufSDjDOjqF+d
         FqprNTZFMvuKpyxgiN5gRncGWY3dbH2dcE33CMVhgNDFwLo13r1A2/e9UMHNhyEpNexc
         dR9sp91xNh7dEttB+konaE+St4gybOpWZyl7nRiDdJ+uUQFCsZ6ReEA2ZbAKpiAZFI3c
         aGs1BDEqc9PQdBN1KIcNpcOmDatwTJUaP19phUNJg/ySPJgEREl0fLW0SfN2Hnq7ktzo
         srkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048469; x=1792653269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=US4YUTXOt7NO/nrwbDxwGiM/cowbEz+uGqtDsmS+LQA=;
        b=g/t1dsF04mmpc/+tuKEjsmzCfkiHTiwZc/TXnhZmCaclCbru4WcIhMmSdu8eSE/I1O
         4DQICRwXdDeuBpmdq8zY4iW3KTCDCg9NqrIHlJaVSPC/UFqb6uqjIW8oxLBlFwmdIwd9
         EQrFgviRQDz9Ppr9V/Z+7ABxZLyXfUrQyrCQr9Lvxaz33UAtbmI+F6oBDU8uPlhNWxw/
         j/w2AclCpo+3lbpmGdE5o9yYDUrsmFo+dnAmHsysWQ+Unrv8fxSYPT/9vkqgzWittXZL
         urMmTZFQs9v4ZtPwMx2tv7R8vDNFM/EQJt8aVyTXdbVwAvDxdeXYc+YituqcmrGB7s9X
         YBNg==
X-Forwarded-Encrypted: i=1; AKwUvBxgEOQTdV3XoynQY9INsKQCTNhriHJb9Rfly31GxlUXZGLb7Q2mIdHFjcyxZYP7N0T3RUj8ZZhs/jc1@vger.kernel.org
X-Gm-Message-State: AFq9FYLv+3G55HkzC/O6DRmTTNL6DCiQzTItyK5D8SQX1lDN9dXFndWh
	cICn+0nQHqQ0O2eVwRPApI5pCcKCZIqtN8CJDsbecCXkYPAmSf/ZQytvZ2iwWS2B5yWalKeEUB3
	XGYegUk15YC83ZYI1EaEyymkre4SBbyN+Qc1uYh8H/AVxAnV3/VBS2ndsJbJPivQ1
X-Gm-Gg: AYBFou3qF3ZL5gJa5T5AS6nAtgZf3o2NM0BCNnbcrgM7SahfD9Zzr9WGoGLj7W9aRot
	tr8WvjGL2l6mmEWMItUf+DoslZkVKUYErw/yvGSvFY2i57jGsO/aFiZTNY37UexsJPRvfw5jQey
	eF5xin+McYHRAp70MCVWaF8EpdoxUSkGKbSOodRcATPjIo1YeUXYqdOWft5nuAjdMc9qnJfoufk
	ObwI5DGjUZlVItVUHhHqh8fcGL12wjkvYwLzdgLX3huelTQy7NbbHSAnR/1JApGjZyLNhS4KKSY
	uRtc8igilK1OiCUfwxR4we5YDkdTR/jJdqLgrJTP81+llab11UQm0Qx5b4FSKlvj2Kvlcvcsrox
	UuE37k/3M2zkckM8J2b+yWb7mp48=
X-Received: by 2002:a05:7301:71a4:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-35a4ae61ed4mr16226406eec.22.1792048469322;
        Thu, 15 Oct 2026 00:14:29 -0700 (PDT)
X-Received: by 2002:a05:7301:71a4:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-35a4ae61ed4mr16226373eec.22.1792048468803;
        Thu, 15 Oct 2026 00:14:28 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm14059954eec.25.2026.10.15.00.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:14:25 -0700 (PDT)
Message-ID: <0cb8005e-964c-43e2-8e9d-4e955cf2ff90@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:44:17 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
 <CAD++jLnqCipTxkOhiwQhKFymOxu1HOTbHzLbNrGTOkCO33y8Vg@mail.gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <CAD++jLnqCipTxkOhiwQhKFymOxu1HOTbHzLbNrGTOkCO33y8Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad07d56 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xfIMX-YVTLGOWNOYmacA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: YZHniAj3lgLFCVt4FmzMpiJSXc1mdxUL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX79Gu8In/Ij7c
 WutjuQ44fDm4wqu3NdjcWGR1sDfr5e24ERE+ANR8SnpU2QraNguW8fUrCzZigSMdOeHhgjRDpNa
 nf9cahHTAEsNTIB0602z8HGKblPyQXHWz4Wgznj4oqSoqhlCI5q/ZBWz9dxgeM64ffw6LbEq0cS
 V72v8B4+97f448GXvicXFI1zEAgVmo2Ha0xxRHK5IYQjyXs3B43fhkByd2KfeVOeFrdh0LEtYGy
 BO2C27wg1nZZJJCmYJBML5sMEWvVxPmJxPCiad3qevWvW5l0DzFa9lkJj8OuRyGgG56a4AbiHfw
 t3bwdrMgpMEvjBTQkDuUM/mkN4kX0ameA4Y+lVk5q6LCZV0elLobXnALko0JeCHCEc0CC9NKXnk
 fkQ5ZYHjDm8781XX+XIbutH9Gz06IjzrC5LXM0Gx08Rt/lfhnpJajC8oqsT+HeqPUqJOEpctVSj
 tvEmK5ETuEdb9MwreEg==
X-Proofpoint-GUID: YZHniAj3lgLFCVt4FmzMpiJSXc1mdxUL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX6PhDHDnmiUb3
 2tu3B1PUjg/4Df8ReokexiML+rQ4xZpNO0UCe0bDycB1fdW65NEMj8kmhKqLqlXGPjy7qJzuWgV
 H4tcZJRLT/0NM3pPv8C4yD5BRACdwf8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150028



On 6/9/2026 4:13 AM, Linus Walleij wrote:
> On Tue, Jun 2, 2026 at 5:22 PM Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> 
>> Add the gp_mn pin mux function to the TLMM pin controllers for the
>> QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
>> divider clock output on a dedicated GPIO pin, allowing the clock signal
>> to be routed externally.
>>
>> - QCS8300: gpio32
>> - SA8775P: gpio35
>> - SC7280:  gpio60
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> This looks all right and no-one is saying anything about it, should
> I just apply this one patch to the pin control tree? It doesn't seem
> to have any dependencies.
> 
Linus Walleij, sorry for the late response. I will split the patches as
per comments from Konrad.

-- 
Thanks,
Taniya Das

