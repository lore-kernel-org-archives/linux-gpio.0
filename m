Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0A7314B6D
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 11:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248720; cv=none; b=sgqYDKK16iHcBnByLsJBwg5yzO2lRx0ptysJx7ODFeJo2qAxOJzPX2IA7sReJHrlAsNrFx8NZZs00sk0gjqZ5uqUcmP9KKIVWGN7YXNtCj8KCr2EQi7SS/sfrctVLY3UTgmGW6+VDNYgAvuygUxC70CANlYbc+fGEafU15tSch4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248720; c=relaxed/simple;
	bh=lcdubPlHtoDIjRt+QuMoY5OpbtDK10iEJXOyO3ON3QE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1rw5O6aOj1n12jc3RGRS8ltTKyyAecjPShPnGiVwXxgFYKkPVbeLhDlJVIqI6ds4+BdzdnXb5IOak3H0vE4OoXdmE+oob8IUZTkfpus4qbLQefuAqjuXjfMfPUX130MZ57gJBWSm+XdT76ZL28O3/HRApDrEasSPUOCjbqKhtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlTT6M8O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlTT6M8O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93AF61F0089B
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 11:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790248719;
	bh=OcTJOje/LLFPmLDozu5uW9vUgvKXaCAXc1Kv5yqHgEY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nlTT6M8OvbsHbEHGwTYPMuwjrN7Q/Uruo3nKeyD1kjnw4SClY67Dp9aFTeJ4z1hxb
	 kDGiJ0DbVctMGXpe89VW8pCl4mmHUPmqM9pGZNo8N2GRwuIyBH7H8P3esO2HZEPVDu
	 duXIbt4NTnpl4p4mwInYqx6wtPSYMjs/GfqRtis8XK4akoxk/wTg/f2WLZMd0ce0XI
	 YbhUKCnvUurRfKXCexB4IkY0evNBeglmH1lDicU05hz9gkvScA67QgjiOTSMoEhGwk
	 kk/4lzFJ4xqOhXmE6vSk0mnM1VwkTpEh+oDA4xYC/p8920CvrbTHnFPtEz5VIBlURF
	 /6zu7qAPx6OJA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b8997bc6e6so582036e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 04:18:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwh/rjDI6pUnhSVqwtuRQoB5iLDpxRX//DKSQSBo03M4I9zQg0sGY4nRb0MZ93QO19m4xc0YAxwstMs@vger.kernel.org
X-Gm-Message-State: AFuF++man8j4ajYgO1KkWaUlr3FYXiF1MRdczZHpjE8DdG5wbA/VGEQO
	Vq+cynSVopN8iL6TsA00F/H6WKTRWoJ/OLtNhNHvzE85S6BW07aEAe/U53q1iCWGHWACYk8Xwtp
	ffXW6+DrcwqeMlZWI6mAO75pkhBHNlSM=
X-Received: by 2002:a05:6512:378c:20b0:5b8:c15a:6ce3 with SMTP id
 2adb3069b0e04-5b8df1f2b2bmr492740e87.29.1790248718275; Thu, 24 Sep 2026
 04:18:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924065514.3678640-1-mehmet.fide@gmail.com>
In-Reply-To: <20260924065514.3678640-1-mehmet.fide@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 13:18:25 +0200
X-Gmail-Original-Message-ID: <CAD++jLmth4fewBX7FCEJooDuwHWtGv+XvvQas6Y5iStpTwAy9Q@mail.gmail.com>
X-Gm-Features: AclHuK95jx6rtMJfElg8F2gKY3_L62ve5zcmLjc1yqjBoxFNa2u9t59lm0nJBi8
Message-ID: <CAD++jLmth4fewBX7FCEJooDuwHWtGv+XvvQas6Y5iStpTwAy9Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: include linux/errno.h in consumer.h for ENOTSUPP
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Haibo Chen <haibo.chen@nxp.com>, 
	kernel test robot <lkp@intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 8:55=E2=80=AFAM Mehmet Fide <mehmet.fide@gmail.com>=
 wrote:

> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> The CONFIG_PINCTRL=3Dn stubs of pinctrl_gpio_get_config() and
> pinctrl_gpio_set_config() return -ENOTSUPP, but the header only pulls in
> linux/err.h, which provides asm/errno.h and not the kernel-internal
> ENOTSUPP from linux/errno.h. A translation unit that includes
> pinctrl/consumer.h before anything else fails to build:
>
>   include/linux/pinctrl/consumer.h:110:10: error: use of undeclared ident=
ifier 'ENOTSUPP'
>
> Include linux/errno.h explicitly.
>
> Fixes: b44aec87658e ("pinctrl: make the CONFIG_PINCTRL=3Dn gpio config st=
ubs return -ENOTSUPP")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609240855.U59akHDO-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202609241240.61Hz5rix-lkp@i=
ntel.com/
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Patch applied!

Yours,
Linus Walleij
