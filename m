Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E79424D46
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 08:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977962; cv=none; b=GmqW5fgXyb4Xq0j6USgG2m+qvx5CG5KLCf6TvRSFq40bRxSkTqLxzib/UgMhrVYubMCAomff0lYFjhlHVIOKy8dK1/sO0dQBAerg+fssoYRxtWeOYdbO/5GOFttnrmULtkWGGFcH+yWEdxZUasAVSQH3l/ykQoOeJt3s/rgAjKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977962; c=relaxed/simple;
	bh=qA+sfwYzHhJ7yBQQa+Jpqy8+4pxE8vXtXtY16x7quWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AwDBYgE30CwCFvBNiCJiI8SPeYS/z/2UqXfNTK6jhG9qfAJKQuOGdJBH5zPUFoIoZcY0aenczlCDIZVcE1804QqmrduJ0JvrzOG/pi5A+o2aMRcK79+pad6mPoolGvu6z180/qkczurfKYwaTKMd6t3qX700RMta1xCqzS+ss1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4X2Xqi/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dh/OiPRR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4X2Xqi/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dh/OiPRR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7B4UY372091
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 08:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z79Try10M8mBO4B/q2nr1hKgnYNAKB8UXw+vU+u74Rc=; b=M4X2Xqi/v44u4tKK
	w+LVJIagX+aNoy10oOp0dN+F3hkp2q7bfNKNs/39oRMTIs9v6dFfkyUT0eoKCDZn
	FHbbWVfL0MelxtauREK5xCAiuZeHogGZzOxl5bOJ/judbOr+paGJ79Z0eYf8GTpE
	YGv8Qj7/qn+rC9I+9HBTGeA60TOm+Ymp8fIM/65EBfFJFQRr+eNFqwFUaBbZgi4o
	n6w2CZ6FD5SRKB7X4M7V9A3gLRO/urFkPT211lBEW7OYPHuavpmTreeRhMqpmNsq
	OBVhXHkc6fz2eOOWZh6LbRlYRfIy3MmFDX2UTYCufyMe1J+TqDAxvYBXT1zbxlIR
	FFzeWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5grse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 08:05:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf3eeb42cso56372085a.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 01:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789977959; x=1790582759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z79Try10M8mBO4B/q2nr1hKgnYNAKB8UXw+vU+u74Rc=;
        b=Dh/OiPRRVGxD7IahTGdAdeU7usnQogrtf7tMjcd1for6PeUlHaM9bBc2l8Jn4I8/bP
         Xa/9ydjnS7jkDaUd0FZq04/Yg0EjJSm7xHloBqEmG3doQgqlWNKI++bv/Utc6sQd2cKL
         mlOkN5WMgUUyTayIOBAudiYwHRUikC3elgwafHcJFxRWU3AFkt7/psHvIO0PkBTTHiR+
         4Aat1zqba9dlndukKIi1WEVhwOAiMmATO2UdWVHfP3SiPCHmCt1PG6QoWkwRMFh9ruCB
         hLvlq2LuhQvHK8PXbJPdpxxYwleqKOuxQD0SFRuuiwdiTmvzIELMjKKOJOzJNuRnCbzI
         +YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977959; x=1790582759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z79Try10M8mBO4B/q2nr1hKgnYNAKB8UXw+vU+u74Rc=;
        b=1gXgWTQRmosBYWoSgsVXcztjJ1JMtd/xnNkYIv16wUVrcRw7hOAEDXjab19Zv6883Z
         jXVQSE7oBR/ZEv/2o2ISRAD7hrDErGCzmWJ8+KqoqatGwxgUXEpEwa6o9SnhwnqtRTYa
         I/bQ3ww1Ho1uiusrRuoP1adwkxNOgJ+j0BN73Z5JNkNmpZAjsUBPPoiBsyjDb5Wq6a37
         gB/rATYxFRm2cb8vrgDtSaQHMYPVesVXwomOOSbpEEIV+E1n4MKjHcoF8rnRDIuzGzzC
         45pXb9Whssm3hyKdPH00UvLzZYPT2vfY0iCNDQMEXDR/CYoz8QXLEafwKfNslk82bXuQ
         kf3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzas/xfSiFlPpfmQnQaNo7HKXFxnpP2N/SR0nijfKwb1q8fY3pLgA6Lb9rA2A5nJktaEYwig4Zcp8WM@vger.kernel.org
X-Gm-Message-State: AFuF++kxQpT+e/M5kvTiCYWpBGgHbp/fY2iXEi9YBA7Pnuq7XRamiAV6
	fnv3+6ScOjZ20pcEvzigpDxoioUnGefSQFGFVcfw0CcQ+j9E+u1ntuOzwcksFdh4cSYt7NBSfHS
	WLtYgI3FJAjBszEKviBFDVZbZnrl1JhkT4/hfJNqj78OSh2JcymzumvDcWK/iXnU8
X-Gm-Gg: AYBFou2EP8vM0YiX71DbyqhUfoB0noMvG4IiilInaaf6+8GyPJfT82/VrySBqbzZdyg
	MK0znDo6C7ELzpLLBLIFwcm8KJuexg7R5J2wQQ5NHkb4ycIPLowei7/V318CMSsf8CWJuMeLHvo
	W5nzAorl3Ulv0ZBEWWx9pVO1nuKU8t/dOwLxLkCCOPgyX12LYO1usXXP0Na7oJ11yAAzQkrDD5u
	4vTUZTvB5dGyPNrG8XwfPHnHDbLNrFYreTNshyOSoKTN85A/CTWB3rJjhhdmGkM0O0pP5WZAKgo
	H2gLevIxtHAmh1ni/Wf2u6z2/jlW6biquDNWrlrd+xAB/BS+PKQYMvG0WotTAY2gw20YLQeZSNY
	TVF1X0tRDQc43s5CFH/Es3A==
X-Received: by 2002:a05:620a:2814:b0:93a:1312:ff19 with SMTP id af79cd13be357-93bf580a3dfmr872922285a.5.1789977958615;
        Mon, 21 Sep 2026 01:05:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2814:b0:93a:1312:ff19 with SMTP id af79cd13be357-93bf580a3dfmr872919385a.5.1789977957968;
        Mon, 21 Sep 2026 01:05:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a640f9ef5sm168057366b.25.2026.09.21.01.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:05:57 -0700 (PDT)
Message-ID: <21b8c9c5-db26-45df-87e3-822db9cd11ea@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 10:05:54 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535
 interrupt pin
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260920-ifc6560-adv-v1-1-89b1435d00c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920-ifc6560-adv-v1-1-89b1435d00c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab0e567 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RPWKvmICn8r4TwR_xsAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: FtDXe7SJ4QpSesJC1ZaVTcRHcDAW2Mdy
X-Proofpoint-ORIG-GUID: FtDXe7SJ4QpSesJC1ZaVTcRHcDAW2Mdy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX9+N24BAD3WQG
 tNdFsbHemKv2GMAd4Gk/Z1aXM+9gzfbAvRmtKhmCHVaM+cetkJlK1RCEO+q2Aj/5r4zOjyq3AaG
 wd4Z0l5cL2GjliQl7Akt9RZxKIYGtjc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfXz/eOz6ixFU6c
 ylu9zq7q1p6/xErMZZQzR/9RgXQd2D2c4+ctPu9S7qIYnnMmFo+JD0x2ozvgHPw7EB56EOygavQ
 EvsSbPYYbDU9tBWNuKf9ZQQCc6LyoKXef+ocfjksV5RvRpm/gJmmf8v4/nNmraveSdvIK/5QfUf
 SluVKm3haaJpK/Bk4nPX5Vh97zPxnUS0jJHXhc/YRQQFDqbaL8BMPFvjWtQgihDjgV/XhTT0H0i
 joTvAbDQBGZti+XIMjgC6LOlKGbs1h7PvQu3562b4zRoXcB5U0MvMQzPU/vqf0/SboWQc4kSvC4
 LPksQoQKITWuXc4stIad8yWGxlX/O8+sZi5vgA+yuQawGk81RlAOYTJcVoMNSJPVPGsV/ZT3Mgy
 r+l51FGlwgivu+A05oobmgLnciXJheT5mmOMEqAy/2tg0IrBfUfWpE5mt3+cHh22q9hvYDwBXM1
 44E++8TgLR+P9ih2U5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210115

On 9/20/26 1:11 PM, Dmitry Baryshkov wrote:
> Probing the ADV7535 HDMI bridge fails on the IFC6560:
> 
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ
> 
> The bridge's interrupt line is PM660L GPIO11, but the board never
> configures that pad. pmic_gpio_populate() reads back the state left by
> the bootloader, which is PMIC_GPIO_MODE_DIGITAL_OUTPUT, so
> pmic_gpio_get_direction() reports GPIO_LINE_DIRECTION_OUT and
> gpiochip_lock_as_irq() refuses the line. Requesting the interrupt then
> fails and the bridge does not probe.
> 
> Add a default pinctrl state switching the pad to digital input, applied
> by pinctrl_bind_pins() before the driver requests the interrupt. The
> ADV7535 INT pin is open-drain and pulled up on the board, so leave the
> internal bias disabled.
> 
> Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> index 9e14f53b552e..fdedae49d1d0 100644
> --- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> +++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> @@ -170,6 +170,9 @@ adv7533: hdmi@39 {
>  		interrupt-parent = <&pm660l_gpios>;
>  		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
>  
> +		pinctrl-0 = <&adv7533_int_default>;
> +		pinctrl-names = "default";
> +
>  		clocks = <&rpmcc RPM_SMD_BB_CLK2>;
>  		clock-names = "cec";
>  		/*
> @@ -285,6 +288,16 @@ sw_ctrl_default: sw-ctrl-default-state {
>  	};
>  };
>  
> +&pm660l_gpios {
> +	adv7533_int_default: adv7533-int-default-state {
> +		pins = "gpio11";
> +		function = "normal";
> +
> +		input-enable;

strange \n in the middle

> +		bias-disable;

Plus you'd likely want a PU here, unless there's one onboard

Konrad
