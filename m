Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296CC3BF696
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780566540; cv=none; b=H3RfCN0S6NUWkDycKhSVrUoGGXvELGcfstgOO30S+4FtR3oRnOaXhvh9Bk8r+KiZZslU6efnsnRByV2X9PnqDRM1XRi4Ss5vxm8vL3aCFV8LyyBhcvjuKt/qJXBRB8VGP0/4acBr6WTeHfNsqJoc+dHPZ5BT+S0CanwwAINJPms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780566540; c=relaxed/simple;
	bh=9ccdKlMLp3ktq3NWcjK3eTgouh7Xi9aiQybPD3Ap1o8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EMACrsAm5FlcnGMiTNq+jhTJRTk8ODkG0uP15GJHSmACZCglT+9oLRf2PZ3vZi6uLeckt8yjnGJLUJVBpj+SvqXoORRHzl7+Y65jvP+0QOkIDmQsq4i505q44vIlrzLfFvoE22RwF3TjS1nH3vrBCluE9Wlw52B5VWOSdJIs7oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-963b09d5b91so465896241.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 02:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780566538; x=1781171338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPyZKtpWg5qnni2e5fD9GWWB7qem8w+cCv5HCayF8qI=;
        b=f4SbQPxp39itJ/SGyeEtJjztp/DTq3oLcnM8inyHF3s4Xm5FcY30FSZ1sHzVJ7rEqR
         kZ5nlpUkFwQvo8FFzq7unLW3YsQH83Cpb/XuVR7IqTc7xQoo+3hvrrXvubtAVqtZ2XM/
         bHMKp1KIJAhsbudRqT9iLkl2w47fl92ZlCegKJ38inclYYQcwQiUE4Fc5EZ5AoWCI0ob
         PiWAfLmtwg5YT9Klr9+ljSDoPYNHd8MdF35DTtas+94+GuYhTMdOYDc1bqzlYrWvA8jO
         qCbj33BmqxhLmi9/AcH3tU2DklJEWYjhgnab1AfJYBicjot+ErNHaeeDk2xbB9NN3tdR
         sieQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zt9N4YHiiwX6+Rxq8gQ0QHl96nCxg3i8xULPMENcQKsF858m93QJVmi352z1Z2W4TDW+SjF8VVan/@vger.kernel.org
X-Gm-Message-State: AOJu0YzfDOZZ23b0b3wECBaNKB7VdzsMS/cmtzLC9r7rOdTyeGW8wDzf
	t62fdASKplXmTUQX+pjtY0Eb0NOQDV/ERPh29PSaAILN9DYdMBB7DVfel2TIuagq2ds=
X-Gm-Gg: Acq92OF78nQSFmeMpBmICyzabJD7xnCxLaT9tDKWeGp2SO05YobRBFyacFZ/EjHWlj5
	1feaV9ILe+wfP/eN+/ZCGKXZXYyXBUkQGuV8FJwm7/k/NjFLQZTw2k2++bWrfBlhXXhZO1XuQt2
	52rvvvsGwaQ2RD5sBGsehVuUbs9Q2zuT1PG+j6iWyaH++7aKOtm/DnfpPbss9jckTerbiOqD9ZM
	wBnZzb3OOSRqWeTis9ggxMpNAuiEyltB7TmYslVlGBrBV+FhCdqX7HtQPfoR5hjVeT9CU6SYctd
	6g8O5o8KLLIMOrbSOsQoi9caTJn14hm8QK0ylmTAiF7DlM57XC3nT0PqYb6xo/oPl03S2cAfUDF
	zaWudIiUCBX5Bv8pF442BuFhqX+qI4Xsa/wPcxxlEUDDpaSXwDq53Qj40AqG4PPJeNT02ycXVAZ
	wl+DCrmWguaeWyyQTbcioEQNGIWK8r4XiPBnHxSuOoyWdvkO1ttEw5pI5+srhKJKjiudabPzY=
X-Received: by 2002:a67:fdcf:0:b0:6c5:94a0:37cf with SMTP id ada2fe7eead31-6f544240339mr898167137.8.1780566538131;
        Thu, 04 Jun 2026 02:48:58 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96413fcc8fdsm4113566241.7.2026.06.04.02.48.57
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:48:57 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6c6f47198e3so364734137.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 02:48:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9IzVD+74K9dtd5pn4Uf3FG2V1JXvlDa5UuYK83v4n+QuV0duy48N7Ym3OhxB3QSiNvUMF6Kp510dbz@vger.kernel.org
X-Received: by 2002:a67:f889:0:b0:6cb:b3db:c31c with SMTP id
 ada2fe7eead31-6f52c84f821mr959856137.0.1780566537239; Thu, 04 Jun 2026
 02:48:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603151642.4075678-1-claudiu.beznea@kernel.org> <20260603151642.4075678-2-claudiu.beznea@kernel.org>
In-Reply-To: <20260603151642.4075678-2-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 11:48:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_T=G7os6KBG6xTnphnhQ9pQtd88BUkg61S7286bZmFw@mail.gmail.com>
X-Gm-Features: AVVi8CdhQoz1FuQPTz5BSOMe5fOJfBS7YW1L8CNma8uYS8HEHOx4e8eahLsemts
Message-ID: <CAMuHMdU_T=G7os6KBG6xTnphnhQ9pQtd88BUkg61S7286bZmFw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave()
 on power source update
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 17:17, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The rest of the driver uses
> raw_spin_lock_irqsave()/raw_spin_unlock_irqrestore() for locking. To
> avoid concurrency issues or deadlocks, use raw_spinlock_irqsave() via
> the scoped_guard() helper for power source updates as well.
>
> Fixes: bbe2277dedbe ("pinctrl: renesas: rzg2l: Add support for selecting power source for {WDT,AWO,ISO}")
> Cc: stable@vger.kernel.org

No need to CC stable, as the bad commit is not yet upstream.

> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
