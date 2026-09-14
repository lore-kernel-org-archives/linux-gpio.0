Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3B449159C
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 16:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404762; cv=none; b=hcztUF4eqUpQz1nGCW7gAMxFKwv7Ru5gZ+bncA+x+5GpfG0I0yQAppx6rElo/TI2xGunbIATGLgHy+noBx1fEz9VJd7EGK0zQ4Cim+2RswxAvQWcun/HeEUsSYPoa1VbquqhPPeTdtyE9i53xwm/IvV0UFx5QX4Xa2lIQqz3xQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404762; c=relaxed/simple;
	bh=Fd2S2NXGFBalIowiEWphlMNoSm/GpBg0YH4nqBrZ3ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqRiAC2T57vGAtEPK9YS1XPxqfYpig4p6rp6npmXY1Z36EWmnt0UY/jEJahHghH/lvjudSz1OgtznrCFT8BhHcJckNJWTWUDLLo73hyG4ryPSfk76gQnolQ6wFHA6p/zQbOncLgO9Nb1d+gaWrRkS2/t//2tnScV6lleLfwMWsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c62dde3so786451241.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404759; x=1790009559;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W3a3IBWWzJToy5a1Wctoyn07sbyxrLzeKnit0JiQFO8=;
        b=doD/UveB8UydDTL0LTySmv53C7/X++lCdXi27XHjkAPhwx0sJZRMJ2d8zr+8uyzIV7
         OXyobAVUEaP8pvfJa1M0JdZeTXrn+9FoMD72z6I0MLLYxeCK/e5/a31MFGfwH49WUSw9
         aQqCcNXVNsnQXL+/2/oxRZbdAFg0x8UcHAnJ2vn/02Wgtc1Atg+NqAF6ZjKKmSsaX+1r
         8D28efn1t3KrmVzmWLqgPdlRs6y5ogoNgPJvU+3eUx6S5LFjjEMgMvv98yCz2Fp2+jiE
         QWHCubCILylVrZP+QZF8I5u1IlKRD2GINSxkH68ntRx3rFwy1gCzkmB3+RmdKvU7KD++
         etEQ==
X-Forwarded-Encrypted: i=1; AKwUvByrVtKHVy8uH1yB/ay33qVqDzXhtypfP0lRTMW9yWqaNIu0Byno42JCSICKIAVc08kWpZAs/bmgT2bT@vger.kernel.org
X-Gm-Message-State: AFuF++kzeAUA7WkTAwF6KabLJZpychH8y6UTzOgpNXGVA2RANESsnL+F
	GqxtxmUqnHYvEgEm6uUfX175lFX06Y5oKZwO1HZSMeJ+DZj3TyOU99wLmc4W+s6v
X-Gm-Gg: AYBFou0DMNe6q03CO1sP5xUiL2mZgW4qtYj55k4lyhhS4ajyHwweaz43UjT5jtcf9Eq
	xfovCjU+GpUIyPMZT1MWuQO48i0jM8tRHOcXVl8RrnvTvPdk3/ptlSFt8OU/H8oBgT1mfbzeqHX
	8O8W1aAQU5T+mNBahB/M/uoKbaX8kdgzIcIVubjL9Z9UpYiWWNDMiy0G9/+hsFDj40xeAdBTjmM
	KCBPxyzOC19+0gl+t5my1KqDg7LlY6SZzB6Bn2+YfTaonTmxSiFG7JzQ9+WY2DphIbjhUI1BuOC
	Fj7OukSiT4Uu1z5vtRHjsXEsWXNcpsD9yt4aFXpSGO0s0MoQYZPDN/5nYFTvgKNh2VSzqDzRicc
	peUbKkMuFmPfURFFHO3d76vRtUOZz/E8dw41qWk1tHsoegNHK82gQIi78mb+SSwtK92kwZcEAw+
	qmuFEhIk90TMk5h+m1qnm/yadc/1UIr/BZ+91GJGftb+BwZeAw5iy6NRgOPwmupOdpxJhwXd6QJ
	t48bh07qH9iATkIW7xWkJjTcVac8RHljriwdTlIAz87NF8=
X-Received: by 2002:a05:6122:e266:b0:5c8:4409:602a with SMTP id 71dfb90a1353d-5c981e978a6mr4572542e0c.8.1789404758692;
        Mon, 14 Sep 2026 09:52:38 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470e7ef4sm12828663e0c.9.2026.09.14.09.52.38
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:52:38 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-785643199baso728617137.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:52:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxKX9Wk+AfNwptG8tHhFsIheuGX/GtsYTpmsFIs1jTw7PEedZHkMPtR0Q6hS5p8HUErgCQlOrcUrFMc@vger.kernel.org
X-Received: by 2002:a05:6102:e0f:b0:799:b918:687b with SMTP id
 ada2fe7eead31-79b5878ab25mr4331172137.7.1789404757823; Mon, 14 Sep 2026
 09:52:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260913195654.3371385-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260913195654.3371385-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:52:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWi8Jz6GVGJj0VsXOEiOw4ghJgz895m36m2hDvVCkxpxA@mail.gmail.com>
X-Gm-Features: AcwNN1Unuk-LkzOotScnYJj-MKknR-KC4le6kfYxk1N80HhcIpZu4mg1zP5BRtg
Message-ID: <CAMuHMdWi8Jz6GVGJj0VsXOEiOw4ghJgz895m36m2hDvVCkxpxA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] pinctrl: renesas: rzt2h: fix reading pin value in
 IRQ function
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 21:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> rzt2h_gpio_get() only reports a level for pins in input or output mode
> and returns -EINVAL otherwise. When a pin is requested as an interrupt
> it is switched to IRQ function and its I/O mode is set to Hi-Z, so its
> value can no longer be read.
>
> gpiolib calls gpiod_get_value_cansleep() to determine the edge's
> direction when a line is watched with GPIO_V2_LINE_FLAG_EDGE_BOTH.
> Non-zero values are translated to a rising edge, zero to a falling edge.
>
> Since gpiod_get_value_cansleep() ends up calling rzt2h_gpio_get() which
> returns -EINVAL when the pin is in IRQ function, every edge is reported
> as rising.
>
> When using the IRQ function, the input buffers are enabled and the PINm
> registers reflect the live state of the input.
>
> Report the input level even when the pin is used as an IRQ.
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V3:
>  * move leftover unused function to a later patch
>
> V2:
>  * remove the PFC_FUNC_INTERRUPT check in rzt2h_gpio_get()

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
