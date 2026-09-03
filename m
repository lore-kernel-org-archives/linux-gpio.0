Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7744DF4BE
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449541; cv=none; b=tJ789IS8fOrZlXAyj6g4X52iX1jKuIchfghuz/9kxNEBLFvFm8c37yDqQ8sKYo57SX99iYDcFa5Z6DoujdLWkyPfOD/5n1h6ibd+PLLjbxReU/qN2FtUAblN1f+v3Iw9S8HuuJc9w/8IOvf5xj9tMRkzNTqyQ+S6PalLDinTXnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449541; c=relaxed/simple;
	bh=O1T/S/tnLkdqmvZL1LvuEUmH7Qo5CdEtlWyLMpBc4J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAHZdUF8z/qrGqhbYH3HzN1usJ4SYCGdvIhSyGBJ6gDPFQdfmMQa9qf+BmQvE3YqtuCizeHcLUjVICe8tHzc8R1fSrk0kBmUZGA2Mc3xMY4H1UbYbGqlexXA/KU58zcz11gjDywearUhgehCkfXEbzvdf5ipUKrmfrQKoCO8opQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso1046340e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 08:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449538; x=1789054338;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=smhgAnbElT93Xc14KAwXUjbx11QNBeL7p1UChIAHiR4=;
        b=tHLdZDt/jNJm+EPwM0HR5kUPhITTzLFjqwB+K4lAse8nrc6T+JaS7yWIb/+QM3R4O+
         4rTBkWYxuKYDaZWDiCW6m9GUEI9F21oe26+OJyrR9cYyHJWH/M48rpKIxmwD/r9yBzji
         ghlzZcG7CgCYP/QHhPe8ksG1XHNEMJSozadi1gqNgKCF0QKKt6Dn3otN+0rP6qP1DKkf
         wsQO1SwY9djGTZ4yGEDDnFNkllbhLPeuxkCjrh4uwGTPpcKe5RKGwwipSrngpR61Rvy1
         NFnkknYsL7wff41Lxa4TqXqaxN4akrKPhuv+xpE8o9kZ9Nc5d9gtnGmASHrr1qQ4MYXw
         Rgtg==
X-Forwarded-Encrypted: i=1; AKwUvBz5N+sWyWBVt9BPr3L5bvm4csnNt4xLbO6OsSUtodE9buVNKlpnAcEHPAPIzvpZviYPKBi6qZYqUsJ5@vger.kernel.org
X-Gm-Message-State: AFuF++lWNuPLf5hrfzheelsqFJT90otV+s5hZdQNqCw3YG3zwsPuUI7F
	FNdJI03c0PsmY2kaIJNaivqZ+XwTVIfp5FBPdq/KyCL74+8+DLR9TcbNtElvOslS6Po=
X-Gm-Gg: AYBFou2yBDdImzpCmqfDe0juPo8UQGqgoOAN2+TP8TU/UjcUXl0nBDBVO8G7zH1zXp7
	q6BnEFVhWxLRskVS2pT/gn6Ty29/zvkVpuNQUmhWCv2NYrnJMxAa3aiDCFXQNDv43iY56PKFFiD
	hk5+Hgyv8rjOaLNNmPHKqVrRItve4Il5Icfmg5c84hwwWyGxhzjzx5CrA7cU64gIWH3tyFD5C52
	QxM8cmpJ6J7jiYGe6jYRpzB+ck3uApWuZz0/0GcCuIU6ohLLFRh7pvia4yzgxjrjtAp2a4icR0+
	NCcA22G2300Yddzf0B053eBicK5hIcYauS02ddHKgyRJe9kP7IClyVAyeqp+NGQ/QXIRS/I59Er
	Vmr5/TdAxncphnPgK78DiRh9rH/AW4yoIHnhW8yvUxhMajuXqil1lYleKPL34g5tfP4o4Xzx7Q5
	5DendXbVJhWtKgrKnFuhA8d68fy6zUQI2Vc70GjkzytTlkNjEFxs2BI1EwvhuObjy8UCENbwE5P
	9m5689kek3xug0NplhOLsv61g==
X-Received: by 2002:a05:6122:3284:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5c7d23a6cf7mr5301645e0c.0.1788449538053;
        Thu, 03 Sep 2026 08:32:18 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef7a5sm6751e0c.5.2026.09.03.08.32.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:32:17 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-966eabad303so13921241.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 08:32:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzr3/dxCrRoMaJ3N5Pp4WwT4vWB3tfNX+gNSWur7n9SBFj3JFoM9ZAjSqkzyx41t2spGpBYgXNwz36N@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:789:5f54:2367 with SMTP id
 ada2fe7eead31-78a1f1f13e9mr4112330137.4.1788449534923; Thu, 03 Sep 2026
 08:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903113327.1217457-1-claudiu.beznea+renesas@tuxon.dev> <20260903113327.1217457-4-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260903113327.1217457-4-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 17:32:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9C6LVBqYWo=Njgf3v4a5R1LhBwKuB5H3TFctOCr338g@mail.gmail.com>
X-Gm-Features: AcwNN1WnpoMcG4OiqSwpOhcE41-w5QvCDbZ1B83z-OJyrnfhHqNepFiL_pVw_TE
Message-ID: <CAMuHMdV9C6LVBqYWo=Njgf3v4a5R1LhBwKuB5H3TFctOCr338g@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] pinctrl: renesas: rzg2l: Unify the power source handling
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 3 Sept 2026 at 13:34, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
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
> The register values for the soft power sources were kept to zero since
> they are not used across the driver's code.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v6:
> - described all the available power sources in the available_ps[]
>   array and dropped to wildcard approach to avoid letting the user
>   selecting unavailable power source for pins
> - simplified RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC()
> - for these two points ^ didn't collect the Wolfram's Tb tag
> - dropped rzg2l_ps_is_supported()
> - used conditional operator in rzg2l_ps_to_iolh_idx()
> - adjusted the patch description

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

> +static const struct rzg2l_pinctrl_ps_desc available_ps[] = {
> +       /* Ethernet I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
> +                             RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
> +                             RZG2L_IOLH_IDX_2V5),
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
> +                             RZG2L_IOLH_IDX_3V3),
> +
> +       /* SD I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_IO_VMC_SD0 | PIN_CFG_IO_VMC_SD1 |
> +                             PIN_CFG_IO_VMC_SD2, RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_SD0 | PIN_CFG_IO_VMC_SD1 |
> +                             PIN_CFG_IO_VMC_SD2, RZG2L_IOLH_IDX_2V5),

Before (see below), only Ethernet could select the 2.5V domain, so
shouldn't this entry be dropped?

> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_IO_VMC_SD0 | PIN_CFG_IO_VMC_SD1 |
> +                             PIN_CFG_IO_VMC_SD2, RZG2L_IOLH_IDX_3V3),
> +
> +       /* QSPI I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_IO_VMC_QSPI, RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_QSPI, RZG2L_IOLH_IDX_2V5),

Same here?

> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_IO_VMC_QSPI, RZG2L_IOLH_IDX_3V3),
> +
> +       /* AWO I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_PVDD1833_OTH_AWO_POC,
> +                             RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_PVDD1833_OTH_AWO_POC,
> +                             RZG2L_IOLH_IDX_3V3),
> +
> +       /* ISO I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_PVDD1833_OTH_ISO_POC,
> +                             RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_PVDD1833_OTH_ISO_POC,
> +                             RZG2L_IOLH_IDX_3V3),
> +
> +       /* WDTOVF I/O voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_WDTOVF_N_POC, RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_WDTOVF_N_POC, RZG2L_IOLH_IDX_3V3),
> +
> +       /* Software voltage domains */
> +       RZG2L_PINCTRL_PS_DESC(1800, 0, PIN_CFG_SOFT_PS, RZG2L_IOLH_IDX_1V8),
> +       RZG2L_PINCTRL_PS_DESC(2500, 0, PIN_CFG_SOFT_PS, RZG2L_IOLH_IDX_2V5),
> +       RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_SOFT_PS, RZG2L_IOLH_IDX_3V3),

I never really understood PIN_CFG_SOFT_PS...

> +};

> -static int rzg2l_ps_to_pwr_reg_val(u32 ps, u32 caps)
> +static int rzg2l_ps_to_pwr_reg_val(u16 ps, u32 caps)
>  {
> -       switch (ps) {
> -       case 1800:
> -               return PVDD_1800;
> -       case 2500:
> -               if (!(caps & (PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1)))
> -                       return -EINVAL;
> -               return PVDD_2500;
> -       case 3300:
> -               return PVDD_3300;
> -       }
> +       const struct rzg2l_pinctrl_ps_desc *desc;
>
> -       return -EINVAL;
> +       desc = rzg2l_ps_to_desc(ps, caps);
> +       if (!desc)
> +               return -EINVAL;
> +
> +       return desc->pwr_reg_val;
>  }
>
>  static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps)

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
