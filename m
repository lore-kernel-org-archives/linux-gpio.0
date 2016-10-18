From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: Only restore pins that are used by the driver
Date: Tue, 18 Oct 2016 14:39:56 +0200
Message-ID: <CACRpkdYVg1jcZ=R1cwP44T=N8oMQhBk_B4_3c-NZKrW9MQTA-A@mail.gmail.com>
References: <CAFv23Q=_wSqhBE9ni9YmtxyEKFSENLYZ512Ent9iyWd7hv3gYg@mail.gmail.com>
 <20161010133931.88055-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f169.google.com ([209.85.216.169]:36793 "EHLO
        mail-qt0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754454AbcJRMj6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2016 08:39:58 -0400
Received: by mail-qt0-f169.google.com with SMTP id m5so150626791qtb.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2016 05:39:58 -0700 (PDT)
In-Reply-To: <20161010133931.88055-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, AceLan Kao <acelan.kao@canonical.com>, Calvin Johnson <linux.cj@gmail.com>, Mario.Limonciello@dell.com, Jared.Dominguez@dell.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Oct 10, 2016 at 3:39 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> Dell XPS 13 (and maybe some others) uses a GPIO (CPU_GP_1) during suspend
> to explicitly disable USB touchscreen interrupt. This is done to prevent
> situation where the lid is closed the touchscreen is left functional.
>
> The pinctrl driver (wrongly) assumes it owns all pins which are owned by
> host and not locked down. It is perfectly fine for BIOS to use those pins
> as it is also considered as host in this context.
>
> What happens is that when the lid of Dell XPS 13 is closed, the BIOS
> configures CPU_GP_1 low disabling the touchscreen interrupt. During resume
> we restore all host owned pins to the known state which includes CPU_GP_1
> and this overwrites what the BIOS has programmed there causing the
> touchscreen to fail as no interrupts are reaching the CPU anymore.
>
> Fix this by restoring only those pins we know are explicitly requested by
> the kernel one way or other.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=176361
> Reported-by: AceLan Kao <acelan.kao@canonical.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied and tagged for stable. Also added Tested-by from
AceLan.

Yours,
Linus Walleij
