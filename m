Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC11C44E64A
	for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2026 09:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774637; cv=none; b=S/kE6dyYobOXsz6ZczO9a9VO6cPAcYCTM1KjvXzgqVnEQQNRVQJP0aVCkAO5bAqdCw6AyoS7tqF4v+1oKA3RNQvjTZ1gw8HYkh8SchVleKKhKnKov98l+SrjxnR2VxMwkCiDldmUn9Z8+5T0kmrS44oEvAtIh2nIY3gsksSc/1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774637; c=relaxed/simple;
	bh=EJi4g5va8T1f1BIn66h2FvU8Mw088XXg+dMLppSZj+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eCf2lQfvdaI/Fo/tMFnfOHrpyc0NYoyuEptzbS28pev/gtXcGACP+otbph0zH2gP5FIRxzW/WjVszstGUCemaoiy+Ff5GWCO2AnrM0cp7XV3JTvQmFa2Eeb8ORJak7ENhgjbL+Zl7ARH/RtjMBEA2inzQntWCXj+Q91Izv7t9Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97e9adae64cso414264241.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 02:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774632; x=1789379432;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jpyiT01uqi3z67FMkXpZRYNDQ41NByhvT2i+cHhX0n0=;
        b=Md3Etp92wx+4iL/o5+PxvMDWnpe8221HaCzLA2mvk3YQ7QXetuK3Zxfe4JV/Ep67Ca
         si4HiHRcCa1l5+1oGHZYHQUR+6GvojFTg17JvEf2Kf5FEZzA3k/moJB3ULv8seXyyN3x
         ZqRSFWXH5HDomVdEYV4zMURZSyt+OIT0Glo+mCwC2t7C8J667k0tDWJ8PZN4hvmgiiDH
         8SD0QjTX4i6RMA/fQEUajBhunOFoWT7y7GWjn5R5OYhBGnvC2aH8a8RjG62nUpp4PCbG
         E1j/L+BAmEvDvYUriu9XD3pj+tl9Lv/30ZEVb7nYfXWUVuKRya1OZQ02FQ0LDa3dot2H
         HrYA==
X-Forwarded-Encrypted: i=1; AKwUvBx6mm+ddSF6EXeko1KrziAVDFdc/dBPlfdxAcFBluHn+HnLNITptY5cJaa7bJD2WJUwASudzdE4Zfb1@vger.kernel.org
X-Gm-Message-State: AFuF++lIfz2dwDFEmL60eevfetwEAAhPkkTM2QIH8Rrj4DgskuXK15C8
	VhD2cSBCIEBSqHHsNqkhjgfGSmjsLINQKhMxBbMte+lTzXVQankPHJBAvIeegR6W
X-Gm-Gg: AYBFou0TAZXFhizjHy37vHWAozteKc6xmNf3zWb7rF3iisdt7G1Y382Sp40Kr40A3B3
	0KIPd8xRs7oQVsurj4ZSkZRkQpF4K7aBwaLQVNeAlvZ25FSbN+N0nsxYj8wKTl16Fb/3ZedTp+A
	C9mcFaDmeEPpD86mUC4LOYcuZ6yIC/fdWtjGOW2GFXBdOrpN28Y0qGKj0MqutCwaL1gjTAtvAh7
	cP+q06RBW2OQHonCsMb1pnEFxM2Ld7DnH4mfBAjBUl73gTTL9XouxAKzOZJa3NDWXmDu/BT49WU
	TTuUwp5Y/9+3+qNWUKiAYsC1YgyYEn3jnyeHsj6qvTLz/jBqY1KqIWKmZK5ifsRBVbu3admhA0W
	Fqfu9PaoMDJP8LbrnHIaaQjDZg180FUFdoDIGDE++SWvTmRqCP8Ri9SImTRb4XQL8XUuw1aH8Ul
	DdnD37do+S7M7trVyeR96M6GX2inNNtyA5vVr3XcZmocMmB1vLgtfptcbzZsF2zep4EMiCb4OXH
	VVT34jKuETlIyWrHNRhS31Xag==
X-Received: by 2002:a05:6102:5346:b0:777:ab3c:b88c with SMTP id ada2fe7eead31-78a4aa9948fmr6718567137.8.1788774631820;
        Mon, 07 Sep 2026 02:50:31 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808eec7c37sm6931499241.13.2026.09.07.02.50.31
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:50:31 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7855bfd6ab6so871689137.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 02:50:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQ9NAHQTqX2LcScIuhPIYx8/uSRZxgjYKZeydLv922eTkcIAve8kxzUSEuhtVWGStE3XLfDu+cFbJf@vger.kernel.org
X-Received: by 2002:a05:6102:2ac4:b0:778:30ee:f44b with SMTP id
 ada2fe7eead31-78a4ab31a99mr6505412137.13.1788774630709; Mon, 07 Sep 2026
 02:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907090956.2825703-1-arnd@kernel.org> <20260907090956.2825703-3-arnd@kernel.org>
In-Reply-To: <20260907090956.2825703-3-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 11:50:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULSA1XeuyNR2oM0m3bGt6HzKMZkYYKEchy49nztpgNww@mail.gmail.com>
X-Gm-Features: AcwNN1VEYucUOC047DGmcAJRGb8pjtBq2r0j3GGqGyncqZYd9LFOaI3FEXXAmV4
Message-ID: <CAMuHMdULSA1XeuyNR2oM0m3bGt6HzKMZkYYKEchy49nztpgNww@mail.gmail.com>
Subject: Re: [PATCH 2/2 v7] gpiolib: remove linux/gpio.h
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Gibson <warthog618@gmail.com>, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sept 2026 at 11:10, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> After all other drivers have converted to linux/gpio/consumer.h
> or linux/gpio/legacy.h, remove the final leftover bits here.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
