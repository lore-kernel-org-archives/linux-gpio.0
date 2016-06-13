From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] pinctrl: cherryview: add option to set open-drain
 pin config
Date: Mon, 13 Jun 2016 14:25:20 +0200
Message-ID: <CACRpkdYdi7zfyTLwV+L2y3mOkTYqxSB2Yto_3ROymez3RQedRA@mail.gmail.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
 <1465561416-29732-1-git-send-email-dan@emutex.com> <1465561416-29732-3-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:35329 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161111AbcFMMZV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2016 08:25:21 -0400
Received: by mail-oi0-f49.google.com with SMTP id w5so125437682oib.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jun 2016 05:25:21 -0700 (PDT)
In-Reply-To: <1465561416-29732-3-git-send-email-dan@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jun 10, 2016 at 2:23 PM, Dan O'Donovan <dan@emutex.com> wrote:

> On some CHV platforms, we need an option to configure the
> open-drain setting for these pins.  This adds support for the
> PIN_CONFIG_DRIVE_PUSH_PULL and PIN_CONFIG_DRIVE_OPEN_DRAIN to
> disable/enable open-drain mode for a specific pin.
>
> Signed-off-by: Dan O'Donovan <dan@emutex.com>

Patch applied.

Yours,
Linus Walleij
