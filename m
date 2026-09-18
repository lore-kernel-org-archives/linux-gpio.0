Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141A74D598C
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 17:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750985; cv=none; b=pkBpKHRMvSVJMy6mvdolrJT7TudfUc6CHRR34F9a3nOweRsCjSd9OqlC29imH9HL+4dlphL0b5eiXof3+NShD7yWgVy2zvaUa97cKj0R9DVOlb9HKIS8AhZO3noiOfO2hbHrb3+e5MNBCvCq+b5mCIvNQ6bdUcQwpy5t+/UHWAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750985; c=relaxed/simple;
	bh=17uQ+yO5/vz4UcZzSqXQag7gHUU7Rc7fH5GxComNvNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H9t/nRDcw4KpCO63oj3Fu6vgRdvxADqsCb+dmLRICFZL25uJQaamklhInx8vkuEFfPAbeIRIbpLcqJOe1Lsc/qmlPtvq0B/LDMj3vEEAUcKTOc+5NHhYsWpOuhl+pdMdSvZ3tsxOl5AfQJl2DJf/oVVqz6s+v1c5KesamcW1zig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czJiOy6Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czJiOy6Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B611F000FF
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 17:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789750983;
	bh=+Hx8TUHfipaWnDtJX6/JgWHh5O9BJzp4K+XyTrG+P9Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=czJiOy6ZfFKkXJ+Al7FVaMQ9OMsMHNbSZloSX8p7ZqzFVscwYak5kBbj3VslbNfMS
	 eScIp4paKxYMgp71+IzlqdmXnKXrvXxg7RFI8nnhfpE3TMIAyYhwCwoq8wKbjWHay2
	 sYWvXG6Jw2lmebf9+9OyWdwIoLrlZLuJIAwB8WOyoXjXp4rBKnxDIuvOXS6UR48XZA
	 2T4+7fbdqbKnpz8KyleK2ajUuL0b5GwEEODcmI7IaI8iCRUQYL+evcbgpfTp7dxPbF
	 rm9KLoaDWwRZcjnd69T63pycc/oLJxOxOU2xn4DsPtqopEBlIEJXoYIoOZCJOzRgjy
	 3lu1iDUDdRSmg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so1120957e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 10:03:03 -0700 (PDT)
X-Gm-Message-State: AFuF++lBGRi0eyqqYr3DsZUwyRo5jwqBhd4yTtoyhN3rX3tuOI8pSwlN
	Mbpr9swbMKKYzgmXkutll8rESVuVZQWswa/iXqPO8xlxkkHg/ujjYYlMq3RYY1vUcykZWQ1IAPh
	rwc3NcDUmDMxzKGUa1w+XiOVqaafxRZk=
X-Received: by 2002:a05:6512:2355:b0:5b7:6735:260f with SMTP id
 2adb3069b0e04-5b8c19705bdmr976732e87.67.1789750982552; Fri, 18 Sep 2026
 10:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789723325.git.geert+renesas@glider.be>
In-Reply-To: <cover.1789723325.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 19:02:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLkUY4eBrqp9HmG2hhe_1_HSQvXRTR5jg1-m9DsKoMsjHg@mail.gmail.com>
X-Gm-Features: AcwNN1XCRyP9KGiuX7L_eN92AfFe_LIbTq2nAFk7kjN9IFCJYIBvQF62EjEeGas
Message-ID: <CAD++jLkUY4eBrqp9HmG2hhe_1_HSQvXRTR5jg1-m9DsKoMsjHg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v7.4
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 11:38=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b9=
35:
>
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v7.4-tag1
>
> for you to fetch changes up to 0cd4a7b3a4883970df3ae8814d9aabdecf65a81e:
>
>   pinctrl: renesas: rzt2h: Add a helper for reading PFC (2026-09-15 10:49=
:07 +0200)

Pulled in, thanks!

Yours,
Linus Walleij
