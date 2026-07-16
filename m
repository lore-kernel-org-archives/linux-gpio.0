Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086672EBB8D
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 05:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784179777; cv=pass; b=V8FkxbW+JJ0ywMNHdi+WHkMYe0TdWfJ1JywSpTOLHYgKXu3GSk5/NykS9LiCVb2BOZ0PiYQQSHVGTptl71f2e6tB9J3JkYwawA8o/G6v4C5nGWs04fRTTClECHqbG+KqWUNQabPdHRNivmhUQAuSvgypkINcIF+m36EvBe/voAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784179777; c=relaxed/simple;
	bh=TfXSdIHJZHVeZvsBhPmQzYpHw4qGEy2sm/iJXLYrUCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gccytuO9i8SvdHDBs1vAAi1SArKTxNGtggLedz0y/YmF80tATAQKZaZa2pjkdi7pNTEe3F6KfCYdc2kXQCM6z2NbMknSRvjV+ykoPN2DuApX6n4wBEv7HbXsnv5OF0LHHyVToyJbKCqxlMkPSV/qFuHEx66IJSTW1cdh5lzj4gE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bq3n2R+m; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bq3n2R+m"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7ff05e5d009so83487487b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 22:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784179775; cv=none;
        d=google.com; s=arc-20260327;
        b=Txjbyybb+ZSi4euBqrJo0mTMra6JMlJ8at3NF9jJQ+5hOBXqmBNpX1FiFBi8x7/uzv
         O0hc2eQ78UyGKdNOD0RZDm2z4zJJTE08l0H3rhnAacYMGYQemeUaSplJqVCV1ZLNBalW
         nOP/xCah02/DpXz9V8RMsrYnlYEmtrkWtqPSH0LXVIdCEItc7zRawrNi91Oqd3nvR3/U
         IM8L+7URkDSBMoto7CK11U8LSgnxzriwZSOlOEigZEEubO4qipMRZtk8sraQYaAiWHFo
         prq9yC0VbiPdsc7JdzEqcEcbHtNekdbqb97FuzUtnETRJeZL1xoVhNv2zq+tTOvhWXtN
         m5IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pvcVlUjrY6LXJRgT8HSChI2okJYi2RCEoHfgsrqcQlQ=;
        fh=IVUDDEbGReFC05Xy0PA/EDFQlFWV9IzUPlPF2aSDoJw=;
        b=oa4i4MpV9VN0UdpUtcKnm/CFMCLufp6s8tBrG3OnJadAGCA2w5C4976SZkzYoyAL+I
         ixuQmfefZdIhq1Nu+oAZSOIX1zwUw+Ntw+H7g2Fq6U23nGBEynWGE1UhHVPCPQbvK+yM
         As1F8xRo+HvfYqqEr9E163QIo0MriXYxJBDm1HkL2hbH4tnQqwlaAgWIdr8qjK6MfoQ0
         Y6r+ir/JAO1iJHuPIXJyiyHpXpntv+oHbBr2TTf3mOyvQ6w/c/Szo+id6zQs7AbUMRtQ
         eVVgFyW7uiNj7q2vZuWX46UMWVW5OzJuE397IY3jDijHvxyMLXgwxUfNJ/fsve1ZCeK+
         Imvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784179775; x=1784784575; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvcVlUjrY6LXJRgT8HSChI2okJYi2RCEoHfgsrqcQlQ=;
        b=Bq3n2R+mkjfaWA+t+nRwajBvDnRidIWngpaaQG3Tl2uTqTShfoLdCgIfgeYmJRhWuz
         Z34lVD60UP1psnT3e6ccXssMB2Qf6DSs97QEQEf+BjTjtHIa7hWUFCZp/z7O/dxpYKhw
         HjwUC3d46iBYgojZN8Yl7797O9gbruW7N+wDqVAD3lzh29iy9iO3XsX/OJ/ufUtCVP9Z
         QKsduINAvi1LGuXB2cYlbWL2yP74oK5Aykh7lIeUwM9bVII8xiagbj2BKzxFhFS1yKql
         NsjYHPS5zHu5DNA0Gq8XOSozFIlNKZiX4Jxv6vSLo0wuskFC7u0JtnLfQlPz4YXKzy6O
         UNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784179775; x=1784784575;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pvcVlUjrY6LXJRgT8HSChI2okJYi2RCEoHfgsrqcQlQ=;
        b=l7jETRMFKeMwc5H5VAAapRwgIHMKPlNSP+ZEjNCjfk8Gg6ilZJU3dJvLE/TYc4tV+r
         LrYdEs+vFKu3VWeChPrCUd1+xH21m+ZWRup1WZgycmWi7kHRRH/6jPb+E++3XPH6nEWp
         KxzzzOtWnMs60KTScjml/7ymoydIbBA/Nqqs5jbWeDd5lLkfglk0N0wlNjhq6uFNijOp
         x69+WGXBaAnjO53QQyg4aMKGWotXYhwixdCmQfeiIrycXjr+QUZ1xNXnlmus2t7tu1t7
         4yitn46DpKw71S7Ofmni8fBNOPTRMe8BTt1+e9cKv7nbpg+Ph0prUpojasp0Peh1Thdb
         /okQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7unB2B+ju0r2DzqR8XqFh+GCSITiq9Lkm0V8MWq4KagyIK8gefur6itomgWVvlowIkHaun0aK9w5M@vger.kernel.org
X-Gm-Message-State: AOJu0YzHPe4eShqdSeZ9uX0SoG2AR74b32dqkBCwurrygAZIoz1TwbrC
	6M13FYEwRgNlW3Thc1RZhWKZHiYvnxc7TRUVQkiV6pXoAkihWqr2oRRpEiw5xVSYBfswOP2R5rq
	Bveu+/LOXx5EEvobIfXLIFZBcy+L13Ik=
X-Gm-Gg: AfdE7cnDZwwJlz54wkOOwwRM3UjimEU6sPm3dm93luOto7aGM+oRv4rqJ7hQemxCSmx
	yTeX9CR1Q01raWG2rHMguAZzFyj+2K24FaDsnSaXxY1K3MjGc50Vkiim6VCSaqNfUJ97WVy/5fK
	SlDgZ5WEu0Wd+WVr8sHwLjZbkpAZqNfqsDSIbAW2FTavjftWLg/93XSaFDjmORrIG6134SOPbsL
	48Gjeu5uo9fT+M11PCMZL30iQgWBV2Bh8Tq5Nyp8CJmmdLebizh3afr1u7m/Lmsxwh9UMlPE9y8
	Ee7uJcYDGi7fUt/Tyan2va6k0TVqa4ZqL/NX9jRlU5SC0/Zy56seTIdEgxoIwD8Y0UsGbY45I7u
	W0HNVOpvbDSLohWrr+qZaH/y8GbeUNiC+w9XPwfr4HkAaLLU=
X-Received: by 2002:a05:690e:4361:b0:667:c93a:82f6 with SMTP id
 956f58d0204a3-6680771e5c3mr4976955d50.35.1784179774880; Wed, 15 Jul 2026
 22:29:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715114701.7713-1-hardikprakash.official@gmail.com> <aleWco-IEiXdOZkp@ashevche-desk.local>
In-Reply-To: <aleWco-IEiXdOZkp@ashevche-desk.local>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Thu, 16 Jul 2026 10:59:23 +0530
X-Gm-Features: AUfX_mw_l_QppdCMRGjsIfdh9SRLpxQ572KbjLg1YIn74-j3-l5hrcLXg0vkWoA
Message-ID: <CANTFpSUBqqKm9d6OThea+i4oKd1-SNRSrFtYs-x=PbOaUboTrw@mail.gmail.com>
Subject: Re: [PATCH v11] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linusw@kernel.org, nathan@kernel.org, chaitanya.kumar.borah@intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026, Bartosz Golaszewski wrote:
> Please include the entire changelog in every new iteration. I believe I gave
> my Ack for this and now it's gone. I have no idea why because there's neither
> a complete changelog nor links to previous versions.

Sorry about that, I will include the full changelog history from now on.

Here's a catch-up: since your v6, v7 Ack, the patch went through the v8
regression (NULL ptr deref + probe deferral loop), a v9 revert+fix
split, and now v11's restructure around gpio_device_find_by_fwnode()
per Andy's suggestion. The core approach (generic GpioInt dependency
check) is the same one you acked at v6.

However, given the amount that's changed since v6, I wonder if you
might want to take another look before re-acking.

Thanks,
Hardik

On Wed, 15 Jul 2026 at 19:47, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Jul 15, 2026 at 05:17:01PM +0530, Hardik Prakash wrote:
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
> ...
>
> > v10 -> v11:
> > - Replaced custom gpio_controller_ref list with gpio_device_find_by_fwnode(),
> >   as suggested by Andy, dropping the linked list and dedup logic (~60 lines)
> > - Moved resource-skip explanation from commit message into a code comment
> > - Fixed device_is_bound() to check gpio_device_to_device(gdev)->parent
> >   rather than the gpio_device's own internal class device, which never
> >   has a driver bound to it
>
> Thanks for an update, looks much better!
>
> My comments below. I think v12 will be final if you address everything as
> suggested and answer to the Bart's request.
>
> ...
>
> > +static int check_gpioint_resource(struct acpi_resource *ares, void *data)
> > +{
>
> > +     struct gpio_device *gdev __free(gpio_device_put) = NULL;
>
> This style is discouraged. Please, move this below.
>
> > +     struct acpi_resource_gpio *agpio;
> > +     struct acpi_device *gpio_adev;
> > +     struct device *gpio_dev;
> > +     acpi_handle handle;
> > +
> > +     if (!acpi_gpio_get_irq_resource(ares, &agpio))
> > +             return 1; /* not a GpioInt resource, skip */
> > +
> > +     if (!agpio->resource_source.string_length)
> > +             return 1; /* no named controller, skip */
>
> > +     if (ACPI_FAILURE(acpi_get_handle(NULL, agpio->resource_source.string_ptr, &handle)))
> > +             return 1;
>
> Can be rewritten as
>
>         acpi_status status;
>         ...
>
>         status = acpi_get_handle(NULL, agpio->resource_source.string_ptr, &handle);
>         if (ACPI_FAILURE(status))
>                 return 1;
>
> > +     gpio_adev = acpi_fetch_acpi_dev(handle);
> > +     if (!gpio_adev)
> > +             return 1;
> > +
> > +     gdev = gpio_device_find_by_fwnode(acpi_fwnode_handle(gpio_adev));
>
>         struct gpio_device *gdev __free(gpio_device_put) =
>                 gpio_device_find_by_fwnode(acpi_fwnode_handle(gpio_adev));
>
> > +     if (!gdev)
> > +             return -EPROBE_DEFER; /* controller not registered yet: abort walk */
> > +
> > +     gpio_dev = gpio_device_to_device(gdev)->parent;
>
> > +     scoped_guard(device, gpio_dev) {
>
> Can we use simple guard()() here?
>
> > +             if (!device_is_bound(gpio_dev))
> > +                     return -EPROBE_DEFER; /* controller not bound yet: abort walk */
> > +     }
> > +
> > +     return 1; /* bound, skip adding to resource list, continue walk */
> > +}
>
> ...
>
> > +static int check_child_gpioint(struct acpi_device *adev, void *data)
> > +{
> > +     struct list_head res_list;
> > +     int ret;
> > +
> > +     INIT_LIST_HEAD(&res_list);
>
> Instead just define with LIST_HEAD() macro.
>
>         LIST_HEAD(res_list);
>         int ret;
>
> > +     ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, NULL);
>
> > +     acpi_dev_free_resource_list(&res_list);
> > +
> > +     /*
> > +      * ret is a nonnegative resource count on success, which must not
> > +      * be mistaken for a nonzero "stop iteration" signal by
> > +      * acpi_dev_for_each_child(); only forward genuine errors.
> > +      */
> > +     return ret < 0 ? ret : 0;
>
> Check for errors when it's required. I believe you fixed it at some point
> and now it's again old version. Please, reduce full rely on AI, it's not
> helpful sometimes.
>
>         ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, NULL);
>         if (ret < 0)
>                 return ret;
>         ...
>         return 0;
>
> > +}
>
> ...
>
> > +static int i2c_dw_check_gpio_dependencies(struct device *dev)
> > +{
> > +     struct acpi_device *adev = ACPI_COMPANION(dev);
>
> This style is discouraged as it brings an unneeded burden on a maintenance.
>
> > +     if (!adev)
> > +             return 0;
>
>         struct acpi_device *adev;
>
>         adev = ACPI_COMPANION(dev);
>         if (!adev)
>                 return 0;
>
> > +     return acpi_dev_for_each_child(adev, check_child_gpioint, NULL);
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
