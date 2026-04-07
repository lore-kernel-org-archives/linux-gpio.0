Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A8E3A6F09
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 09:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775555708; cv=none; b=s8dc55Jf6PRo+sjkhUEoRU/fAUb0wqmbi6VobFCgiXzeTHJ7YN40ovY0pFLY1wyl7ru8/oESlPHgrhAWZ26MrNc1DcAYJigLs6QGJbaaDpfDVlnJBruGySglHqij4zUP02QxAQwMTdx1cnsoe66HtINv4Z1SIg6cw0ZOrNyq9Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775555708; c=relaxed/simple;
	bh=YYcuBCy8FB/LfjnQ+Sd7xtA4Uh6GIEqLge4wbuxDlj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a4z8He1L0CGt33S+tixI0LjNCHIZQCq1GdULU4I8OQbKN+XnK9oIRHs3zj9V9RTU2SYCpnUvpte0UZdixZQvGxaW1S5+thefEH0EvLMpalWRA8Lu1FJzaWxPdns+kTdYv13IboxViu/BeIqqIMClYlABqVLc6Vul4IBvSztbzCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRN3Ilnv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRN3Ilnv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B69C4AF0C
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 09:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775555707;
	bh=YYcuBCy8FB/LfjnQ+Sd7xtA4Uh6GIEqLge4wbuxDlj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RRN3IlnvP+pLuXjZiWiUzK6GoFm8IMeNV9ZF2tQw1K0pZxqbEiLTfaYhRuRclUFfL
	 xr9BG0msTm4dWc3mgzdGzz/k4UUyHBR5OhAYPgUKpZQUu/unvQxTps4DiOR/5kWwvX
	 AEPE4vtmnoVaAP9aUf9SGe/qBuDA1YY1ndVKZAw+2yt6S3NLdYQZzh3j7eVgHHPfzN
	 pLdjTbrztpaYfXQv0LTQSR/cFzXhplFSVabaHtUngPX+b5NCZ9OrESCm+xl/5pVkh+
	 Ed5epQohR9TttnxN17pGbjEjbmhYQisO63KaEkWmRVikOw83nT3QPs3BzFVz+NU6Yj
	 z855n9Oz0qT3Q==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7927261a3acso40641587b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 02:55:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9t6t0SNpOo1lt4qCcwQadxIcXNetOfm+XT7WJ6QYnM4c9kzrgrigIF0BFIL8lu2jN7zvO3cYERpr5@vger.kernel.org
X-Gm-Message-State: AOJu0YzHkud9JDys/4XHnirELO2WITn/jDiREy0l1uptvh6OYS9ITosh
	RkT3zrO68tuJjKg+VJmaWfmyrQhsEydvSPjrfRHUP4LKx+EoWQj3Eh403JgnI8wkWvQ1No5DlUL
	+HMikBJQlTDu4tk5ROkCCYRX79BH5Li8=
X-Received: by 2002:a05:690c:4b11:b0:7a2:80a9:93cb with SMTP id
 00721157ae682-7a4d89b6536mr158041047b3.39.1775555707112; Tue, 07 Apr 2026
 02:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com> <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
In-Reply-To: <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 11:54:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLkuvjUQdGZs8ot50Zkpmz8sWV_w79ALEC5z7-ORSxwyQw@mail.gmail.com>
X-Gm-Features: AQROBzCEF3mkoluhHfg8x82mQ774Vgk-cLhHzCJxhsWv-yqL3X-1857Zvpg_ikg
Message-ID: <CAD++jLkuvjUQdGZs8ot50Zkpmz8sWV_w79ALEC5z7-ORSxwyQw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: qcom: add the TLMM driver for the Nord platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

thanks for your patch!

On Fri, Apr 3, 2026 at 3:28=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Add support for the TLMM controller on the Qualcomm Nord platform.
>
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
(...)
> +#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11)    \
> +       {                                                             \
> +               .grp =3D PINCTRL_PINGROUP("gpio" #id,                   \
> +                                       gpio##id##_pins,              \
> +                                       ARRAY_SIZE(gpio##id##_pins)), \
> +               .ctl_reg =3D REG_SIZE * id,                             \
> +               .io_reg =3D 0x4 + REG_SIZE * id,                        \
> +               .intr_cfg_reg =3D 0x8 + REG_SIZE * id,                  \
> +               .intr_status_reg =3D 0xc + REG_SIZE * id,               \
> +               .intr_target_reg =3D 0x8 + REG_SIZE * id,               \

You can drop .intr_target_reg as of:

commit 0720208b37ae4f1193dc7103ee269b180a8f8943
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date:   Fri Mar 27 22:42:40 2026 +0530

    pinctrl: qcom: Drop redundant intr_target_reg on modern SoCs

    On all Qualcomm TLMM generations from APQ8084 onwards, the interrupt
    target routing bits are located in the same register as the interrupt
    configuration bits (intr_cfg_reg). Only five older SoCs =E2=80=94 APQ80=
64,
    IPQ8064, MDM9615, MSM8660 and MSM8960 =E2=80=94 have a genuinely separa=
te
    interrupt target routing register at a different offset (0x400 + 0x4 * =
id).

    Replace MSM_ACCESSOR(intr_target) with a custom accessor that falls bac=
k
    to intr_cfg_reg when intr_target_reg is zero. Apply the same fallback i=
n
    the SCM path. Drop the now-redundant .intr_target_reg initializer from
    all SoC drivers where it duplicated intr_cfg_reg, keeping it only in
    the five drivers where it genuinely differs.

    Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
    Signed-off-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
