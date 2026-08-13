Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B4941684A
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 15:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635399; cv=none; b=j1dH4qq/Z5KaTIoPCmr3N3KGNDrPvSpcmy+RYsQN1o+fODyq9bKNNx2QKNdoIQ15r5cCamIV58evvbjTmYb20iaIHu9dQVXoYZpXWN3g9QZE1YeGnm9xObhRKcL+ZCT4VvBPrHVSekLw4hQnL+JGuTGFdOFsiWNdthLzUHFYKJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635399; c=relaxed/simple;
	bh=vzsqRgKK6xb+qXIWqmZLoli+ye1tIEurLtQ8ZUQVhRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SM/YtWS035CpJyQdam2oR3i2qD2yEQXkzvMb7q0mvpjTOAA0N5SgeIsOTIzB0bBVK5AX9kzg+Mv/OBcGSpAhZiyWyCQqB/9Uwnjec12m4qemYeoJ+ypB85pnVNYAO2KJfZEKFCnvgZ++Zf5rRo8kcLoFSWkiWfGWeaCaM4YzT7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so7708066b.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635385; x=1787240185;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8HfO2oqGvHcLZthk9jR7PnHTZYqhjJfeV3Z47WsDvdU=;
        b=TZGBwFTGVLNkz231mgIIyvMMWvMZ2OamQdGJGUmgHXl9Ig85d1XuU8eu5WqUkwKYwt
         CkCjALmpIjKaFuyF+bxWlBa+YaqDYrRgZdwU4rgmo6yUdfszGRbefulaJ4a4z/fKUeiv
         dv34RboJQDflsWpO7/TmlSZ6Jd86FMNRsv1biUoEgeYC1ih7bKlapVS5EmSAtaWyrniA
         +6vxG7+kslEGQL+/AInvwJ7qNYGHwEZYVLhBcdzF9Jt9KrtQtUKSyFyTcNXGeCeNx+gU
         KZ2zWWpwKPTosss+MhoNGdoKS9lKIUOPjfY+nXqXU7MGvj2cHt0H/7XRUsH8E3Cpsus6
         5P+w==
X-Forwarded-Encrypted: i=1; AHgh+RqfhpvELDzWlMEWrwv68TYCet4J0GEhR+Y6xKYg547j1tdg6oSS9m9cTVRtSopAEuWxUbDNDIqjHqq2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3tR92dUUKj07rutU87SyCCIO0U6x7WzoaqiK+4lqfXA8mcBfV
	JFPDjI9iOfOlwK/co+sz/qCc1+Aum/n9MV8A6ihUty5JmYN+r+mKqqP4EX2HSsJeOjI=
X-Gm-Gg: AR+sD13GvnZwXqFVsvoO/0cVnKTaFz77hEJtRHGlSSIZEOr7sL2RbvM8pjmADqpayr5
	XQhtWGC8XBPqAE6oF1OqSk6j1TGTBe23AnvKxIu20gr38Zk/JzgGG1/Lwn+oyjhS0Tm8eknavIg
	nsyaYDsEivPyqwJxo3oxnr4a2PlyHq1YisP0Er2ZQ7COyg/6nU1ScogGxpGDMKA2asEQGUXQ2Iv
	fXWgvfwyvyugTUDWretWXNKuaBoxZSkFA0D0qQkEnkM1h/yfqGZyqfrtHSUQgnOVZq8gnz5KBx1
	UYhNhDuR5gQv1k6YJ+SIwwUoAyRMjuWXCpn+tDq5zvsL3TaaGlwqJP9+XgYl6JntIC7MlE0/O37
	xSso2g5ircaBHV5lVlUfGNcNL5oB9Jk7AkW/nTIV5/D/9loVnDNk9bscTL3NaQMkmR1s19ZhasG
	XC2Gj8V+8+q+kQTi5wB60wP0SND5NQxAaDUEFQ12PNDJ+RDqahJI3iONQ34JKuUX+D2KS8g4IjX
	6fqv0vxhW5Vd6/aT8EZJ3JFhg==
X-Received: by 2002:a17:907:e916:b0:c20:7897:bc69 with SMTP id a640c23a62f3a-c210907b20amr307250066b.30.1786635384512;
        Thu, 13 Aug 2026 08:36:24 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234e5bdfsm7932866b.23.2026.08.13.08.36.22
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:36:22 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so1575701a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:36:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqWvZYt3zMc4Iyc84Rcdu3QYvS4BigTdBEBZseRSaaGWwZUNGPZI1DIfOzRTwHzGaeUU5jZxEZW2lCY@vger.kernel.org
X-Received: by 2002:a05:6402:42d1:b0:6a0:6978:bee0 with SMTP id
 4fb4d7f45d1cf-6a3805dd5f3mr3355685a12.9.1786635382098; Thu, 13 Aug 2026
 08:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev> <20260710113637.1328000-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:36:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLEuC5CFKH4KEUo6H++rp6N=0X7Vd4ffOm2K=hQNPGzg@mail.gmail.com>
X-Gm-Features: AUfX_mzZK_XqQEToCXzSXsA3RQo5nMa-PCSiTS9b3hgORV81WkefGByzaZwI1FY
Message-ID: <CAMuHMdWLEuC5CFKH4KEUo6H++rp6N=0X7Vd4ffOm2K=hQNPGzg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] pinctrl: renesas: rzg2l: Generalize the power
 source code
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 10 Jul 2026 at 13:36, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The current functions used to get/set the pin power source check the
> OTHER_POC register, which is specific to the RZ/G3L SoC only. To allow the
> code to be extended for other power source functionalities (e.g. I3C on
> RZ/G3S), generalize the functions used to get/set the pin power source.
>
> For this, introduce the struct rzg2l_register_masks data structure whose
> purpose is to store SoC specific register bit masks. The members of this
> structure are then used in rzg2l_caps_to_pwr_reg() to retrieve the bitmask
> corresponding to a SoC specific power source capability.
>
> The conversion between HW specific power source values and SW specific
> power source values is now handled through rzg2l_pwr_reg_val_to_ps() and
> rzg2l_ps_to_pwr_reg_val().
>
> Finally, to keep the code generic, the register update in
> rzg2l_set_power_source() was changed to a read-modify-write approach to
> cover all cases.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

>  static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs,
> -                                u32 caps, u8 *mask)
> +                                const struct rzg2l_register_masks *masks,
> +                                u32 caps, u16 *offset, u8 *mask)

Yes, always returning an offset and mask is what I had in mind before.

>  {
> -       if (caps & PIN_CFG_IO_VMC_SD0)
> -               return SD_CH(regs->sd_ch, 0);
> -       if (caps & PIN_CFG_IO_VMC_SD1)
> -               return SD_CH(regs->sd_ch, 1);
> -       if (caps & PIN_CFG_IO_VMC_ETH0)
> -               return ETH_POC(regs->eth_poc, 0);
> -       if (caps & PIN_CFG_IO_VMC_ETH1)
> -               return ETH_POC(regs->eth_poc, 1);
> -       if (caps & PIN_CFG_IO_VMC_QSPI)
> -               return QSPI;
> +       *mask = PVDD_MASK;
> +
> +       if (caps & PIN_CFG_IO_VMC_SD0) {
> +               *offset = SD_CH(regs->sd_ch, 0);
> +               return 0;
> +       }
> +       if (caps & PIN_CFG_IO_VMC_SD1) {
> +               *offset = SD_CH(regs->sd_ch, 1);
> +               return 0;
> +       }
> +       if (caps & PIN_CFG_IO_VMC_ETH0) {
> +               *offset = ETH_POC(regs->eth_poc, 0);
> +               return 0;
> +       }
> +       if (caps & PIN_CFG_IO_VMC_ETH1) {
> +               *offset = ETH_POC(regs->eth_poc, 1);
> +               return 0;
> +       }
> +       if (caps & PIN_CFG_IO_VMC_QSPI) {
> +               *offset = regs->qspi;
> +               return 0;
> +       }
>         if (caps & PIN_CFG_OTHER_POC_MASK) {
> +               *offset = regs->other_poc;
>                 if (caps & PIN_CFG_PVDD1833_OTH_AWO_POC)
> -                       *mask = BIT(0);
> +                       *mask = masks->other_poc_pvdd1833_oth_awo_poc;
>                 else if (caps & PIN_CFG_PVDD1833_OTH_ISO_POC)
> -                       *mask = BIT(1);
> +                       *mask = masks->other_poc_pvdd1833_oth_iso_poc;
>                 else
> -                       *mask = BIT(2);
> +                       *mask = masks->other_poc_wdtovf_n_poc;
> +               return 0;
> +       }
>
> -               return OTHER_POC;
> +       return -EINVAL;
> +}
> +
> +static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)
> +{
> +       switch (val) {
> +       case PVDD_1800:
> +               return 1800;
> +       case PVDD_2500:
> +               return 2500;
> +       case PVDD_3300:
> +               return 3300;
> +       }
> +
> +       return -EINVAL;
> +}

This function returns a valid value, or an error code...

> +
> +static int rzg2l_ps_to_pwr_reg_val(u8 *val, u32 ps, u32 caps)
> +{
> +       switch (ps) {
> +       case 1800:
> +               *val = PVDD_1800;
> +               return 0;
> +       case 2500:
> +               if (!(caps & (PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1)))
> +                       return -EINVAL;
> +               *val = PVDD_2500;
> +               return 0;
> +       case 3300:
> +               *val = PVDD_3300;
> +               return 0;
>         }
>
>         return -EINVAL;

... while the inverse function stores the value in an output pointer
on succes. Perhaps this should be changed, for consistency?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
