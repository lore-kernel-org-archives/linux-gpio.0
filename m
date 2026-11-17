Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922508;
	b=fOodY9msPZd5GRuJIhXfkIe/EbK40OeHyRWK6UelqA6lUZo70bLx2JjbFhubclZxoW7g
	 G7L4S0o1FFA7zUG3hX5xMJpyGgWhEr+Z3vh+p/fcYwUq2+OQNQcDs5ibN/KHdIq5cufSI
	 qlSwlSqPZNczfXV9mRQ+loE34qEK6cdbT8jogFOtWkQ9OlSyEH9lRFJuui7gjbsDANnPk
	 FtkgmSSEy4zw9fg7pEoDnEWrnugECyCNiWj2k2qoDe+g0yEpuJH587VxWAPdC6Ooxo/Bj
	 Eshgw2nzi9YuzcewuUhNXcqDOunB7Da+SLzxsdV/5vBdrMetcgH4BhTtKBC7wxprhdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922508;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ioA43pJHcDJQL8W7VvWm4+CiwKJ1zY7tj7ZN6Wqk5cw=;
	b=OBKhtG9jKB3dA4EE8euHF99pmOEhmTed9IdVNa8QXsUE2TIkwz4K866Btl8fUKnyJxEG
	 AMcvRJj7jSM9PXNAjdls0SZDFBh6afvy+qYS0H7u1w2hDgy4xESrPUJ8yECluNgO/bAEE
	 WNtQp8lazrXqL3vsTZJPYLwNpvC+RjHTtlgSv5I5f6dZC94/KOGkkD5xiL/VTu5kXgqaA
	 RKeCDYPoHJdy8tKqtkqbh+Mzmyh4B/a2H1Wns9HgsAVthUvjEPU8CbtLwDCvhWCP/8Okg
	 k/jpNpWpoQEPB5+ASeq9ESlLKcMRiGW7JYOfWYJtI/qgryQXXqj7BGMcYLCEYXwhVlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMYUJUxw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 50757606A334;
	Tue, 17 Nov 2026 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMYUJUxw
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6C2D91F000C5;
	Tue, 17 Nov 2026 13:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794922508;
	bh=ioA43pJHcDJQL8W7VvWm4+CiwKJ1zY7tj7ZN6Wqk5cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aMYUJUxwV3D3h7O6WftIBGjTr+39NhtyC9CFwIximBe8cUa2/9uJe/qc/n5Rk8Ze+
	 maEFKoZ6vfLi6KHduZDmxqIk/j4OqtlebeG3zquyHhgR82OPzXHVwk7UbK+WoD+v+L
	 m61h+VgjWkU0IS03f1wbbCRReTD0YQyeGXS8fmqMF9FEAjfJn8HkE0whcU51ZTWzGu
	 jYAbvI5xz6QmfX18oN/PdFlluZ8U/w7JQG2Hna7vkaye5SzcLO0IEfW+/lCfPC3APH
	 5aMLQa/sEY09iCzj4ob1EXD8r/6bR5nFWn0Io5z0wO6aLSC4sVyKqEg1dDYj/nJZzj
	 IQWQDrA+EnYVQ==
Date: Tue, 17 Nov 2026 14:35:03 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Igor Velkov <iav@iav.lv>
Cc: Linus Walleij <linusw@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] gpio: shared-proxy: open-drain regulators on
 ODROID-HC4 fail with -EPERM
Message-ID: <kcopbszdsz2amzas3hmchxokw4bjxafu2wzjplthyihkellwd2@hd2k3tomwvdq>
References: <20261115-hc4-gpio-shared-od-1@iav.lv>
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
In-Reply-To: <20261115-hc4-gpio-shared-od-1@iav.lv>

On Sun, Nov 15, 2026 at 04:55:00AM +0200, Igor Velkov wrote:
> Since f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64
> platforms"), two of the three fixed regulators sharing GPIOH_8
> (GPIO_OPEN_DRAIN) on ODROID-HC4 fail on every boot:
> 
>   reg-fixed-voltage regulator-p12v-0: setup of GPIO (default) failed: -1
>   reg-fixed-voltage regulator-p12v-0: error -EPERM: can't get GPIO
> 
> The first user (vcc_5v) sets the line to output high in
> gpiod_configure_flags(). Its enable then goes through
> gpio_set_open_drain_value_commit(), which emulates high by calling
> direction_input on the proxy, and the proxy switches the shared line to
> input. The next users hit "Shared GPIO's direction already set to input,
> refusing to change" in gpio_shared_proxy_direction_output(). Stack from
> trace_trigger=gpio_direction.stacktrace:
> 
>   gpiod_direction_input <- gpio_shared_proxy_direction_input
>   <- gpio_set_open_drain_value_commit <- gpiod_set_value_cansleep
>   <- _regulator_do_enable <- set_machine_constraints <- regulator_register
> 
> Armbian v7.4-rc2 (its patches don't touch gpiolib or these nodes); same
> with the five shared-proxy fixes from the v7.4-rc3 pull. The winner
> depends on probe order: without the fixes vcc_5v lost in 2 of 4 boots,
> leaving the SD card unpowered and no rootfs.
>

I was wondering why does the second user even arrive in
gpio_shared_proxy_direction_output() at all when it should take the
emulation path. I think the issue is with the proxy driver not
propagating the -ENOTSUPP error code in set_config(). While I did author
that code, I have no idea why I did it and if I even had any reason at
all. Could you try the following diff?

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index cb593192076f..8197ebb5f9a2 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -186,7 +186,7 @@ static int gpio_shared_proxy_set_config(struct gpio_chip *gc,
 	}

 	ret = gpiod_set_config(desc, cfg);
-	if (ret && ret != -ENOTSUPP)
+	if (ret)
 		return ret;

 	shared_desc->cfg = cfg;

With it, both users should take the simulation route.

Thanks,
Bartosz
