Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326833;
	b=EeSnGibHF/LTC0CqKIrtYUw38CFU64jprzWcVZEvZI/k+2qiotQ1x3/sXGSCtlf0TV47
	 LKeUGgNnD7x0L+sGrTaraNDdQ9njTouYFc6egVfvmGrYvdbTeb3bVsEjg/G4xVWQjnpSl
	 SdlDYjK6Lv8v+bZk6NiWSWNpd39lm1uAqTBosBDr59FgpHGBlC7Gf8LSJT7D4juPH6I0E
	 sUnpu5Hps6ojfxNZTBcaGmum73bg7CikFLw/awf2R/l+7v/TOuNhceiLxE0gqyEgQoN1d
	 Q1HymWstt7/NDkX2gSJGMQhIINRkE+GCAimdq7Jr8Z5mJIV0OxgiMxOwPGxzVe4ZHQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Hx7PdOFoy3DDyb5Yl9lhBRCrmT8HbVEMfYuz02WsYzw=;
	b=P0sYCmWZQcLulTdTGmeZ6nO4ylphwmYqlAhqzKTnaDDc7auh6fmeTsEFXTH0vs7FjBn8
	 0t1ot2QW7dasKWY73g14dY/gVfmKJ6xZdhJaWqrUzIZb9lCWjXsxzz3FMu2ojuh/zJOWz
	 Dg+qtYlf7kCXndJ7nvv33WNQNsY+pZCiNfZKKGB5+83++qGVuVOBjGJxaIgMhrgwTs13j
	 f8FswCx+OxpTH8izZyPkKIFT9X1udKxQcjAV+BClcGS+UeIk7K742zN9/1QBiHvn9sF/+
	 WovUVxjhAovYUjfCa34GPDtmg1BL9xvILSNfEpArlQMiY/kq35TjiMvqqdmr768M4Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDjiHE03;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4CF606A321
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 16:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F4CF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDjiHE03
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c504bfd7393so139026866b.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 08:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326831; x=1794931631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hx7PdOFoy3DDyb5Yl9lhBRCrmT8HbVEMfYuz02WsYzw=;
        b=XDjiHE03zZBunu/ipDBY/mgWQbXa2axnnltc3YePQgBV8RPN1JM1Ou9GlFxXY17m1Q
         RSlHAVYSkhRhJSo8FFG6K6gM0yfiUeC8zKpPIOSQPeDu5t7KsvijzV+fN9gxHc7407bs
         1yCLVAHoqhGCM/kUsg43WbPmY12Ao1nqrxGQzZ+ljryuDOzRgWbuKnsFWDYFvDxmv7ms
         b1Wna2pyQ3ykpuxN97HitesQ9/JyDj6RPvWEAsFHMNcONOsWanuH7/L6Pv70+dhi+lzn
         28AQdmm1qACi5Q82u0VafPXe72OlvYC0RwtolxkO/x6tLiL7WSgG3HXZrchhLDdyokvM
         plMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326831; x=1794931631;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hx7PdOFoy3DDyb5Yl9lhBRCrmT8HbVEMfYuz02WsYzw=;
        b=ZkMvovwMIgFQ1/A1y7FwrWUGJ0utRkPR+yYy9rRJLmOtN2juBMwQVwM0TcXA19inOW
         h6Ihc/29lqGANQvEr8L6F8biLL6PC/rQ514yBNjlIrwfteYXWTaXQ2Rbld+PfdYNqiIg
         0sAJ9H0m+8hQeGAqKcPfBOIajHzRohizUC6j+NLAfVplrr9lr2nunpUzxHgOv1MkDSG/
         bnAGeVY2HWM2lDQWfjswl8NFt04z41lJ2oOZxtznvwqtUoIJZnqcFFSV2X+oNy2UiHZq
         u/t3sxVOfDl7WeP0gztCcLsZIi+eVamxJFxiLQMsjnq59JozzCIZBwAZARbg30nURK1E
         Qplg==
X-Forwarded-Encrypted: i=1; AL+hErFFhpXmCaz20J907OIZlkx1IYRJFTG7u7fUmqCZdyQMNUCbvn8rAzNER9uhFXjL5f8DWRJOS70kWWGR@vger.kernel.org
X-Gm-Message-State: APuU4Z8faPA9uR8EbaXqkkNxtOgzVICuF1ZREGIn6CNJwBauTmLfGgP+
	lZC6w8BD8Z2VaSS2zekjr++F3PGJwswQ5elQ942lQRdvqjxuOcSOduWZ
X-Gm-Gg: AYBFou2xmQ8oIdpkiKhds4l0PdIZ87OVTi9qbZldRS6t+o3ePi4L9JipdP3x5U7GXHm
	hq4oyfN6ckjIeHpYvISQmDvCSitTQLNQyTfeUgoituPnoI17wkH0PLbhbVVWaQaOfRFKz63+38Z
	kOMNniVc2WwCgM8Ou9kygI3EjgUYH3AvIkQpo999PS0lGDkC41Ln2PSFno3g1znTFQHfjdtjuqT
	TyjOqIt8X7xoautn3e7LI3D1qMHIOmrc5VCSJf/PFx3JRVjrCSWkhcALEL5cyTgI+JgInNCFtDD
	QO62RNByaMItdMSQyExq+YeCqASMjXG3wmj9p1Mf4esXCmJNDV/bnDCKnyF1vCEanpsmE9xtxEh
	NdKo0AFN+eIubLHADtdVB6Xc0VGYc5LDbF1vAgz5r6O/hj9myLkWG1J80XEVy8IpBg/bBoZsO0P
	ktkzbl5dOxGuWvQMCylhfB4lQnA5RlrmhQ355HkWrO29vgeFoFvI+4buYbRJRXXpe4YR/2Ais20
	5iP4mRcLWVCb1uDDTMP+WniziawxGETNWxlLSTr3+d/D6AjN+j8klI7bm92REB0nK6ycn055rRH
	qecRQsErYKHm456ziNLR/fC16lSBStAT1rzAlF6XEIIfmxNWz3VbgjTIqZj41RRPAga6My0nPKM
	HqRfgtOiJIBNYgSNT2xgD1lgBlPU=
X-Received: by 2002:a17:907:3f0d:b0:c2e:4a61:d436 with SMTP id a640c23a62f3a-c50495d6ee1mr267672066b.36.1794326830946;
        Tue, 10 Nov 2026 08:07:10 -0800 (PST)
Received: from ?IPV6:2001:9e8:f112:4801:300f:57c8:c9fd:3080? ([2001:9e8:f112:4801:300f:57c8:c9fd:3080])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6551efsm126029266b.68.2026.11.10.08.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:07:06 -0800 (PST)
Message-ID: <8f5f5582-523f-4632-be69-b176f7ac52db@gmail.com>
Date: Tue, 10 Nov 2026 17:07:04 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpio: line-mux: fix unsigned truncation of property
 count error
Content-Language: en-US
To: shao.mingyin@zte.com.cn, linusw@kernel.org, brgl@kernel.org,
 linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20261110225742308FW7iPw8mc9gwd2DU0W-_w@zte.com.cn>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20261110225742308FW7iPw8mc9gwd2DU0W-_w@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Shao,

On 10.11.26 15:57, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> device_property_count_u32() returns an int and reports errors with a
> negative errno (e.g. -EINVAL when the "gpio-line-mux-states" property is
> missing).  Storing that into an unsigned int turns -EINVAL into a huge
> value, so the "if (!ngpio)" guard never triggers and struct_size() then
> computes a huge size.  The allocation fails with -ENOMEM, hiding the
> real error; struct_size() saturates on overflow, so this is not an
> undersized allocation on 32-bit builds either.
>
> Use a signed int for the count, propagate the property-array error, and
> reject a zero count.
>
> Fixes: 2b03d9a40cd1 ("gpio: add gpio-line-mux driver")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> Reviewed-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> ---
> This patch supersedes 5/5 of the v1 series; 1/5 has been withdrawn and
> 2/5-4/5 are unchanged.
>
> v2:
>   - keep the declarations in reverse christmas tree order; merge
>     "int ngpio, ret" (Jonas Jelonek)
>   - propagate the property-array errno when ngpio < 0, and map only a
>     zero count to -EINVAL (Jonas Jelonek)
> v1: https://lore.kernel.org/all/20261107161258203oCy-Pa4_0rNe65TqrzFWD@zte.com.cn/
>
>  drivers/gpio/gpio-line-mux.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-line-mux.c b/drivers/gpio/gpio-line-mux.c
> index b4452d956bf0271d25598de2117c0db73805aba6..00b69632c4401300d11bbc296306df114d18c08f 100644
> --- a/drivers/gpio/gpio-line-mux.c
> +++ b/drivers/gpio/gpio-line-mux.c
> @@ -48,11 +48,12 @@ static int gpio_lmux_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct gpio_lmux *glm;
> -	unsigned int ngpio;
>  	size_t size;
> -	int ret;
> +	int ngpio, ret;
>  

I think you still need to move it up where 'unsigned int ngpio' was before 
for RCT.

>  	ngpio = device_property_count_u32(dev, "gpio-line-mux-states");
> +	if (ngpio < 0)
> +		return ngpio;
>  	if (!ngpio)
>  		return -EINVAL;
>  

Best,
Jonas
