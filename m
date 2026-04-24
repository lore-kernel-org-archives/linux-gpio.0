Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B783B9DBA
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 13:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777036421; cv=none; b=A6JUKPQfqOhIPQgN2DacmDbuwmeIgvWuPJpALKF3PAnelKLAuTlkmjYP9Th6rdG+3Izx8qhg6y3hLhqIxiADa73KsyJ84ufLjW7oB7f2gByzrLc+kX6r72iL3Un9B8xUw3PujDtoxt0W25G0Y5mODoZQWsHRI4CUFXpDXQrss08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777036421; c=relaxed/simple;
	bh=m6JrLYpdLV0CnSK2p3Kloba+kD76EVcgb4SkHM7WUL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUBAB7hlEgL3FzlHNtP+XH8HtTHLPUteiKHgc1H8JOZsvu0gKEyc9/zyxERag6rWTdoL4LShgR+ISoMHUvMWT/jVzD3YbMYOI6bc96Tt/YOJwGvdBkIargHBvOWZTKR6dbfDo2zDBl2YIOG6nG7F4V3i9XcSpXNHigVxh2xM4ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFJse0rv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFJse0rv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7DAC19425
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 13:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777036420;
	bh=m6JrLYpdLV0CnSK2p3Kloba+kD76EVcgb4SkHM7WUL8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lFJse0rv1GNstCer6UxIjuM2Xnns+3RTRTinqeT3lWzFrdLKOIBl/sYXkE26NgBy2
	 1lULqyNOsdPxOQC+MOuaMNPdn2cCI1CgZRePWCpRuNtPckXebmEw4wJfxyTVAQcakM
	 R45gWX9rK2G5A4SXU3kM0IMOGlEvLmpetgyiBoOukgBUcSxys4nsv6tJ+M6m2iXPma
	 1SYHZLdWariiXNHHiNAGE+/JSznudffrZW8yqiNnVg41017MZMxM4nMO1ws+C6UFMr
	 282M0hbJMY+CcDvUnLm6LW7s4Q1v7OplQT2rO6FMr3a3T2k6mJ9SDadqt3taAHMo99
	 r7jCDmAW/cTpQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59dcdf60427so6997298e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 06:13:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8wgMlmYrMH4186DBs+rAWY5KEhiRovJNKESUeyXZGXuP9Llw5fSpOd+T/e5HrgWZ+r07/1tcM4cxAa@vger.kernel.org
X-Gm-Message-State: AOJu0YwT3Pgs8tHbg0rRsfMxdoQsA8AuoghxTx95A2MuVUpFsd1lF7YY
	Hug74orEs+TVDbrDKvLSmJvMoVw4uarBGaABzhlfkL7jbTPxl/srJd3S+JivtCFxyYrQ5seRGdl
	OtABC8zfCcWysLX+mxBgXALz55UAmqxDNHIrLg57huA==
X-Received: by 2002:ac2:4c4b:0:b0:5a4:afc:e7fc with SMTP id
 2adb3069b0e04-5a4172ca6b1mr9820510e87.5.1777036419301; Fri, 24 Apr 2026
 06:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423223230.47001-1-m32285159@gmail.com> <CAMRc=MdQHKbs-Q9TWqoSa=NLk8c=m-afCMZ2EqGByPg0TE51HA@mail.gmail.com>
 <CAKqfh0EzE5HTSJfJgYWKG2KC_-samjKVpDuBZ6cPsULWBnouew@mail.gmail.com>
In-Reply-To: <CAKqfh0EzE5HTSJfJgYWKG2KC_-samjKVpDuBZ6cPsULWBnouew@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 24 Apr 2026 15:13:26 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfJSVivb9QoVVMfvyPmkCAeZFc_Z6UJUk_RSX36g1Ks6A@mail.gmail.com>
X-Gm-Features: AQROBzA1KytdKnDKYg3K2YC1FPSnbd4oyhasAmfGuoULuOTafUwHw-1BZAs6i1Q
Message-ID: <CAMRc=MfJSVivb9QoVVMfvyPmkCAeZFc_Z6UJUk_RSX36g1Ks6A@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: Remove intermediate pointer variable and
 harden function
To: Maxwell Doose <m32285159@gmail.com>
Cc: linusw@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 3:05=E2=80=AFPM Maxwell Doose <m32285159@gmail.com>=
 wrote:
>
> On Fri, Apr 24, 2026 at 2:54=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
> >
> > Do you believe the code looks better with more layered dereferences?
> >
>
> I think some people might value the more explicit dereferencing, and with=
 this
> we also won't need to handle the overhead of assigning another pointer, b=
ut if
> you want this removed thats fine by me.
>

I prefer to keep it as is.

> > sprintf() is safe here as we cannot possibly exceed PAGE_SIZE with
> > this format but if you really want to do this, than please send a
> > separate patch converting all configfs show callbacks in the driver.
>
> I can do that, but I'd prefer to separate the functional changes with
> this one, so
> expect another patch that fixes these. I'll remove those sysfs_emit chang=
es for
> now so that the commit history will be clean for when I come back with th=
is
> second patch.
>

Sure, let's drop the first part and do the conversion of the configfs
show callbacks

Bart
