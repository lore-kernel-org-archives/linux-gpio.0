Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AE3325485
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 02:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786416498; cv=pass; b=nRsY92Q7ZwZOjk7/8X9xX7vF9pZYGC/ji4oFBo4rJwXW7/NtV8qNe2OcQxo4loDW4BZZEwijRPI0cnHKIaWczpiluy/OhXIKt83sPjjhPAyHdSUzj8ab1JDvfNtJKqQe3ieRXxp5sOPjCM6az7tEyhq5aEmOWDuiM/7wLHcof9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786416498; c=relaxed/simple;
	bh=UkEjxwiQmZyjj2KDKIQVWRLgdN+ocH05tBa+lPVyBCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KiYRgfbkq29VcwBSsYfD1vG8pd+xxHIoDsu/QX8O7jo7Msf5Igp6p2PSBSUKR5Ftas2VZggdfopwRvEcFhzHRbDdll4KFXtWcFOna6UOyXwj8lCRWc332GHD2MkZ1dI5UneY2oIDWAVSiRT0zv27k9JA7wjiOuGXitK2ZL1siV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWjy/FCT; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWjy/FCT"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2794579a91.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 19:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786416494; cv=none;
        d=google.com; s=arc-20260327;
        b=bp7d7qLc+Ym4qu1F1jQsHEZoyZrNHSit3PPznSjtvkqP4cR0FfQrAE9NWS5CgKdp/h
         8opirDfzWEs9oXa5TISS2wlN0pMSSQHJLKXgUiO66cd+dG3nYeKi4HDVv54v4ZPpGSzm
         /U5seAhidh7/nAGmCtdjzqwjZAh4sEZAwDVk3CytJA4jKQMeOx9bErd7JR+ol5HhKpv8
         0+1iLaOpCCwYRSWjF5jrrwIL1o1EDMCXFISpu6e1SkzPTZgtNK5D4WiIhAU8iNUFz50k
         rPz7BrVYdmY17pXRqrDhVWeXKkpnqaNrbsEfxbF83Ybx4iUTiwyL62qKwyCMR9b8qy6f
         zIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fPd0jePCJEvRss0UdFXuGKLy+4PgCDrlaI7MbTAcvZk=;
        fh=4W4nuHMo9yvKAGDRE+EdR+swDhYBcBWiPc05KJUv710=;
        b=pMF2lVKziCHEQvat3eXreZXyWkom4NPf5nZUl/DjpYI7lSSiSVYo40dd9Fh83oOimV
         XTFXXfc+SRFiOBeMGAkkujZxjAORwXhSDc6m1qb0gp+OWNTK/sY8LhZ1e1zL4pTvJBl+
         Jt9p9yQEcTe++7Z1c643Fqz0bGR/MTor2iJPwVF/4Xk+bTdLCSmo1Cb9DaRK1cq5Fp/X
         WI/t3UyeVgVIEEFzcKljjaRHj0kjGN1H3qOlt671dfu6VD2QSrXDwmwi7J0T7sKq3+3o
         lcOp4v5KdXcz1eadeE83Ozm5N9cXGC5CzqT5j0S0Fq2wd3WetY3e8TGQZmDQ+QUcYsqw
         F5lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786416494; x=1787021294; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPd0jePCJEvRss0UdFXuGKLy+4PgCDrlaI7MbTAcvZk=;
        b=mWjy/FCT6Gb+QSVYgE0/u0t3tW/JlHvg0jgNVi7aSo2Ya2BCQshcglI7kIPHaD3uc0
         P448hTTfA9HgAZduXnrIr6u0N4r9/jPvO6DhsF4V7rWgzD/Y3zUBWa1V64qU9Z9Pv7mV
         gINX204KeSFaTPtdpEudJv09kD2waV1j3EoJYXyEdQfRWOMDJstvoVdZsRyqkFv+uSxv
         ricVAj4eLrn7kVqL+WjSb4y2fGlBaOMaB2VFw4ydc6Df4HjdbFBxswkRk/sEZjvA/mm4
         gBfLYnlPHRoo7uHGKwryM6tQEiaDXrEA6rwoYPuKVFcMOPvjY3NWPS8enfP0FOWVzMfy
         4tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786416494; x=1787021294;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fPd0jePCJEvRss0UdFXuGKLy+4PgCDrlaI7MbTAcvZk=;
        b=LgL7CdAVLa0OHEn94wFWUFuG+ZS8brlRazqGC28GxZS0IHkSMpqaGd5NLir9E9gbEC
         sEGf474JNd2BBo9wP2zF8FtYdnTlpdMCm/delpHqAu/CTKWPWLDJv1zavBjGujDVLLCj
         yZpuv5NlLZ+cXM6SB8ZlRPBWknpxIrh6V+1NYq9HfZMU4KCaDBKH+grGM4KLzWKxkztX
         zzIB4Se0rJfDp9dibY9Pcm6Qr6jYFT3l5wIYLQI2+DqE7JsdR7nO/IraLYUsyTg/nZlh
         kAgGba5chmZbROisK6dKhdFgSPdx02VwTwGd2xO7HwZ+xvPoPeX9INneD5c6T+DZ4n5T
         PeCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rps98+iLehjXOKDgkn4gKrL+KFuFoDXiPn5i/8hyOcdlhdN/+lBITFtzeUW8fPsxcmqNzOfuTIPd0fk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy15e83Ie8f1WG52d+bXt07z9mSO/ooDgk5EFgb0wzaS7lCJqp3
	JT9zvRSN6izvk42SJru16O4Dos/8oM6frIcA3HgQtCNTbhUhOnAqVuiz7+fEYbdK5pg+X15Mo5J
	mpcMtludDXzP/nncmgOFaNrqfFZ5mmfg=
X-Gm-Gg: AR+sD11HZQ72dbXVAT4Idyk6pW+QKSzGUGobjcZQQCAlBBgbw1Oyt+sf7zO7fecKSXj
	n64IpwYqGOls5mhiokuR1Vz0drRB7436i/mTs4oVIsihLuu97LMNKxF47KmFHmtMrhABim4c9mC
	CfGT0J+sNVE9LWs0rJ7AP1Oz8AcH1QsrhGJvSeFxG5uHHr7q9aSkpp83cUys1Snx8V2QlYcbikH
	NGobTuWYpSEhf0DzMd5lI6o+qy9heUZ6fGurpVYlo0iuiV/g3ocle4BMZceLXLYXiB2KJ7ECGsa
	Nv+j6WSJnG6e8A45+d1DN0jU/Ov8B666q5Dr/p/FuNCrlXI4gxsUho7qrX3mFfsY4Yh8Cen7p40
	UgnzO9HjkqwHJaMVzxYZZxoQRxo6oD0rLXmzkukS5jFKA9IcqitUsxi7N
X-Received: by 2002:a17:90b:268d:b0:390:b41a:b92f with SMTP id
 98e67ed59e1d1-392ec6858abmr33121a91.18.1786416494009; Mon, 10 Aug 2026
 19:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810053142.27938-1-phucduc.bui@gmail.com> <20260810053142.27938-2-phucduc.bui@gmail.com>
 <CAHp75Vcb12Ok=yEF_WqKp=yS_EW9SWS=G2+B7Fa7aLH=u-aR0w@mail.gmail.com>
In-Reply-To: <CAHp75Vcb12Ok=yEF_WqKp=yS_EW9SWS=G2+B7Fa7aLH=u-aR0w@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 11 Aug 2026 09:48:01 +0700
X-Gm-Features: AUfX_mzDDYkK2NK5jlqz0_lCJ5Fzf8I6GBhgUkKlRjmlPfvBFmCA__eO_V6VlZk
Message-ID: <CAABR9nETzzsjzE0JnnLC5tX7d=0yZW9bt+t8DuVxV=JSb1VsYw@mail.gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: keembay: Propagate errors from optional IRQ lookup
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, robh@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,
Thank you for your review .

>
> While this looks okay, have you considered actually having the
> platform_get_irq_optional() to be optional in this sense?
>

As I understand it, if we decide to use platform_get_irq_optional(),
then -ENXIO should be handled as the expected case where the IRQ is
not available.
If we do not want to handle -ENXIO as an optional IRQ,
then I think we should use platform_get_irq() instead,
which matches its intended semantics:

https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/base/platform.c#L301

-------------------------------
ret = platform_get_irq_optional(dev, num);
if (ret < 0)
        return dev_err_probe(&dev->dev, ret,
                                            "IRQ index %u not found\n", num);
-------------------------------

In my opinion, we should not use an optional API if the IRQ is not
actually intended to be optional.

Best regards,
Phuc
