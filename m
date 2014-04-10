From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Oops in acpi_gpiochip_add on MacBookPro with Linux v3.14-12042-g69cd9eba3886
Date: Thu, 10 Apr 2014 20:47:23 +0200
Message-ID: <CACRpkdaBg5KjvksHRB3z2R6KehYcFC=4MEHedfcE6tP4GTh+Qw@mail.gmail.com>
References: <CA+5PVA5VBns=hkOSViucrpT340uG0=hgrWqf=LYHTBFAe74tBg@mail.gmail.com>
	<CACna6ry+FOYykZpzycEjDA+ncGNLk6eXkwadXy548h9dgU1Bgw@mail.gmail.com>
	<CA+5PVA4ijLmwRKHD4RYE6qSqkN7p8v1GB9w9GAGAJKG45bBTnw@mail.gmail.com>
	<20140410124045.GX19349@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:63659 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759007AbaDJSrX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Apr 2014 14:47:23 -0400
Received: by mail-oa0-f52.google.com with SMTP id l6so4985233oag.11
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2014 11:47:23 -0700 (PDT)
In-Reply-To: <20140410124045.GX19349@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Josh Boyer <jwboyer@fedoraproject.org>, =?ISO-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

On Thu, Apr 10, 2014 at 2:40 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Thu, Apr 10, 2014 at 08:22:12AM -0400, Josh Boyer wrote:
>> On Thu, Apr 10, 2014 at 2:50 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>> > 2014-04-09 23:09 GMT+02:00 Josh Boyer <jwboyer@fedoraproject.org>:
>> >> With Linux v3.14-12042-g69cd9eba3886 I get an oops from the bcma
>> >> module on the MacBookPro 10,2 I have here.  This works fine with =
Linux
>> >> v3.14-7333-g59ecc26004e7.  There have been no changes between tho=
se
>> >> two versions to bcma itself, but the GPIO merge did go in that wi=
ndow.
>> >>  I can attempt to do a bisect tomorrow, but looking over some of =
the
>> >> GPIO commits it seems pretty relevant to the ACPI GPIO changes.  =
I'm
>> >> hoping someone here has an idea on what the issue might be and ha=
s
>> >> some possible things for me to test for fixes.
>> >
>> > Bug report: https://lkml.org/lkml/2014/3/24/262
>> > Patch: https://lkml.org/lkml/2014/3/24/293
>> > Tested by Sabrina: https://lkml.org/lkml/2014/3/24/304
>> > (all links are for the same thread).
>> >
>> > Now you simply have to find above patch in some git tree :) Not su=
re
>> > if it's already in Linus's one.
>>
>> Ah, wonderful.  I now wish I would have found those in my searching
>> before doing the bisect.  Oh well.  For what it's worth, my bisect
>> landed on the same commit.
>>
>> The fix isn't in Linus' tree or linux-next.  I'm guessing Mika is
>> either still on vacation, or hasn't sent out the formal fix yet.
>
> No, not on vacation anymore (unfortunately). I did send the formal pa=
tch
> already:
>
> https://lkml.org/lkml/2014/3/31/135
>
> but it isn't merged to Linus' GPIO tree yet.

I've queued this for fixes!

Will send upstream ASAP.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
