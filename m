Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CEB4AA3F5
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 11:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595325; cv=pass; b=WMUMsMXT5QRBt6/rRlurjifzKgFyry0H4yp85zkiMEQ1taTPyCzFOH/BXtljAxFZtyWJ29WiggYTXd9OwXmurYbK1XVsNC29RonDtYZcZYu9v5xi9I/EK23fBwbLEzzCJLUvD8p/kYMy9PPSDHZMySSBPoaDoPHNtRG+VcHqFgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595325; c=relaxed/simple;
	bh=DhRO3jiEisFREUCpoPPDrLxkhHUHJj9Nmc4vEnpDsDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fpx7nx2g2JlG6iDu4/4EROdXr8Nh20wPueP4ddeh6+AI/XohbV/neCfIvrBJ4EBJ1b5/V1qWS54hzu7SnKMUe71GMaMDCDPOldobAsmotZoK72GAFQCfS7Nw6OIaWE/SmkJH6Xfrjfg0+wfIiYV+Gkt4hp74+wIHvW0s4q1xuME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VI7xR6X2; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VI7xR6X2"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aaf10bf094so3547850a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 04:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790595322; cv=none;
        d=google.com; s=arc-20260327;
        b=jcy9MjAT+z728b64WI+pgFdrgDBJ2o16MX4hDhIerUcwYrnUTRTho3k4UIf7Gc7y/l
         0jtiuTdG3uMWjNZugC9zkTSXgzIo4igyWXETzQpaju6qkJQWG/KHbBVOw7Ts/ghTRTY9
         cYqPM3wiBtD9rHGJm80SU+XcFqpHoTGsRHlWSmByiTZDuj47yNtMbaoqZYSsiKIxzG3i
         KT/YWe4UtoYWLZFvjKIfN4MggWzf6bROXmOuMXSGLcbycfBRCGiydEe6WwQ3OHXuM/A4
         0XK64ib31+SswDkmq8AoxC/3VKq9zYSG/Rk+yU5kCr9zSpAvCoOR1QaFGeapef3yY7jQ
         4xaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xKQihEndGsBnwilqhNl/3eRhz/IoC8GE9Y3qmXrQaP8=;
        fh=ABkTl1IUFPIqEysaZmyvl3xu4LXxcOHeOlyK+/tNFhU=;
        b=nAjmCY1NTIeGuBfiNK8w9vemS3xY1BDmlWQzPLh3CDvOi0Xiu6oPX3eYihuzvBc9aq
         Ysomv4NJenXduUG8Mgpg1zsRBvLOCtUEsH/P5iTEYFaob1zhK7NiWD0kSQdQgKnvs0mV
         wrIe67Q082EMKKcQB6RF5dFbT64hIj+gKuyy6xmQusWqR6r7zpaqDY0qXreYOmWL6NDN
         9FeAP3VD3sn4PxLfSZdGW1AHwVDQdCogqnY2jl7m8qXWVl8wEfRYp3G+OUwZd8uozPBt
         EtLpEXAlAhyW5aNq0UmASrgKpO0AJHJfGN5LR8/tXwjDVv5TqbbeOgy6OWdHen6iOY1/
         rNyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790595322; x=1791200122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xKQihEndGsBnwilqhNl/3eRhz/IoC8GE9Y3qmXrQaP8=;
        b=VI7xR6X2DwCvODgEVD3vRWLRCgBk9mAjeUa63XQNKK063KrtS8BeEcFiGjETCT5mdX
         gZEXEE+i5mZYDUeudEb85euZSZtJzXlOsMgiZ8UQYKNoqL0CBHAFeUPSR4BhJqX0Cwb5
         YsoRSg/OIofy4mmx9l+XWK4IGLsB39Ope3AcbKiDy0KipZ5z2OtM6ikdQV12O6jAuch/
         GJcwCGkUiC3P2z+uUwdxZxpbCejYO5gwZlyx1Bvd5IsYwvk06r7Z2P242cNIBRQMfICn
         dfe0X9JSYxGoDY8Fdf/rr/2VK/OSq5hpND9go3UNVXjd115mSVxnDlMwUAWVCENtRXW5
         ecSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595322; x=1791200122;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKQihEndGsBnwilqhNl/3eRhz/IoC8GE9Y3qmXrQaP8=;
        b=CdrsABfjiAQTGxTYtiLSIgldkbcLtV0JnVgJimnpoVQDazasoE3xkgwJpiR6CAmLw/
         8rS64S0YWtnfts9zNRRvvE6zAiu2kNcGPdBzqQ9SPkXpR4rhZ8P3UoWd++DrU3xhkSsE
         JaWOiRWKMhTdqLkfSAt5cyZNPATxL6gd3aWAEHrMVS6Q9cu+Vm8ndU7I14DzVzDjG7GG
         lJpFuTjYUuH96Uy2Eg3YYT+LnS7FUxbTpvi40JJaX4JFyT9GvG2yP/+Hpg7UQwwzDk3p
         GUCg7evmcF2BKbw6UL/GJQysTrUX4yugOfc19OMY5AjEY3gtBwLF9WPDOOSXuJpqhkuN
         ZX+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwazmtx2qvV2ZGTjRYxjFFkyhJxb5Ue8TmiRMh3U3DDvtBNAgulsBvuxIMQheP0ceOkDKIxLq+x6L2S@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2WRktYniFkQVOe9p1COBebkaK62eubNoX6XKq9vT2ckdiRlkv
	V95LVwXB68WJtvYxcTtfHMBnn+JfQmPaG64SqkiW0XhvmV4A62tUjuSF+q99UMjEVVk3z7tfnb7
	94tiyWZp6VAhhX/YpGLEPQHmmZWbZgc4=
X-Gm-Gg: AYBFou28buYZlcX8v2YgJFkx2D8Gm0gChgwOiscYBaoUOvw/kL79mhKL+nVdK6SVc0d
	3ztbe+Suu8/ln0rny8338xSohEjmIe9OQA7bNU5sybQaG/bpgnkrKevyWQB7oZfJINCIuEgG4iZ
	jcTBe6NfIqUsssPeKD+65ddlsBMIyv4NlZofkNzcgbzgvYMNCUEIMS3CtknKgoIv2y6SIaScZn1
	UcDjffb5h4tDgzP0wn2smqmyVvN9VE/95Q6A+7brAZfH+OmLCoXgO1n54/4a1hGN75yZiuXbiAz
	3mr2RbEKgE2VVhWl3Bs/7Lgx9a/FzWviZaNgb40si7++Y9VNSDk5HuUn+B3KiAGBWplJ/1U569b
	1QfUzpKf8iciqLp6KWks9OpadILaMDJWKPvBr8XNTvV0bu5LtqaPCLnkqX/kgqsObvEiKUObe6q
	KSBlXxkx/EK0unBus5PR9ybbcW3shzmtpXvGAH8C3k
X-Received: by 2002:a17:906:dc8a:b0:c25:2e93:289e with SMTP id
 a640c23a62f3a-c2ac233f3e8mr999649066b.16.1790595321284; Mon, 28 Sep 2026
 04:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-gpio-organize-by-vendor-v1-1-8feefd60581b@oss.qualcomm.com>
 <arZRZfa7AmDxmwoJ@ashevche-desk.local> <20260925125433.GY106095@black.igk.intel.com>
 <araGjQoaffMhDMLz@ashevche-desk.local> <20260926100727.GB106095@black.igk.intel.com>
 <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mc-C4ptY5phhAkpq7DbE-+=G5h4XByYdj2Xx5sVS-vvrQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 14:34:44 +0300
X-Gm-Features: AclHuK8L4MxeaZZDRTg8AatUimH9WZuruRjftd0tMiE0swMuhwk9WFLPmKj4EeM
Message-ID: <CAHp75VcctaQpSpKbr8i+LPfE8Ukazyn8=KhwsSa+4sbhvQ=WVQ@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: move intel drivers into their own directory
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 2:13=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
> On Sat, 26 Sep 2026 12:07:27 +0200, Mika Westerberg
> <mika.westerberg@linux.intel.com> said:
> > On Fri, Sep 25, 2026 at 05:34:53PM +0300, Andy Shevchenko wrote:
> >> On Fri, Sep 25, 2026 at 02:54:33PM +0200, Mika Westerberg wrote:
> >> > On Fri, Sep 25, 2026 at 01:48:05PM +0300, Andy Shevchenko wrote:
> >> > > On Fri, Sep 25, 2026 at 12:22:15PM +0200, Bartosz Golaszewski wrot=
e:

...

> >> > > >  drivers/gpio/{ =3D> intel}/gpio-graniterapids.c   |  0
> >> > > >  drivers/gpio/{ =3D> intel}/gpio-novalake-events.c |  0
> >> > >
> >> > > These are interesting drivers, not sure where to put them
> >> >
> >> > IMHO they should be there too. We are maintaining them both.
> >>
> >> Do you send PRs to Bart or you just rely on him to take the patches?
> >
> > I don't expect these two drives to get too much attention, and they cou=
ld
> > be contained nicely inside intel folder and that would help Bart to
> > identify that these are Intel drivers. So your bandwidth would not suff=
er
> > even if these two are added there. Your call.
>
> I'd like to avoid a situation where we have Andy's Intel drivers under
> drivers/gpio/intel/ and other Intel drivers under drivers/gpio/. I'd pref=
er
> to move all of intel GPIO drivers into drivers/gpio/intel/ and have Andy
> gather changes to them if he agrees.

Okay, we have two parts missing:
- Nova Lake driver (I would need Adam or Mika to step in as at least a
designated reviewer for that)
- USB IO (I think we need to agree which tree it will go through, my
bet that media tree is the best), for that we need Hans' consent

The rest is done in the mini-series I sent earlier (last week).

--=20
With Best Regards,
Andy Shevchenko
