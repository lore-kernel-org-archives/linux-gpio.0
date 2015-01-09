From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 15/28] pinctrl: intel: drop owner assignment from platform_drivers
Date: Fri, 9 Jan 2015 10:48:31 +0100
Message-ID: <CACRpkdajZWaJzirP=qeSGZMjn2kB4MZCPzH30r=WP4CLFYoDkQ@mail.gmail.com>
References: <1419196495-9626-1-git-send-email-wsa@the-dreams.de>
	<1419196495-9626-16-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:64709 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932145AbbAIJsd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jan 2015 04:48:33 -0500
Received: by mail-ie0-f180.google.com with SMTP id rp18so14119757iec.11
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2015 01:48:32 -0800 (PST)
In-Reply-To: <1419196495-9626-16-git-send-email-wsa@the-dreams.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Dec 21, 2014 at 10:14 PM, Wolfram Sang <wsa@the-dreams.de> wrote:

> This platform_driver does not need to set an owner, it will be populated by the
> driver core.
>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Patch applied.

Yours,
Linus Walleij
