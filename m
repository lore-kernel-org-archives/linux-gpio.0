Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E5D3C4B79
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 04:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792210059; cv=none; b=apQORCBFOItYT92KtRyiOS6HcHzF2WkC+VBgGsNpAQZQtfScGIjqTJkGX6vixEcPnl/ycqDlzETvZbqpH7qPYxobIqb42vokV6wKABgg0M+BRK925Nyg4ZrhEPx6xThi7k8SOWADRkyhMNc/i72eVeRE0lHgkPryiWpKvcUZWRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792210059; c=relaxed/simple;
	bh=XLMg6WKozqqxrtCxD4UqZIfdVUs33PlcB9XL9vrDTZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnBx9lrjJJ9ld9wHl/bwo0OZxtK+Pe5h8YkCGQ9ZZ+X4/opZhIXaqpYD9MBEv0iBhKDIPH1xC+fz/+dpReuJq34uC9JT4zC0I5UjqGT/YnizLZHSwnLv7MasOS0cKSwEYvyc9z4xAB/a6RW7J4J8eN8A6kxTKATLgl8iOB+ih7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGx68zST; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Esi4UfCK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGx68zST";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Esi4UfCK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H312gP3781673
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 04:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FsBo1yGzhJ3knfkCYiExnx+e
	ODdzMHNa6OWQF46SqXI=; b=kGx68zST5Qvkx++BfJzo28TyCpwHucj3Hs7cZAsd
	mD4VD4ycpvopmKOqMwqlGqCnGKWy5NOxob47ZZ90OqW/kX6YfSSvuwXN/mKInGzW
	8rPBf4GkvyO+6w9WbzsUyB+7gHA2RzjPR1aXzMqo+0oLaY65eMlNagJeVFZ0SxOT
	0vVn0nd1AWf29Dny26uCMzWWean1yr3mGtylE2wjx0CPaaFdqlz6pKjPNdceKPe+
	8y4GpL+AMfu8EH1R4xwJGYjhanaBNT95FgZf/FR/uHF2+Xhy6k3JI3x7nSO5vb7g
	VM87vnM6699mqiFg9VZuhGMdmNVadxp9tTz1SmD21pPLnw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bgg4vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 04:07:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso637358eec.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 21:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792210056; x=1792814856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FsBo1yGzhJ3knfkCYiExnx+eODdzMHNa6OWQF46SqXI=;
        b=Esi4UfCKaoVQobY3ZH19p388NnSxf86kni5ilzwhQGNPXJaHo2Qg+ty2kvW9f1HNLV
         oj2qZ3VbTjA1ZZYJy4uCTmllt0gQyzRmw/NuKngFXZ9l4sTOugRsapc5fHN2dshivAE4
         sM4O5bl1Sdq9UwnxZh7p5JShqGuRTJbP9s684tn5+sh1JfiKSEKmOGdFAfhIOLVlTkt5
         UzI9Z0+LZwi1/GL6OvmF927Zg372ciRbl5KOGqQewGysfDtKhlET58xR0dOfgTM7FZQm
         R6iuYQx/1SvPb94XErR8eUF5x2IKLoVqwkF0m1Q5cSNh+lXsXLrFbg2UKPpPzmV0oFXj
         0Keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792210056; x=1792814856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FsBo1yGzhJ3knfkCYiExnx+eODdzMHNa6OWQF46SqXI=;
        b=CjPUtDndJEDpiC0edVH4BdZTRyibMP0zhnpyoARK5qUEQ9ZplKvoDf+WSBI0aiPNQh
         3O2ly95YmKNbVgDA3I8KhXgVNw1pMAxxZjcYAzf/aKSoGMfMfxTmis0h8929bVCKxv+I
         D+6Ad8wd2rm/Kfia4Rt1mbWea9Mf+KsB2E2ROKAMauarspNWbuO2SdWBjoWgX41vPqHd
         +b7RUXc0Y9+DSnW5MsLobSC/MsIDrWpXKxxLWjBCnl1I9EVUnkFU5fglgtaZ3D/o3Eh1
         fsyoNbjmTZvjMs8N150LRk9wQsCiZ2gBrzbm3jieRBcCYWWmAOm24sWuSSL0Sq1Idzq4
         JpqQ==
X-Gm-Message-State: AFq9FYJTBfSqmiaEA0F0i+GrNnfTnL6vKuvhzZ++Gb6s+M50JwlOng2c
	RTl//1XUK9Umh1ZJocBPnMsm3jVM0Hxtb/1BYhJsnDQ4uoLX3okjRb5Hct2JdYM7AmqfnaVbUvu
	w/mhmiaTRnp7FNixcJyEluKvFu9sYfq9S0iUqSHLrCNOf7PGd2PNncI2ZHMDEP2HzpdnhN4gJfo
	lUTQ==
X-Gm-Gg: AYBFou3tnANO8mm+LK0XL9jrEePf4RyvsVEx13r0KzXcu7PFjr/OU2oKGio4TEDM/5I
	VeDoddYa/xcNW3LRgYYEH25GuMfa2j32OYOUGbgwjV+ic6E65Hhp8FoWDvsavTsy40nddyZBUnB
	GllgfnKZzVH90JHFkanHfI+xL+k6ORGmBtJpLkeYVgkiF2kFtxvIzp+AIo7PL/Jx+uMD1XKIUFC
	XW2Cxdv5T2JG2Sn3kEzJnyJ7qgmz0cp5qJCniegPfBzYtNNgjzIKbT+anVwBwLSg+O96Yc1tgJX
	5E2LyLFj+Tg2VDxOM1U9LwtmaBAvtyczhs4BScrkegrv0wRvjPw+/aGXB1ra8x6O9u+R++FTDMN
	eRhV+r2VVqmve0ZtPdJCTkfKRedbGxCocLZMqBUhK8g==
X-Received: by 2002:a05:7301:2727:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3619f1fd67emr2662939eec.3.1792210056210;
        Fri, 16 Oct 2026 21:07:36 -0700 (PDT)
X-Received: by 2002:a05:7301:2727:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3619f1fd67emr2662870eec.3.1792210054852;
        Fri, 16 Oct 2026 21:07:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082f7f6e0sm12146475eec.27.2026.10.16.21.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:07:34 -0700 (PDT)
Date: Sat, 17 Oct 2026 12:07:30 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/3] gpio: shared-proxy: Fix race between concurrent
 first users
Message-ID: <atL0gsAehZZ02Wpp@QCOM-aGQu4IUr3Y>
References: <20261017024335.1432020-1-shengchao.guo@oss.qualcomm.com>
 <20261017024335.1432020-2-shengchao.guo@oss.qualcomm.com>
 <sashiko-outbox-175222@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-175222@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX5wiaxsb2JTZw
 LVtI1I8YeperTwUzZapV1rebwSjzhXNXnif9qN4REHA7UREMAExnPBfeivQCctg2A3JAKGnzkcy
 d7QAX4YwJhrHHOPfXXvemo7KAlJxiMU=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad2f489 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qF3NsWl1NSNDYTVCMGUA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNiBTYWx0ZWRfX2Os9m9FVARdg
 HkLGcwjnr1yWc+UlQty0Pn97JWvNdGpiH1a6br3wHXjVT/OTcqIeBFNzkvbEzcfXXN/k6/zM/lA
 mxsut+abJb61PXOh+aV0Uek2w9WdHG4AT03PUh5W95k7b0EdjEb5BRRRLlC3fs6Op1u1aKJGuzV
 nF/6b8GiO3SRK/HQ/4aJMuT1QPEoHvTzg65v7QWnW8BWnq8ma2TV3ylJW5/snJSOVE127OST1ac
 X6FQ3Z7jTfHT6m2gSISCwJZCnJxMBFZC4Nys30VFhWErmzhzuVVcl+Yuk709kvvtFbIs7m7lB1U
 SW9E0PDmdE0yRoVvX6q8e7d1MBzQSeVmpE1sUpjtLXHC2Y77AJ5xh2Xb57qDoKDnWXpp8l2HcJX
 UV0XpyKzMzCnRAxe1mCmWZjJF4jdOIvYUIvNKo3Xh0xBUpyHkE8je3pvCtJN1N5/it63EFhh6gg
 b5+a4rI+ufBYI1d1mLQ==
X-Proofpoint-ORIG-GUID: _C31xI2N0rsnC8apfo0sp-pSxkYXf9UH
X-Proofpoint-GUID: _C31xI2N0rsnC8apfo0sp-pSxkYXf9UH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170016

On Sat, Oct 17, 2026 at 03:00:22AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] gpio: shared-proxy: unreset vote state in gpio_shared_proxy_direction_input()
> --
> 
> commit f02d19c15e193895e840a218407e46f54481d01c
> Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> gpio: shared-proxy: Fix race between concurrent first users
> 
> This commit fixes a race between concurrent first users of a shared GPIO
> by tracking the number of proxies that have configured the line (via
> direction setting or voting) in cfgcnt rather than checking usecnt == 1.
> 
> > diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> > index bc69b8729d196..0d1d724a6a376 100644
> > --- a/drivers/gpio/gpio-shared-proxy.c
> > +++ b/drivers/gpio/gpio-shared-proxy.c
> 
> [ ... ]
> 
> > @@ -155,15 +184,21 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
> >  	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
> >  	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
> >  	struct gpio_desc *desc = shared_desc->desc;
> > -	int dir;
> > +	int ret, dir;
> >  
> >  	guard(mutex)(&shared_desc->mutex);
> >  
> > -	if (shared_desc->usecnt == 1) {
> > +	if (gpio_shared_proxy_may_init(proxy)) {
> >  		dev_dbg(proxy->dev,
> > -			"Only one user of this shared GPIO, allowing to set direction to input\n");
> > +			"No other user configured this shared GPIO, allowing to set direction to input\n");
> > +
> > +		ret = gpiod_direction_input(desc);
> > +		if (ret)
> > +			return ret;
> > +
> > +		gpio_shared_proxy_mark_configured(proxy);
> >  
> > -		return gpiod_direction_input(desc);
> > +		return 0;
> >  	}
> 
> [Severity: Medium]
> Should gpio_shared_proxy_direction_input() also reset shared_desc->votecnt
> and proxy->voted_change here, just like gpio_shared_proxy_direction_output()
> does when gpio_shared_proxy_may_init(proxy) is true?
> 
> If a proxy becomes the sole configured user (shared_desc->cfgcnt == 1 and
> proxy->configured == true) while holding an active vote (proxy->voted_change
> == true and shared_desc->votecnt == 1) -- for example, after calling
> gpiod_direction_output() with 0 followed by gpiod_set_value_cansleep() with
> 1, after voting as a GPIOD_ASIS consumer, or after another consumer that
> initially set the direction to output-low releases its descriptor -- and
> then reconfigures the line as input via gpio_shared_proxy_direction_input(),
> gpiod_direction_input(desc) clears GPIOD_FLAG_IS_OUT on shared_desc->desc
> while leaving proxy->voted_change == true and shared_desc->votecnt == 1.
> 
> When the proxy is later released in gpio_shared_proxy_free():
> 
> drivers/gpio/gpio-shared-proxy.c:gpio_shared_proxy_free() {
> 	if (proxy->voted_change) {
> 		ret = gpio_shared_proxy_set_unlocked(proxy, shared_desc->def_val);
> 		if (ret)
> 			dev_err(proxy->dev,
> 				"Failed to unset the shared GPIO value on release: %d\n", ret);
> 	}
> }
> 
> gpio_shared_proxy_set_unlocked() -> gpiod_set_value_cansleep() ->
> gpiod_set_raw_value_commit() will see GPIOD_FLAG_IS_OUT cleared on the
> input descriptor, fail with -EPERM, and log an error (and at this commit,
> prior to commit "gpio: shared-proxy: Drop the vote of a released proxy on
> write failure", leave shared_desc->votecnt and proxy->voted_change leaked).

Agreed, but this predates the patch too. The original driver's
direction_input() also left voted_high/highcnt alone when it was the
sole user; this patch only changes the condition guarding that branch.
With patch 2 applied, the vote no longer leaks on the failed write in
free, so what remains is the spurious error on release.

I'll add a separate patch in v4 that clears the vote when the proxy
reinitializes the line as input, as the output path does. Resetting
votecnt to 0 there is safe: under gpio_shared_proxy_may_init() no other
proxy is configured, voting marks a proxy configured, and a proxy that
frees the line drops its vote.

Shawn
