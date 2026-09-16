Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30673DEAEC
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 18:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789582688; cv=pass; b=mBM9X4lXI9ROCf+SshLAq80xGgKbA4A9MGbMg9SIv1lAC7ZIAt0ipKf/FndJeVmg7JAfGSiXt/MYu7Ry+yQQU0OyFq59m0/dg2KZuDTCEjRSlBOKqtIbmGdRvmASoalRdLYjl7Fa8AQFeUDE8LY9D1yH/b2vaPYP/7JHdbg+un8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789582688; c=relaxed/simple;
	bh=Cru63pCpKSNAK6GcDnmrPULFBGS/XE5+CwZYiPLRCD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYKDJT/eCf85JEZic2/u5ZKwk+s/746XJkJTxkxwZ5B9RWUybY9brJ+vkmRq/n1HZCQR7BQ33KOe8yBmXA9KrtqoG0hNzmfQgvN8PuOljxXRVFY1ybEIlIWofGJrGDS4mEaA0fmaykCGK91L+R6tlUmBaL3st+NUQxOQd3RMEv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXcumD2j; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXcumD2j"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55eff0so5456366b.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 11:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789582673; cv=none;
        d=google.com; s=arc-20260327;
        b=Iiy/3burVxEEK59ND7J9dVDyRnfAU7zKvNUaA+ZNVEjDSepD0YVaqDptXz8jSeMwFD
         BWlmf4xN5WBldz1S/qAJ2pmfdCdbPKAxTFjpsy7XIpN/i9HmFeUtPQMZlOfnedV5y963
         cgqtUPCDlVnwPpXPZiQaBudHgVluqrrWgeVlS7JFJ/UdfLEFer2E0fj+8HigsFKMFJaD
         pAp7eGfqg1iiXk5/ie5Vkz0bUMYAggWK1WU2w4YbNJlrfrKZe+ps15N8FAy4hSYchEWI
         qf61dUmxwRKo9au4x7k1PvVmTUQzkVphT/ApGeNMRCeR1Bp3ZhHA0Zfwat7Vk6taecfb
         aubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cru63pCpKSNAK6GcDnmrPULFBGS/XE5+CwZYiPLRCD4=;
        fh=GhFBK1QHscPorqKcv7qc/2De2HLu4y4MN6w8EmDacAY=;
        b=l9q4UQz8A/8jhmFumE4ER+VlzTMa14SEYP284BqcpPgIqX7f5y0oCAie/khNoloF0q
         LkXt6dIWonxMr5yJ7oDlU9oxG9xP1L22ulds923CmT6hKDuKZcPKFJOKi5s0+o5UHJbL
         y9AW6LznTxYekaV514ytBcl+XjI8CkZP9EPwM/XwPkcmMTXPAXrSjT5zkj969YPIb8J+
         Lnqx++wluVYqDOJweJiWSZXM7IhhznebeomR6F1e2o6eihym6TDCjFwzKNVxL/tB0v4M
         aqJL15BuRZRXVeMs5CMlCIFrmmfaZiFauKAJpuZKTVuISSn+Pdkw5BgmGkzmNoS/nXBt
         Ih9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789582673; x=1790187473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cru63pCpKSNAK6GcDnmrPULFBGS/XE5+CwZYiPLRCD4=;
        b=CXcumD2jlVFHfZ89Zeg+Xn3s5LF/hPeXp09HUu/akJWzuiucL+4im1wGg4kY4QRUxC
         HjQplmd96cC5kn6D7gwQrijreAYPofGW4TiTtA2lghtgg2e2WCaDar3tv93SMRPVBlIC
         HXPxjH66ca9jHPEwP7Gp6vYVjHgklmeSWBJGPJfY9FmmXGMRTP5r1BKcOEWS5lT3EnOV
         ntrG9JFK7cshIYwQq+KM1Zsw92v0S2tOx/+Hj3KmU7p0GQMxS+VaHy4ul/MLCgWdzNcf
         mggrPYYZYcOVmE4vdux3QCOXs7aeOVnT4LP7dbEX9p4sH5TcxYbmi9JGAZa/t3rUMM1/
         hSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789582673; x=1790187473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cru63pCpKSNAK6GcDnmrPULFBGS/XE5+CwZYiPLRCD4=;
        b=Fq11AlAxMgAbKVh1CLvkCMwNJz8vUlq2nlGBU5S1pqmVI/eVhkwtNZwtkSJrUyL/Kx
         rZjDV2zU4nHlqI0c2/pcbMNXOYtwa1SDyIU51DdTaV6DYlG1KKuYFCdyDAjKXzeCIg/L
         z+Ezv8E12d2IhGb2qH4iw07yGlbBXvrsaaqCq2nacJOMUop7uj+2HvVQgnO8hqS4Ltu3
         +4dc4KZf+JCJumlDXahjv5PLD4PWuFTExbnv5TPfRSGGRAbORswo1e/fHsW7eqwm9OQ+
         W0iLWFyuyQSsi4Qj/i/uOUjaF0VdS1FGQ+OUItUuAovoJJOJfh8wri9YLE0UN8umFVJt
         x+Nw==
X-Gm-Message-State: AFuF++n2NST/ZUJH3ZoFU24sdHP+XTInxKSPlKEN9SFpEFy5DvK2rul0
	0ea+CeYHiQQN0mgf2IqTtLN+Btdm0+p2yEY9Hoeq6Gf1C/Jgew/3gBW4XOqsUEkE73QhK+5ygft
	FM3p2XHU+aEER14vn8Kl66xlmJMny9k6MlA==
X-Gm-Gg: AYBFou3Zkd7CMuc/Ybdp0JTw2YPTKyKaJUv6et9/jO5sBdjwRnJ8Yj8lkCx++xEEUrq
	Yur3GWQI9C1pul4Fdg67x896sMv+UnfnuuuIV7vvDgfR1rkpjlQXOUhrGoSsfs0VppjdNTKyAew
	FBEW8kqVOSh1siZhxIkE3HkhAcNI6ePUVVnnHUTbzxFgWGjF5lEGHi9kGwxOWuYfdWBTS4I9xgN
	YgJD1tUqRr1rtrHe0X3KJaQpU0AtCv6Uax6JEDfEmYJpb3Nndwrz2G2FbPbPqe0TH/Vdl6IRlVY
	4eciDe3XEJojNhRN1vA6yH7OQEM9yUzT1t89PMGw9OC8zL0ilSKdBfyt11s3+CO52jaPCR0+838
	hBbVRUZodxf90RVA6r1QSv2B+Xx+a8UO/SjvqJlMCuNu/54fbvWcgLJylf08pK3oAJVm1174wJK
	Wpwa6x/TxEv0sOi10NfmXiL7Hhawi0x1Z2FmANzISkDcg0HwznL/KG1MQ5vWi/ihTZuQ==
X-Received: by 2002:a17:906:6a28:b0:c24:4128:c19f with SMTP id
 a640c23a62f3a-c29e51f0ec4mr299577866b.11.1789582672999; Wed, 16 Sep 2026
 11:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710070704.60680-1-rosenp@gmail.com> <CAD++jLkpAi3Vh=YYMckM7z8SmRFeHUUeXS4wPLfciOyMZpZ1Hg@mail.gmail.com>
In-Reply-To: <CAD++jLkpAi3Vh=YYMckM7z8SmRFeHUUeXS4wPLfciOyMZpZ1Hg@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 16 Sep 2026 11:17:41 -0700
X-Gm-Features: AcwNN1WJVvzdnVOZHo3lmjytRPKjTBA3ddruZMUBzOzR06ZUxhHvHvqAjdwZQVk
Message-ID: <CAKxU2N_cLWq2KHGGsbJhcm-EC66TNbwshV9wTetub9_cWJFqaA@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: convert to noirq suspend/resume to prevent
 interrupt storm on resume
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 6:34=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Fri, Jul 10, 2026 at 9:07=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wr=
ote:
>
> > The driver uses the legacy .suspend/.resume callbacks, but sets
> > IRQCHIP_MASK_ON_SUSPEND on the irq_chip. During resume, the PM core
> > runs dpm_resume_noirq() first, which calls irq_pm_resume() to unmask
> > interrupts, and only then runs dpm_resume() which invokes the driver's
> > .resume callback to restore GPIO registers (GPIO_IN_POL, GPIO_IO_CONF,
> > mask registers).
> >
> > This ordering means interrupts are unmasked while the hardware is still
> > in its reset state, potentially with incorrect polarities, causing
> > spurious level-triggered interrupts before local IRQs are re-enabled.
> >
> > Convert the driver from legacy .suspend/.resume callbacks to noirq
> > callbacks via dev_pm_ops. The noirq phase runs before resume_device_irq=
s()
> > on resume and after suspend_device_irqs() on suspend, ensuring GPIO
> > registers are restored before interrupts are unmasked.
> >
> > Assisted-by: opencode:big-pickle
>
> Should be
> Assisted-by: LLM
> these days (Bartosz can probs fix when applying)
I'll post a v3. There's a better way than __maybe_unused.
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Yours,
> Linus Walleij
