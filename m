Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794060394;
	b=Y7qrv5tUmUumnqRww0TO8TGkfWcKjslEeF588u1UIHCulIVJmBWh555pOTBS4Pg7JXYW
	 ww8nQY/m5PwE97Rux/kGgVjGXgV2RF5BVqd+bajKDF3cqZGtoc4Ck0RmCDfjq7eq40k3I
	 AJdA31bI1T/5br/na7xncjU51TMnngDD6KO9hgugn6+N+r3hYEoG08UtbWNSEgGZdGaJ7
	 ts3ekehOTS8adwKc1TQX8jEK3H7hR0HzGIscw/GH1SHzq0hWrBa4HxrTsjvssJ16e1hmA
	 o8TTPmX9n7IpS7RcN2v/LSBpPkEQVgkiI/7KtwgFtTRjrHAbIQb1uKy6N7+/7R+qjsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
	b=TSzleDJrXvSqwtdG9G9MsIW907CmDIeC2GRX97w6MFmncz7ZQDtPgrGfVLb9rm1RzMi9
	 raAQ4mHcWaK6vfiEtoKypfM9tVJjU/UeXhPWv6JmPyYeSb8E39xusEOf+VUNcGnheu11F
	 H81VKYD4ZE+17am9Ufs07PyGxIPAEWgtGqCJWWetICSjcncHwsLiyMqc+B9KefVBaAabQ
	 Hg/xBn7mfpqBBljXufb5PUje0rustM5iOcaXH3I0GPAO/Pq+bWAOgUMjK2IieLzCuUNRs
	 Ae+fUZHYznCWF1hRqsTZbVkHcZbpLuz18FzHBtl90tiQ/lLyIvSV7/yrPn9sYpHFWaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dDBlyIAS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A05606D819
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 14:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A05606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dDBlyIAS
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so971591b3a.3
        for <linux-gpio@vger.kernel.org>; Sat, 07 Nov 2026 06:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794060393; cv=none;
        d=google.com; s=arc-20260327;
        b=B26CEgkub27VkHEzisJIcjsxvBPtnGtEUnrWkclgb2KaPosAxVSDJRSlMxXoNIFpt1
         Dbrj6IkPqgVVm7X3igQS5sjWGPMrfKOg0YwW+cPdwMobRS+PXqowYBcnacr5myrgDfp8
         zsLAyVvfF4XuWtE3CrVLBrThvqQmqLqw6vX4u19PGjjdqjt77I14XV9Prd5Lc61VjQAF
         /aSl4EWUIpeHXvdgO9mieJ+0bW4bN/Wcgf5uiSBqXFQJyvpbG1ILVomaZHTLOHtRPVlB
         OidqAMIDJvqMpDmNiToqWEM6NRoHmWULeBHZ97CSSuuaBahDg2/nXOK+LEvUqu3TF6WN
         CSXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
        fh=54qUAnAS6A77PxqrVo9FWHnOis7RrFmRdwl3ALSssZA=;
        b=emHE0qzHQcpNvV8tdpucKcrhfPEEnArPArg3u1xCVTs1DDRnceuhi7kAcuFxIYeM/n
         ZJ+UMFmRyy/Hz94ddj2KidnyVFmstH5h9ViZly3oSJPlR2HYyAdqSktgodOEivsOWzm/
         7UUWaXSQecBovmTGJwaKCU6agpxKWahL/ZmB9OOyx3JP9pHdWTb0d67ANHJjsVoGTkO+
         wa0J3WbGrLUdILzdkIDsrCCtRr2vqnjJ1I8Vdt9yjs907BrHGxEDdtvgCHx0wfkvjBUA
         QQicVELIVs8sJwLI+zg6/9ap+WZYZLB384SZDfg9TvcK3pyBLMiOmA5X/mccz+Fujljq
         mCEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060393; x=1794665193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
        b=dDBlyIASGe87airtRsC6OYAtSLt8d6JrbobgkmqzvHZG4f9MUAgKofmlBTqz06bmf7
         X6/cLnOfY0szRdLNS3X2edK4IKxHbjdDSXYPSt31ow1YyWXi1Kqjjm0QF8nHW2t4qXvA
         0NYnlBfL3p280jC12DBHa5hRcP3rn5qi3RG7leKLPOtEEwGOwBz4i3puzoxLu0A/ERDn
         tEb/Fe4tigaNJLz1eYJOyd+QMI2kRSEuRujtP7juCjFLv+Kx9QXavedEeGOPrXGBfMZd
         CXpWZX3fCI3edsCjV2z66r0g7h11SLsxjerD+lVx8K9D+fefPaf9swx/sLCRgFYnFBR9
         wFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060393; x=1794665193;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypt0cQgotkEVzYhfQB+Vym5gYPVJrJp3QalT+ngA/vE=;
        b=ToDQdIug3QT3ZxCMNtC4SS+TKM68NTtH6SUptGlVbejwiAgxnwQ5VjuLaSP8vGyWsa
         5X55Cmfw3jc2pZ7Od1sD8lAlPRazAWAMtkGj+tr6EG8nZ5bnJ/5eaXXDHBop4jsYcJs/
         bB4BOdvqxv9kursKRxvIU1lBmQ2N3Upxq3xn6kbbVEISPbKBy+gvNMRsi4oNGdj/ZMnd
         x8j0MV/Npf/AJzk5vz4FadOg0xQoqPzTfi0iYOwwLGvM/4PZ2nJuGhG4rWiwqu/FOzHV
         nTGq300WntR8YoTWUHfhBI86zIiFvPHGJNNcEWeSz3w8zYRizqpsrNqCpAuVkC0RPHiT
         5gxQ==
X-Forwarded-Encrypted: i=1; AL+hErHz/sXT8fo9N4l98JNlpefiSIn1+zbYEK/5OSUZ5QYdpbakiKpTuSxAUMD71526LrWgu2ybYCQ3fMPG@vger.kernel.org
X-Gm-Message-State: APuU4Z/2rCUqEI+5Het8xGMP2wPltOXsoiphdSdKjZnD0b6XDbEt1s1F
	iq8X1OjKQQy4QxmVT8O4h6azaMfl9Dw55MsCa7QpGQ8fiDI3ftnmX7Y6pyIQzRFNHrHKpdYss31
	T8zGrUvuDTKHz3AGsPhImvSq2FNsIULY=
X-Gm-Gg: AYBFou3KHosz1ZziByGV9+ncIta0GBBJOpo3AM72JE/Py7ZG8a2fCqGHcqjSZX+E2AN
	Bqbeb+KoJ3qZuZ41wyIRPEGejFLQU3SW7lgnsPMayOPVJccL52Asg5wRm4I2gkTHZuT+QWwLbqi
	j5HbrsxfGdw6uC9CQynMgdiUifgFInENGl4v07Qoh69kTB/3vGZH7AMSh2tJY3AAo+T8R5D0PxB
	MnX0isANo0QIjEqm+t5oJejrU8iK955jgovhMQfDxPoxOb8S7IWfJSW+kAfN6/P7JP8dmOnP0jq
	GDA1f1Pd/WGAyt1til9B7ObE3vFQuYgXNRzOJrw8OEm+2L3UTLe17DpkjZnc/jSd+kuA7wl6fBI
	cPxARwJluGkn/tzMlD9N0u871w4Hkvca8ge2QObqPRn+NOvmIoG5HvyCUiXi0ir1d5iyXYyKDL7
	fw0k7+z7wsY2/p8o3iGiRTfldtR7FM5VEBZdeksSeefCn5DU50swrfJgmoLGk9P8EMT8mjxQ7UY
	e/0Sab1tBK6D4c9roDKA3ABoCUHIAPj03trXo4/wq+dBFXSVsifsOB2rlkqUQ==
X-Received: by 2002:a05:6a00:13a4:b0:8a0:21b2:7c7d with SMTP id
 d2e1a72fcca58-8b37525709bmr5141902b3a.0.1794060392907; Sat, 07 Nov 2026
 06:06:32 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793876837.git.alx@kernel.org> <cover.1793882260.git.alx@kernel.org>
 <qwpovcqznx6eltou4inmj3v62qhh6ouvihqnze7bobnd7lmcbw@rcri4e623icb>
 <auyOkL1Vb1iKicS9@devuan> <auyV47xUCr1EJ7A3@ashevche-desk.local> <alpine.DEB.2.21.2611070239050.17804@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2611070239050.17804@angie.orcam.me.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 16:05:54 +0200
X-Gm-Features: AclHuK-WBq_EIF1I_SsYN7csCkMj3s3jbsrjUQ08xBHpkztbklIxJpPZrjAee2s
Message-ID: <CAHp75VcVT2kQO+URZbrH_3-A=4DMZU1KfcQsjDf6bNdtjf=t+w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add strprefix() and fix a bug with it
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Alejandro Colomar <alx+linux-hardening@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Alejandro Colomar <alx@kernel.org>, linux-hardening@vger.kernel.org, 
	Andreas Schwab <schwab@linux-m68k.org>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 4:42=E2=80=AFAM Maciej W. Rozycki <macro@orcam.me.uk=
> wrote:
> On Thu, 5 Nov 2026, Andy Shevchenko wrote:
>
> > > But yeah, I can send them as separate threads, if that's the preferen=
ce
> > > here.
> >
> > Yes, in Linux kernel majority of the maintainers (a bit of speculation,
> > I haven't counted, but it feels like this to me) do want separate threa=
ds.
>
>  Cf. Documentation/process/submitting-patches.rst, section "Explicit
> In-Reply-To headers".

Even better! Thanks, Maciej, for the pointer!

--=20
With Best Regards,
Andy Shevchenko
