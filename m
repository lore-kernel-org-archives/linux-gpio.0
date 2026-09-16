Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0894D7D25
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 17:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578131; cv=none; b=PELunbE7J38l5kYF41uMcuw7SoY65NO4IRNQD6OmGKYsvx2qnL6FxoNCF2R2IFbdoPGowzX20iDkT2HbZn/Nyob9BKnUt1/WnYZ/Dmt3kujfSaMLpl3WEXk5gYLPTADFNerR8ErToWdFPAIzee3Ok/FOAVqbvi2/Hs3l4qK+0qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578131; c=relaxed/simple;
	bh=3+ba1dWQqlCn0VGEMRoPDI5/l6FQ5LQxW2qM1EAes+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdNcuYM5V/yV2bpQVcp/deQMTojksrR8+HpHgJ6pcmDSurmMcWNfdcphF7hXaOHrK0/m2ppbDsLV4pOPqaHybR5uH9fX2PLXUbs5/xgrpQLVTwCpMsYeRuOy8vtEOXFjwVyskLDJ5b72Nm1tg7mc45fy2+Z//afxc/lMwI4RqCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2l/ivNl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2l/ivNl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312CF1F0089C
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 17:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789578122;
	bh=3+ba1dWQqlCn0VGEMRoPDI5/l6FQ5LQxW2qM1EAes+Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m2l/ivNlNmDCG2Y/itJCFaUgxFkT//D8sC77L/tO2L0XzMqGSBTNjnGYif1oPareL
	 QP+Q+rWC2jwfdKzL6WfuaLSOIYXV7jLzconjF88RnxFxNUUac/7jS2CtUHmkcR3UC1
	 BrD/sAOlVhUFw/6kEZFQivyDQVFXD02A8yNfptzEHa/WPpym96fBGuDqK4jhbT1/0F
	 YH8HSDPJEGwQxrAAaQi9YC6TCes+eoQp6zluJmmnbxe6ClSs85p1ScH02WbKi5wPFo
	 NW92SBGmfg4YW7lTLDnwbuqXwh44VtNQ+CGcWHXlztmpHywyXSBTCIW6fCrilBExTu
	 8kBg5tizF2GcA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15b7aso1252871e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 10:02:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByLqormFX6mETfICkPSalmVSzA7dT7X40hMW22uc2C/LtXR4q04B0cAW4vhSrnSShwGLr/iFf8rSc9U@vger.kernel.org
X-Gm-Message-State: AFuF++kuwlnq2LWeo0ng58OdrM6x2RFGFs5vcZZnExO/jBsh3NIytL45
	z6cZiIIqJQ5YYmw2qszhGJQtw+u1BalSM2lIIVarkT90CZjnPdH1DObbwH5NaWcnBEbW5lD/by5
	lumXDfkw3LjYR+QtiX0MJU35AOSt6VnY=
X-Received: by 2002:a05:6512:304e:b0:5b6:421:a8fd with SMTP id
 2adb3069b0e04-5b8b6660222mr1907091e87.29.1789578120849; Wed, 16 Sep 2026
 10:02:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alUyZ2zVWCPhyHHX@google.com>
In-Reply-To: <alUyZ2zVWCPhyHHX@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:01:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLnAF7c=bBh2ihXEiG55twpj6seEGU-2R2GhWsGfC7NCyw@mail.gmail.com>
X-Gm-Features: AcwNN1WpNQw2_PBz6JfQIF44TXbYdMUvRldRpzZFmjSOxvBrSvVfNotOz2MCBgs
Message-ID: <CAD++jLnAF7c=bBh2ihXEiG55twpj6seEGU-2R2GhWsGfC7NCyw@mail.gmail.com>
Subject: Re: [RESEND PATCH] sh: ecovec24: use static device properties to
 describe the touchscreen
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	jacopo mondi <jacopo@jmondi.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 11:41=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Convert the board to use static device properties instead of platform
> data to describe the touchscreen, so that support for platform data can
> be removed from tsc2007 driver (ecovec24 is the last board using this
> mechanism of describing tsc2007).
>
> Device properties do not allow custom board methods, so the method for
> getting "pen down" state was removed (the driver is capable of working
> without it). If this functionality is needed proper pin control/gpio
> support needs to be implemented so that the same pin can serve as an
> input GPIO and an interrupt.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
