Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B6335E1CB
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 16:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401678; cv=none; b=RTtW9j05+7zRaaQplHuAyCLTXmoi9Y5YCKnqm+1dolBKaWQ4Siso5KSm5PpNfwnAMlbTXdJKvPswcdVZPGS+WymdsFRK5dLSsMHof9zFEx7WyHb+fa2AX/zv09wB4r/8QbFbdhVxVVGa4RauP/PuNGm/2vbx3n88fkfYEXfuNdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401678; c=relaxed/simple;
	bh=tidAyrhvNd18w/RMQ3ixTcc1CJXXLRgvNSZKkAY+9zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sbKzKHzWRZhfPN1OUELz8VYfeYYLUVe9Jmu5ztIRDTG2aFucocbxYyw9QbX+UgKBDnQP4jVxdFVE5c4pfC+6bciqzq1uOlROr87sywDbQRXldYO+e2I33N79mYu615zjRGdat2nILAZneq6SLYxGwMnP4CmLcg/78VLsX7kWgOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id ada2fe7eead31-7954fbd0ffaso614381137.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401675; x=1790006475;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qykkjFNFoMY5mcORIRq6zXUVDXiXOh0EpjPHb+vO+UU=;
        b=Q+GHiADdn4mjSHSaZUt/AjKLD177fgeYX3iR3nhKc2Wht6Q9j1GIuB8zd+g7/+sM+9
         BKiHx3IgOMKY9y7WvrRVmyo4f3xuY8zrifYLzkUUOYfXfQ2x0ZByp0E8BuaO09dYxYd1
         8oXxhXoF4vrtSLeDahqKgf7EKKwBm+J2sghMC/5L9qOg4CjW57B0Gm0Pk3p2CbrVQeDJ
         hXEhRO8xtYfy+TARz96uUkgnTSlHeEhxbaumqi0lf9Vwc5IQUheEO4qJj8YlG8BxWp1s
         yYxGLoe8LOa+PiTLngQPM1aBbPQS2Z0LYaTHYAsmI0hKmCCgz2J9FW1g/X5zdwSzTC/n
         JQpg==
X-Forwarded-Encrypted: i=1; AKwUvBwWUzL7gbiQ7BUnojXBx0xCdUgTvAJm6IylnAE+qj8MlMjJY0pipgsCzuqkusfgARRGNtoMMvsM8dEL@vger.kernel.org
X-Gm-Message-State: AFuF++kqMDftorzCacXgMYYNcH50wfbe+E1nXZrsRq3yjGmYKE0OJGe1
	ZdRjLWZGKe/7SDFcIYzRqy6gLzv3tB6Hougm/7M0ex3OWIVzXyeACGXZCtfr/cgj
X-Gm-Gg: AYBFou2Fe/HkxZsdplH+Pu7wxyo2dwrZj00AphdlM2fVoPiAEGBXoWY3Y0xDgh2A5Y/
	K11YoDLaD+CkwGXVaqvGQZhgBUa1rf6hWWcZb6fdaOUURUGSqHStfExtirlZYGl9uzU2CLNb0Pf
	MoSl4hp5NGVRcdfUGwdxxp4HBJg/mdQk63OkGbvtL+8SQIJn3I9xDbWtfM6Xua0tnd1rJwvVJDP
	Aq9UbajBPXyEGjtUnDgCjGaZ/VvaOOeyD9PL10CECHjnNna2iwo4soTmrwZPQVZgVTdd2fZMQQI
	Zu6v8v9Oi/giGNjOkA93joLJlErXfM+IiD634NgWhlzAT6WF1+VRn+FOL90H1oesB6heT4w3LIH
	94jL6zTCYY6aWYVt1LdU1Nvd61UKTnAua9RdvKNUkRikWj5rsnwA3ZVshjNnIAPQHJ4vsPwBXdA
	0f8ks1d4TTXU8e369/eAPka1v2lTRgp9N88DDhACHq0wt8IPgvXyx638eMw7MWiqapVEMP6fsXp
	eDKtx5MltUxVxAU6Owj8rUIK5DMhDGMv13xqA==
X-Received: by 2002:a05:6102:54a9:b0:789:5f54:2367 with SMTP id ada2fe7eead31-79b579b0d38mr3137105137.4.1789401665875;
        Mon, 14 Sep 2026 09:01:05 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7927cbdf17fsm10701695137.3.2026.09.14.09.01.05
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:01:05 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b79so440144241.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:01:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy5NZ1iWUc1O5zbUOdpVxdIQA92jsDIW07aqLkxNMNRqyDRiCNdqop2npSq7JTfngNZP9DoOljGQRgu@vger.kernel.org
X-Received: by 2002:a05:6122:e266:b0:5c8:4409:602a with SMTP id
 71dfb90a1353d-5c981e978a6mr3949153e0c.8.1789401664780; Mon, 14 Sep 2026
 09:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260913195654.3371385-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260913195654.3371385-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:00:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUa+v+dU3rYbo94ncntsi_O5jxTYz+R05Tiw5ugvbgCDg@mail.gmail.com>
X-Gm-Features: AcwNN1UsCcmNqwTW55VDblIRDqEUqSmSDNxHTD-MZM3Vsk3F4Hbvpn5nqDQZKcw
Message-ID: <CAMuHMdUa+v+dU3rYbo94ncntsi_O5jxTYz+R05Tiw5ugvbgCDg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] pinctrl: renesas: rzt2h: restore correct pin mode
 on IRQ free
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 21:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> rzt2h_gpio_irq_domain_free() calls rzt2h_pinctrl_set_gpio_en() with
> false leaving the pin in interrupt function instead of returning it to
> GPIO mode.
>
> Pass true to rzt2h_pinctrl_set_gpio_en() to take the pin out of
> interrupt function after we're done using it as an IRQ.
>
> rzt2h_pinctrl_set_pfc_mode() switches the pin to Hi-Z, losing the
> previous PM value.
>
> Save the PM value before switching to Hi-Z, and restore it after the
> IRQ is freed.
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V3:
>  * no changes
>
> V2:
>  * switch pm parameter in rzt2h_pin_write_pm() to unsigned int and
>    remove the u16 cast

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
