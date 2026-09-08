Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D1F35E1C3
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861708; cv=none; b=ln0pnXzsiODp+9pkz3Ws8+eyjuxaU4uySQVnfN6heW1bcbf5k/DBrQNiz9ALl7F+jLraxnmDuxPMoLYh8EueP5tigNhuX3TNtYQPM1hgZsRymx2eZdWsWri4qlVd8DhLATxfOFs3Zi+ab5F0T4d3E5rPtHUXav9BcsjxySRAuv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861708; c=relaxed/simple;
	bh=7Fyxy571KMxMz2l9KXmc8erKfEp7VslXJ6d5gZZbnPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WeL1xH4r4JmKP9KEVcTz/wbKISgUzxTUUDOacKZOdjK8BeL4/m1pY9kyikW59FvfAAes8s4ZHMOJIaTQ3NvpibIHt7pfRnYppbV2s0PnNJWkH2JzsGqO/GRPwSI2KoW6LgSX+idcU43oSzhooN/bliZjQ2uTpXG0waFCmB71Kxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-782e0fc1e55so1197120137.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 03:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861706; x=1789466506;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2tI/7x8c4NyE/PwWWec1lASAENg1AULIuOMZ9zg64C8=;
        b=T5w7WRgQF8/yiCzM48btNQJ7ar/NBzOlqCMpCHv2ov/+107e2UgQx2Bd2rn3W+Oslf
         9CLluyBX97JlL2mYIiSlj6co9iiGlgGSGgmtPSFEGWJ16ljcSV8MizR/pyFcJSYiYh9B
         DD+/rVvW81Ij4EfGBCubZiP8wJXEuc6UaIHaDW+E1MlnfqbHRAPCZF99VFadbyrhuOIc
         IF5EsMSjN+Uaz7zT0YrHogRj1i6CidMZl+AnirA0isvw26HxXihl/vKlGMLo97yNGnU5
         XpwumQGtyIBBKQOXaABIHdzs3ksyKdoCGqiYf0ECXQJsAsBlnDCyyWuuiIpcU4d9MN5s
         +DDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrtrxchRucl4fpQKgo8ER6H1wyKsAT82rDigqN5alg3vWHIo5PnMAlv2eleX+DYcJfkCJ8G6M1tXCP@vger.kernel.org
X-Gm-Message-State: AFuF++lLzesSxKTscuzh9fkXXUqTNDJJftuxM6VuQsKHjxtnB0/wuOib
	pPOWkuVgpF9EpNZNhJEyqLvaOXnq0VDPVL3Iw09uxYPUEeEYH1dw6haztdzr12IH
X-Gm-Gg: AYBFou1WHYSrP3sICgtYvT7f2dfM0OADyriGpFfHPsNi6DKoldDJL3KGaxeCJPq2kyV
	Shsj/aIPNAkDD8kqX1X1NsUshWo1sb99LMaoZnm8ReECyJGyJTM3ZIt63CH1ypgPtr8f6I1pD5j
	b8XzP3VU/gbnuWsNQvErd7+WOBB5oPQKAXXXR53QAIaj7d6JpkUixP+Scy4sFHYmYMm+nX65wS/
	AF1wnU+CIbQyPRJSCnY3EVtC0cq2Gt3ckzjcH+qA6fZ+VZ0gYq0/nT76cSnolXEzQdOaG3XX+CT
	ujNpZvRicSu20iaJ1mG7FfuLjPSzMP/nyudzuWkcpwh3eRt/MgCo8cWExNmwJGb3FYvRV+EMa0L
	fZ8YpfdrfO11CH6P/qiFdpOP9Xu1Kerx0ImJ0+ZayFQ7KAF6y+G/Umvq+FQFkU/kPF2lmy3cZ9R
	4HiSSWn19Oi4PdXCU67ThqX0SW2a+Jrq9icLkuWHnKWM56tomnUDnqb5G8m35fCFBHJjXJuISJQ
	KXMLgTAtZxHXu0Haev5LxlvUQ==
X-Received: by 2002:a05:6102:e0d:b0:785:d308:cc0a with SMTP id ada2fe7eead31-78a4a91077bmr9480095137.9.1788861705774;
        Tue, 08 Sep 2026 03:01:45 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-980d774ad5dsm2178234241.9.2026.09.08.03.01.45
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 03:01:45 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97cad2f51edso1179545241.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 03:01:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxq3l2oCiWk54hD4v1vDvJqBrjoo/ZCG32XJ+6Bd0W5cUiYlMXd8d7NqLNy62Vax76zqDUg7DwRp82t@vger.kernel.org
X-Received: by 2002:a05:6102:6b01:b0:785:3211:f5e4 with SMTP id
 ada2fe7eead31-78a4a6c8a04mr9752098137.4.1788861704764; Tue, 08 Sep 2026
 03:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-7-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-7-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 12:01:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWgPac64DF_MpVFioGJ2ef3irMB+_khaT32MgQS+UuCgQ@mail.gmail.com>
X-Gm-Features: AcwNN1XXZ_HyHzFSTOBPBh4qzYYojXkTSzZF4gN87445u1hVP8hGIVXwwu4oGIw
Message-ID: <CAMuHMdWgPac64DF_MpVFioGJ2ef3irMB+_khaT32MgQS+UuCgQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] pinctrl: renesas: rzt2h: remove unused struct rzt2h_pinctrl::gpio_range
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The struct rzt2h_pinctrl::gpio_range field is unused and seems to be a
> vestige of calling pinctrl_add_gpio_range(). Remove it.
>
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
