From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: remove redundant pin < 0 check on unsigned int
Date: Wed, 18 Jan 2017 10:24:52 +0100
Message-ID: <CACRpkdYk=LSKzzQuVfLSsoxPtoOy5tHqFZ-gce_CUXjqOiawKQ@mail.gmail.com>
References: <20170113132039.19830-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f179.google.com ([209.85.216.179]:36383 "EHLO
        mail-qt0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751659AbdARJYx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2017 04:24:53 -0500
Received: by mail-qt0-f179.google.com with SMTP id k15so6232507qtg.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2017 01:24:53 -0800 (PST)
In-Reply-To: <20170113132039.19830-1-colin.king@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jan 13, 2017 at 2:20 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> pin is an unsigned int and therefore can never be < 0 so
> this check is redudant. Remove the check and the associated
> dev_err error message.
>
> Fixes CoverityScan CID#1396438 ("Unsigned compared against 0")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Fixed up speling & commit topic and applied with
Nishanth's ACK!

Yours,
Linus Walleij
