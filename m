Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7ED48BD39
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 15:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635804; cv=none; b=JRoO4Q2+vxUX/VzU1NmvJZEfnvHDU6AZgX+bA/hlFubzZcsxhpPb/XML50xdgtmKp6WCOkvu/Z9GiktzAzHw4BrY44Tk77jV/ikULFZZDUpJdm+yTPgiRg2Q+xFORaZshrv9e4G4e4r+gjNVepeL3PwRXNlnHcn1/iCKtvJ4W4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635804; c=relaxed/simple;
	bh=GY640qtsu1SDkXg/qpZjw5AVg1oBJIZPusqb/qNK3PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RF3AO7ZSznz1uCZuJzOeMvg5vqKuEOs2xT8XpCrgOYf5u0ykEKui5+0ik8UQlFbilkyHyUkKEGWCST1B9haIV5wIVrDbJUNQtDZh0h/iM9OfFSaSF9iaMDFj7XjVHNN/M8JWoMxbq75kzSB1gGZeuhsoPlkCtJerixUDLYsgXOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15c42a45adso168755366b.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635801; x=1787240601;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aPYhCdtqz3bibVAFDWmRXBuIoXULoG3VemeqJBNfpCA=;
        b=rPssoAmfjqRJPKXD8tSvSl8nUfcc75hedEqdWDMEX/Rme4aC31Wl142kmbGJ+TIxDq
         YVUM/mYhRVDvn2urHe64mQBqtZEKHSxRHFiVsKPzfe8oJqYVKE0LjA26om8pY3gXTUts
         IL7SSLakJNmJiUo6pSP7FrX7uEcS9absN+4bP84mNr1rcShe7HPFeY0gUF34Lci5WQqp
         B2fnVaQQ143Ye/SzLew30NeVScXh7VQBG9nMcqs7NWkgX/nNaQRAyQJN7FQimsTZ7RHE
         BknPKGYopU8Gsnfwj1noTimXvU36X4pRPImIlYkwXprATasEH1CH+wi+Sre6LqlgfUiT
         d4Yw==
X-Forwarded-Encrypted: i=1; AHgh+Rot7HXi/B3hfpfMcpm/8K+eRf3Bfbeg1EzbT2v7lN5Pv/IuVsn7VK/nj25+HDrczXrcXGHSjINLqqot@vger.kernel.org
X-Gm-Message-State: AOJu0YzVi+D1r1Dbi2ta8D2OsALo3Jf3/7FMOP3Rqli3BSqDWwXApuR5
	/6FcHqZduQKsAWphGCisMv1yCGlsiGdXSSQV//EAQqMOeeVer/faIyNS8KXH+g6mVsQ=
X-Gm-Gg: AR+sD10Bs1eJ67ChGluvRz1T3rVrJzSH7fEtCvIyPUyR42L8NTh3aAI/XQTm+XdLo79
	hwMMtm0vxr3f6WN7MdJM6rldaPBWHQlTYd7l7AkoMdxAodaBZ08s3c50rfGhCmnU3rV6cCY/ZlT
	r08Gjw1pkpbvFv7BV+ugjK63/xp9VkaoFtF+wxbHFLmntpItr6HPrPDR4AueOmo3FdBwm2WXNZ/
	HqlZO+xn2YyhvssJaIDRXlEzF5TnyTwjWXCUTfLqFjEQ0dxwgb1X9kndzpiY+Hhf45eRyd+R4NL
	KoE+5uPWMjkxgYPHEPWRwJwJLUquTGQEUnOv9eXzzlZ2Jxy9SzooBBSrCzRI55cyTJeZghmc2Yp
	3Qd1P+7ZzgRtIbFZMp5/PWpYQtvhcMGyy2RI1ZIhlnFYeKtvHfAgHMxNbH5PW+dq35EunwMlxRJ
	7DCTRsSCI5A5/gYvctal7X9RD6J8cSg9doa9Nrki5JspBQHDnoiVFCiSITTSrDBO4h+bWLyplRd
	1UKGfHlSbk4BU+SL7Yg1fCnzQ==
X-Received: by 2002:a17:907:944a:b0:c15:c323:36e5 with SMTP id a640c23a62f3a-c210a1ea95dmr365274766b.10.1786635800615;
        Thu, 13 Aug 2026 08:43:20 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a37f7d9c4csm1032386a12.1.2026.08.13.08.43.17
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:43:19 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so1950708a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:43:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rra1sf6q05AUpK8LOe4Eq48XWTj4Hko0co9HpNiDAKIwGyq5vZ8C33ZyhiX6jgy5TFe4z7mzvFHrcH6@vger.kernel.org
X-Received: by 2002:a17:907:608c:b0:c20:7166:cc16 with SMTP id
 a640c23a62f3a-c210a26f8cdmr362136666b.15.1786635796639; Thu, 13 Aug 2026
 08:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev> <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:43:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfzr0FTq5796ymJbrJMTYcHko0SPoE_hPYJxNi-pLG1Q@mail.gmail.com>
X-Gm-Features: AUfX_myjkFFweUQc-pTKMuHXcf3jvSHPslpABu71PbitoSzzI_g3EH2qpqjRiDo
Message-ID: <CAMuHMdWfzr0FTq5796ymJbrJMTYcHko0SPoE_hPYJxNi-pLG1Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
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
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -69,6 +69,7 @@
>  #define PIN_CFG_PVDD1833_OTH_AWO_POC   BIT(19) /* known on RZ/G3L only */
>  #define PIN_CFG_PVDD1833_OTH_ISO_POC   BIT(20) /* known on RZ/G3L only */
>  #define PIN_CFG_WDTOVF_N_POC           BIT(21) /* known on RZ/G3L only */
> +#define PIN_CFG_IO_VMC_I3C             BIT(22)
>
>  #define RZG2L_SINGLE_PIN               BIT_ULL(63)     /* Dedicated pin */
>  #define RZG2L_VARIABLE_CFG             BIT_ULL(62)     /* Variable cfg for port pins */
> @@ -186,6 +187,9 @@
>  #define PVDD_3300              0       /* I/O domain voltage >= 3.3V */
>  #define PVDD_MASK              0x3
>
> +#define PVDD_I3C_1200          1       /* I3C I/O domain voltage 1.2V */
> +#define PVDD_I3C_1800          0       /* I3C I/O domain voltage 1.8V */

This repeats the existing pattern of having both #defines...

> +
>  #define PWPR_B0WI              BIT(7)  /* Bit Write Disable */
>  #define PWPR_PFCWE             BIT(6)  /* PFC Register Write Enable */
>  #define PWPR_REGWE_A           BIT(6)  /* PFC and PMC Register Write Enable on RZ/V2H(P) */

> @@ -441,6 +455,7 @@ struct rzg2l_pinctrl {
>  };
>
>  static const u16 available_ps[] = { 1800, 2500, 3300 };
> +static const u16 available_i3c_ps[] = { 1200, 1800 };

... and arrays for the possible values.

>
>  static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
>                                               u64 pincfg,

>
>  static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)
>  {
> +       if (caps & PIN_CFG_IO_VMC_I3C) {
> +               switch (val) {
> +               case PVDD_I3C_1200:
> +                       return 1200;
> +               case PVDD_I3C_1800:
> +                       return 1800;
> +               }

Look-up uses the defines...

> +
> +               return -EINVAL;
> +       }
> +
>         switch (val) {
>         case PVDD_1800:
>                 return 1800;
> @@ -1121,6 +1152,19 @@ static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)
>
>  static int rzg2l_ps_to_pwr_reg_val(u8 *val, u32 ps, u32 caps)
>  {
> +       if (caps & PIN_CFG_IO_VMC_I3C) {
> +               switch (ps) {
> +               case 1200:
> +                       *val = PVDD_I3C_1200;
> +                       return 0;
> +               case 1800:
> +                       *val = PVDD_I3C_1800;
> +                       return 0;
> +               }

... just like reverse look-up...

> +
> +               return -EINVAL;
> +       }
> +
>         switch (ps) {
>         case 1800:
>                 *val = PVDD_1800;
> @@ -1194,12 +1238,21 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
>         return 0;
>  }
>
> -static bool rzg2l_ps_is_supported(u16 ps)
> +static bool rzg2l_ps_is_supported(u16 ps, u32 caps)
>  {
> -       unsigned int i;
> +       unsigned int i, len;
> +       const u16 *array;
>
> -       for (i = 0; i < ARRAY_SIZE(available_ps); i++) {
> -               if (available_ps[i] == ps)
> +       if (caps & PIN_CFG_IO_VMC_I3C) {
> +               array = available_i3c_ps;
> +               len = ARRAY_SIZE(available_i3c_ps);
> +       } else {
> +               array = available_ps;
> +               len = ARRAY_SIZE(available_ps);
> +       }
> +
> +       for (i = 0; i < len; i++) {
> +               if (array[i] == ps)
>                         return true;
>         }

... while validity checks use the arrays.

I guess one could drop the defines, and always use the arrays?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
