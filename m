Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87BB3587DE
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784970726; cv=none; b=Nj/n0TfxiDwwfylz2AZ+phr0fWozVXD7Qp8Tj/bHb4NqNcEqSRWn9sjiyFdu9lX36N7DAcaar0BK0SCMK2BGFWd2kzzxhOg5K+hzz7wurM/PWA5KfhF/UcKEWR3TRljQxi9afl5/WWnnMSNVqS0sq0r/E3Xe4SRNCHNxpvZBfOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784970726; c=relaxed/simple;
	bh=0oUtUmzPPJDUoi7oa6q2YhjfWKTYgrJv1plux7vFNCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e88BX/iLf6qF0E/7KweWW2BOzRqGm9GvMgOndGpgjaBvuyvez3HzaGNJXFAlXhvkflUVfYZk8npsmpNBm2nA2sM6VGfL3iV37rds6zKEKfymUUZw9/P/ezBu6FbyKKQJyzDIZY7iJMWak11P8xo/yzihgsLke+i7jSbpJSdEiGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMyblcKX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMyblcKX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03321F00A3A
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784970725;
	bh=0oUtUmzPPJDUoi7oa6q2YhjfWKTYgrJv1plux7vFNCo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LMyblcKXCMe0QKRwAgizj2PmIfO0O6AvwpJpytZOC3ci6dRzSjhC2cI4BvULePcry
	 sEonJVXEDGMlO16X90jjf3wFFRFDRRHep/ac7/nUhG/ChW+1nCv4t10qZ7fyCZ4/2s
	 2PAbHLZwyQq5O9JT4REuG5yRlVzrbzYHn5WHuS3JpiwIYxoyIBUgD4pE/z3fAd/OCt
	 dgY7ptHVgnTlSjXsyzGmde1UU2ACYUYgLnBFLGLN6Acc1Mv8RPp+XtO0WsyNO3zzGU
	 En458Cjhv7N6Qk6EhCkqeafFuldwwpacGfgImn5nHyeRNXKKpo9C4odszY5w0K6tIs
	 gAU+ou4Wv39zA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c94fccf3eso10253881fa.0
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 02:12:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro7gJWJ0ASPlCQL3RQw5CAqCMS27Veplgckx5XJl8gQ2hVviOThk3WAKtgUr72W6riv0kgOapwiaZ1v@vger.kernel.org
X-Gm-Message-State: AOJu0YxizYZd738jjTFGPF/xuDIuluD1B+rOiGkxB7vcf55goAntKuwi
	j5/7DllFawzD2aWQyvPdzJ+/e5VKUbvnxBzLk+vWkHpwYtsnyxDrgXbAHg3EXoOrvu28rK+9qBq
	mvK3AxxSSv9wUAkUfAnFi61cT5gc8PpQ=
X-Received: by 2002:a05:6512:39c3:b0:5b2:a21a:10e7 with SMTP id
 2adb3069b0e04-5b2c1b35f7cmr260838e87.25.1784970724532; Sat, 25 Jul 2026
 02:12:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718041311.2605172-1-dmitry.torokhov@gmail.com> <20260718041311.2605172-2-dmitry.torokhov@gmail.com>
In-Reply-To: <20260718041311.2605172-2-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:11:52 +0200
X-Gmail-Original-Message-ID: <CAD++jL=8ypbgQAs0G-5jHZRsbcFWeMEKAFFG9dEt-CZfXKjFXQ@mail.gmail.com>
X-Gm-Features: AUfX_mxFFPFKat-Lyh4In_uIEMUaCjURdX5giLeCnYlZvjYF7wMWuiXimA34ETQ
Message-ID: <CAD++jL=8ypbgQAs0G-5jHZRsbcFWeMEKAFFG9dEt-CZfXKjFXQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpiolib: of: compile of_find_trigger_gpio() conditionally
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 6:13=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Compile of_find_trigger_gpio() and include its entry in the
> of_find_gpio_quirks table only when CONFIG_LEDS_TRIGGER_GPIO is enabled,
> and remove the redundant runtime check.
>
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
