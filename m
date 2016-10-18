From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: add blacklist list for XPS machines
Date: Tue, 18 Oct 2016 14:43:25 +0200
Message-ID: <CACRpkdb5qT2E+pm72g55hZYEmQQGPtNi-2UOQFY48X+Ecw=MUw@mail.gmail.com>
References: <1475647025-25617-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:35917 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759140AbcJRMn0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2016 08:43:26 -0400
Received: by mail-qk0-f176.google.com with SMTP id o68so335853361qkf.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2016 05:43:26 -0700 (PDT)
In-Reply-To: <1475647025-25617-1-git-send-email-acelan.kao@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Oct 5, 2016 at 7:57 AM, AceLan Kao <acelan.kao@canonical.com> wrote:

> The touchscreen on some Dell machines stop working after
> closing and opening the lid after this driver is introduced.
> So, I add a dmi list to black out those machines that doesn't
> work well with this driver.
>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>

Is this patch still needed after Mika's thorough fix?

I guess not?

Yours,
Linus Walleij
