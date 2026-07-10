Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD59336CE14
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 19:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712322; cv=none; b=DRqJJmyuWTq49JNjVT6HV/uxWlUVHGHVYKqqFYCoAj6pMDSvOeX+n38LkU5aG4uox5U13W43rjIM90/3012qI5fP1AVnO/u0SN3UA9AcYZJHvlF4QJh/MDknaMA7PLCuJDFCu830iMwgQ9v74ZikdB2+TpYYR3ARs0Y0wskFDxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712322; c=relaxed/simple;
	bh=PK3OXc1H14OWKazN5OGqKhG+hdbviyrpbFFT63ItbgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DvGI8fY+uH4DENRSSxDHepT2kAK6osXSyWYKexznxVGjdORUXxt3//AKP5/sWDAPaZd4pPTOoKcTm+k1ns3W2OZfIYkMuNk7IOVjYVfYd8M5tTHTL8yG4lrZpzi6mc2v9MDwHbN+Zpdk0YUq4HyBazXxA1NZ7FDDl+/fzr1ESkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIgheFiP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIgheFiP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FAD71F00AC4
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 19:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783712321;
	bh=PK3OXc1H14OWKazN5OGqKhG+hdbviyrpbFFT63ItbgY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QIgheFiPTZ0jeKtsFeLeRO5pKMNePjyFqNSusCt44gytV53pQ4Gt6x5kuoKHloWx+
	 8NZ5h6pSOLuROwbpcTSDDnZv5a5iP4hGu91Mai+XUsfNjBGrObtKO7KmCt/sZEg2VH
	 Ilwtf28T7ez2SVDZXD04dsGzmtkXLuIGbZVmaF38gWvczyzul46mL5dJEKlYLTOpkt
	 V8qKUCAKHCWrQ3tJ85ZJSJopJCkiaCQUWFZlY1RDl3+RMVnqeLsQcR9APnLxv5cS3h
	 GG9XnQsEIl4VHcy3e2+P8DOPKgNQO1SrGqHrQWX8U3zI29JQg1tEDRDUrZzDQoZOca
	 ZYpf63APTsRmQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb5829fd5so1182038e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 12:38:41 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz+K1nSzD1tr4g62o+rlSoAfPV0tCsqQINCF6z+e2iQswIP1jZj
	0tmEmQv6fI1aZPwaehDIzDPnELsXqESJq6TeFLZvFPEOqfKUnbSnkbq4quvUaRGs6bZJ6G4nraT
	LKEhSE5g+fBRmWUSWUbYaaNNnT3Mif/w=
X-Received: by 2002:a05:6512:3345:b0:5b0:1959:d877 with SMTP id
 2adb3069b0e04-5b023698daemr89415e87.41.1783712320286; Fri, 10 Jul 2026
 12:38:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708230638.1041426-1-rosenp@gmail.com>
In-Reply-To: <20260708230638.1041426-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 21:38:27 +0200
X-Gmail-Original-Message-ID: <CAD++jL=U6OiOT53hUZx5Jz39G2hQYH-tWM2=QRq04CUDFPhCzg@mail.gmail.com>
X-Gm-Features: AUfX_mx7ofynkFfSrl7tpioIbgISvVFET-po_eHJqYCO5hs8THHRv2X3PZe32cU
Message-ID: <CAD++jL=U6OiOT53hUZx5Jz39G2hQYH-tWM2=QRq04CUDFPhCzg@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: fix devres LIFO ordering between GPIO chip
 and IRQ domain
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Arnd Bergmann <arnd@arndb.de>, 
	Jason Cooper <jason@lakedaemon.net>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 1:06=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrote=
:

> During driver removal, devres cleans up in LIFO order. The IRQ domain
> was created and its devm cleanup action registered after
> devm_gpiochip_add_data(), so the domain was destroyed before the GPIO
> chip was deregistered. If gpiod_to_irq() is called on a pin during
> this window, mvebu_gpio_to_irq() passes the freed mvchip->domain to
> irq_create_mapping().
>
> Fix by moving the IRQ domain creation, devm cleanup action registration,
> generic chip allocation, and chip type setup before
> devm_gpiochip_add_data(). This ensures the GPIO chip is torn down
> first (preventing new IRQ mappings), then the IRQ domain is removed,
> and finally mvchip is freed.
>
> Assisted-by: opencode:big-pickle
> Fixes: fefe7b092345 ("gpio: introduce gpio-mvebu driver for Marvell SoCs"=
)
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Excellent work on this!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
