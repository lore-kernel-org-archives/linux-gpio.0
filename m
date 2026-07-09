Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37313E7BB0
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 08:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584375; cv=none; b=RLitYCrIlMXSP1GrzqEY4vwgppFiN27ZXr3bKMr39CCvgE9gXJ8z6FP9SO5h245eDo2iyrmH9ZeZpFrb3T6F8SGtk6dCWlZUTlTDM5nDpUO98NM/4hAF/97JCkKfQkNXCJXHgmA0N2/Rtz8Ljf5cgtat0qYnLBb9k4geQwJNAX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584375; c=relaxed/simple;
	bh=B/GKMfUl1D2Pcz9U8jKrHeF3E3FB7NMUQ5y/bYRoBls=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fk5bBOkspRasmxPoqH8zB5fGfAYMEP+GtWzN0MLgbeqtxO/4+A6LeuKTy4flzYSvlXFy7UzKpfC/UwGk6ZxK/WZtfvYGjtFxtKuZ2ryMbWz7gDUMD9FggoZEkMn9UgCEwZXZmt2hEpjE9eBe9S9SIYQLmElVrX8tsK3/daQ1NGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJ4x88uY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJ4x88uY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980A61F000E9
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 08:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783584373;
	bh=UPz0jtdnlbTKDZGdwNrHQlHX1Lan4fg2FsK1/an89gY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JJ4x88uYv4g3fa9q64dL+ZADCcFkQm4XyhFSBfhJqD3+QFIIWXLrKLHd25p78wh1M
	 XLLmPmIOsK9ipt37HnmO0i6X0nSndckPhnuFPWXO6Zd6DDydt6o2T6HYgm/zEpAtX1
	 PYC+lDWr+WUk+b3kCc76qDUMliKY8YGF3J6KM4oOILot4O7p8bXod6UB6gzVj/LM49
	 oSq7ph+byO6oV3MaSr33uR8C4swZKaPqyVJT8bf2VzCV9xjDlzmrZqEwwZIn71KAaC
	 vPHgGUXaWvBxJttkMMrIuMsTv9m5WFaurXbbk7HG5i1QgFHAFe11Y6NBVlwLMIzcgZ
	 17aCsXLZNzHGw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39957d210f4so6061091fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 01:06:13 -0700 (PDT)
X-Gm-Message-State: AOJu0YxUL2okME8oZWfZevw4c9qYV1LSaGCfVMZGlxVUYI2tk5OiWBPY
	uNCRPqrUv3lAGSupNJZB+7yWGx+MJwWviGVlUIDo5KhT1IWqI3kHGCpdTkEd4wPs8I2lfb54WW+
	sKaWnidaZdcP8BCu7JremoIziO2CxEs7+JtBcXMaaLQ==
X-Received: by 2002:a2e:be9a:0:b0:39c:6200:9871 with SMTP id
 38308e7fff4ca-39c797e96bfmr14315221fa.2.1783584372382; Thu, 09 Jul 2026
 01:06:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:06:11 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:06:11 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAKxU2N_aMvgOwEnmGbCB33k=KOKnk8=-RPK_aJCwV7tn3GcHKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707230651.1138887-1-rosenp@gmail.com> <d5a86921-db3d-458e-b826-b0bac370832e@lunn.ch>
 <CAKxU2N_aMvgOwEnmGbCB33k=KOKnk8=-RPK_aJCwV7tn3GcHKw@mail.gmail.com>
Date: Thu, 9 Jul 2026 01:06:11 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeOzqqv4+zRdhEXo8x=8G+zuz7n_5wLTpKHVth7_kzjHw@mail.gmail.com>
X-Gm-Features: AVVi8Cele0aKT0KeI48Vu9Sy_Q-Mb67gBH1NQreUhX07jqW98afIHdTyGFiWCsA
Message-ID: <CAMRc=MeOzqqv4+zRdhEXo8x=8G+zuz7n_5wLTpKHVth7_kzjHw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: use devm_clk_get_optional_enabled()
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Ralph Sennhauser <ralph.sennhauser@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	open list <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jul 2026 21:27:09 +0200, Rosen Penev <rosenp@gmail.com> said:
> On Wed, Jul 8, 2026 at 7:27=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
>>
>> On Tue, Jul 07, 2026 at 04:06:51PM -0700, Rosen Penev wrote:
>> > The clock is obtained without doing any sort of cleanup on remove or
>> > anywhere else.
>>
>> Given this is a SoC gpio controller, it is very unlikely it every gets
>> unloaded. There is no remove method, so is it even possible to remove
>> it?
> Not that I know of. My devices don't.

You don't need the .remove() callback or even the module to be loadable to =
be
able to force-unbind a device.

>>
>> How did you test this?
> I have two mvebu devices currently (sold the third).
>>
>> > -     if (IS_ERR(mvchip->clk))
>> > -             return PTR_ERR(mvchip->clk);
>> > +     if (!mvchip->clk)
>> > +             return -ENODEV;
>>
>> You should not replace one error code with another.
> This section of the code is a result of the older API returning a
> PTR_ERR when clock is missing. New one does not. Reading the code it
> looks like it returns -ENOENT.
>>

So is the clock optional or is it not? The answer determines the correct
clk API to use.

>> This driver has been in use for over 14 years, without anybody having
>> problems with it. The SoCs themselves are EOL. They were used in NAS
>> boxes, which do tend to have a long life, but i doubt there are many
>> left still running a modern kernel.
> Still have one. It's unfortunate that ARM32 userspace is getting
> deprecated by a bunch of tools.
>>
>> Changes like this seems pointless, and just waste everybody's time.
> This was a sashiko tagged issue.

I'm not against refactoring of old drivers, otherwise we'll just let older
code bitrot. I'm fine with this, I just want my question above answered.

Bart
