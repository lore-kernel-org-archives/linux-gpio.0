Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919D4411A18
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 16:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994869; cv=none; b=a2mNKt3xKLbsVWQ9RjAz0wIWWgFsi5JvywY+vfePvni6NxxAAQ38WNHYK7mogFZmNoIqCEn5NZ/+IBpA1F8WfdQw4CcpxZ+fmRSQeIG4qi5dVPh50ejdqXmLkLAlNTNLrVV+uKeGSUR31ufNzbeAZuicSOBO6Ong7K1uswjbhu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994869; c=relaxed/simple;
	bh=P3+kOL1y2nv1UhzDI3hBIeFZ+qnuxfwB9W3emUPgCGE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ZFwjNEAnfwIDMR1LXQ+cUCq+evRaARcmMqIYLUQ5rOBWysI0pfYqWV6H0ax5k0FW6JbDiW7g5FdlbQJM/PRRLFW77m7sHtma0PHp1vD0QJLn28TRnCqA9ceDG29jlC1DmWc6bf1BnQioqWgYDea/Lfwa0el4V0hUr9I7m/9iRvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAZnYwE+; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAZnYwE+"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac847f9d78so58792a91.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 09:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791994865; x=1792599665; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P3+kOL1y2nv1UhzDI3hBIeFZ+qnuxfwB9W3emUPgCGE=;
        b=PAZnYwE+Dstuux6bB4LXq6Uldd2Te10BQgI1YZL3P2o+AbWwKVs526yGHFXALkDRLk
         lUR2So0bMZnVLOTquUQfSfi3RoixIWXlpPii/G8nbg4H+jxFliaE4429mkVpBGMZCaQU
         C9zlT2GD8elQBy6VVTM/GYGfJG54gmyXEvIhQU8Uv7/1QwYQpiwTWojGG6ZcSWkZga8r
         qNR1xvEzP/DIEgQPnIGc9ZEllvPyD+NSNHZHmpu4a248FuFrxryNHY/aUPYh7PFBJUEW
         v+qKuZHLSlIRLcjOuoE0Idn/nP4gAdThfsELhtBka0FPUBD7mx0WodhaHt6WHF4XNnxh
         Y6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994865; x=1792599665;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3+kOL1y2nv1UhzDI3hBIeFZ+qnuxfwB9W3emUPgCGE=;
        b=aouPZ1bPjjmXs7/XsQBm7AxgpYT2oCcyhNRgdTXtc+uk5fxClJc/hQHSt+1NdL9xnx
         vAdQVdooXA5hzzVHSiSWSLGhNsqa1O6GhhVqeb/ulASvpx0toqgDDEUnRfC/aJ8nyf9l
         8G8BkX1g7bAZt3VUqtNSWWRIubVLUjvxxIxTUz0yA+aWbVG7rTJOxv49+YYhpgyl+wgq
         oU5olJF7HhzTtffNSoMZy9LpyOxL724JE7rVTrj8sDtOsolncOj1YbR8Q3VLUuUso4XT
         RyrB942ckLlplL8ZEbEgHHCvY4od1hK5FLbZgb/PasoWswyHK9ENflb8sEklyJCjyuiD
         o21Q==
X-Forwarded-Encrypted: i=1; AKwUvByCun3OgAL/5f/XYHd67Ha3SRB+iml9B/BN/kAX7zJldNRoBStiJshBrk+ng6TqKhlE1K9aa/yhOs0A@vger.kernel.org
X-Gm-Message-State: AFq9FYIcbyWAYa937wJttgqdAAzbmV25piwcxdkTijShyfm3HNZYmI49
	bTOsleSRX5dlYvnnHyffMjXWsLDjE+30fwOzhsyAsEBVw6bpK0KNBaeatQ3SHt5A
X-Gm-Gg: AYBFou1lI7GnZPY+cUZoARlNzufZyg78WgQDUXUAfJvWLQ9DnO539Y6LCpmwGVEBQi5
	moVGZS4sYbq1gRib6YcCa9zGiNI5903s0qAyOS4ZKKUPMtR2TkkifmPQCR21k8eproLg+WAZpuh
	vR05oxrFj3R51D5RwG4dWOxb5IzKAVZ2Y9DVcUspI9ktjhc6JK/B2ToFxEZaGV6WEJxMDQopptd
	2zxVuyv8vJF3z333JgBlFb82KntSARZz15HUtXq8nvOTthbfyc+cwI29RKV3ZXa0hrlFwiF7flF
	zehXqYytZuRR/bIMvh334iLee+GcKd+CoTwTLly8A2y3mXPifJ4tKaYorJDVEue1aNuOHC7B7O9
	1Z8TZfOQwqLFZm0rBGgbzfRgpO8UWT4bEBhbm/Z+LJQJB1WHWs0M3oYmUC+bttdCDhIZksVXqKR
	HnLn0nWsN5tpX/DtcG7WOp8ProW/H8hpgKxDrlDIXAlXI2y7fi2DoIlPe1DHSTGeYc1pkzWuul6
	b9kKGPsylEtzbDH1+k6vxHSQ6Vf+/8=
X-Received: by 2002:a17:90a:d44d:b0:3a4:9d98:f980 with SMTP id 98e67ed59e1d1-3ab3a3b0c61mr24024340a91.1.1791994865254;
        Wed, 14 Oct 2026 09:21:05 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a1f906sm335949a91.0.2026.10.14.09.21.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:21:04 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v2 0/4] gpio: loongson-64bit: add interrupt support
 for more models
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <CAMRc=MeW2nR8W3_4266N05p3Oa1WPNJhA92+T3miXQ0k5CsyJg@mail.gmail.com>
Date: Thu, 15 Oct 2026 00:20:49 +0800
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Linus Walleij <linusw@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <317E251E-9135-4376-B813-74B8A748FD72@gmail.com>
References: <20261002-loongsongpio-v2-0-6e3eb150a4ef@gmail.com>
 <CAMRc=McnDBO6OZx6p9HGHn=Yyt8ydD=8Z=zYZvYvuy-_DUq6tQ@mail.gmail.com>
 <7D6EB1C6-0CCB-44F1-B698-89B0479EEDA2@gmail.com>
 <CAMRc=MeW2nR8W3_4266N05p3Oa1WPNJhA92+T3miXQ0k5CsyJg@mail.gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B410=E6=9C=8814=E6=97=A5 23:33=EF=BC=8CBartosz Golaszewski =
<brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Thu, 8 Oct 2026 12:21:43 +0200, Miao Wang =
<shankerwangmiao@gmail.com> said:
>> Hi,
>>=20
>>> 2026=E5=B9=B410=E6=9C=888=E6=97=A5 18:04=EF=BC=8CBartosz Golaszewski =
<brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> On Thu, 1 Oct 2026 20:13:18 +0200, Miao Wang via B4 Relay
>>> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>>>> This patch series aims to correctly add interrupt support for GPIO
>>>> controllers found on more Loongson CPUs. The GPIO controllers in =
such
>>>> models do not have a complete intgrated interrupt controller, but =
choose
>>>> to delegate interrupt handling to their parent interrupt =
controller.
>>>> This sounds like a heirarchical interrupt setup, but what makes it
>>>> more complex is that multiple GPIO lines in these controllers may =
share
>>>> one interrupt line on the parent interrupt controller. The details =
is
>>>> described in the third patch.
>>>>=20
>>>> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
>>>> ---
>>>=20
>>> The series looks pretty good. Who is the RFC addressed at in this =
case? I can't
>>> really answer the questions from patch 3/4 as I don't know this =
platform nor am
>>> I well versed in ACPI. Maybe Cc the GPIO ACPI maintainers for =
review?
>>=20
>> Thanks for your review. The RFC contains two questions, the first is =
about
>> the firmware interface, including FDT and ACPI; the second is about =
the
>> way handling the delegated IRQs.
>>=20
>> Regarding the firmware interface, it is to be decided how to declare
>> platform irq numbers for the GPIO controller. Such a GPIO controller
>> may have N gpio lines with M parent interrupt lines (M < N). The
>> firmware should a) list M irq numbers corresponding to the M parent
>> interrupt lines or b) list N irq numbers (which might be duplicated)
>> orresponding to the N gpio lines. Previously b) was chosen by the
>> kernel driver. However actual ACPI tables found in the published
>> firmware chose a). The discussion about it happened in [1].
>>=20
>=20
> Unless it impacts DT systems, I'll let Andy handle the ACPI part. =
Please Cc him
> next time as I pointed out under the RFC.

Will add him on the Cc list in further revisions.

>> Regarding to the interrupt handling delegation, since there is no
>> complete interrupt controller integrated with the GPIO controller,
>> the interrupt handling, including detecting edge triggered interrupts
>> and masking/unmasking, should be delegated to the parent IRQ =
controller.
>> I want to check if my implementation approach is acceptable and not
>> violating any implicit rules on the interrupt subsystem side.
>>=20
>=20
> I'd suggest to run your implementation by Thomas Gleixner because =
directly
> accessing the internals of the parent's irq data looks fishy. For =
instance:
> you call irq_set_type() directly without going through __setup_irq() =
->
> __irq_set_trigger() which does some additional bookkeeping.

I would originally tend to avoid directly calling into ->irq_set_type() =
and
other handlers like this. However, the IRQ subsystem does not seem to =
provide
APIs to mask, unmask or set type of a given IRQ. Furthermore, =
__setup_irq()
is for registering irq_handler for an irq, while in chained irq chip, =
however,
irq_flow_handler is needed and should be registered via =
__irq_do_set_handler().

Cheers,

Miao Wang


