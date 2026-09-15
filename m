Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A676B37BE75;
	Tue, 15 Sep 2026 19:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501636; cv=none; b=SBGrgWE++q1JsDwG6ydSgQYwY62YW7XacsGqbdwE0EtFYZtvv3hEtpQ/xM8d/nwvzeWChcHGmuKnnRFmb13dJa/4fSYeBMDiraDlIPLb0oz8TWgTo8z/iLO5LxDJ9avAt2mos7JrcjbantK1w1t+uXrO+zl3QHG5i9PHs15ZwLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501636; c=relaxed/simple;
	bh=DfwC43mUkPmZCs7laMfW9pYAaNG70D84VCtJSosN45o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V4kvys4ZaupEguB29Pm2InVnZrnyrLLB+5z0Fl8hScYagsfZSdjlx1XgnkO2SNhTJ158Ec5ej/3LtBmoeEMU/+OYSgbOEwEta+4D5+4mNt2VC5cFBTFNa8EU4Z0Ij05hL4SFZloIRtNLkM1U5+DZHg87YMke9k59h1R0uHVLFjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=iDhphLrC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="iDhphLrC"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8082E408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789501634; bh=+bP+X/lBNq12iSmakr3fcrSnyJPKmdPoUi7a9XWI0aQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iDhphLrCgI5UwhTIUL1AdbASPtcNtrdtP7Jdo+VCpNGp1TGiyErg5uxDAlk5Hixsp
	 7gXDGUEbgc9McvHN9nAPy6nU8Pyr75hTR/pNA2ItMX+6wQLsMrM55/DuvUaAC1WSp7
	 xxQzL9g3Rx6TCZ+E127gmwlQV7huM+njdXf+m32s5Twf3R7tw6yjRIJgN+IPYEfJTt
	 ELmEJAuUx58orgBmWqeOpPxNwQ/ppGB9JMlasIYAcY8jb2DXqCaVPHi+jlV0h05eYz
	 YuMaor+C+epQDFwTd8FM5ymjMwaXkNRJhZr5PfL3RNe/9qGalh8RWEUEEfe9nDW5Ba
	 IGm5DbvAvhjUQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8082E408B4;
	Tue, 15 Sep 2026 19:47:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?Iv=C3=A1n?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>, Bartosz
 Golaszewski
 <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>, Jason Wang
 <jasowangio@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Iv=C3=A1n?=
 Ezequiel Rodriguez <ivanrwcm25@gmail.com>
Subject: Re: [PATCH 0/7] docs/abi: align userspace documentation with
 implementation
In-Reply-To: <20260831143125.151360-1-ivanrwcm25@gmail.com>
References: <20260831143125.151360-1-ivanrwcm25@gmail.com>
Date: Tue, 15 Sep 2026 13:47:13 -0600
Message-ID: <87mrti70vy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Iv=C3=A1n Ezequiel Rodriguez <ivanrwcm25@gmail.com> writes:

> Documentation and ABI alignment fixes found on v7.3-rc1 by comparing
> userspace-api docs, kernel-doc blocks, and uapi headers against the
> current implementation.
>
> Patches 1-6 are documentation only. Patch 7 makes GPIO v2 return
> -EOPNOTSUPP when EVENT_CLOCK_HTE is requested but no HTE provider is
> available, matching the documented behaviour.
>
> No functional ABI changes are intended beyond the GPIO errno correction.
>
> Iv=C3=A1n Ezequiel Rodriguez (7):
>   docs: futex2: fix documented errno names for futex_waitv
>   docs: landlock: fix ENOMSG condition in create_ruleset kernel-doc
>   docs: gpio: note lineinfo padding must be zero filled
>   docs: dma-buf-heaps: fix CMA heap name typo
>   docs: vduse: align documentation with current uapi and driver
>   docs: ioctl: fix stale NVMe registry entry and note N conflict

I have applied the series...

>   gpio: cdev: return EOPNOTSUPP when HTE is unavailable

...minus this patch.

>  Documentation/userspace-api/dma-buf-heaps.rst |  2 +-
>  Documentation/userspace-api/futex2.rst        |  4 +--
>  .../userspace-api/ioctl/ioctl-number.rst      |  5 +--
>  Documentation/userspace-api/vduse.rst         | 33 ++++++++++++-------
>  drivers/gpio/gpiolib-cdev.c                   |  2 ++
>  include/uapi/linux/gpio.h                     |  2 +-
>  security/landlock/syscalls.c                  |  2 +-
>  7 files changed, 31 insertions(+), 19 deletions(-)

I do have a comment on patch 5 that I'll send separately, though.

Did you write these yourself, or was there an LLM involved?  In the
latter case, these patches really needed Assisted-by tags as well.

Thanks,

jon
