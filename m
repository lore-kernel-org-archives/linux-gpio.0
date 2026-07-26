Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748F43A783B
	for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2026 16:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785083897; cv=none; b=cXZIoRw/3WkuYlF7A1GjJR0s0c2IT1tSQD2AMGMGSJ7Y3MbBJzzjKxXu7kF8+5y5OC3fHR8SQcImKGFYA/u8lz5YJGcfs1fndZozf/JGjb4ceQYQm9hDvpU1m3UBMdlAGLvONv1ycGv5QomyAsggy6geOTBIr9KympYfAC9U86c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785083897; c=relaxed/simple;
	bh=B4Fc9JZfKK/Fg1QefXbF16mci57LO/cRb4hs4D13cYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOv/+1Qx8B8GA4XduYf2PJywaNGc7Vep1Ng4PLvDmSBkAUQbNsw/w4dxxy2zbn9EiRdES2iOExbYZT603uUR1CmaTygK2rr8w5PsNCoWmU+GYI6xVp+zM4BMdvSJcaGL8AHmV+5eiKKRwqPbKiy10NZ6/GS4PolS7pxfyh5V6Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIMRc+3G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fIMRc+3G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253331F00A3E
	for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2026 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785083896;
	bh=B4Fc9JZfKK/Fg1QefXbF16mci57LO/cRb4hs4D13cYM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fIMRc+3G/NHYdr0V78nLnnSQY7NAEHTVo8nOEbbxBCX9WvnXNYnqCZtY/FBOHzOlI
	 1jtFo7XvQ87sNolwAMB/gz6Gwhm8NHyjqLhcRF1VxtIKwb+na2lDltoGLgzSGkFice
	 e2dLP8LVIS/fkgHd5WdmoYVoAXItGC5alUr422YkjzJpAbRLsnr1w4BSzgBgrW49tH
	 GcbTxX8oFksT/BA4bdJ89qsorq1qv3tAUcxPzILMZnWPI+Ix1V8N1zcqt2OghquTA4
	 Q8NULFCKUCsij7BSQa/J9GaDQ6XO3TEpidDwkhl449DUNLzOzVcyXG+vh6B7M+O1+u
	 r+vQLcz5976iA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b29599b81cso1890587e87.1
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2026 09:38:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoLtRd+dTgvMVGY7/tTT6aJfzyLFbXBtwyRjeU6BUJ1U8seJFUFkwJq2BcAcvlzdkJXkw0SOiDtOke2@vger.kernel.org
X-Gm-Message-State: AOJu0YwTCWpmB0YtiIijT35iotA4aW0fR8gIYBSCRLsm2+AR4sQH9MPj
	z2Grrxr1h2PLES/g/jE64/1Bj5GV3MKOvEP5UrH8kO7Np3+qXuZD7H17jLmYzwC1ueBdcX9TcGB
	WHiKyPrEB6aV6pizgZEWCbq6nxshF8mE=
X-Received: by 2002:a05:6512:3d92:b0:5b2:aa7e:b8be with SMTP id
 2adb3069b0e04-5b2c1b5d658mr1001595e87.43.1785083894689; Sun, 26 Jul 2026
 09:38:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amRpvtNAwIQak_9y@gamepc> <CAD++jLmXdmgWPenz=2VspSZHa4e7bWYJLyDrWDMjaEXHHKBy7Q@mail.gmail.com>
 <amYl90gvP3QSuTcP@gamepc>
In-Reply-To: <amYl90gvP3QSuTcP@gamepc>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 26 Jul 2026 18:38:00 +0200
X-Gmail-Original-Message-ID: <CAD++jL=YrcrDBxM0=XZ+w3gUzpFFNvcu7kCsToQtD5NxVBOUOQ@mail.gmail.com>
X-Gm-Features: AUfX_mwG6ff8qgG5IsIrToyTn_0K4c74jcPcVBYvXoYDDDK_-n5Esc1rT89KnSQ
Message-ID: <CAD++jL=YrcrDBxM0=XZ+w3gUzpFFNvcu7kCsToQtD5NxVBOUOQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: realtek-otto: add pinctrl support
To: Michael Zavertkin <misha.zavertkin@mail.ru>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2026 at 5:21=E2=80=AFPM Michael Zavertkin
<misha.zavertkin@mail.ru> wrote:

> Should I also add pinctrl property to required in realtek,otto-gpio.yaml
> for realtek,rtl9607-gpio?

What do you mean? You should use gpio-ranges so add that if
you don't have it already:

gpio-ranges: true

After adding appropriate gpio-ranges to your DTS the pin controller
will become a back-end for the gpio. But certainly you must have
done that already?

Yours,
Linus Walleij
