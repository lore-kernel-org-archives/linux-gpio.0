From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] pinctrl: intel: Add Intel Denverton pin controller support
Date: Thu, 3 Aug 2017 20:00:06 +0300
Message-ID: <CAHp75Vdn_76PHpa+0o0hP==rEh2Y2JrqVLNgkhaOn=ED8RWQMw@mail.gmail.com>
References: <20170803163602.61121-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f174.google.com ([209.85.216.174]:35076 "EHLO
        mail-qt0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751966AbdHCRAJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2017 13:00:09 -0400
In-Reply-To: <20170803163602.61121-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Aug 3, 2017 at 7:36 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> This driver adds pinctrl/GPIO support for Intel Denverton SoC. The GPIO
> controller is based on the same hardware design that is already used in
> Intel Sunrisepoint so we leverage the core driver here.

I would like to double check a pin list.

-- 
With Best Regards,
Andy Shevchenko
