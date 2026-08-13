Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE8A47A860
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635980; cv=none; b=pokAES44CEc8bk9Pksz++eqMLwgoKDPSWNk6ZFPuKX39RtDScDW/+MxipqYJF/jn5hr37rUvtOPAqpPmLo0mG3QkwkPTL5S8q9MFLAFzrofUQ7KuNeJqkHUzCTlOVN66qLKqOZNMdp0kT+U/zONFY4ZJMDfsDEFfSPTx4hUmjVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635980; c=relaxed/simple;
	bh=CfPCLfqJ1dcGgFqUMf2iTh0mP1Mo/w6V8NMvdvj2Z8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQIOe5JOZiFbUd6O2dDI57hjT+Npla5fChyP8l3b5i9L9RXAoL5Jc5Gr2eofAGoQb8e8gsmy+wwKvu6/WCBWojLqlU+AHoq9v48NCSfdNq7kZWzToQCehvqvXCKyx1JmQYXUgbzCwwzFgkOjI5FAbQ31wubE1JNv+ZDf0UNpYfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1c52d920b8so10379266b.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635972; x=1787240772;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f67wdn3bVHnBmQlMR3YCbOBtB5lYRlk7n/MkzjvTnN8=;
        b=mMETN1/SZ90sHARW/MLcPV8ZvrMd2iwQTLoMCtoyVNivt3ao7D4IPgKZBV3gHmv+CJ
         LDCpC/BOb1eh6BR6y/pLTmX0yxhNvgIRdXovkjQCOZDFCIW2giEsvmQimIXUz/gqFPXE
         V6K7XtFFoZQvej8ygi0ngK+oansq1/f0cZTT9OKKtOmnvmT2PArbjEj8H6dGiwarPUDn
         4A+likSIafgNFN31OXW6ncj5zFeZm35Y+gCTlmc62LqtBfqvhVCbUR0VfXEnRtmtvXY5
         eR1FLfCp0nT4ACpIcmHh5Nr8muKFf3Jnk4N+lHg7iCjZiI2sWvCQWneCId70bqWZpYjd
         fCsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPf/UT/wNNzD6pL/a0/ikGtur2SAHmzYanHeOpd+vaJBUX+y6CZ9CULvo+OpcFd/j0Tin+Vsqb/6ny@vger.kernel.org
X-Gm-Message-State: AOJu0YxVj6iqUQFe6ulW0jTz777lHgcpMpGX3RxavqU+OovXhR/xBLfF
	NXh0xyuGl2ilrIgGuNCHbqeSoLVICdH3L1KdBO3Hjadti+8DCKQZnQMGH9Fit097gnc=
X-Gm-Gg: AR+sD11r8YxxOUkicFuiYoUah76IzP9TT0ElgCXAFqoZ0RIspCKn0atGQvcuAupMKZ0
	UhLS1iP7biishvx70OnWly32u+7r+Qb+K46CoQafuUpGtSsrtxIoIePqAFhr4FwDwAlpkuX5m9I
	xJDn6lWT0MnXUtcRolM0bsBtQJeErCkFlHdLPY8EEQxJGY2USuA2eqCNnUbmheQZplWb1HpVy5b
	+kV0x73uy+Gq/XmGMiYVkYDYKbUfZfZzwdE6JEmNT+k4hIP6QPE+evYuWypcBip2eYCn1yKnTTP
	v6CazJ5zNUSGP7/xp+JcUgqfy4tMuKxBVIH6RMWlmPfFGenlCD3OY+yejyfc/1qVe1HQcE+gK//
	XAQnCEpWB5QgGbfybbG8NznF5besAupt6QzYMouJX+w9qHQeTlEg/I3EMXa5hUP1RYuS+/ASpqE
	AGTFgx0iyUaVLtrB3yyI1RUFed3NeTM7XHU6Ey107xmIwpCzh154PbEGsUnXGtHQRHCGoPvI139
	Ra98Y3K/umVpheg6YQNx3+7WA==
X-Received: by 2002:a17:907:1ca1:b0:c16:592b:ec4c with SMTP id a640c23a62f3a-c2108dbeea4mr326066966b.1.1786635970189;
        Thu, 13 Aug 2026 08:46:10 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a37f7d9b2esm1150955a12.5.2026.08.13.08.46.08
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 08:46:08 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so3471512a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:46:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoiRzD0ppAedejT5dBGrfXZQYCKadcOIlcPhrXnuqa3HqqALGI2wd7udxPIg+PodLOC2qYXTtZUFNc6@vger.kernel.org
X-Received: by 2002:a05:6402:52dc:b0:69a:a279:dc10 with SMTP id
 4fb4d7f45d1cf-6a3805f8791mr3074088a12.10.1786635968409; Thu, 13 Aug 2026
 08:46:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
 <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
 <TY3PR01MB113469434A4393A02DAA45DDF86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f5b7441a-d72a-41c1-b67d-5225d8e9ced0@tuxon.dev> <TY3PR01MB113468890DC8B12E1E43A54A986FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <7cd113ad-3673-4f2b-97f3-aa1df4259a53@tuxon.dev> <TY3PR01MB1134672AC39737CA91F8FDBA886FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <68280642-0e36-4ba3-ae8d-486fb72ede77@tuxon.dev>
In-Reply-To: <68280642-0e36-4ba3-ae8d-486fb72ede77@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 17:45:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpgiGEJy74aAT4jq-YNDbFFi5S=vd_sfAJMMsgb24wmw@mail.gmail.com>
X-Gm-Features: AUfX_mwcukJIe17S8Tb__TpvCkLYwUOgvMbQ_VM8hDzlQY5Jb81CWcypwteZOLo
Message-ID: <CAMuHMdVpgiGEJy74aAT4jq-YNDbFFi5S=vd_sfAJMMsgb24wmw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>, 
	"linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu, Biju,

On Tue, 14 Jul 2026 at 09:26, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 7/13/26 18:15, Biju Das wrote:
> >> From: claudiu beznea<claudiu.beznea@tuxon.dev>
> >> On 7/13/26 16:56, Biju Das wrote:
> >>>> From: claudiu beznea<claudiu.beznea@tuxon.dev>
> >>>> On 7/12/26 17:55, Biju Das wrote:
> >>>>>> From: Claudiu Beznea<claudiu.beznea+renesas@tuxon.dev>
> >>>>>> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V.
> >>>>>> The pin controller provides a register to select between these two options.
> >>>>>> Update the Renesas RZ/G2L pin controller driver to allow selecting the I3C power source on RZ/G3S
> >> SoC.
> >>>>>> Reviewed-by: Wolfram Sang<wsa+renesas@sang-engineering.com>
> >>>>>> Tested-by: Wolfram Sang<wsa+renesas@sang-engineering.com>
> >>>>>> Signed-off-by: Claudiu Beznea<claudiu.beznea.uj@bp.renesas.com>

> >>>>>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> >>>>>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> >>>>>> @@ -281,6 +288,11 @@ struct rzg2l_register_masks {
> >>>>>>                          u8 other_poc_pvdd1833_oth_iso_poc;
> >>>>>>                          u8 other_poc_wdtovf_n_poc;
> >>>>>>                  };
> >>>>>> +
> >>>>>> +                /* RZ/G3S masks */
> >>>>>> +                struct {
> >>>>>> +                        u8 i3c_set_poc;
> >>>>> How this POC is different from Ethernet, SDHI and XSPI POC?
> >>>> Different bit mask and offset for I3C SET_POC compared with ETH, SDHI, XSPI.
> >>> RZ/G3L has i3c_set_poc, which has same bitmask as other_poc_wdtovf_n_poc.
> >>> Maybe create register specific masks??
> >>>
> >>> struct other_poc and struct i3c_set instead of union. So that both
> >>> RZ/G3L and RZ/G3S can share the same struct for i3c.
> >> When RZ/G3L I3C POC support will be added the i3c_set_poc member of struct rzg2l_register_masks could be
> >> moved as common member:
> >>
> >> Current code base allows for this extension. You can have:
> >> struct rzg2l_register_masks {
> >> +       /* Common masks. */
> >> +       u8 i3c_set_poc;
> >>           union {
> > OK, This union will go when we add RZ/G3L.
> >
> >>                   /* RZ/G3L masks */
> >>                   struct {
> >>                           u8 other_poc_pvdd1833_oth_awo_poc;
> >>                           u8 other_poc_pvdd1833_oth_iso_poc;
> >>                           u8 other_poc_wdtovf_n_poc;
> >>                   };
> >> -               /* RZ/G3S masks */
> >> -               struct {
> > Looks, this struct not needed now. struct with single member
> > has no value at all.
>
> I'll let Geert decide if he wants me to drop it.

I like having a struct for grouping, even for a single member, for
consistency, as the other union member is a struct.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
