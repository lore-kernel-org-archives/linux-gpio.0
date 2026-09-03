Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C17B4B5CBF
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446462; cv=none; b=FUjuVGYkKX6IeIHLHhcdJStcdXSd6BRQ5rQcf6AeBWfZN1EtWCbAqkEUSsFCT5GUxK0nXzkR/qym5LDJ89bQ4v2082M26wdSaADNC0a2yReAtvZS6GCvHOpATN1YOiM60AySsjefYjuVDXSHIz3aBcZuNvdEdIacZlKuYKgUyug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446462; c=relaxed/simple;
	bh=gi9mZjH3jh34DK+gNA1UPkWEDaxFzIUHDuBU6k1qR0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9j6yB8ld7Q9MipnWTsREKLpaH8WEs7ZoYuvrdgJ/TV5w+f3FzGbfP3BV9ZS962N6KeZmzCxvAwsy8+Nx7L78rrkZMPyuD2ODXH8zys9PY497dKtgi6/A7ggbe1LeOVp4rzOW5+jG+NePZxtITNOnqvylI06kiqW61uzwLNxm80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBK842fY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GmFMGnmQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBK842fY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GmFMGnmQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DB8a53580133
	for <linux-gpio@vger.kernel.org>; Thu, 3 Sep 2026 14:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PgPqH75E2Evg/LBzbjzhxHEEsoKS9CNve/6QYZ72/hU=; b=dBK842fY8gNu9XDN
	zoQ/UYkuTkfbiLqEi4fBQCgGl9oyBZdCDJmCFcVDFZFjvnJRgMY9MPDQhoNDCwbZ
	y0mHOy/k4LNRG+bpWh5Df1Wb1ArEMLzE5G4brP2JMUWle0O8Rtgjdhs19Jdfesqg
	cDG8Oer+Vn53UWUFfedl77YW5MjCY7LOzVoIvj7Xkos6DqbkOI0j/TOqTGcwsXs+
	chGCtnybaWc+PM7RscvWvIspRJZLCQ7v03uOvljsvfCrHxSLyBHccf188DZwK+DA
	gExti/F1jJGJsFNp6vObuyiy+HUdCU13YOHDqYuaMxhhi3kNU80Xv1yVmTw4g6PN
	XbUPMA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d11ecu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 14:40:56 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738be9df36fso97150137.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 07:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788446455; x=1789051255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgPqH75E2Evg/LBzbjzhxHEEsoKS9CNve/6QYZ72/hU=;
        b=GmFMGnmQapTYuOqD7lsmRMrUfKHFC+sn9Zhg7+x7vX2ul4nn2z0T3xyk0WPbQoxERx
         1fKeI3nDvEjclhaTNlKUVLzYTF7Q4AugvaLFfh7LD+y2eyU8AHvv09KSqybuXpzgdtmE
         OlOGMJy/5h2OgiLaMKh4TfbfR8YOOquatVByfE+brgu19i7Sn72jchIH7rq1aBejKS4b
         pF7rz9UaSFuyVVn2UO4XJ0zvELhQMY0nDp9VfZqVCUwR/a/1283sIdhAqzjqrcjfT4LW
         b1ydAWoe32AAnyMUU1Qvob5wp8ZzoZ/QNWPH5eOAHREkZZvnkoni50nJZXSXgfK6C8Fp
         ha/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446455; x=1789051255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgPqH75E2Evg/LBzbjzhxHEEsoKS9CNve/6QYZ72/hU=;
        b=BGlIpLTkfIg3T1ZcfKz6545fRScIRNyPEUlmC2MDhVi3nOZ6l1pnGDathSW6An2ZxX
         1Z/L7ZXaYfcqyGqhpDZpy8zkb1S9FUN99XDoQI4nrf4d6LIIEzxyxixFtZX98qEGYJss
         yRv72cyJJxrrWuZoG5qEDsquAzunBwvD9hNt8uQ/zLgOuPLk0dtBO0aU0/rspBJDbIk9
         VetbV26iCvsaga+9FWmzBLLNGEpcFLOETJwdnAq7kdEwUMVIL27Sn3AIdGexnTKfp08m
         te7f0H54jGhrAYdFnnKhmbdWm+9qdVAj9odc44w/V6CjjfYEx5BjiSk5O4Gq7XCuSn2W
         CtMg==
X-Forwarded-Encrypted: i=1; AKwUvBytmm6/KENlAgKogdzyfXC85rAqR63rU6enRXolVVylPx2R5VGtC1zfkuTTCyt5dydABzyLQ2cRQVVy@vger.kernel.org
X-Gm-Message-State: AFuF++khX1C4th7wjCLaogBsRREy2tCDNPxywhwEvjNADziJ0RqiZgVU
	WMFLBl5P+D4k2fM3pEGiXpLX/oWC80yRY6FN6Gyacw3CXrLERfVH7il2RUYtaVNBExjJKZ8GdyP
	1DcgVpU0InT8/vtR6tZsoHcZRv6m3iaD9J2yzkvaN1kzN5r6F/Sn6GwYXEdySSSa8
X-Gm-Gg: AYBFou1KSjW5BKmb9ooslP01Bm4yCg9ueTrSPFVtk+VIZlaWVe/GeMR+Ni5RpSICl+M
	/rxsx2Hi58MkHOHPNUgE183E38bj1RbBoYeKlyo0XqlPtU+J7RDV7ps0O/cTk/6lqwWRAaskpAe
	q9DvWO4TeVD8RbmojqM3q3eGlP1dyC8eVRGevRRVQlLNNH1C5DFn5VAWw65zKL3lwelzjRaYtw6
	UWWZq9OZiTnQ7jrDjl88Ld8A46sSipt/mIxLshGNH2S4YHaKRqdK7IyOI9LZzaKs9omjz2ExtA+
	hZINU7lNLxFRx/K0u3kV/tIl8NMddFop8jWpg0ObeG3ykqnBc7N2PZavSVkJYPP+CZicoQsMZmq
	bVV9nloNTw2DwtnOQMfh0mg==
X-Received: by 2002:ac5:c84a:0:b0:5c7:d15b:5f2a with SMTP id 71dfb90a1353d-5c7d2809352mr1626672e0c.2.1788446455272;
        Thu, 03 Sep 2026 07:40:55 -0700 (PDT)
X-Received: by 2002:ac5:c84a:0:b0:5c7:d15b:5f2a with SMTP id 71dfb90a1353d-5c7d2809352mr1626554e0c.2.1788446449511;
        Thu, 03 Sep 2026 07:40:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705866acsm147251fa.18.2026.09.03.07.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 07:40:48 -0700 (PDT)
Message-ID: <a5d83aa4-7065-47c0-bbda-35063034b0d6@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 16:40:44 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] PCI: of: Avoid config reads for disabled bridge nodes
To: sophon@radxa.com, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>
References: <20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com>
 <20260901-q8b-dts-v1-1-7de0b6a73d08@radxa.com>
 <8c2eaba0-c1bd-4db0-bbc8-5ae3b3d9a13c@oss.qualcomm.com>
 <B4EB99E5B76C9F40+e6fdbdd4-5c05-4b98-867c-29c7178a0d72@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <B4EB99E5B76C9F40+e6fdbdd4-5c05-4b98-867c-29c7178a0d72@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyNyBTYWx0ZWRfX1olxuALFdK/P
 iW9Hs6FnDX91BieAhQpLg42yyLN/YscV6sZQeuZi30K4mRyEMo10C8EfLdTZGff8ijd2qdKjMkA
 OLyPvuMdaYlmdlQ4jtchmus6yGT/CzNQJ/pSH2i8Ooo8GbXxNvostmXz9VzZ3XrKktytC46Yb8j
 MULHANTbh42a46xNqr+iHtCuXLNkLeT21eouYuNglVOyTqOMLKSTbIEcjCSew8k/8qZrS3jLcjQ
 06Vk8OEUz1EjeYghTp9XpVQbFOLGsWG2PoiVnna3PJkCXOp6Eff2DfEUqXaABkPIOhr89F8UK/i
 QhfZcD3m1ODsz3dPLnXWpQ7bNunmx6kUjrb+6lSiA5bTLOVnVIzqgu+TLrFCbsS3QfOi368IP9t
 WgcQr4dg8JdhIPJEHUyp+G1ZtSNloHzc/cBFJjAEaWDLS1RrQXPaOArIRVgCRouwi9a3BPIKEYl
 173EZCisFTxJTq9ZjWA==
X-Proofpoint-ORIG-GUID: qfqd89p5MndyiKCdse7hhzl37jK6gbcw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyNyBTYWx0ZWRfX9ps/5MrBCaCn
 w61Laf3OaRQwcp9BnKrlQmP8ccMZHFB0FEdSs5UbRJFNgIvzoUKosSJyRrw9LAH6hmiH8M917vU
 e5vSkdu4x/dGDM/0eLXe8UkDiFE6KhM=
X-Proofpoint-GUID: qfqd89p5MndyiKCdse7hhzl37jK6gbcw
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a9986f8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=z2R-DqfiRA8ArFDFZ6YA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030127

On 9/2/26 11:31 AM, Xilin Wu wrote:
> On 9/2/2026 4:43 PM, Konrad Dybcio wrote:
>> On 9/1/26 10:47 AM, Xilin Wu wrote:
>>> The TC9563 PCI power-control driver powers off external downstream ports
>>> whose device tree nodes have status = "disabled".
>>>
>>> On the Radxa Dragon Q8B, reading the Vendor ID from one of these
>>> powered-off port functions during PCI enumeration raises an Arm SError
>>> instead of returning an all-ones PCI error response. This prevents the
>>> board from completing boot.
>>
>> I agree with the premise of the patch, but I'd like to understand why
>> that happens - do you have any details?
> 
> Unfortunately, I don't have further details. The downstream kernel also includes a similar workaround, so I suspect it's related to how the TC9563 chip is designed.

I'm curious in why the port is still advertised on the bus if
the i2c interface writes some magic bits to "disable" it on the IC
side.. but perhaps that's just how that IC behaves and we can't
do anything about it?

Konrad
