Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0135330D25
	for <linux-gpio@vger.kernel.org>; Sat,  3 Oct 2026 17:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049762; cv=pass; b=c0sKnk5HAQMvbUflIEL5BL3BYig8fMAIw7551FeydZQum0PvGxVcVILpwoG+ryylTiADkWbgFHWKCfjXOqo3/yDUMEYETFkU2Ohb1+0VTNmVUGOo/+GpUx6Yw9yrzisXj9HUQ7k8HjCnxaukx5wXoVg2nKoeOHxYLA3tbaGWji0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049762; c=relaxed/simple;
	bh=YD4inc+qwfxdmXNsGOoWhpIhRzxHQkYvOht1VXxPM9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=By2QWBtb4bFNOFKZiCIXuOfG1hZOJTTakt/MiBqg6GkeCs6eshhd+F+6R4GjoShxv7WWMYbheWeBqYUmoVW83WMKV8LIJUgVhb/ODSURMZpmuLeMAkFVQFnOyOnGW5c4rMs47nm08FXVu1bRZhY7qfTnvPb7hfBj2TqKgLFBDjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pv9Nrqtp; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pv9Nrqtp"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e320322edso96982766b.3
        for <linux-gpio@vger.kernel.org>; Sat, 03 Oct 2026 10:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791049759; cv=none;
        d=google.com; s=arc-20260327;
        b=Sgjlh/tC7yPcRWyZ/WIcaVIEcfgeDPTmVUltpq32sTxHxYJZoHwF0l3wjPlov+8B7/
         mssQQte3oSXCrrbwEZwBl0sGjWzBgZfuYRiKzFshGBbLSKVQXI0864Q/n7Zs2CTXEZu5
         IfKJaRMeStnIt3iG2EGbXsLTPW2ZoW+04O2Sai56pU8DcF1X7kvxvuxVATPYjReyThRQ
         KToGGH3xtKXl4SiRCz2ZW9VNiL7jerheQdKDQ70JGQVrVFeUW0tpHlDPof1RjmKFgLP+
         ydYU3N93UIu/1aQ9mZgYOb6C+4mmCFEHUlZkq5KbVNDzumf8DLPk/5KmIm3URhE6hS/M
         Eq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+WfZJzlgONzbxalec4u0IRr2LpqiF8fwuZ/ksV/Sowg=;
        fh=fC0B8gJuEHTK7f0WwavVmw/tsNqAmUy8rMsEi6qYfAU=;
        b=jRXhLleiMQX+M8ZwlmEsnvcgjhzI03EKNVm1Lekh04oJxtpu5BuLUBpjcls45BZJpx
         YAp8Pwa4bby/LJuJcKid1/N5eruZK2hWpFMzIOkkUTcr8O+FWFEv8XUh/xW8wi1fu+K4
         PbP4910btACqgFxwshGU6PKcbR1uxBQFV8C5YY6nxShDSK0lp+kvQ+CdJvcA8TQHm7ET
         0m6tduR8tAPc6jNgVhdp0Fvj8yuCELEPpVVzOg4WGzWC+ooFTjAUjKpSgy441RWVjJrc
         +BkwlDlbatDy3z4INGUl6aY50HJgcdnrKR5roLR6LgZslI86OKR808QEEvLV40uUSI0l
         P+Hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049759; x=1791654559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+WfZJzlgONzbxalec4u0IRr2LpqiF8fwuZ/ksV/Sowg=;
        b=pv9NrqtpWHXs9VGhJNtru7n5WDUWWlSVGJkmbowOiAPz3nf9gyf42v5uzkhk2v2zHz
         boBHY+sCvQ3fCnxCCtS3f51tYR/EGy/ucNWpSNCoM2UPq+r32b6zXmxytUOpkuDyPHWD
         IsLyywZcDfpSAY4yIxgjOENLwk+IqhGv//cG0iVje+Tdkp/q3z/75WK0utih1cmGg3q9
         VpVpjnOAW9YPZj9T2eVdALvSV7oAzMOKhRzS8T1Hbl2wCszNtXLY5W9TX0cRhg/OaUS0
         uTZQ/YqlUmYNsACz7vpGz35vITPIND+ey0XSQHWJmZ0WUlfCp+rrMV20kaHzahCPtylH
         UMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049759; x=1791654559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WfZJzlgONzbxalec4u0IRr2LpqiF8fwuZ/ksV/Sowg=;
        b=Vmpp9Aq4Xoe28xighQcaB0ISnd5s+VMsmaJl82AWXbVdK5oNZHuE59Nnc/SgpvyQJc
         U7819EnUkBKgRyAHWHpHZOE8NbEUpWODVsMnUn1r5hlQEnIwNAT+AZbOu4JeZJ40HQ+4
         RwpwZCgzw3GS5k6C1C8rbe0FlI3B4X8kG8xttgn5BAP7NO1vdltHqFhPfmBEfdq2YlCG
         slE32fKyo+zxhcdnKSbGuUoDN2Fv37W3Q6/OHXbmnfJIDrbDqXDC+xMMmocJ6lvG2L2d
         pP2+ZSFDiXAawrZ4lEPsywlvM59OEz0djbmY1/6XBEXl6qpLhvcR0GWybQs1bBCpfihM
         KQCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYgiFSUA4QY0pek7aLfGbf2p7VHp3/DRXVrasdoOK2ubl4pyugDJwRH5sOWr5+BZZUzV6uX54C+WId@vger.kernel.org
X-Gm-Message-State: AFq9FYK1wmGb6IsYbFWgSK/InTVNrtOwLc6mNCzO0NLWCZzOWNI8c73m
	FbvQv5w9//glD8wkOBqJvM4Ch+Xt/ydVaqlCP+fv8RlIBJq7nM87YP3Q3yy3v24Oufr6ERTZ1i5
	MkYKFbnMBlGmSAHpcvQ4SAaF0xk3Nug4=
X-Gm-Gg: AYBFou3Xggk/OLaMxOdGgeQjdebJ52SEDr2Uv+iaU+/syGS/6F6Qhk7Cb4oGXaLCYge
	2WX4+g1DgWiPqw59HZzztm7OihlKPd2cFHsaDCn+bJ694A3etHFi+3UqU5JMRKna9U0PR62ACb9
	D5UkcNKou+PTzFdE5BTBRqc+syie7TLY2muxKx682IsM71MNEzT0cwXHYcPP7ipPSu7iHoUdIzn
	yf/ywahDfVAa5+ccWDehaUHBdiiWgPzccjiyW2buCjyiD7busr+9TjK5EMvFn8wJOCGsEn9aBoA
	yGm/ZjEjg4CIlKI30KA2de3jtYAkjfp5whR8hZGgL0bsP4AJtH4lQpeIqLyfXjmYKJACOwyHaYL
	QlQ+l7LGlToTmlnw9ua2f9WjgXXr+6rcm/W7+CEIIfxZr2VmVPKg39OjCueiMNK06X7xOFre6HI
	Rv00oVmzHxropM3qtDig7LCNRdYQj5g3RUCWpBBLbw
X-Received: by 2002:a17:907:3e8d:b0:c2e:7da8:f7b0 with SMTP id
 a640c23a62f3a-c2e7da94cddmr75113166b.30.1791049759013; Sat, 03 Oct 2026
 10:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-4-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-4-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:48:42 +0300
X-Gm-Features: AclHuK9Bi3Crqpp_pF3AiMgGWXYXjjoKWwAR4Jh6xG5aSPocrJMAmDcagVfOoRQ
Message-ID: <CAHp75Vfy7pbHaANK2pv6TSWctn9phVwby1vMjY7akeFPaKn2-A@mail.gmail.com>
Subject: Re: [PATCH 4/9] gpio: mxc: use devm action for irq_domain cleanup
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> Replace the manual irq_domain_remove() error path with
> devm_add_action_or_reset(), so the IRQ domain is cleaned up
> automatically on both probe failure to eliminate the
> out_irqdomain_remove goto label.

...

> +       err =3D devm_add_action_or_reset(&pdev->dev, mxc_gpio_irq_domain_=
remove, port->domain);
> +       if (err)
> +               goto out_bgio;
> +

We have devm_irq_domain_instantiate() and the respective wrappers.

...

>         /* gpio-mxc can be a generic irq chip */
>         err =3D mxc_gpio_init_gc(port, irq_base);
>         if (err < 0)
> -               goto out_irqdomain_remove;
> +               goto out_bgio;

This is simply wrong. No devm_*() call should be followed by goto.

--=20
With Best Regards,
Andy Shevchenko
