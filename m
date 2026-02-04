Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E15A1AAE17
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 00:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770164648; cv=none; b=gFV2TgVLHPEVSHzELm4cmnwJkkHjmj1ZrF8NsSBjQWbE79fsPKcJQ1Mj1YUWJ8LcZ6uzQvHYO6Re22a4hdeCR5TSzwsbgVtnLTh6/0W+YGhDAhqeH5i8zZP9NZ8OXtggPwM3TUg0/qOUIIFOlz3jfPlLv1jp/P0YoBpkKPYZ6ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770164648; c=relaxed/simple;
	bh=2F+zIb/5zD4egLNhzOFMUm4MM0Zjnd7at1gQ+Nt2kw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eM7buwKjOHmfdOmya1NCopA+xbZWCoZRM9PbShtCyzLCC+HNpQhPQY264oYbvn9hmlJkIHcXAFoosO0R+V/ZkAsg6Jh6JuHuA3zeJx12VH4VRTkstuhHoRu5hloUlg6//kARZVcTiQcqUA3hksGucasjUcWcQ4OGytZMTLFDdhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SW1wf0yp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SW1wf0yp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0667BC2BC86
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 00:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770164648;
	bh=2F+zIb/5zD4egLNhzOFMUm4MM0Zjnd7at1gQ+Nt2kw8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SW1wf0ypZCnWqc6gJQKBBrBpYOM1WpQ2sQOjsFV2/t5JcPyy3pB4LOhY8pckJZgnl
	 QtpiDsDL8J96hv0ckTQqjDSeJSuHASokrI7GdSSZ1Thtu/eo0d8TyHr6fSBwsiCZj4
	 2g7aIipEjY80vImVqSU2nPr/uH/znDvAh14U5AqYD1aPyV+2ZeWCcpi/Pi6Tt8Y64c
	 SqQZsG/Fw90PBVILopR+2I/7VtqwDWzkgSLd68PMggVOgPdwBbncHJGSvFyy3VKX9k
	 +WuZzjuo+Kfu1GGAC5vGbKK8H0cNxDPNbRqsGI8GW62r8Syr0eby59TZWam3p8z7df
	 82GGPLMlC/UBg==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79088484065so58688647b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 16:24:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5CiP9i22Av4qXnZnj2zk8qqcRKR2S9xcyUshjlnPRtkYKQL0MN7kh8uWUuIVOfkskegwuFytxt4tr@vger.kernel.org
X-Gm-Message-State: AOJu0YwpqSHVO2cUZa+lEbaEgM/gYIvYAaD3iku3YUfxrdeAb4Tofq1l
	l9fT+9wtYOr7pDCVgb/Z+eYEMNsWrzIrFRkeD3Rb+3jhaJ3Quz3/sm0MSbkDup3++wywje0+bMj
	3JdrmpiL4x/byHfvgXkctNZKaHhZD7Ww=
X-Received: by 2002:a05:690c:3502:b0:794:e9a3:b132 with SMTP id
 00721157ae682-794fe630e3dmr27551617b3.4.1770164647352; Tue, 03 Feb 2026
 16:24:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203234529.1081148-1-florian.fainelli@broadcom.com> <20260203234529.1081148-2-florian.fainelli@broadcom.com>
In-Reply-To: <20260203234529.1081148-2-florian.fainelli@broadcom.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Feb 2026 01:23:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLkH-HpUXhQfgvy9XzQY6NH6Sr0x5CFFEg82_zBz-X-amg@mail.gmail.com>
X-Gm-Features: AZwV_QhqXV-UUuEDRHCcMqOroIMeRyKz2VdLiO4Wc7_Cwhe-J4DhdP8YjQW0qcw
Message-ID: <CAD++jLkH-HpUXhQfgvy9XzQY6NH6Sr0x5CFFEg82_zBz-X-amg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] gpio: brcmstb: Utilize irqd_to_hwirq(d) instead of d->hwirq
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 12:45=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> Consistently use irqd_to_hwirq(d) which is the recommended helper to
> fetch the hardware IRQ number from an irq_data structure. While at it,
> update the brcmstb_gpio_set_imask() function signature to use the proper
> type for the "hwirq" argument rather than "unsigned int".
>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
