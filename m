Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7A538330E
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 02:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792203920; cv=none; b=mVV/jX1fY701xPijoNXqQCQH1n64cJndgD1ySFWbXY9lRlNKEaMimt3Q06/9ycIujFb5VF4VMUADYrjBxZx4KamYp9L3VOhm0VrbIlEfF8P2OEQET1pmBwnTiuFSOnnTqoRofHLZbZFtgIIPv5nYOxvUNHXuj0Y1RwQSiRJXvXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792203920; c=relaxed/simple;
	bh=7kSzh+8hr1/vGsRTQZvZjmH98OgqliB57+aAdVneaa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UeBcxMOdSMt3LEofpxjOdJTla0Csyv1kVGp/hjF8J3kLji/re6UfXRZiOK9FYwfjL8Gxeq02l9q5iwPPyxiwn1WrekPEKoj0oA+z+GDws7BPNz2y28DPJNxK0EvJ6ad0kTVYaC5DB0r7x5op7k4gXaGIGwFToWAyrPPgwzfBipY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGtUJbBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OB26lY8D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGtUJbBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OB26lY8D"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H0gtJe728759
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 02:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3E4NAFlkvp1zNwET4nmHjYkv
	HWYSnKGWPbvmD5NwYkQ=; b=bGtUJbBLYp7k63KFx36defWtQTAWnwEhvoBJHafv
	aqqAxCUJxZf1/gukLfXIdR47ImH5xhPHtkJXIbWI2St7Z6tusKKEVcEtjcHs+7D9
	mIKonZcJ0CkerJhSZ1Htqk/kQQk2In5L26ymmd8XfcbYtrpJCWWykK9WfVFgug78
	DTxfyBXBexiJ/y61KCH+uVrnF5nGfqeiOmRAIMkYkRfKxExRqm8Y3xmlWmcC8NFC
	PY9nIxzl4/O/ibcJ2trYiP/qy//xlokedDH7hIJBK/dWn6yckRTIr48oIDSZrHm5
	6K1ZUqAlcDEJdyYA3Quig66x0us2TEwLat8FTA8pCksZvg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfr6hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 02:25:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso759730eec.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 19:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792203917; x=1792808717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3E4NAFlkvp1zNwET4nmHjYkvHWYSnKGWPbvmD5NwYkQ=;
        b=OB26lY8D31BhbxbXZ6WlBWwQRKLy5m+Rr/EYkonigsAsdxD23UD4Grhst0Q1cIkNgJ
         BCm8EXfEDcAvfMqbLXON5k3Iz/VPIyTA/pfQ5916I3iJEG1iEwbTC3ZnZYNsO0h0nX6W
         9615Lszm2VfyemYi9hjK6/9kCyJSXZoPIa28yj+hwYs2U5ibYpj1hloh7EuEd3n2aUSE
         AF34HPOCfBYl5MSyYzMkuVESVgAjnHP8yyHkEyZcnsf3sWhq8l+8H67cBUhx3mbqCRQD
         uF1rIOrkNzW1In3gQcgh7qkbkeq66PJ1OsMzOWqhv4Fhaghg3YZrCVu7YRfwW2d9AsR+
         ocdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792203917; x=1792808717;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3E4NAFlkvp1zNwET4nmHjYkvHWYSnKGWPbvmD5NwYkQ=;
        b=vFrxnmyhp3hre29GDt7qp048mCr+24eIFZY7fEHMVwNtkdOwgcl5nxZaFQgcfnZaYz
         RyKIX2XTDqCpySx5G31c6ujOyCKKxjl7uNxwyvmZYNQqGGW5tn3T7gsGGyA6igxkem/L
         FjreQyxOqm+xE6IX2HzRE99E6mD+//JaeEfZajtUCtOxPqKcYspWtyFr/QhZtpUPut8W
         qyNz8o9Fm4/t7X7hBbpmc6ZoxZFGLy5BZvegj/9jOWRfxG0rsTgPjw6MBd2e3VDFZEXm
         yB34LeI2GcOQEYqJAGnPwCuybGy1IgYsz5W/ws8UK/wm9bm3tmKL2Zu8hJ8jEL02lcT4
         swkg==
X-Gm-Message-State: AFq9FYJrjIS3ptHmyExgqp8fl0ZsaT9FaBQzWDBFHyyW14vDN7kCkdmL
	lk+8OzyWYu6p98Nau7AoD/6YKrPN+7s44w/JXBDk5O40LqTD5xk9tp+VXsaU18wU8RggpnuaeZr
	FPHJemXUJuzlRNN/jEnzU+cH2HsQBfGLqRF7pEmqEyeLsK53f6g3JTKH3eZ8ejvtpMfTmnGKDR9
	Z79w==
X-Gm-Gg: AYBFou1St4zvhH0bYfthuZJvpR10x5cNBh3W1IR7q98T4dfqTdTVfFDRJU0mMLAnmOM
	ZD/QcvG8fD05uAGcosLDoCsu6oYakxSOeMbJVXijeHY476OWKV1HHv5q2fsAZGjNnl/1KJIDP63
	PRkqIDbmJhRb3tclS6CxEGZ6l6L4aMIOFWq9qqaVsyqUf3bvEUTbjAhDbuGYP1HenTLUAsix8YK
	qlKJ4pDLfLNCO6OWx4WDWpYO0j5OfT+F06wBxjTJn9Fq2GdWyvjvZvxgSICC2OUMfEFm4q8DO6G
	EDOnXYK0CWv2Ej9B++j50rASMcE0PKrYRlCSeNnYJSfqYzfaVQ+awELe5/DvSrOQgDXSseGJCxo
	SW6GoV72Tbp+l1Yjv3e3N9Tat+p8ISJ8FyaPiWXWAuw==
X-Received: by 2002:a05:693c:39c4:b0:35e:cfe7:4c5e with SMTP id 5a478bee46e88-361a284a463mr2009877eec.41.1792203916332;
        Fri, 16 Oct 2026 19:25:16 -0700 (PDT)
X-Received: by 2002:a05:693c:39c4:b0:35e:cfe7:4c5e with SMTP id 5a478bee46e88-361a284a463mr2009840eec.41.1792203915557;
        Fri, 16 Oct 2026 19:25:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm16620016eec.12.2026.10.16.19.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 19:25:15 -0700 (PDT)
Date: Sat, 17 Oct 2026 10:25:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/2] gpio: shared-proxy: Fix race between concurrent
 first users
Message-ID: <atLch7_22hRVUd7C@QCOM-aGQu4IUr3Y>
References: <20261016144919.1362846-1-shengchao.guo@oss.qualcomm.com>
 <20261016144919.1362846-2-shengchao.guo@oss.qualcomm.com>
 <sashiko-outbox-174507@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-174507@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwOSBTYWx0ZWRfX90MIvAlNSUPj
 AZ69cEb4wyvfDil+YK9xgoFV9x4nVMxRR6UvqkKvKs2JDbaRBfrRq/ajVOYvSy6lXQOXmIq4pZL
 p0iQ33GJdsdnueRX94uoRHp72VtoTpk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwOSBTYWx0ZWRfXzixap0xvkvAF
 /5Jb2StI07qaVO4/5/TQ0+Mw/Z3OMkAE6fh7pNxERjrYmO/K1ISuMOMNlsCzmlr0601w4clEuvT
 UQ7cII/YDjoEVo1cOu6R/kM8Y6aH5p0XqtRc070pSbeC8fBmeEK5qyXmaL8X/GTvRgVfBqDawE2
 t6elAR/m3MEwZ4h8mTknBelDDRUGTsq87qFviIlJF/2eimdHyDXQiSiEinxs1bIAkpjnaOhildd
 K+Kd+l62YH9Xs8uiTgahYPQZ1UcdnJUHTMqQha/BUSXUQZzoeSTebtz9Ib+DhJu2wOxT5Yz/0xz
 Cu8nH73fy9Pp9ra3nBUpBKczbrAyYHccKUE9u0BdbkZ20bKmjVo2xE11gRfNs606AKunOMdnrOm
 qsLK0FzWG+0ZIHZgNvDua0o5UF8iEugEwucjfT+4HtlpeNPORMuasF5zhnT4lqxqoLlJJpL1qbk
 v1qOH1PesFKi12pZP4A==
X-Proofpoint-ORIG-GUID: veuuUDy206vO7rG4cRLduKVfaOTtEFwp
X-Proofpoint-GUID: veuuUDy206vO7rG4cRLduKVfaOTtEFwp
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad2dc8d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_qsbYfLqpLheL_tQKl0A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170009

On Fri, Oct 16, 2026 at 02:58:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] gpio: shared: set_value(0) is a no-op on ASIS lines driven HIGH
> --
> 
> commit b2e913f9e7adbb02eb24728f50149f4b95e20857
> Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> gpio: shared-proxy: Fix race between concurrent first users
> 
> This commit fixes a race condition where multiple consumers probing concurrently
> can both request a shared GPIO before either configures it, causing both to fail.
> It tracks the number of proxies that have actually configured the line, allowing
> initialization only when no other proxy has done so.
> 
> > diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> > index bc69b8729d196..0d1d724a6a376 100644
> > --- a/drivers/gpio/gpio-shared-proxy.c
> > +++ b/drivers/gpio/gpio-shared-proxy.c
> 
> [ ... ]
> 
> > @@ -230,10 +275,21 @@ static int gpio_shared_proxy_set_cansleep(struct gpio_chip *gc,
> >  					  unsigned int offset, int value)
> >  {
> >  	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
> > +	int ret;
> >  
> >  	guard(mutex)(&proxy->shared_desc->mutex);
> >  
> > -	return gpio_shared_proxy_set_unlocked(proxy, value);
> > +	/*
> > +	 * A GPIOD_ASIS consumer may vote without ever setting the direction;
> > +	 * count it as configured so a later user can't reset its vote.
> > +	 */
> > +	ret = gpio_shared_proxy_set_unlocked(proxy, value);
> 
> [Severity: Medium]
> If a consumer requests a shared GPIO with GPIOD_ASIS and the physical line
> is already driven HIGH, does shared_desc->def_val still default to 0?
> 
> When the consumer later calls gpiod_set_value(0) to drive the line LOW,
> gpio_shared_proxy_set_unlocked() checks if value != shared_desc->def_val.
> Since both value and def_val are 0, it skips calling
> gpiod_set_value_cansleep() and returns success without changing the
> hardware state.
> 
> Does this result in set_value(0) acting as a no-op on ASIS lines that are
> initially driven HIGH?

Yes, set_value(0) is a no-op on an ASIS line that starts out high, but
the behaviour isn't new. def_val is only set by direction_output(), so
an ASIS consumer always sees the zero-initialized default. Its
set_value(0) then looks like withdrawing a vote it never cast. That
was already the case before this patch: the original driver treated
low as the default unconditionally, and b30973e8c392 ("gpio: shared:
make the voting mechanism adaptable") kept that for ASIS consumers.
This patch only marks the proxy as configured after the vote and
doesn't change which values reach the hardware.

I'll fix it in a separate patch: when the requested value is the
default and no votes are outstanding, write it to the hardware instead
of returning early. With votes outstanding the request stays a no-op,
as it should.

Shawn
