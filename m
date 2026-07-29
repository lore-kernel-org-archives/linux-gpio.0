Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D443FB7E5
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 07:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785309754; cv=none; b=mrB1xSxDxnfE9xhBUcK73lqZtNtM9IGzYWTsnCc8uW7EVN162VSgDcSuzFIok2j3zsxN12qJlJLq2J/gHUjxrvx0NXjS4ok7M7IaftC5WOvOhoIw47E+T1TXojtoVsz7WXgnBnyci/WiypuwToMBnm4SancWoopsQtaCDvLBewg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785309754; c=relaxed/simple;
	bh=oxfoMY7jU7rL2S1wDkwe5zxb/9tOoXPbLVw5tK67mu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUlgfDucKwB7oifoO5LHHr0nGVZdj8NwE298klR0xRCPyfpi+CGpD1Gdmp2z437D4zcg7bReMvpHQkXhdIVH4LeJSWb0PTtkIlxs8FEvULO10ScRDU5YnFJB9SrLbttVg2uYirX54uL+C3Upq/91SytoIgh1fU/C6rbqS8xl1U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmupPDRh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmupPDRh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3561F00A3D
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785309747;
	bh=oxfoMY7jU7rL2S1wDkwe5zxb/9tOoXPbLVw5tK67mu4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QmupPDRhZTb447l1aChITnMPwy3tbmBMfJufu4b+eP9hCv8rDBfgo28vfJqXYaEWd
	 WqzoAEwoSdyrP60mBkjRRH6/Umse/xxC+Ukgj8W3RpBqseZT+r9/NxhetzqkkymgJc
	 JJ7WirCPWOETGpd1dbW7XlDxfm9rxCVWZ9Sw/+0G53h+7UsAuYik81c7UdyLiOFIXM
	 NgURIFw7rwqkm1zDLyliPyjsuuI4tRHNaA9UQ8tVHcJZg+wYnQP2+kmzrsXiuzrlju
	 OuR9cVFU9U7kJ9kaImxfM3XtCs4k40DnFkAAgGE39LLLeZnuxuUmcluVsuM2lWJ8Jd
	 hgzef9niYPDRQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso582162e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 00:22:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqFN+wQ2Qs14KyNzQst+O1Zu1KXXzNfVJLrecPLngCviTpsjtwVmt5asBsqxz1dzwztl8aLR5ZqRS3a@vger.kernel.org
X-Gm-Message-State: AOJu0YwgQ/sO5CA65RFwByJ+67KQshor5wzyVrnggB+iywCl96PPkhkh
	LMkbl8wv50/bDLkMTYKiIZ+H3DzIfHkix35S2d5bEb+Q5Sd2L3n5t3bRKVvD7QdTg/nl1n2eC/E
	LK5gfNQEjTAPHlFT1KGiYANtInWLF/Vk=
X-Received: by 2002:a05:6512:138b:b0:5a8:88f8:9ed4 with SMTP id
 2adb3069b0e04-5b2d025abdemr1268412e87.30.1785309746211; Wed, 29 Jul 2026
 00:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723014129.1129730-1-junjie.cao@intel.com>
 <CAD++jL=EJyWpqjwCdfosdanjS9GUAwMEJjHFrcvMyBV3iKHZZw@mail.gmail.com> <20260727151902.214691-1-junjie.cao@intel.com>
In-Reply-To: <20260727151902.214691-1-junjie.cao@intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Jul 2026 09:22:13 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Wu44V2CyZaky35+mb2RBJ7d3wRsmYWfK-8D5_Pck=dw@mail.gmail.com>
X-Gm-Features: AUfX_myrF7H2U8CBCjS7yTzN7BwCEf9LS0EJzRBLZWBze4UVLnMhUDojAr3396g
Message-ID: <CAD++jL=Wu44V2CyZaky35+mb2RBJ7d3wRsmYWfK-8D5_Pck=dw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pch: use raw_spinlock_t for the register lock
To: Junjie Cao <junjie.cao@intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Andy Shevchenko <andy@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 5:19=E2=80=AFPM Junjie Cao <junjie.cao@intel.com> w=
rote:

> No -- it is indeed not a regression: the lock has been a plain
> spinlock_t since IRQ support landed in 2011, so it never worked on
> PREEMPT_RT rather than regressing. I Cc'd stable because current LTS
> kernels with PREEMPT_RT hit this sleeping-in-atomic BUG today, like
> the two fixes I referenced (286533cb14a3, 90f0109019e6, both Cc'd
> stable); Bartosz has since applied it with the tag kept, so I'm happy
> to defer to whatever you and he prefer.

It's no big deal, the stable people pick a lot of random stuff I don't
even understand anyway. If they want it, they will take it.

Yours,
Linus Walleij
