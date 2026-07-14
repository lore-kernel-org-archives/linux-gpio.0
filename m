Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52F03F6C46
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 08:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016631; cv=none; b=FWiZBXKyJYHNW+1HrXGDSJ2D06qzJMDR+kYgwZAV88nORgR0WnC7wdHY9cplaN633Na7gnfuEhf4iPMd01cDsyCpPPafPB0cp/satL/Jw7+ZNYL4udXEOOsCzQ2HhxQ0SXzWOC7n+uH0SBW42I18kYJY7DBQlM0KqvS98p2tm+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016631; c=relaxed/simple;
	bh=lKe7dB2Ux6isdSw93DPoCdIedZBS0rBiJXIpQS74mWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewoNzsv/OltpCG0mxV00bFj8QJ+Dxn6xNSBj7AqXDPGKHmiHFOynV1YEQ1pAk/TsU+g3PlVO9SgRNi7k7UKm9pwq3SMegAR62XJywZvUWoF2Z0Ro94HIh+EELEs6K9ffXyjNh9ygvgogIM4Zt0j6obGJxYsF6nB5xo0z/8jPcgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VI5/vIQ9; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VI5/vIQ9"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8486672f03cso3589379b3a.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 01:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784016627; x=1784621427; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qMw7BjXvglPvLnw5aA95K1W+uWIFJhm43vKAHapzhcI=;
        b=VI5/vIQ9UhO737ZUj76VsmMb6JNpCLIGF6XKNW714+oXr5krL0E00r4K/brCBHwnLA
         QGfWtD3/D0M0LQVcMQ3eLTlYMcnJFi0rExQOtUdWEpabNvZGFvNNVrDcX3V0syUrDzjV
         xgjGm/8dghbCPZ49Nb2IHPAfEmkKIF8Zi2eGAL5fzjbNnhEGacMKzKatKKj41NkGHwVP
         cGsNP5mHFCtWNxYE3+YmN5NVXASi1W4vdvoIc3cd0d2DirqY/6swiacR3iA0PboYHK99
         W8jSVw125CVlA3HibqSvwjOAYDUjeDJydaBXrwbEtrdeyi5bD55Q5kwiLYLkuYapGwXo
         EzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016627; x=1784621427;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qMw7BjXvglPvLnw5aA95K1W+uWIFJhm43vKAHapzhcI=;
        b=MyxbH+nV013gR8BoyW2T+KgenI6kP6dX2HXp3+tkYw+xHbKLoeD545ntL0Tzm8RbW6
         Kk2yukmbOdxC+dUMg5o32NKc/J9vaqo1dRQVMr3nT8W65cC8F2J9uI3KFENOQPs78qsN
         0OZlqNjhqj9EsxObZMiu/wtWRTbfS9tIKNDi6UHGm2gDdYJkiFwdvTr/9qlqkFvsJazz
         ae5N9+zXLhEImThHTE/8tUBvPdHSAm6xbWJDptehLyKk4n9UBTHijAMekOdUw1K2Bopg
         XmhYIXKyA/7tLoBFISLg+lpJGjuGw2UY0VcmPAGibnBKCsa2MndQdb0mHrOHjfDwfIz6
         dLuw==
X-Forwarded-Encrypted: i=1; AHgh+RrbuQ3ytRF49RJWPhgKCj39RP4PzNoZWsNpx0OeqQONT45/NpTjFQDjv7rblSiK3bFLY98afSvyf0qg@vger.kernel.org
X-Gm-Message-State: AOJu0YwOLfUNL1PzZqFd3M7MqIA39QrvC4sp3Ttiiqy6vAGvoPTl1ptQ
	q0ClLu0cv88USGwo+QXX26wXYcUKCN15BO/KQaJ7dBR5iyz4dOe7IeoQXkFLj5MaK2o=
X-Gm-Gg: AfdE7cnXUpA+6sh85gCAkFmtVxb0M36XbVH1xl6oiOnTqQs47sZvByuFFRyqjRw79Ie
	qzTektPj1zsPX97Vsn33BTmr1/SPywI6PxKU8w0Fz6/bM3hTwEjyADTQ6gy0LbVVpYw7p6Hgv4X
	5TerHpmeRbWXyoaqK6WpF4+QhJoaPynqMT70geXY2ayOILaFe+5neNgFe0Is5v6kvE3yrrl6Sb7
	iCwC/lS9iC2PvcnBnP7gvhI+3aR+LJnknaSz4DN284inJfs099RvNsSVyDASn9ZQEhmmhh9Jcqj
	U5e1ouxTobOLAJBNW0LngNV3jk6tk9ju2tI7tfG0uXR7K7rvJAhIfunTL6Plja2OUYMyzTEnL/X
	bUJ1B4KOvJqVDEvL2EfSTLGySJ+KRqyyYWmidTdrgl/Mg052U2Xh1+hx9zElTqnHjOaUHtWJNMk
	JSuKiR82m59QPS
X-Received: by 2002:a05:6a21:62ca:b0:3bf:6c08:fb87 with SMTP id adf61e73a8af0-3c1109f0a15mr14553127637.55.1784016627284;
        Tue, 14 Jul 2026 01:10:27 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9bb8682bsm18011561c88.10.2026.07.14.01.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:10:26 -0700 (PDT)
Date: Tue, 14 Jul 2026 13:40:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, 
	Viresh Kumar <vireshk@kernel.org>, linux-gpio@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 13/20] gpio: virtio: Use a named initializer for
 virtio_device_id array
Message-ID: <je7u5l3i3tk6cu6ikahe7plgr72swe7f22m2eopjw3am6vof5n@32u7fsmvyipz>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
 <1f764e00e8cbe7624f4c9f3d8e5c368fd9a13e08.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f764e00e8cbe7624f4c9f3d8e5c368fd9a13e08.1784013063.git.u.kleine-koenig@baylibre.com>

On 14-07-26, 09:24, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> This patch doesn't modify the compiled array, only its representation in
> source form benefits.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>  drivers/gpio/gpio-virtio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> index ed6e0e90fa8a..42871db05ec1 100644
> --- a/drivers/gpio/gpio-virtio.c
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -646,7 +646,7 @@ static void virtio_gpio_remove(struct virtio_device *vdev)
>  }
>  
>  static const struct virtio_device_id id_table[] = {
> -	{ VIRTIO_ID_GPIO, VIRTIO_DEV_ANY_ID },
> +	{ .device = VIRTIO_ID_GPIO, .vendor = VIRTIO_DEV_ANY_ID },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(virtio, id_table);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
