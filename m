Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563572;
	b=O3WFqNkjipepaGiRbsLpkQEa/cOgrJ5s18wgEt1a6Xj9fxIQUqrcK/wpdis24/XEM4fI
	 VywR31i1HsVlMrQRDalAls7AyEFl/WP7uIxu1Yduvaq0F0Qd29/Sea5S/2vgmurtEzY+D
	 UnwXNvcFZAlKD97HwZgK3dq6xa5IRbj/oEMVl1H4/k9nzvr3TlhdywZxyJxVUwTh34pOC
	 R5GGVG9u6L3ldEzjM9oOV3nCK1IHteetyeW+Ef3N0Qtg8sCUMSIgkhAhqVAScEj9R1xTH
	 B0Eruuv0lAtufC6goX+H3VfRw2s2vwH6medpURlm5I4a36Bxrm2y9fkuBHb35ILi34w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AnA7uJSI+FmP/SSTgnturLYsnYlMVsJF1Sce6mnuOt8=;
	b=3VvVwNYuuRGYRhBdJ0yhxlaBzSM+z6PpBfMBBczzfRlmf3haA9nvhBACpWrx6F7ZYvfH
	 T2AX7R5VXjDwbAHzCeR+y/usi97vB1yhOwXd96an4l5JE9quHQDBPGPe4KUre7YMmA72r
	 8O1kQ9zug2RIayWxqbGieVxPq0FQhAa3HvFGYs38m/JpC7YXNZEPJ52qq7yb4D77aXhO0
	 5/H8pmbQotOXJXh2ISoLUXTxH+YM98WBcMfTRNSc0LWTfZxPVusfe+XHTmp4B6QnJwxyx
	 EKVL+Nk9yyvvhoHLxZVIUCZ9WfvURTPrHDk0Xa6OyceakHYTTyQ9fZ36u4WL209cZiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tLsknzkb;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD45606A327
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 09:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD45606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tLsknzkb
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1153603a91.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 01:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563571; x=1795168371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AnA7uJSI+FmP/SSTgnturLYsnYlMVsJF1Sce6mnuOt8=;
        b=tLsknzkboX6RUWtslnAEiq5fjDbk9Ajab50yczQsFiX2aq46Vq4RrbvlrzoOm5q9Ls
         IZHdI9Ia2NJmFEZ0zhaSp8+YMWvqUd86TjgDw/QwA6NX12Una9hfb7HJ8T6q8kuh6p38
         izxnDvrK1jgNSRd5cq84BBhoKIBWlF9ro+YAKXynL2B8P7cXrRIJ+gfL3qqUj5VCguEn
         wZAVshwUqAZzCeKJtNb9JHqrY8q4fUf5V/iftMm/xhpENOouA8P8P4itkG26sge0ykiq
         zrkSR5siyd2gubX+w8DjYCm1noEm43VKG9LEGQ6M6Lj94qOx8rvyeLvo/0goNXr5auFu
         wjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563571; x=1795168371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AnA7uJSI+FmP/SSTgnturLYsnYlMVsJF1Sce6mnuOt8=;
        b=Syetnh17uHny+bDPhl6dZyi1h7Azy6Ejr+rj0VdaK5IllPliGZwjlwJg4cc8NYK2xn
         +yDALn0ZJuCGQnXgfc4H76Xy1V6ym0icy6I9jYTCnYaF+/kAte0cHTprr4sbjAqfhW2d
         pLz30wlPUOgPFzMVLVgUGo+cr/0a6NJ/nAJAc6QmUId37B/ieNMXzJEss7GTDehQgn42
         Jq/9Dthh2LjXy4GMaj/B1FMn0j7jI8DqHYOZl1gALyyj4qP9WK05kyV0Youpm0XH3ejg
         ZKYXkWeUYsUpAdnV06NA+lTbbWYgdygUJlcPrQvLq6/e1tpPvSRUlYAI4kMr8BONEk0g
         3pbw==
X-Forwarded-Encrypted: i=1; AL+hErF4k8dnSVtedh0kB6IR20BFeWujA+glx9pBz903bLqiIK6DodUTts+s1W69D3kQ50J5kTMTeug1fAmX@vger.kernel.org
X-Gm-Message-State: APuU4Z8BYgq42dQk61o4KYQHU5iImieTs95lHtD67XI8/eXtm+r4Xgs2
	FaqvPwxy5loWZnk9cTJ8/AD3M5RYKLB14GbnN//RO8lxJhCZL9bT0/bk
X-Gm-Gg: AYBFou3rhYhkuRnRWf1QOpWDAqhQTXuinM4+0+3ErPY9d1lXgKHpxOcTIZAUqnp9oio
	yH5b6AJNOkz4F+ZNwM58D08iuDv2VdjdemchL/cAj4IrGKDP9ogmosZnoR2TmP8/+blfrlY98Ay
	CkkKvJtV8RG+vjjTJHq8DQvey+bE7VfWiYt8M2L5jTrYmeWYLwvYVupfDN+HLuZPl4QT539fz5S
	gIaojTxhF2haSWsEbBZxcffFWu5wvyNMni3i7zvC+bSMSOIMo/WN8wBysLhYdkiGruVYUf5AsSe
	20vSvVroGIUO7C2I4ONL0NJDeamgoftCF3tbXVThW2Wzb3oNEGrlkGDTArMr5Y3nl5jaxEB8oIl
	y5qJHlqAytaDB/3BVk/Tl+WUt0mPVfh+hHlN4hWOxFie1BDn8WJUlCQRF3A65gp0cKyQL0SmaKo
	IKi4mUPirTW9YHGjhDcastchrxJjwGidg4h6S+/vW8UydFp6ZlgvYUtMfG7YW0+ahV1ZGxZtsqU
	MKzwHhb9cQYjCKo1KXeKBmMRqde/f2W7kt6TUp4iP9wIBN26Rw3eh6QCxseC7i5D8viu4jQtBgF
	4HUiPyStNB6P5SE9EnJv27dxRqn290mAJuKhtXDPE+5/vKBPPw==
X-Received: by 2002:a17:90b:5687:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b1b087c04bmr1164575a91.6.1794563571127;
        Fri, 13 Nov 2026 01:52:51 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm3893709a91.1.2026.11.13.01.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:52:50 -0800 (PST)
Date: Fri, 13 Nov 2026 17:52:43 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 0/5] gpiolib: improve concurrent access to the flags
 field of struct gpio_desc
Message-ID: <20261113095243.GA103672@rigel>
References: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
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
In-Reply-To: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>

On Tue, Nov 10, 2026 at 02:47:00PM +0100, Bartosz Golaszewski wrote:
> This is a follow-up to our discussion[1] about desc->flags and possible
> races with users who don't/can't synchronize with other means.
> 
> It's an attempt to use try_cmpxchg() to update only the required flags
> atomically where needed + minor fixes using atomic variants of bitops
> where it makes sense.
> 
> [1] https://lore.kernel.org/all/20261015153714.GA105746@rigel/
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v3:
> - Don't pull in bitops.h when including bitmap.h
> - Improve coding style: fix indentation, set mask later in the function,
>   make lines longer and more readable
> - Use the right Fixes tags
> - Link to v2: https://patch.msgid.link/20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com
> 
> Changes in v2:
> - Drop the custom gpiod_update_flags() function and use the existing
>   set_mask_bits() macro instead
> - Add a patch clearing debounce_period_us before GPIOD_FLAG_REQUESTED as
>   suggested by Kent
> - Rename the functions updating flags in gpiolib-cdev.c
> - Don't rename the flags variable
> - Link to v1: https://patch.msgid.link/20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com
> 
> ---
> Bartosz Golaszewski (5):
>       gpiolib: don't overwrite the entire flags field in gpiod_get_direction()
>       gpio: shared: use atomic set_bit() for descriptor flags
>       gpiolib: clear debounce period before the "requested" flag
>       gpiolib: don't overwrite the entire flags field in gpiod_free_commit()
>       gpio: cdev: don't overwrite the whole flags field when configuring lines
> 
>  drivers/gpio/gpiolib-cdev.c   | 93 +++++++++++++++++++++----------------------
>  drivers/gpio/gpiolib-shared.c |  5 +--
>  drivers/gpio/gpiolib.c        | 35 ++++++++--------
>  3 files changed, 65 insertions(+), 68 deletions(-)
> ---
> base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
> change-id: 20261104-gpio-desc-flags-atomic-cc963a1ccfd0
> 
> Best regards,
> -- 
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
