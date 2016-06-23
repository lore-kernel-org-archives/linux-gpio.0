From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/3] x86/platform/p2sb: New Primary to Sideband bridge
 support driver for Intel SOC's
Date: Thu, 23 Jun 2016 10:45:01 +0200
Message-ID: <CACRpkdZ_RNr4tkwQn6u1sE=PqXMHC-jZA0MO=OijjvS7E+M2Lg@mail.gmail.com>
References: <1466485831-20416-1-git-send-email-jui.nee.tan@intel.com> <1466485831-20416-3-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:33423 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751665AbcFWIpD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 04:45:03 -0400
Received: by mail-oi0-f53.google.com with SMTP id u201so60155894oie.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2016 01:45:02 -0700 (PDT)
In-Reply-To: <1466485831-20416-3-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, Lee Jones <lee.jones@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

On Tue, Jun 21, 2016 at 7:10 AM, Tan Jui Nee <jui.nee.tan@intel.com> wrote:

> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> There is already one and at least one more user coming which
> require an access to Primary to Sideband bridge (P2SB) in order
> to get IO or MMIO bar hidden by BIOS.
> Create a driver to access P2SB for x86 devices.
>
> Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> Changes in V4:
>         - Move Kconfig option CONFIG_X86_INTEL_NON_ACPI from
>           [PATCH 2/3] x86/platform/p2sb: New Primary to Sideband bridge support driver for Intel SOC's
>           to
>           [PATCH 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake GPIO pinctrl in non-ACPI system
>           since the config is used in latter patch.

Waiting for a respin in accordance with Mika's comments.

You don't need to resend patch 1/3 it is already applied.

Yours,
Linus Walleij
