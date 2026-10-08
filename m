Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F81C43D515
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459616; cv=none; b=UAzhHBkWkdCtBagDMPZBuTzr99BRYb+hog7VjMdY3ov0iMm63EcSXGkUI4EZkWoyQeqkiTuVbM9Hd4WNPo6W1nPj3YYpmWsGUJ3mPLAM2G7ShviGLKJi4zS5eruzdnFPPR3dEYPad19u8erQIBd+tIJJy2W4JlzRrZU/NMGq+e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459616; c=relaxed/simple;
	bh=H3DnaHXGNmAGJmYNsMEkIBkDjfdKJ8UyJfKJHvjXPyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LALmLWx1BCRgwaJbG3M+ZMNs8B2hBo2kW6v+r+CrFvaC140XpaYEK0VA86c7pUNePQe0EhO3aHhXA8iLcxQ1mLo/gsgBZNIWCreiOKkf3y2x3sP26T4JAUkH48wzAZYn/2VT1w8X+KoUdWgnwBQVhkVqUeZ2MmJEguCLqKFY4bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WkMaZXW+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WkMaZXW+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066401F00893
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 11:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791459615;
	bh=H3DnaHXGNmAGJmYNsMEkIBkDjfdKJ8UyJfKJHvjXPyU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WkMaZXW+o+0fcNybKzCPoR+ac08ucNfgJssGaQAf1GijaEIvfZ/C5BcRi8rl8oRp7
	 aDBrdGcuXLufu3Mz3JLD6kyQO3nH9jCj2YTlB4WckyR9ZvACs+WE1af9duxoDHtKNM
	 1gNAp3mmnzmMijrSui6a5My2+Oo2wNIC5w/5v+KxGP89z2MPIA6oiFLY8sHJiJqstJ
	 o67uwnF0r5pJGGb1wCvztqMMncDK6z0pGuoHCSOvh81oS8nFtciEo6i6yWgYjt6Bp2
	 pNGLKjg+gRkCRNvTYo0QW5oiBjjC610+meoyTn32sVx+e/Vt/Sfeff3u3tUlmQ1MC8
	 kLrEHDFOwt8bA==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-48e94879f02so1100910fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 04:40:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw650pOuMjoM1CdJgDKpGzowpuO5nEvmtlpkT+OkPjjb4fxI5gTvdG+1SOjLliis/+8n3hSaQlBSsGR@vger.kernel.org
X-Gm-Message-State: AFuF++n00GaHscfix6JVd80yh83rHqa3rRiXl1OsjVmoTGZ+8iGAFnaE
	GuSqdklwU7vv5CXbhVYeRumgPPk3WIoVTT46AbmRIi3TPqIQAioprsmjO/yynbwqLVcIHbl+3hY
	oINzs1qjDDGvnpTqX7psax5+4w5BcWlQ=
X-Received: by 2002:a05:6870:c18e:b0:48f:e0f6:c465 with SMTP id
 586e51a60fabf-4a25971ffbemr4196386fac.51.1791459614377; Thu, 08 Oct 2026
 04:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008090724.5423-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20261008090724.5423-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 8 Oct 2026 13:39:59 +0200
X-Gmail-Original-Message-ID: <CAD++jL=fkJNgCHb7M4mm5nc0nwb1GZmozngCEv-A5VCBULXD3A@mail.gmail.com>
X-Gm-Features: AclHuK_piBTKCFHJaGOfljb9LjvN1CVYkRHEFzb7T87rvgEtJIpojnUXlIJ3r2Y
Message-ID: <CAD++jL=fkJNgCHb7M4mm5nc0nwb1GZmozngCEv-A5VCBULXD3A@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pin control fixes for v7.3-rc7
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 11:07=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Please pull the following set of Qualcomm pin control driver fixes for th=
e
> next RC. This is based on v7.3-rc5 where the previous set of pinctrl fixe=
s
> landed.

OK pulled in!

It's a bit weird to me that you merge in -rc5 instead of just rebasing on
-rc5 but I guess it makes sense if the fixes were queued before -rc5
was out and it checks out, so whatevs.

Yours,
Linus Walleij
