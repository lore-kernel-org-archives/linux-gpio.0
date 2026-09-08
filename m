Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80CF4CB8B5
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858354; cv=none; b=XfzFkGCwWMZZV/HAnQA7ZABTBLGq2X5VTi9iJwz7Zdrz0OKG/m384+kp5bB2UwCHfkKl7bDazcfhqB+qwOeY5Jbm7JBd7BX/r0S6iT2kIHnsrRIkeIHELuXjSrIvUytbsXSR3rzYwssA1fodMh33eTRatJPcuGmAyanK5M37t60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858354; c=relaxed/simple;
	bh=qENNEDqTfSxOEMOZqWtlSya5/dlWse6hSfPNt8qgY38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pRiwixCi4/LyXOqAV7Oj9QbyQKsb43Hk6zDWJ7zQ2+cddNlD+CsPyNPYT1K8/TEquUiqAbXLEtRjNn0tni0t5zQAz0tl5xJGAC06lqa6SSfwswdq4M8VrOZN6T4XUDCa8NaU0xsb7U0jFDmsO93Vi2ktU4FDi3VYzD121SArDGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso3490194e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 02:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858352; x=1789463152;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A2RG0cKt2fiedWBmPN2R9LrrqHBfbGuuDFwRG5wsY+8=;
        b=J6RI3OkxbB0OlsgILPA/9/0aVKcYwmWYfIo86NWR+KZvPDpFLgNsHEe1y5HQYGTQLO
         4GgtCH89o4IuxIJDUZaT5z7BpLPsSZtrRpPkL/1bGxQgURbqxHOTq4G2vfXx9WzEuONw
         FVQ5T3IkPAJzXFwHBRew6MIY/xHYUSzl59SQI4qxVJ6LHhC0GBJc3Bma6a1kLaevlNxW
         cG8rTPpY2vsdhBvMwHkHgupPHoyupGXV+Tl2c7MxG2Iyt5eM754iuFOkx2DGqT6oXzUF
         fxekzzY27i206KrzK0/qhzH17QlHizLUL9/Gq9fMrpPbxL/ZsOvFZZzJcTKINHoMq6tc
         nh2g==
X-Forwarded-Encrypted: i=1; AKwUvBxtAXPRGH2GmiSyuhP0+l8iAaKtlGQ9bjmgY0jlNojqA5IIelpwZ73T/3XEWjPM3YnrgYK+zG+d/Q8Y@vger.kernel.org
X-Gm-Message-State: AFuF++leV71hCbgqIpVWsorqJXwxlAVHrZQs2LjgJm5fOoYSXLJ9jn/r
	In7sZTBJBOyQgPeu0tZsP4Q/s3BQmiFSILGCu8IcvzRxs+eIamagsVBKXQyZQnwh
X-Gm-Gg: AYBFou2LPfQBPYqlQ8PlCSyhJRCmjVPTK+R7BJZ3rnVIlMYEsNs9JVfJKrh76hzcS2Z
	UhGuwItjyZ8qAaK5hAzhZP928GI/ob86Xc+iNzaXhWdfCDhEs9BApA2QEQCAyHUtCEeWBLujFGa
	H2r8JbDjOEQHtj9+n5F3u9qiCP8BLG7pLuLJVBDHeRskQyetu1YXlP33hUoRuSUGbwh3vZvu0k/
	sZ0EG45rQor6pmVGGnvVC0ksCLy6ym5GuNhZLXasEmQvbR/FUiThMlgEeNgHRPxIU5tDR+/0Kom
	YQOF34xRAj1Q9uwnoSEdBw0H3bXOJU8R66Aypis3sbLzWDD35iTWLp2Ndy3WDUKpCUNShnlwWDq
	LLrtsiD2e0Ly6iNS1/imLN5skCnyUS4iOWQ7t1AhSBB13N4Og7HtOYjAlJScstYfaFb7MCBglrh
	ubOnIWdYdXzrxSc2L1ntJ/EvldQr3s3EQRENZLIXPk1wBBVEu7erO10SkUNmLqFpmyz/EtuMigi
	zF9p0fhmNd9tz1yGzppz3F0Zg==
X-Received: by 2002:a05:6122:2b03:b0:5bd:8c84:59aa with SMTP id 71dfb90a1353d-5c7ed8093ffmr9719770e0c.8.1788858351692;
        Tue, 08 Sep 2026 02:05:51 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3b36cbsm9528645e0c.17.2026.09.08.02.05.51
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:05:51 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-786aca87296so3299546137.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 02:05:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy4pTx+7u4BLvtoQBK8hVJkiL4ilbbLWUMaeBb1EnR3GUN9mVKzjppvkmey3loOkUbTmAuvEBB0gx6Z@vger.kernel.org
X-Received: by 2002:a05:6102:54a8:b0:785:c960:ff85 with SMTP id
 ada2fe7eead31-78a4a8e5299mr11703243137.7.1788858350778; Tue, 08 Sep 2026
 02:05:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 11:05:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRtHVn_Xr8LgnUwYgQJ7nMYLPA0_psoe2Ovb6784YL5w@mail.gmail.com>
X-Gm-Features: AcwNN1VaOQFPsjNEjqZlOpJmCYxPCszYgVUjW-z18bFw1ijCstg7Yj1NvjUamz0
Message-ID: <CAMuHMdVRtHVn_Xr8LgnUwYgQJ7nMYLPA0_psoe2Ovb6784YL5w@mail.gmail.com>
Subject: Re: [PATCH 1/7] pinctrl: renesas: rzt2h: fix used_irqs indexing in
 clear path
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> struct rzt2h_pinctrl::used_irqs is supposed to be indexed based on the
> parent IRQ number. Do the translation using rzt2h_gpio_irq_map and
> clear it properly.
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
