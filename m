Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843237;
	b=2irWRcOv4eJoRwy2y/TUFt10dTTijc45Ril5DwtWCXgH0cg4Z+GhelN2R+TbVq4Btpci
	 2oyT6eBkbX4c2RjH6Y4zZXw51VEvpI4GvMjdu/SsBVYrMpfoqEP02IIlNZJTXjcz1M0wb
	 KmFWclVA5TektltI36adfCI31KqexH1BSyk5HKtM10P68p9JPFO/tDCjFQGxxYylCAcYO
	 V+qvKf+oDSDChjMlIewiwxQ8DDonXszcxCYbnhm/3XV5ZTuqTr/CdaLahad9N+LV7/0wC
	 u3r8Q3g496iVvnLq5XWC09qJH67yS5FB+QqWkXrsf5epnbN9uO8Oh7vi0GcsMXpKo4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843237;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=txiBc1fIIjRnduaYGvsAlilBrNnqO5uznZYol0hR9uY=;
	b=S2WK9TVrm6aGN6YtzUPDF7TQBrHNirujBWJraJYN6g7Jeqr+mezYlm8q2Q4A7ieWIWG9
	 I4MZyHQ4BAqh2TCNwO1G5WaHKBp2LJkDb+TyRr+NQnShg0aQZaemnXCmtPYkm15yW0H+/
	 yd4fDn4geXnNAMdIGmGgzvLf8gHwVFdPuod+YKntIWmO5a+Mkx7czJT9dSjnyXE6kFiZJ
	 CXTsULrAeFffL7lzSFlwM2j6H8WwCoDZvjYSmWNuidPACk/X/tekKYIxo/8obLouDB5zX
	 NFSpcvvFk8VwMDg52RHjKfZhgVJ8jyX8p2iJWrznbBv4oMU9fWpnep5B8StGgaGD4xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n7nzFOja;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 61670606A31C;
	Mon, 16 Nov 2026 15:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n7nzFOja
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9DE271F000C4;
	Mon, 16 Nov 2026 15:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794843237;
	bh=txiBc1fIIjRnduaYGvsAlilBrNnqO5uznZYol0hR9uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n7nzFOjar1/kHRWJinkN0E8SfgvFUbj92nx4bS11snDTHcT34SvS6HlhEbfpepyjB
	 cr3f0SeOdWKxQ9erxAdMv8iIZpy1XaYmpmNEl9CgmlWWAUadQWPgyHIiKnyu03iT6t
	 7rUa78zVA/XDdgKquOsEJeD2CCFZyeJVEHzR5n2R9E/HsdDCcBKcGibo83B3LfIM0m
	 qVT5lfiq3uv0/TC2HI+3iMtV//QOxqOuLuUK5ggaAT0LgF9lRhw3MAjr8wT+QcawCD
	 +lUke44ZbaDzzPdNLONpqqj/FsWRKZAgnDNh+YFwYim9vs7W3QB2X+v5GkQjtwYL+p
	 Fy4tWGAUSm1bw==
Date: Mon, 16 Nov 2026 16:33:45 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Igor Velkov <iav@iav.lv>
Cc: Linus Walleij <linusw@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] gpio: shared-proxy: open-drain regulators on
 ODROID-HC4 fail with -EPERM
Message-ID: <ydbkylktoh57blvvgjphclostsp6jiedpbema7d6ejxqb5iwjf@h2hcyu5re4f5>
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

Thanks for the report, I'll send a fix proposal for you to test
tomorrow.

Bartosz
