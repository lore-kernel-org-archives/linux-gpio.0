Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793170687;
	b=Cz3Vuhn8FBSqipepQgVaIYhzuXvAPr2hSsHUoGmnahPZyFtZF82+OdkiOWjr6GXEfq2g
	 X3uZIaFCZvAEkkOmsZpn36IDWyN8I2zlxC4PegMNlE1Vf+rzg5Q1GXtJiAIppcqBRbOR+
	 34XpHq3QcjB68tgr98XDTiVeMrLj76dde/l0LQ5Il15PXQeZdQQsebw3tY2kwS56YcOgI
	 rF9SKRPT9F377wgP8cmYGW6XVgr161ufUD8ACquavpkxJDP5JvdE5BdUY4f6QfUt2gckt
	 Lwxzj3pj1leyAMn1YZbgyHu6ObMUDcUCOq9fLQeS7lHjypuZ52YMVodGN0RfoiCVXHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793170687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VS4ShSLAanyAlY38ZoVAMSYpmnLuMlS7SrKkEO8Ofbc=;
	b=bRFfBGIPInAI/slAhSYWe4wUDKbPtMYzebzeEli6cwmvfo7SOOQgZJA1l9hGukFZn9nl
	 LR7VwEvdWG4NgZ0pfV1UAhSGtn3TsPL3PI6IopxPWzH37JmFtyXV0+ZH9kHJHaYU1G97N
	 1yNO4CxZL0pVGxVJqk68FimpN0Z9D+91ddMr/cmiHlrZ03McCvvAVyVvnmbEDpXjMH1Jn
	 9ZR+p3//9x1AXbcn2eNNozdhi40heLEzPxisEMshKcG83Fl0sLNMfW9RdXLCBr3Xn5+Up
	 kbFLfCydSzEdy/+ybjHyFVmSST2vsfI0qHJpQffPHVxx0XzIYbgh6kaEKlDYYa5xQDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MXaB/cCe";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AF0w4NsU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836D0606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 06:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 836D0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXaB/cCe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AF0w4NsU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PLAD1133391
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 06:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VS4ShSLAanyAlY38ZoVAMSYp
	mnLuMlS7SrKkEO8Ofbc=; b=MXaB/cCeoa8z7lcXWEwFcT54n4jHwDc2FfCH/jPu
	OiVrTiiaaZ+kN2LfxvVlH+19lnuvPWtuIO2Gylt8CCbu0xc9v9LSgZ2jccGzgN84
	egRnqwvdcMX6WcpSrHIraLbXMt1RzWEPjlQUq3gl0V0lEvP6MksuPrQtxhNUp/wv
	A4ooLS+/BBXIZLQhNpifBQ4szM10JsmzM29F7rEOqm0+AcwY1mZm9hOLcjQCN/e8
	KOupPxqwEc82iuXm0zvxStbn8sxmhtGos6S3GyswTnBCsD2SZnbRERsz4xwVisFP
	rkFQTseKu3MaoPN/03+88nbF7Msbxqa8T8jicchrxJxtrg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjptscy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 06:58:05 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1665200f4c2so1176229c88.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 23:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793170685; x=1793775485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VS4ShSLAanyAlY38ZoVAMSYpmnLuMlS7SrKkEO8Ofbc=;
        b=AF0w4NsUBWpIfF8a+5amDpzeJIDDVdHmu7TpxmBQRP6KLrL50Fe5PPsq0+JliFx02F
         IEELY5N/Z7dPTsyCKlc3XqBSaE0CEBZyzKZ31OlpxrZJjVolRCbYxKMieVvZQDDMCqCU
         Zulkw6HcUEpnBmZwTTuXSbPKOE8WAWYLd0z4tmwjmwU1fwHGuGTFgWaIxmX/ziDWqsom
         QF3HceD6hJkHBU6I5+jz8QObcIyfI8YwYS3WoO/6O+TO1qfO4tmeRED6N16arf6oaGl7
         BFnYOYF1rQv0sagAjf98hJls5iPKyPc88duJJLoc7qrbOQCVS42ZQyW5zv4a3Z97IT9F
         Ul3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793170685; x=1793775485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VS4ShSLAanyAlY38ZoVAMSYpmnLuMlS7SrKkEO8Ofbc=;
        b=Z9HImEtnKI8rdqo3IpJZIC7JJADl3KufoEf3yE59HELiaG1rDWMSrxdw3SWcm0IMe/
         3yePpy+jKNxqlTBN4WazWrXhFDpzGR0KqwOjOFyNCJ8uOxXV2VkvwkuOEHenkpAJGTlG
         wZj0VFWopUVVcjHS0S8kJTYkGXphFEbVMgD61AaydnB9dFwrwn0ZZczAl2FYkG5O/amT
         Q0osNHi5UVwY/YVPAn8t4+b0LBb47FYft9P77tgxKrpNY7rHf+aRESRLXxXi/jJ8SLCV
         RwUAoLC9SfdDVzG78WF8CNV8fBx1sLdV3Nq3u57CVWdExszpTLmmW+4XrHFdFxKNkG/E
         0Ung==
X-Gm-Message-State: AFq9FYJ8orwgRYLy3EOZD2SG7FneRZwVDovFM0sbzg/vmNA5AMu3SbRY
	vGfrkcq6gf/hah1D7cmOE+ypFKRQW2Wz5WncDMoqZxS/0KCVCqh9lZpsDQwU46DEx3E5W4B6g1u
	gSpSs9mwD/+/vtUv/YhieOCAEPsXvxe9sOL2AAAAfY66Y/DH4Zi8TE7ofGoT+KpSUpshG/Vic
X-Gm-Gg: AYBFou2La5wKj0hJdO2H2iNV80fkaXxAGt+k4h4tsvJt3IAnzCiQcCZptlfpNfwn1p6
	wme70Oo9PfCWwxta80I9TLHSf7oqcduMyH1bsE8ik0f0dJPWhnVMYl0K/4tbvyAdw2Am4aIga5s
	WSm4SyY36NxDAJHXDuk+cWOSHZPAOQIqYm5J+ks1+MgrQK1q5PEhTPe5c9/GHSG1byCtJssjYeF
	WjV7seDDG137EMknawwQcu2ZKXNzms8tIpw2+DIdoX1KruobvBSm0BaYeZ4V2m6tV624utoB+/B
	OVp18mvZlNrnCU8GS0dOnQSZ0vsFzTblbJ6i8pADMkX6osrZlnYmv8MKEEX8+U+WjKHFz9WnJqR
	xlLvSWPdnmkLXyQ40V2v/UzahunzwkA+x+jkMSh5tuwOOzayPmnIxplUAX8OInAWjafUjAHQ+b2
	m4GV7EfvGnFCV2ODw=
X-Received: by 2002:a05:701b:2302:b0:1a1:8974:593f with SMTP id a92af1059eb24-1a6cf447ae3mr1772963c88.30.1793170684876;
        Tue, 27 Oct 2026 23:58:04 -0700 (PDT)
X-Received: by 2002:a05:701b:2302:b0:1a1:8974:593f with SMTP id a92af1059eb24-1a6cf447ae3mr1772941c88.30.1793170684236;
        Tue, 27 Oct 2026 23:58:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f143cacsm2786314c88.16.2026.10.27.23.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:58:03 -0700 (PDT)
Date: Wed, 28 Oct 2026 14:57:59 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v4 1/4] gpio: shared-proxy: Fix race between concurrent
 first users
Message-ID: <auGc974DsKIskR_6@QCOM-aGQu4IUr3Y>
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
 <20261017043605.1503563-2-shengchao.guo@oss.qualcomm.com>
 <CAMRc=MeiENro-ivDkve5Y8C8aVKsPyR8x+Nd6gC5h_fn4ZKoPg@mail.gmail.com>
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
In-Reply-To: <CAMRc=MeiENro-ivDkve5Y8C8aVKsPyR8x+Nd6gC5h_fn4ZKoPg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfX1pXvH7eKGFpE
 zKWXoB3+5fouQXTfRF8p89/aAMctE+Kd2nxD4F8ULZk5qAcOeJpNN3nzepxgcDEJIH3SQ+M1wzp
 xX7UF4sK09VAS/+I4Sh8ZLSKoG1h2YhZZVvvQu0RqgdLSIKpTMNb2Mv5hMUI3CZE17PeKScWwja
 pkbNdDjzLW20ByttGz4+vLDAkbYrXAaRs1vIFUBEzTiGsQwcspl6QV4GdLKL811fuJjoTO5D6qZ
 XB6/vwbghRYaI17ZU+xeIvOp57W3EOLhrw7jefpIOlSQVK3qXlNXlZ0GL1/RJ3Bd2aSP3aJOcbL
 ztvrGi3tzAD49EHHuFb86WDCQRqUM6RL2vbVnB1t4HmpOhKidfuJQFcNhkLFQMFE5aRAJZjIeZu
 9I+iJLC4nDTjHdsYDHMd81IZj8PFQTsO8GN6c0iZH/BZy/y7PSgtA6vaA/5OZdcDRI+OI74SlpN
 EaYrSpVnPb0hMG9LMxw==
X-Proofpoint-ORIG-GUID: 2kk0RuasTm6Un-LL4h8WoCWTecQLW5sZ
X-Proofpoint-GUID: 2kk0RuasTm6Un-LL4h8WoCWTecQLW5sZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfX/w4tDUe9M2au
 37GC+bA9XLOB5E5zOKhacdw4jh8VCzmlOjbXNUFZGSL8RuUUpbiN/Tq/NIMVjOjNzVffKKb2H54
 V02JycIzzS0zrlVyIX/0F1IjdqLGUf4=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae19cfd cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wNbXBFNNolHxpcFWyUcA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280027

On Tue, Oct 20, 2026 at 11:06:23AM +0100, Bartosz Golaszewski wrote:
> On Sat, 17 Oct 2026 06:36:02 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> > The proxy lets a consumer set the line direction and reset the
> > default value and vote tally only when usecnt == 1, i.e. when it is
> > the sole requester. But request() and direction_output() take the
> > descriptor mutex separately. When two consumers probe concurrently,
> > both request the line before either configures it, both see
> > usecnt == 2, both fall into the shared path, read back the still
> > unconfigured direction (input) and fail with -EPERM.
> >
> > On Nord RRD the two DAC supplies are reg-fixed-voltage regulators
> > sharing tlmm GPIO 41. They probe asynchronously and intermittently
> > both fail, leaving the codecs without supplies:
> >
> >   reg-fixed-voltage regulator-3p3-dac: setup of GPIO (default) failed: -1
> >   reg-fixed-voltage regulator-5p0-dac: setup of GPIO (default) failed: -1
> >
> > Requesting the line is not evidence that a consumer has claimed it.
> > Instead, count proxies that have actually configured the line (set its
> > direction or voted for a value) in a new cfgcnt, with a per-proxy
> > configured flag, and allow (re)initialization only while no other
> > proxy has done so. A consumer obtained with GPIOD_ASIS that votes via
> > gpiod_set_value() without ever setting the direction counts as
> > configured, so a later user can never reset def_val/votecnt behind its
> > vote. The count is dropped when the proxy frees the line.
> >
> > Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> > Assisted-by: LLM
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  drivers/gpio/gpio-shared-proxy.c | 74 ++++++++++++++++++++++++++++----
> >  drivers/gpio/gpiolib-shared.h    |  1 +
> >  2 files changed, 66 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> > index bc69b8729d19..0d1d724a6a37 100644
> > --- a/drivers/gpio/gpio-shared-proxy.c
> > +++ b/drivers/gpio/gpio-shared-proxy.c
> > @@ -21,9 +21,33 @@ struct gpio_shared_proxy_data {
> >  	struct gpio_chip gc;
> >  	struct gpio_shared_desc *shared_desc;
> >  	struct device *dev;
> > +	bool configured;
> >  	bool voted_change;
> >  };
> >
> > +/*
> > + * A proxy may (re)initialize the line - set its direction and reset the
> > + * default value and the vote tally - only while no other proxy has set the
> > + * direction or voted for a value. Requesting the line is not enough: consumers
> > + * may request concurrently, so counting requests lets every one of them
> > + * conclude that it is not first.
> > + */
> > +static bool gpio_shared_proxy_may_init(struct gpio_shared_proxy_data *proxy)
> > +{
> > +	unsigned int cfgcnt = proxy->shared_desc->cfgcnt;
> > +
> 
> We expect the shared lock to be taken, so can you add lockdep assert here ...
> 
> > +	return !cfgcnt || (cfgcnt == 1 && proxy->configured);
> > +}
> > +
> > +static void gpio_shared_proxy_mark_configured(struct gpio_shared_proxy_data *proxy)
> > +{
> > +	if (proxy->configured)
> > +		return;
> 
> ... and here?

Sure, will add lockdep_assert_held() to both in v5.

Shawn
