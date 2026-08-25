Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1D043F4CE
	for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2026 12:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662455; cv=none; b=QpKA2eUf+g6pRMwpJfWodyPbkvpNo5X4R5F31+0DZeCm22k3K3SUwqEHhElHkR5v6jhcK09EBhOOjbNC5Qz6eAiY9Pc/nCGpGrfDigK5vtRKaRrDXaX9rLyDzNqCb68a5iZdVwfsKn3eWa/QZgI/Jklh5Dy8+DpqgHkUxjYCl2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662455; c=relaxed/simple;
	bh=CaotQxU7iNU6c524dtH/JOUWSksfXQDDVYiUOPk3TkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IORRBjCoRU5VQresMnduoGQH0Cr0MG5rHrRR9CeE/uUCiJTK3zvauZHjtTC1BkCuX2dIA0QL8oCEhTuvqixVXO2LrbmVz3tjVeB7C8J/ZekOE6AvZ8KyxtAAHPBMLGkett+mbl6Aza4MBbxDjm0sXOUFHT5HVweqdLXsCUO4qMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7564b7a9490so557575137.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2026 05:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787662452; x=1788267252;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Edl2lWOUjsEtEInWLfhIYEcuR1CiWfh9q8iac3qNwFA=;
        b=YaQA9T/I4EVE3NOAzRnAvSbB5jzl3yeGDmKliEVO1mrTF978pBLS47s20bCvWPajwT
         B9/z7Av1nYXUlfdMdNuFgZ7kVSqaWAsYwDs9GU+kAgh+SmBw/3zxa2YRi4vqVKArp2Ji
         SdaA2A1IL+P/PWc4/NxQHqtmg7xznHr9EQWGcnbASQI7hV5wGC+g+FNRlxpGVU6z4jE6
         459JuJSAB6vpabuy7OvmQ3sUoSjDtCgNGZyRjNJj3tBgJicV0Ls576/VYME8uAajS6GN
         zsnWrsdU3FpMA5AnDHhZAOBdLtNv8w21D/s6FvXStFRvhi0w0BkH6oZMBmGLTHZAAxTL
         c3VA==
X-Forwarded-Encrypted: i=1; AHgh+RoiU9TfVFcTYR3lm4quLpXMA0nvUwOsEcQRuzwpFTqAqVzZSokngtTjsCJV4SCTwkhneQazOOl7wx00@vger.kernel.org
X-Gm-Message-State: AFuF++n/j7SSSwkoi3Or4fCOr1nic6PCuwFmMIQ48NP/2R/jPRxiyg2g
	4NAsurYBX843OeZ3P8tv+IaC+x7XMBDQD3aMDuajYMmoSDpp8D/BVIkSHoVNZUNLI/o=
X-Gm-Gg: AR+sD12CiqaXE+slwlehKgdBjEwo+rcoJIbKg7c8raodQN/lnC9LkIA1SIYqvl6l8UC
	HO4dYdMMp4jZl3ltDUzgD5K9a0oYA1LPzCrjFLsyMy9DfDjfWlXVeyNuAJz2n/VCTvdzZv3t2xs
	mFJwzPvkk5wi92byqBeec8kzWddLnF4wEATWcQDIzy7YrPsMJIQ4WxMCocfg00yq1DAuISwHdfm
	tUqEx+gDk4ksbuZF9i3ygHRU3APraxtdXAZW0qGGuGCGn8F96t5CWF5VTEbu+KGsiKnz1ohdQCz
	kQxyUGygngU25nELnczDoVyDrBpfdYgi0/xULRvL2fT3LpuKKAFRPIJEphrJ/8QFQfAdsmQ7D8r
	PmMcQpAtXrowY9yH4lFRvEq1+da+Dpwfaorcc8eFOXn+BywgAXMZcEFzgyDXVF5VF0riAXLlQyL
	H0eluTouI7/cojiWqxkS/jcqFKMV23i3Dce9aaCL2z6EHoVBGGEkwpsmKGDlaBOCb17j/NA/wzE
	4E9w1D3MG15tsTD3YP4BGuEUw==
X-Received: by 2002:a67:f243:0:b0:778:34af:bd3f with SMTP id ada2fe7eead31-77fd610463bmr1281302137.18.1787662452335;
        Tue, 25 Aug 2026 05:54:12 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-77d8357dad9sm5275991137.6.2026.08.25.05.54.10
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:54:10 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-77e35e008e8so632472137.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2026 05:54:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpqLUd725GRacJlIIWDzijZkmOBoyFl8DZp6JMRqJv4PwnUlZrO7rHBd49RLsxiQQN4n6r6MlOp7+th@vger.kernel.org
X-Received: by 2002:a05:6102:3b15:b0:736:f95c:4bd4 with SMTP id
 ada2fe7eead31-77fd370acd5mr1148905137.6.1787662449703; Tue, 25 Aug 2026
 05:54:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev> <20260819143553.2478984-4-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260819143553.2478984-4-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:53:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoS=LZ94aYQ=Tm4n+R_L-1t7gZQ2vvHVZMfanxb=1yHg@mail.gmail.com>
X-Gm-Features: AcwNN1UP9Sje02JijQSgDxiN9g9qyPwNFW9wB2YgLhT-mIKpO45iKkt9fOTFuRw
Message-ID: <CAMuHMdXoS=LZ94aYQ=Tm4n+R_L-1t7gZQ2vvHVZMfanxb=1yHg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] pinctrl: renesas: rzg2l: Unify the power source handling
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 19 Aug 2026 at 16:36, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The previous code handled power sources using a mixture of power
> source specific definitions and lookups in the available_ps[] array.
> Unify the power source handling by introducing
> struct rzg2l_pinctrl_ps_desc, whose purpose is to describe a power
> source through its power source value, associated register value,
> associated capabilities (e.g. Ethernet), and associated IOLH index.
>
> Introduce two new functions, rzg2l_ps_to_desc() and
> rzg2l_pwr_reg_val_to_desc(), using the
> RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC() macro, as their
> implementations are similar.
>
> These functions retrieve a power source descriptor based on either a
> power source value or a power source register value. Other functions
> that need to perform power source specific operations can call them to
> retrieve the corresponding power source descriptor.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> @@ -440,7 +439,65 @@ struct rzg2l_pinctrl {
>         u32                             clone_offset;
>  };
>
> -static const u16 available_ps[] = { 1800, 2500, 3300 };
> +/**
> + * struct rzg2l_pinctrl_ps_desc - RZ/G2L power source descriptor
> + * @caps: Capabilities that applies to the power source
> + * @iolh_index: IOLH index
> + * @ps: Power source value
> + * @pwr_reg_val: Power source register value
> + */
> +struct rzg2l_pinctrl_ps_desc {
> +       u32 caps;
> +       enum rzg2l_iolh_index iolh_index;
> +       u16 ps;
> +       u16 pwr_reg_val;
> +};
> +
> +#define RZG2L_PINCTRL_PS_DESC(_ps, _pwr_reg_val, _caps, _iolh_index) \
> +       { \
> +               .ps = _ps, \
> +               .pwr_reg_val = _pwr_reg_val, \
> +               .caps = _caps, \
> +               .iolh_index = _iolh_index, \
> +       }
> +
> +/* Keep the entries with .caps set in the first positions. */
> +static const struct rzg2l_pinctrl_ps_desc available_ps[] = {
> +       /* Ethernet I/O domain voltage 2.5V */
> +       RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
> +                             RZG2L_IOLH_IDX_2V5),
> +       /* I/O domain voltage 1.8V */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, 0, RZG2L_IOLH_IDX_1V8),
> +       /* I/O domain voltage 3.3V */
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, 0, RZG2L_IOLH_IDX_3V3),
> +};
> +
> +#define RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC(_name, _desc_member, _caps)  \
> +static const struct rzg2l_pinctrl_ps_desc *_name(u16 _desc_member, u32 _caps)  \
> +{                                                                              \
> +       const struct rzg2l_pinctrl_ps_desc *desc = NULL;                        \
> +                                                                               \
> +       for (unsigned int i = 0; i < ARRAY_SIZE(available_ps); i++) {           \
> +               if (available_ps[i]._desc_member == _desc_member) {             \
> +                       if (available_ps[i].caps) {                             \
> +                               if (available_ps[i].caps & caps) {              \

"_caps", as pointed out by Sashiko.

> +                                       desc = &available_ps[i];                \
> +                                       break;                                  \
> +                               } else {                                        \
> +                                       continue;                               \
> +                               }                                               \
> +                       } else {                                                \
> +                               desc = &available_ps[i];                        \
> +                               break;                                          \
> +                       }                                                       \
> +               }                                                               \
> +       }                                                                       \

You can reduce indentation, and simplify the code, by restructuring
the checks:

    for (unsigned int i = 0; i < ARRAY_SIZE(available_ps); i++) {
            if (!available_ps[i]._desc_member == _desc_member)
                    continue;

            if (!available_ps[i].caps) {
                    desc = &available_ps[i];
                    break;
            }

            if (available_ps[i].caps & caps) {
                    desc = &available_ps[i];
                    break;
            }
    }

> +                                                                               \
> +       return desc;                                                            \
> +}
> +
> +RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC(rzg2l_ps_to_desc, ps, caps)
> +RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC(rzg2l_pwr_reg_val_to_desc, pwr_reg_val, caps)
>
>  static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
>                                               u64 pincfg,

> @@ -1191,32 +1240,21 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
>         return 0;
>  }
>
> -static bool rzg2l_ps_is_supported(u16 ps)
> +static bool rzg2l_ps_is_supported(u16 ps, u32 caps)
>  {
> -       unsigned int i;
> +       const struct rzg2l_pinctrl_ps_desc *desc = rzg2l_ps_to_desc(ps, caps);
>
> -       for (i = 0; i < ARRAY_SIZE(available_ps); i++) {
> -               if (available_ps[i] == ps)
> -                       return true;
> -       }
> -
> -       return false;
> +       return !!desc;

No need for the "!!".
Then this function becomes very simple, and you can just call
rzg2l_ps_to_desc(ps, caps) in the callers instead.

>  }
>
> -static enum rzg2l_iolh_index rzg2l_ps_to_iolh_idx(u16 ps)
> +static enum rzg2l_iolh_index rzg2l_ps_to_iolh_idx(u16 ps, u32 caps)
>  {
> -       unsigned int i;
> +       const struct rzg2l_pinctrl_ps_desc *desc = rzg2l_ps_to_desc(ps, caps);
>
> -       for (i = 0; i < ARRAY_SIZE(available_ps); i++) {
> -               if (available_ps[i] == ps)
> -                       break;
> -       }
> +       if (!desc)
> +               return RZG2L_IOLH_IDX_NA;
>
> -       /*
> -        * We multiply with RZG2L_IOLH_MAX_DS_ENTRIES as we have
> -        * RZG2L_IOLH_MAX_DS_ENTRIES DS values per power source
> -        */
> -       return i * RZG2L_IOLH_MAX_DS_ENTRIES;
> +       return desc->iolh_index;

Perhaps

    return desc ? desc->iolh_index : RZG2L_IOLH_IDX_NA;

?

>  }
>
>  static u16 rzg2l_iolh_val_to_ua(const struct rzg2l_hwcfg *hwcfg, u32 caps, u8 val)

> @@ -1797,7 +1839,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
>
>         /* Apply power source. */
>         if (settings.power_source != pctrl->settings[_pin].power_source) {
> -               ret = rzg2l_ps_is_supported(settings.power_source);
> +               ret = rzg2l_ps_is_supported(settings.power_source, cfg);
>                 if (!ret)
>                         return -EINVAL;

As rzg2l_ps_is_supported() returns a bool, there is no need to keep its
return value in "ret" for later use.

After eliminating rzg2l_ps_is_supported(), this can just become

    if (!rzg2l_ps_to_desc(settings.power_source, cfg)
            return -EINVAL;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
