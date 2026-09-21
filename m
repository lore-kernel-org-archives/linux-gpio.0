Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C99D499F1D
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994483; cv=none; b=GV6Q1Qpev3B0cIH8W66icF/O59lhLxjbSU8EziCok4iXBp4F7NIHtQ8tKsCV47stqB2nyMDvae8wmabe76KcZEbCSzsgl/MABUWHBBw5886zJsJOKLWI+VM5TIa8UyqRuf+Kt3aIA5Fr2Ba4zyATmQWmAm6sCPabcbL0bMhRZos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994483; c=relaxed/simple;
	bh=wFuj4vM7L6ykZKKuXeJr2Ed+nKxLzMDmHaceqLbGNR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NXhHOdepvkUmgz9qtozdojdDiy8qVJhi6V7mGTSQveFNMb+u+sjY29j40uzUXTVEgk2zGf0phxeceJpW92zKqWDDdWz4/VsX28XLu1d4euc0J/GrSWmB8+h9BB82UU4/fXNaYXnTdcyWnsssWDyNdhb5ANz9MOWiJBbs/QDvkTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pu+yqHaY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pu+yqHaY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6431F00899
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 12:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789994481;
	bh=wFuj4vM7L6ykZKKuXeJr2Ed+nKxLzMDmHaceqLbGNR8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Pu+yqHaYoOKoy83NFPsM3qgmVrxBNwRQiFM8EglF/uSSvywf/SX7qjztNtQbG8nxe
	 Acs9qzY7aPIlz/RAa8qwIlymhF0wkygY6pAa0xszyGX2BLULinTTEFBN7xjRB6FL4e
	 0hjZ7Ip43n/FqI+Yr4KkZ3yA1TQoKP1f3IYAfyqbMXeq85Ng/AGD65nJoR2JHfibmo
	 rUBoG/d5VSffWSk4HZdMwQ35VqeUBNZhUhFeFZqw6CiqauVenI5yyEUpRsdJPjJi7F
	 s7a9u6TvDAatl87EkchyzdjB7dG//mGpPdDmp1PoLpOJbHjO7rVbRflp0ER9R5eMnH
	 Wx3Bc4bR0wV8w==
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-48e7fe768e2so215653fac.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 05:41:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzh8tLyvDZ0PH4CoDgjoDSqSIqN7izvkulnF343vNjDsfQ+a735ER4IM8pB11GBHtBCopOaSUaTS6rs@vger.kernel.org
X-Gm-Message-State: AFuF++kL5o+lcz4UFGwqNgzfZT47nBhFs5G/jfcmiq4j0HWEyah8Zvo3
	Tc+xcj8O527/qqbI8/t6WK/VBpNLIBpCrjjvYgGxHaC2Mzym3jgccUoHcx8rihXNwWr0+O0RLbm
	cj4vWbdi+bmgRCwwkSIIoLmdf+BWgqgA=
X-Received: by 2002:a05:6871:2e8c:b0:456:5d8b:5681 with SMTP id
 586e51a60fabf-486e4bdb973mr9528839fac.1.1789994481110; Mon, 21 Sep 2026
 05:41:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917094356.7040-1-bartosz.golaszewski@oss.qualcomm.com>
 <CAD++jLmB-sEea0rVNAE7Lnw4N4n69iutY_xU-CEOCBoT_8HnNw@mail.gmail.com> <CAMRc=Mdkd2ksvx+4FgC2Pv00Q+dR_iUc=WV-VuTkuqAdFq6Z6Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mdkd2ksvx+4FgC2Pv00Q+dR_iUc=WV-VuTkuqAdFq6Z6Q@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 14:41:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLnWu45Db3GqZR5eNS-ax3sFz=bRKfQxvxDcbpJQuCzS+Q@mail.gmail.com>
X-Gm-Features: AcwNN1VHv1hji_wQnpCUrc_3oXWMS9rpijYBnnO1icsDnrd4oUKVnXp_4QMz6tU
Message-ID: <CAD++jLnWu45Db3GqZR5eNS-ax3sFz=bRKfQxvxDcbpJQuCzS+Q@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pin control fixes for v7.3-rc4
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 11:04=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Fri, 18 Sep 2026 19:01:35 +0200, Linus Walleij <linusw@kernel.org> sai=
d:
> > On Thu, Sep 17, 2026 at 11:44=E2=80=AFAM Bartosz Golaszewski
> > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >
> >> Please pull the following set of Qualcomm pin controller fixes for the
> >> next RC.
> >
> > This was not based on -rc1 like my tree so I just pulled off
> > the two commits and signed them off on top of my existing
> > patch stack so I don't have to pull in -rc2.
> >
>
> Ah, I think we never discussed the upstream tag policy. I typically base =
my
> pull-requests targeting the *current* release (in this case: v7.3) on wha=
tever
> the latest upstream tag is. I try to base my for-next trees on top of the
> current rc1 unless there are conflicting commits already upstream, in whi=
ch
> case I pull the earliest required upstream tag.
>
> Do you want me to prefer rc1 even for fixes for pinctrl PRs?

The policy is something like the latest that was around when
I was starting to collect fixes.

I simply don't send pull requests for every RC. When I do,
I will then rebase on top of the one which has my previous
pull request so I don't send the same thing more than once.

If there is any policy it is "check what is under the patches
on the pinctrl fixes branch". I don't know anthing better. But
generally -rc1 always works as least common ancestor.

Yours,
Linus Walleij
