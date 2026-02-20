Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03631D555
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 07:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771573924; cv=none; b=O5AP/30uz1cSOEaRYqbpQrUeJgOpGqfjqjks15KjM3HfGaaRLS4eb7rXkut/Ja6IWUUUoEfOBgCb8ad91/Ea3qqfu0bB5GYpNSPPNRk4dJGqd/gMJOUHMQqLMo1RIcFBWCcWNTH6Ad+D3g6O8X97hg6Sqs3gt541esj3xnZLCYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771573924; c=relaxed/simple;
	bh=QTanqqZ9R/o4VV9Z0PWcMC9w6NpgsBW34fGWnDXCvuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huwNE4pS7gkNC26f35b4sk6uqvs7+qRsjLM0GVe7Xdfwn/TodmhI8eojTbyCQajTbFRJl/j3LTHb+jCsTYwjQu2KQOpB4KgpgzUZ90K3vPYFH2F/zfDeXbOmM0Cq5U6uT05kJwsAvI0ZC339Uf+LCEbGkHhd4mg5CTWMVdxjgMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCmHBiWE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCmHBiWE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4976C19425
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 07:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771573924;
	bh=QTanqqZ9R/o4VV9Z0PWcMC9w6NpgsBW34fGWnDXCvuU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WCmHBiWEFZfHkzDUtWIS1eIQ7ZEHXKHUOt7dvZn3SWVbz4EBtaFvTQFy1X9BMvZth
	 lXYDf4F5tYIrXC5HYqRI0jIAICl91aJ8gQrTIqB7RIO1YABA18hIZUKMKcHmLXHuYV
	 WUWFISwfrd9j8qoJUz5Hg+NTEboadrUpfCQZuog4FYzs1ZtpLyGh5K7vYk1E6E0nCP
	 oR6u5jTFLe2BzCo+NHF+5i/4xlEMyrJjUsrCEUKV1e2uiRjZcf2DuLu/8vY2d/G83X
	 LqeefsG+Wcw1XORcbvHh/LpJbBnJhVrw8v0EtQUO9mpIE1zP2ZyuJp7o/qoVDlS7XO
	 9Ic7/UzCM0c1A==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7946a1f2430so16544057b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 23:52:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEmAHrgRKwekc1iybjhB+RFptFj2fU1gDGqcKxfrJbDsyVqmFRUy2xbv433LzSISpUh8GDWshZ8RAr@vger.kernel.org
X-Gm-Message-State: AOJu0YxZvelltZoDeRkdddWkviVtuZd5gXP/Tr+2UI9mEZz4klCzXbQX
	PgaFkAGIWx+EM0jck1Pa/vymXi0jdhp5XFmPQYdAm9A7ZZrNfjz9I2TsZEzYIkz/gQJhzokiOI4
	njkwaotzjW5NzsiomGQ2lPKtd+ax1FGo=
X-Received: by 2002:a05:690c:dd4:b0:798:1ac:8a6e with SMTP id
 00721157ae682-79801ac8ef3mr46855417b3.5.1771573923814; Thu, 19 Feb 2026
 23:52:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213092958.864411-1-tzungbi@kernel.org> <20260213092958.864411-6-tzungbi@kernel.org>
In-Reply-To: <20260213092958.864411-6-tzungbi@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 08:51:53 +0100
X-Gmail-Original-Message-ID: <CAD++jL=vskCOH0nEr8zLV3Lsvs=D21w_dAH75MX73ne1uEHVXg@mail.gmail.com>
X-Gm-Features: AaiRm538oemFdXlRpuoNSZX2wWqwZzZmgmeNXenBk6UM2SaN1LwEPbpvlKpdqXc
Message-ID: <CAD++jL=vskCOH0nEr8zLV3Lsvs=D21w_dAH75MX73ne1uEHVXg@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] gpio: cdev: Don't check struct gpio_chip in gpio_chrdev_open()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, chrome-platform@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 10:31=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:

> It's harmless even if: chrdev_open() and cdev_device_del() run at the
> same time, and gpio_chrdev_open() gets called after the underlying GPIO
> chip has gone.  The subsequent file operations check the availability
> of struct gpio_chip anyway.
>
> Don't check struct gpio_chip in gpio_chrdev_open().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
