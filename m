Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641502AD35
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 07:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777275718; cv=none; b=dF5SmlruefOYu7b2mB8mzrp/HZ4yLnXM4M60TEPgC14xelj9R+BI/ztRkq8ZpZA7ywQhMSwu93qjGZdWs3xO7L0Y+K5bef1/LvuYP49ihrNhhXoUEk0keqktcV/99aFWfRuDMzAK4oBeImzzf33g6V+kptS/euqpkM0ko2VuI3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777275718; c=relaxed/simple;
	bh=3eqSPBlOTauutRuc4J4ouVsuavhP3NjSx8ioZQHM2FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ILOuZQRtyCwbW8/impaVJMJS6ccUnI8ZMrup9WGPdCJgwz0MG9FmwHJHU5t36VbZU88zzj7R5kftvPsbrjsIchPEa+mXBEFoLjtYnRTfzGb8JvMIDka+ubHxXQSf8NB5oWOQa5gGZ/DIk5c7Xge/rNwhJ6anyB+wU4iMqmaheT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFmIjbNT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFmIjbNT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EBBBC4AF09
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 07:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777275718;
	bh=3eqSPBlOTauutRuc4J4ouVsuavhP3NjSx8ioZQHM2FU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qFmIjbNTZaRURRgteAyTmsde8tf/atOPABy+aRX2VhdV7RDMKgoSv9tRU2a3fODP7
	 Ubnx6SgoQrzfXivwtaiNgj2MJTQ9HtRy1F7bKRK+DuxEunEs9GlR7Fyy3oCX/NwIjt
	 P6nK0giaB2XzVQt4YzSgYRdxq/Xuqsjqf4zPq39JCtxfAc2rSeB3WEkJXp5yQgVKTJ
	 WFnBbXyB7mhEkX6md7J99tstljhg1BRTdMPX+pehoHS2UVkGPPF1fVYfgrhQKPF6r2
	 7dIlNNDqjXOG8BhXhmL2U0U+OKw+1zajpTyXxS0xwCGJHjC1jLkprHI96lndNwZ/G4
	 TUBkjabCeFR6g==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so97014351fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 00:41:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+YzqW/N8WN4uOp7/9TGJ1newdYLq6m3JVGaj0o+Hxo29bYDSx9+0z4nQeBfkkAqix0jLQ4OYu6p+4a@vger.kernel.org
X-Gm-Message-State: AOJu0YxatL9eXl0q4JRN1ENdUdxKmfpP3LRXtzT2TgQdNWqY5DBlDP5b
	MG3aC7m7KwnVX8vJeeemV6A0ffCW1WYUSuWbHAxeTKnsdXoHBtALBlh18lvgA0FWat4FFzkcZbD
	SL1bNxqgeycowPBUAzzsnXZr8/oYtZdSuiXKbrP8WGg==
X-Received: by 2002:a05:651c:1604:b0:38d:f09c:8607 with SMTP id
 38308e7fff4ca-38ec7b2f39bmr140981041fa.25.1777275716778; Mon, 27 Apr 2026
 00:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422-meson-build-v1-1-a63a7a8b0d2f@oss.qualcomm.com>
 <PH1P110MB16037F48B385E4CF1C42ED569F2DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <CAMRc=MeXo33fUWXYEcPnFOYrvOtYiefnzX2T=9dMSkWvACG1_w@mail.gmail.com> <PH1P110MB16037AADF6BDDDA501B241AC9F2BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB16037AADF6BDDDA501B241AC9F2BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 27 Apr 2026 09:41:43 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdREMgaaVSXgtb_-q=KBu6E_ObmajQ8RvF3eCPWO6mW_A@mail.gmail.com>
X-Gm-Features: AVHnY4K5bKqqpdYf1H0t5hK9TANZHDPUSA5I66gHhAJwxQ2DOLuwfw6m8ETdsHs
Message-ID: <CAMRc=MdREMgaaVSXgtb_-q=KBu6E_ObmajQ8RvF3eCPWO6mW_A@mail.gmail.com>
Subject: Re: [PATCH libgpiod] build: replace autotools with meson & ninja
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Kent Gibson <warthog618@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Erik Wierich <erik@riscstar.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 9:07=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
>
> > -----Original Message-----
> > From: Bartosz Golaszewski <brgl@kernel.org>
> > Sent: Friday, April 24, 2026 7:15 AM
> > To: Vincent Fazio <vfazio@xes-inc.com>
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>; Linus
> > Walleij <linusw@kernel.org>; Kent Gibson <warthog618@gmail.com>; Viresh
> > Kumar <viresh.kumar@linaro.org>; Erik Wierich <erik@riscstar.com>; linu=
x-
> > gpio@vger.kernel.org; Vincent Fazio <vfazio@gmail.com>
> > Subject: [External] - Re: [PATCH libgpiod] build: replace autotools wit=
h meson
> > & ninja
> >
> >
> > Thanks, meson 1.7.0 from debian did not report it.
>
> Sorry for the noise... apparently my build environment is so old that I d=
idn't catch that it was undeprecated subsequently [0].
>
>
> [0]: https://github.com/mesonbuild/meson/commit/0c802d260c98f990a32ad22f5=
5a055ab65779ccb
>
>

No worries, it looks like fs.copyfile() does the copying at build-time
which is what we want here so it's a better fit anyway.

Bart
