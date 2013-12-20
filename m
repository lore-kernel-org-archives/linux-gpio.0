From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: add GPIO support for SMSC SCH311x
Date: Fri, 20 Dec 2013 10:10:25 +0100
Message-ID: <CACRpkdZmYGSDFbGTrYj9sSLVb5Zp0Ga1S+LYF9rh7UCSWU2xoQ@mail.gmail.com>
References: <1386201403-25664-1-git-send-email-br1@einfach.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:43235 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754613Ab3LTJK0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Dec 2013 04:10:26 -0500
Received: by mail-oa0-f52.google.com with SMTP id h16so2509274oag.39
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2013 01:10:25 -0800 (PST)
In-Reply-To: <1386201403-25664-1-git-send-email-br1@einfach.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bruno Randolf <br1@einfach.org>
Cc: Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>

On Thu, Dec 5, 2013 at 12:56 AM, Bruno Randolf <br1@einfach.org> wrote:

> This patch adds support for the GPIOs found on the SMSC "Super I/
> SCH311x.
>
> The chip detection and I/O functions are copied from sch311x_wdt.
>
> Signed-off-by: Bruno Randolf <br1@einfach.org>

I have now concluded that this is the best we can do, and Matthew
seems to be sort-of-OK with this, so patch applied so that we get
some linux-next rotation of this.

Thanks for your efforts on this driver Bruno!

Yours,
Linus Walleij
