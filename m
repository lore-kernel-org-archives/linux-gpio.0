From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 6/6] mfd: lpc_ich: Add support for Intel Apollo Lake
 GPIO pinctrl in non-ACPI system
Date: Thu, 20 Oct 2016 13:57:02 +0200
Message-ID: <CACRpkdZNMqb34_53PyRDHm9BkJXUzWBPX29w7SE7kHB_7SvZXA@mail.gmail.com>
References: <1476255066-22653-1-git-send-email-jui.nee.tan@intel.com> <1476255066-22653-7-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:35272 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754652AbcJTL5I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2016 07:57:08 -0400
Received: by mail-qk0-f171.google.com with SMTP id z190so89094979qkc.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2016 04:57:08 -0700 (PDT)
In-Reply-To: <1476255066-22653-7-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, Lee Jones <lee.jones@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, jonathan.yong@intel.com, ong.hock.yu@intel.com, Tony Luck <tony.luck@intel.com>, wan.ahmad.zainie.wan.mohamad@intel.com

On Wed, Oct 12, 2016 at 8:51 AM, Tan Jui Nee <jui.nee.tan@intel.com> wrote:

> This driver uses the P2SB hide/unhide mechanism cooperatively
> to pass the PCI BAR address to the gpio platform driver.
>
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>

Looks like a pure MFD patch so even if it mentions GPIO/pinctrl I
leave this to Lee.

Yours,
Linus Walleij
