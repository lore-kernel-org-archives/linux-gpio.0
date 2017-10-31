From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: mb86s7x: share with other SoCs as module
Date: Tue, 31 Oct 2017 13:12:50 +0100
Message-ID: <CACRpkdadyzcDEWx9=PwHDqOfUgb2ZYKOQ+PHMz62unsNw+uqvw@mail.gmail.com>
References: <20171027202148.4188-1-ard.biesheuvel@linaro.org> <20171027202148.4188-2-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:54278 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751366AbdJaMMv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2017 08:12:51 -0400
Received: by mail-io0-f194.google.com with SMTP id e89so34485462ioi.11
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2017 05:12:51 -0700 (PDT)
In-Reply-To: <20171027202148.4188-2-ard.biesheuvel@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Geliang Tang <geliangtang@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>

On Fri, Oct 27, 2017 at 10:21 PM, Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:

> In order to reuse this driver for the Socionext Synquacer SC2A11 SoC,
> which inherited this IP from Fujitsu, remove the ARCH_MB86S7X Kconfig
> dependency, and revert the changes that prevent it from being built as
> a module.
>
> This reverts commits d65aa4b67b4f47f303bdeaef1e4d42ef18e6b293 and
> d5610e514e92144d19bd5e39e5cf3804bbf85f3e.
>
> Cc: Geliang Tang <geliangtang@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Patch applied, I folded in your patch snippet
using module_platform_driver() on top.

Yours,
Linus Walleij
