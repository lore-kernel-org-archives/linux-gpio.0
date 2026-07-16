Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6882F23F417
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 05:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784179899; cv=pass; b=FWRjGec3czLgdiEwuYkJZKPVvuLAUD6dvnaDLQwTgacnwKMK/TyoyWk2Bjf3C4twic3dl5Rjqj5b7f1qGNw+BBgFlqjyqfeqWISMEkJHKpqr5Epnyq3KV6sPAOo5GiUEBEdT0xDIKylLpmjbCRUI/bcDpGq6YVU1CZ7oob/rfxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784179899; c=relaxed/simple;
	bh=vf1tLdwlxll7iMX8ejWjKoCj9GmbnCEI3OPdWhLotyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHf/d8mtkbcZx1PwC+KnLN+L9SO+/Fmb/LPBifntXa+b6Dj4ifH5PcsheSNuMUFdP3o/nxN9mXbaUFaHm7YhCtG7n9/2J6ZoUZoXcT1yjxXZWDvwY2fYc7Z2/G7Tg3gLNvIh9uv8oYw6lP5WdyivO83wSUndAAT7GcloSw2VWuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiwBBYWZ; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiwBBYWZ"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81ead20e4a0so31212747b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 22:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784179896; cv=none;
        d=google.com; s=arc-20260327;
        b=G/s3qwUMO9o9180qOQB/qD135BWBj7PQ9HPEHAOnJOA6MiRoVBks2EdOrNobUrHfNR
         IAViL9lfKgWDF21wW+pC2J4/3Z609dN4EPpKY7fUV9WQBrbiYSQAXJUuTvvdu0gLtHx6
         hWfRDv+sDYbyxFK/x33Jo6O47uP9/yJ4XWHMOPyFiruCNIi5Sd0753bx+wv1pyUMLgmy
         YRNTDax8ZyKh9pNpoVQcNHBQ7BOkhAqcgRJ+1rm+h1BHbWpD9WtYP1z4U+flBUknayqy
         wBSHhTbSrHWcmX770hlWWgtPnYzDgO/Vw+e9l5Qcvycabtyj1QrziE2QiV0qVF3tImvc
         5qdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p2t8FhHOW+tC/RnLLbflTPK0p7GHhXVaV9v/WmWP7UU=;
        fh=ZkCx1CfiE36z7ZSrhTWAedtlGt91VTCl30TgKlG9qzQ=;
        b=sRUQBNrkBxfmnCRqrPLnn/pvCNPhRlbl96zB0S0RLVjzVGTi3XJffi6BLJ1OyruyVv
         6d4feXQ8TLKDJ4hiR/Ukx6StBwEt9eZ4/fTJMqtRwjQgxQhrm9zHnjmLyoOhqXsaNtvE
         ivmuEs3uCa491WUwcBhuzGOv3fwTCgWW4I/veiPzFLdxbspMkEte/ltk/zl3awSxM1O9
         ChKB9K9BGaaCWNELKBLIKPzWEthpROhTOSpQuwHqQGO1ZpuZF5wHv1i7Rp+/BNHblSQ8
         MFZ6WaJi0/HGDDv56szATYKT5FYBOjNFtkiPL4BjZkHBR2B2sq3kQsXTLcl33Z9/1o5u
         /d8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784179896; x=1784784696; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2t8FhHOW+tC/RnLLbflTPK0p7GHhXVaV9v/WmWP7UU=;
        b=EiwBBYWZAodhT5/RFC0ifNHjx0ojY3qTkjf+GVqHukdRdzkRk6U8ldmKTJp9s2k9Js
         cnIuzNXEGAUrlHY4WQXMmZQMv4TFtIQWWEtWLVUd5qRE8m3OJ73TEy3BOpcblNXthPJp
         jAd9TlHNytWWREnkejv/yIsU/G+sAK9GZYrKtAGn9ruD7/nNR9O0IJ19yI8hAayofCq9
         Tyo2VugZyIIyg5UP9N3uue7iR1avRrYUK3mczURhZrJi4njGrRfSvxgYTwcx/gwlO/Tb
         oaQb/N825D250/3VddS5/DHevmqKMZRty1bAHM+4QHK3/6C1GYZCg2KAporYZpJtckDR
         evLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784179896; x=1784784696;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p2t8FhHOW+tC/RnLLbflTPK0p7GHhXVaV9v/WmWP7UU=;
        b=bmfO7FSMhOlL/kHhTPaUoBmcK06ulxigaWWmi50Nfhhyq4F0QXrSj1v2fzFtUmdoHI
         DivgX6I8t6Ikiu2kDxdlKTmdniQDT3y4MdD/75Mvu9h5VPL0ICLcOzkvUNQ6p3boWFY9
         KV6GAJCCOgM6kBsJjTHtGlebWzNwrUTOZDuzbFtRXtis8b7aO2I9cXfJ2lmhPx42qP7Y
         xlbNJKR9YGcuJY9DALA/9hyHNF+6o1sNOYuY3ZI/5ftdImamm752/HQWWz/U1xylnSmj
         8guleNwqMYWxJA0rgqzu0N/wjGFgu9/ixu20yZLFE8sNUYM0n49JjvFevqMBGflIEGNf
         P3kg==
X-Forwarded-Encrypted: i=1; AHgh+RpJk7tzU51Ql6dRPgHrrPlht41e2rox9cwWNmoN9OzhfXYqM4wWvgCToiiiud9hsHCcwYNqiLdJAGDK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8I3AwuAoTHtBJ20HeBcaMnsenz+aPEncluct866BbP1lK+fx9
	qnsBhOmkSSvkrVmY796E5T6nlIPhfWm4lOTr48Rh66BCqMI937mXCQhIXyUb2ij1KHvkW1IDvSs
	5uM+GdTQg9IOA+KspP9ijW9xZ33Kg9u0=
X-Gm-Gg: AfdE7ckTEBSbr/+2/M+pQpkX9K6Y0ATBGeZkqeIEl+XO6FgcXXETRr511wcVRy+um3d
	Pacbzpg7dpjA5YY0dyDvIm+P9GArfMEnX+cJx3iDfTozM//iJNdsiKqMQPtlHMZxG+uXyJBls2S
	EbcZt3xMMK+bw1cAeJnWjk3TIdQfxLiIkizLQJe1apQ8TrwH+a/0WcFs+6BHaQDhZuq7bebu1dj
	Tp/O+eVs0Oi9GVLrqXw0REDNIVdVxKXpSm+lPVknme9SNq2FPLrJDnSE6eyLgoKGblS8sG99N0s
	DRZTlHOOYQH8FMrdDeKZLLXiObN54Oh3LsjoENkQcgaUY8HgGovSDafh2lYSV0LPGSkRHy5IIEh
	jchtMuozxnt9lv8prCnDeLmqJ9KnbDMh6DUf4
X-Received: by 2002:a05:690c:60c6:b0:81e:7b95:c777 with SMTP id
 00721157ae682-81e9010b61emr160249437b3.35.1784179896265; Wed, 15 Jul 2026
 22:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715114701.7713-1-hardikprakash.official@gmail.com>
 <aleWco-IEiXdOZkp@ashevche-desk.local> <CANTFpSUBqqKm9d6OThea+i4oKd1-SNRSrFtYs-x=PbOaUboTrw@mail.gmail.com>
In-Reply-To: <CANTFpSUBqqKm9d6OThea+i4oKd1-SNRSrFtYs-x=PbOaUboTrw@mail.gmail.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Thu, 16 Jul 2026 11:01:24 +0530
X-Gm-Features: AUfX_mxTGIxXs99b7SyBDBoVEY22it0VSXNJMUkHqbuy7xNleRLUI7durffyYyM
Message-ID: <CANTFpSU+CsTYZf5+w95eL7mXA+HxKU2n3xYo=_rfJ_ozCoG+Mw@mail.gmail.com>
Subject: Re: [PATCH v11] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linusw@kernel.org, nathan@kernel.org, chaitanya.kumar.borah@intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026, Andy Shevchenko wrote:
> Instead just define with LIST_HEAD() macro.
>
>         LIST_HEAD(res_list);
>         int ret;
> [...]
> Check for errors when it's required. I believe you fixed it at some point
> and now it's again old version. Please, reduce full rely on AI, it's not
> helpful sometimes.

My bad, I checked and found the correct snippet in v10:

        ret = acpi_dev_get_resources(adev, &res_list,
check_gpioint_resource, data);
        if (ret < 0)
                return ret;

        acpi_dev_free_resource_list(&res_list);
        return 0;

I will post v12 with this and your other comments addressed.

Thanks,
Hardik

On Thu, 16 Jul 2026 at 10:59, Hardik Prakash
<hardikprakash.official@gmail.com> wrote:
>
> On Wed, 15 Jul 2026, Bartosz Golaszewski wrote:
> > Please include the entire changelog in every new iteration. I believe I gave
> > my Ack for this and now it's gone. I have no idea why because there's neither
> > a complete changelog nor links to previous versions.
>
> Sorry about that, I will include the full changelog history from now on.
>
> Here's a catch-up: since your v6, v7 Ack, the patch went through the v8
> regression (NULL ptr deref + probe deferral loop), a v9 revert+fix
> split, and now v11's restructure around gpio_device_find_by_fwnode()
> per Andy's suggestion. The core approach (generic GpioInt dependency
> check) is the same one you acked at v6.
>
> However, given the amount that's changed since v6, I wonder if you
> might want to take another look before re-acking.
>
> Thanks,
> Hardik
>
> On Wed, 15 Jul 2026 at 19:47, Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > On Wed, Jul 15, 2026 at 05:17:01PM +0530, Hardik Prakash wrote:
> > > I2C controllers may have child devices with GpioInt resources that
> > > depend on GPIO controllers being fully initialized. If the I2C
> > > controller probes and enumerates children before the referenced GPIO
> > > controller has completed probe, GPIO interrupts may not be properly
> > > configured, leading to device failures.
> > >
> > > On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> > > AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> > > pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> > > AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> > > fail with lost arbitration errors:
> > >
> > >   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
> > >   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
> > >   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
> > >   2.348157  lost arbitration
> > >
> > > Add a dependency check that walks ACPI child devices and defers probe
> > > until any referenced GPIO controller is bound.
> >
> > ...
> >
> > > v10 -> v11:
> > > - Replaced custom gpio_controller_ref list with gpio_device_find_by_fwnode(),
> > >   as suggested by Andy, dropping the linked list and dedup logic (~60 lines)
> > > - Moved resource-skip explanation from commit message into a code comment
> > > - Fixed device_is_bound() to check gpio_device_to_device(gdev)->parent
> > >   rather than the gpio_device's own internal class device, which never
> > >   has a driver bound to it
> >
> > Thanks for an update, looks much better!
> >
> > My comments below. I think v12 will be final if you address everything as
> > suggested and answer to the Bart's request.
> >
> > ...
> >
> > > +static int check_gpioint_resource(struct acpi_resource *ares, void *data)
> > > +{
> >
> > > +     struct gpio_device *gdev __free(gpio_device_put) = NULL;
> >
> > This style is discouraged. Please, move this below.
> >
> > > +     struct acpi_resource_gpio *agpio;
> > > +     struct acpi_device *gpio_adev;
> > > +     struct device *gpio_dev;
> > > +     acpi_handle handle;
> > > +
> > > +     if (!acpi_gpio_get_irq_resource(ares, &agpio))
> > > +             return 1; /* not a GpioInt resource, skip */
> > > +
> > > +     if (!agpio->resource_source.string_length)
> > > +             return 1; /* no named controller, skip */
> >
> > > +     if (ACPI_FAILURE(acpi_get_handle(NULL, agpio->resource_source.string_ptr, &handle)))
> > > +             return 1;
> >
> > Can be rewritten as
> >
> >         acpi_status status;
> >         ...
> >
> >         status = acpi_get_handle(NULL, agpio->resource_source.string_ptr, &handle);
> >         if (ACPI_FAILURE(status))
> >                 return 1;
> >
> > > +     gpio_adev = acpi_fetch_acpi_dev(handle);
> > > +     if (!gpio_adev)
> > > +             return 1;
> > > +
> > > +     gdev = gpio_device_find_by_fwnode(acpi_fwnode_handle(gpio_adev));
> >
> >         struct gpio_device *gdev __free(gpio_device_put) =
> >                 gpio_device_find_by_fwnode(acpi_fwnode_handle(gpio_adev));
> >
> > > +     if (!gdev)
> > > +             return -EPROBE_DEFER; /* controller not registered yet: abort walk */
> > > +
> > > +     gpio_dev = gpio_device_to_device(gdev)->parent;
> >
> > > +     scoped_guard(device, gpio_dev) {
> >
> > Can we use simple guard()() here?
> >
> > > +             if (!device_is_bound(gpio_dev))
> > > +                     return -EPROBE_DEFER; /* controller not bound yet: abort walk */
> > > +     }
> > > +
> > > +     return 1; /* bound, skip adding to resource list, continue walk */
> > > +}
> >
> > ...
> >
> > > +static int check_child_gpioint(struct acpi_device *adev, void *data)
> > > +{
> > > +     struct list_head res_list;
> > > +     int ret;
> > > +
> > > +     INIT_LIST_HEAD(&res_list);
> >
> > Instead just define with LIST_HEAD() macro.
> >
> >         LIST_HEAD(res_list);
> >         int ret;
> >
> > > +     ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, NULL);
> >
> > > +     acpi_dev_free_resource_list(&res_list);
> > > +
> > > +     /*
> > > +      * ret is a nonnegative resource count on success, which must not
> > > +      * be mistaken for a nonzero "stop iteration" signal by
> > > +      * acpi_dev_for_each_child(); only forward genuine errors.
> > > +      */
> > > +     return ret < 0 ? ret : 0;
> >
> > Check for errors when it's required. I believe you fixed it at some point
> > and now it's again old version. Please, reduce full rely on AI, it's not
> > helpful sometimes.
> >
> >         ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, NULL);
> >         if (ret < 0)
> >                 return ret;
> >         ...
> >         return 0;
> >
> > > +}
> >
> > ...
> >
> > > +static int i2c_dw_check_gpio_dependencies(struct device *dev)
> > > +{
> > > +     struct acpi_device *adev = ACPI_COMPANION(dev);
> >
> > This style is discouraged as it brings an unneeded burden on a maintenance.
> >
> > > +     if (!adev)
> > > +             return 0;
> >
> >         struct acpi_device *adev;
> >
> >         adev = ACPI_COMPANION(dev);
> >         if (!adev)
> >                 return 0;
> >
> > > +     return acpi_dev_for_each_child(adev, check_child_gpioint, NULL);
> > > +}
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
