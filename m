Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936AE43CE54
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786444474; cv=none; b=IN0amvLb5OcsbiYDVY1lQ8MrItG6ABcZnSCuGtjwAZ7x3ZmsBZmB9frvH62NPiIgs1SfAqKpwMLxkyoF2jwN7mqkoqUec95dXw33btTVwO/BqoXhNrXxVDowS6DoMYoxs6ISL8SXVHsb/nfT8CmFzJ5Uf+Ol3EQwesm0swbbbAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786444474; c=relaxed/simple;
	bh=khlQxXBFoIYgGCKdLKHy/O6Ag9LzLbpRU1Mf1asnSLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hp07/f32ubMo5tufmp0GxW0H3oB0kKDBhQp2u3s7xDwagojH3S+WFa1IOT0hoQ3cOeCiVPfkn5Q42PAQGwRZZ+9CKMzSHBarSHrTzcHbqTmQmeaXevkGFd8dnwOL64sP3GYDYRssRIRJ+u8RwXLG0xn47neH6Jyo3XPUSwR2TUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHL7C/FA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrmIEfkn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHL7C/FA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrmIEfkn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BAMj1S3781064
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 10:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pX8gmMmDKg3afhYRts2RaqhPOxNS8pLkC/Y+vBXD8qU=; b=kHL7C/FAhKGInXCO
	zA3KOpoL1jYxsGz71CjF5j6uWbu02n6O38tEQp1ZcyNkVkB0zD8ljTGeGYgiy7Cw
	7y9wU+ofY5nqQrE41en095MaX6weRe0DVl2E4bPyDrVjBbqDo/DsIVbCTbQeAoP+
	VZzr6pcQx/2VyVShuYjMR46nBtyM5FPqXLzTbCLRbyc43hYTXxgc+wU9Q6NkftV9
	lK6Peguqszx/rCxk+DG9Ic4LZ0X6n0MJxe8+0FyETtGIOz245k5SksLmb7lwUMc1
	hGf95yZcZl15lfE9FGT1TrryvSPispZXkuPZ1UF7nOTLnc/jI8dVj/zrBLmufgRp
	68A9gg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk7bpys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 10:34:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so13849335ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 03:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786444467; x=1787049267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pX8gmMmDKg3afhYRts2RaqhPOxNS8pLkC/Y+vBXD8qU=;
        b=UrmIEfknFq1aLfzZDf1aGkY0QiiNMT37pNmT7HpKVtgf5SRW69JMyNFDC2W3dnc0Z4
         4CcJcqBJlZFHqR4fR2grAInyPdDUOVvOAjX9OzumqKp0kMu1XxyL5PNX2eRnEiIUqmEQ
         KmmC93oAfXjaFlXM6WlzyqsFZB6r89HIurpmhhRCGf4WdVtPJZhVcAE8Z2GFQQXpx5O8
         bout68ADxNBaE1JtZaHIXtnQMEuZWZBNbpiIpW3N2oRD/Z7y++WszJ6+18GX5ldNJ3Tq
         4WObu04RYGRYra5oD53RdCBhRTYDi7VWFSugiipjssRj7d9Q+Wvsdxh1OGAMT0NJU+Oa
         Z8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786444467; x=1787049267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pX8gmMmDKg3afhYRts2RaqhPOxNS8pLkC/Y+vBXD8qU=;
        b=MT2oZ/DBwSE/A8OLQmU20Ar33zIVBouJDwpXkpDQx9p4Q+A6hIfyfvj2+ziSjjh/OI
         DJFt1BaXwG2X7EWcgk3JFPmOA+KFoSvszuV+HP+Lq/YExR9Sl1Xw0oeQIWAYxAYIC3k9
         L2BwJ2WqAg7pozvSFRMRU9ZyBiiUnx9lOUhVJW1YlrtErBdz1BHYUs+DL+n0MXOWwM5F
         /SyRgDHM7y48gs0BdMtONe+m0Ut2ahL8ZO6TOv5eTwEtd3oFuCeRMCsVWA3n5UNunZW/
         79QxsNOyXct4k4XMYIpacBqWk79dObZTuYXXaoTZ1YqHa2DOgR71Hk7XsJfOciSFQxNr
         TjNg==
X-Forwarded-Encrypted: i=1; AHgh+RpV7tjSby13oFCGBorGDIKPSB2UBdRwV+2Qm3YDgNkaUWBhqQZhaKU+MljZ0FglxT3DD7BasHe0BenD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9RQvsK+DdGDXKeVoMpX9RN7ssawB31qjXZWzAZXwMSWEZ3qXW
	hCN5LDKKkZZG2pSriyxiNp2XaoRDF4oxZ+Wv4pTRJlvGzLraG319fxXOW/cnvukn19jiuXf+bmu
	OeM28pu14a9/yQiWMUcmCk6vQot6C2kK1sBVqBsNClZtqUgsl+bBBaIVT+fTZK8bZ
X-Gm-Gg: AR+sD13+gf+q4Ph6fynIr2ysQhE8gYkX13dF/HV8KhZO84x5qEoePOb0Of7CVGXQerU
	sLPVwOA4fj2ueT6QqC1G36fQUm4Ex58yLWs76YQ3nbgWEZsxpdqkbETQdqR6DiI7uOv9xvpRVqj
	/z1WNr0rinvzfM3fkuHi8BFvpf9/dffSSCn2JL4vpKfaPkEc4DzbSTmWdAzh5Ce+UCYxjaDwNum
	Gq/fP51Ix/lXx7i31/Xpec9FdlV4Yrv/WKGYFuTv9Danj01gtoH4m+iNFe+bijj0eI7WcKWEAYl
	rb6xfJGC4R3kKejx0aO5ARkyW+tZ3/lCBoAz6nAwqorSIvEUl9CZ14bDLs2xXEgRcElw5dt65cU
	LTdrR5sy9QqKpOkJswFQjbrvrruRUuj8K+yx5Z/vr9ZYQkMNA5/IX8hJEqBbjCudD/7OnDstFkr
	PyIhtF5js3oRUl72ZEn0KQyQ==
X-Received: by 2002:a17:903:40cf:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2d31914fbc7mr8892115ad.12.1786444467205;
        Tue, 11 Aug 2026 03:34:27 -0700 (PDT)
X-Received: by 2002:a17:903:40cf:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2d31914fbc7mr8891755ad.12.1786444466630;
        Tue, 11 Aug 2026 03:34:26 -0700 (PDT)
Received: from [10.149.102.240] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f48547sm5405795ad.36.2026.08.11.03.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 03:34:26 -0700 (PDT)
Message-ID: <4bc060bf-b5ad-436e-a27c-57d5d0a89638@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 16:04:16 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
 <7f4qs6su5fd5ilecy4r72suk6mqvj7oouz7ahgatxthqavrfia@wxilczij4unf>
 <vxpntlaebf4an2wgebgbwk2rdkingzjecdgylqv36wmxtyqju3@hkip3wqgendw>
 <7cc49120-8f0b-4e07-a008-145504e00dd0@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <7cc49120-8f0b-4e07-a008-145504e00dd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Yus/gYYX c=1 sm=1 tr=0 ts=6a7afab8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RCP4fZz32dXd7NFGJtwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: yrULvZakATOxr73SAcVGMrg1-PkflO3d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4NyBTYWx0ZWRfXzvXvPLIukXHG
 3hHIvBrt/qza5fdkYOnUisKoaoyKsN55VXrHQBUZsEvb7TkJ1WMxWnAcLFtQilfaBOKKCeoWtqA
 awHZK/AuIhbVlP/IKsTVWXIQe77ZLP8tok5pZWEckAqixjoswZms8wRj9mO/KwaUGuEtvYRgEpu
 oJojHUWklpPFBN5vihPvPYCB1HXIZR+LpmdTjIAg1FhEOqjQfcP1GegA4Xu9uO8ijbC71xoQH47
 OZlRmc3Fk/4ussxxp7lRxD3+ljWlsG+pGnip6FDARsdHH8wmva8ObCJ9SKRZKAMZ3ynGz8LNvJQ
 1xg1gZbATTno2oKRI8mBv3jOTLaw10dBgHc2e/67aPqOqwdGmWKrZO7EDW/gVgjJWlh2QxWx2Vs
 BQq3zSsorelndXLcDqel10uL4X0IJhMcx93CJM55SqCOX6rGrdYeHUBByXe/Y4Q+NbjOvBSpwA5
 H2hJQNXZL1cWW9WkV7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4NyBTYWx0ZWRfXz5K9PijzoDwx
 f80ESFvL544e46ktRaGLL1me8FMU47T1+SAIcmW8Df3xNvzGb5hhyXJWJF8poLKjbCMLP5MKioQ
 cKu8gQi7AFEW9JUWs5YV+eg6bOXI8y0=
X-Proofpoint-GUID: yrULvZakATOxr73SAcVGMrg1-PkflO3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110087


On 8/11/2026 3:14 PM, Krzysztof Kozlowski wrote:
> On 11/08/2026 03:15, Dmitry Baryshkov wrote:
>> On Tue, Aug 11, 2026 at 03:48:00AM +0300, Dmitry Baryshkov wrote:
>>> On Sun, Aug 09, 2026 at 12:57:00PM +0530, Hardeep Sharma wrote:
>>>> Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
>>>> tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
>>>> assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
>>>> hardware.
>>>>
>>>> Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
>>>> wrapper for its debug UART, so this assumption no longer holds.
>>>>
>>>> Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> I doubt this fixes tag, otherwise please explain the bug.
>
> How Kuno could be supported, as you claim in e10b198a94c6, if we do not
> support non-dts platforms and there is no Kuno DTS?
>
>>>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>>>> ---
>>>>   drivers/soc/qcom/Kconfig | 1 -
>>>>   1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>>>> index fd4d4ecd2df0..5b3c9d31fd7f 100644
>>>> --- a/drivers/soc/qcom/Kconfig
>>>> +++ b/drivers/soc/qcom/Kconfig
>>>> @@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
>>>>   
>>>>   config QCOM_GENI_SE
>>>>   	tristate "Qualcomm GENI Serial Engine Driver"
>>>> -	depends on ARM64 || COMPILE_TEST
>>> depends on ARM || ARM64 || COMPILE_TEST
>> Or depends on ARCH_QCOM || COMPILE_TEST
> None of them are needed, because this is part of qcom soc.
>
> Best regards,
> Krzysztof
Thanks Krzysztof for review.

I'll fix this in v2:
     - drop the Fixes: e10b198a94c6 tag;
     - reword the commit message from "fix" to enablement framing;

Regards

Hardeep Sharma
