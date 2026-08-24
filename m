Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAFF36B924
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558271; cv=none; b=gO2Dl02YRZddCYBKk2uk5G+X9SPYl5wftOm9Jtko7Wb6mFf2E9yvPN2Oq2U6bPmijfrx2X5P45a9BJ8iqnmdyowQmg352z2EC62+SDvNG1I6bN8ggs8DrwOo+izrVP5yHqqFmVJi3dPKJ+tsZJ+Vgq4SCGtHvIDvfWBHBgKZL0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558271; c=relaxed/simple;
	bh=GMRE8o4FYu0fpDK6C3DwWUu00g4PLrDg1fl5q+NGQb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFM3JHVmzxVzqa9uI2q+pgFtpxa7zVKrPK4BAWZW0fUQQzzJ/qQ7WSO4bB8g26iTAHqfawvDo7XxEfEIdywoQXFsx48jNAIoqKmI3oNo2ILg9rvC/T3I2SDPYYkaFcauPWasXd6MD96c+v6PRWbKtsXRA7ziOsdBqMeS59jwIHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovgqGziC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyUBIUcr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovgqGziC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VyUBIUcr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R8TL2058151
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oczCj5f3UWMs39FGECP1/K93
	ViDAX6FAuEBjSlTzqVE=; b=ovgqGziCxKRiwicrKzukwp+Vw5GFK9548mfORnVf
	O53d80Esj50DcLKwJfUquyd8gQdmqd9aSE/jKEmLtsk3GpoBqTBm3SfpqGZ2PPbk
	WeVczAQNgwfIUaGvZMIqQ+p7XAgir3mldG3r0V3SuJIlGlWPouFEaNP7SwPhsYlr
	QIMZxlyIKlNquzN9U9zhbQLW3lCY8nwysjlZ0KjX6lMWSX6AkR/zqURB9v7gaXqr
	tlOr+uiMEaEpbp4AgdAgEO3fHVp+uvahtZoeyhDQsPpfqskTIJvU7WfA/TE3dpQH
	OvU5BHt7zntrSmyLXDiH+BVHbO3wDe6CSWdm+FTdbJBfNA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr1a98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:57:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-77bc38b37e8so136934137.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 00:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787558260; x=1788163060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oczCj5f3UWMs39FGECP1/K93ViDAX6FAuEBjSlTzqVE=;
        b=VyUBIUcrX5qlcWOSwJ0QJLaYX06SWqyVxdDshwOX7cPrgG1OscU3a9CFyn/dTh118V
         zt3trvP4GegLGJlcQXnSqtZj3b5kLPlCaXR4hhKrPMJsDezXFqAfrD9d7XSriNFBTtlS
         ztZDtWRvCylAvi5aUcs2dQ4CDxtFBzlBkKv0zKoLQMUUPzA1pHVPdoykWl39qMVUOMps
         yET7xoiw5ONZtKUwqB9xBSimxRN+Tcn0ZBHfC+rriESko6X3gNDzvxEvno0L15+RMeNq
         OdyL/ryYAWelnTXqXCrhBX0Rk/vsF9YHbFYzCcjJTQn5+ypoMVMJj74s8SZj7AHBfD9W
         7YJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558260; x=1788163060;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oczCj5f3UWMs39FGECP1/K93ViDAX6FAuEBjSlTzqVE=;
        b=tT6xvhI4FZ7aK9Rul2b9ifv/mCP2sS7gX0tA23eEBzkh2hA7fQMfl3+TgdmabPcy2d
         IVsC76EZ0mXyry55eySoNZa8NnKnJGcvCKupwn9S3fCdRJgvOI4LpxDSPOIi7gUgpK2p
         p2lz72C+x7jExoE44TJnTUoVID40s3JR6X4umxLxAEAPEjf+Dfk+zLY3Bntx4kC3Qv+U
         95PW6WfyTvfDFP4NtIRhBlAZaPw1v9TZ3keFOAtD6V7q/0w92oOujxJT2qm+iNBO+zow
         tZ3e4Qs8dUq0tCbbf4DWE8wYQwusFguQDVN+edxkR3wALWvHpzyHMV1GI80blM3kkN1D
         TcFg==
X-Forwarded-Encrypted: i=1; AHgh+RppGRguxAtsqW8OSfq+nDi2wQVk9haX6qXMQ762aTV/K988Bv/gEC0VS04FvdedjoXQpSEO0W8iUPPX@vger.kernel.org
X-Gm-Message-State: AFuF++m2S6F30p1Idkwv9x83VdI+X4o0t2wTKKdiP38ms/RRU94G9QOY
	8zYV/nkjcoP8vwG9fgXkvQ+q3v3X897iBOoKyrblLleFI/24vB/73m3AhV2TxgSCG/XjbpGYQFQ
	mAq7tx6i/BeNtL2t10Y2VREZGlK1Kh9dU2IOBxUXWuFTMuO37lYXfGBroa9TdkNqi
X-Gm-Gg: AR+sD13izJzbFn32oLzvQOjZz5UdNeml5vmuEzeoZuBVHjfd88JxShjbocJpB9dFMcZ
	1y69zmnhg8e4ZHmIvozlet55zC3pcrZNFSAlK+RghWtRUa+Gym1UPGYJs+NOfJC6ugokXyb/T39
	duWyGy+VrwsiUxn9WMUxc6ZNqqqgttaR5KDmFfmj3Ux/kU7QRFccZil3hMd9uhjtGIm7WW2cgjN
	Nb7AsZVswC0p8G1nbFtpC5XwRpiAz1/YRIkV1jS29t3J3aeDvSSSPowOc8i3fqP01Rphmwk7woE
	Um+3U+S9wDHO5GzZo9qfkoRVS7gvxuP2yIolchQK6aNWOpmWLpDirM4B8FSxdghMm8sRWN+jYp1
	7PT1fGbA9snWDHiE=
X-Received: by 2002:a05:6102:2d03:b0:77b:2d24:db60 with SMTP id ada2fe7eead31-77bd3189574mr5175326137.10.1787558259426;
        Mon, 24 Aug 2026 00:57:39 -0700 (PDT)
X-Received: by 2002:a05:6102:2d03:b0:77b:2d24:db60 with SMTP id ada2fe7eead31-77bd3189574mr5175296137.10.1787558258934;
        Mon, 24 Aug 2026 00:57:38 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00129fsm8633622a12.1.2026.08.24.00.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:57:37 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:57:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
Message-ID: <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-7-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-7-196e2b306368@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX3z1uPqt/LpdI
 w1uE8yx0rWG73usLzi1Dsg76JvxV5NaEmPSxRsiwnnjCLPe9LYCqDxt9zaF1lTxW+TiZd1vnZaR
 hOStqKyEa2UwfJ3+K9wClxTgnnz6XdivoZceJlWZwO86xVsq2nWwVVfyfV3grr8KF9uA29N5W91
 O6P/oAGksLQbEa0OMu3116GNaOO/5F4HP2XXto2+F2xaJoDC+3Ha7pIK1H/MmhxpkEc1JWYaOX8
 cj2LEyDfJZ6izcwT1s3FET8lyzmzN/bWaOHRImoP2Oxd9Rnb2/UWAF5ql8slSUYz9aOTqB9nbd5
 bSvJCJwBtKs3tFOTmakCEAHiV+KHYfG701/X3aolGvISx9Ti//9F4mT0gpskMkAHg9B1LCIPOGZ
 ZeAK4HUfIVmV84AszWzP9O1ZRPR8rfbZX5eTurQ1+TeBQm0nDSeVeBMHFP3W8u9mY9uNRWyqqKG
 etACVl1xxmJc3hq0ZEg==
X-Proofpoint-GUID: W12fk-3iSRHIlPCvz7bzUiYj42cIe6ku
X-Proofpoint-ORIG-GUID: W12fk-3iSRHIlPCvz7bzUiYj42cIe6ku
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX3rsA7kkaggJ5
 VsCCZgTNUerg5dVM30J5HF/97nCdo3/+UMhHIAn3LYNiniW7vBhbKjp6hfI9muDp00s/JbgXYmD
 SzFoZHGpLh0o4XuqXwst3GKEX8KAeoQ=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8bf978 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PAQKBgKzElogREcGxNUA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240069

On 26-08-21 21:39:00, Hardeep Sharma wrote:
> Add the interconnect provider driver for the Qualcomm Kuno SoC to
> enable bus bandwidth voting on the platform. This includes the
> aggre-noc and cnoc-main NoC instances with their associated BCM
> nodes.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |  13 +
>  drivers/interconnect/qcom/Makefile |   2 +
>  drivers/interconnect/qcom/kuno.c   | 977 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 992 insertions(+)
> 

[...]

> diff --git a/drivers/interconnect/qcom/kuno.c b/drivers/interconnect/qcom/kuno.c
> new file mode 100644
> index 000000000000..9a5bd53e7ed9
> --- /dev/null
> +++ b/drivers/interconnect/qcom/kuno.c
> @@ -0,0 +1,977 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */

[...]

> +static const struct of_device_id qnoc_of_match[] = {
> +	{ .compatible = "qcom,kuno-aggre-noc", .data = &kuno_aggre_noc },
> +	{ .compatible = "qcom,kuno-clk-virt", .data = &kuno_clk_virt },
> +	{ .compatible = "qcom,kuno-cnoc-main", .data = &kuno_cnoc_main },
> +	{ .compatible = "qcom,kuno-dc-noc", .data = &kuno_dc_noc },
> +	{ .compatible = "qcom,kuno-mc-virt", .data = &kuno_mc_virt },
> +	{ .compatible = "qcom,kuno-mem-noc", .data = &kuno_mem_noc },
> +	{ .compatible = "qcom,kuno-pcie-anoc", .data = &kuno_pcie_anoc },
> +	{ .compatible = "qcom,kuno-system-noc", .data = &kuno_system_noc },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qnoc_of_match);
> +
> +static struct platform_driver qnoc_driver = {
> +	.probe = qcom_icc_rpmh_probe,
> +	.remove = qcom_icc_rpmh_remove,
> +	.driver = {
> +		.name = "qnoc-kuno",
> +		.of_match_table = qnoc_of_match,
> +		.sync_state = icc_sync_state,
> +	},
> +};

qnoc_driver_init() and core_initcall()

then

qnoc_driver_exit() and module_exit()

Please have a look at all other Qualcomm interconnect drivers in upstream.
