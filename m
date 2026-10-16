Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3E638F95E
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161520; cv=none; b=NQbwrpOFqv0LG0amiE2mcMwYvnK24QZ/op25GBSGdx2tHX8FsXUzJoZxWlZV+iuzu/sahqWZm2ZQTjSM68yQmO1itdjNRV2KGG4f0fKnVcQuE/JLcOmTRqKosSziZBUFIdDzkXBS7tvV8bELRiW6kZ3FFzx6flb0Fl48fEfT2vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161520; c=relaxed/simple;
	bh=GDbfc0JsVwB1zy312BMJhVLKVeaYlNidq7KK49cPZ+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYOcJ/kk9WIYKezkImeyqzFHREkMaJit2KI09ojkWaU1+1SmJF6lgWsR8B3ckUUbGWa2HrUqnbNniCXcmJWkYLXyuP8TAcIeblplVCNsJUDuX4z0ojRIY+sNY87KbGgvzhw5M5GcwbBPUCbAd7XG93n8TUQAGZxZrhqikTWFoJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TVq0Ebln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=id0Ig6Al; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TVq0Ebln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="id0Ig6Al"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5l0t996930
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ztfvnojqPEHnGsl4PC1ivpof
	ohidHZm5O2Ka8reFQ6g=; b=TVq0EblnjkCP10fgtSSxsjOZYVKq8FAs38hsJ+2+
	9jT61T0oL3nEppwlU4s6xSEm2uaYgBExPT2TUVTaNfKnxDDCFHzMJpg7LZFaHIlM
	KOyDJWECSdMlIDelraj7o3hyIjnFeBVWd5UNzSEbS2zP6GYQDRaliuhGZclbTybx
	QAL4SIJDNE6HSZHFhAkIENSlPNf1yT5l7pT/Y8di2Lf6OcIknCk9gcESS6eE/L+L
	gff4iNoHKXqcV8Gw/AjXx3A2T6fG8v3vlhkjL2pGfIdvebjNcns3znD5wUV+C+L5
	NWsCnZ4S8japQMMXFR682+4ZrIo6/8d6O2vKMy2UDnrOyQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjtaa2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:38:38 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc10da5ad4so357960137.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 07:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792161517; x=1792766317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ztfvnojqPEHnGsl4PC1ivpofohidHZm5O2Ka8reFQ6g=;
        b=id0Ig6Al4Jp/SmiagU08yE8myTr7MnT+zfhUVzQo7N8oUDhfR6YY1NjQHZMBgF/ZHT
         2MhdkslDxZmi2zYJH3EP+Oqu1vHb5uU2PlBEfB5v+xkJ7I/aNQtSihfsxNbyJiEsgHco
         Ny6G+A4MZfLJ5oElZmkCa9anKdhxzwwLqVZwxti1nYo8ojgocbIzYj9/fm2tstKLzqN3
         5sPkr/dQxdm/jbv6WUsr/5/4JfSUtHDNORlVXgEJ1V9Cg3GIrVlW+Cq1a74kq8RazSX3
         C07cgCB/YM3QJ5XhcCZw3C6Q9ODjsBJcFsd3bXytdRbtRjZsNOpuyI7soJvqCNBBCCGW
         GsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161517; x=1792766317;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztfvnojqPEHnGsl4PC1ivpofohidHZm5O2Ka8reFQ6g=;
        b=AsjN8afeWuSFWLL7SUqdQv16nmQppiykGBV0+otCu1cOzEwYerhKCVmNv+XxZ3aogN
         Te8UpkCW2o0oogNorfdDPtsdfZ0Ta2dvuopOSPFK+Oqi0Omj6aQ2rsHhPOubBa1zck4y
         /jqw8enNCfXjoioESy6HuEOHpRVaHcj2CjzFpgLmS3MMbnup7pkB+pmdqlWKoDrg+CyL
         Zemcpf9ISJBIOvc6GTzy0h3ha/m2UP4rV3YFPdbjATDBnHwuAxOowJHGX8RNpVbGMV0z
         ySqUQkBjNCgmTw2oy4mAyOp3SIWZAZdu8cH1ACidd4q75qDT64VS27JkvdQ94fT/ODTi
         Azvw==
X-Gm-Message-State: AFq9FYKjqx1Qy7h91IcdothjFyqAJRzBQS0DShCgk530RTdOvz3IpAh1
	Lkn/yR3JqxxOJjhY7QpZP2nJBC0RwzQtKu8BLCZZgA6Uvyfm9RqTsu6968hsikyN5fB6FRwVPsr
	6FEzy2rnFTAzupaneAg3IJlWl9jtiPPOgjGzJa6G5EXC/HLikWZsQe0tNvBBkvHVLFPE3TNyi5g
	U=
X-Gm-Gg: AYBFou03kSk1kIabYfGJpr57LluEBpX4VTxu83TaBrTrq3nyt5d3Ddw0PhogmagsZfc
	6sZTBKu0oXFM6SYQ2mtsGSoYUPeJMx+HVUPCB6kSJwZu3glfAAOq8vKAdBsQJR5Xs06cFfCf4hU
	hhIuWvOUEfiHxAzjmkpqMk64g4QXtMl0/SAqdwaqcx08cHc9slXN9+AuhLOSE0aGD1XmBQh6Wnw
	RhtG1pJ174YEln60lZrGHNNRQqadFE1cXPTzHKqcwIA/bKIz6NrWOAyMfsgNZAhWYX9knfRHfXL
	EvmWUSS/as3GMknn6ij4j4MyprKB1WYTWvlKFxlQit+dwLK0t2jqw4c3s2zFIbtzC2I+8j1SmHD
	52goQB6Fw3vben+Zzj3RmkrNjpb4iCmLW7LcEVBwFbA==
X-Received: by 2002:a05:6102:41a0:b0:7cc:226a:f963 with SMTP id ada2fe7eead31-7cc226afcdfmr547093137.28.1792161517138;
        Fri, 16 Oct 2026 07:38:37 -0700 (PDT)
X-Received: by 2002:a05:6102:41a0:b0:7cc:226a:f963 with SMTP id ada2fe7eead31-7cc226afcdfmr547083137.28.1792161516555;
        Fri, 16 Oct 2026 07:38:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc198291e7sm2284762137.6.2026.10.16.07.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:38:36 -0700 (PDT)
Date: Fri, 16 Oct 2026 22:38:32 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: shared-proxy: Fix race between concurrent first
 users
Message-ID: <atI26KO4EHbz5tMD@QCOM-aGQu4IUr3Y>
References: <20261015122740.971792-1-shengchao.guo@oss.qualcomm.com>
 <sashiko-outbox-172816@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-172816@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX2EG/NH7stjYU
 fX806kBR6PRde38baBNz+f7brCYPpNEfwakzuZXQZB5UsnvQwO5lMFbg6HxUxWvFupkcbYvWC3i
 VwUpn1E58auAPgbK86pP3fHG01qGGz3yxjdWxfyT8++KDScw/43enGS8a1bs6IBWPPWxYbkOfiW
 AoJDZVxx9ajAdOtwAk2H/cwqLPXpDxLwPDEgHRyvcvcJQ8Umw2c3QhlsWsMcl2Qik6lveMJ9536
 6RHv8kOmLu+8bSFcvVcRIGFqYgBzFAGXYqNDy0v8LnzzqcGUxyJ2eNBFOjyWxkViT3hSy2xEf/P
 6PzTeJtkEksosSz3hLSlSEyHnuU+huQP8fMP0SAzO8g2RmgACxFlpf6mOLC1pjntXExITtD1W2G
 HSzCkkvFAfVxpTLTS49Ja3YFUblh6zAd5zwOMmBOjvNuSf3IPhAnPmYZMmGskx62Dbhe71XefPX
 8bqX1NfanbAT6VjJKvw==
X-Proofpoint-ORIG-GUID: QTe6Z0aM56AaMSwl59sjw7y4LtjYGwd7
X-Proofpoint-GUID: QTe6Z0aM56AaMSwl59sjw7y4LtjYGwd7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfXySuA/BMwL/eS
 LvAaRU0bx6bx9jr9U7Pt/ddMcra6lSZaDbVDj5EWv7LRdygRXQjdHbOLXdcV1hG1CqTRgnwHagD
 BoMLaOStSWp5ivNIoiwIBtOyWhwvQXY=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad236ee cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xkev24yWWnSjHgu6Ys4A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160058

On Thu, Oct 15, 2026 at 12:37:25PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] gpio: shared-proxy: integer underflow of votecnt on proxy free error path
> - [Low] gpio: shared-proxy: spurious warning and logic bypass in set_config
> --
> 
> commit 2a16d83da9ca16fcf3fc8f06a64d08bb431d1954
> Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> gpio: shared-proxy: Fix race between concurrent first users
> 
> This commit addresses a race condition where concurrent consumers
> requesting a shared proxy line could both observe the use count as 2
> before any configuration occurs, resulting in a failure. It resolves
> this by introducing a configuration counter and a per-proxy flag to
> track actual configuration changes rather than just requests.
> 
> > diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> > index bc69b8729d196..0d9ef98a4229e 100644
> > --- a/drivers/gpio/gpio-shared-proxy.c
> > +++ b/drivers/gpio/gpio-shared-proxy.c
> 
> [ ... ]
> 
> > @@ -117,6 +141,11 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
> >  
> >  	proxy->shared_desc->usecnt--;
> >  
> > +	if (proxy->configured) {
> > +		proxy->configured = false;
> > +		shared_desc->cfgcnt--;
> > +	}
> > +
> 
> [Severity: High]
> If the hardware write fails in the earlier gpio_shared_proxy_set_unlocked()
> call inside this function, proxy->voted_change remains true:
> 
> 	if (proxy->voted_change) {
> 		ret = gpio_shared_proxy_set_unlocked(proxy, shared_desc->def_val);
> 		if (ret)
> 			dev_err(proxy->dev, ...);
> 	}
> 
> When we unconditionally clear proxy->configured and decrement cfgcnt
> here despite the failure, can this allow a new proxy to bypass checks and
> reset the global votecnt to 0?
> 
> If cfgcnt drops to 0 and votecnt is reset, a later reuse of this proxy
> could see voted_change still set. If votecnt is 0 at that point,
> calling gpio_shared_proxy_set_unlocked() again could skip the hardware
> write but decrement votecnt, causing it to underflow to UINT_MAX.

Agreed, but it isn't introduced by this patch. Since the driver was
added, a failed write in gpio_shared_proxy_free() leaves the departing
proxy's vote in place, and the proxy data outlives the request, so
voted_change is still set on the next request. I'll fix it in a
separate patch in v2: free will drop the vote unconditionally after
reporting the failure, since the consumer is going away regardless.

> Could we ensure voted_change is cleared, or configured is not cleared
> if the write fails?
> 
> [ ... ]
> 
> > diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
> > index 618756f6c6aaf..ae10506b7029f 100644
> > --- a/drivers/gpio/gpiolib-shared.h
> > +++ b/drivers/gpio/gpiolib-shared.h
> > @@ -41,6 +41,7 @@ struct gpio_shared_desc {
> >  	struct gpio_desc *desc;
> >  	unsigned long cfg;
> >  	unsigned int usecnt;
> > +	unsigned int cfgcnt;
> >  	unsigned int votecnt;
> >  	int def_val;
> >  	struct mutex mutex; /* serializes all proxy operations on this descriptor */
> 
> [Severity: Low]
> Since concurrent probes are now tracked using cfgcnt rather than usecnt
> to determine if the line has been initialized, does
> gpio_shared_proxy_set_config() also need to be updated?
> 
> If two consumers concurrently request the line but haven't configured it,
> usecnt is 2. If one of them then calls gpio_shared_proxy_set_config(),
> it still checks usecnt > 1. This could cause a spurious conflict warning
> if the requested configuration differs from the uninitialized state, or it
> might bypass the hardware configuration entirely if they match, erroneously
> assuming another consumer already applied it.

Right, that is the same request-counting mistake this patch removes
from the direction callbacks. In practice the skip is hard to reach,
since cfg 0 packs to PIN_CONFIG_BIAS_BUS_HOLD with argument 0, which
gpiolib never requests. But concurrent first users still get the
spurious "users may conflict" message. v2 will switch set_config to
gpio_shared_proxy_may_init() as well.

Shawn
