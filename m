From: Josh Boyer <jwboyer-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Subject: Re: Oops in acpi_gpiochip_add on MacBookPro with Linux v3.14-12042-g69cd9eba3886
Date: Thu, 10 Apr 2014 08:52:28 -0400
Message-ID: <CA+5PVA52wqaRezzhn2Oqb1FM-yuVsbD4eQq422sXRrpLbfzRbA@mail.gmail.com>
References: <CA+5PVA5VBns=hkOSViucrpT340uG0=hgrWqf=LYHTBFAe74tBg@mail.gmail.com>
	<CACna6ry+FOYykZpzycEjDA+ncGNLk6eXkwadXy548h9dgU1Bgw@mail.gmail.com>
	<CA+5PVA4ijLmwRKHD4RYE6qSqkN7p8v1GB9w9GAGAJKG45bBTnw@mail.gmail.com>
	<20140410124045.GX19349@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140410124045.GX19349-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: =?ISO-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 10, 2014 at 8:40 AM, Mika Westerberg
<mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> On Thu, Apr 10, 2014 at 08:22:12AM -0400, Josh Boyer wrote:
>> On Thu, Apr 10, 2014 at 2:50 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>> > 2014-04-09 23:09 GMT+02:00 Josh Boyer <jwboyer-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>:
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

Ah, ok great.  I'll test that today.  Thanks.

josh
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
