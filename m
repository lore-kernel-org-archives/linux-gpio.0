From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: intel: merrifield: Add missed check in mrfld_config_set()
Date: Thu, 26 Jan 2017 15:33:38 +0100
Message-ID: <CACRpkdZv2a2Vft0sO_QL-RFX2VQGR14V2VXnc+bjhUrKjb6ecg@mail.gmail.com>
References: <20170124152822.17170-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:35855 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752906AbdAZOdk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2017 09:33:40 -0500
Received: by mail-it0-f44.google.com with SMTP id c7so129836532itd.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2017 06:33:40 -0800 (PST)
In-Reply-To: <20170124152822.17170-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Tue, Jan 24, 2017 at 4:28 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Not every pin can be configured. Add missed check to prevent access
> violation.
>
> Fixes: 4e80c8f50574 ("pinctrl: intel: Add Intel Merrifield pin controller support")
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied for fixes.

Yours,
Linus Walleij
