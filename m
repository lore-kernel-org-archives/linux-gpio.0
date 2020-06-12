Return-Path: <SRS0=HMxX=7Z=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7224FC433E0
	for <linux-gpio@archiver.kernel.org>; Fri, 12 Jun 2020 08:00:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D18B2081A
	for <linux-gpio@archiver.kernel.org>; Fri, 12 Jun 2020 08:00:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Dupr1m37"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgFLIAD (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 12 Jun 2020 04:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgFLIAD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Jun 2020 04:00:03 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A66C08C5C1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2020 01:00:03 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id y9so3980883qvs.4
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2020 01:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zAch9IlDTp6iEr5w238b0yuLmT7aOF6imYemNYoLEcM=;
        b=Dupr1m37CTGw4+ohb5QSfamEzZj2PxJPeG5irXL+9QuTzFHpCgE8yPpn5blX9p3G4N
         KkjCYbpH56ulQEGwMu4HVjdpUpzbibqcRaIC/BcmW5X02t5/gmDSiZAK3IbQetQhKl2J
         J5fZG/dZ7lk7FdAZ0zXuoRxcXte73Vr7+RSypUkKfYeJOI8H9aMVf0nFEv0iLD94Wil4
         xRWvs1k++ma1V/PiVoijg0pVmcL3y5AuWrQT3GS/kmsj8dTndoosa90F3FAX5BT6NEk5
         sXDCvnf3L4vJy+n3Fsek9Yy7vsAxX21X4W9DEE+Zkllq3EGDQD7ItZXleP5iUQGn2vCQ
         tkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zAch9IlDTp6iEr5w238b0yuLmT7aOF6imYemNYoLEcM=;
        b=hNq9OQB5cVuVAnpWV78MJ3MQfEkgCAvXgZgfBiZHsVrbXsgrfHYfZ6Laj85eemyU5G
         HU0MZWXQSytPF+IHb9nb/a+UHLHq/KTx7joRCyoLtmXLWgAjnJL4V2WJN8UGZ8SbvbfE
         UCs70/rFAUW33HuzK3ZsAdOcByGHIRU+J6/EFaOu/070uxY6EmV+Qm/5vnrzazoRGDjA
         8Hu+G4/sd/bHFx2gPyr4yfw5w7ZfdxgYLsBkuphq9UxkW5zwXs2xmUMDmn6ybry6pyRh
         kbfoNMX20q73sq4BUv41uICPIpATIy2LrkQrZnuFSaZM8lAZkqBxs2pt5oN0G1g+xY5o
         IAaA==
X-Gm-Message-State: AOAM531EzDG2KZZj9cEGLGuCSd21OcbMJ6WKuoCbCjpUG/ROjuTtlf1o
        3AYLiIu7NVWn+Njgs+CU4+X+2m3jG5c3r5RmcyYk+g==
X-Google-Smtp-Source: ABdhPJzu+ikYeKslS04C6iqRdh+KuS10EdJ8EzagLxWO+G6bPpS74j9WkEF9YzTpHGGWSiZXeAW9AVmnAHKn5Rn+vKA=
X-Received: by 2002:a0c:f652:: with SMTP id s18mr10954998qvm.96.1591948802450;
 Fri, 12 Jun 2020 01:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200612045034.27425-1-warthog618@gmail.com> <20200612045034.27425-2-warthog618@gmail.com>
In-Reply-To: <20200612045034.27425-2-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 12 Jun 2020 09:59:51 +0200
Message-ID: <CAMpxmJWUmiEADN44DeZ8tRwOSZGr_eYnutQy5zGsxhDTM7PSFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: cdev: fix -Wmissing-prototypes warnings
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 12 cze 2020 o 06:51 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Fix -Wmissing-prototypes warnings by including module's header.
>
> Fixes: f6d984418ffd (gpiolib: split character device into gpiolib-cdev)
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 971470bdc9c9..58011ba88a1d 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -23,6 +23,7 @@
>
>
>  #include "gpiolib.h"
> +#include "gpiolib-cdev.h"
>
>  /* Implementation infrastructure for GPIO interfaces.
>   *
> --
> 2.27.0
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
