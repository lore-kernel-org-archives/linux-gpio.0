Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4B5331EB5
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025850; cv=none; b=hTXshCkKrD3VcodKLTOI8r2Dj1dQk+XxgUTn4Mh+HEHEcwwQ3jzBsnAT0O1obYDuAeryZxUoyRl5c3rERWE/P7SLd0iLCRoKWPhhzAJngaVh9Y9/Tvk3+TCgmdLl9J9jAmkJ3HBo5lynC9LHWGeRL3nsgg0P79kXEhTS8MD9HDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025850; c=relaxed/simple;
	bh=xP2NWy6tbMB5SQ4bv/wOShCOnnsGV1kVmtph8qJeEjg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VrkeqHAlziSqx8cjBM0lz1v6M1J2ZOM9nffPlc/ZbTTlRRr200XE9UXws7i8qW+4dGE2vzAKoqhpIbDibYbu9rSDV/j5WfR0ZRVoyIJLuYXYzYt5VYzC4+1VTYI1pA4p8bUItGWja1PRWAXIG0jdQjXayu4mn08w3cv98nfYxEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOxjbx5r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOxjbx5r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B7F1F0089E
	for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 07:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789025840;
	bh=xP2NWy6tbMB5SQ4bv/wOShCOnnsGV1kVmtph8qJeEjg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=gOxjbx5rkscrUmIIoQZ5sdurI3JtdoD++TKr/GwaNemFyDtu+piXghxJCmT297MYE
	 CAXD7sW7Deshz/xk0+cSxEpMrlv4Hb6elU94bx3b+lCSwEDthMezYkZmXAHo6cGd8f
	 M5K2GLgX0mDsZRLtpG/YaJnVnmxmJuT2FvUoQn4AiLFWk7xLNXTaKbPSSvNLw35mln
	 Ekfkw+QSslM9Zr+dGz1JJc3/DciJImTzPZplcReyxgCiTrDO44kyCjHOovleEUC9ze
	 gGq0zjt6Ob9Roj/EyTtA/a+4minmSAzyyTA1XAHOfInbTaTWwW6aBLf3a/p6gtaf7x
	 WEfvZpNu/NeDQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f18010so1101045e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Sep 2026 00:37:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxph/4InPLVz0aXYj9WoCpH3eVMJY+ambRxGh/17ZqOH4VRZms+vkn4+cRwn15HjVKJlPpSr+a48369@vger.kernel.org
X-Gm-Message-State: AFuF++mKCqUPZW+eRpBORekL9UuTWTTFHa2EqHB0iVyT2DZB1j2FckGH
	ExGKAy/XIH4igot7VQcL0SaSP0JMjEqHTPlsx2LcMJZUE8o75je/QLZF5IrRYdEyL1G54veUCQY
	+nXXROMrevj+TmTAtCS6PrbpIzQ1UZPSz9cYgI77fOA==
X-Received: by 2002:a05:6512:a84:b0:5b6:183b:d202 with SMTP id
 2adb3069b0e04-5b8981085afmr1156990e87.41.1789025838560; Thu, 10 Sep 2026
 00:37:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:37:17 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:37:17 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260906-add-rust-gpio-consumer-v1-3-24d192f93760@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com> <20260906-add-rust-gpio-consumer-v1-3-24d192f93760@gmail.com>
Date: Thu, 10 Sep 2026 00:37:17 -0700
X-Gmail-Original-Message-ID: <CAMRc=Meei7Z1f1n0M_Hy1LdxG=NVhkFeEiT3=p5QVpw6BTv3EA@mail.gmail.com>
X-Gm-Features: AcwNN1WblH_4DnqwSoSbaoD4YNI5OuN7Vd8NeXv9VOpbiqzrQs585HeeDA3MWMs
Message-ID: <CAMRc=Meei7Z1f1n0M_Hy1LdxG=NVhkFeEiT3=p5QVpw6BTv3EA@mail.gmail.com>
Subject: Re: [PATCH 3/3] sample: rust: Add GPIO consumer sample driver
To: Kohei Ito <koheiito.dev@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Sep 2026 10:45:51 +0200, Kohei Ito <koheiito.dev@gmail.com> said:
> Add a sample driver to demonstrate the use of the Rust GPIO APIs.
>
> Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
> ---

I don't like samples as they rarely get built or tested. We seem to already
have kunit support for rust, wouldn't it make more sense to implement a kunit
module for rust GPIO abstractions? If we don't have provider abstractions, you
should be able to reuse gpio-sim as the GPIO controller for testing just by
instantiating simulated GPIO devices.

Bartosz
