Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD4A3BFAEB
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 10:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049397; cv=none; b=OTzwCRe8qlRV/b5KbCdn1/bQRqOu8fYuDuvn9Gxpfpdr9GCXtCy0iE5lNBcu2/i0FTfEvJq0HNB5JyhYHEQ7GcKuQHrFr3RJarWceBGF+LX2Qz+kW8QRf/rqu4LZmd59zwKHUn0JzYY4efdYRCFD61gstzjZnCqFVf4OvoCbp+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049397; c=relaxed/simple;
	bh=QpijhyMAv3Q3+zdOyqAiqYmyHOt2KQQJ8C3wNVbmY2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DhuZj2bsWlup3zqJ6xkYn8xBq7mtqvDkYgbOB4IXYgauVLiEcJhqBFOk7w2i6UGhuIFgPpVc4+qBeBuM991jdE0YPWfnjkhuxpLjix9bajEHnKs4f58XCgnIoRrEQqrpWuTt10wUROOgepHGwmY2ld6Z4KMAhZuqXgPJphvaJb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNdd7neI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkdqheB3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lNdd7neI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EkdqheB3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABZ0B1544897
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 10:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fsiLbORmMBDg2q+JZLV1vEms5S+OIScEWzmE5hr8nRQ=; b=lNdd7neIo0X7MKcI
	wUwkrXo8AeadX3mVXD5D6Y6NRHoxRM5IL0c6sZc61mgrqWnjlfjNroRQTHZEANT3
	5i1ha4edRzNzCB88j7dZwE+RDyrw53lizpvVbqFeriiX5bAbqGAdMH/8wVEVMyiI
	eCW/OZqQ8D8w+5ch1nE0N2hQNT82CLYNBetTHOq9nlz6MCHif1oELpmaXpGF7ePN
	8igCrwyeQY11IEMvnT0MYBioW9FOUweFjHkEIOuldqEtt5euPDWypYof3az22+zE
	H+e2KU+BK+Gg54E0WL0uB9LL5kGPHzxKG+pqAwlv90GwWAhBWsYAy5zAFjbihMpO
	dWhZJw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4dcn26bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 10:36:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93495488976so118152085a.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 03:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787049395; x=1787654195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsiLbORmMBDg2q+JZLV1vEms5S+OIScEWzmE5hr8nRQ=;
        b=EkdqheB3wZKQBbZl5OEX7S9uJoWWi9vnXLM/rgTnt4D64gQiLgoTZrNLD2+MEFkM8L
         cIPNSNzivLZnbb/wc8uMzYgVkDENy3psXeyq/4CrEFWc+n+YyKA4CNRfHGfTjnO8yv2f
         fnZ0Nv0SrUK28qjzi2Wctgg7ozT42FSnRwibVVGw72oxU+SGNL8PSw5kqP/dxBL+cbNV
         AYJLVGlvkWWa8+s9xhGWZt9fvyJXd5Zs+oGWb6+XwZAOrF2HHw7IsF6FIL4RrUG+it3C
         lKPVkHYwU0koLPRpFaWuTIOK4vOxMY8RFPv07VWMbJD0YobEFR7t+WKbW+ev/EYp6T4X
         j2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049395; x=1787654195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsiLbORmMBDg2q+JZLV1vEms5S+OIScEWzmE5hr8nRQ=;
        b=cVwPuaHReVMf93ufqzDIF1uKF0bH9OVYtnacxTKdYvVGA2LO1D0jEqVoUSpl9UPXzB
         /TOYuy3MkPztVVFd4CjwnQ7F71NmasY5Yy3wDyoO0GVaMhoTFKVsIjN0NU7AYGFtgR6l
         5pmcchNQFaCJN4ovLA6PuK0FNozqqxPWxvhD7mE/DZXCwgjgzB/z3zo5RkZmyhOsit1l
         Cw+mFUJmvwF/TKwrHQrGZCA5i3N1udtwTFy2cflPG4dlylqX6NoA7O0PaL/RXeGlN0FJ
         n5EI0rfGD9muS6itEskQSOTQwdz0SVQ0oqZd7hsK7hmUDwH1FEZjOh/po1IUC0VAPD0r
         oWSw==
X-Forwarded-Encrypted: i=1; AHgh+RqN0yRmxMEGfrY5nxZZUd9rFR/Ujt7R1Sm1raD5A9oVySThzVRrqIiRGSIJ2SKhClIO3S55cNfnOlAJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ATddc3rekbiMYSntfV5HSg69HBRfxo8mlsF66FdlS5lCsPHD
	Ml5RHXOcBOmqjn/j6ao+DabP9IRx2gMdPjCZPipkW37y9AxFY3jov1MSuTxZRt/aXcBGFN6L2SM
	Ssx1IEWPuCmWQaEcjq5geaT8ao8kGkyn14EbFw5xkHajFCtx2cQ2T0kgFiqcJMfY8
X-Gm-Gg: AR+sD11eccYMaKNhloOb1czq4QaRQwbMoYeAsSZClA+0X8sVug+WE06RavQUdvhhsNc
	Rt1BEmc4wq7OGSeHlk92zmNYkMLcuQNwSazIXc+URymGgZzTg5hD4vd+ZSzy3Q8DdR0YRn6vJn5
	5OLbGJLsVhijMtMgoOBVdNC7wmKiuxr/qwylr4W7Yv9tuWdFevHrxLqAX0i5SxhnatURRFuPQIr
	OHzntnuyn3OuMTjRCKGuX5cgMLs0VeW0I9rE5v+VdzxzqeGWx69i5JaXMPeq3bXS+1qabnf34+o
	Z0ongBMCgpXYQ/pJUqD7c0fYQL6oU64W2QJo6wn2DLfWVd/ztzOmu8/YrMzhPezod39D445Xin9
	3P1cTq+HCI0DedonKeRhBpaHQ
X-Received: by 2002:a05:620a:7083:b0:930:a08c:cf9c with SMTP id af79cd13be357-936d239560dmr2269220085a.2.1787049394891;
        Tue, 18 Aug 2026 03:36:34 -0700 (PDT)
X-Received: by 2002:a05:620a:7083:b0:930:a08c:cf9c with SMTP id af79cd13be357-936d239560dmr2269215585a.2.1787049394416;
        Tue, 18 Aug 2026 03:36:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b9f47bsm130185766b.52.2026.08.18.03.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:36:33 -0700 (PDT)
Message-ID: <1e070cab-ad61-4ac4-be94-1ea40f5b6575@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:36:30 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] usb: chipidea: msm: support the HSIC asynchronous
 wakeup interrupt
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
 <20260810-msm8974-usb-hsic-v1-5-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-5-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XajRHLc-qhZH4ebsgCHgrRED_F3BXgiJ
X-Authority-Analysis: v=2.4 cv=Gs5yPE1C c=1 sm=1 tr=0 ts=6a8435b4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=85NeIpzETsoQluUi9CYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: XajRHLc-qhZH4ebsgCHgrRED_F3BXgiJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfX1h35NhaWFDu0
 3P+ybsldJ8etEq9ySnwmMkvGoLBH65fFqK5rzwY3u31IAwhGBSmYNhKGCNrHSRhMMUKit0ziHAp
 StCNPFUbkNykkZAiyzSXXMPidoOl2YY7h85KOsBYalx887+zsAe40lYpX6F0QujRSV+ZqcZ2Qlr
 csuGtqUyHVKQe/a8uHkore4P9HMu7AtKClZ73+yeh8NJ+fxZjFTVVC6BFBgsutMFyqm6SdiQsnY
 PHiBb/8zmvRs7kT6RBzv3Y2wTPBfP5vIAre2lhlOfYFtjLSqdrGDp12//Uk6ssOsrYb0z6NP3vV
 T3WLr4VcqSc9O7/VSuHPfytIh8MXcgrP9V3OsOLAxCDAiWazAZMRpIAsWz/Jmt4DiJqvMfREqp+
 EJPdrTDXRfTINRybJ2zuVu0KL3YQcvVsxGv6+7yjNhIxNwVlG9D9iQVRkyC89CtAN9GWdH6Us5V
 +3DlClpXrptXdzj0h7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3OCBTYWx0ZWRfXxxcqHF2Eeor7
 npSVD026GHvDFhQP7nvxMAm3jffwPzlegxD+V0+15OFV8etTrg690A0u44lauG+YTXQEg/RbgQN
 ZWprskntS1fG9686zFftu6CsC1BL3cU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180078

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> The HSIC instances of the chipidea controller runtime-suspend with
> their clocks gated whenever the bus is empty. HSIC has no VBUS-style
> connect detection: a device (such as an onboard hub coming out of
> reset) signals a single connect event, and if the controller is
> suspended at that moment the connect is never noticed and the device
> never enumerates.

[...]

> +	/*
> +	 * The optional second interrupt is the asynchronous wakeup interrupt
> +	 * of the HSIC instances: without it a bus connect arriving while the
> +	 * runtime-suspended controller has its clocks gated is never seen.
> +	 */
> +	wake_irq = platform_get_irq_optional(pdev, 1);
> +	if (wake_irq > 0) {
> +		device_init_wakeup(&plat_ci->dev, true);
> +		ret = dev_pm_set_dedicated_wake_irq(&plat_ci->dev, wake_irq);

devm_pm_set_wake_irq()?

Konrad
