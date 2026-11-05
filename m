Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867812;
	b=Kyg44CDb3IQunEoS7ypM2/YcEX7IjuXOhYYzoTvajViJuUD7TwkdwkItU7Q7GNlViEcZ
	 KW0WiIkn+x4f6nR3hc3tTymEKqRHR/q7FgqL/MlKOWpK0k4xNE1rtQwfkuGDqpPl7qfEu
	 7l15NrTpdMUi4wCoeRZzzo9as96x7pXG0Ic/hcZocosCeJ+r+PhGWMUAiHvXeLn1xS2eL
	 ZQizJvE7+0oe/Z2y3KSpOD9+rQBSK9yVbgTILJLhB71Sw0AfyKzJ5chTOPOCjOtAyIapj
	 XTzHv8jMT5lBPM+OA2PD/qpziCJb6oZT3+aGKTWyx9nICREIqHR061z6gZAZL5BLhvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867812;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7DN9bHAclZBpT6vA3s4oOOECdcaCHYQWkqSsJ9/4dr0=;
	b=mWoCrErqams9vr43o2oylBDRwiD/OTJBjzhABqeOTMBSc5hbIWJTzXnc2MMshMKXNy7b
	 UqCh56rA8HNJiXG3TM57ChykRL0o9uZLRZ+jcEysHlQHNusDPUU9Tcpa9XH0uZ3zvsUW8
	 C24JLOB41azxLr64ug23tK9QTLiIhBx/2vAwhjjjK0owIQV+IwLefEEmxOu6usA39mncq
	 ERFAYF8rxmu1gNW692FShae2+nBcnRfF5MHAg7XSSnFH6eA7kVybotKOqYcybHaRRkU6l
	 Dwm42qsqqPKWcf0Rzh+Q1CHxqLZYkgy9yikYaN6TV7lZ7QSa3kTuPjubemIq6O1e2kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HrQwagZT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 68A3B606A326;
	Thu,  5 Nov 2026 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HrQwagZT
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5D5DA1F000C1;
	Thu,  5 Nov 2026 08:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867812;
	bh=7DN9bHAclZBpT6vA3s4oOOECdcaCHYQWkqSsJ9/4dr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HrQwagZTfYENUwlOVqBX7j3Ry31NE7PqcuvSGhedvmmRowAdHkvNkWCMDjIy/iLUf
	 VmRBT4m1c6spcToj+JyhygV7yrDVWi3OND4cdKoXE7cqXxwkAsFvpKELL1ct19tEZy
	 OIpH10/0LbZ1M9981gJ7Lq9Bpu5jEb0V55DOfwehCe4OWHnW3YhqYVrJ1XWCJvdO1x
	 lmJcOmydSvYIrP6ifHWVZpGMYdO5aOYY3XZb0Z99fKoXqHfyZM7sbJ/CklOHGK+BX1
	 PsoRQz6VxPSH1AGUV3W3c8MqMlzoQW0qjEIClGaY0LTVVfcx/yGdPoNQ131AvM/J0Z
	 oR7GSaL24Q76A==
Date: Thu, 5 Nov 2026 09:36:48 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/panel-mipi-dbi: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
Message-ID: <ic7droim3dya3jtsherqq34ko7xdbwyjmw7oulq37rgvar7jt3@77nh4qbksbxa>
References: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
 <20261103-panel-mipi-non-exclusive-gpios-v1-3-aa862c1d71e3@oss.qualcomm.com>
 <sashiko-outbox-195387@kernel.org>
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
In-Reply-To: <sashiko-outbox-195387@kernel.org>

On Tue, Nov 03, 2026 at 01:42:47PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/panel-mipi-dbi: broken shared dc GPIO in panel_mipi_dbi_spi_probe()
> --
> 
> commit 90b279985dbeced362ebac928f364d9afff9972e
> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> drm/panel-mipi-dbi: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
> 
> This commit removes the deprecated GPIOD_FLAGS_BIT_NONEXCLUSIVE flag when
> requesting the dc GPIO in panel_mipi_dbi_spi_probe(), relying on the GPIOLIB
> shared GPIO proxy instead.
> 
> > diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> > index 60cd65cae41d8..6f09b723cd7c3 100644
> > --- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> > +++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> > @@ -418,8 +418,7 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
> >  	if (IS_ERR(dbi->reset))
> >  		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
> >  
> > -	/* Multiple panels can share the "dc" GPIO, but only if they are on the same SPI bus! */
> > -	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
> > +	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
> 
> [Severity: High]
> Can gpio-shared-proxy work for a shared MIPI DBI D/C line across multiple
> panels on the same SPI bus?
> 
> Unlike a shared reset or enable pin, the D/C GPIO in MIPI DBI Type C Option 3
> is a bus control signal (0 for commands, 1 for parameters and pixel data)
> multiplexed under spi_bus_lock(). In drivers/gpu/drm/drm_mipi_dbi.c,
> mipi_dbi_typec3_command() leaves dbi->dc asserted at 1 after transferring
> command parameters or pixel data:
> 
> drivers/gpu/drm/drm_mipi_dbi.c:mipi_dbi_typec3_command() {
> 	...
> 	spi_bus_lock(spi->controller);
> 	gpiod_set_value_cansleep(dbi->dc, 0);
> 	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, 1);
> 	ret = mipi_dbi_spi_transfer(spi, speed_hz, 8, &cmd, 1);
> 	spi_bus_unlock(spi->controller);
> 	if (ret || !num)
> 		return ret;
> 
> 	...
> 	spi_bus_lock(spi->controller);
> 	gpiod_set_value_cansleep(dbi->dc, 1);
> 	speed_hz = mipi_dbi_spi_cmd_max_speed(spi, num);
> 	ret = mipi_dbi_spi_transfer(spi, speed_hz, bpw, par, num);
> 	spi_bus_unlock(spi->controller);
> 
> 	return ret;
> }
> 
> When panel_mipi_dbi_spi_probe() requests dc with GPIOD_OUT_LOW,
> shared_desc->def_val is 0. Once panel A sends a command with parameters and
> sets dbi->dc to 1, gpio_shared_proxy_set_unlocked() sets panel A's
> proxy->voted_change = true and increments shared_desc->votecnt to 1. Because
> mipi_dbi_typec3_command() returns with dbi->dc still at 1, panel A retains its
> vote after releasing spi_bus_lock().
> 
> When panel B on the same SPI bus then calls gpiod_set_value_cansleep(dbi->dc, 0)
> in mipi_dbi_typec3_command() or mipi_dbi_typec3_command_read() to send a
> command byte, gpio_shared_proxy_set_unlocked() checks whether any other proxy
> still holds a vote for 1:
> 
> drivers/gpio/gpio-shared-proxy.c:gpio_shared_proxy_set_unlocked() {
> 	...
> 	/* Desired value is the default. */
> 	if (!proxy->voted_change) {
> 		if (!shared_desc->votecnt)
> 			ret = gpiod_set_value_cansleep(desc, shared_desc->def_val);
> 		goto out;
> 	}
> 
> 	/* We previously voted for change. */
> 	if (shared_desc->votecnt == 1) {
> 		/* This is the last remaining vote for change, set value to default. */
> 		ret = gpiod_set_value_cansleep(desc, shared_desc->def_val);
> 		if (ret)
> 			goto out;
> 	}
> 	...
> }
> 
> Because panel A's vote keeps shared_desc->votecnt >= 1, gpio-shared-proxy will
> not drive the physical D/C GPIO back to 0 when panel B requests 0, leaving the
> physical D/C line stuck high in data mode during panel B's command transfers
> (and vice versa once panel B also sets dc to 1).
>

Ugh, this really only works by chance right now and is racy but sashiko
is right that gpio-shared-proxy would break it entirely. It would
probably need a dedicated power sequencer.

Bart
