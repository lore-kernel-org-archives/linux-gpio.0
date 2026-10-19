Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8F54119FD
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 06:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392975; cv=none; b=KdFYiuH3UXNBVmAMi1092xO+g43NmhLw2g48JW3zcGOM5crHvWiPkIT/0/b6x8AO1PK6BIdNhgbqd55BbfZCpDIgPOpN4JqX2i/SFPAFKL38V36QIvl2e0FlBXbvA34ttmw70TPLQluU/qobfZLOtHNYZh/CLYAG+GU1j5EY190=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392975; c=relaxed/simple;
	bh=M1tBQqzBGiCpQaTKxk2z3UZV5Za8hjx2LmCMzlbWuaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Us4J9CzlwOIgOR2FLreKrNkw27a86RUBd09N4BUsoE9tmQbAN5ChAgyl+euojntVfWAGG6T3MCYbdVsupqYWpQUDD0W2LrIslzZDyXj9IUrm9oUCllNP9Tetg8IoXG/Oq8dx4eKbZu2bF9RwfPJ135WXjyEP0dxeVPWgV7SaDek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5e6b5794d26so1951318e0c.1
        for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2026 23:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392972; x=1792997772;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e1sVMAfuH6WXhZbotLQobiSRzr1r+7aDu2aCsNTstok=;
        b=I+7a66VYLM2kWhfKyYGrpvSOelyNMGa/fPC4NINeCg44wL/NfTCFfbZgwiSoeUmqQ2
         KnkGojPSlis3jQeZqqoZ/oGDBAiTn5SISsycdrIyVfVlvcvK/NUjZJnRD9kpyc5ic4Yb
         xdnFgldVG4N0msXUWMaj7sERLOJpc8Mryu2DKYQBzRLjRDV7nQNx83YQG3zwV6WuaUZU
         AMrjoa7i8kiOli0Z8241ryJ/Zl3o3gYnfPLNYFzmXkFtn06bmd5XWzxKkB9ISt4ST6S8
         KGo+y6Rvuxr2SM9UaiHbRcSMYut3rBv+xRAOw+RBpDUhSxv5CiPWE+RFUTNqVxBiyZ+l
         h5Ww==
X-Forwarded-Encrypted: i=1; AKwUvBzd39nUcEqBgRAgbmvJ0yHqjyVYD/S8oPSwsfMQkibSxGDXC5WEATHH8NV3gPdd8qxkGm6N0MCoBOZb@vger.kernel.org
X-Gm-Message-State: AFq9FYLJrdYOhKynq8gek2ZvHs4PZSQpVEVCj36hW7ITmtTi1/zWuLBB
	QxrWNM6Gko6HLiUmKwqVPWqxYg2Kq8S2v6L0ahkd9+weasICE2mgYuPuNKeCdUtr
X-Gm-Gg: AYBFou0Hz34g4jwH4soGg/CnYTUokvQNtTu+x98ro7Urg9uhFw9Zf8EAuqF9DuLZmro
	0V14oqWenPzSRWj07KhWTz7DPYNqGo25yTJtr+h8aRSGFhRdumM1h73TBwM0g7cgX4UyXfMyceI
	b0HhUkNbQaM0bhuz9N2Y25Px30Yf27q90Q2oYDwK9BovVmVNysluR5QuZyr2x3wpPhzjhwSIuqV
	vXAGEZEZGd7d6Ry6hsfWnkVb5w7Mfgx48MXLOiedpocnqSK75Eisp3lB/0Fi6CoJGLhPcKQxdKd
	RyitTSsdQTbNXjkRm6atcQ1Kn174XYLuL6f9eZgZq4J+44ZUpMHOMUYmM62awVr1bTvTbUF0riI
	FVt3UKr/i1VfcRw7G/M4g/ECYRxfqD/8B1J4ZskmtJ9B3rUWnBtcmuaN02lqIYoDEUMU98utsbW
	0r0HfiVOJtTtrHY+5rIrY3vsK4oQj0sRvW7nXKlJV6q0xZ8aL8N9Z3m4Chhy5BdTvvX9mEptXEL
	ipQD91Y4RYZPnlTMRjmLFGdKmvR0o1M+l/q
X-Received: by 2002:a05:6122:c144:b0:5cd:a80c:102c with SMTP id 71dfb90a1353d-5ea97facc34mr2152463e0c.7.1792392972600;
        Sun, 18 Oct 2026 23:56:12 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b536ccdsm8994744e0c.13.2026.10.18.23.56.12
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 23:56:12 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9909e82513fso1126046241.0
        for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2026 23:56:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw+p80G1TBXAcn3tuzfqg8K4xmqywRKs7A11/Zl+v0IievERX0025j/y+GSLOamIoTSyBiU4mO9cZMq@vger.kernel.org
X-Received: by 2002:a05:6102:312e:b0:7aa:d0a9:c5aa with SMTP id
 ada2fe7eead31-7cc18121fa2mr2108461137.18.1792392972220; Sun, 18 Oct 2026
 23:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018161042.3298045-1-sahaj123.sc@gmail.com>
In-Reply-To: <20261018161042.3298045-1-sahaj123.sc@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 08:56:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdB+1zib0AtA5zoJ0UeZR4TYeUSiP2w1DEHZ=1yKGYBA@mail.gmail.com>
X-Gm-Features: AclHuK9VSv0QigMKGBrmgQqHURXBQJfLZxnvzcmSGSBGel5gQdO-OSfdEC31cxs
Message-ID: <CAMuHMdXdB+1zib0AtA5zoJ0UeZR4TYeUSiP2w1DEHZ=1yKGYBA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Preserve wakeup accounting on parent IRQ failure
To: Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Oct 2026 at 18:10, Sahaj Chaudhari <sahaj123.sc@gmail.com> wrote:
> pca953x_irq_set_wake() updates wakeup_path before asking the parent
> IRQ controller to change its wake state. If irq_set_irq_wake() fails,
> the IRQ core rolls back its wake state but the driver's counter remains
> changed.
>
> A failed enable can therefore leave the expander marked as part of the
> wakeup path when no child IRQ has successfully enabled wakeup. A failed
> disable can make the driver stop retaining power even though wakeup is
> still enabled. The suspend and resume paths use this counter to decide
> whether to disable or enable the regulator.
>
> Update wakeup_path only after the parent operation succeeds, leaving it
> unchanged on error.
>
> Fixes: f70fbc15bae2 ("gpio: pca953x: Configure wake-up path when wake-up is enabled")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>

My bad...
Fixes: f70fbc15bae2c89f ("gpio: pca953x: Configure wake-up path when
wake-up is enabled")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
