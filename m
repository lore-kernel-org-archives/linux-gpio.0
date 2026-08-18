Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF633BB9F7
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 10:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787048195; cv=none; b=gzmfeTv1l4qwrEqGkDmDjuo1L5ztrWg1kr+KomUFz/lp8w0R53QZcv/6EJaUPdKMHMqpllub5P+BT48tVWGwjrnpdqGYBV5nMSUxOSIfJhXOt0giC3prNh5t9iCc32PHgeCV2xeCZx3Ro19IlgR2hUbBkC1byNYjiRC04iUB+Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787048195; c=relaxed/simple;
	bh=NjdeBq83ZgzUZH446kdw0norRIo1mBoehc01XWmr2mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ICIwiL5p3IR26dUJ2bjsRBlfXZJ0jsumnmDLs1cddyd5UFf2v/Gx41imad1J2iJhmExsjYTGfNf+akP1bbrdSAtsQcgWyHkV6xq/6WuXfhQhNPAt+i3dOR14iZOEcwH26rDcnF6b3XCITTGikF+PpGg3yeQ5kf2hre2CGvy4dgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgP2Ndtx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iuDw8IZ3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgP2Ndtx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iuDw8IZ3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABO5W2057522
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 10:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7gxToVkREhPO6dQI34HddITtzydFov0LPEzCVWHmA0=; b=TgP2Ndtx33vsCXf2
	jHtVVdnOXv/sHLMw1LbpDKjhI7H5PRJaRwJyho/UKK6kRoOPxLvUbLO4ip//A9gu
	xCMqU0pkrcmIvMeXX4GIbNTaDDdr7KH8Wq+dZ6GJP+GzsB4cfgdIiQX7J5teIx9c
	ZTYqswQ4h/mH0vQQbypj9iyRn50tpjNXsm0CvlERw490WIsgC79h5vveamZPhxf9
	e+7NycubgZfVBmB2DOWL1nk3KloM480cCTG3VV0TwP/yJA33tZy+pVoDYJ+YdhXe
	oolWFhvnxMMF0DPvbxLsadQsq6Uu9uO/MYfIDcYht0pYzr1e64KbbD2JKeaMYhS/
	EJcWyg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4frmsjpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 10:16:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so917701cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 03:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787048192; x=1787652992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R7gxToVkREhPO6dQI34HddITtzydFov0LPEzCVWHmA0=;
        b=iuDw8IZ3N1FNfaTbiDHdykUk4LFfQ0hMWUvPuJn0xLCcI/b4oh+IU5ZV1EYq0FeYIu
         1G7TDDcH1tc6bgsHKxVadS1kIrZUizQX6nDfqI4Aao0lJE0tUNfEvFkkDoEaKq/GOeFq
         6yQfrkA3zsGWc1sD4D9DcVJ/wvGG82eOPNqj+hzAPnuEwvoEHLB4931ttB0APjplqliE
         KLcNnB2LrvSiw7FYLQ9BZj78a3lEvuYbJctu2+RBkG9jxc1bcGY34t/oogT81jVajtxI
         LvhiMsHoJulGALptAEynorQkOS5AKjBQ99+Tsxpi80ZSTkzA332CR1rdAFan6/8YD1wz
         CEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787048192; x=1787652992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7gxToVkREhPO6dQI34HddITtzydFov0LPEzCVWHmA0=;
        b=FLgKTzhPbW48Cx+aB997p2XTtMMLdTnEjBVdw1PaUUlhRzP7xArHbdPSIXaGOIBuHA
         3wVgYMPQ6nAdQzhcha5tSOL4mTDwF5FQ6bTc/NiMBcUr4TWZbnXTCiRVM+dmk7OoG953
         FyAADk4A/wZsuJe81Fj46iKLFwXmQu2/nLW/IL1qrBzNEG2nvxLlolSOC2HF29+siAxg
         /OIvtPo5tp5pHbieNz2R3utgCoEhHNtrdtO19tB9omEURJvOi5ZNABxYBqyPxRqCOrmA
         jONXm0usjieTIq669AxKguBof/HcKr/E57sqaSCxyDiyfVPMSUdlLYDMwC7iVISHyzLL
         gcyg==
X-Forwarded-Encrypted: i=1; AHgh+Ror7GTzbb8c2qcE+USomUMiQ31JptUyJcWnlgC2VrfGIUyD4VU9t36EiL1QrNiqbmrphA0VDr8UfgUW@vger.kernel.org
X-Gm-Message-State: AOJu0YwTyiO1EGDZVkHIsIo1YRDw7nat7S0yZgSuTUo6QL+8ptZKi0ZS
	T6JLSPr1oqrrN1fz0nxkSUobCIB0qQPYKIX49qTtNIlmr4e8qTEDf4QlJABOmoDbIoeibMiJ5J+
	A63j2EIq9O821rK/R62JSJvPIPiNk/UMNpWOtUALJdHI+gtg89yjyLInor0jXmOU1
X-Gm-Gg: AR+sD11aALgl93mwde1gtBOqKgUA02HZM2jDj0bGzu6QJj3qpGCYS/JPfBvI9NZ9s5w
	A55g8N8wlvkXWqEQtE51KN7VzhUC9CF3YgRm93LVptGZ20Bsdr6RcSsRQ264ZRl4o+QdKPYKkAO
	klMCrXU4lrV9DWTuaWKoMKU0YvIoiUX8wNdti6GwxlJTiQfMQmCzvWxAMCm7JcOjHWkkEsi72Pw
	7j7kq//MyVGaF5bc8QijhiKekiNQgvL8F/WdNy7hYvWxIZN9V+PFnk88/ozFEEZvWedjzUFOcUE
	UBh0hh51J5XxTzle/L+6psZqf8aHZVVGTun7PB8Ph8w/s2Bn7gyGqBCMdF4S2ZjhSUTZpx5F72V
	DnIfDWVrB+lZggXihSLcfr6sR
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr251850011cf.3.1787048192284;
        Tue, 18 Aug 2026 03:16:32 -0700 (PDT)
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr251849621cf.3.1787048191916;
        Tue, 18 Aug 2026 03:16:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217ff7e231sm164114966b.20.2026.08.18.03.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:16:31 -0700 (PDT)
Message-ID: <6f11fda5-43ed-46ff-851e-e571be749a31@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:16:27 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] ARM: dts: qcom: msm8974: add the HSIC USB
 controller
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
 <20260810-msm8974-usb-hsic-v1-9-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-9-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3NCBTYWx0ZWRfXyIOK57ye9Y1B
 yqSBmqmcNTlVxAv91PXzq1A4iE+jaCPSfgVgLR+zNZZzBRQyoLzQW5eUxz8j0yL+squHYknneM9
 QMulIXuWvb/NxSOaoYboZ5wWOlHAYb8UL3FUN2R0Y2bEwDNB9TicM7YcwIAOt9NpAt5iIZlsfgf
 9ztVKcz0ZL1nZUpjBrYI5xFzZQDzstuhWxT39YMprdCDWbQCwkA+83uyKq6zI5Vpmu16BJ4D2Au
 xAp+cQs4aBDcWp24f9k2CS5zJpVmZm8zOvVlbUmcmlvqNuFoUbF4rC/aZfNImiwCP/VAA/EkLs4
 vn12kbIOgQBICXvHBB/8z5qggMHrI6gcUly/pNIrsQ+EMi8dWoVMkSqC8BOlw8nlWhngLWR+xJE
 dRt3aUiwLRZdu+yJRXSyTMGF8SW+Ko5fE0WEmZC21DDgcAKcO7+H8ul7we2hQo63wrkcEKk0k/w
 gNnyubJZkBOJHD8kmYQ==
X-Proofpoint-GUID: aKXilNuzF22vpYMBEHkfSb7U2PwOZwtr
X-Proofpoint-ORIG-GUID: aKXilNuzF22vpYMBEHkfSb7U2PwOZwtr
X-Authority-Analysis: v=2.4 cv=GtlyPE1C c=1 sm=1 tr=0 ts=6a843101 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7gRAf5yVggz7YA7u_AMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3NCBTYWx0ZWRfX9EUGBtQoXvgF
 /mZxZB0NBM885THa40lZtefqAjUGdlhJd1ayy3UHYb3+9onZ/Vrt3ipoEGvVWDoAQpiWpP0J0Pb
 feW7h9sfCCGfd6iT5iLjt8JzMnr215g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180074

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> The MSM8974 HSIC USB host - a third Chipidea controller with a
> dedicated HSIC PHY on the special hsic_strobe/hsic_data pads - is not
> described, leaving boards with HSIC-attached hubs or modems without
> upstream support.
> 
> Add the controller and PHY nodes. The PHY is a ULPI bus driver present
> inside the ulpi subnode.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +		usb_hsic: usb@f9a00000 {
> +			compatible = "qcom,ci-hdrc";

I see the driver determines whether the controller is a HSIC one by
querying the compatible string of the PHY.. fancy.. would it be
desirable to have a separate compatible for the controller itself, or
is it more or less the same vs a non-hsic one?

> +			reg = <0xf9a00000 0x200>,
> +			      <0xf9a00200 0x200>;
> +			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 148 IRQ_TYPE_EDGE_RISING>;
> +			assigned-clocks = <&gcc GCC_USB_HSIC_SYSTEM_CLK>,
> +					  <&gcc GCC_USB_HSIC_CLK>,
> +					  <&gcc GCC_USB_HSIC_IO_CAL_CLK>;
> +			assigned-clock-rates = <75000000>,

Do you have any docs that would detail whether we can run with the
slower, 60 MHz clock here?

> +					       <480000000>,
> +					       <9600000>;
> +			clocks = <&gcc GCC_USB_HSIC_AHB_CLK>,
> +				 <&gcc GCC_USB_HSIC_SYSTEM_CLK>;
> +			clock-names = "iface", "core";
> +			resets = <&gcc GCC_USB_HS_HSIC_BCR>;
> +			reset-names = "core";
> +			power-domains = <&gcc USB_HS_HSIC_GDSC>;
> +			phys = <&usb_hsic_phy>;
> +			phy-names = "usb-phy";
> +			phy_type = "ulpi";
> +			dr_mode = "host";
> +			ahb-burst-config = <0>;

need required-opps

Konrad
