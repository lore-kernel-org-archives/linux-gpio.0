Return-Path: <SRS0=nfV1=4Q=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA32C3F2CD
	for <linux-gpio@archiver.kernel.org>; Fri, 28 Feb 2020 22:54:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C0F02246A8
	for <linux-gpio@archiver.kernel.org>; Fri, 28 Feb 2020 22:54:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QYV4KNTs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgB1Wym (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 28 Feb 2020 17:54:42 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36338 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726901AbgB1Wym (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 17:54:42 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so5135785ljg.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 14:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PEk+rGai1GRI6QlTmVACuUYoYRTC+COuRPdssaHj9hU=;
        b=QYV4KNTsjUJKQupViFBewOqKWiK0ODb/mIegNzyagUoADqT7tFF4wH6/X5NuXQCIeG
         GeOj/xuQqe7SRQF/VK+2IX9CFoJHrl3Jyl8rLlXkFd5k26unehSN22d3oin/PBJACHM+
         qOwlf1j3EgMZngWwCuc7T85BO3RofzpjvRhFDwxbfcjVz2DwaXHeL4BBo/aLUmUWcqsz
         nS8QkdPIsTVd+PTmcbhV3a15on3mrRx7CHbGdqlfkimlmSHek3jMo2Tf3w7ujAqlzB/U
         lxO4BC16mjMnt6CIcpUqOzYyr+8gdZs2dFtl2rnmp4cNPM9NiJZHvTF78LeqrtqVuDJs
         7MFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PEk+rGai1GRI6QlTmVACuUYoYRTC+COuRPdssaHj9hU=;
        b=hBOF2P5SQwNEQpwXM5FTXrRLfozhr+yaWOTNiH5xqkUpfSWcjeeAhwftW3hZ0iu7R/
         C5XkBpMfzaTyb3cgACBFqtkeOSa2aWkiBWpkxtEUfrgJAUuOJqiNKcYgRkZjPEly9k2k
         UPgmPMLIhGHQ+tl05afjdkdsGVYVoUKi0TA4duPwzOItpc3stjL9WmvgdIHed99/DKdS
         j48BRFtZS50t9W9uGsr3zQQ+Px7ZaGIutzjx3HbpBXkyCPzMBuQFXf1dRGP8sRLCjEn9
         oz+8IzIk/zAq9XPJtOdnsjA/mVbfM7EQBOtLk3Gz5Iz70gDi+wMKQRP0vtnXIr94me6b
         Qxqg==
X-Gm-Message-State: ANhLgQ3Kn+zCsueVCbK0f5biJNf8WNOdAOtaUq3emQy856SnqJd20TIH
        H8OXX0ZJOct79nZz9E48IibPjaHRdE9i0m1Ju8SVyg==
X-Google-Smtp-Source: ADFU+vvct0krUKrAq5gI5QS2nVa0gcdunFoiXaZPdLALeC2hJ9Co5jGX5anrbEAfVAy9PC+2zyrJxJbS9gAgbBTc2jc=
X-Received: by 2002:a05:651c:39b:: with SMTP id e27mr3066189ljp.99.1582930479633;
 Fri, 28 Feb 2020 14:54:39 -0800 (PST)
MIME-Version: 1.0
References: <20200225102753.8351-1-hdegoede@redhat.com>
In-Reply-To: <20200225102753.8351-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Feb 2020 23:54:28 +0100
Message-ID: <CACRpkdb3W=fL3VnNSep2MFnihqEj5GwWsN6BdWRSWckZBMHAOg@mail.gmail.com>
Subject: Re: [PATCH resend 1/3] gpiolib: acpi: ignore-wakeup handling rework
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marc Lehmann <schmorp@schmorp.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 25, 2020 at 11:28 AM Hans de Goede <hdegoede@redhat.com> wrote:

> The first patch just updates the comment describing why we are ignoring
> GPIO ACPI event wakeups on HP x2 10 models.

OK

> The second patch is more interesting, in the mean time I've learned their
> are actually at least 3 variants of the HP x2 10, and the original quirk
> only applies to the Cherry Trail with TI PMIC variant (and the original
> DMI match only matches that model). We need a similar quirk for the
> Bay Trail with AXP288 model, but there we only want to ignore the wakeups
> for the GPIO ACPI event which is (ab)used for embedded-controller events
> on this model while still honoring the wakeup flags on other pins.
>
> I'm not 100% happy with the solution I've come up with to allow ignoring
> events on a single pin. But this was the best KISS thing I could come up
> with. Alternatives would involve string parsing (*), which I would rather
> avoid. I'm very much open to alternatives for the current approach in the
> second patch.
>
> Since sending out the first 2 patches of this series I've received
> positive testing feedback for the quirk for the HP X2 10 Cherry Trail +
> AXP288 PMIC variant, so here is a resend of the first 2 patches with
> a third patch adding a quirk for the third variant of HP X2 10 added.

I'm waiting for some ACPI person to say yes to this,
Mika ideally but the other Intel guys like Andy also works :)

Yours,
Linus Walleij
