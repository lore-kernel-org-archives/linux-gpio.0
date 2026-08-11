Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A163BBA0E
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457117; cv=none; b=Z1beRF+z4D2kwWYAv6eUnNDS1WMAyoSgUagyFivwT1enaBCP+bUtN+6hdUN4Xgq0LWENQ60nlruBfVVontH70a46vn4bVcL1Cz56ansLjVhD+xAGS2LnQ1fWvltEM/KEJqw+SMhzrCCWlxKkHLhzWAlWteBkmKGao5Ouw5myn4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457117; c=relaxed/simple;
	bh=+rbrWplOQUk/FiP8xN5lpwFUzK9G5TZuSDlUqlo0pUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QiHeInXk7rfGvQN1Ase+/eiMuUuHxWzxFPMihIzAMeoSWQWvfh1po4GuRvBjQHrxBISPgNxlbo+XiVE0C3Y79VGwDXEqntav/JtOhYEjqjQKSlbbNlZdLUcL0LH7YmJeOQVo0APrQ2j4dWPciWqZrAfxt9alsRKClFraIG0b1Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUoExjr+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ac3EmoDU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUoExjr+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ac3EmoDU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDYDES695659
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 14:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nxmc0t9fxOdqcLZd0PYh+n6m
	JbD21/9HxGe9yWwmSKY=; b=EUoExjr+ON4eoiuMKz9/LIdcdbcYgqxzoRK2o+qj
	oV/qlbS06ZsA1hI6mo2ckNVx3PVl5ImtjchA7MZYT0qT9wf798r9ksS1RSbC3WAY
	2TCYqYrL6l8FPvMWGC011YguWIfVSw9il92z510MCYbtY2TOsQduzqLo0wh9KqR6
	/LOEI9vM6kshjQNlAypfkeyScPjBIFm7Ga0ttxf7lM4fTGWED91wMmIgvAGfcvQh
	Ou7IQgcRtSGYjabX5LAIOlDFk2hL252IvKbOd1WaWX6b2i2bS+fjITPpwYGcpmo5
	uV5zzINeAMwoWvBVV/OFJrFQ8r4TOOjWt7KiMm3ZzBCt3Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049gr9vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 14:05:14 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9778b29c71fso2972574241.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 07:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786457114; x=1787061914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nxmc0t9fxOdqcLZd0PYh+n6mJbD21/9HxGe9yWwmSKY=;
        b=Ac3EmoDUlmrineB8DE9NivAnJU/SSF7Ihl6F0QPMWx+vy/TV6DZFI+kfmdGlXylzoO
         0aoQHgzbZIJKwJHIjtByDY4wXdysWV4VaMhY2OnmIHp5HRfPDchZ00VYFz6IsDaMeCjg
         Z6d0xCJfISBN1kjmZo4pLUkHsdublD64tPj8+VVsQYTfp/YPeUetf/OKw/uMlyl0gT9M
         +n38Nmptc6bKSXQGbG8LajokJDXksivasFm57DyFYB9T7prH1onJFmRsKCXVHz9JJnaq
         RZmY+LjmZYP1yjxJrxcU5cRfYDDPKUNcdBXcwPvN+uB+CfhOzRLu4d1kKH47R6ds4oLi
         Dzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457114; x=1787061914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxmc0t9fxOdqcLZd0PYh+n6mJbD21/9HxGe9yWwmSKY=;
        b=tADLXdYAZoMyGW7PAkS29QWG+/nWDmN0h69MHfow2lK1WYQ94ZQcM7tXgVNc4Ku+DG
         h9kCP7r5oLhXsVItN5ZVKPFbIPDpP5NgWjcveov6wEyZMVQIVAUmsKkMn/WaVt/KJfdO
         pEsJkY2+nY2MY9ol/fGf4p/bfGgC9GOGtUbt35KDqi7kjrTb1pAaGrHun1HKg7alVvtd
         FN32VI0wWtKhabagZ3JIudwfZbEZO4Q640AuNnndeGUdD/P36W02fg8ov25jEioF8Bwk
         +6Orxg88axfPQwk/TClEWbxyMAU4CXsKczvuybzKYlf7TvtoUU84uNGVnged7TmKVXQ+
         c6EA==
X-Forwarded-Encrypted: i=1; AHgh+RqoLNQak9UhJEpT9CvLQRsdoGfQVd/+Uu+Hc5uNsVOg+VisiGnK+cKhy9TnUbHv8YCyuoKjkmSOOtWp@vger.kernel.org
X-Gm-Message-State: AOJu0YyVbFs10PQXiuH5xSb6igZemlHpZnufQ4PAehkVdygFUdYwhA9D
	CoofCHW7B/Q7xdOGEb2E6vBLaLITpvIeTs66JIUyKm1foSR686BPMMR6toPIgJYtoCNcRSrM13V
	S8xQVjoVyo4vFd/V6J6qgXLJRcOxxaU0H+mxIa2D2X9zSO/MOCqsAmo5QQqxSfevU
X-Gm-Gg: AR+sD13F9VORNBjGKKrFS6TWx5QtA4iZvFK9IiQSbUfWtB3lxuJKG1/yVrLaz90e/Ui
	tLQs5lGb+qN/s5HO/+xriHr+kjDOxHz8xV2nbzxUjvHv4BP8XhkBl4TUOT71lSGrWcDmJhU4kHK
	e+Dw9km70/RjcPnrhLPQs/ew8tYBtIytnrvg7VeWEHO0MHp9dffI02D1lkJW9OLjwvio5hEkLkp
	BDLTX+7nsoxUFmvo726JXclB/OBuroD7j5O2jIlcfqtkIhtHOJBuUtBqpHqv4O5gFNRyLJxolgF
	Nn7mkfPuvUSLtxHQCUSBNkINM0Z81bUXKN9PgpwjpnyhH+S+Hetb+JLBait642jc4uNXKeN+wrU
	gHc24oe1febIF8+zznfRp+qNm4R5NdGnWHYnhVtpK9flWe773g5n6KLn4BkkfArJcQ7qrhCAYGC
	gL1Cp4gZFjEdD02w==
X-Received: by 2002:a05:6102:4489:b0:737:bfe6:3b03 with SMTP id ada2fe7eead31-76c0a79efacmr150992137.7.1786457113747;
        Tue, 11 Aug 2026 07:05:13 -0700 (PDT)
X-Received: by 2002:a05:6102:4489:b0:737:bfe6:3b03 with SMTP id ada2fe7eead31-76c0a79efacmr150957137.7.1786457113300;
        Tue, 11 Aug 2026 07:05:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b448724d16sm324566e87.51.2026.08.11.07.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:05:11 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:05:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Message-ID: <lugf2oh6ocycg2uavba3ws3p7mawkfbiyxya4fqba7jc2vokhp@nt3egjsh4jph>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
 <7f4qs6su5fd5ilecy4r72suk6mqvj7oouz7ahgatxthqavrfia@wxilczij4unf>
 <vxpntlaebf4an2wgebgbwk2rdkingzjecdgylqv36wmxtyqju3@hkip3wqgendw>
 <c47b3af2-d265-4e9b-b843-05b5e63fe5f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c47b3af2-d265-4e9b-b843-05b5e63fe5f9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNyBTYWx0ZWRfX0tQmdpqO5J51
 xj0i6MO3CkjFkpANxxnileDNLcUJtXp2pFe5xMTYq3wEnHMA5stB0sjpzq+oeWe7FOpBE2iiOQE
 Rk+SKZp4Tw8vZXRPOs9cVAuuNou4gHk=
X-Proofpoint-ORIG-GUID: bgoFUueiQJsvSDtivCRyR9WvQxKS6oYr
X-Proofpoint-GUID: bgoFUueiQJsvSDtivCRyR9WvQxKS6oYr
X-Authority-Analysis: v=2.4 cv=cvarVV4i c=1 sm=1 tr=0 ts=6a7b2c1a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=DpJPHJr2yjW4mJ3v9wcA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNyBTYWx0ZWRfX8PnIW4J5Fhd7
 /gi0jQcePJCZDRIDCs207AJ78+um/4sXgmzyzQK8frORdZU6ORedUehrHO4r17okEvZ8DWepqNX
 D76CFPVbssnywld8pif5I5QylHkaEMxRJ2rsN2snBsfmLs821k9igJ4tdyFWWrkT5Q/aN38sX9b
 QZeVrncarmF4jL9crG8d6gAQZOI3XD+VsxhXtTi4NkO16538ux7y0x8mQTa16HvYYdB5nrshn0X
 Sqv2ACSDH7KL5HNgDTBJQN4dvPZSEHASpKJ4ufHFJ3MSf5nuVX9WlYRKhqPrZ1FqwSA2FX6ii5S
 QMfyP44CrzWaFgiwXg/UW6/Ra4+cELfnczNRxMTtn+sWsw1FCY4DmPBpIlsDcjAtKsfOrPgxq57
 AKN6nQjKYJwF0kSNvXLVY0OX5KSW+RQvNHaUbGS4PncvBZEA5W6wfoe3JpwYugcMHCjcY1FP5dY
 10+SPiDbWJCPJl4mKKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110117

On Tue, Aug 11, 2026 at 08:37:54AM +0530, Hardeep Sharma wrote:
> 
> On 8/11/2026 6:45 AM, Dmitry Baryshkov wrote:
> > On Tue, Aug 11, 2026 at 03:48:00AM +0300, Dmitry Baryshkov wrote:
> > > On Sun, Aug 09, 2026 at 12:57:00PM +0530, Hardeep Sharma wrote:
> > > > Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> > > > tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
> > > > assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
> > > > hardware.
> > > > 
> > > > Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
> > > > wrapper for its debug UART, so this assumption no longer holds.
> > > > 
> > > > Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> > > > Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> > > > ---
> > > >   drivers/soc/qcom/Kconfig | 1 -
> > > >   1 file changed, 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > > > index fd4d4ecd2df0..5b3c9d31fd7f 100644
> > > > --- a/drivers/soc/qcom/Kconfig
> > > > +++ b/drivers/soc/qcom/Kconfig
> > > > @@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
> > > >   config QCOM_GENI_SE
> > > >   	tristate "Qualcomm GENI Serial Engine Driver"
> > > > -	depends on ARM64 || COMPILE_TEST
> > > depends on ARM || ARM64 || COMPILE_TEST
> > Or depends on ARCH_QCOM || COMPILE_TEST
> > 
> > > >   	default ARCH_QCOM
> > > >   	help
> > > >   	  This driver is used to manage Generic Interface (GENI) firmware based
> > > > 
> > > > -- 
> > > > 2.43.0
> > > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > Hi Dmitry
> 
> Thanks for the review .
> 
> QCOM_GENI_SE is a child of "if QCOM_SOC" which is the menuconfig entry that
> guard (almost) the whole Kconfig, and that is already "depends on ARCH_QCOM
> || COMPILE_TEST".

Then the whole depends can be droped.

-- 
With best wishes
Dmitry
