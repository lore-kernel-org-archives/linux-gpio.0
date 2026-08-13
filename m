Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA8E2F8E93
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 16:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640258; cv=none; b=mt/ucax27rycWYh8MCYFzkalqKkKPnJrrdHDTeGwf6+8Plq0SGdpFd5nQ2GFDHrK27DOthGT1TeWh4x3LQg1+5d5bio2FCsJ654We/GXydImjLHv2nUNCkKMgo8Lu6pDsOSLDVyTPId/zb5MDS23uff5ln1AmnKV75zq54avsPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640258; c=relaxed/simple;
	bh=EmZ/SXlYIoH6oNWoGBBMTimPLa7HdbufD2s4lqhmn40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orqu6r9xLHUc01hZ68oGSLyx8A4K+TKn+obX6jKcEPTXfDgZTC0MhGjVv8zJ4QxMnsgZGNZcMdAyG5nAWGEzYtbZe9WbJZQdgbdM5ur3KF0K0nOklond5ZCGLdnv6x2bek8n6JQ3bY4MgsWuvkHjLPwcHFL2ADyFVDKlLM9V9es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PkOKxoDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aY448BEy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PkOKxoDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aY448BEy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTS1W3177706
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 16:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuqyeQncFMQAlsz3UP4wPM6zG2Fv0v6m/nXYCxjALMQ=; b=PkOKxoDj33bdC1P3
	oz8NpOzn0Lp1h1EdjMAjYPkLjvV9J8h5B0/ydH0Xrw8mg2kXZBQ+vt4FwRpLSKKN
	ujh1Zw9ZNYMlTrA6CAQpQc+GfZvxKKvn5deaktJ6h1si/hqx0j/XkNRJgSvutuAf
	2tcAebQbWHlARVvNyPdyHGjZfzxSJ5hBk1rat+oKiQ03Yae379QpnEKn7iLvhl63
	uOA10hcsjzjU4ZKabT16dozbRL2yhbibJhNA7HdUKS+RWnxRIcxo/favVHZ55PGE
	a/G6p50MV6afL9Tsdro7D6cOX237ga1lwSMhs2xkg8m32fMkvgL7vRqG68H0BNAX
	rVRGAQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1f94gvyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 16:57:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso44976a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 09:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786640256; x=1787245056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JuqyeQncFMQAlsz3UP4wPM6zG2Fv0v6m/nXYCxjALMQ=;
        b=aY448BEy0yM/KsRTQB8jzV+a0GsnQ+ifNOGel0oezXa0I2iAgc9ziI2kepEQQ5Xb8a
         +gIXLiwFjor3JR5WEZU8FCJLdaL38ZObX7wTdA6/V+/O5hA5jWGjEK+0ns9nvj/+W81w
         NdYDAB0gw5m8oxnIyFnejhEpC1FMFZNp7TbP+QcnDfeeG6YebcYcY+FW5AtWTcycCWqu
         60a0TZy152NRwOs2bTWRbnMi2gzk4Vo9fPprAOKhRtYFzp1J3OsC6VzhGOBisCiCFV16
         N/2IWB1VYP42vwSFuhCnvNO79Q9NfifoMrDQ4HS7LDCQC2W65acEssbRtF54H9Qus/1n
         I3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786640256; x=1787245056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JuqyeQncFMQAlsz3UP4wPM6zG2Fv0v6m/nXYCxjALMQ=;
        b=JhivRkGoKUIlJQkOWkvUvdCObeEfd4iHgj1BWa1vO6pahliR8Ax/aoqSajvdkrCIgA
         jwZo5VSNBO8oZwZj4Z3+6CCxGa0+Civ8VJywrp/k/G8wga2Eh/VAmNAYT95Jg8ztVN3u
         RDcSzYn3AgYO9exaMAgJx3ol02zXrbMcwStV3GdYyMq1443wFVyNBUklZT4bnpUqeSiC
         TBWmqyd8X8wD1xqoaA4CXf6+Fwe8R328+zbXh9BxUBc+1uoqhFGMZwgNPesyAqVhXoO7
         Y4Jln4bXodKlWmbK1Y2gYLQ0Tw2U07Gq2KmatsCSoHWRdI9XAmMpC5UzFO639k4Gsbvc
         WpFA==
X-Forwarded-Encrypted: i=1; AHgh+RqYoUVrDgO901KsdvSLXdMXMon6l1CIRZo9WokuUKOIq6w9rhfUH6N8VairxNLuBvNGx2HNH1ovBrsB@vger.kernel.org
X-Gm-Message-State: AOJu0YwRjU6SLUM/cMpQVoyPu16U7C5LZwEQoo3LswFZiZeUbyvzH9ak
	Dw7obU30eHqisuto2dfbnw98OWMMi2O+MLDIEQzOCqbf3ZcDHbrvey3aN/xNXa/MAhyv4qHTbNd
	KjlPXhQVNeO+YpZ/75wW7gkMaatTo+vxQGxrRtFJoOgjEjSVgpGS0iHTWPzkd6BEC
X-Gm-Gg: AR+sD12Iw04hL8zvS3BI9SzmXpOAkJAgPrwd4LpNfolYBno2Hi8YU/gPXcCKlaPSstt
	o5cpDj8c94EZCLlHd+D9ONPoVJ4uAXhH0jIQO9YdEZQ33QWrIgGGl6xtUDDHgAFUIuVoUU1w70i
	L2YpodAvdAiWSm1rKIlshz2IwYbmU8f1Xp5E/BbiCeWgMV2icTIlUiK8EYQDFXzNSo5V8I66EFF
	GjEtCENqY9DNqgKcqkxwNN57VZ9TfJCEaXyd0jjxJaez8HWMzXwYb5/ARL1GDdGb9MrKShE2kC6
	Jm7Xm22uT0VUic44RE+vHOoybN61uElvsQyqFMljaQRyV0gWqzp/xVmLBSNNhGpf146Vdf8VrLf
	novminJX+WrLjJtTvP+rI4rtVfLZw/jQ=
X-Received: by 2002:a17:90b:1b0c:b0:38e:542:6485 with SMTP id 98e67ed59e1d1-3931e2069c3mr6772686a91.12.1786640253070;
        Thu, 13 Aug 2026 09:57:33 -0700 (PDT)
X-Received: by 2002:a17:90b:1b0c:b0:38e:542:6485 with SMTP id 98e67ed59e1d1-3931e2069c3mr6772329a91.12.1786640247833;
        Thu, 13 Aug 2026 09:57:27 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.19.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd468cesm4121774a91.7.2026.08.13.09.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 09:57:27 -0700 (PDT)
Message-ID: <7e42defa-f712-4d90-a328-344d9cee66fa@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 22:27:18 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
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
 <20260809-kuno-soc-support-v1-15-5e0ede4a0c72@oss.qualcomm.com>
 <wjzyvt7q4vpirxclbwexrhsmcoi23hmsqbjjpfto26ofci23t7@uufz7ilar4qk>
 <20260813-generous-romantic-asp-be92e8@quoll>
 <3zqx6nxp4wmzej3nokfggoji7nihosru6yyaquvwjfvtylf2fq@ucr235faztbl>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <3zqx6nxp4wmzej3nokfggoji7nihosru6yyaquvwjfvtylf2fq@ucr235faztbl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyMiBTYWx0ZWRfX6H+y+3T8kOB+
 eUTd6i1GxWnWXd3zsZO4yz1irlauQ1bMS5vdXKq7n8NsoFf+12Fn1cVbZiJjxkfB4tlv3if2nAd
 DsG8uDuz1ZWFpxwZjpgJ1CGUec5fqBo=
X-Authority-Analysis: v=2.4 cv=VYDH+lp9 c=1 sm=1 tr=0 ts=6a7df780 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=o18eRHaKI7CUylSTromjKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=TlKW4IKFNLZu7OIdjWUA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: w02R1F1Bc_s2ZDZD3fK8t5IcEPMHNsE9
X-Proofpoint-ORIG-GUID: w02R1F1Bc_s2ZDZD3fK8t5IcEPMHNsE9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyMiBTYWx0ZWRfXwYWQCm0G8VSa
 IgInOExzVGheHzE/sffVBDBmv+Pgx27QQ2KlrJ7idk+YipvVxwM8fdPsjiBnUXStbIY82m16mbI
 6u+Lk9R05MF1XvpQj9f8OKwasPVeNPsefFf6bcKPsJ438o0BbIWeN5iy03ks15JlszqieQTHBMG
 7Uhut/6cObx1tUTnVG/ftnnkUVA5xnXs0+9UKYYFYsUoJexvRVwjp8ikNOykQLPiw+3nJhmVIlc
 SD4X92Ns8SZrgOdWiPWAfcojKPEL0/4rs/ysmTnO2jir3p5HXD8x2DBt/1JsqDxgkM69VwvnNj6
 /aLekI+b0SP+LvUHqfzDIlvjUpqO72mXGzIoHC1fpen4l+lw6oql6VXBchy7immMyIvuMkeDk2c
 +12GHozM762YJ6LzEkZByWKBZoxGv9HhbDfrDJUcGTTL8klokiM0IpNRRunaK1FoH8V2EqugerE
 eMovSl2Agvpv5bhjh6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130122


On 8/13/2026 9:31 PM, Dmitry Baryshkov wrote:
> On Thu, Aug 13, 2026 at 11:44:28AM +0200, Krzysztof Kozlowski wrote:
>> On Tue, Aug 11, 2026 at 04:13:40AM +0300, Dmitry Baryshkov wrote:
>>> On Sun, Aug 09, 2026 at 12:57:14PM +0530, Hardeep Sharma wrote:
>>>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>>>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>>>>
>>>> Peripherals included in this initial set:
>>>>    - Single Cortex-A7 CPU with PSCI idle states
>>>>    - RPMh RSC with clock controller, power domains, and BCM voter
>>>>    - GCC (Global Clock Controller)
>>>>    - TLMM pin controller (110 GPIOs)
>>>>    - Interconnect (aggre-noc, cnoc-main)
>>>>    - GENI UART console (QUP SE3)
>>>>    - SMEM, hardware spinlocks (TCSR mutex)
>>> This is pretty limited without any storage. Does it NAND?
>> It has serial connection. this is enough for a start. At least one
>> communication interface is needed for early upstreaming.
> Yes, but then, as I wrote, it is pretty useless without the backing
> storage. Also, it would be nice if we new the future plan. Is it going
> to stop at this point? Is it going to be expanded in the next few weeks?
> Will we see a spread of conflicting patches 'arm64: qcom: kuno: add
> support for foo' with foo in 'USB, PCI, remoteproc, NAND, etc.'.

Hi Dmitry

Thanks for review.

Kuno is 32-bit ARM (Cortex-A7), so follow-ups will be `ARM: qcom:
kuno:`, not `arm64:`.

This series is the minimum-viable base (console + core infra),
following the sdx55/sdx75 pattern. Storage and the other drivers will
follow in coordinated series on top of this base.

Best wishes,
Hardeep Sharma
