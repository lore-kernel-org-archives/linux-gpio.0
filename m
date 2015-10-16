From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: intel: Fix compilation warning when !CONFIG_PM_SLEEP
Date: Fri, 16 Oct 2015 22:54:06 +0200
Message-ID: <CACRpkdavbrZSL3Rckj0zxq4N09=S6dPGt8RN+VGEepCY2-OY-g@mail.gmail.com>
References: <1444747886-70568-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:32798 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754011AbbJPUyH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 16:54:07 -0400
Received: by oiad129 with SMTP id d129so8761236oia.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 13:54:06 -0700 (PDT)
In-Reply-To: <1444747886-70568-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Oct 13, 2015 at 4:51 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> We get following warning when CONFIG_PM_SLEEP is not set
>
>   warning: =E2=80=98intel_gpio_irq_init=E2=80=99 defined but not used=
 [-Wunused-function]
>
> Since the function is only called from intel_pinctrl_resume() move it
> inside CONFIG_PM_SLEEP guard as well.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
