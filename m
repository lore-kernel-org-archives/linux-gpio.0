Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F6E415F1D
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 06:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786430225; cv=none; b=K50my/9sd/N4S/MPIEKAiwMeFvmMA6IFxfLQ3JyjvqmftN0edG0NUIA4thVNG3mloPjoT2iivX32UIfmY9h2cBU6ltfoKNTB5vFP4chqUxqH+ZUF2PzcF7OZsVYXM71R9QfMY62bRmud8Hvw9sw/nYFVXmR1AIn8b6X4a3BkDzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786430225; c=relaxed/simple;
	bh=3OS8tzv+PZCNZ2UtF/U7gfDiCpmQfUSYIhnS8fHDnVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bkv6SIT5+KPBRoCOiuj0XuVwpAtJi0ln1NN2vPYcyEuyEZ0trytDfklpkcjXtyAB1CGdOoD6yyBNGRkUz1b4n8PldRklwsIdA90DCGOdDmwX1HAP2H14/pyF/o1H8rPEGfr2+KNh3fWjA/LXRfo0XwLhdKXFBDizf5tyWyOZFBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGFhcr2h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGFhcr2h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A071F00AC4
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 06:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786430203;
	bh=AJs7Mqn1DKclziey9G0u0ka9dydbjaT+kuaSUmUGGuE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AGFhcr2hgpBoiO6GsvdSKDYX7SGFmd+9Jdxq5nzRKs3f/zj91QeF8nkFBErbloNmH
	 4csc+V3CVh+whspRDUNT+XT2w7fN8Jcs9JXbzNF1j3d3MzXIReElROyOcHJhSUZJIe
	 kx8qzp5wZQTfCiuHAchJUFgY2JkkEbMobreHaL7GiKMGTUwN9GK7mhvdvXrEMT83ej
	 /yeAvUK6iZBvrIU/wMifVCB0ApMsXSwjztpEiMmhtmjmznRGWBuIcGG1bKl0hGjHiS
	 LoQxIikXzIl3zjunLJhdwfgPBghUIlK5y+BlFWfjZCioHMPn6qolNxGFXM8gELBuK9
	 reIUw/pJrVN5g==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so2504958e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 23:36:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqFqcOmZnj82WzkeSDnak9Svpjs5Ix4yxbx9NulWrqcGB7WW2BWnET4Qi7GZNQmuMAa6d0Q5mEOmVhz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1OpkEy4EJeggvMnb85r2AzzDiefhgy1+LMOtecaDwPVNZUAj0
	aDfu2Xk7fpfrp5XiM8fGxoWP+45l9sa6MwXhO1EvyAal30yzNYjH4Mk/HVezqO3Y374Zks7bPs8
	lrjUJUfkBH1sS4qljjWBO5TeozQt13j8=
X-Received: by 2002:a05:6512:3d25:b0:5ae:c454:3746 with SMTP id
 2adb3069b0e04-5b4486390d3mr181868e87.43.1786430202005; Mon, 10 Aug 2026
 23:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810130635.1166626-1-mkmkl@google.com> <20260810130635.1166626-3-mkmkl@google.com>
In-Reply-To: <20260810130635.1166626-3-mkmkl@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 11 Aug 2026 08:36:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLkByVL4bPkCTEZie6ymnoFVvyk9TRi8Lw4AGZpOzaPL6Q@mail.gmail.com>
X-Gm-Features: AUfX_mwslnI_IdnyE5gK_5h55o7AQQdCwBewm4zawXM8cwgIKANR8MWC9zklOJA
Message-ID: <CAD++jLkByVL4bPkCTEZie6ymnoFVvyk9TRi8Lw4AGZpOzaPL6Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] tty: serial: 8250_dw: Keep init pinctrl state
 until first open
To: =?UTF-8?B?TWljaGHFgiBLYXJkYcWb?= <mkmkl@google.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Douglas Anderson <dianders@chromium.org>, Vic Huang <vich@google.com>, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

thanks for your patch!

On Mon, Aug 10, 2026 at 3:06=E2=80=AFPM Micha=C5=82 Karda=C5=9B <mkmkl@goog=
le.com> wrote:

> @@ -77,6 +78,7 @@ struct dw8250_data {
>         unsigned int            skip_autocfg:1;
>         unsigned int            uart_16550_compatible:1;
>         unsigned int            in_idle:1;
> +       unsigned int            in_init_state:1;

Side comment: why are these not bool?

> +       if (!state) {
>                 pm_runtime_get_sync(port->dev);
> +               if (d->in_init_state) {
> +                       d->in_init_state =3D false;
> +                       pinctrl_pm_select_default_state(port->dev);
> +               }
> +       }

As noticed in 0/2 don't use the default state for this, create and
use a custom but optional "online" state. It needs to be optional
so current users keep working without it.

Yours,
Linus Walleij
