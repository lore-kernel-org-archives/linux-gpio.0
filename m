From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xlp: Update for ARCH_THUNDER2
Date: Wed, 15 Mar 2017 11:22:58 +0100
Message-ID: <CACRpkdZ88ObS-eqT5tVmktXWy6HdS9hor9wjJ6Ktvb6efcNYGQ@mail.gmail.com>
References: <1489317268-5376-1-git-send-email-jnair@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:35362 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751642AbdCOKXA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 06:23:00 -0400
Received: by mail-it0-f53.google.com with SMTP id m27so63001707iti.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 03:22:59 -0700 (PDT)
In-Reply-To: <1489317268-5376-1-git-send-email-jnair@caviumnetworks.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jayachandran C <jnair@caviumnetworks.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kamlakant.Patel@cavium.com

On Sun, Mar 12, 2017 at 12:14 PM, Jayachandran C
<jnair@caviumnetworks.com> wrote:

> ARCH_VULCAN arm64 platform (for Broadcom Vulcan ARM64 processors) has
> been discontinued. Cavium's ThunderX2 CN99XX (ARCH_THUNDER2) will be
> the next revision of this platform.
>
> Update compile dependencies and ACPI ID to reflect this change. There
> is not need to retain ARCH_VULCAN since the Vulcan processor was never
> in production.
>
> Signed-off-by: Jayachandran C <jnair@caviumnetworks.com>

Patch applied.

> -       depends on OF_GPIO && (CPU_XLP || ARCH_VULCAN || COMPILE_TEST)
> +       depends on OF_GPIO && (CPU_XLP || ARCH_THUNDER2 || COMPILE_TEST)

I kept ARCH_VULCAN.

I will consider removing it when Vulcan DTS files etc get removed from
arch/arm64/boot/dts/broadcom/*

People may still be using preproduction boards and I do not want
to screw things up for them.

Yours,
Linus Walleij
