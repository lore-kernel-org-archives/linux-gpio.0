Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926119;
	b=aeOxdemjLgboXqbpbqzTVLpGVJcMezUMoFAAJTn4vb6vf50yvLsxV68fms4RclnwzURL
	 EqBWrWHB28wrc/BO9A4mG9Lc9RqwOVmnGYkonABc1gN1jZknHBaE5Hut4x5rnXvk1q2Y7
	 RilBqdXikEYEaKg0yOHG3SATMK3cY8HgF8NN6c5LUGrVDZjoVbJ497qOTuv6nAU541HzP
	 3KO6ErZhS1Xj4IfRE+q+cgX15fYhK60rFbh8dkOnBzCWseHuP8V0LKJM6+4QsMtZNGj18
	 CxLMwV8reQ9lUJwgSa6p+raI7Lmg9p23f/eOY33Yd7OtD6fkEj6l17zjf7llXeSga2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926119;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p7ojMjj4LC4SS1WElXDJT7WyRei5tH4ru8glaxJTYq4=;
	b=KD4gjHbeMOebauSBfBfD1u6t2fzmW+thay1oDGSa9gy63YVdYoYOm7YBEA3AHlC3+4W+
	 epfoz9wjGYlY4rMjbMrSM09c0RA72Zo59yb3/QhkQLIzvCdOZNnPZZPjnFo7K5bkF/9zI
	 3hhrODb7yoIx1eGUGLv+A2aySNGAfPVzz/wG5illE8yeezb2jgPZ39go13hD7uzJrVgYQ
	 AOkTNOZGlK0SPdYZLMjhB/zy+P6yohYs01fM/4JepqMtax9jwT2/fMe9W707iO8l5aLIu
	 sRI1HABJ2E7sE67PBBDQbFkJ8Hfyx7xQXp+mlECqw+gecIoALkndS9TAswUEW0zkbEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2723F606AF43
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 14:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2723F606AF43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso1466900e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 06:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926118; x=1795530918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7ojMjj4LC4SS1WElXDJT7WyRei5tH4ru8glaxJTYq4=;
        b=HeAy+p8V42cgDfgzwJdmhaoq7OMxlnsKfiBcsBU5gDITZ90qOCkJMV4akIT7ZtocNw
         cIQIWy1sOG5GPjDtX2ISYq9/esrZ+hd08NgE52+UsRog0WjWn2U+dLHldV7ca72Qb+7M
         1R+q2OaWlFGk48qnGPa74Ej2tNZ8YCAm+shqFFobDydLsLfNp3O4ooCIRQaClR7g/xdm
         UkWnd9SW1+kyd4SCaLesRSo4Yid6JOqZMrpcw08O/KHdelM/lvOIIXqeTpwiLTIBUt3G
         mJG7hw7pzUB039Abm8e48Ht6jN/VL0nFrL8o3hS3BBkzt4VU9aSq8bnQPf8gdKWquoAu
         Dlhw==
X-Forwarded-Encrypted: i=1; AL+hErHo6ceIbevcS6DhtYRfKkO3FHlvltBL6kQoTQ++dHAMb/12EtI96HISR14yUmLSFRkJ5TO6IDha2hUE@vger.kernel.org
X-Gm-Message-State: APuU4Z8I/1PIx9ho32Ax2qZJ4UxnP5DZBVJeA1U7QfAaIEw8mc5y6BbT
	xrIdHv/3PKG1vWQw4XUkT7KpDIaNL7apjihpBHK9sZRd0MiDSfqmTwHygyf6CI/z
X-Gm-Gg: AYBFou3W0FxAl5hYZuUDkGtj5ZwfsmTq2IV7H5L1mKGbaWICZcawnebbJxs2DjDZp0n
	U1x3uYUIJZWuK4TkiYv+ic9NvjsAsXdZbXCwqPQAfPJuwqMPvzMhdUqrnhdjrALUt1Y7TCsNeyB
	knbyQkhex0cggQsy5c8Ws9dcg1dV9fbnHsASB6pYoso6+F/pL3fvlEtwS0mcvRdaUMsC/eRola7
	Kqbpm+RAXXv1f3k2aliBtwY4/YlETcE1Rc1Yqlapojmo8h/oZdBDMwywrF9o5TCwwQ+xBoHOTAt
	oO/UlHcVYHkLFbsWC52UJ7Dux6n2JkJ5gHe1mP+hgOzHDrZLxcz4C5+kWMU0KLZQ8O8rJSrbtsO
	7HPvxrCAR1s9vdYsyHiAs5ltc8RfB2fukvtUxgr/z5L22slv42y9Q43X2fpFy7yzh0psLnmwpWl
	g9AZNxymEGwcTrH/qO5MftmAXPdYwtCyaJPhvJGk+r6BF3Tvt23zQ7fHoHwmlDDoEf6/reIwBgz
	AIzuLkYjOjWB6zXAly/Bpfs0WQjiHSrVkl8gwTzD4aBgq/WzKdv2hKjGwpfrZIxrY0A3oTBWVYD
	VvJkeuisAktFAhnHmLnqHTYwe0GLhVSRLVi3aASg6mJ9MKBqrek/rYjiXzx8ed+uVuU=
X-Received: by 2002:a05:6122:3127:b0:5ea:bfba:f540 with SMTP id 71dfb90a1353d-5ee346585d4mr4980678e0c.1.1794926117939;
        Tue, 17 Nov 2026 06:35:17 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34e8fe0bsm8442630e0c.11.2026.11.17.06.35.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:35:17 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-77bf892b496so1467269137.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 06:35:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHV/w8dqYDwxwMvfCf5CVVgfMbEWObwK5XYMVjVPUtQYalhiPQoyFhXfY0ueSbOmGDruUtjz1O5hguO@vger.kernel.org
X-Received: by 2002:a67:e118:0:b0:7c1:bc57:c7f5 with SMTP id
 ada2fe7eead31-7d64d69de8amr3553023137.12.1794926116643; Tue, 17 Nov 2026
 06:35:16 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
 <20261113-clegoffic-pinctrl-scmi-gpio-v2-1-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-1-faccb4685d88@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 15:35:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com>
X-Gm-Features: Aa3M54qy9_Rj7xaMwVGFv3qcI8VRtXgzHIP9TNCjd9LuAgCDDCHrVflQc6VrO_I
Message-ID: <CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] pinctrl: scmi: send the drive strength in microamperes
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, 
	Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cl=C3=A9ment,

On Fri, 13 Nov 2026 at 16:02, Cl=C3=A9ment Le Goffic <clegoffic@baylibre.co=
m> wrote:
> SCMI gives the drive strength in microamperes, but
> PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
> Convert it on set and on get. It is the only unit that differs: the
> debounce is in microseconds and the pull resistances in ohms on both
> sides, and every other value is a flag or implementation defined.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Thanks for your patch, which is now commit cc2f90768e971bcc ("pinctrl:
scmi: send the drive strength in microamperes") in pinctrl/for-next.

> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -14,6 +14,7 @@
>  #include <linux/scmi_protocol.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/units.h>
>
>  #include <linux/pinctrl/machine.h>
>  #include <linux/pinctrl/pinconf.h>
> @@ -155,6 +156,14 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_co=
nfig_param param,
>         return 0;
>  }
>
> +static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,=
 u32 value)
> +{
> +       if (param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)
> +               return value / MILLI;

Does this need rounding?

While MILLI =3D 1000UL is correct from a numerical point of view,
it is not correct from a semantical point of view.

<linux/units.h> has:

    #define MICROWATT_PER_MILLIWATT 1000UL

In the absence of a generic conversion value, "(MICRO / MILLI)" might
be better.

> +
> +       return value;
> +}
> +
>  static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param=
,
>                                              enum scmi_pinctrl_conf_type =
*type)
>  {
> @@ -167,13 +176,17 @@ static int pinctrl_scmi_map_pinconf_type_get(enum p=
in_config_param param,
>  }
>
>  static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param=
,
> -                                            enum scmi_pinctrl_conf_type =
*type)
> +                                            enum scmi_pinctrl_conf_type =
*type,
> +                                            u32 *arg)
>  {
>         if (param =3D=3D PIN_CONFIG_LEVEL) {
>                 *type =3D SCMI_PIN_OUTPUT_VALUE;
>                 return 0;
>         }
>
> +       if (param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)
> +               *arg *=3D MILLI;

What happens if the result differs from the original value in =C2=B5A,
due to truncation or rounding?

Likewise about the use of MILLI.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
