Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892220;
	b=yuNAcOcovHt1PQjSCGQUaeyICXmlaYKD2cdKCTXH0s62aCYOV9t/ZPlb9ZNAmeuXXYI3
	 Fg2JGxoK9UhURdibr7T4mAE9NlZk4PAVu3E7rmm1r+avc/nh/xioeLexw2visbuP6oLuP
	 VdwrcpPpHReeL9tyqWEf1/LfDqWro3C3M2y30abKaOHrSkc//MPl6YmiNutmiO5qPJlxJ
	 4L3ibFkYXprFhFYNVxBSj+FWG2RCXDjWqCNDUCTjq97O9Pd6BUYZiWlUIQZJVWhsXNA6u
	 WNS7OjpDf1mF3/ySsZHm8kFxyP861oW26D28S6gONdNz4+G3GEfVIRUFnCm9cFLw4Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2HROhYrsHDpN8EZWrWCuWsnDk1gTxZfjwa9MvLNeoEE=;
	b=HmmpXob78LAR7alWOJ+wYYlhzO8bPYURhVK8w/du9G7JV8z9Ot/MdPZWNRgRppS6gnDV
	 CPXVUyhZebZQCsDenjXg9p3Naa0NCxUFAcAoRNOgpLvr3qnWjAw6pQfaCVltrF0WMT/9V
	 iHhiE5tR5ZVHnsq3o+qbCIvojOYugmJOt6o324TdqQq94+LlE7xabgPW3RD6jc0tcnutE
	 MQMcbbYCku293zdyi6TWaD+qY98naWrmuFP+I5G7xLTwqJY3HwQTcHuXAeOZ2SQXZF+9r
	 ofKXzIr1WEr4czSecubxw7+gK9mYOfrRnoB3TG3nifVmwY/f3Pe68jUJTggNDl4k8Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QF1lpluy;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3D2606A32C
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 05:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A3D2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QF1lpluy
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-170135e43c7so6803493c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 21:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794892219; x=1795497019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2HROhYrsHDpN8EZWrWCuWsnDk1gTxZfjwa9MvLNeoEE=;
        b=QF1lpluy9KLK2IGIKiu6Ld2Xl59P4H0JE2/ItEyLmgAAv4OLyO0W+5xhxFevc5hxBG
         Ev1hkL9Hji0f2HFl8IHVEBKjGt27Wm3Ny3muKEBfPJ0A/fifctXfzE3y19ZkQPGr238c
         HlYx2R187H1U55BpcnbVX9ytcs2hMs4or7mqQuC6irMEWgpdnSz40JoXRW6aSKJp8X5l
         n4FGSRhMlPAOhMoVFtq2TDpJmdoyYE8ENmRzYD1Ei7/tqA1RmSc8BvuMmtwcin7jhUPX
         mStilZsD9Kd+fLX9ExluNv6uC29KSQbwJsRt8lSCcZV5UB/8pjQ3oTSkUTdZ5h7Imsrc
         2eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892219; x=1795497019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HROhYrsHDpN8EZWrWCuWsnDk1gTxZfjwa9MvLNeoEE=;
        b=1ljWhQozpzwI4cwj3VPEMh+NSU5ucP4fk1mir/3Rzz5teX/nq8SkRSjTAdYoLCjxwP
         YWCUVm4E1HtjlvrASLOW65u1jv+6fi2F7C+gd9EkpBrdxp3oj839YsUkO5hDuxCHAxJG
         NkrsNMsktEDDh1ybYLtqlQv2pPo27rPprEIBhCd6I00AmB2xgQ1O1CwtQ8U/aK7Y/wwL
         YCykGl06l96+DRmpioO/PM649cjRtfgahkueJU+w2mCVSfMKAI7ZRDNiekquvhMnQdnn
         E5xRBj7tTgdy+gqZ0kTikNkGafTMcMrIOibItxLyI1Tm0Ygs6p1payF3yuC6Bc32r6w6
         /xeg==
X-Forwarded-Encrypted: i=1; AL+hErG2vVj9fT3l4dLv0O0YD+5I0hKJFlW9BkjqhBgyVeHMiQXfXrGupsBeMbVT0HYk7CfEUfwfZqbacAND@vger.kernel.org
X-Gm-Message-State: APuU4Z9GP1bWeB5shVSlXohcw4uFbdokTJobtCuHLmxeS/Lr22ZOVJDn
	7SL5fpxVH7sIVGkGJwhcH4+1nm+ggXtrY1LfauJlGhTAfMP9MVTFaVvDDEfPhRdGNvI=
X-Gm-Gg: AYBFou0TGSZj93r4U3c3fnlTa4uSReQgo1OMu9s6pzlkzhH4Fr0H7FbVRzBo3b5fxHx
	H3LL6JYcXadzgKWpnGlM0z6gIARuNVNBAHvJ1utO6vFfvuxK39uNArqQo/D6JOAjAX26VT9pG0U
	6Dg3XDCmBn0fBkj87WAUjKvyFH45wSl6Ca0j3gKIGhO9LIionJZjZQgDh3xz2QSr2FhHhxwj7EU
	CFezDtxzz5bwYWzoXXGmSHHp0XZUbLbK7uY7YXjeglodfwgzbqAxOUt/kYq0u5+D1Eg4+TejeBB
	E6NtRPEqfENbUusEmOIImxd8eH2jRNir8+VhlfUunqnHnZbzwvSwhqb5HfI55VR7fepgltLa9UU
	DL3Egdnt0S9rj63d7i75TO2w4ZkBlt6h34WQJpJA9qOYHpUTeaO2WUW9JgCo2mk4dhNoignoxGP
	AKX7Vk5UuWBerBqs966JoOk9KQeu2mZGjFid4EodF9HLG43XWHd6Q7ZQVke6Jf7TVVUS4p8/7mS
	8HH9FcJPxdvYIejsgFk/P4BB3DcRxZdN8JOBWX7RniZ3cy326jo3tDWdLTaSmW7/MdJT/KjmxSF
	DN8RyJjmsTK8n6PnJ09GJGPRRh+ChA==
X-Received: by 2002:a05:7022:1081:b0:154:e9d2:d741 with SMTP id a92af1059eb24-1b503112e3amr10151143c88.8.1794892218987;
        Mon, 16 Nov 2026 21:10:18 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38116afd7f7sm3856351eec.17.2026.11.16.21.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:10:18 -0800 (PST)
Date: Tue, 17 Nov 2026 10:40:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: virtio: bound the line names block by its
 configured size
Message-ID: <avvht67hxDh7a9oV@vireshk-B250M-D3H>
References: <20261104195632.1702765-1-lian@is.s.u-tokyo.ac.jp>
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
In-Reply-To: <20261104195632.1702765-1-lian@is.s.u-tokyo.ac.jp>

On 05-11-26, 04:56, Lianjie Wang wrote:
> virtio_gpio_get_names() walks the line names that the device returns in
> a block of gpio_names_size bytes, which the driver ends with a NUL, and
> checks each name only after stepping past it. If the block holds fewer
> than ngpio names, the walk reaches the end of the block after the last
> name, and the next iteration starts strlen() at the byte after the
> allocation. With a block that holds one name for four lines, KASAN
> reports:
> 
>   BUG: KASAN: slab-out-of-bounds in strlen+0x57/0x70
>   Read of size 1 at addr ffff8880026687c0 by task swapper/0/1
>   Call Trace:
>    strlen+0x57/0x70
>    virtio_gpio_probe+0xcb4/0xfc0
>    virtio_dev_probe+0xa7a/0xc50
>   Allocated by task 1:
>    devm_kmalloc+0x6e/0x280
>    virtio_gpio_probe+0xc06/0xfc0
>   The buggy address is located 0 bytes to the right of
>    allocated 64-byte region [ffff888002668780, ffff8880026687c0)
> 
> Check that a name starts inside the block before reading it.
> 
> This patch is assisted by Claude Opus 5.5.
> 
> Fixes: 3a29355a22c0 ("gpio: Add virtio-gpio driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
> ---
>  drivers/gpio/gpio-virtio.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> index ed6e0e90fa8aa..32326d91f33d6 100644
> --- a/drivers/gpio/gpio-virtio.c
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -520,13 +520,13 @@ static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio,
>  	gpio_names[gpio_names_size - 1] = '\0';
>  
>  	for (i = 0, str = gpio_names; i < ngpio; i++) {
> -		names[i] = str;
> -		str += strlen(str) + 1; /* zero-length strings are allowed */
> -
> -		if (str > gpio_names + gpio_names_size) {
> +		if (str >= gpio_names + gpio_names_size) {
>  			dev_err(dev, "gpio_names block is too short (%d)\n", i);
>  			return NULL;
>  		}
> +
> +		names[i] = str;
> +		str += strlen(str) + 1; /* zero-length strings are allowed */
>  	}
>  
>  	return names;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
