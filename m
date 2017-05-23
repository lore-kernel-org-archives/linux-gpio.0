From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] pinctrl: cherryview: Add terminate entry for
 dmi_system_id tables
Date: Tue, 23 May 2017 10:08:05 +0200
Message-ID: <CACRpkdYgZB1AvGTNoF8ydiKfraDoH3PGVbSU3XLCdLVeCbWkZQ@mail.gmail.com>
References: <20170517102514.89744-1-mika.westerberg@linux.intel.com> <20170517102514.89744-3-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:33050 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965256AbdEWIIH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2017 04:08:07 -0400
Received: by mail-io0-f173.google.com with SMTP id p24so92485915ioi.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2017 01:08:07 -0700 (PDT)
In-Reply-To: <20170517102514.89744-3-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kelly French <kfrench@federalhill.net>

On Wed, May 17, 2017 at 12:25 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> Make sure dmi_system_id tables are NULL terminated.
>
> Fixes: 703650278372 ("pinctrl: cherryview: Add a quirk to make Acer Chromebook keyboard work again")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

I already had this patch queued.

Yours,
Linus Walleij
