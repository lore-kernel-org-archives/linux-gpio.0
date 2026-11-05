Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793849781;
	b=l+J0pVx677PclM12yhk8eqlHHKD0bogk5CSiJL9urTPb/KoY+RADXkCbAK2xczD2+lXh
	 3j/tjTJePPgTv2WIcAl9PFQnm7gC9mMmj4rVkzZl7LPj6RAp5TSXGEpXl4t3+C53pNEcJ
	 ezBduIfwR88kV6KyQTjjhZC8F95PHzvM6vN9AUMZwGd8ReVFCPPfYYJunKOL1RIOFLTcY
	 QQo7vLcCtLyMjY4V18hnRuAkN2wD6sAsjs5wy/EYRAZ+QkayQJb3dP2oqCYxlq3m/MZZG
	 AmIY2Q9UEEQO0/hhHu6zcnOCb+1EtcqErwFo9FEXxjuqRVd0C7Gc1ok4rOn4w81tVsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=;
	b=5jvZOdu67OJU32X8m1ypTiMBDXm15v1O7DBsh4ikZ4HOVowwdKVEHXLDvBW6Cxk5VrKv
	 /63pHMmfOQarOu5MsZ02dUKztvyfnsUQTH3FjbNy9qbpIxlVngxMpS2V6TBSUpqrNeISY
	 G/S6YSGGKo21BMJ+QTIKDhRr5UJPg/W78qwL7ahWEOTCXgC4WLeGJ5NKfgUj1gwQpfJFh
	 RWKufMmD97tJIisgueL2q/GVDt7AV5DUjZZHIVN8gj3Fzsw68qOoMPyM142FIxQO3e5dn
	 4lDn21N/w+fOlD3IgsQEMP/taiUahrrZH61YKrf7HyqYOGiQCiMMnavI2Vl+zWYiFVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PWydMd0/";
	arc=fail smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D86606A326
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 03:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60D86606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PWydMd0/
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b31448caccso11973117b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 19:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793849780; cv=none;
        d=google.com; s=arc-20260327;
        b=JlvXzoIw5HcSw+Um3CZWCCXJcq36p/M8P3cPY8ZlCOmDW4yFMVbZHdOlQMgAxS8Nvp
         nYlBUyB/NorxznnQAFiVDny4L8VAOIb22p6wVU0t+cvM75p58ltXh3CTRW+kTEYMSfQG
         bZl2ynkUyxw3BORdWxXfQUkppL3GTQIn3bCmjJEpM8T42ZnAGsZwns40S4Fz3JrUQbp8
         RHfkDEcVE+kav+H6lsWKojznNwcqmOkZgCoyW72D/V0ULmnF+qGOD9S45tu0vZj+fIwl
         uCYc8KhMWii1nDutAH0sdqCyE4nJxVzo4qjPt3x+I8lQVXue3SgQ1tdNN5Px51d9zmaN
         jmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=;
        fh=FwyXWVmo8pwoI0HGQs0FpBWHcLdO32bJhT+5qNhkb+I=;
        b=JvflGETArK+Psqhvdqpg91PP84GhJ/VSPT+6/OGFLSsbXF0OuIhnWxORdrp6sfTPk1
         B9mPv1H8B47yAjxhoEr4VqsqxrTDKTtJRLnF7TTjv+CP9rdzCyt5RXp56Mmay8XrCSb/
         YJbq7Np7dnWExucyvBpL55ue35nPaYx6oszu0fN54n5Fr2nEo1mJNuVTP4vWsf/sftyn
         D5mCcnXrNzYJXX9fCFk+UVyMV3zYGqX5+qqLry48pUpKEOKX7F1bKYH3u0nth5aPJ8ws
         uZqrwWS8Be+XZmFwtq6sKvcw0/6jZSggIv3pOM8ByQtFnymbU08G79Ex1H2bsOHotKBG
         VqTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793849780; x=1794454580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=;
        b=PWydMd0/qHcw0ikwrmSLutinb/TW255AUxRRc/NxN4adzVLE9mG09+m6xR2ygnk09P
         zSM1850uxbDu5Ok9yQHvkfFKavi0OSwVvy7p5f+q46KmVYpjletiDK6X+SK8dwv2v0Ub
         kZtrZMZ1ohCWRB4k/KvZMXd7Gc/i3UKtnXgcQAKJTfqPSDEJvsgil3zgSfCX+24k80yM
         3OfvtTErDkLCi08pLhAE6wkadoOWJVlO5rKhcpVLUyZxBw0Jn7t6ildYctYMl9r2Wzuw
         vOiD6mtm2wlPPDgNiIT7H0E4BwhFPxWgKDznb/lekU63GSIznpIbzT4iUzk737Lfbm2c
         m7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793849780; x=1794454580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5B9lX6DZI5S1tAfFM57GnAbiozq6dSyTVBcFVL3BszE=;
        b=d22GYE9JOYpIB3DuR2XJFQQYuARARk4zaYelrYcxrngLhfpH2fN61rRjA2Wusy/Ljg
         XFBx2M7qNbCoiL8TzAqttcjg4rviWBDELq+yB7hXFnD3zeW+O4gvA+fgmSYTqw2QT+le
         lcAAV/Ms1QJfk/XWoVvDuIezvzGJ/DzVWxSg70vv93gOG/MA0oo2dWQdmnMl9u++KDj+
         /vVDCiBjfHhndslQeCwvsCfkUCbr0fW5jbGgPyRv5K1LY4EsD7eKgL93p2azuIN5mqgh
         8+sFdo9c8p4w/wh+Ct4FQcZCwaAZObFxJQzD2W6u/nekD93yEZYIB38TztTg+YNXLiRR
         kgUg==
X-Forwarded-Encrypted: i=1; AKwUvByTsGRsxnyU/IifHMdBLs7dbvekeeptAkyReo6Jj7+j7chn46zOTnUYvKZ3Zm7L6hzjAl1e8CKDi4if@vger.kernel.org
X-Gm-Message-State: APuU4Z/NZYWPFyox2C7bjP4YuwGlIJsbzzgZgoMLnHXMayoCHZoaOzzE
	+/pmTVxFo1c9wwkdrJTKY0x29On71u8b8qDgG3GOf/yQIy0yQ7m88yEvlqTJ2dnIpGJuiUhyenU
	Fd46hVdEDq9vnkQGxN9oNWnsMnfwd/nc=
X-Gm-Gg: AYBFou0JBA3WwPQb6c1FlWsmfJ91f2Ns6XAnc1pobIESWSIdp1T/LZIo/oInPWNG/6s
	hkIaYL9LE9nSNoedIbkfCQdwJG8ALOZ7p3adZH5o2r+ugKh+TxSpnl9KKXPucOKfe4pLJVEv1bz
	yC24cBz1FxYp70qVLpwXdvXXclbAULKIwiVnQHs7SMOnYMh+7DW3HntahHPy9Bg9SXyw9AOQixZ
	jS+zAYZNvrdUPRORcF7iIPlO97Fse2ThIgN+gWNExMBZKeQ63eacZ+mG/CBbO2YcXgIk+1K7KTe
	yqwgyCohqQf5C3UlezbDsLfChl7KBZj9AVVHBipeg1pEtzd0la1drZ8sazOP6mRZR4wIxuQFcJX
	MjWJ4pEkOS+2Ll3kTKT6smSvg++HA4t2Ridgacg==
X-Received: by 2002:a05:690c:e3cb:b0:8b0:e385:edc3 with SMTP id
 00721157ae682-8b2b6719311mr132765087b3.33.1793849779988; Wed, 04 Nov 2026
 19:36:19 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com> <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
In-Reply-To: <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Thu, 5 Nov 2026 09:06:09 +0530
X-Gm-Features: AclHuK9YMOK-xz_gxOFW3IfSoWRvHeDrckSu5fgcWiOJM4mFO9QGiU-P0B7A4RY
Message-ID: <CAMFFDGhD4K6PN8G+c-hQAL6RG9sVkjo6SXHB5===bYswHh0aTQ@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: Linus Walleij <linusw@kernel.org>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, brgl@kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thanks for following up. This work is still active.

The October 15 GPIO-request callback was superseded by RFC v2,
submitted on October 22:

[RFC PATCH v2 0/1] AST2600 global GPIOP passthrough handover experiment

October 22 RFC v2 cover letter:
https://lore.kernel.org/r/20261022024314.48623-1-prasanth.padarthi10@gmail.=
com

V2 transfers the global pass-through selection to per-pin SCU4BC
controls before pinctrl registration. It also handles SCU510[28]
through SCU514 and restricts affected requests if handover fails.

I have retested this implementation on B650D4U with a newly built
image and GPIO-only x86-power-control. Remote power-on, remote
graceful power-off and physical-button power-on passed, with
power-good transitions recorded in the journal.

SCU4BC remained 0x30000000 and SCU51C remained 0x1c80 across the
remote power-on/off tests. Electrical continuity, mixed-pair
forwarding and fault-path behavior remain unvalidated.

I will verify the requested base, rebase the October 22 version
and resend it as RFC v3 for renewed review.

Regards,
Prasanth

On Wed, Nov 4, 2026 at 5:49=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> Hi Prasanth,
>
> On Thu, Oct 15, 2026 at 5:51=E2=80=AFAM Prasanth Kumar Padarthi
> <prasanth.padarthi10@gmail.com> wrote:
>
> > On the ASRock Rack B650D4U, requesting GPIOP3 through gpiolib does
> > not provide working host power control when the GPIOZ6 pass-through
> > strap in SCU51C[9] is set.
> >
> > With the existing GPIO request path, SCU4BC reads zero, but a host
> > power-on request through x86-power-control times out waiting for
> > power-good:
> >
> >   SCU4BC =3D 0x00000000
> >   SCU510 =3D 0x00000000
> >   SCU51C =3D 0x00001e80
> >
> > The AST2600 A3 datasheet describes SCU51C[9] as an additional
> > pass-through enable for GPIOP0/P1, GPIOP2/P3 and GPIOP4/P5 when
> > SCU510[30] is clear.
> >
> > A diagnostic experiment that cleared only SCU51C[9], preserving all
> > other bits, allowed the same GPIO-only power-control implementation
> > to power on the host:
> >
> >   SCU51C: 0x00001e80 -> 0x00001c80
> >
> > SCU4BC and SCU510 remained zero. No per-operation THRU1 switching
> > or additional userspace delay was required.
> >
> > Add an AST2600-specific GPIO request callback that performs the
> > existing GPIO mux configuration and clears SCU51C[9] for GPIOP0-P5
> > when SCU510[30] is clear. Check register access errors and verify
> > that the strap bit cleared. Other GPIOs retain the existing path.
> >
> > This RFC handles only the GPIOZ6 strap source. It leaves SCU51C
> > unchanged when SCU510[30] is set and returns -EOPNOTSUPP for
> > GPIOP0-P5 requests when SCU510[28] is set.
> >
> > Hardware testing on B650D4U with this pinctrl candidate confirmed:
> >
> >   - Remote power-on: power-good asserted.
> >   - Remote graceful power-off: power-good deasserted.
> >   - Physical power-button power-on.
> >   - Physical power-button shutdown.
> >
> > These tests used x86-power-control with software button forwarding.
> > The earlier board-specific SoC driver, its DT node, custom sysfs
> > interface and diagnostic boot parameter were not used.
> >
> > This replaces the approach explored in the withdrawn B650D4U
> > power-passthrough RFC. The new proposal changes the existing pinctrl
> > driver and introduces no DT binding or userspace interface.
> >
> > Feedback is requested on two unresolved issues:
> >
> >   1. SCU51C[9] is shared by all three GPIOP pass-through pairs.
> >      Clearing it for one GPIO request may affect forwarding on
> >      another pair. How should that shared control be represented
> >      and coordinated with existing mux ownership?
> >
> >   2. The SCU510[28] enable path has not been validated. Returning
> >      -EOPNOTSUPP is a limitation of this candidate, not a proposed
> >      complete solution for every AST2600 configuration.
> >
> > Is the GPIO request callback the appropriate place to handle this
> > strap interaction, or should it be modeled through the existing
> > signal-expression mechanism?
> >
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> I don't quite understand the status of this patch, if it is still up for
> grabs, please rebase it on v7.4-rc1 and resend so we can restart
> the review.
>
> Yours,
> Linus Walleij
