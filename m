From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/3] pinctrl: cherryview: Convert to use devm_gpiochip_add_data()
Date: Fri, 23 Sep 2016 15:00:11 +0200
Message-ID: <CACRpkdaCrfgUNb_=S2HK0_hQg57gWSqf3U8aRf_6C-EqcK6EpQ@mail.gmail.com>
References: <20160920121523.170293-1-mika.westerberg@linux.intel.com> <20160920121523.170293-4-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:33588 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757964AbcIWNAM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2016 09:00:12 -0400
Received: by mail-oi0-f41.google.com with SMTP id r126so133073804oib.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2016 06:00:12 -0700 (PDT)
In-Reply-To: <20160920121523.170293-4-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 20, 2016 at 2:15 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> This simplifies the error handling and allows us to drop the whole
> chv_pinctrl_remove() function.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
