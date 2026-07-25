Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AAB33938E
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784972054; cv=none; b=VidgK9WZXS0zUx67Jjp9acR4RHhbT7sdUW3H1sC8hDgnboofloQdI8kchuOKT8jU25uwTJhVYiBLgK9E3PUmN/v4uV+JDP2Az0F+gY5IwCW5l2Jk3bsRV9YewSh0XGlgnKwTATOK985+V5FjLfP0v8c2/Qc+AtCozVq2uczXp5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784972054; c=relaxed/simple;
	bh=ITZjcQRn95u6VCpDPPTnBvVga4zbrsqIoFwfm2Q546Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nsve6sKcO4MDnyy+y7JdsKrVCgYStBvWXiu+XSfOQxVl9TMBGk8TLb68Q7o80unMCD2TfCxVVdSGGw93opEp7YVttWs2oOb3UA1ik3QyWOLXW2KVO8mlfBOmt/L9yIF+SmsxwxAxcfBWq9STSZKln0A+45PgPK+3fiV68/b4Gu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yrg/NXqp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yrg/NXqp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C798A1F00A3E
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784972052;
	bh=7UupwUNjMRAke2Z1V/NRbotbWdSBA0PD7YbseISQQtQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Yrg/NXqpIw0L3adbgN8AMPtnM4ZSfqEBQNvJ9xCe2xQRK2wXt8k2IS3EXoAjmTMFC
	 dEBL9zJpKY74ZjSPR2I1hRin80mEqx6TRL8FXBT7CyJxrgnfza5i8ePLmbzDhzTEJp
	 aazcqYG4IvPiraQT0g/mE1GBhVo7viiR+ygt5oo4LbRGtNn8OdCwJEEXiDwDsk2sSR
	 DAZM4etNk0wufu9sgRffUGRVrlKOwV4U+JKiHF/RHqJo270socE9YKCz+7s7CmoQNH
	 owRR4ENeHqcTYr0v8Y1JCJQu6umHY3STTXzwRTz0Ms6W4JUj4EoladLjLtOUWm8we4
	 Lx+tzGi9pf++Q==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso1262505e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 02:34:12 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy2v5XnRcIJdlUF77R+X/LVtaBPwjtp5wHWW9iyYd3ly8gjWATc
	HWYWkxZMQKl6sqf4qHz9Id2LvdheeTIuWc7i+VWX7nmBk6cFM927xntV1bDx+LdU7REjnz64nba
	M+DQf61pju3KhEYktupeja8V13qxY2nI=
X-Received: by 2002:a05:6512:1148:b0:5b0:d0d:1f10 with SMTP id
 2adb3069b0e04-5b2c1b089e3mr215924e87.27.1784972051572; Sat, 25 Jul 2026
 02:34:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720175611.2294418-1-bennib@mailbox.org>
In-Reply-To: <20260720175611.2294418-1-bennib@mailbox.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:33:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLmVvYFYF9dA5060oQEfeejvKukw3B5H0TkJ=A_qnnugZg@mail.gmail.com>
X-Gm-Features: AUfX_mxXVXUm_Y2opU4d2ZTx2uh9TD7qPFdqWuTUDuky-yGOj5GObdCvk5boT6I
Message-ID: <CAD++jLmVvYFYF9dA5060oQEfeejvKukw3B5H0TkJ=A_qnnugZg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bm1880: add missing select GENERIC_PINCONF
To: Benjamin Boortz <bennib@mailbox.org>
Cc: linux-gpio@vger.kernel.org, mani@kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 7:57=E2=80=AFPM Benjamin Boortz <bennib@mailbox.org=
> wrote:

> drivers/pinctrl/pinctrl-bm1880.c initialises its pinconf_ops with
> .is_generic =3D true, but that field is only present when
> CONFIG_GENERIC_PINCONF is enabled (guarded by #ifdef in pinconf.h).
> The Kconfig entry for PINCTRL_BM1880 never selects GENERIC_PINCONF,
> so any config that enables CONFIG_PINCTRL_BM1880=3Dy without
> CONFIG_GENERIC_PINCONF=3Dy fails to compile:
>
>   drivers/pinctrl/pinctrl-bm1880.c:1288:10: error: 'const struct pinconf_=
ops' has no member named 'is_generic'
>
> Found by randconfig testing on arm64; tinyconfig reproducer below.
> Add the missing select to fix the build.
>
> Fixes: 49bd61ebce5f ("pinctrl: Add pinconf support for BM1880 SoC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Benjamin Boortz <bennib@mailbox.org>

Patch applied for fixes!

Yours,
Linus Walleij
