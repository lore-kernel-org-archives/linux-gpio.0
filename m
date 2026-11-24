Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795499682;
	b=ADyHYHAYxTcLoo5Dm4ecV3y/6LAkeJ97YgTg9N3H5kdc+rL3WT08ydm1vW6wbG5UWBb2
	 i/k/sfmqybYlhMmVDGaLqqqEkw3hzPOy4YgZPKqWe4NVBEBAsCl/rYTjGYKc+wzK0xxRl
	 DUmT8vnbtcOVx6vO0eqcrPV8quvTImQtNOVl7Jwx6pEpW2hJMKmvd46tEmAt4Gb8yMzao
	 +xddKMNbLEuq+44z4X+Dhd6AyoKF2rl6xXzExt9lK4JVO1OvUeSZwDwOS3BFD47foJFI7
	 uQR9CNNl23+zlvfATC92TM+DRybAXW8cBq+8wVQ7yAYBirKYZ2NX26EbV5soIWAoGhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795499682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p2F/X7YyT2mZhxbTdXPPviQCiJgohVZUjp8KSIqyvWc=;
	b=Xe9tk9LpvCTWm5QvRax2oH3QXLebrtQqk4XtFb3kp5pWVBy3OM8lirvQB56m1CqLIieO
	 eoiKjOynhTHh2WAKHLsYo8BxFibsR2t7Jm5upjnevlheupnmMV927dmR9mRbtwKlijXet
	 U3lH6ywnqu5Y3cgstGFu/DLvlHMo/YGahiI0WGSrfU5EGJWgVAEedfFx+nt/Ca7T64BHc
	 A7l1HgBg5GrMigg7zxkQJFtENsROoZaUGfnuMTPYqFVv2Vyuu4WbNKyW4sJXpL3zZGF+i
	 3brV5YOaAyxjBSkomre5sbVx/jYKylAaTKusHjBsf4TQP2a0Nf4GkK1Gxuc8C4yRjQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h+zKG8DB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iGlRg7hv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AF3606A327
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 05:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7AF3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h+zKG8DB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iGlRg7hv
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kBPf902444
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 05:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p2F/X7YyT2mZhxbTdXPPviQC
	iJgohVZUjp8KSIqyvWc=; b=h+zKG8DBYEwwB8fBkW7csmjUq2b5VOpAFb8rkLim
	pr7oUpS21myVI5DYT11kiDgOdHj/BnWbJwmCqBnQGYiUAVPsr7OKDCsv83guXPuA
	UZE72WUePMYtkXFXYSVUUWIk5+dUZqdA24y6kgsYUHol8JYVTvLwG9nvRMK5F0r0
	AC4PPIG91jA4LsFa8JWk3BgJV8mpzx+96x8Kwy6t5h4g8b9sBG0t6LZ+AYO3vIFx
	3qUrVaJqxADcUMJ5UUjErty04Rjn8OfkhKe9q8dg0FUROKhLpMnPHJhW4CWpdgog
	pzhwlD30qCasvPgYv+od5d8LDqfXe7Jr5l2rXG8onLAfOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6ssn0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 05:54:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so666130285a.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 21:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795499679; x=1796104479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p2F/X7YyT2mZhxbTdXPPviQCiJgohVZUjp8KSIqyvWc=;
        b=iGlRg7hvz+ED+e4IONytVbzG+up7Use0aRYN5NC2iOWq4u6L+bAmXQZFw3z8Ff1lHC
         fIdhAze3eJP5V5We2VJI26z8MmDNH0DZKHjiGcEFswHeiunvJH2PlGfZjO19znB1L0Ut
         4FePw392jYffmIXWC6ukKWkvc1jftznLEF3HADV7W+5yzq8Mknx0uxor+viyWcX3ZQDV
         Pxo6s2nbf1FZlrb/f3kTsWwihkqYbTo47ELqeztZmM4bBDwzFG/y7FQJV8Tve48UFjpz
         Nfonyy18CkmdcIEwRY8rVdrwHS+Lcjd11wvbIxGlDWhGbP1feGFITwlYRgh4BfFO8A2J
         Jeog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795499679; x=1796104479;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2F/X7YyT2mZhxbTdXPPviQCiJgohVZUjp8KSIqyvWc=;
        b=EyRSIKYVMN7xZyoY9uXsHj5Y4CEdycyPj2INmzhADnCp/GkeGueUjrpBcnrMAcQB50
         0x3TY8XVSKVHgiaNjb6R+zZo9HyxN+3wM371gryX+jMLmTdkQfx1rm48+yiQ2lhSIuL2
         CUSdtIdF9KiIlCVGcB/ASm0m74t2IU55xM2ZnTd86o8w4gAvMj9sdjBBBpCYS21nMdsI
         CrY3DkRg7F6T1Acf8Mz0k3p2KJbLJfZBLRDjTjcDtQSgco+Y/m2XzweJfJyysXyAkQGL
         Rac9X/4tGl5uCmlShv8DWHtw7iZ6cQwHoOU74TNfnotEIw9r5ppk6W62HGGFaZT9nfr6
         0zSw==
X-Forwarded-Encrypted: i=1; AL+hErHjW2pETGOsJesXy88IJv04InbL468ntEAlNB0D2Kgc/UUAjQX9A0VBT0NGmntvjHAPsw2dcLY4DFC2@vger.kernel.org
X-Gm-Message-State: APuU4Z9pFJWp/+ZS3UWK73IgerZS9pmMpXxg9+FXcDehdR6ASPgFhA4i
	RJbJZVz1r5WDQW6Ch5IcAxYSXH91lurT4J5UjeWoU3Rw++vqEL+tR1PQVYj+5TpV9sdImHs5qrr
	K+xkUH1Pc0TLg76d5y8en9kBI2BynX3RouPh7UQdYURh7ScBvgGxag108XQNguQ9i
X-Gm-Gg: AZFdTZe2at1W6IcsBKWCsysbe/XoZclOjgB5igXwIgZtq1WLg60FzX4+fCoSQl/je4c
	AP7ldwmlABfSfPTkTTB5kGo6kWk25HXy+hLJ6Q+WK4wE7P5E2DrHaYg06ly1wwp61Lo+AcsNCLy
	QQIKcaMr+/TezRL60VEd8qNH7KsnZa/VyG9lrt9ySZbR5cwSFrCE5LkuTgVyMBLvku8Wfld/27T
	idmdSqy3hYr0yGt/9ZyVamgKlseGHWg+FeHHAZCQOEw/2MJmBPBhqvY19rFG2K2dDj2aOtCzfMG
	C0i9wx3SXZlS+OJsEzFSsgrYHnUxtYYL2NlO8jm7UeDciCXuamGXqOgNICXBPu83Ph78YnRBDHa
	iNl/9dxAYbU2REB6x3gxieMxppz0SlfYrqisW8Vl0NUk0ffUd8VBJQzaoDVRUpQH/
X-Received: by 2002:a05:620a:701c:b0:93f:34b0:4880 with SMTP id af79cd13be357-949ba965a2dmr2341232285a.22.1795499678770;
        Mon, 23 Nov 2026 21:54:38 -0800 (PST)
X-Received: by 2002:a05:620a:701c:b0:93f:34b0:4880 with SMTP id af79cd13be357-949ba965a2dmr2341228885a.22.1795499678192;
        Mon, 23 Nov 2026 21:54:38 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm27071399f8f.57.2026.11.23.21.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:54:37 -0800 (PST)
Date: Tue, 24 Nov 2026 07:54:35 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 03/10] clk: qcom: Add a driver for PDM GP_MN
 fractional clock divider
Message-ID: <6we47fk45276tlk6xnfbwytrnhxbfs6jld7ywtkcqa5yoqcpn4@g4ixfloipunm>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
 <20261124-b4-pdm_clk_gp_mnd_v2-v3-3-98db26a87500@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-3-98db26a87500@oss.qualcomm.com>
X-Proofpoint-GUID: pHjKZwUY2vFl0m_XKJpQq83F-xJzuefU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyMyBTYWx0ZWRfX+vbqTp3YD+I3
 RmNvWZSkhysHGyHs/bMqoZaFrWdC3dMYt0nQZNvUau6VRBuCsKvHqcxKaum6Wqmd17dcxAqUp+H
 VtxDywzQZVl4lFdT78/F2a2+2jFohNA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyMyBTYWx0ZWRfX1ooaZAYr5yyG
 Q/it7c+XvrEDCulrJAlQUbZcJOL7yCELIfj8uGNp18cfaaZ4b75HctNp22JAAVRQq4/rT4/LeW3
 /vcJE6As7WUfXvYuT1sDH+OFlyWXlx466kC3hHINAgxMKPHn+I8mRKD6Vyme646pGguRGHGHQWf
 DyQjUn+/0urmqi2NNvWy3JYlU2FuY+jyLyc9ALozfDSF1flTW1Agxfdg4jFqCsMUlPRLYjraR8X
 DMYhXOJ10x1ARYqTu4Qj791Zzu+EMNnakGoQzu97ySli/Vzx6hOnX5+EMfURgHFZDz08Zv43kms
 EGO4P7YYmex6TdRQ22NZBY0YA5KTXUEM+pmaONvzoJfBjbv4VHYJ56Tt3Mh6fIAkd28ORtregok
 7ZCs8LcxVEzTR1ZNpe8l/eivQTg80lQiU32vPC3kskAUQm4Hl38oPudmx/yvxWfZ4RuHEsK2Gbi
 yF6345J2WlFyfHto6bA==
X-Proofpoint-ORIG-GUID: pHjKZwUY2vFl0m_XKJpQq83F-xJzuefU
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b0526a0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7p-CmDHsQVR4PIcBA-MA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240023

On 26-11-24 01:21:34, Taniya Das wrote:
> The PDM (Pulse Density Modulation) hardware block on Qualcomm SoCs
> contains a GP_MN clock divider that produces a fractional output
> frequency from a fixed input clock (typically TCXO4):
> 
>   Fout = Fin * (M / N)
> 
> The hardware encodes the period in the NDIV register as the 1's
> complement of (N - M), and controls the duty cycle via a separate
> DUTY register that counts the number of low-phase native clock
> cycles over the period N.
> 
> Add a standalone platform driver for this block that uses
> rational_best_approximation() to find the closest M/N pair within
> the 9-bit M and 13-bit N hardware limits. Reject ratios which cannot
> support a valid duty cycle, and program the MDIV, NDIV, and DUTY
> registers via regmap. Implement determine_rate, set_rate,
> recalc_rate, get_duty_cycle, and set_duty_cycle operations. The PDM
> AHB bus clock is gated around every register access.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |  15 ++
>  drivers/clk/qcom/Makefile     |   1 +
>  drivers/clk/qcom/clk-gp-mnd.c | 342 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 358 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e6c58e8b184963fa3d885a7661ad982aaa5bcbc0..ccab70a11cfcaa3ea2217101ade50ab255631837 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -2170,4 +2170,19 @@ config SM_VIDEOCC_8450
>  	  SM8450 or SM8475 devices.
>  	  Say Y if you want to support video devices and functionality such as
>  	  video encode/decode.
> +
> +config QCOM_CLK_GP_MND
> +	tristate "Qualcomm PDM GP_MN clock divider"
> +	depends on ARM64 || COMPILE_TEST
> +	help
> +	  Support for the Qualcomm PDM GP_MN clock divider found in PDM
> +	  (Pulse Density Modulation) hardware blocks.
> +	  Given an input clock of frequency Fin (TCXO4), the output
> +	  frequency is Fout = Fin * (M / N).  For every N input cycles
> +	  the divider produces M output cycles.  D controls the duty
> +	  cycle: it is the number of native clock cycles in which the
> +	  GP_MN output is low, counted over 8192 native clock cycles.
> +
> +	  Say Y or M if you want to support GP_MN-based frequency and
> +	  duty-cycle configuration on Qualcomm SoCs.
>  endif
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index f84d7343a3a475dd9ef1fa77bf0de25fab0d9e75..bc487b25ef5d9a235162fad95a3e0ef2984564f3 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -229,6 +229,7 @@ obj-$(CONFIG_SM_VIDEOCC_8550) += videocc-sm8550.o
>  obj-$(CONFIG_SM_VIDEOCC_8750) += videocc-sm8750.o
>  obj-$(CONFIG_SM_VIDEOCC_MILOS) += videocc-milos.o
>  obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
> +obj-$(CONFIG_QCOM_CLK_GP_MND) += clk-gp-mnd.o
>  obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
>  obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
>  obj-$(CONFIG_KRAITCC) += krait-cc.o
> diff --git a/drivers/clk/qcom/clk-gp-mnd.c b/drivers/clk/qcom/clk-gp-mnd.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..75d620166e8dc044afb08d014f9707e9b53e8e31
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-gp-mnd.c
> @@ -0,0 +1,342 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_clock.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/rational.h>
> +#include <linux/regmap.h>
> +

[...]

> +	ret = pm_clk_add(dev, "ahb");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get ahb clock\n");
> +
> +	clk = devm_clk_get(dev, "pdm");
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	/* Set default rate if not already configured */
> +	if (!clk_get_rate(clk)) {
> +		ret = clk_set_rate(clk, 19200000);
> +		if (ret)
> +			dev_warn(dev, "failed to set default pdm clock rate\n");
> +	}

Why are we setting the parent clock rate from here ?

And then we just don't do anything with it.

I think this bypasses CCF clock tree and that's not good.

> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return dev_err_probe(dev, PTR_ERR(base),
> +				     "failed to map PDM registers\n");
> +
> +	gp->regmap = devm_regmap_init_mmio(dev, base, &gp_mnd_regmap_config);
> +	if (IS_ERR(gp->regmap))
> +		return dev_err_probe(dev, PTR_ERR(gp->regmap),
> +				     "failed to init regmap\n");
> +
> +	gp->hw.init = &init;
> +
> +	ret = devm_clk_hw_register(dev, &gp->hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register gp_mnd clock\n");
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &gp->hw);
> +}
> +

[...]
