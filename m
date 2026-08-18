Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BA437E5D2
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 10:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047345; cv=none; b=MPEzmghQ5AH9hAJbb/jytquTG1bYzSfWpPhgA52pMBnV4ks08NakoCY0b8uFkj89cP0n/ZxdR8S60v3SxXx9XtdTNHrtPazHfv4iWeE48A0PxrFcLLrs4zLbyGw6oJkSIB3j2sdMA/bh8roJ8q7GU12sBiAI1DcrxEHz1eMSZ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047345; c=relaxed/simple;
	bh=BZqcWaqu+rq5FB9tqXK3e4Bntj8NSh8srxUuMqjzxEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C6XOEOI+SMflCnBQ3sSRKDR2Oc7qqX3YZPD2xu2OlzBswwkPUVxD6kBSraJW4JH3ggghic/F6ycOBo3WqM0stQwdbFLLfpMAAfupPiHS94sarsmSddIupXMc2n82NbaBveA7G5w6p94wmRXDwF6eRTWZZ1keXnJRk4hcQZn+nYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBJigU4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h57GfnhO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBJigU4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h57GfnhO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BJZJ1061709
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 10:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKtcZjbBOfHo3Kkb7BtMQ73HlCTfqy+fk/1E8Z1N6Xg=; b=mBJigU4sVcEo/i0B
	jSrWWvtdyhApq8UdbdXXExhZr5FQF8dPZULE0kY2hrihDqkDTI+sfFKSLs8eIlhN
	ouACxr9VBTgsIb1cWuziMGllA/Aai8zjDNQEcDllYglxezMNQFRUqLeI2CQZJF7z
	MvhRXssijPE2Ow3uhvLVfgWnTLB73T4U9gFJq7lbjSglMuJwst8a1Eiwex8QsiD3
	+Dy25i+R2fXUBUNnHaBSdK81HiKhdBoGqwVMsxQzG0WOryPeZQLNrMwMUwGgGiWC
	PgvA4cu2xjoZnvI7s+EDZPNVbmlkkVh3QWh+XkDySGsPm7sG70NhfQ2ayOnYuqom
	OshV9w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fvp1f1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 10:02:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-744e789f00fso10905137.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 03:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787047341; x=1787652141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKtcZjbBOfHo3Kkb7BtMQ73HlCTfqy+fk/1E8Z1N6Xg=;
        b=h57GfnhO16f2OkrQU+Yp2ZabOI/zzXD2UhiA/IZNIVTZBLJE/UMlYOZv/UVKvw+3uF
         2I+hBdyD9JidASgdwtR09ASuUVeBJmfGWDPZ+gnMUjCstk0SQKzRocMRsg71qsosDnIJ
         QTRj/lTar9M+Z6GP5rY0ONuM6isTlmo4ThjxXDdbvHbmovNqPezp9LwME9l8bTZVy0Wp
         e/VxRE5IK/eYRhhBEVT3GydXXu/LE/1RBL6RZlszAeUJHd4Q1aLMyWxwbfkKG/ZH5Dmi
         HEv0ugDwwGZGQievBYzW6IXrePPqKJrbwQlFX2rW1MT5y4u7ofJMelvUyc1PDWINmOY0
         pE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787047341; x=1787652141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKtcZjbBOfHo3Kkb7BtMQ73HlCTfqy+fk/1E8Z1N6Xg=;
        b=YAnWPQKbY9/diDKe3gxgYYdkcNZ+QUjc8bYySxkbMBDSO22Tp/30oLAYD4AW/sqdwT
         AZgHs5og/4DD+Fz5l4Fd33CFfnV/7+VQ9U1kY1qjvqO5tWFONC0epA7S8ESXXD/eUDsx
         K5NrKRu1kFMJJg9X+EPVdabzDTrYB64z9EG7cPXc17WSxEc6/55zTXti5u7xcEKV2kmc
         VNmN3ailQIp1RXH+xOw6yzfP9XWblFCrApgnu2PJ6otsbEVM3o6byx5rx6I0P9qUkiWe
         Kr3rQQuAOJzo9XeGgnHQuHqXJ19d240EohNbqLWSKeK7H+XJCVpEgKpr+b2pdxhTGu5M
         4mRw==
X-Forwarded-Encrypted: i=1; AHgh+RrQT9Dseq4NmmMSNlPHgq9s3dONk0G2gUGb6u/T5GIe4D24EeuW08P6e4WedVWCTHmmZJwyHEfoBGK3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/6h1eTxVAmhQZz1f/y1YAHAxff9Zf0EaUstoO+MI84i+GTZf8
	hMPeNimPOpP/gDqn/LbQ92LA+pWMT0aBlTdYaHGoaekRLHpxt7+4ScbBHqo2sxdqEyYQBwFQ8Qu
	UBzktnLwjk7Fi7b586Nv8kTXPtZYpQiwaux9MH1b9VHr7srmSC92FB4DHQ/QyTZZg
X-Gm-Gg: AR+sD11otmAwpDWj2H7hghysOP3kUIMub3wPrEnkU8GJo4BL/OOVaxKt74FTQ5uWWDN
	Q1kLAFW+F3Y7ebZCnyp2/WaSQguv5PuQFii+x2F7v1y7RGI/+zbfSYs0/BphuN+fOBqosUCvhAD
	oZDSRceCiPHGoCj++CNsh3U2DdNnaJEX9Na8xa4GkyBN6SMXrnRXeYwgN9++Pw8vmmIkjOANM4V
	XMQ/mxdR8qW8Zhs5xHdu2OC1MmZvzdbzSafm35v2YiFPUC0jNYwfFhecLiQEzfzbu4K5i0b0U4w
	FqiBp+BrMjDq80F+t59gUazU6AEr3xT7oVkZIlF/bjn1bQY0CaK5iBbBXMC85dCVAMLnHDoxfGR
	lXQgs44ze1gCnuoSDWWJVM8F5
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr2244150137.2.1787047341152;
        Tue, 18 Aug 2026 03:02:21 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr2244135137.2.1787047340715;
        Tue, 18 Aug 2026 03:02:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8596d4csm1517213a12.22.2026.08.18.03.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:02:19 -0700 (PDT)
Message-ID: <c72378dd-edde-49c9-833f-d107f6573989@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:02:14 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] usb: chipidea: msm: keep the glue device
 runtime-active
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-6-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-6-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5VDTD2nZPQsDLjfnuf2CZflwz6wM4DVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfXz+KCZclA/wim
 9JeVJcTuN0UDEHLNUPh8u6eNBoAHJf515B+fI/xKmo6wEui7Q8b2952af1sAhvV3DEpDZ1AwCNF
 PHmbhjmbHMvQlsm+3mRCQNDJcmZVMLvFSEw4wzuH1cRO8jyHAX1gFZcb+rCtsf08xSjPBFbk+md
 YluFBzHNvaV9x+r07rf5A4nfsLzs/6lEvGYduKiVd8et1NO/os/Hr6BT4SNThghtLUd834tSZ2c
 jkdoavxz7DI9A0GwiYomXZlCpuGcGOP1V6FfypzBok+6j5rWN3wTqAPYnU0SIOpTUJbo/LJZ7XX
 5D/3JBcOOsX4Mdiwd42gVgw0aN8pyXlRYs8Pimqr96xAtqh+XKbCad4udZa7kft34Mfv4UAhGPG
 epdAz/hZdSjJI7Kkm+FNBqe8+5aXxQ98iZsEIl39i3fzNrwLHQBZyz/JsAA0uEzYf0WA8eB6YhA
 WzSJPZpW5LIamB5hiPw==
X-Authority-Analysis: v=2.4 cv=K/IS2SWI c=1 sm=1 tr=0 ts=6a842dad cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GzGGmIZ6zSJ6oW9ANs4A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfX4dCzvzRPHPF5
 JVG5B7eiRECn9WnRoTXdhkMr7/3iIoQ4GQuTKdBdC69fBK1BIn5zIUJeZmKoLm3qTSkO/6R01LF
 4Ocgj3LTaZBwZhcYE6XhELK97/ko1O0=
X-Proofpoint-GUID: 5VDTD2nZPQsDLjfnuf2CZflwz6wM4DVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180073

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> The msm chipidea glue enables runtime PM with pm_runtime_no_callbacks()
> and nothing pinning it active. Right after a successful probe the
> driver core's pm_request_idle() runtime-suspends the glue (the ci core
> child has runtime PM disabled, so it does not hold its parent), and
> when the glue sits in a power domain - the HSIC instances live in the
> USB_HS_HSIC GDSC on msm8974 - genpd then powers the domain off
> underneath the running controller. The EHCI register file reads back
> zeroes, an onboard hub's connect is never seen, and subsequent bus
> accesses into the unpowered block wedge the interconnect, eventually
> taking the whole SoC down.
> 
> Pin the glue runtime-active so the domain stays powered for the
> lifetime of the controller. Proper low-power handling can later be
> built on the child's runtime PM together with the HSIC wakeup
> interrupt.
> 
> Fixes: 2d0cdcc5a0e4 ("USB: gadget: Implement runtime PM for MSM bus glue driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

FWIW downstream seems to implement "real" runpm, so perhaps your
agent can have some fun with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
