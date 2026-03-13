Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9C3332EB1
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410756; cv=none; b=Nh5iMScZY3O1+oT5Dvppl7Q7kRl8mv3XbKliwWeGbCd5xZ/E0KN/KpV0DtfocwHG7JTeObLN0fZvlehrbwh3l6kxPRArBgRjWzUQr54RqACC0IuVpye0kiwNTu0qeUNfRyRmPbE+VNp53C/cCAWfxWfKjuB5YP/98aFfycUJebE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410756; c=relaxed/simple;
	bh=BqKrd9MGPnv+gQCWHNNUS2UMAZc7FKqpV0JE5XjCDw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mT3bboIAm65RUQCxXDSsnH3++Nwp9/+SLOydN/wd2Hs0ePtkDK4bcHeRJUtYYClOb/AaKl7QmrGyVoj2eBt4lNoXxo1aQx1ADKpc2sFKT6VtWI+rHG/TWvtL9J6dVP/kkfkhj0otfv9mo8aQV2mzhzgneMWPWWD9rRWxyXQSJGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYIitWVQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYIitWVQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32F6C4AF09
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 14:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773410755;
	bh=BqKrd9MGPnv+gQCWHNNUS2UMAZc7FKqpV0JE5XjCDw0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qYIitWVQe5Q8nbcwDKbjNsZkXGT+7nCsErw4C849brpLvV8NNnIi4iGTcwMejdUiU
	 g5LfhhBULDlg4EJyTt5OdIqMouWPDK0aX5fbWY4sSMVw54yQzc7UzmGns1WWLGeP0Z
	 lALgqlmr8D2p2UCll8qLKnAZpBIfvyaEI79vKdG8Vn5quqdkj2M38V5Ge0u1SQmk67
	 WEvWzHg5etGWAyURjSkeQIOppO7nEKZeN1i/BaeCiEBp1JHjSpNPHO4sHO+TcJkqyh
	 c8fwycoVPMMPgL/p/pgX34J1p2EE+xKyY909/Zz4h8OFvIm8BLFfO3pibLGD1JXx8y
	 xtoar1IqmGAZg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a4234f91dso19141501fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:05:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3vMNzzqkyWLfZnbTrG48bsQn8KR5suUcKtQw+GhLofF6RQwGmjuAPOaqlotxt8HAE10e5xYg8ZVCM@vger.kernel.org
X-Gm-Message-State: AOJu0YzCrAcRzh4HV+DNeIbTw+A8tFf/QP48yf1NXhmvVKkZLLLBSa+A
	gphGb7Q7Wjge3+WyjrRn0BL0Glf0hYbj4iLc2u5/G30WTOIk6q4DXg9wjdH/XJf4aDs0LQdF4ze
	maIqfwwhloXD9QILFxMXtb+NTP3eMbNvwNMNGJ4yLjw==
X-Received: by 2002:a05:651c:2115:b0:37f:c5ca:a6d4 with SMTP id
 38308e7fff4ca-38a89666433mr11202931fa.6.1773410754347; Fri, 13 Mar 2026
 07:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech> <20260312-k1-gpio-set-config-v1-2-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-2-8c3541da16b1@pigmoral.tech>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Mar 2026 15:05:41 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdvvqboLa5_EF3Y3Eh7GSu=_eMpJed8mCLQR7upf2oV6Q@mail.gmail.com>
X-Gm-Features: AaiRm51DxUd0y3wL7awnbPV8W9Fol2pS5cjKcnSSZQnGox51VBH0_3jXriBoQSI
Message-ID: <CAMRc=MdvvqboLa5_EF3Y3Eh7GSu=_eMpJed8mCLQR7upf2oV6Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: spacemit-k1: Add set_config callback support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 9:43=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Assign gpiochip_generic_config() to the set_config() callback to support
> pin configuration through the GPIO subsystem. This allows users to
> configure GPIO pin attributes like pull-up/down when specifying a GPIO
> line in the Device Tree.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/gpio/gpio-spacemit-k1.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit=
-k1.c
> index dbd2e81094b9..5fe813b7f9bb 100644
> --- a/drivers/gpio/gpio-spacemit-k1.c
> +++ b/drivers/gpio/gpio-spacemit-k1.c
> @@ -228,6 +228,7 @@ static int spacemit_gpio_add_bank(struct spacemit_gpi=
o *sg,
>         gc->label               =3D dev_name(dev);
>         gc->request             =3D gpiochip_generic_request;
>         gc->free                =3D gpiochip_generic_free;
> +       gc->set_config          =3D gpiochip_generic_config;
>         gc->ngpio               =3D SPACEMIT_NR_GPIOS_PER_BANK;
>         gc->base                =3D -1;
>         gc->of_gpio_n_cells     =3D 3;
>
> --
> 2.53.0
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Linus, please take it through the pinctrl tree.

Bart
