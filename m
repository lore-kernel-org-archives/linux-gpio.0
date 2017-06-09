From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] pinctrl: cherryview: Add terminate entry for
 dmi_system_id tables
Date: Fri, 9 Jun 2017 10:53:19 +0200
Message-ID: <CACRpkdaELvhyNQOhJB=_UeiThwK65HLuTRFakDovJZ3Kvi2pLg@mail.gmail.com>
References: <20170517102514.89744-1-mika.westerberg@linux.intel.com>
 <20170517102514.89744-3-mika.westerberg@linux.intel.com> <20170601113050.6b216736@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:34526 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751633AbdFIIxV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 04:53:21 -0400
Received: by mail-io0-f174.google.com with SMTP id i7so30439915ioe.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2017 01:53:20 -0700 (PDT)
In-Reply-To: <20170601113050.6b216736@endymion>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kelly French <kfrench@federalhill.net>

On Thu, Jun 1, 2017 at 11:30 AM, Jean Delvare <jdelvare@suse.de> wrote:
> On Wed, 17 May 2017 13:25:13 +0300, Mika Westerberg wrote:
>> From: Wei Yongjun <weiyongjun1@huawei.com>
>>
>> Make sure dmi_system_id tables are NULL terminated.
>>
>> Fixes: 703650278372 ("pinctrl: cherryview: Add a quirk to make Acer Chromebook keyboard work again")
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
(...)
>
> This should go to stable trees IMHO.

It is already upstream, but you can suggest directly to Greg to pick it to
the stable trees.

Yours,
Linus Walleij
