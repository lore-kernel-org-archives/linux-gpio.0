Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9F04E13F2
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449645; cv=none; b=qLyGu5w4ig1w9lHv1QKGob8FJt4ISJgHClZQLi+tFls3xnyloAdLjiLWuQQ2LJF513vlwoL61WCqhgZhiwFPkYT+jUBnfOF2wTgmn0zAF24IKLdB3ujsKAjrHeFKzV6yOkMJtKBiudDtfSPpQqLXodHmDnLJ6UbBpMHYmwADdaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449645; c=relaxed/simple;
	bh=4ISs0p4OZ8p6JtAb2NqQCn3Ms3bwI1uZBinFoY6Hif8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXrvbYjxV7ECuFyY1FKrFn4bX/309uvOuDGXB63SH4Nm6Yi9kGnJvRx0VLLvgW4fSkDTPbgDt7cBcKVREfP7mVCZxdxiBvrVEouADvlcnu9KKWfsJnuHza4d/N/CTJGAnLGV03KlUZQ8dyIfo2GdEAMWzzq/U+UQEhY4VwuZlgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c6670fd413so999083e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 08:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449643; x=1789054443;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q4co215V8cCcryKl+ePptL3AZAP9ssa33MB98SUpHXE=;
        b=bT0wSljnzopFWV3SMF2rW328au9UbUSbwdOYpgMOtO9c3rXDs8o/6HsM0kpc5tGEi4
         PfXtOR1UkNrq55qE0+IsO9PaTtBXcfvT0lXU6S+OF7/y+HL8J4S7lyxsOwrHKcWvnB9T
         IL0thdzXuxvqPne1hiKvOhaIMUEwuoUSkgaHZX2XIBvslkd3zj4i5DRaHq6md3jQgOtw
         cgHEJSeFv/t50ktBQGZLXsHHpXYgoTBzaechDazPBEdzaIrsycQAg2inCLmpYhoZh7jE
         9AKGb0c9griS7j3KniwHlrYwTbr3x57uCXabbfqNvQaSGjKAaLgfXoGdh7mL7UbFaPGo
         gJDQ==
X-Forwarded-Encrypted: i=1; AKwUvByhkzDceWpFxDSn+ZkvvSVC3+0ac38g0JY2RdaL0E6+EEhjV7ZRNNRi1eTr3OaHqod9IcZ6JfmI3PNA@vger.kernel.org
X-Gm-Message-State: AFuF++mxmMRDwFgGnqSJfz3Ef/pHcDBNvDVEsrbifmHqjJ+T8eWVwuP4
	Jb0ih7mJysBgE7zBXC8sph8LTgS81FRR/e+pljQRpiryNyNfwuOqn8Ejj1k7bXAOI4o=
X-Gm-Gg: AYBFou1tD8jfqCsfezXJaU+Eht/BaSQi+hojA5gYlsXaS6qhdWlKr74jtsC3NT8UPCT
	uMkkLFYVO7cSdQTg7OdHf6FM/l2QV4SdC66WBDjSYrA5ayAvFUtp1F72NSx0/ZvSQ9bf4zoD0mt
	psYgXEBvAAolVVLSFg7OwZcmaS7BDpy5c0Sq6isHLpRPNBwW7HYDAmpWvX38F/bZ0IrrsAFKLbd
	yEeVk0KjTX6DCxolIJJx7mHtBZZOt4HFpWAP+YHVfQNjiRLXzVdbtJAopUnquR46wp5DMoEjj++
	Y0TgvyC0lKaliO544U1p44y2HHm7GcDwqXJSX8alBlUKaP13spOSeXltg8dXkkckmrNJseRRamG
	H02u9RNAK09LdCtJvEklt6a1QPeAPdHrcXm9gO+2LUm+zww7kvY8anKty4sis8G7PzC8Bpggrw2
	U88M370KiELuW+MDuiM0SVzsv+p5mz0uwL7q7p7ajuw2jZMkPt3xKvIT3Shqu+sY0LmAVYGS6Wx
	79DsYEcLhfptSDsqa/ZNVg2qA==
X-Received: by 2002:a05:6122:469f:b0:5bd:8dd8:146e with SMTP id 71dfb90a1353d-5c7dced45c4mr1850149e0c.4.1788449637908;
        Thu, 03 Sep 2026 08:33:57 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd92817asm4699729e0c.17.2026.09.03.08.33.55
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:33:56 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-78a220b5778so1099176137.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 08:33:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzLNHnV3CoCpGx3JfCwy1UhmU4eG8rNzv37xBWa8ebNz2o0sex7cnY3AydlgBShKgmm4B1sQUS+BTBo@vger.kernel.org
X-Received: by 2002:a05:6102:8345:20b0:777:2e1b:1e2e with SMTP id
 ada2fe7eead31-78a2ed7ca4fmr1596359137.3.1788449635039; Thu, 03 Sep 2026
 08:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903113327.1217457-1-claudiu.beznea+renesas@tuxon.dev> <20260903113327.1217457-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260903113327.1217457-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 17:33:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGCdFH4-+-0Cws402jvHO7YBAELUeobp1BbDpeAZguZw@mail.gmail.com>
X-Gm-Features: AcwNN1VsYZsO5o2pygHZnaCq-bQizs6Zsc1Hfv4_iBmyRo69jsaq1nCLJ4t6av0
Message-ID: <CAMuHMdWGCdFH4-+-0Cws402jvHO7YBAELUeobp1BbDpeAZguZw@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 13:41, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v6:
> - used bit 23 to define PIN_CFG_IO_VMC_I3C
> - described the I3C power sources according to the new method; due
>   to this didn't collect the Wolfram's Tb tag.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
