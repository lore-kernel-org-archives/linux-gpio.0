Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9363CAE95
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 21:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185307; cv=none; b=PzwSf2rMGwDRXHI3d8S4FMmyO806bjqr60ozeirrYZpgpOBHg7lj0xST7hMLElJ66PyXeNjfwr/da5pD4PCl2qyyunwvHIrHJp9yJjSfq5r+T/fFcBDJzvUzsx2dMtz6/lu3sFmyyvA658jnxoptOGN23UYIQD9+Nt3rEppPZUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185307; c=relaxed/simple;
	bh=XnDcigIQogj9VPzhFmb1u5EwChzTVE1u40a9G7Kkp3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbslKqsRYwvmSwY660s/IkFmCR9iDW/qCaw9zzte8yoLdjRTz0OqRHEMqYu08ligAoLJzrDRr84Tuapa5eTcqGw3dC9VQUBCBvre4NSk8xX1OeDhLSlD8uWMeBUWNUJZMY1zyI49SOvNxkX6FVSOAiphwC5XZKz37qtsle/L8yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEyj8AwU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEyj8AwU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F354D1F000CE
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 21:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792185306;
	bh=XnDcigIQogj9VPzhFmb1u5EwChzTVE1u40a9G7Kkp3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DEyj8AwUZx9W+ruO9fCTzQQVAEVdYP9QsWREem5xVGFsl478eGF7zIIsLVcybEdzv
	 78c082ksBDoNj+d+X88ZyqHVUthFzmQ/Yq2z9ZtvFBpGaWjQrXZw2Wu8RwZKf6K96z
	 BysU4xjv+CTcMmW6I7keumfztAVNeFDmBdOsiLp/6pL7ASw5aQoYIbSLhRtQmZ3seU
	 Tr5JnIetHjJQAqOfAe1oWtGKv0r+UefNaP2/hoKW4Qs0HWcoMBn1xR3woBGrZyAm+P
	 r7XrEFXpLQjV8rNkTYSj7zBW2cuZH8AF83UejHVxOcn0QEjUa5TfVwFLkBLhPcvGx0
	 AaGC+GGMaDDMw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a9e87ba7f2so1993841fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:15:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByWGCiTGHy0+a9pa6SFklTI6YCFwbLfFtxnnb9pvKJL4pOLNdZrSVY8JY+EewxXLmQLyj6Og2u++RJc@vger.kernel.org
X-Gm-Message-State: AFq9FYK4Ni+nZ38Hu7PgLFUozDlp8dWWX0QbABqHsH/jbM/NUsQ7K7aa
	TPrS2MGpKXBgiXHlLhwFrL/yGYDshSdJmn1fDrlMzDpMbrA3AUfco44nQaLjKzlWOAHKcmk0max
	r3Xp3CMI40E9Y/KZYs4z14xOxBE5n+mU=
X-Received: by 2002:a05:651c:31cf:b0:39c:624d:82b9 with SMTP id
 38308e7fff4ca-3ab29286cbdmr2067561fa.4.1792185304697; Fri, 16 Oct 2026
 14:15:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-6-aambrozewicz@nvidia.com> <CAD++jLkru2AL2_7ieOdbYrePAhNSFaa3wwEzCagiPsALgG2GwQ@mail.gmail.com>
 <20261016081917.1958681-4-aambrozewicz@nvidia.com>
In-Reply-To: <20261016081917.1958681-4-aambrozewicz@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 23:14:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLkQd70V+wQhCaKES8LQqWoU+dmt=Dr0PgbA81xHh+hppw@mail.gmail.com>
X-Gm-Features: AclHuK-u1MiFTw786aZCKlVc09dcjgjhKNYlnZODKOuP7oo7rrcG4a5O7l15i0c
Message-ID: <CAD++jLkQd70V+wQhCaKES8LQqWoU+dmt=Dr0PgbA81xHh+hppw@mail.gmail.com>
Subject: Re: [PATCH 06/11] gpio: Add NVIDIA LSTP GPIO driver
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Donald Shannon <donalds@nvidia.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org, llvm@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 10:19=E2=80=AFAM Adrian Ambrozewicz
<aambrozewicz@nvidia.com> wrote:

> > It seems some pins are only input and some are only output.
> >
> > Have you considered using serialized register access over
> > regmap and use regmap-gpio with fixed direction bitmaps?
>
> Yes, the device configuration fixes each pin's direction. I looked at
> gpio-regmap: a regmap bus with one register per pin would cover get,
> set and the fixed directions. Two parts don't fit well, though.
> gpio-regmap has no get_multiple/set_multiple, while the device takes
> several pins in one request,

So just add it (get/set_multiple) to gpio-regmap.c?

There is a nice generic implementation of get/set_multiple in
drivers/gpio/gpio-mmio.c to draw on for inspiration.

It will certainly make everyone happier.

> What I would take from it is reading the directions once at probe into
> bitmaps, instead of asking the device on every call. Would that be
> acceptable, or would you still prefer gpio-regmap despite the lost
> batching?

I don't quite get it, but I prefer gpio-regmap with an extended
gpio-regmap.

I guess it could be challenging, but I'm here to challenge
people. ;) If it looks very tricky ask for help.

Yours,
Linus Walleij
