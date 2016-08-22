From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: cherryview: Do not mask all interrupts in probe
Date: Mon, 22 Aug 2016 15:57:42 +0200
Message-ID: <CACRpkdYeQJk4sOkAgxeLEcp63AsjQtEZA51gr8E1Vc6bp39ogw@mail.gmail.com>
References: <1471866172-64154-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:33442 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755258AbcHVN5y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2016 09:57:54 -0400
Received: by mail-lf0-f52.google.com with SMTP id b199so78492131lfe.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2016 06:57:44 -0700 (PDT)
In-Reply-To: <1471866172-64154-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, Anisse Astier <anisse@astier.eu>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Aug 22, 2016 at 1:42 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> The Cherryview GPIO controller has 8 or 16 wires connected to the I/O-APIC
> which can be used directly by the platform/BIOS or drivers. One such wire
> is used as SCI (System Control Interrupt) which ACPI depends on to be able
> to trigger GPEs (General Purpose Events).
>
> The pinctrl driver itself uses another IRQ resource which is wire OR of all
> the 8 (or 16) wires and follows what BIOS has programmed to the IntSel
> register of each pin.
>
> Currently the driver masks all interrupts at probe time and this prevents
> these direct interrupts from working as expected. The reason for this is
> that some early stage prototypes had some pins misconfigured causing lots
> of spurious interrupts.
>
> We fix this by leaving the interrupt mask untouched. This allows SCI and
> other direct interrupts work properly. What comes to the possible spurious
> interrupts we switch the default handler to be handle_bad_irq() instead of
> handle_simple_irq() (which was not correct anyway).
>
> Reported-by: Yu C Chen <yu.c.chen@intel.com>
> Reported-by: Anisse Astier <anisse@astier.eu>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied for fixes.

Yours,
Linus Walleij
