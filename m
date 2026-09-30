Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F0D44F54E
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 07:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751992; cv=none; b=AvPKjWeTigOB+2YLT9Ku5XAPqqYqA7fMMACtDbHrK7MU4E22buVLUjQYcWM/DL9ozZb20Ts+rdIYAHFJLV3QnpBNsT+tNrX4KUsahQi0lCV6CHjXsUJkiDvmcXqBSZLX8MF7pGc87wgjIPwCRxzITBZdr0jO4hFZXRsCnTVaFF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751992; c=relaxed/simple;
	bh=wch8nfNOZ3yz6W478LNk2PKlIPZ2op/sL1/5uWaDjYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LnWn5zA8oYgEMweVi42shkRRNQjY7dGNsZAefgAvr6V5iVnaa2fwrdHKE2hieOfo0IQvQl0l8teZuIXHQrzRYLQJeRE/bUieZf5DxHj+9am+Tlbws8wYB8NxzNwba75gk+3lJ7zR967OXTCUIMDC21CPp2YjL8ONgbONa3fJ7/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5d330f80f3bso515355e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 00:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751987; x=1791356787;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XVZnJOotlaaUATBE8LN5Zb2VdzLY7iJmIqLqFopSb08=;
        b=DrGcK6ag+DStcN1hPhes6M0OapkFbdD7+xkzDEHUGZt4VblqTo9BRbbcY4z3klx2LH
         ZXxpOL2gM0JG48BwtY/0IbWZ2RpLofK9OqtU/FX48bTWaXu9g0O87BkFOzaNVJwUH3hC
         uIW7ZnXTn/7jQdtZPrRtAcfpsafDXr4FeeGj80BMf/D7uy5hVmXMf8ivpWYU0XHkgebv
         qvkTk7g5sXrfttmbKyfp4VQg9vn/ZGUQutOVhneS4kYppba2BXVTQ/NYNLFw0E/wwnMX
         sqP0jfmzKEuYoSeTxlXfVT7jP4P8D9MIRhoEldw2u1Ver8jpe40/z02JE+MAE/1BKSrh
         pt9A==
X-Forwarded-Encrypted: i=1; AKwUvByaD7TsL5Sg2mqujDUTUXQDO0uDTq7YPznYQsyDLcX8kApOZepvyHbOaBkbhg5bcsXk7m8A6m4iBhCS@vger.kernel.org
X-Gm-Message-State: AFq9FYJAKS5k4P5IT/c7QLP0FKltIyJ4zXCsSiWnghd6sF9yG/ngiKDz
	YtweNmwPj4sxrAU5bdMFedo/hKk5nVrjZ+V3Ovy7upPFhpZEPPkVKNcqOO23dQVy
X-Gm-Gg: AYBFou1PVxeUsXpjjJfCqAnp7FuRM3w9DFdHSFnPq9wgZW08R4veGhk5SBd9Urn304/
	mu4WU87urn+zazqsCvj3JugTV2pglZSXgeDdF6BzTo37k9jRShqqJ+knWVnmRihKG2Be3aFubTt
	IT/LwLGVyHFXApLi8VyMtfOWGSCfPgf6xh8QLSquoFMeV7nOLl7VtRpq0/wMuLPG4KIKBt1oPJW
	J9ljRXXwcQpXDY8BIW4BHLKaDjGuOwkc8IrqKPbPq2kwkwc4hLGh7R5ut24wlLqNla88n1doO3l
	w7Hkfuve9DaMVCm2ahUuizmXRffyWDEEPohBhHviVYmoyCudQWUSRHIbQAcK7R5KpLyTnNGdGUL
	JOfScrXv+TcWdSI8rHfKlzxmvtR+HtRosYv3oJTA7hjxnWuY9HnkiajpxPvR5ojZ0lm0Td1NG+i
	PJwAgz+K09gm3Ks7aY9+m+7kVa5iIqXixqb/01nR2OBsVLkzpInZdmioIBHm6JOvGpSmMt4oeRA
	T7RWg/etcww9VRsG2CLgZL5/GcQm9ib+g40
X-Received: by 2002:a05:6122:46a8:b0:5c8:4831:1539 with SMTP id 71dfb90a1353d-5d67abadbfcmr59658e0c.5.1790751986711;
        Wed, 30 Sep 2026 00:06:26 -0700 (PDT)
Received: from mail-vs2-f30.google.com (mail-vs2-f30.google.com. [74.125.227.30])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d611ef8956sm830825e0c.4.2026.09.30.00.06.24
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 00:06:25 -0700 (PDT)
Received: by mail-vs2-f30.google.com with SMTP id ada2fe7eead31-7b45e9d5aecso786180137.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 00:06:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwHPbRWNj5YwYRfE2CkGwy/92kT+IhlIi1vvtnZ37ELoCwH7Du6947lQdRd2Z/2BFVUZr1lM3ZXZtf2@vger.kernel.org
X-Received: by 2002:a05:6102:3e8d:b0:7a7:3485:33ea with SMTP id
 ada2fe7eead31-7be72ca2a93mr42702137.19.1790751984641; Wed, 30 Sep 2026
 00:06:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com> <20260929-rsk7203-properties-v3-4-02f84aeb8e47@gmail.com>
In-Reply-To: <20260929-rsk7203-properties-v3-4-02f84aeb8e47@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Sep 2026 09:06:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwVWhPhn=vH-FbDX41Hnshg7V6S+pg8kreOHpTgRWeHA@mail.gmail.com>
X-Gm-Features: AclHuK9VR6aoLpU0Amx9qCakt-f_1gjDC5BvwgyzYKux3uxlHlNiLggGev2T8tA
Message-ID: <CAMuHMdXwVWhPhn=vH-FbDX41Hnshg7V6S+pg8kreOHpTgRWeHA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] pinctrl: renesas: gpio: support software nodes for
 function GPIOs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Sept 2026 at 06:58, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> This patch extends the sh-pfc GPIO driver to support software-node-based
> configuration for the secondary 'function' GPIO chip.
>
> While the primary GPIO chip typically uses the firmware node attached to
> the parent platform device, the secondary chip should target a specific
> child node to avoid ambiguity when defining GPIO hogs or properties.
>
> Update gpio_function_setup() to look for a child node named 'functions',
> but only when the parent is a software node. This ensures the behavior
> is restricted to legacy platforms being migrated to software nodes.
>
> Assisted-by: LLM
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/pinctrl/renesas/gpio.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
> index 4e59dadb7364..b49a3e14da91 100644
> --- a/drivers/pinctrl/renesas/gpio.c
> +++ b/drivers/pinctrl/renesas/gpio.c
> @@ -271,18 +271,40 @@ static int gpio_function_request(struct gpio_chip *gc, unsigned offset)
>         return ret;
>  }
>
> +static void sh_pfc_fwnode_put(void *data)
> +{
> +       fwnode_handle_put(data);
> +}
> +
>  static int gpio_function_setup(struct sh_pfc_chip *chip)
>  {

As these function are only used on SH:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
