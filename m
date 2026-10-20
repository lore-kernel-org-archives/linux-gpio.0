Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488447;
	b=NRYJ9l1rgloFBgNAVov5paOYV+JRqSpos5m0Q6XygnNfKeOjGSNg8Ri5Basg89a+NI4j
	 SZ6U42z5Ky4HADgnPqopndnsuI6HhHxT4OZ1V60FG+Fsym5QxhNa2/kAYaTWi343aOwh5
	 n955GlULSFsf9/bmMiKptUti4xDPQbtL/tH6Q0fFb4f+fKyTBtpk2I+1l2MGRwycmey+c
	 pZjPp5WTv9dF0hlkUzRovo01veCTwQNdObwjBmoaPB14iTqEgdr+jM2OJGVRqBmx5/MnP
	 o/xP8T9r1ZRLargjh6i5htkSNwVOG8nTEwEYkRFSrKyAyB41mhAyaCvm+UT10IzRVCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488447;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=BDWYvpCyYNbdlYdFIyikLQLsNfMBmKmrC2Q4BgdAcQ4=;
	b=4UCsDHeA7drcdFurJlzi/U/vbgSPKYdlx0Qwg9tdOj96FiIYJCil8qXNcM8GXvd3dIl8
	 AgQ4wDhgJArGZDsiVGBBEBVEM/zcxYkP8JGMPa5nExWHNfuXruowNVv8aK1oOhehyKcj2
	 pOCp9g0Kr7kJZNIxzUDbe1qk1rG/qt+EmPvRGDs897RULotip3yswJ26bSTVrf95T+wnU
	 rbuLKknmh4JNsNXfwuotJv76vI4JAQ8m4pPQrNVK/PBwQ9Cwe9gQtud6cZYqoz/KXsCP/
	 PaAqAmGe0wOaRW3uZpfRbo/2fuOzlOGxMEVzCDVJIrIISSlNC26VzMQS8wOv2vpIxUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5554B606A319
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 09:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5554B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7c420c2c4faso1670081137.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 02:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488445; x=1793093245;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BDWYvpCyYNbdlYdFIyikLQLsNfMBmKmrC2Q4BgdAcQ4=;
        b=Gq0jYHDmMK4cNI8sTbWlqsEC4tmnZQ1ZJa005jA9ne60t3+136HiBZ8S7BARwLNIxf
         9FV8a1tGGsVYODaM+//p2rlFGZGdz1a2V5hx7eQQE86aYYJ1E1HUS64SflTimZHC4ORT
         cmAhdz43D7sfFMEXi+X1Mt4lqlUTlmnEM9QYzah2uw8k3xJRMFM9wWGzmDbt+6qDnQjb
         x3XnW/xopb7KJTYKsznsU+BbPUOsUEHpfb3a4x7bxbItkbhQXTmtb43HKlk49gMgM1nH
         F4xTeZsPQNWG8/y90f2wlyGm3FC4DDtLq8PBrNrdUVx9B5nS83QZ2ctc7Lrlj5UW+cJl
         4MxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWJD6EhvEatDbqIbnAJOVpFO+S09FzT7ipl1lgObxgYm3vbdoPoFqmAX/RhTImsoaAa32Cj3sV5r+o@vger.kernel.org
X-Gm-Message-State: AFq9FYL/qcO++ungHyqwG+/fRsyA3NU1BzPj0HaXxU7VPJfe0ZhbytVo
	4k69niuD4iOGaDbRZd6Xt7If2GRgtnH2qyANEJOof5Npicei3qophocdqeMF6lYPIpM=
X-Gm-Gg: AYBFou2JLqIQl/DBLHV2sC+IqotdYRSXHARdA52i9lIJQD+5VABqRY+GElKC+ipKM5Q
	Xcei16tbGJQDFS6WRyNxyXInvPGNe6G9YnoMaHbrstRtJ54AM3dK0tMpHXWxjWsK0Bc46ahJ5c5
	h4htqTQ84sysApc6cPkvQQvghs+vYd/vwX/xyykF75DcFUfTBmUcw7jnI8ZG+CY5HBs/8YguCwR
	+T62tTQC+uf14JNNnzjwe5k0JqTiXdquqRE6SAB0XlJWZDvMf69M2ZAMdQVwOKDuVfk2ez/y0Q2
	xABjvQOHG7MRpDuH7Z45nNZmbLx9WoG4NgeFge+Eq+57FjA9KGRbKPvQU00ogo1hDyCOMvPpw0t
	iOGX5k9+UUY4hVgQSxeG4KUux2+HVPI9yalXVXgOR2z9OTJVf/buvzLhk6SXllgJFaOUlZsb5zi
	ih5ZZ/yoXrhKSehrms+Ln7gB4NksAl1cazYBzeBAMYQc9B5CASD8mmXcqGEqAEU89d5O0bVY49f
	B3Vkx5+clMjXVQ92BBtS1roAoLVlRUw4G7t+jWy
X-Received: by 2002:a05:6102:32cb:b0:7c3:99a3:314a with SMTP id ada2fe7eead31-7cc3690d963mr3298689137.9.1792488445281;
        Tue, 20 Oct 2026 02:27:25 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb25937dsm2461496241.1.2026.10.20.02.27.25
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:27:25 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eadef147ffso266894e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 02:27:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBza+0zOmdAtAeftcS5rxqnDnIGjebX0eiqon+JlGCTcDfT5ZuBL4i16JNrvXjx2z2vJLqmEaMQCu7hB@vger.kernel.org
X-Received: by 2002:a05:6102:1625:b0:7af:fef2:8ecf with SMTP id
 ada2fe7eead31-7cc3691cf50mr3455060137.8.1792488445010; Tue, 20 Oct 2026
 02:27:25 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com> <20261020-divo-ssgrlpcsrc-2966-i3c-v1-1-30a47f25e515@renesas.com>
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-1-30a47f25e515@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 11:27:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWt8KV02C+N1dj=gcdJwX4s-_=+zRpsh+Za+f0HeHOkuw@mail.gmail.com>
X-Gm-Features: AclHuK-aAi-Edh8uIEyKFfeZ8ZpBiAefIme6DU1Cm8luHP5VW0oo3t3lyPOBTwA
Message-ID: <CAMuHMdWt8KV02C+N1dj=gcdJwX4s-_=+zRpsh+Za+f0HeHOkuw@mail.gmail.com>
Subject: Re: [PATCH 1/8] i3c: renesas: Fix zero I2C SCL rate on pure I3C buses
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Diogo,

On Tue, 20 Oct 2026 at 11:15, Diogo Ivo <diogo.ivo.sx@renesas.com> wrote:
> On a pure I3C bus there are no I2C devices, so the I3C core leaves
> bus->scl_rate.i2c at zero if i2c-scl-hz is not specified in DT.
> Deriving i2c_total_ticks from that zero rate programs a zero-width
> open-drain SCL into the STDBR open-drain fields, which are still used
> in pure I3C mode for example in DAA.
>
> Fall back to the 1 MHz FM+ limit instead, the fastest rate an I2C
> device could have, so that a sane open-drain timing is programmed.
>
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Thanks for your patch!

> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -579,7 +579,18 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>         if (!i3c->rate)
>                 return -EINVAL;
>
> -       i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +       /*
> +        * A pure I3C bus has no I2C devices, so the I3C core leaves
> +        * scl_rate.i2c at zero if not explicitly defined in DT. The
> +        * open-drain SCL fields of STDBR, which are used for the DAA
> +        * pending read, are derived from it though, so fall back to
> +        * the 1 MHz FM+ limit instead of programming a zero-width clock.
> +        */
> +       if (!bus->scl_rate.i2c)
> +               i2c_total_ticks = DIV_ROUND_UP(i3c->rate, I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE);
> +       else
> +               i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> +
>         i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);

This looks like a good opportunity to use the shortened tertiary ?:-operator:

    bus->scl_rate.i2c ?: I3C_BUS_I2C_FM_PLUS_SCL_MAX_RATE

>
>         i2c_parse_fw_timings(&m->dev, &t, true);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
