Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E89D495AD9
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 16:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576949; cv=none; b=gYJerNmm5uIX+fOeKt9zKPF8fuSvJARrtVPwJ+FLq2hdtNUYa2MhWKTSl9hnky+HdMP8LUiPtG3LIBUk5druWvdKCkTQDsLvxkAoFNsJW71ObnR4RytI94UVZY1DgdI/tnVVZglZw6qJqQj5puNk+uQlJR8Cf9p6sFeMavNTqoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576949; c=relaxed/simple;
	bh=aon2dbJnCr/S2AeRAdi+xJK6D/wc/t0gWjIMopRk3mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I95sd4F2NiNBtMWf5fdodElpXnr+IJh4pGRdFX3F5febNLfa7gm7RqBaREuVhv3SC45gkcFjXyMc1ciLDKGEYcXLZt6Jzm9t5SA3ZH3N3uiGoJ6mZMn1V45XUAo75nBfwxlU6+jXEUMQ3UXMxQZZwn5uVu9yUqUnRa5mlVHAw3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmpZX2of; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmpZX2of"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0573F1F0089E
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 16:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789576933;
	bh=aon2dbJnCr/S2AeRAdi+xJK6D/wc/t0gWjIMopRk3mY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LmpZX2of13S/6KVObhaOb4/ezUF9BOl2ZBn3oI+UabvrNP/MuVjZlkdwzKswKJ0YT
	 2frPNdkEs75UvwL05GEhlIm+sbYW0bZreMufLpWKG1yETNfWd7mhq/JF9x3Ez/5j2K
	 IYpigV1vdVaVCP9oAG0o2FjlWOqy+haqutQrjyDDyJMMYbCmeqXwR8QENib2V1MiFg
	 jSP3a9KwW0n5G/yqqY6Er7YYCqMbHnfepVGakNrssd1Wmcrkk69kyYW7bSTqpTGyia
	 hBdw03sEpx7SgY97mKseZouE+w3i66pVKCgef0VVnuE/WL6XLy6CxoWmOoMDZutD+R
	 OqvlKsrOun1qQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15cfdso1205178e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 09:42:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzWixt0V/sskjqtnWBiTPg03UCNGO0sfd6Tkb/vdTMNr4TJhbTnxS5fZ8jWo5jCZQqIl2tDuuuk+AIT@vger.kernel.org
X-Gm-Message-State: AFuF++nuzN9z2f9PVHlpoaNeYJ6ig0CeCHJ+RuD5I8c9IzatcD4ZwNq3
	l64mug8iqKQeljNTKCKwlQr6HhDC3WLZf+mqUq+H54dPG5fc/QnNVmuo/YzcG5eUHP26fkJcZc9
	+srTze0P7ojl6G0jO2YwS2l6tF7j0GcY=
X-Received: by 2002:a05:6512:3188:b0:5b6:1a7c:59c8 with SMTP id
 2adb3069b0e04-5b8b6643a5bmr963863e87.34.1789576931685; Wed, 16 Sep 2026
 09:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905080235.33785-1-kmehltretter@gmail.com>
In-Reply-To: <20260905080235.33785-1-kmehltretter@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:41:56 +0200
X-Gmail-Original-Message-ID: <CAD++jL=U6TmJm8ALpv8m78XC2wvCFqQDbto7UcSLoZ9udJ7vMA@mail.gmail.com>
X-Gm-Features: AcwNN1Xzz7Vr8iQ0kYrCMzI5XzKo9WytuY39-tP1Q1YM7-T14r0eH_M3K4Ta9tk
Message-ID: <CAD++jL=U6TmJm8ALpv8m78XC2wvCFqQDbto7UcSLoZ9udJ7vMA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: Drop the nonexistent CONFIG_MACH_STM32MP25
 from the STM32MP257 default
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 10:02=E2=80=AFAM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:

> Commit 619f8ca4a73d ("pinctrl: stm32: add stm32mp257 pinctrl support")
> made CONFIG_PINCTRL_STM32MP257 default to MACH_STM32MP25, following the
> MACH_* pattern of the arm32 entries above it, but no Kconfig symbol of
> that name exists and git log -S finds no Kconfig file that ever defined
> one: the STM32MP25 family is arm64 only, where CONFIG_ARCH_STM32 covers
> it. Commit dba0aff2b89b ("pinctrl: stm32: Allow compile as module for
> stm32mp257") added "|| (ARCH_STM32 && ARM64)" next to it, so the first
> half now evaluates to n and changes no configuration.
>
> Drop the first half.
>
> Fixes: 619f8ca4a73d ("pinctrl: stm32: add stm32mp257 pinctrl support")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij
