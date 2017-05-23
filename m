From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] pinctrl: cherryview: Extend the Chromebook DMI
 quirk to Intel_Strago systems
Date: Tue, 23 May 2017 10:09:23 +0200
Message-ID: <CACRpkdbcPMMvvAsdwgVrcGsv8--D15mRXU4XOOqJ+Owhp=W-+g@mail.gmail.com>
References: <20170517102514.89744-1-mika.westerberg@linux.intel.com> <20170517102514.89744-4-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:34002 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966540AbdEWIJd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2017 04:09:33 -0400
Received: by mail-io0-f169.google.com with SMTP id k91so92449278ioi.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2017 01:09:24 -0700 (PDT)
In-Reply-To: <20170517102514.89744-4-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kelly French <kfrench@federalhill.net>

On Wed, May 17, 2017 at 12:25 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> It turns out there are quite many Chromebooks out there that have the
> same keyboard issue than Acer Chromebook. All of them are based on
> Intel_Strago reference and report their DMI_PRODUCT_FAMILY as
> "Intel_Strago" (Samsung Chromebook 3 and Cyan Chromebooks are exceptions
> for which we add separate entries).
>
> Instead of adding each machine to the quirk table, we use
> DMI_PRODUCT_FAMILY of "Intel_Strago" that hopefully covers most of the
> machines out there currently.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=194945
> Suggested: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied with Andy's review tag.

Yours,
Linus Walleij
