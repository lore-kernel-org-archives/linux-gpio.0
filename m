Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69EA281530
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358473; cv=none; b=QcmWeWJ35jR1yPv010IJCU/PRH50tOA0r1amGQpzNbpTtL0S3Aa0vuHFDAbyjypVYLmvxR2RcPXXK89ETHuKsQkvkJPW00A65LeB6TWH2RTQ6ityK/67rraJfbNkJ8KM3PLBlazD1JDZnH2eDdWV6dSKNvNRncDAO5kj1vcgCxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358473; c=relaxed/simple;
	bh=oFcnGuBq33VZHYWwlXcbkOpU/LXD7rpkVongg/rmAx0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsZvgtWV/Gymf1OfT8ZRPsg/O9emRAlRRSVyoUtSQ+YbI28dwwP7LiFAuVsCJgS3aj5qGLPohpw5sEEJeQbPbCkIUmAW6x59ATGdz/fpzL4ROkPT5yYwpy4AoX4UxZqJh9flZaxRby7M87gjCckSRb6KwIE6yMxRDAS/tFs7Ixg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRNzJJsm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRNzJJsm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C661F00AC4
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786358472;
	bh=NG3aaVhxZAPeHVTauAhmcNfV3zFvKpvRAQotg+CHcbE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=kRNzJJsma2f97fPKxIw9THtugwkVJC5SbyaxQY0ntSNMPw+vtcBF5Et5G2vFVeusR
	 nJta+TIaLNVHjQeJBbOpFNE4lMhd6byX5SJLDIBnlKZ8KFciv4weTfi8z3KCwrFeN6
	 1FixsoMvsTbtowHiqL6bFpksqrQgqLo1gZKFHHPbQ7kNzLvp3/EY5+PBchYD2Hnxgq
	 0H4JSGx5mJHZI0UQizixh/SwWdjvCQyif/vZlX3fD544oD7jY5RFEvJao1Wh5lDvYx
	 Y/DR7leoSO02LA7iT7fgc3TyHlPkJko3TfsQJB5cKxN1+cVkyr21PPU/Ba2uwo2zLi
	 JI9ma0TdXC18w==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b3119957f0so1137697e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 03:41:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqS92+CWpZvidPRq4r3SHGDJgRpHO+7AiUku0ljaV09gkSfp5Hwv6hh213WVRwufkX/oqmfB6BHzd92@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf51L0ripBGBM3sboTVO9Pqg2VLv4+b0b/kprdD8i+khPN/x9g
	0KzjB2IAGGtnddLufEje0hfQwmgtUauA7rj2i2ZSnxIDaBgmBBKbLtv7DYpRcOoSRLu+HEGUIh7
	rwODjBw6wsXfbv2TFc9t7e7Ss0XquBdwyu1J/LyJaGw==
X-Received: by 2002:a05:6512:3e24:b0:5b1:58d6:4542 with SMTP id
 2adb3069b0e04-5b2f4b8be36mr5314027e87.14.1786358471070; Mon, 10 Aug 2026
 03:41:11 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 05:41:07 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 05:41:07 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <anUDvrtSPm_wuBWK@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-gpio-pinctrl-output-set-val-v2-1-cad55d025636@oss.qualcomm.com>
 <178515087648.51358.11576417960376426909.b4-ty@oss.qualcomm.com> <anUDvrtSPm_wuBWK@ashevche-desk.local>
Date: Mon, 10 Aug 2026 05:41:07 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeLUhxzbQuVONj4dESPD98Sx-+yx7jjuNpovLaPazyj=g@mail.gmail.com>
X-Gm-Features: AUfX_mzOPZwjkhrMgTQaJFxgLh6pwIk15EUQNtk8B27cGVK5T3GYUsmactXIzH4
Message-ID: <CAMRc=MeLUhxzbQuVONj4dESPD98Sx-+yx7jjuNpovLaPazyj=g@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: gpio-by-pinctrl: Apply initial value in
 direction output wrapper
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Alex Tran <alex.tran@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>, 
	AKASHI Takahiro <takahiro.akashi@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Aug 2026 23:59:26 +0200, Andy Shevchenko
<andriy.shevchenko@intel.com> said:
> On Mon, Jul 27, 2026 at 01:14:40PM +0200, Bartosz Golaszewski wrote:
>> On Fri, 24 Jul 2026 09:42:28 -0700, Alex Tran wrote:
>> > After successfully configuring gpio pin as output, set the
>> > requested initial output value via the existing gpio set
>> > wrapper, so that the pin is not left at its previous level.
>>
>> Applied, thanks!
>>
>> [1/1] gpio: gpio-by-pinctrl: Apply initial value in direction output wrapper
>>       https://git.kernel.org/brgl/c/67ff4bf723c8bd1f1b10450fa3e8f55762418104
>
> Thanks, but see my comment.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

Sorry, I was on vacation. Alex: can you please look into Andy's comment?

Thanks,
Bartosz
