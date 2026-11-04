Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779600;
	b=yoTaPXWCouOg6mhVGn9Zf93FHbFzxAQMUwSRI5lhUlxl7FSEO+srJXBjJ0y+al66emA1
	 8Cj7aIauroHV1BidZzjaTAyDmh47dJ2PG3YPqQq2zm6kvqF1KBIvB8O9aIMxwZ7XrLWlc
	 mfQYnM7qqULOl7ySozsqNBYrNlv3V/grkOtrq8GesBKXFPpZAtAIqt98gGX2svUFH/Zk0
	 MVNY1lOLSPJcrJ63JjA13GjlRmqDajeql+kC5YfhD1vUN2f67ceDwuoMEOF13kMqLYrXQ
	 hqQxF+kxO3aoOZqRBXsMqw/KBMRqt8J65k8C6/40V5BWpJk1Hg7ogSvCAwyYqNnNBrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779600;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UCruh3jicTYv8+YF4TUIqesgd1DRi0GyP+fOcsuR8kE=;
	b=LWFfcgT7fjB7HwUxy1AUGgqre+/WdDR/UZtc347NpAYnVdpR0XkNbFcper9Q2E694I+U
	 Lpb58aIvlh3IkO0SRVvduT8AmJv9LO5fxxIQhdcmsBPOOFe/C5ACGJzW5iLo4I4CLUEjC
	 KtFC/gkP3KVXPExdcFs0Iwc+WM7X9z5Y4Sq6IvPuZdPnDoXOuvmvDnvGxO4SxadQiDWKi
	 STFdo9hGL4jQZYGKZDXg1ssMtY3Fs27DgvJyedR3AbNciUDGhoVqMnbQ5QaoLR31RZKDx
	 TtQBwKr607sDPwskE6Ol48zfWuvaKg7G5Yud8Vt92L5KzcrYPrWlaLyN4q+pTmXpAjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W5sczTgJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 9BAD7606A31B;
	Wed,  4 Nov 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W5sczTgJ
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C786E1F00919;
	Wed,  4 Nov 2026 08:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793779600;
	bh=UCruh3jicTYv8+YF4TUIqesgd1DRi0GyP+fOcsuR8kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W5sczTgJgtx0gxJRAu52urkMSgsNXiz7kFvESLY+FtWXL3fcclgqijku0mlsa3NzK
	 sjVREQvi9ZpG4VFwS90xF9rPkwj+xnvjhjgnFhx8uFG2Zish8Smfn6vmRZ1kMHR0rf
	 +smtj6+lCIqHsuBwaBYfC+CYiUCPIlyZBrgWpCTqhgvSq/dU9JoIjjwj4oep85iGtP
	 BA2XDEAcJJkxiGm1Wx4rAHKmKtHix2d9WDmkRdG6opW1hqT7M2JgtGh0epP+O/ayK3
	 o7xk3XI7FVZco4yFNEYXcRdiyNY2yzXLeZE2EcGN2mAHZumNQWpr1a0Z8S9lFIUR/t
	 DRNV9EBnowCVw==
Date: Wed, 4 Nov 2026 09:06:31 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] ASoC: pcm3168a: don't request the reset GPIO as
 non-exclusive
Message-ID: <laiektucfxhzdf7ifiypwy6plkifriuovtarzz3qrwyd2yk7ks@3cskrh7fkwbf>
References: <20261103-pcm3168a-non-exclusive-gpios-v1-1-5cfdcf36c915@oss.qualcomm.com>
 <179375063580.2186205.641519776071903771.b4-review@b4>
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
In-Reply-To: <179375063580.2186205.641519776071903771.b4-review@b4>

On Wed, Nov 04, 2026 at 12:03:55AM +0000, Mark Brown wrote:
> > The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag is deprecated and users should
> > rely on the GPIO shared proxy. All users of this codec driver are ARM64
> > and this architecture now enables automatically shared GPIOs for
> > everyone. The driver now longer has to care about the sharing so drop
> > the flag.
> 
> sound/soc/intel/avs/boards/pcm3168a.c would beg to differ about this
> being arm64 only, though that only has one CODEC and shouldn't share the
> GPIO so it should be fine.
>

Right. Do you want me to resend with commit message amended?

Bart
