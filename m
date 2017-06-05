From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: Add support for Intel Cannon Lake PCH
Date: Mon, 5 Jun 2017 18:20:50 +0300
Message-ID: <CAHp75VedMd9+-Z+1m49AqBOzHj3qPxw08B4BKOpyKvNntTU_bg@mail.gmail.com>
References: <20170605125650.64188-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:36759 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751215AbdFEPU4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2017 11:20:56 -0400
In-Reply-To: <20170605125650.64188-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jun 5, 2017 at 3:56 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Hi,
>
> This series adds support for the pinctrl and GPIO hardware found on the
> next generation Intel Cannon Lake CPUs. We also update the Intel core
> pinctrl driver with a concept of hardware pad groups that are needed by the
> new driver and make it possible to specify mode per pin instead of the
> whole group.
>

One comment to be considered, otherwise

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Mika Westerberg (3):
>   pinctrl: intel: Add support for variable size pad groups
>   pinctrl: intel: Make it possible to specify mode per pin in a group
>   pinctrl: intel: Add Intel Cannon Lake PCH pin controller support
>
>  drivers/pinctrl/intel/Kconfig                |   8 +
>  drivers/pinctrl/intel/Makefile               |   1 +
>  drivers/pinctrl/intel/pinctrl-cannonlake.c   | 442 +++++++++++++++++++++++++++
>  drivers/pinctrl/intel/pinctrl-intel.c        | 195 ++++++++----
>  drivers/pinctrl/intel/pinctrl-intel.h        |  64 +++-
>  drivers/pinctrl/intel/pinctrl-sunrisepoint.c |   1 +
>  6 files changed, 647 insertions(+), 64 deletions(-)
>  create mode 100644 drivers/pinctrl/intel/pinctrl-cannonlake.c
>
> --
> 2.11.0
>



-- 
With Best Regards,
Andy Shevchenko
