Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760EC3A0B3B
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 08:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584164; cv=none; b=PSSO9+1BI76T3fjng8Snq0l8dtsBBhbqH7oFXxdJf58MuRnbrAo3ONhDPH3HNhnAp8EwjpUkYtpFsF/v+rICtkdkYNFruJ8Nn50xmSIG5johTF97mzquG1us6diYECfQd/sltHkV6gGAzedjmANcR8al7ywZ9nfChAXVIabbqOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584164; c=relaxed/simple;
	bh=40uSKZxzTsP/abeQJAQ2ZfI2elUt9yomdEcYr6QRnGw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SW3ZOlB5wNlRfxndEIUcWkqN4zAr1VgcdWT9TxbcOd7uK+nrGpwjMqcvWf7/81LlU2MoSe9S575pDhvKj7XxgRWBFm3M8wQgybx09Lgq+nC1aEGl71px8zKFT9CiUA667WNR/mArLFayfOl7LF3TSNYeyQ6ny8K8qy5xFgCTP6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpsP7Skb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpsP7Skb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E3C1F00ACF
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 08:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783584162;
	bh=40uSKZxzTsP/abeQJAQ2ZfI2elUt9yomdEcYr6QRnGw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=gpsP7SkbwHWFw/FwqpEFARf8UiGEm0gKUrgQemzKEjeHY0iEbMmZDEtASpSZqcIvK
	 wT7VnV1pClKiQ8q6+32QFzPUcrm4inNE0E/4L7pFF+ItVKUbLeR8D6e1viCFhH/FH/
	 2PxrjPwYF8btBHU0GAs4YyOkeI9kmawgT4ks70acju1QpFKs2z0VnpuFzmw3xyTHRa
	 hSyAOfHBwcJIfGXqes71YltD2i+sfttEwX9UIqmMTjc4yy3L1s+pUQekFMtwlLggcP
	 lysOYkvWWk077gNYK/UiWAUvf/04oWiB/FyfFOEwPZ/D6ToJIp19wdBVO+iquKI4s+
	 pJwIDPVLd9f1w==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c7050a48fso5327611fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 01:02:42 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxw9VuTSXgpsNvp5vMISWAscqIfLOzbxc58hTRHLWiLX+JGsXI6
	GVQeXl0LOizVnKtNwrh9Tweezbjw/HbQwulzRnOAThpbuw7ryuN1StpsIHZXcuLEFpm0jW5vgLq
	dOaospO6Trb1pIgC+X/0sLMfJ32pxIQ2y7IUPjAirag==
X-Received: by 2002:a05:6512:1417:b0:5ae:b861:ac27 with SMTP id
 2adb3069b0e04-5b01147ae74mr1441708e87.18.1783584160896; Thu, 09 Jul 2026
 01:02:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 04:02:39 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 04:02:39 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260709045116.2304246-1-mark.tomlinson@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709045116.2304246-1-mark.tomlinson@alliedtelesis.co.nz>
Date: Thu, 9 Jul 2026 04:02:39 -0400
X-Gmail-Original-Message-ID: <CAMRc=MewrdyKNGrFSjJksphdA9_2sNb8cZk39Doionfoj_nS+w@mail.gmail.com>
X-Gm-Features: AVVi8CeNk0PxdnG2tC1ocjzjgysi2rL_eYaPnfyOmR1fxSCOy93U7-hk8Cm0LQE
Message-ID: <CAMRc=MewrdyKNGrFSjJksphdA9_2sNb8cZk39Doionfoj_nS+w@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pca953x: fix pca953x_irq_bus_sync_unlock regmap lock
To: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, brgl@kernel.org, ian.ray@gehealthcare.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jul 2026 06:51:16 +0200, Mark Tomlinson
<mark.tomlinson@alliedtelesis.co.nz> said:
> Locking is disabled in the regmap config as this driver uses its own
> lock. This means that all calls to regmap functions (read or write) must
> hold the i2c_lock. The function pca953x_irq_bus_sync_unlock() did not do
> this, and it was therefore possible that multiple threads could cause an
> incorrect register to be read/written.
>
> A previous patch partly fixed this, but only protected the write to the
> interrupt mask register, and not the read from the direction register.
>
> Fixes: bfc6444b57dc ("gpio: pca953x: fix pca953x_irq_bus_sync_unlock race")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
> ---

Please always include the entire changelog for the series, I don't know what
changed since v1 (no need to resend, just explain here).

Preferably use b4 for managing patch series.

Bart
