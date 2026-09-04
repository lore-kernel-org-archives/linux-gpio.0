Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB661EFF93
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527156; cv=none; b=DO6UlQknx+6H9e5ZEEQheuF9MSZRzXjtivIV2DG9inft8dFNg0CZ753mZ9DvAG4nebAuxYTMBQC5woYaqm8sT9glQK08GaBd4eJOjZYrbCkDJ8nr8/l47iXYHZ3r1s0Zs9/YOd7xo5+T6mQJhePKF/FurQEQTeY3+DJvAAiCZ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527156; c=relaxed/simple;
	bh=/ypz6zJjPNKfNpTn4drsgfOEfmGR4cl9pbI1Kxi8oLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9JQKAWQ0zzht2CIlnUyS/qXFVaztYb/vVGEfh1gqbhg+Duck/3/+lobIyQxcjscBZ5+9lpVrA8Kd1gja6HRNAYU9QQzJplKUIaWDuaCmj8NhqYFWVPmpRrBC1g3p0F4KF7Gd6FDs3N31XBXTU9PA/CKYdNWTvWfCAnJIYTVqaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-77bf3334d14so693376137.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 06:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527154; x=1789131954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8NOF30mvWowB029u1n+aELPP6OhCTftCoi3R2I9gbMk=;
        b=KeTyPZtBlcDhz/bKJ86ovvrLED8QqBgkNQd4JKH68upI8+XIEn17X5/FvIx8ujLcHG
         6oLhGT/kSmL1keOQBgjSiwEwt45VKxRvN3lVj1W2axEp4cugyMr2+G7+YlQd7pKx94bx
         uUqhYodjgio11A9KvWxBWRAkMN+rZmVvhkOTdrJRicuGP9ejk8E0rp+UrLMw7WEzFrzT
         fWZLIfx95M9YobjtK40we31eVEVcNfjnwJd8kw3vLEE1lHeVO4Ul7dF9iqtPtGOMGOoN
         yEhkJWY43gPRY1oo1LD59mZQRe4WgdZrP/ObfAKylkpjDZPN5uCxZRPXYWASviwmLSLr
         daQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI8xHwqqxkAdCclxhXDtoDgJTIFrkM8n8IvwfOxvtHMIueZEDWh1gEQa0hlFI1QY6c6gzVKk0cUyzw@vger.kernel.org
X-Gm-Message-State: AFuF++nrR9kp+CCN5qufySRurbEWsuX9/4VoRc3xMhSr217BgE+a1S4c
	/bsEQs/UVRS3XVB0qA6UjU1LOg2kjS7csso1CGsdrj9oXfskCYy2nS15EXMbQOwZ5cw=
X-Gm-Gg: AYBFou2AGy/hHWuBg8/6dc6cRRax5HC1H8dE307pumf/Y3Bbm7g6wi4onN3BieAY5p2
	H+APYE5XKMIL5H6U6uu0Fzlic1kd81eBbTpYzJ6K4Q8R28ZA2+TnWMVZ6xHPvjlD3MrBNYPnNGO
	GXhPW+MmigcIMj1SAACd/LYerl6ekulmw3HyYT/RXi021lPodW38ROcmQFrOjQP10Kvn3n7Dk7d
	MXhZELE0upyTMh1DfZjLFVLZnP1MwJM3+uqAcCDiN7t2rN3c/YNNG4c2ffIlJzP6IHLzls8a8qV
	0WlCzmawzHFF3Ui/HpE2JCpn2QeoUiqw+ob8FHxj25ZW5cTvoa1DcaosoN/jaUZXxRx8iQCiyM+
	Ty2On0E9bKgdVwn9M2/+XXXJ/wY0iVDJgNherzJNSHhaRq1eL6E4V7cDvDPTSGLEO2tUoi95ta8
	yiCRN1CLmKNI4e9YJf7ua3Nq9akQrOEEho+NAm6UpEpdzj8/ka9yBRd0TifV8pKFgJEXCZgMOPe
	9rasNgPKpf4+BO0sjcyx3m1VQ==
X-Received: by 2002:a67:e703:0:b0:785:ab90:bc52 with SMTP id ada2fe7eead31-78a4aabad79mr2101121137.8.1788527154243;
        Fri, 04 Sep 2026 06:05:54 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9809e56231fsm170342241.2.2026.09.04.06.05.52
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:05:52 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-97bf90f4b41so590274241.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 06:05:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzbXbf/2EIm4OmhZTdSeUplAyt9SieBX/G15XcD9Z1gGaUoLEbbuOQGSzH/1JsNuLlvhgwVVj316Rsm@vger.kernel.org
X-Received: by 2002:a05:6102:290a:b0:785:f288:c23 with SMTP id
 ada2fe7eead31-78a4a918bdfmr1975845137.3.1788527151892; Fri, 04 Sep 2026
 06:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:05:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2NavSY5K3Em4jTKuiWCZCc+XOWW4nH4HHh76aoiuWEA@mail.gmail.com>
X-Gm-Features: AcwNN1VET22qEnErTI_Nd7aROS6yUTveXM7jVaLpauOVguTdNaHuyqM0FX-8ExU
Message-ID: <CAMuHMdV2NavSY5K3Em4jTKuiWCZCc+XOWW4nH4HHh76aoiuWEA@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 14:54, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
