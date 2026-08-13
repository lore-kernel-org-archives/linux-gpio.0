Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D393537FF6D
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636905; cv=none; b=edcjhylQf3cf2XH/2DKThxesX73GfNrBanQMSVCG4NMyi6ctU5OmJC9jVj+IicWK/pvIUqpmxvje3xLUT4Orp2JSTq8QcY4LHIwq3w9KUJGSkOB0OvHswXOjVozKCKx5sSEU1PcVa83cO14EiqVjNADGzpyZPOu+DlIxIgsYbQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636905; c=relaxed/simple;
	bh=RusOvcBFXx6SE72ZSRuUQFYQliPeDRYlYBCL3AZMShM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IH/FmpknqO/GajropMpzJ+bWhPMhJHDgO/zZkvAX8aUChAY++7DIn21I6xUAO/CRKQ2MXezfQZ5BlOgkMYEoIFzF5FaWaORtinFTgzEBVVndjeVoq389Vj7quh9o6yiZ7IGcs1k+VGCWrR0MLadlgI0fk442bdG7/zOlIvUMT+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQ396+7O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhP3l2wS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQ396+7O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhP3l2wS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFU3F93500618
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 16:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vrxU2QePt16cQDKb0SuC0GCw
	XAGtbpNoeaisWIEP/BY=; b=UQ396+7OVjyRMuYv5P6MZRCkabHXplnPXppfYvpu
	6PhVqvk0+5llxA5F9ONsu8oxyyaeKZM2DIiaI0WXcBuAayj9OMDET9B/k2TIYEvS
	+nN9yGMgvqFg+yhhAd6R/49BQ5cmcGHo7KOwsWskd/yv5VceoOg1Q/8x7lR4OUs6
	fCNCJsutXVITKPXmiYJZcvc1+Tp0gZeF53gq/9wcfQhRF0xTiChLpYQlXiZgtm+C
	1nmEKjZDnxvdnbXC3bImLvUE1naiMxKD3ABYCfhiw/p3dUYJLewnO1GEOv7htVH7
	mrkOlSReZvpavHbpsd1wzFqRcH+wjdnBUdzp6ecwgKz0Zw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18182j97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 16:01:34 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-977de2757eeso46772241.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786636894; x=1787241694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vrxU2QePt16cQDKb0SuC0GCwXAGtbpNoeaisWIEP/BY=;
        b=YhP3l2wSdRqqt6XsG7pqyhcbJWBjzqwukfMKpylHN5gTL0qRnoToMJKStMKEJSE+DK
         6mQApJlllijAkRibz0f8WztTmTuyq2Vrn+0Ti2zPvtBQz8dbMYb0xhmvxgKN/cHoYXyv
         jD8KDeupPwlJKtCGU+E9+/yLxzNvztwHF01o/gyKSF+eEdmoq3fqYszmF6SaSz426kXo
         QIPP4TUJuQTpFxksZKSH/2NXly2ruZkGuVeeVULM/iDP+4dzQHnNYyvUF45Xi7+wi1s7
         eEU0gS/z9bUFwkfHsi5SlgYevzih98n0lAlRICeYQ3FsbwnZpdNU+vKWNOLgns9H3Cvy
         X5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636894; x=1787241694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrxU2QePt16cQDKb0SuC0GCwXAGtbpNoeaisWIEP/BY=;
        b=BKmx2YqvsvewCus/1j3ec5pw08N/RoWDEpbV9MoSqs8pykIXVkvOMYBkD5IkckW1pZ
         Vhc+PZJROtGfxVxY4KNqVl/s9bOJVAxmrQM+gbCzO/MGH4T2g0SzujJEA2YdnQvo0Exp
         Ofg7Ec3FMwT1wYini/s7cMM46QEyNd33b9jOFlBsSdiX6vtJ0zJ0TQcwZY08jChUllqL
         xCnzCmRW/gTTQy4HYXbvL3grN1ZKeAE5QADQxQkPkGPDcfpxRsLP9F1xPRzkeLxi3gxx
         LVlb27pPOpw87MnWd4fT/OwZO08v5g+d5fo74s1Y1JS9IxfJclvo4ejDI3Pzdb7njLbV
         QTSA==
X-Forwarded-Encrypted: i=1; AHgh+RojrDrCTqAinp9CYPGZAiPfgYf3WJ1CGdHvC3TUtKWU5O0/grITT0/WeMc0MCJyYzYat4Q3xQhUJfB3@vger.kernel.org
X-Gm-Message-State: AOJu0YwiDa/7AZqqnetiYbAlqkeF6xHPT6x/t5JYceEXzRmmcfbPlxoP
	wCml+cSapWU2yztZXdROgoqtwQHGrCj8T5aDwY4bF2tPp9F9+QMnHHNODlIoRLfCp1ybhyeSznM
	jvmoDAAItuFRGyOJzr8U/2VDAKQmFKMpdvECPSKCl5sQxku63JwvjGRAWzeIK4uSE
X-Gm-Gg: AR+sD113GBo70W1jCpguw0sWYLp+7u3NuKssawhTVTVxtiw/n+Avr11UTkvWcHgXcow
	E2uAgBvW3JFASA23jGr4YwUORxpv1/QUr3paMclRgNPAaREKi8r952rehW85BlsHKAMcfiyIqan
	y8CFQZPhQLehefaKJ9mOOIWS1l7YuFdzerlOkKZOIFLjc6k1Q8BgLpL01pG2j4LGM6gVcWWvtf7
	N9j95n4HqRD1CwRvA8PFgf0krkSJv2j3nAHF61g9jHPyhoT/IVpHeq3xK++CpTSIyqYREygyORQ
	mWf7o1kDlZnKiipujoO7gyk6FgTGCPXhQGREEwgt9enydPG9r60lsdBkAk1UbrfCeR+x8iv1/0V
	K7vrtw7LUOpo+7M0DfpwDAnqqu4Ew7xOKa3F7vgA3jjcCrgK3UJ5pf7n1FG8FWlol1gXGn7Mr8i
	6McOTLNmPx2uLU
X-Received: by 2002:a05:6102:5547:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-76db5c7523emr1514586137.5.1786636893632;
        Thu, 13 Aug 2026 09:01:33 -0700 (PDT)
X-Received: by 2002:a05:6102:5547:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-76db5c7523emr1514553137.5.1786636893152;
        Thu, 13 Aug 2026 09:01:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a54944sm578211e87.46.2026.08.13.09.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:01:31 -0700 (PDT)
Date: Thu, 13 Aug 2026 19:01:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
Subject: Re: [PATCH 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
Message-ID: <3zqx6nxp4wmzej3nokfggoji7nihosru6yyaquvwjfvtylf2fq@ucr235faztbl>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-15-5e0ede4a0c72@oss.qualcomm.com>
 <wjzyvt7q4vpirxclbwexrhsmcoi23hmsqbjjpfto26ofci23t7@uufz7ilar4qk>
 <20260813-generous-romantic-asp-be92e8@quoll>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-generous-romantic-asp-be92e8@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNCBTYWx0ZWRfX4JF844tjRMZm
 //whKL67pLK73PwcdKtxfGlYF+PPo+HU2RNIHMrAT/4vKovb0W0ZWzQKp1jMdyxsBU/8o/ZSfsw
 uEPNBvlfg2ZgbwWMAFPS/7LVdrmQ5YM=
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a7dea5e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=foydBGwHzjCcBrRpJO0A:9
 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: qu8wm58QBnUX5QjiGdFlwQBucLNXKhty
X-Proofpoint-ORIG-GUID: qu8wm58QBnUX5QjiGdFlwQBucLNXKhty
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNCBTYWx0ZWRfXxj0RsDbR40J3
 Z5z2gL4/MgWFt9GxPl/Sl7DL9gHgfbGzfM3/X2I0FRlDF+p3WTHiJ/env9Q/azRWAFvj7ba7kE/
 bLbK+xMk94lr3D9A9OXsqLM+GrC4y849u2EcHnDCoDtUMQkBsSbag/tRpfnPwyMkw8dgFnbw9sP
 iy5djBzsfLYcA6ZY4xTRvu4kSilIBiYxQykklMHfI3Sm4jfCAVC5KIZjUtqQiQ8HGIgYSfJ2HYU
 7btgPRw2VQWV9M2lH9i5hqWNPSlLbeihsW60VkPTFqlVsO4jtowXqjj6q8qxg5rb5dZc13IK3Sg
 zekkd6eSBlPUFAy/XVS5hksPDFL2HPYE7c18fqp2QHCdiJpbaFaSL09UwJC/GH8DFo6Hu0tWPYd
 VHMhvLqNN6u38QtyQvee38vR4FIuHI4Jk5YDyN8kx8X9pLYALouKs9f6CM+tohFuFF7X7/m3e0C
 jwekyvocoPuqe5H0J4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130114

On Thu, Aug 13, 2026 at 11:44:28AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Aug 11, 2026 at 04:13:40AM +0300, Dmitry Baryshkov wrote:
> > On Sun, Aug 09, 2026 at 12:57:14PM +0530, Hardeep Sharma wrote:
> > > Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> > > (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> > > 
> > > Peripherals included in this initial set:
> > >   - Single Cortex-A7 CPU with PSCI idle states
> > >   - RPMh RSC with clock controller, power domains, and BCM voter
> > >   - GCC (Global Clock Controller)
> > >   - TLMM pin controller (110 GPIOs)
> > >   - Interconnect (aggre-noc, cnoc-main)
> > >   - GENI UART console (QUP SE3)
> > >   - SMEM, hardware spinlocks (TCSR mutex)
> > 
> > This is pretty limited without any storage. Does it NAND?
> 
> It has serial connection. this is enough for a start. At least one
> communication interface is needed for early upstreaming.

Yes, but then, as I wrote, it is pretty useless without the backing
storage. Also, it would be nice if we new the future plan. Is it going
to stop at this point? Is it going to be expanded in the next few weeks?
Will we see a spread of conflicting patches 'arm64: qcom: kuno: add
support for foo' with foo in 'USB, PCI, remoteproc, NAND, etc.'.

-- 
With best wishes
Dmitry
