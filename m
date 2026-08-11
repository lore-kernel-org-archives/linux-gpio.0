Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3E83F86EA
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 20:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786479344; cv=none; b=ZU7x5MgnqfSo7aIk1BKw7wZR455bQxtavkSB7xR5Opv5BZ1JONU6MwY3wqll6ahZ8zwXDTIhdElus/NsAgSOgowd38YemW/a6SKRbIj8ilj8w5h/oSFpKNiWVWadd4P3ANzmw7PaIiL9PIsbeqEI2xBePlO22s6FVZgtx8uAi6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786479344; c=relaxed/simple;
	bh=CBrBeMUQW8d+i7L83djE5ZY0wiJIJ/OL03ZVrG4id0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2MFuswQGkcbwurCoo3SGIsuS/EbaCHnPyFHjSSSydP2PeCK4EePwWktpo589AQk4TW58GTdYuDTb4+iu0TLOiEu7eEaaBZPLgQYJNhgpa4UOmZ8KUtorvZGW4puvt9OQzabcX5mnQ68oIdLCXe8HHPsOs3aclsVNaNzkuDf2cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D4MawUVo; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D4MawUVo"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-979dc8b391eso127918241.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 13:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786479342; x=1787084142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=csDgwV25ON6IzhiyShbpMznG/bYKo4K3lwEKdXseO2U=;
        b=D4MawUVoazNGYZBbkpejBbJICelnIXiAkY+fkQqw5uhAVqvnXalLpCQdRxRXp82eZP
         Qc0A/rSYODbmF8DWh73hawTWTe6HLbSRLgdGnS2oDY8jFNRcFUpJ8C1qKac5YPn/6b8B
         bbrakfxzBwQH03wd6qvcabLtoAGk5VFmc6oJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786479342; x=1787084142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csDgwV25ON6IzhiyShbpMznG/bYKo4K3lwEKdXseO2U=;
        b=ZBHPVXcB+uJNMwebf6iOFIovJocrv9sL02n5Vh+vzEWICEmhgBIfOw+c46ttIBo2LY
         NjuJklIEtfiAk6jCU5BC+zoCJfVNjuXUeGXhjzC5ziDCOq5l+mScQLAKXBnMuKMiR3aB
         JDeAtZFg83ug8BW8sX1U5jZn+szhr1mQrX19RfSLGTH+/r5Kjti6QQ9MN/iv6L1SCPYb
         SGFbRBX2mhEPCFJm1rhRc9h2tiV3aFrHOZhx3vHy9i+pLw7HgGK6YsWwM/gHcKfZj2Q4
         nyELXA+lPKNQjzWRAgD2cfjQ2EXoTnzhc154jsG9vnSb1FJkaBpOmsua/adeXSK8x7lS
         XuPg==
X-Forwarded-Encrypted: i=1; AHgh+RoeqGxUaiBAdLSvIp1+/sxR5g6P8/FiP9J8k8ttjJNgaRBJvBMvdKtrcoCr3IDNy2gzzO9q8ciB5WXD@vger.kernel.org
X-Gm-Message-State: AOJu0YzUJ00+qTLH4pHUff660K6RRRkEzEezn6GkO645qr9HSGovyIjE
	qJWr+SV7W7FS7/Hmyc7CRymUWj9LkkCgKEAnWCWq5/m1hIE1x33CTBFXGDihssbJy2ti0bzoE7q
	FSSY=
X-Gm-Gg: AR+sD13INcfAdE8ugX6w4mnMGxh367JboAutxBgUunMBK5a60HtSmSmqkmyADAca2Wd
	J5WDrpfEnYEGnOL5koFBje6gHTFa4N0qn4E2is6HC7CxJLvTkOR6n3M3p+ty1ndHF7JrVj8Xujj
	RpRAEIXOq1EpfkB6+ivOrL7a1w5DMQ2UO0Atz3pCetgj8YpLGYv34L+0ns5szvptN+dm/hjsegW
	XvCQt++e9YUfytHzjt91JCEkvEXuLYy4LIUgUb3nR7Jxz5pOxEJYzMWABOhYXqtP6mv1/pliX9v
	OncyyOLY7TM7gBoiXjZMkTO7yfjonj3Coluv+TRAtR+JIub3I7QsqHLg781E9QIia9FLyOLPp+c
	Rmoz6QCSCvX5bcPYfQxAUhAYmisJ/kgDZQ8eCmDzDNQclz4DHrYKwOuBnD9eYYcIqJ91C257tD1
	TPZOJc0k9HoQMe1X/XeYvmME9sXxv8SMVAIMiQ4N5h7hjj8PpeNLjJEkPVB+1mXFSScLIQMTHaA
	qLpPL2aEd4D8ToikewqZUn8dkQ=
X-Received: by 2002:a05:6102:504a:b0:730:db02:1d08 with SMTP id ada2fe7eead31-76b570bbdc2mr1942333137.10.1786479341880;
        Tue, 11 Aug 2026 13:15:41 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97a3c28e739sm649963241.9.2026.08.11.13.15.39
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 13:15:40 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97723f98735so117026241.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 13:15:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RorOPsctUrYyPbZ7DHfMGqOVu48dfAUFFQG54ZDFNM6fyLFMDe6WDRmnH8fwxP8eAywY7/VHesHaez+@vger.kernel.org
X-Received: by 2002:a05:6102:1626:b0:74a:9ac9:792c with SMTP id
 ada2fe7eead31-76b579db0b4mr1852833137.12.1786479338699; Tue, 11 Aug 2026
 13:15:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810130635.1166626-1-mkmkl@google.com> <CAD++jLnpZbmbZ_uQTS7pBdbmpvOZSy5+JsVP=Vb3HDhV8J-h4Q@mail.gmail.com>
 <CAD=FV=UzV=G_XLoDZ4zq0ZPSQ3ttUDX9oBJUQrLYfUQ6v35nsg@mail.gmail.com> <CAD++jL=WmAJNotpxqQkE9Yf3COxMcj=afDVGB2zi+ZN+mRocAg@mail.gmail.com>
In-Reply-To: <CAD++jL=WmAJNotpxqQkE9Yf3COxMcj=afDVGB2zi+ZN+mRocAg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Aug 2026 13:15:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UoZ=CoUdku5aaJr9uihxr0Q-Yj4UQeQtYeODMzku7LkA@mail.gmail.com>
X-Gm-Features: AUfX_mxLuhyep_tioCHiLI3wXMU74EnJM_j562N9S8uWZwg0VDx18C2jCKFt1po
Message-ID: <CAD=FV=UoZ=CoUdku5aaJr9uihxr0Q-Yj4UQeQtYeODMzku7LkA@mail.gmail.com>
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

On Tue, Aug 11, 2026 at 11:47=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> Hi Doug,
>
> > > What if this is not good for all devices?
> >
> > At the moment, I couldn't find any device that the above rules would
> > break. Certainly I could have missed something.
>
> No you're right, nothing breaks other than the that for one
> instance of a driver the default/init semantics change.
> Which isn't elegant IMO, but it works.
>
> > Definitely the things Micha=C5=82 wants to achieve can be done without
> > changing the pinctrl core by using named pinctrl states and
> > transitioning at the right times.
>
> I think we need to do that. This approach is a hack, it will be
> hard for others to understand and lead to a lot of questions
> about why this is done and so on. Better use a custom state.

Sure, that's a fair argument. To me, it felt like adding the extra
state was more of a hack / working around the pinctrl limitations, but
I can certainly see both perspectives.


> > One of the solutions we looked at
> > together was functionally equivalent to what he proposed here: he
> > defined a state "unopened" that was a complete copy of "init". At the
> > end of probe he transitioned to "unopened" and then later transitioned
> > to "default" upon the first open, never to use "unopened" again.
>
> I think you should step back and thing about what state names
> are the most relevant for a UART.
>
> Why would you want "unopened"? Just use "default".
> The states are just state transitions such as any finite
> state machine.
>
> These are perfectly fine semantics:
>
>           open()         close()            open()
> "default" ------> "open" -------> "default" ------> "open"
>
> The device core doesn't touch the states after probe()
> so the "default" state can be reused without any problems.
> No need to have any "unopened" state.

The idea in my mind, at least, was that the state of the system isn't
all that well known at boot time. The bootloader may not have left
pins / peripherals in a consistent state. Until all system components
finish probing and finding each other, it may be hard to know the
correct pin state. It is during this unstable period of system boot
that I envision we'd want this "init" / "unopened" state. After we get
out of the uncertainty of boot, we'd never need to go back to this
"init" state. Said another way, the "init" state might account for
some uncertainty about the state of the device that the pins are
connected to. On the other hand, there should be no uncertainty in the
"closed" state. This is why I was thinking that they could/should be
different states.

This all being said, you're right that we may need to take a step back
and look again at all the options. In the specific case Micha=C5=82 is
trying to solve, the "init" state and the "closed" state probably can
be the same. Thus using a solution like you proposed can make sense.

One thing I guess we'd have to work out is whether we'd really want to
use "default" and "open". I usually think of "default" as the active
state and then the two common states "sleep" and "idle" as the
inactive states. I guess looking at all the states, maybe you'd
suggest:

* At probe time, select "default" state since the port is closed.
* At port open time, select "open" state if it exists.
* If a port runtime suspends while open, select "idle" state if it exists.
* If a port runtime resumes while open, try to select "open" if it
exists, or fallback to "default".
* If a port does system suspend while open, select "sleep" state if it exis=
ts.
* If a port does system resume while open, try to select "open" if it
exists, or fallback to "default".
* If any kind of suspend/resume happens while a port is closed, it
stays in "default"

The above assumes that if a port is closed that it doesn't need /
shouldn't transition to "sleep" / "idle" states. That's probably true
(?) for any port that defines an "open" state, implying that "default"
means "closed". If someone only defines "default" and "sleep" or
"idle", though, maybe they'd expect transitions to "sleep" / "idle" at
suspend time?

Does that sound roughly like what you're thinking?


-Doug
