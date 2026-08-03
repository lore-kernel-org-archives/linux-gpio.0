Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BCF3AEF57
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 08:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785744672; cv=none; b=dPG2+QjMqOvaKYmGn/HlhHkkfTlIL0dMONr7NE2Rw52AJyt98ChQqb4cwW5CH9EZyQgIFWL2rvHlmP4oTJybC5jaG3IfcpB9NKCoTia7JK/qCU07OxUEXhkwQeSoULAv17Ot0/8XicFkap3jiXnmgsFaLm2pmdfdI1OrWRs4f+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785744672; c=relaxed/simple;
	bh=uM28O1VgHFmn8qZ097jlz8X6iL+QUYi9QN5g4p9a7DM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCj2I/hr8YUud3bbPyVFUYMrHSTHrPYXMFRuzKFHz3vTT/hSTZ+qZpUT7GVfkveDwbykI2BZD0YZxFT8gglVlHQOpTbp+fQUoYrmiQZF5M3uKs8syH7ZDfSrR2hIYxsb7mPT4dLscGdgPIH5YHZEu3n8+YAG4T3esjrFMKy19Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFYLMkDh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFYLMkDh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA66F1F00AC4
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785744670;
	bh=1b9nrSK95yZpqNOCATuK8srF+lYk8+rYEDNNrA4wHQM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HFYLMkDhLfR+H8zUyTNVXWLpekoG8c30DS3FrIo8lG8X14QGybtCiwO87YJVh7A6H
	 5KpHSzeoDcgSoTN4r480+DY2wL018G4/mgmU4tTyaq2kCvKuzZhviuOo+eCHDNagEM
	 jo1p05dV7zCX6Wdrx0XsFJnmSTJ+WzoTXuQmE8lu5w0SDDNPWoet+gViBvHDtLUT8J
	 usQJyrrD5u0q2LSsH8UgSCQy0mXNJxeJX34Zd+1YfDgbVuUGnEGlKuPgCw83VEjqcc
	 NKhUdOPYboTSPT99O2BQfaOxsWBqKvycfPOsyyCRpE0Q5Mz8H3+HHIY1A9M7b17joB
	 K1tbwcjsUgamQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c7fd21b63so25418051fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 01:11:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrk6BAh/Z0t19Ul+DWGvxOzXW0JCsD06ScvwyuEvHU5oDSfUPhSYHdEGYo8hZldm23GwH7xe/nvGD4W@vger.kernel.org
X-Gm-Message-State: AOJu0YxAvfW7fXTd5UWOP8xKoohNd5W+DtjnhFqiHxoU9UtIRNMAv5kw
	SX+1Mm7PFGsr1StgjtWC9eevqeMm4B471h4yjZdMtR4eEwNsinMzTvq44Jlwj7pFf8RdeBZpMlL
	A8xbs6WfjGzsE4BbN6WUbuRX+gyA5D/o=
X-Received: by 2002:a05:651c:150a:b0:39f:a2be:bc3f with SMTP id
 38308e7fff4ca-39fa2bec180mr4076081fa.16.1785744669449; Mon, 03 Aug 2026
 01:11:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-5-changhuang.liang@starfivetech.com>
 <CAD++jL=Qd8ADR_kX2Q7msM4Dd0xFayPGM4ZzB3uv2ufvkuybtQ@mail.gmail.com>
 <ZQ4PR01MB120228AD03507B4836EFE19DF2CE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <CAD++jLnNa6HsS5q5aYHxCLkQdZ3eh09PspO=eZx-4=p4EFr4PA@mail.gmail.com> <ZQ2PR01MB121089A3224D22A573A0875BF2C92@ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <ZQ2PR01MB121089A3224D22A573A0875BF2C92@ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 3 Aug 2026 10:10:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLn_vdk2VxupDRErNfqFNZbf7pimCrfnziRPTmDPm7toVw@mail.gmail.com>
X-Gm-Features: AUfX_myhWBOKTrh0pDXm3mErdt-aRaWUKZYTBMjotcYIiFbhzYYWetsahaD6aWE
Message-ID: <CAD++jLn_vdk2VxupDRErNfqFNZbf7pimCrfnziRPTmDPm7toVw@mail.gmail.com>
Subject: Re: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 12:58=E2=80=AFPM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> > If a pin controller back-end is used, the GPIO controller or hardware
> > description needs to provide "GPIO ranges" mapping the GPIO line offset=
s to
> > pin numbers on the pin controller so they can properly cross-reference =
each
> > other."
>
> I tried this change, but it doesn't work. In my new version, the GPIO dir=
ection is set
> via the `struct pinmux_ops .gpio_set_direction` callback, which is execut=
ed after
> `mutex_lock(&pctldev->mutex);`. I need to configure some pinconf settings=
 while
> setting the GPIO direction inside `.gpio_set_direction`, for example:
>
>     config =3D pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 0);
>     ret =3D pinctrl_gpio_set_config(gc, gpio, config);
>
> However, `pinctrl_gpio_set_config` will again acquire the lock with
> `mutex_lock(&pctldev->mutex);`.
>
> So this approach may no longer work?

I can't see all your code so I don't know exactly why this happens, but
nominally you implement the GPIO helpers:

struct pinmux_ops {
(...)
        int (*gpio_request_enable) (struct pinctrl_dev *pctldev,
                                    struct pinctrl_gpio_range *range,
                                    unsigned int offset);
        void (*gpio_disable_free) (struct pinctrl_dev *pctldev,
                                   struct pinctrl_gpio_range *range,
                                   unsigned int offset);
        int (*gpio_set_direction) (struct pinctrl_dev *pctldev,
                                   struct pinctrl_gpio_range *range,
                                   unsigned int offset,
                                   bool input);

Then on the GPIO side:

static int my_gpio_direction_input(struct gpio_chip *chip, unsigned int off=
set)
{
        return pinctrl_gpio_direction_input(chip, offset);
}

static int my_gpio_direction_output(struct gpio_chip *chip, unsigned int of=
fset,
                                       int value)
{
        int ret;

        ret =3D my_gpio_set(chip, offset, value);
        if (ret)
                return ret;

        return pinctrl_gpio_direction_output(chip, offset);
}

static const struct gpio_chip my_gpio_chip =3D {
        .direction_input =3D my_gpio_direction_input,
        .direction_output =3D my_gpio_direction_output,
        .set_config =3D gpiochip_generic_config,
};

And these will call into the pin controller backend for you, so you do not
need to set this yourself?

Yours,
Linus Walleij
