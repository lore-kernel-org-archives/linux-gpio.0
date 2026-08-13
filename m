Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568764968FF
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 17:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640773; cv=none; b=CMNqd3zRmei0lWzvBrn2cAn/FJSufr26Ivn80h4bXpTaXnHttiQkROazCL2Bs/M7vmQB39chtIq1AvCj8cuTYWyqxfmoO8bslk9frHWkYZVBdsYUy/i+zMgviQfKoZq7y0+1onDk72AyVhj8yW3B0YJJNjq4DnVzkwJEDCdezEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640773; c=relaxed/simple;
	bh=B36AwCUnWoIPs+VzBRY/WKH+1J5rKdSdeYvYsq0n9r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HN6Ecjrt7jygMjca2PU01W64zTKWF0L6dhzW7LFhEEoLrGSg9BdcMTfqNwsPW8kv56JU1/2e/XBbmbwqfDMOVwOE8KY7S6uIZatWIDUOJzPF2XUBzZ/ziI8zYL+rqXtZGoQQgryKlDasHHs4caxfBZZIYmDFmEFMek08N3thMT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3uV44kY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XoApxam0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3uV44kY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XoApxam0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTKn62778274
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 17:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cddrscBfzbjs0vy6WWXuqpnU
	tgMOMnWbwDcitMMOPPE=; b=X3uV44kY2i7QamZLhCDB4LKDftGTTFVNk2Zdb2dq
	qFC3OjKKltqMMpnF13ZIERSeEvwBJm65jqAS/KJZE5C3UqAQt1WWiCAKf+RWY19h
	onxZzvj/pQfLpVmhHyHcxbw4V+F4+IYolURjP2xhNswseOCwx2tjim544b3EFkKT
	gE1jeWJbrz9IR72nycjsaqobWZ8PZp4e2T6sX4KdrveK85cWq4FTDX7wLHMk8KWn
	sz82GHbbndhoBAKi2NICI4i8mZ1J+5V+HKFSTZt3L+W1/F5MmjDz7UriR7uYltrB
	Ci//flbJLfbI6Tn34E6B+S1MshRiEXRKP6t8wPXg2vmtMQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1cb5hqtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 17:06:10 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-744e7c36621so20572137.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 10:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786640769; x=1787245569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cddrscBfzbjs0vy6WWXuqpnUtgMOMnWbwDcitMMOPPE=;
        b=XoApxam0e0Xd+BWw1vmlbJAb5DYOhv+bsCf6NKW9HmhIDyPV+Pal5vJb5Tob9u3K77
         u7ohqtilvCPX8gzPVAOWl+YvRfmC8z8o7GIPTKtn8NcyQN1MHF5APKBFpm/JNHWMhYio
         nbs9/cRRTiag4BWzBTuhx+iqDFe411FB0cKyqNkc2hURBWQ4WTtEr9/W+P+1f1lLFMWs
         2LD9DNaF5jGvVedkhs5rww3MTlgijzxEl0mRS181C/HgeAuxbf71iuaQHJDxSe234WsN
         g6wZS9nlszUpgNhX0KGBbKT91W0Z4Kh7o/PriH24vSxU15IGT/D2IiPKdHQpyuq7HP5k
         vvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786640769; x=1787245569;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cddrscBfzbjs0vy6WWXuqpnUtgMOMnWbwDcitMMOPPE=;
        b=VQ7S2SJdxxKhTunsex/dR5I2RZ0W3nfKbLM/hldfQZlJ7/7c/OAuUPzJaCcRjeIG0B
         ndYA3WFVwADNFbjTQqvmYn+ecDcaWWrlC/HTR3j3wmGr7OCYL/FLqjxG5wrdHn2fSp6k
         fUGKZOh5SmE57WOJAC5hVRMsHao9eWtzaEeJtSIz3LffgAVggjSyXcr79SC1dLpHXehD
         14fs1Ga9ISaihJqoYm+9HXQXcsKRg+W9kMfs2Mmlu/tLR2GsKV/bhDc5ftgKlK/9dsTF
         DcdusuvhWVTXju+gfGK2gvynKP1ak0QhFpLYdOXmp/gsrwrszHSQxC+hQVheNPig0LLM
         zx7g==
X-Forwarded-Encrypted: i=1; AHgh+Rqthx5W7KiLZlZtBkSHF4zElPOjMB12s3M71y6YQZraV26UTzIOfohajW3IX39aiKyK+MXOA7+jEW+t@vger.kernel.org
X-Gm-Message-State: AOJu0Yyay1/G4XsLCPxZqJD4vSI/dVmtq/gvt8/B8QtGCE8Cw5h+3jA2
	1yCt5JvRdx3LEtHjPZWtPdDyETcbTTz3KdofM4r1LekCuee8bDB51dSSZSwlLI14eFUEcdvzy07
	5lP9koGnLjR5pDaZUNIRzjTS1qIHV+Ffk+1XNoKOukicSzT4j9aAN6cFK/3JsXVq9
X-Gm-Gg: AR+sD11Zy74uCCnhEaKB+6O6+UKaG9pSZy+UF7VlsabetXWqYLvWujF6Y3E4AadTae/
	z0m38GILtZVGI+CgYQswj4KEbQoLKWhOETwatStHIrE7XxVevgk+EiDKQGO0WnJQtsLoCLtru/p
	K1HF6rvusoeDYPYg+Ju5Xd9nBsvg6td8fFuq0ZDxlnu1yippR5nGCuuynGrguo+uNFx21OPqt2Y
	PjIKlBRJyzrjiqqJVJOiJNgI0JKQKJJICkK+oF1UtyEn9KF15T4NPQiu/xHgO7JZ2iVFSNNkgs3
	///KtSN1LZQRkWZI8E0Nd6F2CvoCk8B1+tTEA4zddsBgw3ffto7PlyQUBcTwTpdnJ9vrvFjLGjr
	KTSYwG2btaeRAVDGs2isCgzkuC5/C3c4rAIIV8CY0627LxfSA7G6cMdaxCeCNgAl77dh1yOq/O2
	rNTMbggN8al+2p
X-Received: by 2002:a05:6102:5797:b0:739:d787:be8 with SMTP id ada2fe7eead31-76db748fd89mr1667698137.9.1786640769365;
        Thu, 13 Aug 2026 10:06:09 -0700 (PDT)
X-Received: by 2002:a05:6102:5797:b0:739:d787:be8 with SMTP id ada2fe7eead31-76db748fd89mr1667673137.9.1786640768831;
        Thu, 13 Aug 2026 10:06:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458b9a8d4sm13061e87.15.2026.08.13.10.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:06:07 -0700 (PDT)
Date: Thu, 13 Aug 2026 20:06:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
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
Message-ID: <kbft23c77y4ebuivd4yo6wspoyojcv4twhazaltjws4a2st4m3@ene2fdawtw5s>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-15-5e0ede4a0c72@oss.qualcomm.com>
 <wjzyvt7q4vpirxclbwexrhsmcoi23hmsqbjjpfto26ofci23t7@uufz7ilar4qk>
 <20260813-generous-romantic-asp-be92e8@quoll>
 <3zqx6nxp4wmzej3nokfggoji7nihosru6yyaquvwjfvtylf2fq@ucr235faztbl>
 <7e42defa-f712-4d90-a328-344d9cee66fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e42defa-f712-4d90-a328-344d9cee66fa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dsv55H1eoQfhVbAGrNFp1CqsIwTqvuf3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEyMyBTYWx0ZWRfX+uvokyy11edM
 0EAOjFlKt6BqTzh7JpzFC8033rJmrGaZVnWgzebyGTSUTQ5giHV7e3jNv0eoI9dX4rXxio9xyoz
 MrlYQSdGJ7Epphx2wtdo5WWNGDbJXrY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEyMyBTYWx0ZWRfX4II+5+7xENbG
 cNGWxQe0JmfsUEsRm3nhg+gfQE6fZoCkKarrk27T4HRy/7dCD5Ybdq++6TAtvRmdqxTkoFhPNNh
 08zX/K6a2XCIqtKttqcnDmR6i6nEPe+Y4hlmEjaykY0q0DVh2SK4ORVnYYQBIT6PZWw348XO7C4
 Ozew7m/pe4JE1ruM7yLPJqt8R/IGplRxTx725eGAc+i5D8qQPOjPzVuRL51quth5/A86VKXayhY
 aMVRijkSnY8y/yUGKQWlKVqyOvllvrwgYi5pDCL/yBJkUJJus7qtzBObgHV4mkhRIuCf7y92byA
 h6Yna981u9kN/IOdpjUlbLCxuQSOTRLo+4uR7g2NadvMrFrceV7rFYNglRH9vYy3mTezg51tojZ
 d0qsZ67R36cmLpdoN3S+hXgHUC3v6WdQIATarWuyKUAFlQsffdDT0vWEf9xKTY5sQ58CytjF3U2
 yLVKc8ZQBEeC5cjm7Hg==
X-Authority-Analysis: v=2.4 cv=GoNyPE1C c=1 sm=1 tr=0 ts=6a7df982 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=yeIXzWwml7xpAbmzry4A:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: dsv55H1eoQfhVbAGrNFp1CqsIwTqvuf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130123

On Thu, Aug 13, 2026 at 10:27:18PM +0530, Hardeep Sharma wrote:
> 
> On 8/13/2026 9:31 PM, Dmitry Baryshkov wrote:
> > On Thu, Aug 13, 2026 at 11:44:28AM +0200, Krzysztof Kozlowski wrote:
> > > On Tue, Aug 11, 2026 at 04:13:40AM +0300, Dmitry Baryshkov wrote:
> > > > On Sun, Aug 09, 2026 at 12:57:14PM +0530, Hardeep Sharma wrote:
> > > > > Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> > > > > (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> > > > > 
> > > > > Peripherals included in this initial set:
> > > > >    - Single Cortex-A7 CPU with PSCI idle states
> > > > >    - RPMh RSC with clock controller, power domains, and BCM voter
> > > > >    - GCC (Global Clock Controller)
> > > > >    - TLMM pin controller (110 GPIOs)
> > > > >    - Interconnect (aggre-noc, cnoc-main)
> > > > >    - GENI UART console (QUP SE3)
> > > > >    - SMEM, hardware spinlocks (TCSR mutex)
> > > > This is pretty limited without any storage. Does it NAND?
> > > It has serial connection. this is enough for a start. At least one
> > > communication interface is needed for early upstreaming.
> > Yes, but then, as I wrote, it is pretty useless without the backing
> > storage. Also, it would be nice if we new the future plan. Is it going
> > to stop at this point? Is it going to be expanded in the next few weeks?
> > Will we see a spread of conflicting patches 'arm64: qcom: kuno: add
> > support for foo' with foo in 'USB, PCI, remoteproc, NAND, etc.'.
> 
> Hi Dmitry
> 
> Thanks for review.
> 
> Kuno is 32-bit ARM (Cortex-A7), so follow-ups will be `ARM: qcom:
> kuno:`, not `arm64:`.
> 
> This series is the minimum-viable base (console + core infra),
> following the sdx55/sdx75 pattern. Storage and the other drivers will
> follow in coordinated series on top of this base.

Ok, thanks for the confirmation.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
