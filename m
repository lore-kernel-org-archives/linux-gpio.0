From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: iproc: Fix iProc and NSP GPIO support
Date: Fri, 21 Oct 2016 14:26:29 +0200
Message-ID: <CACRpkdbMehQaz=_P3zr0Wz_y9V62uFT=n=ZCrrW6B4rBHJa-vw@mail.gmail.com>
References: <1476754901-3447-1-git-send-email-ray.jui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:35397 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932776AbcJUM0a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2016 08:26:30 -0400
Received: by mail-qk0-f171.google.com with SMTP id z190so148867386qkc.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2016 05:26:30 -0700 (PDT)
In-Reply-To: <1476754901-3447-1-git-send-email-ray.jui@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>

On Tue, Oct 18, 2016 at 3:41 AM, Ray Jui <ray.jui@broadcom.com> wrote:

> Since commit 44a7185c2ae6 ("of/platform: Add common method to populate
> default bus"), ARM64 platform devices are populated at the
> arch_initcall_sync level; as a result, the platform_driver_probe calls
> in both the iProc and NSP GPIO drivers fail with -ENODEV since by that
> time the platform device was not yet registered.
>
> Replace platform_driver_probe with platform_driver_register, that allow
> the device to be register later
>
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>

Patch applied for fixes.

Yours,
Linus Walleij
