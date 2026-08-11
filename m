Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238E5455161
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 17:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467651; cv=none; b=NBujFz2uU4DY7tlA95HiRwNOIR6ho5oAtYrXDambHZ0wXm8d3TLv3f1uMGx65CXkrKrEMHtnJgLlIhDab9TG7HuWngS68AdkgFwdyDvfsg9gfVLYejB68LkJriKrlzwmSGCYZ9Axhidsq1LVSREPdKKJ8eUKtWOxE8br5q+3gls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467651; c=relaxed/simple;
	bh=MvVE5fCo/uk43S2LvkXxwzgaOyJn4uz4kLvIJ8hxgg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oukqKC2DMEDTDKJfKXlY3VJNU0n4Zn+DhaUSdWrYBowFxSJpdWDCQmYEF+XSiNXPL5OOrNWZpinEMUP9/w0uGAtbCes2DiqQBm6LxF6suTM/LoQFflfC7kDybkwmIqwz9Kig12mfpb7eIoEHMdt+b0Ca8NZLfyeSx8KvMgaLmqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eKi47+d9; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eKi47+d9"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9773507d36aso13868241.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 10:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786467645; x=1787072445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=elhOyLUazvaE0ZO/jAPeYhdWBT1Grfwgiid1+rrKxgI=;
        b=eKi47+d9ugXw5IARprA1xg9Q6miWLNc3kfjfNWfpfhBy40I9H/+9EFKq0TO+G3EdRQ
         Dps4OfoB7Ag01oQCkIk0tzd9mqGogDa21A/m2A+vgIPGYs9DearWUK/bHCSiHxTpviQm
         V0AYPlUgCEJKPSna0Xt0DXqXY3VGfaoXEHey0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786467645; x=1787072445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=elhOyLUazvaE0ZO/jAPeYhdWBT1Grfwgiid1+rrKxgI=;
        b=oejAKxKFUI2Hqq/lBaOlaNDDgbnLMvNGi+3kMzjp7pSBznthOeMqPF2zNvo/nLxUfs
         6Io0attaxunUL3ppYtMdtVvRiQe/6s+CtdT+mcChystr0CkAlWiBUenzs6Xf31H7Ajqx
         JdwdANfkMOyeYMbN0AJezTd+Oa3WtoGMjNEj3WWocL9RucXGcFhd/fuSlQI5E/cTcpnF
         4+0RSOBYnCCZ70homZfX8PSWX6qyj7C54Gz6ep/JkemvvFVDmYXMK9PELiqf82SRc7XX
         BW5ZlRFVf0vh7Boah/RIXcxeVdOLCg8TOstz85llga8HMxWeEg0fX/SDyMnv4drf2m7k
         7btA==
X-Forwarded-Encrypted: i=1; AHgh+RqkGzOz4r1s9pdHDcsBTMJSOkJIX7y2BpKlPEAIr1gEC1xP2y1tsdIOMonSgt5eZVmcIEL+pPKyb7RO@vger.kernel.org
X-Gm-Message-State: AOJu0YxEHD8gzkU5Z+3Nt6iuVTD6WQWbbd+FlQUgIJknsa+InCEC3qCX
	27334rhJIkhJEWO8Z2Z7wtKA/hZJK+VCGlh25RVSJ4L3ubJ0GZg5aJA0Q0Zry1aruGLuW6Y7G74
	G8+w=
X-Gm-Gg: AR+sD10gudTb2SRHbgyhYFCWLKXq463yzrFQl/Uslx9BcnKeU3+SBkBGlenrffp+7uv
	tET2eT8dZVwNIDtUcsZYDfcDC+dioSvvzUUgGVUGAHjWSMUCXYV4EJ4Ep6Kp5XiS0LRBxdosHMe
	cXHCtWFrwkdd6fmhCX6OYtL1tTE0f7mNPEq4qyHIrTIrdrA5brmXQgHPNP6YBdEWMMqLdgPRFwD
	WxnJukTDLrcN/u7NKx0B8dzVefNVa02zl/0ObMuwkrd1V3IPvCxzS3Gwu/fG2iJxRDtydXO1g48
	sXbWhER5kxBl7SKa0C7gCUyrOewA5BGeKaYKDiLcmC6UFw0rqX9h17ScQjAO2k5Pa5TVr88g0ag
	4cVEMxQ5NrEQjiaFoaq0hBEKQBYoZHRwv8wxfBFi8kBtRsDv42Mad2zu5PApsw6zLuW/ZVg8le6
	pPoNKQ4fdEYBo94vW4XDxNDhZWtFrDhcEPx39QdQqvAo8hTFic2C8OM5QyXVCaRfb7Eqj8Dng/f
	jUjH3fJb6hU/1LBmdC/Hf2/pcF6tSJwGRQYyw==
X-Received: by 2002:a05:6102:5f04:b0:74d:cef6:af78 with SMTP id ada2fe7eead31-76b5598e33fmr1322787137.7.1786467645013;
        Tue, 11 Aug 2026 10:00:45 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c45b516918sm224988e0c.8.2026.08.11.10.00.39
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 10:00:40 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-74ad03fa605so11374137.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 10:00:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqvCWNbd/GEsNdmB1p1NxT/5Hg8I+1CRftkxtj1poEWRYkfL1h6v407cvKG0twfu1TQb7nSF03BlqME@vger.kernel.org
X-Received: by 2002:a05:6102:548c:b0:737:2ce5:7b2d with SMTP id
 ada2fe7eead31-76b56fb7605mr1468915137.9.1786467638692; Tue, 11 Aug 2026
 10:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810130635.1166626-1-mkmkl@google.com> <CAD++jLnpZbmbZ_uQTS7pBdbmpvOZSy5+JsVP=Vb3HDhV8J-h4Q@mail.gmail.com>
In-Reply-To: <CAD++jLnpZbmbZ_uQTS7pBdbmpvOZSy5+JsVP=Vb3HDhV8J-h4Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Aug 2026 10:00:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UzV=G_XLoDZ4zq0ZPSQ3ttUDX9oBJUQrLYfUQ6v35nsg@mail.gmail.com>
X-Gm-Features: AUfX_mzzbBUmJa6CY-JNqz5oF7CakiwtOphskrUjp2MQpW4UkyJMPgOxTxyCIBo
Message-ID: <CAD=FV=UzV=G_XLoDZ4zq0ZPSQ3ttUDX9oBJUQrLYfUQ6v35nsg@mail.gmail.com>
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

On Mon, Aug 10, 2026 at 11:34=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
>
> Hi Michal,
>
> thanks for your patches!
>
> On Mon, Aug 10, 2026 at 3:06=E2=80=AFPM Micha=C5=82 Karda=C5=9B <mkmkl@go=
ogle.com> wrote:
>
> > During device probe, pinctrl_bind_pins() binds pins to their "init" sta=
te
> > if specified in Device Tree. When probe finishes, pinctrl_init_done()
> > automatically transitions the pins from "init" to "default" state.
> (...)
> > 1. Patch 1 (pinctrl core):
> >    Adds pinctrl_keep_init_state(dev). When called during probe,
> >    pinctrl_init_done() opts out of the automatic "init" -> "default"
> >    transition, allowing the driver to keep pins in the safe "init" stat=
e
> >    upon probe completion. Updates Documentation/driver-api/pin-control.=
rst.
> >    Board configurations that do not define an "init" state are complete=
ly
> >    unaffected.
>
> I think this is the wrong approach to this problem.
>
> You are changing the transition from "init" to "default" for all devices
> on the entire system.

I don't _think_ that's what his patches are doing, though? It's only
changing the transition for drivers that actually call
pinctrl_keep_init_state(). For any drivers that don't call
pinctrl_keep_init_state() then the behavior is unchanged.

Furthermore, this would only affect hardware that specifically has an
"init" state defined.

When brainstorming this with Micha=C5=82, my thought was that for a certain
class of drivers we could unconditionally declare: if an "init" state
is defined for the hardware, the correct time to transition away from
the "init" state is upon the first device open, not upon completion of
probe. Specifically, I was thinking that for "bus" drivers (UART, SPI,
I2C) that the end of probe doesn't really mean that everything is set
up and pins can be configured normally. It's only after the actual
endpoint driver (the one using the bus) probes that you can really
transition off the "init" state.


> What if this is not good for all devices?

At the moment, I couldn't find any device that the above rules would
break. Certainly I could have missed something.


> I think the right approach is to create a new custom pin control
> state for 8250dw, something like "active" or "online", and then
> actively retrieve this state when the device goes online.
> The "init" state can just be the exact same as "default",
> or you can just define "default" to be what "init" is and skip
> "init" altogether.
>
> Pin control supports any kind of arbitrarily named custom
> states.
>
> In wherever the UART is actually opened:
>
> #include <linux/pinctrl/consumer.h>
>
> probe():
> mydev->p =3D devm_pinctrl_get(dev);
> mydev->pins_online_state =3D =3D pinctrl_lookup_state(dev->pins->p, "onli=
ne");
>
> open():
> ret =3D pinctrl_select_state(dev->pins->p, mydev->pins_online_state);
>
> close():
> ret =3D pinctrl_pm_select_default_state(dev);
>
> + all error handling and stuff, see e.g. drivers/base/pinctrl.c for
> good coding practice.

Definitely the things Micha=C5=82 wants to achieve can be done without
changing the pinctrl core by using named pinctrl states and
transitioning at the right times. One of the solutions we looked at
together was functionally equivalent to what he proposed here: he
defined a state "unopened" that was a complete copy of "init". At the
end of probe he transitioned to "unopened" and then later transitioned
to "default" upon the first open, never to use "unopened" again.
Personally I didn't love this because it required duplicating the
"unopened" and "init" states when really we just wanted to keep the
"init" state longer. ...and I couldn't think of any time when a UART
driver would have an "init" state when it _shouldn't_ persist until
the first open. :-P That being said, it worked and wasn't too ugly or
anything.

FWIW, that is a _slightly_ different solution to what you've proposed.
In normal pinctrl usage the "init" state is a temporary state used
just at system startup time before all the pieces are together. In the
solution above "unopened" had this same property as being just a
temporary state during init time.  As I understand, the idea is that
the "init" state isn't necessarily the same as the "closed" or "sleep"
state but can also be a "safe" state to make sure lines don't glitch
until we're certain everything has been initialized properly. In your
proposal, the initial state needs to be equivalent to the "closed"
state, right? That may be fine for some cases, but maybe not
everything?


-Doug
