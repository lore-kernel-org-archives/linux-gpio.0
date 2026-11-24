Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529171;
	b=SgJi7qj/22rBH3bqDokWJSw5Yf1/TzHG++yreeaQAA0rzxtLmTH9DARJiIwDoikWG2Bn
	 ec3wMQlHAUfLcyTUer0PaZYTly03FERf0AsqtpMDlS3fhy8l0+KaQljUaeZVcYKlf2Sf9
	 dKF2tBszzAmnQsaGI6Fu6IJ6YLNWgKDKxW3wXPgza5OBQkWJmkPQdBwFmb08M8Ejq08Uw
	 Qz6WPrlpGAEYo9IUnr4B2Va+QXvBNW0E1bluz4YuDD62fqEkLiAm1m3DjD0/W5fDe37gw
	 e6Ro6XKyWNOW0kMr1Fr+pNjZpktzJ66kEhjd6mYiG7nqEK3nO734eWiD5BHrtGePxLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=S8YJkHkm/SxGQO4kohbKqn+J7zEdKLPkqIyPpPevv7g=;
	b=tMJZYHQNiOJyoci4pTHtQEqa49Q2B0VIc0L/P8IU8yQv/XC074GIkMuGhiRZX1S3NfcV
	 fk1mKLHYZMkJJnWKLXUq25Ns0U+Po/urMXGrM2vgjPXzdG2510E+x8R1+KguLFnLMhRt+
	 /KaWxopbxi5lbzmMhgWA0ZW6e/+3i9soglGluNxKMsEuM6YlPA0AeCWe4Y3j/ctiZcSvR
	 nJ/fbz9/J7bEXs68gutLy+I9VdIYfnI17m3kUQhoH4i7XvuEZwngrhhhed7+oPruqAKou
	 AYVRdTQ8p76+Mz9Gl1cv5uUsdnhpSyLA1+hNEgn6xIGQ7NPhMFPJr/yD2QBbjlVZRyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSpjVVcq;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5B0606A332
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD5B0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSpjVVcq
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so6220776e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529168; x=1796133968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S8YJkHkm/SxGQO4kohbKqn+J7zEdKLPkqIyPpPevv7g=;
        b=DSpjVVcq8TeO6xu2p0bIyse844LUdtnK12XipX9WJfEckvekJT6TGuo5IfecGiEZsr
         v071ioGelwCA7o5zeO7eJTG8/QBO1Kz+VIB6TlcVHLWi/N90IqBjX1QiTbM54iYGrAPI
         JFQVArhHv2J3shIslplatk9W7G35DDP6cJWcawYkLSsAl5n+yef3zBa3+aT4zc8WvQ8J
         JPApD3jOSJsDnOgqnDl7p7UaQ/3arAd91Z+R3l0h27Bs2EBq0xvRdp3Jhi6A638poxVG
         o0qf8wBg8e5vZVka9anRlXVegXB+wg91whsM1cfYYn3A4pR12aDrZHMJpB9ofp3f7dPA
         HTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529168; x=1796133968;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8YJkHkm/SxGQO4kohbKqn+J7zEdKLPkqIyPpPevv7g=;
        b=FLtVQUUVdcZHHe2TlKDKZfG1f0r9+Q4wG9Yu8MoM+2SqkU1N6nEpf//f62FJ6hDIoX
         N7eExFZpGm86V+Eoti/AB4kG934J45lzw1+d8pTl2C2OsNJCy1Iw5DrrCNIsQCVbPCPp
         bS78HzsfinmHYormWVqgXzw1bk+59aUBg1Csfqb22cSSX4z3138ovmXaJwtrrwt9b5/7
         Y0d9+zg3wjmW9VSvohKR+oOCpJ9GQrtG/DehLDpTYpaBVtEoOhjFFuO5xw4TRks2W671
         3+hzh9FXxo33ToCl8T8NIuqnNz1h7mpJ+CAvacoQEnfBtz3LZq+yLh2ad5ThjosBuJkf
         97VQ==
X-Forwarded-Encrypted: i=1; AL+hErG63Dlg8djedbv2k+YNyh34ao1bDdy75cio64cFjp033OCy1T0bWQ24NkWPDg7jK+Xjfhayn7bwPtpN@vger.kernel.org
X-Gm-Message-State: APuU4Z/oLIhJ8FnkpLP9BGeR20XyhMuYUL/tWQM7RveoB/el/FrW2hBB
	X+WM65dcydSW5l6XbOIHoy6g/nniwvtFRrcoIEl+m5uHYgST6JNxf83eEgljXtFA
X-Gm-Gg: AZFdTZeWF2F3FdMAW7QKqc98eAYBnhrtVE2XTuwOfhcPISNpi6I96b4jftWcQRxUIzc
	2s3tZPy0DDTWwgLWossvE7GzSPlo7evk7MX9N+aA0WF+gcyjqsGqKE8KZTr0ms4E2OSHV3g0zCY
	lOdg5utyQ4AMgkbrwgaPWmv5vq3NAJQxgmur9/GeBbK441qkoFhqIhLGPBoKYCSDdMuVelZfznt
	iaMm7b08zEJgKndKWfm2d9r5+cj9MGAqzE3XBaYYV/7RAhls3v0NI99JY27OagZWnWdt9eFcF3N
	mHGLr9e+FZ1YlfebLLeNzZdy7rQOF8j1eRvbBiQwyGFtWUCduh1LcQND+yqWp8EPtPkgIIaA9tW
	p6fdmcPHPtDzYUN9w0wNslpYi5iz97/95mlOv3IHtmg/NqCJBVDL9W+0tisdGHvfCpOMuC4fEjB
	KSFXfaYkDJ0kYRGuKopNM7Nle/2NnTEmIx2I0L7hqBgvYo1mbzvSbSlDwxsrKXl7l43wf6GD4VE
	CkuAU604TwkaGmNASLlaYGNe3yy0WGy2X8wxFTFn4fIJLJGTxkOGx2dHbG7ITc5+9Q/iTlksI7S
	5h7WaxV9F3oO1oMopepLI/ZUpDCTj23FBk82lHCdVpgxCUbNqA==
X-Received: by 2002:a05:6512:3043:b0:5bf:a34d:5961 with SMTP id 2adb3069b0e04-5c1bc660762mr4326463e87.1.1795529168154;
        Tue, 24 Nov 2026 06:06:08 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04451csm3787629e87.59.2026.11.24.06.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:06:07 -0800 (PST)
Date: Tue, 24 Nov 2026 22:05:55 +0800
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
Subject: Re: [PATCH v8 8/8] gpiolib: remove the shared GPIO proxies before
 freeing the remaining IRQs
Message-ID: <20261124140555.GB48187@rigel>
References: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
 <20261124-gpiolib-chip-removal-v8-8-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261124-gpiolib-chip-removal-v8-8-aambrozewicz@nvidia.com>

On Tue, Nov 24, 2026 at 11:20:39AM +0200, Adrian Ambrozewicz wrote:
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
> This patch depends on patch 7 of this series.
> 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
