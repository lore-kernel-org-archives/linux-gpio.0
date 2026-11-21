Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795237716;
	b=YFMj0GZnbtkTIKp8is/tGyhhT7LvxAPIDNNMonTXSpyaoOiBZsFi67XQMQEnfVDLtkxL
	 aa/U8SAAxhqYH9zKxu9csVjW1I+BmV71AxKR8xZiYKJynmQGL7zbL0PwV796vIBONg6Md
	 S6zNjl1UFv2kMhBBrI1eARG9XFSr3uNAjN45zJ3+pQQnITScP0UYj12fSjjPyoZF/drhe
	 DPTaztAZmziQsSCN+GkoHL0g+BkOmh4BsK9Kif0mg9kY/5OCuIT70Jm5Fnks70wrcldMd
	 A06nQV7cqOSQC9RLo54Nlntak0T/MvfOfrKd9hh+cazGEGULKSjpLvUqPfgIriJWM7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795237716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Bb3283Kau2Gv+8vqVQKXj4fop71Bdd6l4YGCq/10EcE=;
	b=0jtsjRmpw2AxBCVTwnwTNpLypsUGCVNeUDRRREGQwAHVFxgnrTHdKJN6IJDwbgDvBbr3
	 OskKIFnKbYOTuMOjyUYWivE9UdHL7O5ERF7aT+ttGKBvePxkjqawzo7WHyyi/cfhvMUqB
	 DZ+6hfWIT3LSLFN4W9/i7NTok5FHqoydty+Lk4ZBEB+3z8T+5soMX3rvhkixG+Va/2Tah
	 3tvoA1UzqTlEc/V8XcDUQ8sNY3nPDvR7DhJflA77+uTZrHBqgML1ExGrV39GwDZ8k6n8O
	 GPd/ZV8IRa+Z1djLHpOHqabxQhX6/OoCGvX/pfr1+GgpMtFcXU9vx2hf8536VUyvGWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gq8cZIzf;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BD8606A338
	for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2026 05:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60BD8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gq8cZIzf
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b413997581so1471673a91.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 21:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795237715; x=1795842515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bb3283Kau2Gv+8vqVQKXj4fop71Bdd6l4YGCq/10EcE=;
        b=gq8cZIzf+Qb7sTo4hGDzb7GED1vLLhFGQihjRYcVKITQeqp+NTPJHitWdZnbtmQSnq
         Cc98oclcQyO8R4unTqH3fqB1+SSxBLQYG1ylnURgzL7zhcYgqAVh7zzpYsHzc1nks+9P
         clRRk7K3aTudSZ9DCOuP8L2ACsxJV5M1DCpj6gd+DAk36TUMQHNCuVawsqQ1XJsUK0S2
         gcEM/DvyFWEhc7e9pGD2WRR2om4/CTSbcxVpjaGTFBHeEAETEWKFzYhdQCoAjHj9yHNZ
         nH2/yGWEG0Ih0VbDoXVwdeS6ukJkPg7g92VnhBWXj8E4jFDOSE5IeJOvBMk2uaCi5hiB
         Qhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795237715; x=1795842515;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bb3283Kau2Gv+8vqVQKXj4fop71Bdd6l4YGCq/10EcE=;
        b=W3m+Dp2auFwVtjIT/VvK7Z/1mxljhT9O77a3sjhw/BalHX0rygeCJB8wNb1U8qayD3
         Vjahaq6o6voRb+kzb6XofI0lB8p230kNHkk9Ea5A5UV0v2eC68QBfWbw6Pvqy71te2SN
         QDeq6e/BZ2FAEYDd7ftb9sOoZ9bBmg1Ji/o3adZYRMkp5Bg9dZMzMncwBMzRNMaPS47u
         Hb1XhA2Qc9PQs2Hgch/iyMg7TN2e+nOuki+mQCLMYV5LjKyV5nfidxld9iUIoCQYCcy2
         T30TRQeUJYzZXLb0DwHc+QGsTVYYPzunRArab0dLE785PCtwjd6vYPVETI+U8QB/HxWA
         215w==
X-Forwarded-Encrypted: i=1; AL+hErE4ONsXojGwV2a9baVcvJN/V39hWeFVTnH9PBhatckH5lYbkyeSkh//FU4Sgnfy8QzBlkInTIoIcBHm@vger.kernel.org
X-Gm-Message-State: APuU4Z/ruig7N4mORyDQQn/ndqwtpvVOocYd4x+MUMMxQd1/jKSNHTEN
	pbxYnZcqBsMIKD5mcji0hw317rRFdl/F5gGy6B8K6HEMxd3uGnafK/aQ
X-Gm-Gg: AZFdTZdj203tRrYKPA9h4jX3BKKagKxmau3i3/YRsJeNf7h1c5jXHY8N0oIdL+lDmiX
	d1N/w5Nde74haQvpEwhA49SGy1BFFvQs2nVH1RzpN43JPAMkFWULFBbK5YQJgHuUm951zyWmZvf
	qQJv02Cj7u3TXrcWySLXcCoIRJBrpNSWk31Vp+2fkQqMnBasoSdZ6b9W5x0L8isEteDChu2oPne
	Ff7iwulnmP2p1zDjZkgYAds76my7/+gsU6N1VpOgxe2YWdhdEaNay+KUE5W7XFITLC3KqawCVS+
	gp8sgZ8NBjBxZ2TGeGKYSe+wrd5kviQ4V72Sbc7VNoz7yfvYCNuBW56VQSrqRgYi/1YwkQM/deW
	snXxk7cLlRkyUMDRsI5bDQCF41J77Mu64tg/A4eZxJUSBFRh74293tMs/61iTMEK4YzX+9fF2dr
	9p6SMempUy2GXYYFeoGenv2kfcmOcyms2ysiSUnswJqB5hOoKmwX5BkeQb80pUrmAKCC+QNrADI
	aQeyLv+dh76w7AfKi29/MFRUOPSLLG/Jl5KmjW4c7CNjxVFBQZe+TaiUv+PTgKpcoK0XmJBfMui
	ThcIZ4LAQ3h/T7KGvzm8Uw35KRkMV5LHDvNVZ4xOOlTCWvsHpkKw0BmwcQRQdQsa3kHFAg==
X-Received: by 2002:a17:90b:39a7:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b41c9638b9mr4472697a91.40.1795237714620;
        Fri, 20 Nov 2026 21:08:34 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm6883300a91.8.2026.11.20.21.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 21:08:34 -0800 (PST)
Date: Sat, 21 Nov 2026 13:08:18 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v7 8/8] gpiolib: remove the shared GPIO proxies before
 freeing the remaining IRQs
Message-ID: <20261121050818.GC17013@rigel>
References: <20261120-gpiolib-chip-removal-v7-0-aambrozewicz@nvidia.com>
 <20261120-gpiolib-chip-removal-v7-8-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261120-gpiolib-chip-removal-v7-8-aambrozewicz@nvidia.com>

On Fri, Nov 20, 2026 at 10:14:00AM +0200, Adrian Ambrozewicz wrote:
> gpio_shared_proxy_to_irq() returns the parent chip's IRQ, so an edge
> request on a proxy line holds an IRQ of the parent.
> 
> When the parent is removed, gpiochip_remove() frees the IRQs still
> requested on its lines before it removes the proxies in
> gpio_device_teardown_shared(). The release of a proxy line request is
> serialized only with the proxy's own removal notifier, so if
> gpiod_free_irqs() frees the IRQ between the release's irq_has_action()
> check and its free_irq(), free_irq() warns:
> 
>   Trying to free already-free IRQ 22
> 
> Remove the proxies first, so the character device on each proxy frees
> its IRQs before the rest are forcibly freed.
> 
> Reproduced on arm64 QEMU with a shared gpio-sim line and a test delay
> before the release's free_irq(): 3 of 3 runs warned; with this change,
> none.
> 
> Fixes: 1e4f6db614a3 ("gpiolib: support shared GPIOs in core subsystem code")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20261103-gpiolib-chip-removal-v5-0-aambrozewicz@nvidia.com?part=7
> Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
> ---
>  drivers/gpio/gpiolib.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e0ba17a73c4b..57024a1b042b 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1461,12 +1461,12 @@ void gpiochip_remove(struct gpio_chip *gc)
>  
>  	/*
>  	 * No new interrupts can be requested through the character device now.
> -	 * Have it free the ones it holds before forcibly freeing the rest, and
> -	 * both before the irqchip and its mappings go away.
> +	 * Have it free the ones it holds, also on the shared proxies, before
> +	 * forcibly freeing the rest and removing the irqchip.
>  	 */
>  	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
> -	gpiochip_free_remaining_irqs(gc);
>  	gpio_device_teardown_shared(gdev);
> +	gpiochip_free_remaining_irqs(gc);
>  	gpiochip_irqchip_remove(gc);
>  	acpi_gpiochip_remove(gc);
>  	of_gpiochip_remove(gc);
> -- 
> 2.43.0
> 

Everything it touches was added in patch 7, so it needs a dependency note as
per my other patch comments.

Cheers,
Kent.
