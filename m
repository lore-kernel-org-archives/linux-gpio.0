Return-Path: <SRS0=sISh=2Y=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9298C00523
	for <linux-gpio@archiver.kernel.org>; Fri,  3 Jan 2020 23:14:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 74A9F24649
	for <linux-gpio@archiver.kernel.org>; Fri,  3 Jan 2020 23:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cMS6mES7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgACXOI (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 3 Jan 2020 18:14:08 -0500
Received: from mail-lf1-f45.google.com ([209.85.167.45]:47066 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgACXOI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jan 2020 18:14:08 -0500
Received: by mail-lf1-f45.google.com with SMTP id f15so32806300lfl.13
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2020 15:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A00/oAlTrLQ66KmTNGUN07QVz/BR8lSaaVjwfcir4vE=;
        b=cMS6mES7Yg0/iXjtB+SqCXrFeGDUY4/chdyS9HCGtR4GsNPccPJWVFln3fI07TqaTm
         6dsPx1shaufP3Tb8njfCUGs57kZer2C1uTgyz8U/I0fhIllbRl7R+K/CyeRwakm1SXK2
         r3lJmQmu98cF1jnMrAqiKTWparsohpBsbQ2g2aCY9bpKU8WKIWGyoT99uKa55XSNp0Y0
         LALvzaBFw1+lSUpRw7bzLJ0HftY/+UUcdldifCt/TjGCXMpnIFs4/LLaHjXK8/MPhj/N
         6rAeeCAw8xumgdWOOfKlHkA+qH16WsDrx2O+T9MrcRxwhuRlkvk6vGiJNU5Rv+tjG8P9
         EKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A00/oAlTrLQ66KmTNGUN07QVz/BR8lSaaVjwfcir4vE=;
        b=A53XrBIBQjbjBcKvP6smYVYqSc7pJUUZPjWhtotRd9hwSlmJhPZzxSvJEmwpJsp3mz
         3zCUN4JLXjcqtNjrlnGgjG0O1amyEUJcgyRgDrLSko/h6JbE/WW3s3hLxStPMyaUcT8h
         h9Hp2DOBBXEnKbkm9u3F5wKkmaMPH30saMOkaVxZ/chfdZ165z/ugr2In3PWDx1V5F9n
         2T4QpjNqtm0128NMnX4sGR4DEBkSdFATKSx44dmil2EDcPB012JKAd7ta6xhlp1PpbKU
         TCR2YVwK90dtjouUQ/wUu2aX4Ixl4OVo++WeuPo/bIvWecm8958ZdClLPG5CVji69OT5
         UDVQ==
X-Gm-Message-State: APjAAAVKmfiSr+OOQgHjvsqcDrfROYWxS4YeVnasp8Nos5d8zdkiNVJ8
        d7f/mDncsOoV6DxBzMn1xVmyiN8OB1ecNBpTQp5meQ==
X-Google-Smtp-Source: APXvYqwQSRH3yHxzOAsOsxUx3jDRcZ/OZ3qKusDpeO0f/nCJ3AzdN80XPDp3cilrwaqGJaM8Kh9tiGGIeZc6UljSpdA=
X-Received: by 2002:a19:2389:: with SMTP id j131mr48971852lfj.86.1578093247244;
 Fri, 03 Jan 2020 15:14:07 -0800 (PST)
MIME-Version: 1.0
References: <20200103164857.18811-1-brgl@bgdev.pl>
In-Reply-To: <20200103164857.18811-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 4 Jan 2020 00:13:56 +0100
Message-ID: <CACRpkdZmOiVx7aAqv3jBfPj=50pUL=3inb7H=8RFNmJkxUvCpw@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.5-rc5
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 3, 2020 at 5:49 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> please consider pulling the following fix for v5.5. I missed some
> indentation issues during review in gpio-mockup.

Pulled in, thanks!

Yours,
Linus Walleij
