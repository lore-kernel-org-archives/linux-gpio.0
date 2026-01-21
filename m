Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868623AEF2E
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769000875; cv=none; b=Co/bQFX6DPhM97bjZtuJWJtNkLDJ+obFA7S9TZARjW6T6ISVWnO5pHcvJTiw3+kNrNanO0M6GI4SMo9qO2kH31fUkh4jrutJvodtwhY6Zoona/w0eg5m+sw1o0cCNhIxtvJ7R6soPi/MBVo/4jY4JYK2qfGKVgBlEpFfkijB27c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769000875; c=relaxed/simple;
	bh=jHM7hm76ic4Rp1NVS8HdjpucnY6CEyJJpRiMYWs3fFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jP9IyEXxOd76YSTWdV6gcZrXfp9f9TvIrBlYb8W/tUa/M2sBqZT5bgUHGEETUNu/gaZHczlootEZwVB/9i06z2mjYhwBkEmy1+eJKGI69rWXXdUw02moFGYij0IvXuUENO1HSlFZsxVxepC7mtEANthM2gAiNgYC1A6ylxXWIiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKKLhxQX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKKLhxQX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F45EC2BC86
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769000875;
	bh=jHM7hm76ic4Rp1NVS8HdjpucnY6CEyJJpRiMYWs3fFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nKKLhxQXKaqurOalT/iPhtHTg3IarWAS5DYCLrl7wH6EKMayY5SRRWgfohxYryOOv
	 OkizdnHOnNbdCjjGzNInSR7H9atAEGWXy7xe2ydIn7n/fIzs8+p45wcI0skGVTRvQb
	 YMxSYHXFV8WDfL3iDdBarvK55qAoHPgoJHaLz0hI3uUoMY9mFwdr8/gJcDvs/bidyW
	 clgUXELEa+f9JXHq4PEG5Z4yNCU4qomw3G4vqaLoYrYFr78QIAiOxGlefiJ+MxprtC
	 1YaWnPWa6p7j/U28gqzVVqUQE4srhhmnSlPtGGf0Ozw2p2eLeuqifAHMeYFM6dRTbg
	 dJqAyelRYG2gg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b6df3d6b4so8205631e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 05:07:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDw2gAiuO1idmDVVn8ii29vQYUVlk1P49UXkcIopeYdBmwNkVKorD+9hnzXQnjhgoC5CNslTvFGFCH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzlbq+sYl58bBl8d667N2G/JlDzqiRIzGz3N8+vjgKSOsah3HF
	K1LD9ODC0iXHN69llrCFlCl3BSdr57ZrxH5jeooP1LJfSHoAZO9mIPcfkzkD0wDMlgIRDvxxJNL
	T8ItvOwI01EsF8dE/wIupiyDndvygb8x8zD5HmHnxLw==
X-Received: by 2002:a05:6512:3d0f:b0:59b:b32f:2df3 with SMTP id
 2adb3069b0e04-59bb32f30e0mr6498952e87.3.1769000873869; Wed, 21 Jan 2026
 05:07:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120154913.61991-1-bartosz.golaszewski@oss.qualcomm.com> <CAD++jLnVR1CbW9LCW3YPeytidWcjWEUbAAUD0z7LBS83x3ik3w@mail.gmail.com>
In-Reply-To: <CAD++jLnVR1CbW9LCW3YPeytidWcjWEUbAAUD0z7LBS83x3ik3w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 21 Jan 2026 14:07:40 +0100
X-Gmail-Original-Message-ID: <CAMRc=McCsEtddu-ANfDX2LDbhLLzztXTuWkZvnweqnobqBp4-Q@mail.gmail.com>
X-Gm-Features: AZwV_QggGBwZR2CCnWqFDghNSCjhxtkg74Q1fExx1wVmviJopTvLIqapxaMTwYQ
Message-ID: <CAMRc=McCsEtddu-ANfDX2LDbhLLzztXTuWkZvnweqnobqBp4-Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: propagate configuration to pinctrl
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mohammad Rafi Shaik <mohs@qti.qualcomm.com>, Ravi Hothi <raviravi@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 1:10=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Tue, Jan 20, 2026 at 4:49=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> > Just toggling the descriptor's "requested" flag is not enough. We need
> > to properly request it in order to potentially propagate any
> > configuration to pinctrl via the .request() callback.
> >
> > We must not take the reference to the device at this point (the device
> > is not ready but we're also requesting the device's own descriptor) so
> > make the _commit() variants of request and free functions available to
> > GPIO core in order to use them instead of their regular counterparts.
> >
> > This fixes an audio issue reported on one of the Qualcomm platforms.
> >
> > Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support=
")
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> I don't quite understand all semantics but I guess it works
> like this:  gpiod_request_commit() is only called once, during
> proxy device creation.
>
> If I understand it correct:
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>

Yes, we effectively hog the pin and allow access to it only though the prox=
y.

Bartosz
