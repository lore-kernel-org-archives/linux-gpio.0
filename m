Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7FD2343BE
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 16:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876290; cv=none; b=jHIOx104+wgLGZfxDLW3TqsmZK8vxjRV0Ej9oqaalnPrb/LGH3fwMRSMy7rAzEPjgy2QEdptlXPa/173yR2Xqdwf+7mn/ZMA6RQx4cpyus7VnQM0fOeA84nluHBPZJBBrOATfyDYmz79DNTuy5n9x47EXXaJkr5fph/1meXcDTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876290; c=relaxed/simple;
	bh=2s/7L0aPyf/89BX1iJMBkGm5frIX0C12fcQwhhWDmII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWmqJMsTub5bJWwFnwnJPKuIr+Du/wPPhouxs25/40QMv7VhvNhqmH7y+kHiLaqzqQS88DAoIyOzYW1cyLZTIusJNJzuUDJC5DlRbvhGRKlyWoWNhdJ0r4Kl0qHmh8lb2SkntqLe21k0KjWDM3cNTI4Sr3E3lsGxXx9KApfsfck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjW3aVj6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjW3aVj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E19C2BCAF
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 16:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776876289;
	bh=2s/7L0aPyf/89BX1iJMBkGm5frIX0C12fcQwhhWDmII=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hjW3aVj64zDQ6LHHNBwwQ9LnVhFKs/THLJCAHBFffqZYZkgzRJN/iGMUuTppTpeh1
	 uA3NC8PbV4w7uffwlegHl8L7nl2pmcCaJv1zK9hRGAiWxE5WadJQzflzMnRpwo6ebz
	 ZERgYPIMG6DJU+QkC8scFX4EVU0Vupe/MM2qh67dJWDAyuhGpvLo8keBJPPQyT1LX/
	 E4ZwnOA2TNWyhn6aPFv7KleoLQBCmQyoXBv43E31dqn0es4aNqTah3hzDmHLYNnEYw
	 q5B+HeSARu6kYNgziBws20f1kxh+L+ReHBmg1FuOYXGmfJPSGxSm4ajau/g34EMgRu
	 uG3hGV986wV7g==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a337552604so5326790e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 09:44:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9A152v8cOMZ5YryrJUr3xAMsTcbPSKxvVGRX6rohsxYx51ONN1h2MMrUpenYEOL13f6bcNKqGRsBZQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzpeO6IxBYaXiPMs+C/Yk/NFtVxCEUKza8sG6DCgXFw1eQgq5TS
	TEcu8xVkXwo3hQTxWckZPX2q45FrWpDOtFr8BCvvwAmDH20bIz7I1V0C9AKsrf9ZsLA2BrwmaXl
	5ZnTRz2aTiDmF6fdDUSR/6Qx2tNQ9ank=
X-Received: by 2002:a05:6512:3b95:b0:5a4:1e74:992c with SMTP id
 2adb3069b0e04-5a41e749a62mr6343343e87.0.1776876288622; Wed, 22 Apr 2026
 09:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 22 Apr 2026 18:44:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLmFudox4+zThr5bx4aAadrpdkYrNn84eORhbU_t6gxZvw@mail.gmail.com>
X-Gm-Features: AQROBzD6As8vQDuHvN3Mzne6qf0E0PKq1XNBJt-_LWP7ew_HjspeC-_L7COH-WA
Message-ID: <CAD++jLmFudox4+zThr5bx4aAadrpdkYrNn84eORhbU_t6gxZvw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] gpio: add PMIO support to gpio-mmio
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: brgl@kernel.org, wbg@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 12:24=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:

> This series is an RFC for adding port-mapped I/O (PMIO) support to
> gpio-mmio.
>
> This v2 comes with all suggestions done by Linux Walleij in the
> initial review [1].

That name! ;)

> For keeping compatibility with gpio_generic_chip, a new _config struct
> was added instead of extending gpio_generic_chip_config. Using such new
> _config struct, called gpio_generic_chip_port_config, requires a new API
> function gpio_generic_chip_port_init() to access to that new structure.
>
> Besides, structure gpio_chip_reg has been transformed to union. It reflec=
ts
> better that MMIO and PMIO chips will only use one of them, saving memory
> as well.
>
> I'm still sending this as RFC but I don't know if I should send this as a
> regular PATCH series.

I think we will usually only merge infrastructure if there is also a
consumer/user of it going in at the same time so these patches will
need to be prepended to a driver patch.

Yours,
Linus Walleij
