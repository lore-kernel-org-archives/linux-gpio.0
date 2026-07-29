Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FCB4519A4
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 18:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785349967; cv=pass; b=kYrLezTg4w6dAJ99ZkFZ4mftFnIhwk4vRjPVQCZ1klCP3RQiuAWJPueWKLK7mdez1Q16F5wtHhGsmp4DHlGHdKwQ5DVSkkH1paBZ9cGVEY8bpQgBaGLci2Z5i5wxMo6bE7XApli0kpzZHGk04vn9ZRqFf9wejR9Zw+igXvKfZlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785349967; c=relaxed/simple;
	bh=NW7DoNJltPHRzI2HWZo3ilj/TXANIsURSY3njG/YSws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BxYRRocWwrSNgnehMcHLpoHcUzHR8gdLHDwZKS7O+DZ8TsyEkO6XARrz7nAIDVFEKWLxM9lz8mX6VukhspmqTtMT2bQaEKNSq3MjYCiB1ZWRKqEE2EYx1OTCphRzZVyEPlUN46MNF0Kr7l5Ca5LAsLbUCVy3W0cgReplQujpIuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGTL+tGb; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGTL+tGb"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69ea0595598so1338318a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 11:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785349960; cv=none;
        d=google.com; s=arc-20260327;
        b=j13ZR/PtFTXupJFlfIBWdpgV1rV1zjo2C4eqR73ryx61ge1cNLTCsf8t0AkUEqnbB8
         YIjFB1O6lWR4mu6TRAIQryz9Y4dvNswTyW0ihxFxxxFZOcVwUNDTbJ566ALuDY7Ys4oP
         oTmoHvJlxp5zIP9KV2eyQGJmDwu00EmSMnrjO9RNlE/ol5uyXp8ZNa2cOuQ2ujjtHiIH
         t6qBzUekkwNIDGvtCyQRhqQkRX2by6Jj0n9jlKAWbHzPlrJfBEmiYjqi8C2yBTHqBcqj
         34eOuCJovMkcyU+BeyHcn3dpAyXuBCo2bn1sWxuvLjhV/jRJayklbSo1QJVHWvOQqMlm
         TM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OWuhUqUKl2tQgwy7xscpevse6bZZgTd2BD+KKHLHGXc=;
        fh=OdIXSCVDOyeoSReC/KUQPRY86hvINr0gonMZ6LLwzsA=;
        b=BCRjjqmX4Wxmw1DonFM4t1F3nlD3ULB3XzdDELWsKYFtKGqr2kxC0vlWW3Zmbke2u8
         NgTBEQ8BHgLYj0JJEcwvInNOZFSpiAhrJEo+Vrzz9kNq2mbw/Fy8tqQtLLKFEhBKhv1q
         oCJJEyvku3ovi4LtxivTv7Tg3WCZjZLdmtcX302yovTErApSrUj1LgrMkQYG7jm57Vqc
         Wp37DMRKhqqNcuzo0WUKZfeBjxCnriunfkNCrFPtnbARWLjaRUjXMGBiKe7A0qcDoi+n
         9vqXx8vUDcK7PXgFymzBbYfbDAsu5Hhbv7n7lMQCLk0JjfcOJ3UAUUXXytrOeqV6dcB+
         THpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785349960; x=1785954760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWuhUqUKl2tQgwy7xscpevse6bZZgTd2BD+KKHLHGXc=;
        b=PGTL+tGbmpSqmORnGZmN7jdMkNqF4TdS2RlivCNQOfi6UF035RoP0Y6LNXXc0jKjQe
         ZEX7HzhE+YEcBoLEvHIAJz6clRRd6EWztp5CF4MQ1N3SBQvKIwEQ0LktASwlZXAWfRSi
         PJAkN5Bhj0wRm/js93GKl9XIsB+GBPVB6r1aBVtlANVkTL4HkcB+tTrCVIm2OJAXMYqS
         qi5L/sgn+HBx6pVJoGFvo6CgoGyf4GzmIVxS8DwXm0K5u0wzigl+wsJGbrU9Qb/SsRNP
         V4kY9LzEWDCW/LvboSYy4cWGuqZZp4PRrQtMx7LLDpCy2IWjDe0hqw3TChvDIxlJVxL8
         Z3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785349960; x=1785954760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWuhUqUKl2tQgwy7xscpevse6bZZgTd2BD+KKHLHGXc=;
        b=HYtnc5H+X75cFVhsk/AGtOO8JzS4X3ChQiqr4M3EaNhABqV45gTx7eDv7mtp3QdQka
         25GSVzJfJWMwk+1i/pMCMO3+ARWJg5aSpL8XuH25Ia0t082cQKO32HRfnvsnIkxiNbqQ
         uIEXv+zssMsHBBINWIWtTrbnZCdW8ZNJzYGFgMiFURipiQF7EPlzwFUgG9ErbQsPMGBR
         t9K0ZDJyyD00bc3LbW3L8OIrOrr8Z6swUUGaV9dBlxWZnIYmnQdIKn8RihYX/fX4gWnl
         caPDHho+c27qOMZ62DMGC83pu3ZqsdEyyxcpiY0H4skd7SsaeVT0PecmUtZ4YdfVUZaw
         1B3A==
X-Forwarded-Encrypted: i=1; AHgh+RqbnjWMckvfoK/ULzmkWUpkoQLLqlQcgHPFBqaawaLDK5PyFQ23HMxqGNH/eNbR3DDxwgMAsRwZAT0/@vger.kernel.org
X-Gm-Message-State: AOJu0YzUUCT7xl9lN14rtqlvJp8/sgad0n+/wVRBmoSzvnjZCgjrGX7P
	HkxuNMSkYB0R9fmKmIHs21zq1219Q0AvVDPgyjiCJZuQ/GlVFwd/5Kdvz54DuiEZH8+AB6bc2bo
	p6qIQAw1p/VhZ6PJc8B7ChWfrDLna0tE=
X-Gm-Gg: AR+sD11w49SCxfx3EDTnEd5EzbR25y6s/GC0udR7aYbJQqKqgOI/d2+SmMb+7ebahUR
	/UZfgGIZys2IPD1OK5aZxNKaGg2m8qceKP4JsZWNPf9fcIk2E054EAXMuemjXAqvBN/xO4DS4nF
	eHViw2WINxO9RxGK08mO9u+CmG5AFsUmkIOo24XALQXkLqqa9UmlDji4e00EPyNrPm7pN7SFzhj
	3jIFTybDWCiALYXFVEMaxKe0GvNIGdsuwWtIdgQ5U7R5R3X2nQ4YXio0IVs8wV+kvrIj/1GO4dY
	+4Ob3k0V9O8sWs0PaVN+/v52R0EoyfDMFlDM5hcn0Ll34U4c37i73czKa1iW9QDsufGRF080HbE
	PJ5Kclk4/YlVod/t0M0UWUm2dmZY84wvqU4fTregxrgWUACHQtG/PgOwuim+qJp0hrwXIXMC4fm
	OV29fR1Y0qhEJK0dChaj4ZtpEuKjIHgdHuVZgb3dqzwZEeovHzDvmJQjQ=
X-Received: by 2002:a05:6402:194e:b0:691:7054:8c6b with SMTP id
 4fb4d7f45d1cf-6a034a9e9demr4048551a12.19.1785349959966; Wed, 29 Jul 2026
 11:32:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602050131.856789-1-rosenp@gmail.com> <20260602050131.856789-6-rosenp@gmail.com>
 <CAMRc=Me0rqs8nxrp95X-2Bjw059ahRxwKrg-NtmEt025w2m9bw@mail.gmail.com>
 <DIYGFNLIFBW7.21W9J6SUGYF72@gmail.com> <7ee42722-f7f9-40cc-a576-5f85e3955537@linux.ibm.com>
In-Reply-To: <7ee42722-f7f9-40cc-a576-5f85e3955537@linux.ibm.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 11:32:28 -0700
X-Gm-Features: AUfX_mwFm41Bflu7ob8t5htCSDpQ6an6HN0IUWP3VvCWL4feJWz2EPy32kLLAAQ
Message-ID: <CAKxU2N8n4iHrr-+NxL6D9WZ4EgH_XVJ7yfPa4P6ZyFNJTir60w@mail.gmail.com>
Subject: Re: [PATCH 5/7] gpio: ppc44x: Convert GPIO to generic MMIO
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, chleroy@kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 3:55=E2=80=AFAM Madhavan Srinivasan <maddy@linux.ib=
m.com> wrote:
>
>
> On 6/2/26 2:56 PM, Rosen Penev wrote:
> > On Tue Jun 2, 2026 at 12:51 AM PDT, Bartosz Golaszewski wrote:
> >> On Tue, 2 Jun 2026 07:01:29 +0200, Rosen Penev <rosenp@gmail.com> said=
:
> >>> Use gpio_generic_chip_init() to set up the PPC44x GPIO chip
> >>> instead of open-coding the basic get, set, locking and state handling=
.
> >>>
> >>> Keep the PPC44x-specific direction callbacks because they still need =
to
> >>> program ODR and the OSR/TSR registers around the generic data and
> >>> direction registers.
> >>>
> >>> Assisted-by: Codex:GPT-5.5
> >>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>> ---
> >> ...
> >>
> >>> @@ -124,10 +102,11 @@ static int
> >>>   ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int va=
l)
> >>>   {
> >>>     struct ppc4xx_gpio_chip *chip =3D gpiochip_get_data(gc);
> >>> +   struct gpio_generic_chip *gen_gc =3D &chip->chip;
> >>>     struct ppc4xx_gpio __iomem *regs =3D chip->regs;
> >>>     unsigned long flags;
> >>>
> >>> -   spin_lock_irqsave(&chip->lock, flags);
> >>> +   gpio_generic_chip_lock_irqsave(gen_gc, flags);
> >> If you're already doing it, can you use lock guards too?
> > Sure. btw, I avoided placing
>
> Do you have plan to address this comment in v2
Yeah I have it fixed locally.

I'm not sure if this has to do through the PPC or GPIO tree.
>
> Maddy
> >
> > https://lore.kernel.org/all/20260517063754.21819-1-rosenp@gmail.com/
> >
> > in the beginning of the series. My thinking is that's for older kernels=
.
> > I believe either the generic API or devm_gpiochip_add_data fixes this.
> >> Bart
> >
