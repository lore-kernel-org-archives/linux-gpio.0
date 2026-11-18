Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017142;
	b=n3IRieXjfIaHP8wxm6Asdj7y52z8xbq8lICRRjJu8RJATZD/wiorDEQGzdEMMhLswGyZ
	 RJC5rh9UbzFIFYgLAAYqD9He0p8jM8Fxy7NVko8YQEZgpl3jKsCUa/AWpSTWcHo8TqrO6
	 MIn6iL5ZGSY+fmso4fgybgRi03lClqDJ0m58fPUz4apeYmL8TP6wngmJ658xaw5MdFrM1
	 T/dDzqWTXzdANniW1r+b4asse7AX8LlugEDwbtIQAsHkrOpofwEPZk5997j1gGOJ/BQwp
	 7AsQzRpdqT/9rPYcCQmHYaDz/gRdVex4oRazwKao4AAti+R3LqdC5ZSuJLG0U97boTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EfRePTk2gRztSdKJ5avV8rU5JLkNM8X3BUaoJSKRKHo=;
	b=wc/N5tr4N1cc+RUWqJQErRczRGGxl/aXH8LxtJ1SffKFAlNDuEAFEJjha2cneNDjbTF3
	 zxXkfFBkKI4YD8jsh9W1B/Jx/at5JmJCDm/wuYALMeMtA6THzw/BKdF9eXUFCZLl7WO+B
	 7QOicLhotkGeY4VPswWtxZxD5FG6GGAj8noMZYPq+U4bKaLdWuN22ZqXqPi3CfxRat2vA
	 N6mzC3D5Ps0Hbdzfp0AsAAyrDacabxi1OYXFz/vtHeAsUzyvv4J+Wzrfkx6cPjcv5zDTv
	 RbqAAECWXKGWjl8ZX1D9nZZU78MwDDWy//ABD5/CVcHCFVz3scGi5OsnlTYNmXDtY9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzBa8FWr;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDA2606A333
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 15:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBDA2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uzBa8FWr
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4395d31228so176706066b.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 07:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795017140; x=1795621940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EfRePTk2gRztSdKJ5avV8rU5JLkNM8X3BUaoJSKRKHo=;
        b=uzBa8FWrZP7lNw+xbddRCcC0O3d7E2fj5uw6//BZxBE2tnMRH7xmxDA/t74tl3sklb
         4IDX9D2YnDk92d15jSQOR6lCXVhPQvUjvA8FvFW0aHolUaVWyZ75el4ViT9WU88CA9b5
         uKZFKe6Co4fcKrD90xtNVFoOhrohBfed5Jh+ls0yxsMsjFzGOaSmCIUd/3VsfWGEbmcB
         qVgmKGD88YmMaw5fNGOmX+fRoUo3eXlEOSQhZ1TFB7VwiwOqVWdBGuwJn9zsJKLsC0hF
         ev8cUHjavo3vQkuvvn7tgXRK80jaXFp5xCSfYpNhdj7FkxSNVvO+peWAPVtwM1F8Uq5l
         vYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017140; x=1795621940;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfRePTk2gRztSdKJ5avV8rU5JLkNM8X3BUaoJSKRKHo=;
        b=ZMkHSz/49WOzza6/pzgDN42fsGkmgFSgZcNaL+sQKxxCaxgmdQaCL2IZQp92RTLsz9
         nliSU0JkrTp/0Xw0uqOUaIOQTJ8mqTkhddufRrKLtQjf4BvCBAaGICp/Xsn2cPKaYEic
         byWUigJrAexMCpF9TqeFtBGKJPBmRIAzHblLKZSOyNe+3dQuEMunFXInAGC1XJmzvvR2
         aF40qlcjV/h2PmRJNVGB9VRli74GhiI0FJgb/YZvnu7T4vH1bDyV1V0xdbl3bxVUo2za
         IZiIRobLPEPfcJcEq4XVEKMbyZXeHDFfnYAWchyZGZ7LWF2bbzMn9gp5auZ3qk4CLbe9
         ek5Q==
X-Forwarded-Encrypted: i=1; AL+hErFYaXVM0jlFoRMsasMBFDEE7WtHBVOGw4a3noDX759qJwLDkx+oQu1pz9x0OMe/vSu9qYyTrlsQsBrr@vger.kernel.org
X-Gm-Message-State: APuU4Z+9tBwnYq8nAcf76gfxHjQY0/Bq/rLxcOpy+EiGrnZYfr2FwzkV
	ib4Mu7RPpqNVFunQDnh/7DZ8I/IrKqR2ZX9umX6XqLqFGq0KBjPHps+p
X-Gm-Gg: AYBFou00E9gS39vgvoB3zh2b5IWC4Tj4321ODeTjrVodmteYLhiJJkPYhmhn2BKvVKQ
	CDtgvqM+WIB1N8BsS6Q67km9osmmjSSxTtt4JpKxgVNGwW9AFUhpznzPDX79qn03/QNVDhHA5JD
	hlyT9iveQ/sFq+nKoX0Ks+werRu9KIwy06vjCyHLcaIU4upuk1OVT/vTAl6qBX2VJvz2o8s0N/h
	UmEDbFlf3t46q8CGJ/RsQL5wUAOa0JhvmEDiVOzsO64nGeTxTTKGBEKdTgzqiNfijA84r21Z8Hf
	MC0kgvTJGDHTYxePeGd481EB5EAQAxtWw6KLuw5g9PMxqcLpuD5QTttd11AyttnboDf2C47uc0I
	KdJOGMPpsYOXLAWalQ/kSObAL9GPBi80za0wYZ4WUGYiDmNYdDwHz/Oy3EVVDGY6RGAnHNUyRpW
	K4yi6Ax713Q6BMZcqtSxoaDwamgcX/IBYGsbsviAXmFfWHjtMhIFTAUK0k1S3VdJ5frFGBOS5ay
	fcG6OptqCrT9UVCm9cvPHx40Au9czuSSPjfyL3jRywr0mrCLc5pbpND7IVIPYs5ZLSdijFFyhje
	10Yh+xKuZ+HlYgZufYLS1Y4Lze6s969aZbpS2GlkI8jWLZ7A
X-Received: by 2002:a17:907:6e8a:b0:c2e:4292:d268 with SMTP id a640c23a62f3a-c510e291950mr324922566b.16.1795017140041;
        Wed, 18 Nov 2026 07:52:20 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc221sm20006566b.9.2026.11.18.07.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:52:19 -0800 (PST)
Date: Wed, 18 Nov 2026 23:52:07 +0800
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
	stable@vger.kernel.org
Subject: Re: [PATCH v6 7/8] gpiolib: let the character device free its IRQs
 first on chip removal
Message-ID: <20261118155207.GE46152@rigel>
References: <20261116-gpiolib-chip-removal-v6-0-aambrozewicz@nvidia.com>
 <20261116-gpiolib-chip-removal-v6-7-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261116-gpiolib-chip-removal-v6-7-aambrozewicz@nvidia.com>

On Mon, Nov 16, 2026 at 03:47:10PM +0200, Adrian Ambrozewicz wrote:
> gpiochip_remove() force-frees the remaining IRQs, removes the irqchip,
> and only then calls the device notifier on which the character device
> frees its own IRQs. The character device can then free an IRQ it no
> longer owns: after its mapping was disposed of and the number reused, or
> from a release that races gpiod_free_irqs() and
> gpiochip_irqchip_remove(). free_irq() then warns "Trying to free
> already-free IRQ" or uses a disposed descriptor.
> 
> Call the notifier once the chip pointer is cleared and the SRCU grace
> period has elapsed, when no ioctl can request IRQs any more, and free
> the remaining IRQs after it. Have the release paths free their IRQs
> before unregistering from the notifier, under the lock its callback
> takes (config_mutex, or a new mutex for v1 line events). Herve Codina
> first proposed calling the notifier earlier [1].
> 
> IRQs that in-kernel users leave requested are now freed after the chip
> pointer is cleared, when gpiod_*() calls on the chip fail.
> 
> Reproduced with a test-only chip on the hierarchical irqchip: both races
> warn in all 30 cycles; with this change, none does.
> 
> Link: https://lore.kernel.org/all/20240227113426.253232-1-herve.codina@bootlin.com/ [1]
> Fixes: ec8b6f55b981 ("gpio: free irqs that are still requested when the chip is being removed")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 35 +++++++++++++++++++++++++++--------
>  drivers/gpio/gpiolib.c      | 28 +++++++++++++++++++++++-----
>  2 files changed, 50 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index ffa8175b78d8..3fc0a21c1273 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -1590,19 +1590,29 @@ static void linereq_free(struct linereq *lr)
>  {
>  	unsigned int i;
>  
> +	/*
> +	 * Stop edge detection while still registered for the notification, so
> +	 * that gpiochip_remove() does not get past it until the IRQs are freed.
> +	 */
> +	scoped_guard(mutex, &lr->config_mutex) {
> +		for (i = 0; i < lr->num_lines; i++) {
> +			if (lr->lines[i].desc)
> +				edge_detector_stop(&lr->lines[i]);
> +		}
> +	}
> +

The desc check is not strictly necessary - edge_detector_stop() handles a NULL
desc.  The check just prevents a little pointless re-initialisation for
failed requests so I'd be fine with removing the check.

>  	if (lr->device_unregistered_nb.notifier_call)
>  		blocking_notifier_chain_unregister(&lr->gdev->device_notifier,
>  						   &lr->device_unregistered_nb);
>  
>  	for (i = 0; i < lr->num_lines; i++) {
> -		if (lr->lines[i].desc) {
> -			edge_detector_stop(&lr->lines[i]);
> +		if (lr->lines[i].desc)
>  			gpiod_free(lr->lines[i].desc);
> -		}

gpiod_free() has its own NULL check so the desc check here is redundant.
While it was bundled with edge_detector_stop() it was a free lunch...

Cheers,
Kent.
