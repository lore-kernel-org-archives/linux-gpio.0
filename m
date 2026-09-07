Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6310B3EB102
	for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2026 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773995; cv=none; b=kpVLj9isLI4G/F6sbzvy3qxyIb5ejw0TbXyri5ywjiyjJpdHnx68Z6vZDyq9KSXUMF8RJVvDZGW+S63X6CG4NOgFK9ZdotRKqgszzqtPX/aVxMBxxbQXrGShTFdH1ZjDMLrJcK2coe80DWneWapO1DYY5kvkUB1H7dcQ3qHEf3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773995; c=relaxed/simple;
	bh=WlL+j/Ie6m0Twd+B1P3rICow2WcfWKryEoGQ+1VVbBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0YVEISKE9I4OO47oKiH/UZId0AznnhzoOe6T3tCWVry5s3ZLfUCFDZU/805mtGL9NSgYQvcTAvkiNo/H7o5kieAsh8Dm2hT9L9V9SOKLMILNwkUVPcJ4YxHaA7tN084UIkVLrf6X7YOAXISDEMtzTfgjqmt6tXrr4z9tUwzpSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-977258a75d9so2474493241.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 02:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773992; x=1789378792;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=idsP1neYZsT92lOTYUcwf/RINlIKDTK8HxAaGpjV2+8=;
        b=nxHhnVV+VleVm+8SNjjGan8ysQ/aaSIxhITARmDWvXKZvHc06cD5juLO442TOowzRw
         W1ewSu/cGBRH/hqtgAwKeUzJFBr/XvP7kmjQfuMMvOmJX/5CUkwYuYWU540yGfgd34E9
         lelVdq/kKgHLlxDTwqPudZr+UyunKXjJWAG9BoxduoWtMLpYZkKuFfs0ZB5639XjYAAZ
         k+ERUV7Oeme2FYaWglfAq5yY1f6I0eMo4shXkX7T3Th5ALaOnuKlQHmaYH6amQq06coX
         TWK07EQxTA4nD0Y/FddAaFIA9THltanOhoy3vvSYbiOYdmygWy+FxEjXbqLRYxZcAuX9
         EMpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKh5lN5RyXLieBJUb///XsKm6/Wfx9CkkF2c5XSnJjtAwIEIsAyAj+1LCr57lcaTwEPxMMJFAEXn7k@vger.kernel.org
X-Gm-Message-State: AFuF++m+UyKRFJi+zXsxQWBvZz/PmCLTgPnYQ+CwkpPpvVFpYqIxrk5D
	CADY484RuTkknPjGFrtfbWT/Ryn9xbbrdbPKuR88uzPfeUvAMnlj3jRMtYX2isNc
X-Gm-Gg: AYBFou0pD4kxjJbJs3ftMNU8qD01HQx61Sx4oD40RPclx4F/bRSYJxDcXLiFf0UwQln
	mwxe3GFCLPwtDUt2IBve9x7rQK4kdJRiKCImTUx4ewbTE/PsWRX4qY/wZWL/fDi3TTsAsQZd1Gm
	Atj8548Del/8CRG4gEpwiKjSKNvd+QehoiLpOEd4mpomoQm8eBkCcfKv+KEgEiNL+NOQTuEGyx4
	Z8zraWV090bK5Nj4T6/sx7yNpOT+4J342jABk8UMHmVYYcsrX9gW16VLLBOhqHFjahcXLI8Eu1I
	IiFnSNPP3RHf+zkPOkZZbMMwVsNe0jbxLJLWKfTntG36KQj6/Qgyz5il2DlzScyHYAsAN/ewqky
	dRkrboVqfHLnBVRxCtsl+cDuLbjD0jL3Sb6w9TMQ/Xe/CNpcbvlC0c3JuyLJMhJtqQ9biyWmu1k
	PiX2w6JhJbApQrVo/H7z0soRanj3o+wHMXuArLDxlsDNkoesPC1BfmgexBbt1WnxsE7z7/c4ZAS
	okzPf7Me9Pe4FGBrFHKAB3vkmsgP7xzyx4zYgB+
X-Received: by 2002:a05:6102:91a:b0:784:ed9:1a1c with SMTP id ada2fe7eead31-78a4ab66791mr9474683137.12.1788773992333;
        Mon, 07 Sep 2026 02:39:52 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76aaasm6526263137.3.2026.09.07.02.39.52
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:39:52 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c7d65c83feso3200489e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 02:39:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzgH5/z+i77VQko+LEbe87aw5Q5V+S0Jjv7Qt7KcLEeJ5UjNb3ntZOc7ExPhYkm77w5GKtuoaDgzOZD@vger.kernel.org
X-Received: by 2002:a05:6122:c8f:b0:5c6:4bab:4cb2 with SMTP id
 71dfb90a1353d-5c7ed80403dmr10646528e0c.6.1788773992044; Mon, 07 Sep 2026
 02:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907090956.2825703-1-arnd@kernel.org> <20260907090956.2825703-2-arnd@kernel.org>
In-Reply-To: <20260907090956.2825703-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 11:39:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVc=ntgrDDqdNUzEbeQ=qjh7Pw=B3TSN+qOD5bRY4_i+g@mail.gmail.com>
X-Gm-Features: AcwNN1Wp7dWP-FBPz6xYVraXlAq6_uFTgT8pt9uLR2DvecmC1uG2AIElIe46m7g
Message-ID: <CAMuHMdVc=ntgrDDqdNUzEbeQ=qjh7Pw=B3TSN+qOD5bRY4_i+g@mail.gmail.com>
Subject: Re: [PATCH 1/2 v7] gpiolib: turn off legacy interface by default
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Gibson <warthog618@gmail.com>, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sept 2026 at 11:10, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> All users of the legacy interface now select CONFIG_GPIOLIB_LEGACY,
> so it can be turned off by default and only get built on platforms
> that still have one unconverted driver.
>
> Allow turning it on manually for compile testing, in order to keep
> the build coverage of the legacy drivers in allmodconfig and
> randconfig.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
