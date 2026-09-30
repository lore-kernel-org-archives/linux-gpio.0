Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56D041DE18
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 07:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751957; cv=none; b=BydFaHj2hggtO7BdcanKl4R/1W5Y/nro6atDuW1LXEjAcejybX4YsJ7zcBqDtk+jiT2LwheuXzKk+WIc0rETcXgMoy5KzxnDyopu2Gy4ycxvp8afsxvyAfDsvR2nqJfIna3NNhqkoItjViMO4BzggmqtmIgWQtRrIOsPev8Rg0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751957; c=relaxed/simple;
	bh=6x6zUfX3HAgCXeFMP5IQJ8hlZ04cJus+Y81jg3rYM3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIkD8WAV8FdERd96JS2d4m0mEy8YOjgThkP/oBtq3w4baOeDatQu05xh2K4Hdkn7cXVrV9m4AW/qgfFC7BZLP9PS+OC0gt9r9x55+UuHkCqgmH/eb4vs4VluT/JUDE45a5ZSW4BvMyU3xcUDRYTfhVVHliUzJDxBXsUzT2Hhtfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f36.google.com with SMTP id ada2fe7eead31-7ba8b67f74eso256332137.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 00:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751951; x=1791356751;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KRLyqaFR+2tvKEVGCS6TXPlesufaQZLklH2Mpn/Gp60=;
        b=Dx+ldh/RIvC07DJ4rLEqLf0XP8IN5Ji4RYR0DMB0sj8SrzI6CnnpxVbps4di26IUZx
         i78YDD/oud9OHGpAKXWB8LF82oYPjs81TYMwq5Vb0+MZ76MpegGhyGAGe5ZwyeKUqYGS
         hhfgyHQGyzS6GmpJA97BBsoZV3HAUsVYIUIg/itt+Yr1vsHid2facpplalonYncpkxUi
         Bbld1pPTBtdrMge9z7yVdVYtrFxMEgbpIBk5+8KGXE0oYF1jELTYW4VdimsCSCNda3nM
         0pa87zdTK/+BzNjXLk3au9JAdNQSvYqGpji4gznJ/v9rvVYhDYa6+OnR9I6rVJg7An/h
         J4Og==
X-Forwarded-Encrypted: i=1; AKwUvBwEThsAGvPh2pQg2T2SFX9PWKXt62/o4zQZ/hsorrQiKYMYJF2UZqb8egBTdQVGmCFTf2IBfY55EVdN@vger.kernel.org
X-Gm-Message-State: AFq9FYK+xRCLrcE01/VuvHXYSWcnUxaXvdOkBCChPnxyczTtLjJkI+MF
	RRugXph2Kwu5rDj6uY1J5n+jkqw1n4Q5qUwp4EhQ7HfXoo0KZrKhQwyZU5IXWi4l
X-Gm-Gg: AYBFou2IAqBj9fU2OIr8EZBvZdpnHEzWpGFV/hJtV3aeiWL1Mn67b2AlsYi3y2EEoqW
	KGardw+Bv0VHCpWbZR/yIL1ENrfWC494dYJzwFtc5A79SbltFuadiXRP0cG2aGCb7KRhYMuwaaa
	hV/bAlrBC2pGQtT5arGSjKOD7JxS2SI7dUhO6UwmJ8yUsRrbxLbjw7e61GeLbEQi6q30aaNKz7T
	TGar8TFpA7+o1G8sz58w6bJE8ePeCIPDq+GQIcNgJoLklc6KcBTBd27Tmv8PYGCHyoeb1AMai1t
	3yRKKFD7pM+0smtQsoiggOzdZD2WSFKmjsIiRHFuHT4oWPtSwvziwEl2eNSGXDngvyY6inza/1N
	eCHZzMXb2LUA6QFRJ0veEz6CHw3lz2AVBl5VP8I9OMTLL6o9LR2Hd0LuNhao6pBrc+YZ+STSFJ9
	88Vh4bNySr+iALSwboQGa9P0wKF/4Kv7ITymkB2nt4otoiX4YFZ9mvYqvFTCT7GBPrt6SUxrhAA
	qtmCl9kRG4TlNChBArDdbjBprgo/jGKIyrw
X-Received: by 2002:a05:6102:4494:b0:7bb:64cc:1362 with SMTP id ada2fe7eead31-7be85b2bda3mr40601137.6.1790751950826;
        Wed, 30 Sep 2026 00:05:50 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7be13848a28sm449048137.3.2026.09.30.00.05.48
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 00:05:49 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-98536aec408so1289650241.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 00:05:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwZ1Ja/pRdL5TNyGTtYP2xgyAXlZJeTUDkZtn7kEH/gv4pK5zQRdYkZEeim7727sV2uhDpNLkrufI0+@vger.kernel.org
X-Received: by 2002:a05:6102:6112:10b0:7ab:9152:1c6e with SMTP id
 ada2fe7eead31-7be733a556emr39198137.27.1790751948220; Wed, 30 Sep 2026
 00:05:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com> <20260929-rsk7203-properties-v3-1-02f84aeb8e47@gmail.com>
In-Reply-To: <20260929-rsk7203-properties-v3-1-02f84aeb8e47@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Sep 2026 09:05:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpevoQLHepf06K1=YLRr+BUF9s3W_zaQkO24qiY2_DOg@mail.gmail.com>
X-Gm-Features: AclHuK9T_GF3rRYO4h8sYrJYvPsih0XtUnox4vMWY5UxSoWqqC_FxwtdTdbQ_M0
Message-ID: <CAMuHMdVpevoQLHepf06K1=YLRr+BUF9s3W_zaQkO24qiY2_DOg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] pinctrl: renesas: gpio: isolate function gpiochip
 from parent fwnode
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Sept 2026 at 06:58, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> The sh-pfc driver registers two separate gpiochip instances: one for
> real GPIOs and another for function GPIOs. Since both share the same
> parent platform device, gpiolib's fallback logic causes both chips to
> share the same firmware node (fwnode).
>
> This causes ambiguity when using software nodes to describe GPIOs, as
> gpiolib may apply hogs meant for one chip to the other if they share the
> same node.
>
> Explicitly set gc->fwnode to ERR_PTR(-ENODEV) for the function GPIO
> chip. This satisfies gpiolib's check for an existing fwnode and prevents
> it from falling back to the parent device's node, while ensuring that no
> actual properties or hogs are found on the function chip unless
> explicitly assigned later.
>
> Assisted-by: LLM
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> --- a/drivers/pinctrl/renesas/gpio.c
> +++ b/drivers/pinctrl/renesas/gpio.c
> @@ -278,6 +278,12 @@ static int gpio_function_setup(struct sh_pfc_chip *chip)

As this function is only used on SH:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
