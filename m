From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] pinctrl: intel: unlock on error in intel_config_set_pull()
Date: Mon, 13 Feb 2017 15:42:56 +0100
Message-ID: <CACRpkda2EDT6TC96jBVBTmWjRg04TroVtuhb6w+Rw42V3wa=6A@mail.gmail.com>
References: <20170207132008.GD31552@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:37866 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751703AbdBMOnA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2017 09:43:00 -0500
Received: by mail-it0-f54.google.com with SMTP id x75so7458638itb.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Feb 2017 06:42:59 -0800 (PST)
In-Reply-To: <20170207132008.GD31552@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Feb 7, 2017 at 2:20 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We need to unlock before returning -EINVAL on this error path.
>
> Fixes: 04cc058f0c52 ("pinctrl: intel: Add support for 1k additional pull-down")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied as obviously correct.

Yours,
Linus Walleij
