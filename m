Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181213;
	b=JxTGuQH3ow+nfNEviVyfQZMKRA3MJ1mlJqk+SCnIp2P5yrrzw1wYZ+Gdnk6eX5o8/om9
	 waYg7n4JuDhIRQoSYDom5PIweMbMgDtBVl5X+CzrcQF6sEY+dXX+OF3WvcHdA/KOCmEvl
	 XpQ597LUrWCxIS9lpVsMLYRN4e5VbG3p9JGwk8d+A/QVeJ1Z1S8dQrtvqpZO5LwGs9/Tq
	 CsOzF4mdIm4evyfc9VRNABvpC8wHdNG9mLzM3j/+Zf5CkKMijuMbIL7jQWiQQM5m8y8pO
	 0NYxSe6AWqwYVwHlAKrAQEomXoQEp/nnzXtpbB3cwR8ORCxRi8EityktuxidVoJ/rog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181213;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=LaKKgg7JsBllMMsQkIPVI3Ax0Bcgu+KbcncA6nhcHSA=;
	b=10Aozp6KjwmI6RtMq3xlRngdhPU4Ekp00NNKmq05tWpF6YTQor8dzYwFJDav+DYKQyUD
	 MHCvWHeFlFlK0dJNlP3+FNNlnUJoZ3bS9Az/Yhh3tXkpp+dhx2qbdlEpOMoALQIJI7jXg
	 yL/rDhYqUh7f6IjYfIjCK7O8Bhd8rUF+3Ps/GdCT6fPgb+6YNM0qJLe14csXw+WDCtPe/
	 xOzVxl60OG6w+x3sJViyqtuLk+cSJZnE0wC+280YkfiJuVPyBA96OMTkmFhqWTSXcobV5
	 0t00mGuDCdR+rmdn9laE/E+5MVA62yUtmmPtQM/FHy9A67wxA8jqfqt4g6K9hd40Mnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2907606A31D
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2907606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so603470e0c.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 02:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181212; x=1793786012;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LaKKgg7JsBllMMsQkIPVI3Ax0Bcgu+KbcncA6nhcHSA=;
        b=mohDS2swJVO4Zeoc4DyRBVsfxdzyni/SKqvan88ipKed2+m1gf0/skeSz62eEXNdv8
         xU6cDsbuCwpB8+8ZKmE5ObMCWIc4Rkitbz2JX/T0W57ycGtvo3EPDz2sjSMZPhLUHW+c
         5YmrBeiSniYktF1tmhvGCsK7dnToy0zk8kp3Qz4kArY93KhdH3E3F8ojiLsXsdHM3kGU
         sxNTNCpFchB0S2foEAy5sdS1ZcrxFIqx8hxAPGG5zRlRCwX08Nkun8psA3i9fHhLJm4L
         u20bJujONtYyMLNukIGhPDkLdNn0E9JJxtuaYbHg3eSqxsx+kr7oo06lmMHeq0bjLMli
         nySg==
X-Gm-Message-State: AFq9FYKd54EfFB0vgx3kP9KGBsqb68A0SV4w2Vbpy9D7ZsNFrTGy2lml
	2vTpcMX91H52t7ao/icr3hvsvVMQP8NLKGextI0Qkt2ym8B5/jElhYGbEZmctUhZ
X-Gm-Gg: AYBFou25Cti0z3q4JNpcq0l7zOrVdka4ynK4W8d+Ewx4QdCK9FcOsllBfwDBP9XgV1t
	Z9hBp5Pok1KGmNDyKNC3p53a9Dgq473ByzJR5N7Ns37E4sBgahvAmubbYLci1sqokU2XxoPocEe
	ImbWBP0STFNMfUm0pQhzLfcLdWwx3l0pSQopl6lhUvfH5WlbbUv28rvHr8dLzobxKwHN2jNDrei
	xza8fcuTe/zappxnni2ZN2GTo5wmva4FBXLvL+FYN7cHKpuJDzH1qgxIIbYCcvLFDfFdFABggch
	8kUTRePkC1Ggc68Us1J8BC+mITcE22aztqO3LJs1fJg2Fbs9+wqQ5u1Qqrxy+9DD2Pb5Q+TXwVk
	f4woYzNsK2b+bSnC0NnTlRV65g3o7GOQvp7E6g9oc1ka3hGjt3ffFAMuZuAfJmeihDAYtXkpW//
	6Gn5riTPBLPtaCQGHLUosnxgGg0posP8R0CIPl+FLZsl5APi7TAuRqYdWGuc9zFniCVP2/L4RkZ
	Mqcy2O9oumpSntjZjNWXDFb6ZoYQyOIxJR1+tMSTFCxEevPlJdugrgqhz5SbadE9+bW6P9t777x
	REQXW5JCqoPHwJ6l/9BaPX83VQU1A2GdQPYJlAFWYmkfuVk2KEdZKcOzSz3oiZoCr84=
X-Received: by 2002:a05:6122:490d:b0:5cd:575f:9396 with SMTP id 71dfb90a1353d-5ec4cbd9880mr823709e0c.12.1793181211965;
        Wed, 28 Oct 2026 02:53:31 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f92e3e3sm1220892e0c.9.2026.10.28.02.53.30
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:53:30 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7bec5112765so409604137.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 02:53:30 -0700 (PDT)
X-Received: by 2002:a05:6102:5244:b0:7cc:2fd1:7122 with SMTP id
 ada2fe7eead31-7d03a47e768mr803872137.18.1793181210633; Wed, 28 Oct 2026
 02:53:30 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
 <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Oct 2026 10:53:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU=ZkOsjG_FF-raMJWEUtj0VkD=9Gs0SsWKWLwyhG5H_A@mail.gmail.com>
X-Gm-Features: AclHuK9BGkRKGrsUq56mu96OMIK1DMZBGsGDXPyfwPmkMrcZVroZETBYHJfP3k4
Message-ID: <CAMuHMdU=ZkOsjG_FF-raMJWEUtj0VkD=9Gs0SsWKWLwyhG5H_A@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Wed, 28 Oct 2026 at 10:47, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Fri, 23 Oct 2026 19:50:39 +0200, Geert Uytterhoeven
> <geert+renesas@glider.be> said:
> > When a gpio device node has no gpio-ranges property,
> > pinctrl_gpio_request() returns -EPROBE_DEFER and its GPIOs are unusable.
> >
> > Restore the ability to use GPIOs before pin control support is added by
> > using the gpiolib helpers instead, which cater for this use case.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This sound like a fix? Can you add the Fixes tag? Is this patch independent

Sort of, but no upstream system needs it, so I don't think it is worth
adding a Fixes tag.
ISTR we used to have GPIO nodes without gpio-ranges on other R-Car
platforms before, when pin control was not yet available, but DTS
history doesn't provide any evidence of that...

> from the rest?

Yes, it can be applied independently.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
