Return-Path: <SRS0=o0Q7=U3=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECD0C4321A
	for <linux-gpio@archiver.kernel.org>; Fri, 28 Jun 2019 08:55:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9705C206E0
	for <linux-gpio@archiver.kernel.org>; Fri, 28 Jun 2019 08:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bvLvrtfO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbfF1Izk (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 28 Jun 2019 04:55:40 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38835 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfF1Izk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 04:55:40 -0400
Received: by mail-lj1-f196.google.com with SMTP id r9so5203161ljg.5
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2019 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6SDXvLF6WGLeyRshJ4F68qdUEnT/yo0TXC3eJQ5oViY=;
        b=bvLvrtfOCRsDAbMbfqoawBL8qsAlSFfvYELFJJamjkbF9KGdm5UbBdrJLuWTBwlfoL
         k8HgEeVZqt/Zg6IHOPjzMiqQ7RJ3fvfGgW7Zk0sLsZUgnGR9WpLh8cPSrRXgDwG8hvKz
         AJzo8zrlu4SZHnxfCIR17X4+2FN8DGrfFoxNNPt5nNHrJ7/wxdat4RNT24R58aEPnvOH
         kKaK1p88OVc9as0BZ0euyIGN0kweoZs7MxEEyzJARwd+NSjM/h9tX9lMly1Ov6/xRHEn
         YsDX6L/hUdlxSinDUKCKZ9SZ0wd+8hizfmrUWsSMckFdJsfA3bUA5KbFO8k2sqCs3zD1
         +4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6SDXvLF6WGLeyRshJ4F68qdUEnT/yo0TXC3eJQ5oViY=;
        b=Z4FFzKUw2Td7chGSkjqQf2CVOzm/vzd6WC3zlAAbpQ4Kc5zKacWw0MGAID+o1DQfJd
         XRJAMtDiuQYO/54EVEavIQGWdLSof5peGR3SvvzT0Tp3sfXyC8MGQ6xzqCAkpS3nVy0r
         0AlK4KVnoip3+eWC7zPtwSlUFaBOAm7JnXoMo0ee1dkrD+WcdT4vCE2Ely3ngn8HzYFM
         1wTl3k56M+SNPFgYaPgskNEPwCW9MFYN+UaScReVfaLrPUby+a4k83xu9tkMTzzvYN4Z
         1lUxHAtoDRBpwveC419fADajGPG605NbCuQ9XbIrWDsY9D6acWwT/IIgaCekWjh73bI1
         jYpw==
X-Gm-Message-State: APjAAAV/j3a6UwldYPz38+5PjSc+biKkAgS29Ha5pxGwK5lZGD/DqsIb
        MHR99TTjm25zQ/tr7hbfjDvqOSCoFBeKdUE5SoJBlw==
X-Google-Smtp-Source: APXvYqyrrpEwTUchSPESqzYoxtYOm3sJzDtertH7H0sUSkVbFiwz86m6fZBNCReNx09AlSfQxXSZcoK7BQX1NPz1uUs=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr5617189ljj.108.1561712137792;
 Fri, 28 Jun 2019 01:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <1561699236-18620-1-git-send-email-harish_kandiga@mentor.com> <1561699236-18620-2-git-send-email-harish_kandiga@mentor.com>
In-Reply-To: <1561699236-18620-2-git-send-email-harish_kandiga@mentor.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Jun 2019 09:55:26 +0100
Message-ID: <CACRpkdZQpr78=ZzBQEkbjS714W0HPEurO8haM8PpmpvYFivm-A@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] gpio: inverter: Add Inverter controller for gpio configuration
To:     Harish Jenny K N <harish_kandiga@mentor.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 28, 2019 at 6:20 AM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:

> Provides a new inverter gpio controller to configure the polarity
> of the gpio pins. This driver enables the consumers to directly
> use the gpio pin without worrying about the hardware level
> polarity configuration. Polarity configuration will be done by
> the inverter gpio controller based on device tree information.
>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>

This code is finished, very nice.

We still need some review from the DT people before I
apply it.

Yours,
Linus Walleij
