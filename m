Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B893C4562
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 09:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171653; cv=none; b=ZVX7reUsnLOrE6WMh93Ws+tUgVxnKYI4OwPQRCD+GoXm+0TY8f43J6IMTsXuwduohYBIgTr9FlmsOyg3+757Ot9joK6MOxU+dqVBUsIdEVi48Ix7pxdbW4wkO+wSOjYytKWsc+02e0wMKK4MNDoq2+tqE5x5u9/bUFNNLCXlA6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171653; c=relaxed/simple;
	bh=mOT5MTEYP2VQ8u5u+7KQbLwcVHJ/p6qpOrVUi3vksxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKPJbP4nM1Z59lyoKK/7Dry03THjioJJFgUsLkauYLMpARFU+uVPsHFISrz2OabwwYqGl46n8PFP4qlUx9cMWPzUsq4MZDHhCsQo+h9JfGFb7F+om62gDOSsCZt9BIgok2nZqcWmtmmrdohrzuCu+lvWMov3COminMizRaAgmac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRm3bw48; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRm3bw48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99EE1F008A3
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 09:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171651;
	bh=mOT5MTEYP2VQ8u5u+7KQbLwcVHJ/p6qpOrVUi3vksxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZRm3bw48nyZdy6jSQHF9fr7IpkIExOLwjSSAUD0RqvU72X7hPdp4ARaYgUGeJ9z/O
	 pfGQNFyasstinZCJiQUqNOPKKVxHuITz/1Oq4s6uEntiV5NINFLpplyvD9GBZq2c/Z
	 Dd+cuTwggmcFoEosPQe9Auv6vsL0YlMislROqRt0G2YowOCBDOMgheUFWgcBGxzlkM
	 ZYaFjc84wgnpNJ2rWTcbBr5G8+vWoHiVLONT/1c5w+wN7uHWERD3tYLBtxWcXPLRaI
	 O0Z3NE9oNM+rPDqMSLB+8KBc2pEMfT9NmBJripLGcG+U+yh15Ctc7NB9tFv9TQ9CKj
	 41CU6XgfL5adg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39661f81eacso7680681fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 02:54:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/R6T9ZqbGQcIqQhoA5lsy30a/+gNUpGKdK+YeJ56F4wQd/s5Rg6jWzWMfgOkmTgVh1ldiO0rKmL1b0@vger.kernel.org
X-Gm-Message-State: AOJu0YxrJmeGt/gCR3sK0kcIqcL3Jn5HnOvzbprr6Kil/Se0r4sfrtHL
	+ioec397U4mOdP2lE9PvAkr4dYn5WGTmVARnvr/KN/yClEH4YUEBXIOpAfImstvltb99rXjZ+DJ
	ThVzihqi7VGsXse9jUhVN1GmBAD8IJ9yQ5yjFOlj3Fw==
X-Received: by 2002:a05:651c:210f:b0:393:cbfb:6f1c with SMTP id
 38308e7fff4ca-3991a4754d2mr4407831fa.14.1781171650553; Thu, 11 Jun 2026
 02:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610153329.937833-1-v@baodeep.com>
In-Reply-To: <20260610153329.937833-1-v@baodeep.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 11 Jun 2026 11:53:58 +0200
X-Gmail-Original-Message-ID: <CAMRc=MercPNLWJd7JkGKQh85wwK+58KGqUgAKAYZhXvkC1Nu8g@mail.gmail.com>
X-Gm-Features: AVVi8CcwekiXclIHT_cfijbWQy4UuN-Z1t4Dxk2kC1U7yH7ZQNm0xbbc-JVeInw
Message-ID: <CAMRc=MercPNLWJd7JkGKQh85wwK+58KGqUgAKAYZhXvkC1Nu8g@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore
 meson non-sleeping
To: Viacheslav Bocharov <v@baodeep.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 5:41=E2=80=AFPM Viacheslav Bocharov <v@baodeep.com>=
 wrote:
>
> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
> the underlying chip's can_sleep, but under that lock it calls config and
> direction ops that reach sleeping pinctrl paths. On a controller with
> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
> runs from atomic context:
>

Why am I seeing three versions of this in my inbox? Which one should I revi=
ew?

Bartosz
