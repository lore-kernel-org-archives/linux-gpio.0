Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i9/t2S6i"
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22062D4E
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 01:58:11 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5cce5075bd6so13378817b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 01:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700819890; x=1701424690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0r2ovNNQUwpmQosy3XQrJzCSVmmCu/fIH4I8jzx2+0=;
        b=i9/t2S6iEh35bC8YQH0hgGJv+9qpTo0syhdxpLBtU6suiW5mugBso0Wztrt6NJctZI
         qN3TIau9emPeq8q7S+Cm89lbaAKvT2VsGitV7EC0mgPVpXxfI6cj0Em4/fQCCC1pasfP
         MVfJzNy2h48/jf33MCFaBbmtq82Dr/mPYwCZwzZiZ9bbIIRceX9+IbqRZf9TB1FRmM06
         M+ozdIzSRaq1wONKXJ0YcaqGKLUv2WcH6nl1oLACA5aUYI+LUOBMC0K1e3FL6jdXdwWr
         hss8l/vCKIn3/n7SYmWzJvTtqpSH3QNvG/MJJRKMbH5UwwRYAM22+9KHX+sqispLW7Gw
         u27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700819890; x=1701424690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0r2ovNNQUwpmQosy3XQrJzCSVmmCu/fIH4I8jzx2+0=;
        b=aPCohYRea8Sppr4wyiIfGhhzzjblQG9vgiz/9IZ3lGNeXPVF4D3v9BxjmuMcAwlVpI
         powNykM2hintOc1PT2WFV7Oax1eBJE0hdGVs6/6Q57ALSRSYp8qbi1k2Q4CKprx1IfNI
         ez2FF5D5bmrgKikTG6uWfenOJObFmm95XeRED7bVtjC69wT3eNdtsReZNxQB3+YLSXZa
         Fg6XdyV4tQSwS6g/69Tn2m70sqf0kyJujZL66ldQfioADO6UpEB0wN1IiG//w4bhQH9x
         KTxTJyLjWKkGPcRINd1Csepu557/AM3tB2GK3igNKNEAyA6Lq0IDu48T3TtCWhI7qH1O
         DRSA==
X-Gm-Message-State: AOJu0Yz5iO3xv7E9Ru27uO8DDK70zQRenmWMiU/nsPR+P5dr5WRT46Vr
	F8pGaL8PXUfSKunRwRuq1twUlL2Jfn7hy7yHtvWaN/5s4V8KJA+m
X-Google-Smtp-Source: AGHT+IH3bPUgrfuFQLes8tecktD2wXSd8PJOzNH0dAaOMXtiZNeJPc+iVFWvKlDdSg+qekI3fv5dBHwrzlEH3fIx8NM=
X-Received: by 2002:a0d:d904:0:b0:5cc:5421:e4e6 with SMTP id
 b4-20020a0dd904000000b005cc5421e4e6mr4391983ywe.16.1700819890357; Fri, 24 Nov
 2023 01:58:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231116223045.274211-1-afd@ti.com>
In-Reply-To: <20231116223045.274211-1-afd@ti.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 10:57:59 +0100
Message-ID: <CACRpkdaf9krpNkd-ZeGtaLS+UzM9Z7zSFtqFYdQk=TGLuUeB-Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: as3722: Use devm_gpiochip_add_data() to simplify
 remove path
To: Andrew Davis <afd@ti.com>
Cc: Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 11:30=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:

> Use devm version of gpiochip add function to handle removal for us.
>
> Signed-off-by: Andrew Davis <afd@ti.com>

Patch applied!

Yours,
Linus Walleij
