Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400D23C2BA2
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740408; cv=none; b=Waw0khcFmndZ8CSImXNmYIHVIU/+jU0rSB+Zo+uU9ib2fhnHZQrM3KmN25aCiyYaST+rWpZJ7N5KxBLSSaEcbzTXUKu7rVIm2+zIG0+0Q+bsXw8177CujZJZjNCN0kfY1nn1eEb5rFImqwmQvbcsVKCyp9Y+O5abEDnn8FD7208=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740408; c=relaxed/simple;
	bh=Bea/G/IoZ8oDVGLLVv27q2qxqh/uOyX8BpocUOUUI28=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=putPgtT/bVt/UKc/bj79Pxu+pNSAhWaR6VE2LrUuYmgqxE6d4Xqcu9TDEgFgMmMwQZ0t6Bo/WMiQpznxfaOrOOJhsyP0qUf/tIV6LlvhH4hjq97SNbH8ApX9CIrn3Qt2Ll23vrcgPdsxjyMZYigLj4xLOTr5knL344iXTsf0o4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+t1Y4iH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+t1Y4iH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE81C1F00A3A
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787740406;
	bh=J84kiW9iX5mOxMVYKrjk297JoG/oOAwt36k47y73SM0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=l+t1Y4iHO9CxMo9RrV3DgRh6SDeClWzPDzjkwNnLzmR1DjfK1lbfDx0YuMnV9s85n
	 jYm1Ld06qsw0UPYjyAcW5e0WTA7MPI+WjDuGD6SQ6p9qCtaOYTT1oKA+iAE5SJy4jd
	 soi6UmspTi9Pj5Ze53u2ggic9SJw4Z1o5UfZ7DhMCqWEorEDiKcHzMkXhUndx5Za8e
	 iOVYqCY1hwmK8p2PTfiWvx/ukvo45GSfaXWa2MYWhqxoiyFZ8R57Gf1z9s5vWh4bM6
	 /sIRarw6Q7GeBEJ5pRQKfsqMbr5tRuQybO4i9pP5KQbCf1V9jdEsdOLs5NuKdqdzpX
	 PtTBR0mt9LcJA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b4a0e5aefeso852201e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 03:33:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RosRSERf8+qawWY1YfVnz3fLdtMrVs5i0hF8tAVLYreqqdAzUajPB2hm2Kft1agWjFoMLqN9kBV3rGt@vger.kernel.org
X-Gm-Message-State: AFuF++nrmdqbu7Btqtp8ypCYC0htDS1CrvVlJmQW99LJwWvk91o2d/4o
	Mie6tk/eIqtEYE/NTDCzXzBBGNAjmIEvBq56seSvkc2WIcKMuzEnPmy61Iy1E6Ch6ldN713NKeP
	o/osenP9V/WagdRSyHhsEBkDe8u7UZVGI6W5uSm7tzQ==
X-Received: by 2002:ac2:5695:0:b0:5b0:1760:facb with SMTP id
 2adb3069b0e04-5b4a90b961cmr1822631e87.21.1787740405522; Wed, 26 Aug 2026
 03:33:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 05:33:23 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 05:33:23 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
Date: Wed, 26 Aug 2026 05:33:23 -0500
X-Gmail-Original-Message-ID: <CAMRc=MejNn8NJYe6ByKig8cZHL8pq98waNfVozY9SteZYYJmHw@mail.gmail.com>
X-Gm-Features: AcwNN1Vqwk4Q0RhFsCFlkk4UPtd-2YY_gEyhjjPeI7BFhdbdnQTIsNX2gbIeCC0
Message-ID: <CAMRc=MejNn8NJYe6ByKig8cZHL8pq98waNfVozY9SteZYYJmHw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] gpio: Unify the GPIO controller node check
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026 09:42:31 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> There are handful of drivers perform the same check in different variations
> over and over with a potential to make subtle mistakes. Unify the check by
> providing a new helper and convert a few users as an example.
>
> Andy Shevchenko (4):
>   gpio: Split fwnode_is_gpiochip() helper
>   gpio: shared: Replace open coded fwnode_is_gpiochip()
>   pinctrl: ma35: Replace open coded fwnode_is_gpiochip()
>   pinctrl: pistachio: Replace open coded fwnode_is_gpiochip()
>
>  drivers/gpio/gpiolib-shared.c          | 6 ++----
>  drivers/pinctrl/nuvoton/pinctrl-ma35.c | 4 ++--
>  drivers/pinctrl/pinctrl-pistachio.c    | 2 +-
>  include/linux/gpio/driver.h            | 7 ++++++-
>  4 files changed, 11 insertions(+), 8 deletions(-)
>
> --
> 2.50.1
>
>

I like it. With an Ack from Linus, I can take the series through the GPIO tree.

Bart
