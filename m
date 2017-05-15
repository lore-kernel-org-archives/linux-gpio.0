From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: cherryview: Extend the Chromebook DMI quirk
 to Intel_Strago systems
Date: Mon, 15 May 2017 15:26:19 -0700
Message-ID: <CAKdAkRRp0M8sKHN+Q2icVkqk-CvUxTVh5cRkx2Jkn=pP=VtgKw@mail.gmail.com>
References: <20170515110103.59765-1-mika.westerberg@linux.intel.com>
 <20170515110103.59765-4-mika.westerberg@linux.intel.com> <1494846878.6967.58.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ua0-f180.google.com ([209.85.217.180]:35135 "EHLO
        mail-ua0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751253AbdEOW0V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 May 2017 18:26:21 -0400
In-Reply-To: <1494846878.6967.58.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Jean Delvare <jdelvare@suse.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, lkml <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, May 15, 2017 at 4:14 AM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, 2017-05-15 at 14:01 +0300, Mika Westerberg wrote:
>> It turns out there are quite many Chromebooks out there that have the
>> same keyboard issue than Acer Chromebook. All of them are based on
>> Intel_Strago reference and report their DMI_PRODUCT_FAMILY as
>> "Intel_Strago" (Samsung Chromebook 3 and Cyan Chromebooks are
>> exceptions
>> for which we add separate entries).
>>
>> Instead of adding each machine to the quirk table, we use
>> DMI_PRODUCT_FAMILY of "Intel_Strago" that hopefully covers most of the
>> machines out there currently.
>>
>>
>
>> +             .ident = "Intel_Strago based Chromebooks",
>
>> +             .ident = "Cyan Chromebook",
>
>> +             .ident = "Samsung Chromebook 3",
>
> I would do something like below (though I'm fine with current as well).
>
>         .ident = "Intel_Strago based Chromebooks (All models)",
>         .ident = "Intel_Strago based Chromebooks (Cyan)",

I think this one should be "Acer Chromebook R11 (Cyan)"

Thanks.

-- 
Dmitry
