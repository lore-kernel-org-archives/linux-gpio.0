Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAE12BD5B9
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928018; cv=none; b=Lq5XKC2yTnvf+z7TF96859UfqRbA7wdROJ75rCRe7QRBtxuTSwWlIzvSDd88pEsytrE0u0S+cz5MmKrCFhNPooomDxLSf6nzk0xFfuk58+vFw0h3xNpCNP3Opckd7rVWgYi30unxOuZ8ALUlGhdzC5yBCaZSWBVzkVgQ/gUJpUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928018; c=relaxed/simple;
	bh=UxGTi/5Xx5PdGJt9NL35Mt/XtcJEWxm0Lx4wi1HnrhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJJkL0N8/zRzpZKtxAffclAGRfK/xPBLdVjYO55eMS7I7/5RwAFLV1ceGMHYatIMWTP7Lq8oWb/UinISPk/vjOJGKLgofsammJDwa4iFZ7nbhoLbM3TcJP7j9gBND38SuHvO6Gv5rfEQCzLWoJPMANotF1VrzkAQnqbgBTv0N34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RraZJbN8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RraZJbN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7559C4AF09
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 13:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773928017;
	bh=UxGTi/5Xx5PdGJt9NL35Mt/XtcJEWxm0Lx4wi1HnrhQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RraZJbN88Ks8DyjKajp0O1uqXjUvV/1IDNGLb5SwiZjsh57xT+v9LdvPXqjsBBTke
	 WV7OzqWRBzHg1fsqtrR8VgugefS/JgUbuNA0UjhYi53rTxGjVS8SuYMrdkuHzZ8iE7
	 X+U9fyOCQTyqFPTP49q13kJD5q4R+3Icp+EN/MuqlbFePiI/hyA/4QuZ6gI6Ts3nei
	 2fqve9j9ehtupFKkbXrPR1kjMs6LV+u7Y4REpKWFEjJTlIz3mgzaUSijGh1DH4Asxe
	 jcdKIh30YBkWcMMdGFY94apubaArpC+e/+9GTSipO9+d7XzDNCAbhnGHcLyShhgWM2
	 QN4Xl//0s7T9A==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-798374d0f44so29772397b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 06:46:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7IdNBL2o0Fo4Z8/LonThhzwMrc6sq2mxVIEJPbZ1ZYKl4nKRWckBYwwUdzg7WNcwUT/pUA61g/iXx@vger.kernel.org
X-Gm-Message-State: AOJu0YxylvatpRhvozJZmF3BPnXG66m5xVRNK89VJcrDiWgcoz+lShgl
	Ptu3FZ9dtbape9YsH+ZAiKRTinDCfSZ1ZDmmX4viFkSDyiFMIh4qZ9E9VkuoTdKtmXg+0x914Yf
	pRvkp37rdVVikIAe0KtBbdJ/qPCf/QfY=
X-Received: by 2002:a05:690c:c247:b0:794:87bf:76ef with SMTP id
 00721157ae682-79a81a7fa9fmr36687377b3.7.1773928017113; Thu, 19 Mar 2026
 06:46:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
In-Reply-To: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 14:46:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLnVNT=_rrykAx82RE8SeBsBBdN6gFMcDUYwYj0KOpF0Ug@mail.gmail.com>
X-Gm-Features: AaiRm516XK6SGOveArWTQJh95O__heoY_pg3ef3DdbKvndSSpwMl-PSC2QgvGk8
Message-ID: <CAD++jLnVNT=_rrykAx82RE8SeBsBBdN6gFMcDUYwYj0KOpF0Ug@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 9:10=E2=80=AFAM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:

> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
>
> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> is in unitialized state.
>
> Solution is to set pinmux to GPIO INPUT in
> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> earlier.
>
> Tested on Orange Pi Zero 3.
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>

Should this have a Fixes: tag and should it be applied as an urgent fix?

Tag for stable?

Also: is there consensus with Andre that this is the way to proceed?

Yours,
Linus Walleij
