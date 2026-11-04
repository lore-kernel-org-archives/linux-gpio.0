Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776269;
	b=mK0xxyTk0/23G5fj0RBlQL5OtM8RGVG47zTCBlAtv7jihpySbm0qnP6fpQFLj+7Ly0jo
	 GtIPGYa9Pn+omMorEMeAln2Nyo2CjP5BFxUIKWDeruCJCH/aACuZLM7pcnFnF9Vx/pG75
	 TfDuxPJ90ygqrU++g/rehB7QCwv0MSA6i3D0rqpeNzkLD10/GBz4oKzJASRwnkumYnAuN
	 5dxN6pk0IIXvmAwPg4fBgbcfJ9BUNNBg5whJ/6ZcuWL+Yj3xMiO8lNk7vkI0QiwX9Cnh0
	 apYKx/5KhW8zm94LYKk4o0z9fcMuNL8dKIQh23pg1w2W3nvpa983k/K+1xKGmiZjnoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776269;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/Bi6Gwc7m5iBGGYrjHgCb13PnYoKlWXKan4PKKOkk6s=;
	b=ebFLEHFLZiCWpiuhhUW5v4myD1ToGrm9brl1qRRT2pgUYTUjcyVV6AMz0VhLY3OkR+Yy
	 pevqkJI/Lwwos6vtcxE3YTK2AJ+JXEuu/uBz6zmr04ZFNc0dahoI+Qm0fSbjyyMV41xu7
	 eipAGooY6CcMdksWLJ7xtwnbNCnD6/RATIv1zbtfqFVCSiquAm4SYrcyvQVrDQIiWo4py
	 2YohwHWVnkPCMPbPtou6vd5wMocl9xt6nCgyvYBPyuVf336O3qeEjC+rN6F00V0wJeh5H
	 1dtz3bVLJE4BmwcRwT6AwWTfNqaZ8183MW2ehkOgVZS8oXMneOBqpCK6G66khkbERQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gQSCgeNl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368E0606A326
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 07:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gQSCgeNl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2768A1F000C1;
	Wed,  4 Nov 2026 07:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776268;
	bh=/Bi6Gwc7m5iBGGYrjHgCb13PnYoKlWXKan4PKKOkk6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gQSCgeNlfgrpX4xah0AME6Zhs/16TrXVdOy57a5l4HUc2NGPWhrg8w9S85r4uPIql
	 4thrv+ujAVYy+XE/sBPMoW1dN/G2BkpNfBEE5Ih6GhYL9XgxeXBn+KGN609HRd7fii
	 Y84WDyag97NJRt15KS4XHbuQQaOR3s1MukF60yndnqsJ/IMVEamC2S73QI/Zec4SeB
	 Vt/9FLPYMANIpDWutg2v0LMrGADIG6YL6Q8V0i7011SzYut+UdHxSge9UzUAj8UYly
	 LcuOFFE3GUMqaCONfjzAgLfe1DD9nXC2WBtCTb3puVbFsffoa+T9cnItw1Wh+uv5LD
	 4Wlz5kNXqbl3Q==
Date: Wed, 4 Nov 2026 08:11:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: keep the chip reference when deferred setup fails
Message-ID: <20261104-annoying-interesting-capuchin-61cb94@quoll>
References: <20261104025345.1527526-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104025345.1527526-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:53:45 +0000, Wentao Liang wrote:
> gpiochip_setup_devs() runs once gpiolib has been initialized and
> finishes the registration of the chips that were added before that.
> When the registration of such a chip fails, the function drops the
> reference taken in gpiochip_add_data_with_key() with
> gpio_device_put(), and only then logs the error through &gdev->dev.
> 
> For these chips that reference is the last one, so gpiodev_release()
> frees gdev: the dev_err() dereferences freed memory, and the chip is
> still linked in gpio_devices, so the next lookup walks into the freed
> object as well.  Here the registration cannot be undone the way
> gpiochip_add_data_with_key() does it, as the driver already got success
> from gpiochip_add_data() and will call gpiochip_remove(), which unlinks
> the chip and drops the reference.
> 
> Keep the reference and only report the failure.
> 
> Fixes: 16fdabe143fc ("gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpio/gpiolib.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof




