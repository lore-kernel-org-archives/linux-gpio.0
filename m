Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AE1219E8
	for <linux-gpio@vger.kernel.org>; Wed, 12 Aug 2026 01:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786498032; cv=none; b=YOx7tfEXyCceMO3e+WR/kpp0Zbrrs8NoCQqii34UUpl8EzfTcelUYg91bubiDXh7/h3K4SpFVWTBTp4BHSKwqlypAqhg5yLeUD5CN3ePeSV8lGRWNPsF13cCcRTq4mBt6arruDIwCyzk8u8RWADZBu3oa7NPIXjXNLCI+jBqR/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786498032; c=relaxed/simple;
	bh=0CzjVy15kb5Jmlqtc7OoFm7HMjsGLTJY1gaq5sPx/xA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0eODn2Lot2W/L2Zx6LG7TY+KcZHadyG1Wa4GA32P8j5Bd+7bUzK9d06A7pye3RrtK6xNUwp2S+sItE4e/RaY6RvJ/0jat6qQ3lvR9EqeBc8HYHc+0dKA3ENdeKFPsRENr1z6TUyFuqaVbMYGYO3jfitwMyDDxExn3FW/C0ppFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jHPn7Mex; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jHPn7Mex"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-74d55dac06dso130971137.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 18:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786498029; x=1787102829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wVX1oRXHPbssqEstfoTh1Hol88WpCXPI5maYGaxcM/8=;
        b=jHPn7MexTP+m+P219DCeN/mT3xyhG7d1A5OO/KS3F3O9PPalVYkd8iparqWqKtWAqG
         SEyL7/eGdJyaEzlRGWcFX4XDOFTz4d1AVMKqpk0O1SipNovBU8oMP8ML51sLCJhsDJDx
         aaAn1xI7g5iXWwX8OSy2k9RUb+JgG7qd3qIdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786498029; x=1787102829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wVX1oRXHPbssqEstfoTh1Hol88WpCXPI5maYGaxcM/8=;
        b=feLVf4Nw8UUK2us4EprjoCLst2aPFvg/wtM38Y+A8NosGj7vkUPJw9wtJtBTwMumQ+
         iPusKWMO7bj9hto5I+4JHfNUaFs7wkSH8Zonp/AGWW3zBak3oI8W09ncTMrYzvRvihXE
         ic5wB9Le6Y8HC08X1TMN5fG7LU95GDQF9y4gQqBoPw9IhWam9/mldxnoxsZskpJ9oHWo
         nslgRmCXKyvxzUUWtlO22W7ZoUmR1HEliOdRcPU/Ng2OZwK+f6lVtk1ko148FVp5wtyu
         gkRZ3kP28rOXNRXy2SJIKjDuAxuqfmSOhYbweX3jXg4tpIcS2WPKyTKHhxFEw1kIkFm+
         R5Lw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+AKP81swkxxzlX4zRIWyX2Pp6+PpCjOSkuTZfMumpux/j81WKGd2o0lDnsYTxBoxQ9r3xkscTkL5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YztVCz4al9U1QDJmIvRfAHiY8vBXwXQhJjcJnSdWdVKoqVlfhoX
	HrEnHWkORmAhm5f5eJXhDnCSBUMogEt+0HEz277Mb83XsShnE7QPUFg+Xm/CXmkKULSOlJFikZI
	XWMs=
X-Gm-Gg: AR+sD1396IBGcTfkZz7ZOhY+w/9ovVWKr63WUWYsHUbrA7L5OzgrPU+GHCuyyV+37Or
	cmM/C0vctLe/nnpRc/JU6cB1qllcclmDW9n2uSaMwC2dSWf4BrTDa5tAHJFNevz7RkVEgN1GqRT
	dcCwsq8Xj3D8jcRJRcMXUlXuxVzOBkLLAqd+s08PTElXQcPBq8Ia8EeD5UJNI6ED1Ta5B5C116m
	UQrFRNyA+ioqy3RmHKxP97Nw2C7O9Im3YKZ7hKCRIIuHrxr9uYUuUBgRqMHIXPpHWqZQVBEUrZX
	VftPGiTUOCZBTmqkKYSSOfGDHN/e+hRnUeCvRxPGJusFjbNoqeh1dcQcMFy2oNPYfxpIx0nYrsd
	Vy37hIjX6SNoPk8bzPYZM4nbDOApJIFa9HF4WAanj1FznN7KkjyP4PGhtA8C9x6NvRfsLNIXyKo
	AoPTnhJ5nlXSqPXbFJziB9O4cOwzAUzJithf4YbxQj5fUtE/NaiaxN7zVL3PN6/cdGT9iexNW/I
	i8DzK23M0NJjyWLuAB9f41fyO4=
X-Received: by 2002:a05:6102:418a:b0:747:4dcf:189e with SMTP id ada2fe7eead31-76c87e6c362mr251184137.5.1786498029138;
        Tue, 11 Aug 2026 18:27:09 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76cb1a2b77esm75366137.12.2026.08.11.18.27.07
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 18:27:08 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9673385b1efso150471241.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 18:27:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoQYG66oNWJrzJVLKIYHwQbIAYND3H+C2xqEVDAxrKUKbP2fgLI+BbtVjcTRR1qFwN9r9YvvQTLqjs0@vger.kernel.org
X-Received: by 2002:a05:6102:4496:b0:726:e608:6658 with SMTP id
 ada2fe7eead31-76c89774140mr233057137.11.1786498026002; Tue, 11 Aug 2026
 18:27:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810130635.1166626-1-mkmkl@google.com> <CAD++jLnpZbmbZ_uQTS7pBdbmpvOZSy5+JsVP=Vb3HDhV8J-h4Q@mail.gmail.com>
 <CAD=FV=UzV=G_XLoDZ4zq0ZPSQ3ttUDX9oBJUQrLYfUQ6v35nsg@mail.gmail.com>
 <CAD++jL=WmAJNotpxqQkE9Yf3COxMcj=afDVGB2zi+ZN+mRocAg@mail.gmail.com> <CAD=FV=UoZ=CoUdku5aaJr9uihxr0Q-Yj4UQeQtYeODMzku7LkA@mail.gmail.com>
In-Reply-To: <CAD=FV=UoZ=CoUdku5aaJr9uihxr0Q-Yj4UQeQtYeODMzku7LkA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Aug 2026 18:26:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UMBrgiRNP7y=KaAcq9a0f4UvJn5HOK=JoYveRS6c8mRw@mail.gmail.com>
X-Gm-Features: AUfX_myk8wLpDnssKn3RwcOZSpmpXtGLDhxgm4W7WOJAHlMOIx361eIIHvDOMQg
Message-ID: <CAD=FV=UMBrgiRNP7y=KaAcq9a0f4UvJn5HOK=JoYveRS6c8mRw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] pinctrl / 8250_dw: Allow drivers to keep init
 pinctrl state until first open
To: Linus Walleij <linusw@kernel.org>
Cc: =?UTF-8?B?TWljaGHFgiBLYXJkYcWb?= <mkmkl@google.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vic Huang <vich@google.com>, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 11, 2026 at 1:15=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > > One of the solutions we looked at
> > > together was functionally equivalent to what he proposed here: he
> > > defined a state "unopened" that was a complete copy of "init". At the
> > > end of probe he transitioned to "unopened" and then later transitione=
d
> > > to "default" upon the first open, never to use "unopened" again.
> >
> > I think you should step back and thing about what state names
> > are the most relevant for a UART.
> >
> > Why would you want "unopened"? Just use "default".
> > The states are just state transitions such as any finite
> > state machine.
> >
> > These are perfectly fine semantics:
> >
> >           open()         close()            open()
> > "default" ------> "open" -------> "default" ------> "open"
> >
> > The device core doesn't touch the states after probe()
> > so the "default" state can be reused without any problems.
> > No need to have any "unopened" state.
>
> The idea in my mind, at least, was that the state of the system isn't
> all that well known at boot time. The bootloader may not have left
> pins / peripherals in a consistent state. Until all system components
> finish probing and finding each other, it may be hard to know the
> correct pin state. It is during this unstable period of system boot
> that I envision we'd want this "init" / "unopened" state. After we get
> out of the uncertainty of boot, we'd never need to go back to this
> "init" state. Said another way, the "init" state might account for
> some uncertainty about the state of the device that the pins are
> connected to. On the other hand, there should be no uncertainty in the
> "closed" state. This is why I was thinking that they could/should be
> different states.
>
> This all being said, you're right that we may need to take a step back
> and look again at all the options. In the specific case Micha=C5=82 is
> trying to solve, the "init" state and the "closed" state probably can
> be the same. Thus using a solution like you proposed can make sense.
>
> One thing I guess we'd have to work out is whether we'd really want to
> use "default" and "open". I usually think of "default" as the active
> state and then the two common states "sleep" and "idle" as the
> inactive states. I guess looking at all the states, maybe you'd
> suggest:
>
> * At probe time, select "default" state since the port is closed.
> * At port open time, select "open" state if it exists.
> * If a port runtime suspends while open, select "idle" state if it exists=
.
> * If a port runtime resumes while open, try to select "open" if it
> exists, or fallback to "default".
> * If a port does system suspend while open, select "sleep" state if it ex=
ists.
> * If a port does system resume while open, try to select "open" if it
> exists, or fallback to "default".
> * If any kind of suspend/resume happens while a port is closed, it
> stays in "default"
>
> The above assumes that if a port is closed that it doesn't need /
> shouldn't transition to "sleep" / "idle" states. That's probably true
> (?) for any port that defines an "open" state, implying that "default"
> means "closed". If someone only defines "default" and "sleep" or
> "idle", though, maybe they'd expect transitions to "sleep" / "idle" at
> suspend time?
>
> Does that sound roughly like what you're thinking?

FWIW, we are in basically the same situation for SPI on the same
board. Specifically, this happens:

1. Remote side starts unpowered.

2. SPI bus driver probes and pinctrl sets SPI pins to their default
state. Importantly, the SPI chip select (CS_N) is high, which
backpowers the device (illegal).

What we need is we need to _assert_ chip select (make CS_N low) until
we know that the other side is powered.

...we can try to use the "init" state that exists today, but by the
time the SPI's probe function finishes, there is no guarantee that the
SPI client's probe function has run. The module might not have been
loaded yet. This means that "init" state (as currently defined)
doesn't help.

...we can't use the "opened" we've been talking about in UART because
there's no real idea of "open"ing a SPI bus. It's transaction
oriented.

...we can't use the normal "runtime pm" concept in SPI and start the
SPI bus in suspended state because the "runtime suspended" state of
the bus would want the chip select deasserted (CS_N high).

Using an extended "init" state (as in Micha=C5=82's patch) and
transitioning to "default" upon the first SPI transfer would work,
since we'd know that the client is powered by then. After that point
in time, if the client wanted to power the device off it could
manually assert "chip select" before powering off.

Of course, I'll admit that using the extended "init" state like this
is still a bit ugly, whether doing it like Micha=C5=82's patch does or by
doing something like the "unopened" solution that I talked about.

Other options for SPI could be:

1. Hack something into the SPI bus driver to turn on the regulator for
the device. This is pretty ugly, but would work. Probably not
upstreamable.

2. Invent a "pwrseq" solution for SPI where we run a sequence of steps
(turning the regulator on) before probing the SPI bus, like other
"pwrseq" drivers. Of course, most of those are for "discoverable"
busses, but the idea of powering up a peripheral before probing the
bus it's on is similar. This seems an extreme amount of work.

3. Hack the "CS GPIO" to be controlled by the client. It looks like we
could fully move the GPIO (including the pinctrl in the DT) to the
client. Then the client could call spi_set_csgpiod() after it's turned
on the regulator. The client could have an "init" state for the GPIO
that keeps it low and then transition to "default" right before
calling spi_set_csgpiod().

Of everything, solution #3 doesn't seem terrible. I also still don't
totally hate the idea of extending the "init" state... Of course,
there's also some chance we can figure out other ways to get this
regulator turned on sooner.

-Doug
