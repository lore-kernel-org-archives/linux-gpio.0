Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CE4378D9F
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692787; cv=none; b=fNJFY4Von/uN3pxGvExxCJJC3jMy17aFf66lVDJMZXJfB0gOV7GxgddR4CISf/6zae9bJsg3Au+sCLiqbZC5CQDb7xTfrHhH8P1HwiVoAoMzXXFvDLOkQmY4ngWi2ftz8WXSZVemAcDEezcPUjz+Od7X/qwPxQSIzfCar74vRXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692787; c=relaxed/simple;
	bh=bJyzgdQ/eejKj8ldMAHAI7C+V4wOFbIfNbvluVyWQJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OoiY7oKzWJxpV4RuZ5k5Wj8t3iqIzhoH1n1FchsAL8D/iKfpwOZ+irU1Fb+iCN1rxMAmT3HVA2P4L70vmf1myKxJ77NvcfkyAPschNT2chuLLWFlx4QIOLTQyfht43pVdmqklzTwX0V404lDml76zdPLxfORVd4cMQZgxt2pwCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVtFSGLF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVtFSGLF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91CC1F01559
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692776;
	bh=bJyzgdQ/eejKj8ldMAHAI7C+V4wOFbIfNbvluVyWQJA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NVtFSGLFB4e3lMlrfiduOdvyX3norNAfzAJzEhGWjCR5OHLVfoTZwoOnPmfrgduDx
	 7bqmdRd9bRHUhCfXSol375L8ctOmD10HsnljRa5mS+3vvxvE6871RrTVo+sJMPsbNr
	 nqoM7c08tO3oo+5X5ZpaHQYWKyAJTuXzpaUu60CyC+5hVlwLK8HsC5ZhzHAuMyXzVx
	 23i/yeSjFcdNKc5VmvPZSX6xDH7YVesVenhnJDg6RfT24S0fH5bC3IUQjidm2PBOSk
	 DFmWkbvxAxgscjrcShdVIPlpvqv6e6NyewsFpbUDem4Ihf4YdfUBLNCRkyaZYNPJDw
	 i+KutZ6EJepFA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso789661e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 00:32:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqQfQv+so+YCkx+V3BKgz5gJAhA8P33E6dA0M8OA/GC4g1KZxse6JXho7GRGPjmOlTtZ/BHUthAth7N@vger.kernel.org
X-Gm-Message-State: AOJu0YyDQHKtENA2nRNmQFR5IXpx3rNubQe+hTSemOx2W1iiA2tR9x5o
	Xk68CQ4JvyzP6k+R8csnCd5VIB7v7ysIIDmv0lEGPyWnoNN+VB48cB1g/4xqCja31RX++E9m+cc
	3Nzt59TCNnc1O6AfjRXpxVbdJk3hsP7M=
X-Received: by 2002:a05:6512:8050:b0:5ae:bd53:70f6 with SMTP id
 2adb3069b0e04-5b45910e0c7mr386696e87.4.1786692775664; Fri, 14 Aug 2026
 00:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812-input-enable-v1-1-81e5ca7772aa@amlogic.com>
In-Reply-To: <20260812-input-enable-v1-1-81e5ca7772aa@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 09:32:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLneywcc-c01_T+gn0B8R0eS-8L-uZaQFLFAP76d-+rMag@mail.gmail.com>
X-Gm-Features: AcwNN1XU3962CxPboANgIVgJxm4fwvuwzCEPKOHSRj5tMBUhrLoOJ-3EbtHxfvg
Message-ID: <CAD++jLneywcc-c01_T+gn0B8R0eS-8L-uZaQFLFAP76d-+rMag@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: a4: Add input enable pin configuration
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 12:18=E2=80=AFPM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Add support for PIN_CONFIG_INPUT_ENABLE in the Amlogic A4 pinctrl
> driver.
>
> Use the existing output enable control to configure the input enable
> state, since the hardware uses the same control with inverse semantics.
>
> Also update PIN_CONFIG_OUTPUT_ENABLE handling to return the actual
> output enable state instead of treating any non-zero value as enabled.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

I just applied this because we are close to the merge window and
it seems important and looks good to me.

I can always pull it out if the maintainers object.

Yours,
Linus Walleij
