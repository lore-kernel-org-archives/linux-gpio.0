Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C8937C0F6
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 15:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278192; cv=none; b=PCxAKm3vVphf9lKdArmd4XHluuMcob0eUYQHPbrxT80ax/ZAYvf+e45XiZ0/mQiERQ52GtboaQDCGD0MMYBrNHRp8BFDbIJwWdMASEU5LZ7C4bWBEGMjlLCyPybl37oxNNPUu93jitr8V4rQ3F3uguO7oxJ6MnWbFBQ20spfqWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278192; c=relaxed/simple;
	bh=lc0SWLpcQVTbTeNUJ77O7aLsobiha5VLom0ObsPZTsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tlG7sqHVgChz2ee3azKPnysA18tndhIkXcp4pRkNdr3TZ/iBPmra172cf+KA2StXmswWLsqgXKVPZ8LWRVUThs0Bg5Jqr4iPE4AgR2AWSMa1u6hCCkhrt+672ZDgpMcGLSyaQggco1bTnU4HRD9pZM5YnoJBRcJ8iuUPslzDcv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9I2e5u5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c10+6QQ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9I2e5u5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c10+6QQ9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E93Qb2912110
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 15:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jwr53RGsm4/NukuHmcmcy0N3sAukN970PME26WprnMs=; b=d9I2e5u5dGEQ5lbm
	yr2u5cAOVDuOBR/A9Nv6Dw6TjAgEoI6v6CmwjdpV4n/hnQnXmMRYIa1JOeTDzfmK
	grjV1WrRbi+6EA5uj/10za9ZhQdD0xpcOkwr4OMEkTOFnMAg2AxOlVNTocKiatIX
	tICDGzYGDC3zVuRlnV5VZNyaABwxk4Kc/QbWSOwFG+4Z3TUoZh4fT/giKggDHtVg
	l6cgtHCgZ1ULlvpmw4/OOYR8+Axl5fjzxcap9Pm95OFxnxuvyzbMyd4IxcKjA3rP
	seGt/BlYkvUnrb38IobgkVYVpQMzP0GE5fgbw8a+ZnGftlNfws0PKn+Y+Kk8/a9K
	sGxV3w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r39c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 15:56:30 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c6645a6ab1so3966e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788278190; x=1788882990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jwr53RGsm4/NukuHmcmcy0N3sAukN970PME26WprnMs=;
        b=c10+6QQ9O+G9tCYx3EvsfswkpvV8+KtTowWqlHPOZaImxBCOYticcq9dABDqhDW1Gs
         ZCna/W4aYEKO9y1iIhhGKWv2AdH7hY3RNorT/Frk1tefNWPxnL0jjQvtBiVWdq+51Xe5
         FaEJfPCySFY8SnTgKPJdxNFnq099p1aXDtNstQHp+gk96AQNZr7BT7alKZPmV2UdLrM1
         VUpSQ1gj7X5vSqmLhl9r2HgB2bFdClvmVXK8A1W73X9L/4azufTG4DglA3mNc9ofR7RO
         fIZYuXDxrIa+VMtVwUVuaLvEpje9qrRSQPyTpylJUwQAbJtlc4xJoGkcYP2iefI6qkWw
         XdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278190; x=1788882990;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jwr53RGsm4/NukuHmcmcy0N3sAukN970PME26WprnMs=;
        b=aRyQrcZvU3o4QaGGoXPFFmOBCqwPhxNw9Xi3rxsi9cVAusKokDnia00KBCtgriS8d1
         GGnU2ySf+plK26gw1kl9qbahu0Tb8NRpQ93dQutnnZK1xvFxiHsgSHMUxS1dWJd7Seym
         LfyN/UF6PM7wMe62Dz4iNbJkqi3lqRoPa9Q/zEqNviCMGBMxPM5QYJMYchXfajXWs9FO
         FG2dgq/18qnOXnEx/MoeuoQrRj0YyxRwWvihgHUnI+/9DEtacULf+cbFTe4kChrAYfcI
         8JjJcdGR/onJd3bzABCO/4VwBmKUoRmpdxJtxwiUxqpQpJ1n/PzyXaUQxEVbKFkmoN+H
         fbZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrh1TJFpZRtoU1ec2RMcsVrswlqR/SBWzy609hhvRmH0vymdMEBUZj1C7Z5fN/oF3ZyDGs3mNMhUSx6@vger.kernel.org
X-Gm-Message-State: AFuF++ldcZ+893ZEk8HAUNhlOQZpid/crRC50gsOXTnTxu9gFl4KXiwA
	IFZvgqa5acSK5ttHmEiAmQqYXDUJhF5cjXSIMEQpbVmSpD1DO3Tiv/09l5+bkF11ynB/Ynkg9F2
	LgPlnetj1/Kt6Y3cDonEQhgv9icS3mJwpfMrZJtslLlP+gtb5jEUA5cqfmQZDt/Vc
X-Gm-Gg: AR+sD12E9RNFWgntObMF/tItNv+Q43OmZ4klLOsr8Hns2Xz7JKy60duX0gn7gIN7htm
	cw07waFJtraGcn7CcMMnZQPSTQq/66SXgpsq0Whx7d2EQxAB8HFN27KLSFfs5l648uH8EwREmL6
	jE9mQH6ViKMZHIVt+14cxLarzSuJECpU0LlBpPdU7UGvqeKa42ix4ewdbeu1cOXL3ERkxJdltSO
	Tt1Vzq9nFp0ZQuUhpq2zkQt5C/YTGvtQSsjOIJdgHKse8MmPS/aETWNlTa6+JAdKQJZm3Y3qT8A
	HHQyhAh9XJAzK4+GTGAnsqLbHg5BFCboRbHYRys5eW+5LV9BbpN1uz+DOPTcPTo+7UibnOo06We
	nk13w6MSYQarTu8mG7LcQEw==
X-Received: by 2002:a05:6102:6a84:b0:786:8d84:5aca with SMTP id ada2fe7eead31-7868d845f20mr2619327137.2.1788278188922;
        Tue, 01 Sep 2026 08:56:28 -0700 (PDT)
X-Received: by 2002:a05:6102:6a84:b0:786:8d84:5aca with SMTP id ada2fe7eead31-7868d845f20mr2619315137.2.1788278188442;
        Tue, 01 Sep 2026 08:56:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a11f80sm3018433e87.70.2026.09.01.08.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:56:26 -0700 (PDT)
Message-ID: <1a167d6f-2dce-4d06-a416-9fd1e25c69a8@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:56:22 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96f5ae cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=OHs8NuuX1ptjo3lIKY8A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MSBTYWx0ZWRfX8hWpgdMkK17r
 EXsohQ6x+hxvgID2MQZM57Ed5dePQUhc/bL3QJrkp4oVAxnXn6tFLx7u45J/xbhyUmH3ph9bV9d
 Ky5Ww03GkT2xIdtRr4D4NHKSlCmIZ8xfQG4mU4COeQliyHNPFmfRSaR5gqTBldhmObJH6AFP6WT
 kIL/wC5GCnIJPsKesN17D0/rJ4hF4h6UFFPIcT4lqCJ4oT7E9gyCg/fJbexTjWJn/Cw2QQsLPB1
 8vm1dGF4E3W3eZto0vR4jDJ6k5Oj7n0XRuTAD7jpD6lim7TMfDAjndthdkX4MuJpJzTkxoskl/a
 X1XhsD+wkLGvqMSaCo9CE1iNHq9GVY1Bv16+hMoPXZ9knP0yhc2k2O3PuG+uEdX4dsgqL5kd+Ja
 ZyJEZNMNQ96f4g1x+gCCNEq9wrfF1sTox9DnzbKQjKv94bnlLnNPkT0dQpEJWptmEaFLc3MKz3m
 SVzCynu3r1bc1kMbLgA==
X-Proofpoint-GUID: rFrCNcCyymTNM9BK7snXJ1B4Ery9tql1
X-Proofpoint-ORIG-GUID: rFrCNcCyymTNM9BK7snXJ1B4Ery9tql1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MSBTYWx0ZWRfX6YA7bZsiMKkI
 dpFeYf2xz5lW52YiOA1uQQKOWXiUjK0cPJtjmlgJ86orIpswFHBDE8hKgMrmFfRxYydt0TVIVG8
 k0CwwoSLfPGKxMYlHSYdg9XluKPgEFA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010141

On 8/27/26 7:51 PM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

[...]

> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,kuno-pdc", "qcom,pdc";
> +			reg = <0x0b220000 0x10000>;
> +			qcom,pdc-ranges = <1 148 6>,
> +					  <9 156 2>,
> +					  <17 164 7>;

GPT reports you're missing a whole lot of entries here and that will
lead to the wakeup GPIOs silently failing.

An old local script suggests this map is correct instead, but please
check yourself:

<1 148 6>,
<9 156 2>,
<17 164 7>,
<26 173 1>,
<29 176 1>,
<40 187 1>,
<46 193 6>,
<52 266 32>,
<84 249 1>,
<85 256 1>,
<86 315 4>,
<90 43 1>,
<91 45 1>,
<92 154 2>,
<94 158 6>,
<100 171 2>,
<102 174 1>,
<103 23 7>,
<110 147 1>,
<111 31 4>,
<115 175 1>,
<116 177 10>,
<126 188 5>;

Konrad
