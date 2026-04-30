Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042D1402BB3
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777552768; cv=none; b=k2YbxuufZsHERQdZyCFHyiqk8/I6ILGJb70fc//9skXPo+lOodXoa2CKkA4Hgooikq+9C4flx9l0tDlCIk2ftPj7V/ysLcwIFv6YsUA+kCMqIMgNArHmMwHoVLLEwt+pP2M84OM6+8bH7CAZYeaY5ZFY0NHNMgDj3N+vZvJvnBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777552768; c=relaxed/simple;
	bh=EQXZRV5uQCW/cxvkOhl67UpYkMhG+bZkayKSVZFupFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTuBYNQ0fLc2KxwOhHEUkxF6SeJSY2xVWIvNwJatGH/6s3bN2vX3P14EHJ06ltswtS8o1/FPERcnYcgTc06R+2t/GRQrORH+epOYbJxdUSwGEaED66Wx1qyMMJW8LgVan44Jf+yQyfZp6oCL3ksaI0RGA+5rHU3JBaRbYXhiv5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ueYH73Wq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ueYH73Wq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8254C2BCC7
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777552767;
	bh=EQXZRV5uQCW/cxvkOhl67UpYkMhG+bZkayKSVZFupFg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ueYH73WqtJO+W8HiO6LWz/lqky3SV0MtDJsMB2/2GO5+Jicbz8n/eIy7olUSz0lX9
	 EFe5ZgF3pvFWQa7KPzbaoSC3lKYEYxJxcpFf3eXAAe/Ohci5O4WfqG2nusrmzokYKy
	 rS8cpT0GC3To5LFjAf44tZ9GNqIJcX/pNGhpkP71Gyu8Aqa5C2I1vZLdkT41MLpUNo
	 93wTTtymXdJKq3e0lUAzoqTL7bdH7X00yuqo07m9tbLeaV+9Q50/T6Kb1CERK6ECbK
	 dzULAFiFCm2yPmYuzeQZ3jrIz3r6HU7T1V24k7Df6yUux7KlAkYaXUzi9hpRzgjUrx
	 B9AZ2fhSQIRLQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2c500750dso1514939e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 05:39:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/qyeDVUSFxDBS+rHL9I2i96UV7+xIWSTw2dMEJA827wtt+5WwPnx/rf3QLRIpwn9YEV10YOwEQSt/o@vger.kernel.org
X-Gm-Message-State: AOJu0YyNPwhXl6G7N73fX/FCzC6s5aR1IYPX6lPnDfQDhGgEiEnacRmC
	ClVbH5zkBboLbzpeLoDPoy2iSsn6RK18Ziyx7JOmlMhza+0FwRPkiLVqhBc+KLmQZhuozP87I5N
	Ic09qvNM4oh4QVaLVeWuKHtIdJBC3Hdm0gtNwUkqNtg==
X-Received: by 2002:a05:6512:15a7:b0:5a2:c0d8:e634 with SMTP id
 2adb3069b0e04-5a8522b01bcmr859859e87.8.1777552766405; Thu, 30 Apr 2026
 05:39:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
 <da7ea88f-845f-49e3-852b-3ca352c1790d@app.fastmail.com> <CAMRc=Mf9M_eoPzsqBdmnXLd8Eqw_cPcnXWN9xjC-+x5ZA5Qb_Q@mail.gmail.com>
 <CAMRc=MeKn1_pMAyx_bQfMczqRJ1s28s3R9dAVMG5he97R_q4Dw@mail.gmail.com> <dd8faf98-4c1e-4e08-a41a-849c59a903e7@app.fastmail.com>
In-Reply-To: <dd8faf98-4c1e-4e08-a41a-849c59a903e7@app.fastmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 30 Apr 2026 14:39:14 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mf13VEM8=JkF=4N5rGH1xKHu=cLf4cco2zSJ=y8-57JtQ@mail.gmail.com>
X-Gm-Features: AVHnY4KVfXRESNhTxasmm6--038e7o45wDQecb2lREMa864d8loy1maw5o-4PeE
Message-ID: <CAMRc=Mf13VEM8=JkF=4N5rGH1xKHu=cLf4cco2zSJ=y8-57JtQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ARM: pxa: attach software nodes to the GPIO controllers
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 1:58=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> On Thu, Apr 30, 2026, at 09:14, Bartosz Golaszewski wrote:
> > On Mon, Apr 27, 2026 at 1:01=E2=80=AFPM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> >> On Mon, Apr 27, 2026 at 12:50=E2=80=AFPM Arnd Bergmann <arnd@kernel.or=
g> wrote:
> >
> > Before I address Russell's comment in v2, can you please let me know
> > if pxa will be removed in v7.2?
>
> I'll need some more time. Not sure about the schedule, but I don't
> expect to remove the board files in 7.2 now, sorry.
>

No worries, I just wanted to know if I should even bother with v3.
I'll send it with hopes of getting it queued for v7.2 and being able
to progress with GPIO core changes in v7.3 then.

Bart
