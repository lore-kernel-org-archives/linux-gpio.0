Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24B44BCAD6
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861556; cv=none; b=iOIsqSfRCk2oU6WQ/Mo+397E+bNGQQ3g3Fc6G47G5KGZL4UrAjLK1ZusZHhTZLEywZZ17o+p/LeboMBNtIsCb2LLr4PnMy/oS2l57RS394opm6SiRmvKC6MmLupmMbETW4Z79ZoEqcwLFfc7RdziJgsWqu9QQPe70ecSD34c9MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861556; c=relaxed/simple;
	bh=3MWgRPJt6D+zjmI3Wl8QcK/1SWMhE1qLRXA8MiA954Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfD+ueOvE3yOv6mudwpGz2lB6sqyPX6Ckvi0PKvjbe+bdSvf41rEpRbsGbMiytsQWesprKq5e0NlY5eMbNL76VV8EHSPUaLOREJYQFs3Tt3CLsVAQdFVDkydJprpPPdPO29MaxZCm/itTNFBKU/nn6DyVDAypju0DoKPWLNSM2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-783fffcfb96so3369111137.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 02:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861553; x=1789466353;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NqiqRUClUQHn3RWD34Rj7ya4TrrYBw1oXhZrdghcnm0=;
        b=GHjY02CbkBnnNQIKb6yRsJqeMbWwcQ8baC72UuTfMV0Gav8+Bcf1zZrNRkoJ5YQtuu
         sSai2s91AACw9tMzO+B/S2yua08vE23HNgyN0/YJD70ryb04EZ81SRtRckXKQUKIZ4iL
         jcEfx3F/ofQ508j+Q49/Jn+vjCTASxdou3HLUlS/Z7OmOc8J0rbMyv4nKE0LzlLs2pwB
         tb/fO/d9wpS/v++SiaEbHDoW1BBL+lGnGK81Ymcb2IzFymHQJ2YRsnJJDdOwaAn7RTAz
         R3j/QpWwmJs4H7BevB0TtkZPu7QMAiUiHpydTmoEeWugH8cJGUq1OWPSk/VSi9JFV1dx
         EdbA==
X-Forwarded-Encrypted: i=1; AKwUvByxRhCfMcBVdnaWUb0lPHngP8DpFA8Qz90Nu1DCeuw9W3GNeVN/b7W6A3Hd93ZFtUVy2gFJ06giXWo0@vger.kernel.org
X-Gm-Message-State: AFuF++kCAIE/dM6uIpGPKAzK2MAFI+wXOpQlV1kw9IrW30p8Yrxejv6g
	znuUvGYoW2wUBwvgX4GaUoF0ecxZ6Bgkh62ki297NGLFUB0i07UNCbu5UtofFBrW
X-Gm-Gg: AYBFou2h6llebyWOU5LU8zjeIQUc/NsNtFMZsgrL21ry9Xna73uk97a6wKOi8yXzTG6
	9NVY9BA4K86MSgQ5a30AfFBgYcnUik1q4VwTNWXJ1xtmbA+NG/pbjONqc+y6HHa661iYML/zTRX
	Q9IqFT7hh9GzuIaaUZobeeUkWGMC7d7SiGfkb48sDl48VKaEOkalrGwf8YVocwdHhxHqQRb2DmN
	2rYeX6kjHMS0PoEa77So0vqpbrxJBHJwatE50U7eRBTrhGimHbZa0lOplAT0x3gkoOvFv7+U3bW
	dGF8bfcipuI436nySSlmK8lxobJd+ZiMh9hPNmmT9CfxHKma5wGpvXG2VSmkaIEKBwLf1sNe1Fz
	tw73ILdAULNiUEDOTOwumTQVCGxj5x0Cp8PoqXo/WPe99nQguqzP4SGBvoSDC2uhE2n4nvnKbvP
	FdbUAgOk+C8m3MO5mAYG+L1iv7/8QDs0gwU6Sjo4iiznbmZYAzXbampiEx3Jkbtk51zPX/UE+15
	qrnc2hRYjVRHKY3/RI00qoktg==
X-Received: by 2002:a05:6102:b02:b0:786:c86c:4f5e with SMTP id ada2fe7eead31-78a4a6e7023mr12785619137.3.1788861552829;
        Tue, 08 Sep 2026 02:59:12 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76512sm8412685137.4.2026.09.08.02.59.12
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:59:12 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-782af6c753cso3961222137.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 02:59:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzI/FbSpQjfdBO8p9ZwJ2w32sAjIsol7u+VxEZK2VoG0Gxlk9J/r3TEjjwSAgEYCTepXzCzlnJ4GE1X@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:786:c86c:4f5e with SMTP id
 ada2fe7eead31-78a4a6e7023mr12785609137.3.1788861552199; Tue, 08 Sep 2026
 02:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-6-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-6-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 11:59:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJ_4jBADsQLMCnhspGG8EWO0yUujFqh=31gpUoNydJhg@mail.gmail.com>
X-Gm-Features: AcwNN1Wx2sYjbS3xvItm138PxHE5cGsknrhce5nrxreUz1pch3URAaKQ6yGSL50
Message-ID: <CAMuHMdWJ_4jBADsQLMCnhspGG8EWO0yUujFqh=31gpUoNydJhg@mail.gmail.com>
Subject: Re: [PATCH 5/7] pinctrl: renesas: rzt2h: wire up struct gpio_chip::set_config
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Wire up struct gpio_chip::set_config to allow GPIO settings via pinctrl.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> @@ -1192,6 +1192,7 @@ static int rzt2h_gpio_register(struct rzt2h_pinctrl *pctrl)
>         chip->direction_output = rzt2h_gpio_direction_output;
>         chip->get = rzt2h_gpio_get;
>         chip->set = rzt2h_gpio_set;
> +       chip->set_config = gpiochip_generic_config;
>         chip->label = dev_name(dev);
>
>         if (of_property_present(np, "interrupt-controller")) {

I believe this does not depend on any of the previous patches in this
series, so I can just queue this in renesas-pinctrl for v7.4?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
