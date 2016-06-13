From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] pinctrl: cherryview: add handlers for pin_config_group_get/set
Date: Mon, 13 Jun 2016 14:26:48 +0200
Message-ID: <CACRpkdYUhktTTWk05bWqysp86EZCMyyupfzOGuDXALR8nOPhPA@mail.gmail.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
 <1465561416-29732-1-git-send-email-dan@emutex.com> <1465561416-29732-4-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:35349 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964968AbcFMM0t (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2016 08:26:49 -0400
Received: by mail-oi0-f49.google.com with SMTP id w5so125490649oib.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jun 2016 05:26:49 -0700 (PDT)
In-Reply-To: <1465561416-29732-4-git-send-email-dan@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jun 10, 2016 at 2:23 PM, Dan O'Donovan <dan@emutex.com> wrote:

> Pin config get/set handlers for pin groups were previously not
> implemented by this driver.  The pin_config_group_set is
> particularly useful for applying a common config setting to all
> pins in a specified group with a single call, without the caller
> needing to reference each individual pin by name.
>
> Signed-off-by: Dan O'Donovan <dan@emutex.com>

Patch applied.

Yours,
Linus Walleij
