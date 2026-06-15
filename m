Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BDE3F9A0B
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527042; cv=none; b=XNEccqg/uA2LabYjF0kfuyrITwPFibt0a3FCUCl8v0+3RRy8v8A+wVhyuHz5+XteGjqFeXHikc6+29CjFh9zqa6lI498vRYLi48P8L1o1rDFYYxLzc0XH9sqzdafynRRC7XaNEvdusk77BetXO9dZNiLjKHnYFMlD3GWXq5BwCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527042; c=relaxed/simple;
	bh=w6IEMYaJXAlgY0NGn2puWrCCEVhtWr/1911M4jjTr54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IzP/Ym/dBWbrInVi9lJv4f2ZB8KauazYS1NReq/9LCB5WtEpRafDgKoVZcd6x+kaZvOtfX8qva7Npiku2iEVagk3e1vw3s6nCqvOCNUzG4OAeZ7rOMzq5OJ9UNCdZQP9Do5HUOzGoNfys927zR+rwTn5cfPfVlpVTQwmSWbgREM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fh/d/p8I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fh/d/p8I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3967F1F00A3A
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781527039;
	bh=w6IEMYaJXAlgY0NGn2puWrCCEVhtWr/1911M4jjTr54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Fh/d/p8I/gRkB5ybWOYNNtCuzXrggKwlqiv7iOa8/BTYGAljRYxt3eOlnimsXmSs0
	 a5Bpo9NQ+hLAEgjVN3ou268RwP3wD/mnIVcES8RsBOW8ZLmGqcAlrNdd6M1f0W5A/G
	 +C7bh5KWsPJ4TZl/71R4kL+z+Ao1iwGHFqGlLmT8qd5QWqvY2VMUNkAS18sII2cpvU
	 ZY0Ke0NPhYZOPuSlJOYLCD9DZudtiUr7UgmbTKJKtvz/hfwebwEAC8xbqbFR4yOjn+
	 f9cxP7+q38+zrL3EWBcW6smSdZecWUTdse67o5Yl5pBVjeHs4wXpoE1QhNuZ5yPva3
	 OHQH1qmNMMW0g==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ad2ac0a0a9so2194157e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:37:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8IAQ8JmtFgMQg0k0KMQebwLY3upQHlonG3hwAWWMYeA7GSv3hOPfHbFAD0CylsHguTHstts6iDSXpn@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj8zpMvlota3M9DDprB6QAdyb6Pa4tWDmJDI/hkztyEzHgsuDw
	FhRc7b/AOrpJhNKY32jEfGnPfSpZVjnxBVRlJFv6EljqO8wd3vmZvrPQI7w4lgCFtxz4jL/ztpB
	O6Ktk8C1cgEg1M/JvWpDj+zSp3Y+JdHk=
X-Received: by 2002:a05:6512:601:10b0:5aa:7083:51bc with SMTP id
 2adb3069b0e04-5ad30dcdc4emr2007816e87.43.1781527037995; Mon, 15 Jun 2026
 05:37:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612215216.1887485-1-robh@kernel.org> <CAD++jLkEm5Pk2SOULp4GePwPCPO=xe_4pFvxOhZ8VQadhaYv+Q@mail.gmail.com>
In-Reply-To: <CAD++jLkEm5Pk2SOULp4GePwPCPO=xe_4pFvxOhZ8VQadhaYv+Q@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 15 Jun 2026 14:37:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLk=_JM+yKzoyLTgzQ7DJYVzPVeYu+f+oaw7SQ+U-xF9JQ@mail.gmail.com>
X-Gm-Features: AVVi8CeFKMxxKFrk6n8G_pCnBU8N6xr172qbJmStA5D_9dFfQZBbCRjLOTjTCHw
Message-ID: <CAD++jLk=_JM+yKzoyLTgzQ7DJYVzPVeYu+f+oaw7SQ+U-xF9JQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: pisosr: Read "ngpios" as u32
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 12:23=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
> On Fri, Jun 12, 2026 at 11:52=E2=80=AFPM Rob Herring (Arm) <robh@kernel.o=
rg> wrote:
>
> > The generic "ngpios" property is encoded as a normal uint32 cell. The
> > pisosr driver stores it in the gpio_chip field, but reading it with a
> > u16 helper does not match the DT property encoding.
> >
> > Read "ngpios" as u32 and keep the existing assignment to the chip
> > field.
> >
> > Assisted-by: Codex:gpt-5-5
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Patch applied.

Oh no I don't. That's GPIO. Bartosz will look into it, I dropped it
from my tree.

Yours,
Linus Walleij
