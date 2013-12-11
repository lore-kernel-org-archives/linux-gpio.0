From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] gpio: add GPIO support for SMSC SCH311x
Date: Wed, 11 Dec 2013 13:24:34 +0100
Message-ID: <CACRpkdb0z9GgLVhYESJ8NyEZXTXctpyHjrA6dC3A0wn+X7fnGw@mail.gmail.com>
References: <1386201717-25815-1-git-send-email-br1@einfach.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:37525 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751058Ab3LKMYg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2013 07:24:36 -0500
Received: by mail-oa0-f42.google.com with SMTP id i4so7203305oah.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2013 04:24:35 -0800 (PST)
In-Reply-To: <1386201717-25815-1-git-send-email-br1@einfach.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bruno Randolf <br1@einfach.org>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>

On Thu, Dec 5, 2013 at 1:01 AM, Bruno Randolf <br1@einfach.org> wrote:
> This patch adds support for the GPIOs found on the SMSC "Super I/O" chips
> SCH3112, SCH3114 and SCH3116.
>
> The chip detection and I/O functions are copied from sch311x_wdt.
>
> Signed-off-by: Bruno Randolf <br1@einfach.org>
>
> ---
> Notes (v4):
> - All GPIOs are now supported, driver data is runtime allocated
>   and I tried to address all comments as far as possible.
> - Still a platform device is registered, similar to gpio-f7188x.c
> - found variable removed
> - fixed devm_zalloc
> - fixed commit message

I'm basically happy with this version, but I want to hash out
a strategy for handling this type of devices with the x86
platform device maintainer, Matthew, so allow me a few more
days to think about this.

Yours,
Linus Walleij
