Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37843AAF78
	for <linux-gpio@vger.kernel.org>; Sat,  3 Oct 2026 17:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050384; cv=pass; b=Y3w+HfOlObfT+OGAh9psUngU1fhQIqbEsYQsaZhG1q6aH6ttAVbTTRUTjIM4yMwLOjT1ogPHrVquxOwu+jrJlTJFn6NWC9uk6wrdoBOgvtlYHz/Cta7c8zasA/lO123hNvuh5+SGzdEFBY0pqFwsVc2c1gOgoLNg260I5+InBgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050384; c=relaxed/simple;
	bh=izuBF8S1Jow9r5hzBkHRDbHLg5CQ1A34xxxD1x1CJtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2ZBZONIah4m+V7i8QPCfXH0nvfti5J/gbaJqinC3BVDHZigs8GTKmbVZzqoSIMHMvSIMxdKcxmPDg+iLZcY7eYJZbrgBSniRh3Oe6cEKlQiTmoWNZa6KQKXLECmzdrF/YCkAkGV24PLvEFf8FrOpfxHLsRiaP3Adcn14sPDDt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iqz2UoE2; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iqz2UoE2"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e27d11f43so58161166b.0
        for <linux-gpio@vger.kernel.org>; Sat, 03 Oct 2026 10:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791050381; cv=none;
        d=google.com; s=arc-20260327;
        b=Oe150JsAryNTnm1yEN04pFVtLoCuhdc31itMvdMMaekjgV4gd2XQOqZSfN9yHl/iz0
         V88Dm6R2UKI2aD65Ao8DlLKgoCtUuUgWkk1zwz/GOcFDfzvQ6LonWfSk9YCSFGoN1hLi
         XXZGh2g3aUhQD3BN1qawVPvkjaPjxvtTfpdKK+YwRtmlmUgpocq9OZImMsv+nws04weZ
         cSgVRtjb0tF0wZKHULnV9AUWqxPtU6kF3h0ZUhK4G34qJaJLsZtbzmpBmDGWSmFDcO1u
         b6MlEtr+hl3vHZljEw9HwMF2+yX8HHTYBbmSrV/dId6PLWsKPEYv1EiQg2/0aSKFa60T
         5gww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZnj3SSIl2LiwkfFgN70DpIUxoFz8apLMgOo9Neg9z4=;
        fh=inRfMEVLWq2k85rc5KLa1bcnG/iZmrhkx6FnpRZOCKU=;
        b=MLFOL2qnexYq6j3VzthDJBftwcF1QVMLUxbES56wil5lKlfuj+mR7PzC98Hz7vYcQd
         WZa2BtfkCNJCwEkQ42J1GNeRkc/WgJuCpractkfzbeG1a2APle0lvDcQbCXX4clh7HKv
         ZnzMz0rPuDOlNWPdB6r5NShKUvRvg2zANvvmTkzOwBp3+ou7Ws857JNhzdgAZq+Zr1X7
         HPG0qNbOwfZq0dn44ShR3GUn994xO2d7KPrqiATccFimFXHFYh3npThBlVuxgOFQRXVe
         A/QxYvubr6p6nD5fh5YVZQoH2XotTrbBNkFZnR7wiC58gwSR9Ovi8E8MOJP0VQd/u/BP
         3zDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050381; x=1791655181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZnj3SSIl2LiwkfFgN70DpIUxoFz8apLMgOo9Neg9z4=;
        b=Iqz2UoE2/6vUNWCJ0tXZN4NAKJc0/Gwy0GwDIGZXW+V0186brxC4mKq0lMZ0CUrtUQ
         95O0eAg6IC/8eTgQogpKku+JT7msTJ5fU2e/8jjCrzPWIsWUf5ixaVRGxLSbjDhOdDsJ
         1hZVMX0YlXZQ5JqupHvOX1ZZyDJJpBN0YG19pJJ/rQ0X+dq5Lkk1YzNNSegY/VqZbN09
         TJ4oSNoCwEJbPYCfazh7g4AI8YSLX+fHa6WXniZe68ZXZSdAeXAFeJUjboaP7kf0Ac1r
         8/PGyelQ2ik6X9xf7iAkpnKLxWdEJr+7Ozpe489KOLzCSLOMcybYbzON2k79whmdT1ph
         Zr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050381; x=1791655181;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZnj3SSIl2LiwkfFgN70DpIUxoFz8apLMgOo9Neg9z4=;
        b=wUZgcKg6YJpXW/E5jSpjj/ltfRx50L9UpreRIsronbmxsnqdQUaeiRQWlO+CAtWHuO
         S9t9j1uiyxoidhmNHW3PJbz8H4TYyx3uvb2Fqyl2EAR6INpFr0gJbMSOHcTh1yrjkFE8
         YWOh/Oq5+sV4+UmieM4HnP4lmk/KRSJw0bGirsGvu8tVubWqaI+qv9VqqtHFz4vxGSln
         zViB/hqHKysnobC5QsADwh3kb7gscoFBw6G36suLAahm4p3WtOAuAz7RedWSB0JqNzpC
         P0CrGFpcICW/WPSCDgWciqpmojl1YAqW4zboBnEtqprgEi07I5IRYtkpSNrSxwp4NmTI
         hgkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQT61/fU3gkMQde7Awkc0k9Bf7YltPP3+ngYjTVheSMKupA9lwcFhp9i0wKtKDg2ZJHx5cLuyG03GH@vger.kernel.org
X-Gm-Message-State: AFuF++lrEhVB8GMONFPT1RnnaV6/JqSv9PnyzsR3HZ8n3kZlWft3IXke
	Y9pkyl9n7URT8mxKRI24yIhv3tS0hFzcOVhgA8BPsf5FQRspAzVXMuCgvE17o3jmgrSKGTuVlzR
	yynwl1O1pa8v2RSQKkIdcuWYQ7WhC8UKB7QaM7GA=
X-Gm-Gg: AYBFou2T1URyKVnxHqXq/gJmYLIzPOoQz4yMEtKRGAsXXyUi5ziItkvpplKiKzN6l5u
	srnYOPaliP9ixL+Wy3nX210fJ7JCH7G6e+F2OKbX9fUYgqe++B4QTxSW579JifayQu1kD7q+MVb
	NrLltyvMoJXdoFk3GR4SwbOFFM+IlXbBVjLI38QpLGf9GD1dFoULSENnalsP1cZh0uEaydHq1t7
	1D62tL596HkY20eRPeHZhkZiXryS7ygHVI/dMRs+za43im/NTlrcMnmoxs19yotaN8Z9XgFaPRm
	e7MHwCGlHCT4fVPNXNpG+6up5zeFhLZGvm6AEXTypg/1RmhNJULcS63fCTpxdPw/7W2KLWdqJQ4
	RH4LPzhxaU52Rgv1j+PJd1geDOBogBajvEp28Wxj4n95Uo8Av5hHeh8dehNGvSrTKnlSdg3a4d2
	m96XJvZd9bhNXORtE90Pwh+DaEmebSkrDaenFW/VSdAuVrTdyS2Ks=
X-Received: by 2002:a17:907:3cc2:b0:c25:f7db:4bec with SMTP id
 a640c23a62f3a-c2e4ad53be5mr531992466b.18.1791050380759; Sat, 03 Oct 2026
 10:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-9-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-9-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:59:04 +0300
X-Gm-Features: AclHuK9OR6BXTLgAb_C7YKLGSH3aGu_DtrvC657Cue-9gwAbeSx8tKkdBHiKuRM
Message-ID: <CAHp75VcRG-LzWSsg8neDOS7qj0wfp3QMoKkDKEYhoobRbfv+VQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] gpio: mxc: simplify gpio_set_wake_irq() with
 irq_set_irq_wake and assign_bit
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:10=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> To simplify gpio_set_wake_irq():
>  - Replace the enable/disable_irq_wake() if/else branches with a single
>    irq_set_irq_wake() call which handles both directions internally.
>  - Replace the separate set_bit()/clear_bit() calls with assign_bit()
>    which sets or clears the bit based on the enable parameter.

...

> -       if (enable) {
> -               if (port->irq_high && (gpio_idx >=3D 16))
> -                       ret =3D enable_irq_wake(port->irq_high);
> -               else
> -                       ret =3D enable_irq_wake(port->irq);
> -               if (!ret)
> -                       set_bit(gpio_idx, &port->wakeup_pads);
> -       } else {
> -               if (port->irq_high && (gpio_idx >=3D 16))
> -                       ret =3D disable_irq_wake(port->irq_high);
> -               else
> -                       ret =3D disable_irq_wake(port->irq);
> -               if (!ret)
> -                       clear_bit(gpio_idx, &port->wakeup_pads);
> -       }
> +       if (port->irq_high && (gpio_idx >=3D 16))
> +               ret =3D irq_set_irq_wake(port->irq_high, enable);
> +       else
> +               ret =3D irq_set_irq_wake(port->irq, enable);

> +       if (!ret)
> +               assign_bit(gpio_idx, &port->wakeup_pads, enable);
>
>         return ret;

This uses an unusual pattern, we check for the error first.
But also this part should not be ping-ponged over the series, it
should be from the start like this, see my comment against the
respective patch.

>  }

--=20
With Best Regards,
Andy Shevchenko
