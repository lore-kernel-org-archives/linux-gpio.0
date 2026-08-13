Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B332146AA76
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 12:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786624874; cv=none; b=e+AmaqK3HKkHdA2QaykEtNSAohK9AZFO0UpiRcYzQfHSqP1BCAfN+8GvZeX1CDc/xGE0na4mxAcII7hf0ZNPg634tabIsL+hdOhDNxRyrzSOGRzsIE4x0brP0xlU6WwV+0ZAsrpq7M72oI6Lln3xLmTfV9JEkVofvt5qrh5tRKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786624874; c=relaxed/simple;
	bh=7tWUhsTf7yuYmukkfQ9m0Oxs9WCPgFyK+IQUvr2VHOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lxs4VWTY38jhbGHEqLxSod7L+Euu1430QZX7kd+xYsYehfgmoL+aTZY4V0ct2q/rXqkaHzVFxDc4HyT1eNqcBx7baDhjtxZkwQNLwfnPDZcYPgV2cLnfCJxovcdK0QKCvORlLFCDDnIRpZLL4+TLmDiY8L0NKY58m3I4qltBUoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c3fabe908eso690564e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 05:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786624871; x=1787229671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqIqDSfBSxHW2hfkal8cX0hwZXtcD3FzDsHZ3Y3Mk9Q=;
        b=D8nnFU68/g0wfemu5j1GZe+Oi1+YpCjHsXS86movsV3hVFx2d/axmwA3ocsAnFQNS+
         xPznWF6KBaWhZYELQADCCzVXaafQeMU6Hw8bGVWTAqgRSfCqgs+MmS8useDt1v4CbWrw
         fq4atGi87pwkFnv+ODarOAGYyslmtRQnq8fM4GEEM7YTSiTD2/Vp257fD30EsvxvUHJ+
         vRs1X2i1cxlGnpjBCqOZf7Mmv4rCYmzDOK6XgIAq4bJBmFAwDF/FmQiLLcfcZdhuwVRm
         EWZmtaxlTjUH6TMLHqfmSLBIfC5fNDQbcTthHMV283URSueqrCaLuiQbymkFEM7AkzFU
         Yb5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqv8RP8/m3TU3oww3WCVLRTPvKeeFFBag/dUtldKCo0DRVmE4IpDP4U+10PrDMFF6HRcma9AXsbLh9U@vger.kernel.org
X-Gm-Message-State: AOJu0YyEVwaTgwxhQdeuty8JWroPEgXsyRguPKtiZheEhby3vRwcvWGz
	+jC1TsdwKr1yzjg6eS2RgECDzQZJBekxyAh517EdRRFQUQEHM0XxwpiF2DKl7+OS
X-Gm-Gg: AR+sD10KM+RL/K7ATVhPf6reLnoM0x14QlW830Fdj+XpriGGnZaD9jTbnAG31njglA9
	aJbzOjOdoX/unAafABkjXujV6DgFKlNUS1cPBTYqs9cemZmFvsWxi2hP9d2ggG249VhpQlEdb1c
	aIwK9CFI4/R4/atUUHBnaq54blDbYhs1RKEmBk9Cc5MAvckaKp2pUbGWiYPQLbrZeCgo5BK1dof
	L9Au0wDndPfXwBqN6WHPyzUXXoIf2sdu02KpR/+x5qcR1ZPRruFWmJUzxzb42rPUBMVdf9Bxcxc
	QjAVPtwG29xDyTbDNgYL06y55U4V28Rx6L/BW1hi8MFOeS8XYg5KdzYTXlVeYuDpdhHkDNeDy8o
	vXi+fgVYIrNPl0VlbwZ76ct0JMtO091wfWhMjRw6u7VwGYZfW9WdENiRPqLjm6d7Vr+4Qw/lVUG
	HALVg7yc4EVfud6eRrAOoDMwTMzIW/hN/9SgggkBtzW01qx5Uj4tSeGM9ad/lvx0/bKGIF4XOvK
	B0NTYzLVJbrH5ZdHNsG9G7S/g==
X-Received: by 2002:a05:6122:e191:b0:5c1:1965:6243 with SMTP id 71dfb90a1353d-5c579c2ef8dmr631326e0c.13.1786624871122;
        Thu, 13 Aug 2026 05:41:11 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c57ba73a58sm645831e0c.3.2026.08.13.05.41.09
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 05:41:09 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7389cff36bdso539501137.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 05:41:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrlSqVH5n4l8yB5lPR79OykdJ5f2wvpzCnrY1BxLZppvmsW357t41AVyeA1cjpGlRITPf4jjZUH9zr0@vger.kernel.org
X-Received: by 2002:a05:6102:2929:b0:739:478b:5bf2 with SMTP id
 ada2fe7eead31-76db856c8e1mr1303873137.13.1786624869514; Thu, 13 Aug 2026
 05:41:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723154154.319674-1-biju.das.jz@bp.renesas.com> <20260723154154.319674-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260723154154.319674-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 14:40:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXkj6E4pPCYbGGGGgL+Q57VuBf06B10Kyjkmd6yd4_jhg@mail.gmail.com>
X-Gm-Features: AUfX_mwfwYc46fKSTK2CZeQ2PKXNjkYeqMfpZWqO1-br0yPfVIChndaOIQ5XDSI
Message-ID: <CAMuHMdXkj6E4pPCYbGGGGgL+Q57VuBf06B10Kyjkmd6yd4_jhg@mail.gmail.com>
Subject: Re: [PATCH v19 1/4] pinctrl: renesas: rzg2l: Add SD channel POC
 support for RZ/G3L
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Jul 2026 at 17:41, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add power-on control (POC) support for SD channels 1 and 2 on the RZ/G3L
> SoC (r9a08g046).
>
> Introduce PIN_CFG_IO_VMC_SD2 capability flag (bit 22) and SD_CH2_POC
> register offset (0x3024). Extend rzg2l_caps_to_pwr_reg() to return
> SD_CH2_POC when PIN_CFG_IO_VMC_SD2 is set.
>
> Replace RZG3L_MPXED_PIN_FUNCS() with RZG2L_MPXED_COMMON_PIN_FUNCS() for
> port PG and PH pins, dropping PIN_CFG_SOFT_PS which is inappropriate for
> SD pins, and annotate them with PIN_CFG_IO_VMC_SD1 and PIN_CFG_IO_VMC_SD2
> respectively.
>
> Annotate all RZ/G3L SD0 dedicated pins (CLK, CMD, RST#, DS, DAT0=E2=80=93=
DAT7)
> with PIN_CFG_IO_VMC_SD0 so that power-source register lookups work
> correctly for those pins.
>
> Add sd_ch2 field to rzg2l_register_offsets and rzg2l_pinctrl_reg_cache to
> save and restore the SD_CH2_POC register across suspend/resume cycles.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v18->v19:
>  * No change.
> v17->v18:
>  * Moved sd_ch2 variable near to sd_ch[].

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

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
