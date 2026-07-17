Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAF5303C8A
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 04:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784263727; cv=pass; b=GkB85xgHCG2zQt7UkYrY/i9U9LGDIem42KVIqG31Oa1RwTJvDAdvdJF5cA4o2O23FEcs8IdM1dGvDd5NKxmjqKzg839OfLSrgj+mwVaKaCafSGLDT9w9It5NCRJ2yBZwX/R4Yj0p+4KbaQgGmW0WolUI5Cs5a6EDLSvSJwdDcN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784263727; c=relaxed/simple;
	bh=7JM1LDclmOBV9cwjd2hYzaYxgan2M1wiesdreknP5+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhelGCDjGBOArrxiNdr2b0spEvHOpAzXjwLsESk0no1EE/T9NWr6n/TanM/mbDS/DSY/zNxN1s1oB/BAa/E6agWYSxX98DyCVHP+nqa27QtdtjD8Vjkas82JfhN4BsVrlSAn1WIkMUa5waGArt3Z0aUABf2ndRDNESOlH+1duas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POzKnmPf; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POzKnmPf"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81eb41c1f1aso55203627b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 21:48:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784263725; cv=none;
        d=google.com; s=arc-20260327;
        b=ZxU/QevqwQNdsKz8Y7PLqlNsKlgYNDsp0U1tQfmDzTjtCrHZUxHJwALDKvkBSVBuku
         SgHj2PWuMC0Nboc0KLhhUDhZ+k6E8Z9ksP4G+2jX61EWu/xvlISTjmNVJ1Td/FezcnvV
         zMOuLkaJVbCccU4O/6XawNB2OaVv8pRgWNBGcbMuuPW66pS6bE3xoYm+q+i2UkqYkJ46
         VZp8p9sx/2BZENM+tHZ+1gJOlERN9W/0BJKx5IcaAhv8bLBAloYX3i7OYefcmkKmHrrm
         4eSnKYkkkAJXu15wd32Ga8qw+3JbBzqBq5Q//s6rOR01biQTRKhuuYLwfReOy8MA3PsD
         WaYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ciE9XC5LcuEdOZlav9iwcHQoR/BjZCs7jVrad2jO0Xg=;
        fh=CRFx8cN45BlEOGe19boRp6WmVe/yTnwPnbQIsMZlvlE=;
        b=dcVvsZm4VDJBcImxkxsUW22McCI3mOYdAluGYhpB/sJ5T7RVq0N3b6KIUW6jgtA1Zf
         a9KYANdWQ2rWZnJhKcs1zYyFS92MYonUOfmneTn5qzzKqzXJWLYTYcn5BLD+OSvVhV66
         o4CJtlqyXSpZGTSLYoDFwHz/La/sofuwtEKGt46l/edwv59fQBSGdFI29spUXBnBERCg
         wME8QbG3Vy/zZ948z0wJTJ19xHRsxGhq1uHVBBF3iEZbXqr2i76jR40a6qA06XCzDeFL
         g9WZdIu06SU0H+4dAxG8gQcp+Q2/7NGAanTspG4pdz0DEU8uEirmmZBeq8ay5N8oeHir
         dugw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784263725; x=1784868525; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ciE9XC5LcuEdOZlav9iwcHQoR/BjZCs7jVrad2jO0Xg=;
        b=POzKnmPf7Uzf+F2aK4qkjXXvMkOpRHyF4GaDehJkolGokmxNuu2ndS1gRPdLyGtgHl
         FVzQIeAYjSX02wehfth3OyjeMhodevG/uAXSYX5HkYWrKw5dAM3LtDaoKVx909W4mJxN
         g+cJy2FPP4SGxfIkQ1m6BFOcljzPjga5NS7Mr6o4cVKS2OnO26tnvW3rCH4RcftqPVgI
         x6FJLESpJgrvB/ktBCZCNxyb2rHbxn4zOrbvwQlVC9LoPjdXr9HYchaWvnrjCCILWRog
         pQMd4s93c9Q/+aMnTYxjTgxYVaZZ5q1s/bhMhDyA/iDFovGU0rmuiiNa/7Ogwa6ZRXO6
         Qxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784263725; x=1784868525;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ciE9XC5LcuEdOZlav9iwcHQoR/BjZCs7jVrad2jO0Xg=;
        b=a+abZwqYFd4YTuuRhV8hMSB7Fp990CEM4QUhuSE3pmbYFAzc3rlGvE/VutqHRivwzV
         ppLSET6P9A3w7QlwBB2M9u6H64powVeetKiMVCUanznVofW1QKTJXFfnZqSEeV06Swve
         4yDC2uS0CMfsCQz4SwuPipxlTVfpwMOEcbD68k6G7Do3kEEN9SiiFZ1dqMO7SM/fjqEP
         DbzePRcIdtmT3iI1Ub3ljODiLS8Z0OAypr7wbFQrB8Sb2n2WvjJnJFYVwi8nacLq6WEc
         2TuKm+SbIMh+205aGS6LTB3Q7iaL4rkqpK4QJKeSKWdZTwj/kRJTPAmx+OoaLNINkEm2
         7RGw==
X-Forwarded-Encrypted: i=1; AHgh+RpNOFCA5xju28f7R+i+I/o9oEs4OE+lKmknPgs55uP5WkIftBUpMvIaXZNUFQjWfxBlhjlQQg8G6S8h@vger.kernel.org
X-Gm-Message-State: AOJu0YyTvhLb8Soek2eXwIHJVwcireC1+WzqTfCSwKJ5VJMNlj8Xbagn
	NgFnaybpw7ZdBfF7EHJ8StjyWGtj7EWETR4Lfg3yHiaIPnqzSTNRKw0av2ZECo6polORF74gGrL
	7dy/1Vhjy6KR4DEcGggOJtvmqbTQ1g/Y=
X-Gm-Gg: AfdE7clu/3U391KbCM9ghPio3Aj75XIpJP6E/ewidUrn2a3yMV+ozilHZQrHkRlndQm
	tqjp0kU67i4brXN4Z1RJgV4SZRam8i9yfQwxxjnfho0sfYW4v2EYMG36xCo41T3UOmb8iAvYPoE
	qw6YI6A+5AdB7jQC1gvFLniWvCCtAIRpTRLzCKcjd1doKPNR4YSfZxYXDY/RheeTEx4Jc8fdUSn
	KuKRG0sonw7cDt2SASrLDScZ5oEvPgwiAJK4mQj5MYfTmi+a20+goJYo9WOsy4DbbdGVgN4ceBe
	Gp1RUTsagIkmFkdLcD1IE1tIk7tAcv6r6rso1Yt/+8U7Srdz4xLxxwBEV9WEVznPvcgZG2Wubwg
	wD7E665rqtfaHiztTaAwcwiNZ9mqElMlLFtGt
X-Received: by 2002:a05:690e:4393:b0:667:dfad:8767 with SMTP id
 956f58d0204a3-6683bb03931mr170257d50.9.1784263725187; Thu, 16 Jul 2026
 21:48:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716113055.41319-1-hardikprakash.official@gmail.com> <alkpHdM0wBw6_DiX@ashevche-desk.local>
In-Reply-To: <alkpHdM0wBw6_DiX@ashevche-desk.local>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Fri, 17 Jul 2026 10:18:33 +0530
X-Gm-Features: AUfX_mzOfCrcJgb4NEiaUvKjrK4I24bze4f0kvePH-etF5y3YEEpO5QKA9UWBMc
Message-ID: <CANTFpSVGQikgNUgwPW6hCEvCP+FWRJ3Me1jg-Uea=K2JZ4tc9Q@mail.gmail.com>
Subject: Re: [PATCH v12] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linusw@kernel.org, nathan@kernel.org, chaitanya.kumar.borah@intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jul 2026, Andy Shevchenko wrote:
> It's utterly wrong patch. Actually this whole saga shows how AI wastes
> more time than gains a productivity.
> ...
> So, make sure v13 is a real patch.

I am sorry for the bad patch. I will take some time to ensure all of
the feedback from v10, v11, v12 is properly incorporated and that v13
is a proper patch.

On Fri, 17 Jul 2026, Andy Shevchenko wrote:
> But this is wrong. It's a patch over v11 (basically it's a diff v11..v12).

For the next patch, should I carry the Ack over, given the underlying
content didn't change?

Thanks,
Hardik

On Fri, 17 Jul 2026 at 00:25, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Jul 16, 2026 at 05:00:55PM +0530, Hardik Prakash wrote:
> > I2C controllers may have child devices with GpioInt resources that
> > depend on GPIO controllers being fully initialized. If the I2C
> > controller probes and enumerates children before the referenced GPIO
> > controller has completed probe, GPIO interrupts may not be properly
> > configured, leading to device failures.
> >
> > On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> > AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> > pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> > AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> > fail with lost arbitration errors:
> >
> >   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
> >   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
> >   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
> >   2.348157  lost arbitration
> >
> > Add a dependency check that walks ACPI child devices and defers probe
> > until any referenced GPIO controller is bound.
>
> It's utterly wrong patch. Actually this whole saga shows how AI wastes
> more time than gains a productivity.
>
> ...
>
> >       gpio_dev = gpio_device_to_device(gdev)->parent;
> > -     scoped_guard(device, gpio_dev) {
> > -             if (!device_is_bound(gpio_dev))
> > -                     return -EPROBE_DEFER; /* controller not bound yet: abort walk */
> > -     }
>
> > +     guard(device)(gpio_dev);
>
> When use guard()(), make sure it has a blank lines before and after, so it's
> visible as a separate entity.
>
> > +     if (!device_is_bound(gpio_dev))
> > +             return -EPROBE_DEFER; /* controller not bound yet: abort walk */
> >
>
> ...
>
> So, make sure v13 is a real patch.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
