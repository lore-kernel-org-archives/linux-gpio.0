From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: nsp-gpio: fix non-static functions
Date: Wed, 8 Jun 2016 14:06:37 +0200
Message-ID: <CACRpkdbFHnvigLtEB+2kQmX79+mrrHKCSYcmjSdKkm-asEfd3w@mail.gmail.com>
References: <1465318695-23348-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36654 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751664AbcFHMGj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2016 08:06:39 -0400
Received: by mail-oi0-f47.google.com with SMTP id p204so8756796oih.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jun 2016 05:06:38 -0700 (PDT)
In-Reply-To: <1465318695-23348-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>

On Tue, Jun 7, 2016 at 6:58 PM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:

> Fixup warnings from functions that are not exported and
> therefore should be marked static. Fixes:
>
> drivers/pinctrl/bcm/pinctrl-nsp-gpio.c:461:5: warning: symbol 'nsp_pin_config_group_get' was not declared. Should it be static?
> drivers/pinctrl/bcm/pinctrl-nsp-gpio.c:467:5: warning: symbol 'nsp_pin_config_group_set' was not declared. Should it be static?
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Patch applied for fixes with Ray's ACK.

Yours,
Linus Walleij
