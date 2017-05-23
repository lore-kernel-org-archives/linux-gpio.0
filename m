From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] firmware: dmi: Add DMI_PRODUCT_FAMILY
 identification string
Date: Tue, 23 May 2017 10:05:59 +0200
Message-ID: <CACRpkdY1pdBiCCRo=RcNzY4b9T89E+A-WdPF9d8otH8fWhr+Dg@mail.gmail.com>
References: <20170517102514.89744-1-mika.westerberg@linux.intel.com> <20170517102514.89744-2-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:35676 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757355AbdEWIGB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2017 04:06:01 -0400
Received: by mail-io0-f181.google.com with SMTP id f102so91881916ioi.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2017 01:06:01 -0700 (PDT)
In-Reply-To: <20170517102514.89744-2-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kelly French <kfrench@federalhill.net>

On Wed, May 17, 2017 at 12:25 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> Sometimes it is more convenient to be able to match a whole family of
> products, like in case of bunch of Chromebooks based on Intel_Strago to
> apply a driver quirk instead of quirking each machine one-by-one.
>
> This adds support for DMI_PRODUCT_FAMILY identification string and also
> exports it to the userspace through sysfs attribute just like the
> existing ones.
>
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

OK patch applied for fixes with Andy's Review tag.

Didn't see this v2 first, sorry.

Andy's nod make me feel confident to merge this into firmware.

Yours,
Linus Walleij
