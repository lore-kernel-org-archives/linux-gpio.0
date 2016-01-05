From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: lantiq: 2 pins have the wrong mux list
Date: Tue, 5 Jan 2016 14:19:22 +0100
Message-ID: <CACRpkdbu2WtMofKx2Ot8zGbomwoqEEWvJYoCLCVUvh7kn7jFVw@mail.gmail.com>
References: <1451942879-43265-1-git-send-email-blogic@openwrt.org>
	<CACRpkdZbJBTW2WbzR0K+afTvvP_y2scjtnnJv3frLfU5ki_b2w@mail.gmail.com>
	<568B9698.6060101@openwrt.org>
	<751f45beafad43adad6f0181d73ef154@TDT-MS.TDTNET.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36187 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751472AbcAENTX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2016 08:19:23 -0500
Received: by mail-oi0-f51.google.com with SMTP id o62so268343663oif.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2016 05:19:23 -0800 (PST)
In-Reply-To: <751f45beafad43adad6f0181d73ef154@TDT-MS.TDTNET.local>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Schiller <mschiller@tdt.de>
Cc: John Crispin <blogic@openwrt.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 5, 2016 at 1:59 PM, Martin Schiller <mschiller@tdt.de> wrote:
> On 01/05/2016 at 11:10 AM, John Crispin wrote:
>>
>>
>> On 05/01/2016 11:03, Linus Walleij wrote:
>> > On Mon, Jan 4, 2016 at 10:27 PM, John Crispin <blogic@openwrt.org>
>> wrote:
>> >
>> >> The latest vendor SDK contained this patch.
>> >>
>> >> Signed-off-by: John Crispin <blogic@openwrt.org>
>> >
>> > Patch applied. Had to rebase it manually for some reason.
>> >
>> > Yours,
>> > Linus Walleij
>> >
>>
>>
>> weird, it was generated using git on top of v4.4-rc7
>
> I think that's because of the changes submitted by me, which are not in
> the official v4.4-rc7 so far:
>
> https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-pinctrl.git/commit/drivers/pinctrl/pinctrl-xway.c?h=devel&id=be14811c03cf20c793fd176a347625335110b0e6

I found the mess, of course it's my own fault. I merged some patches
into the pin control tree and some into the GPIO tree and that combined
with my massive refactorings is a mess.

I did some reverting and moving patches between the trees and
now it should merge up in linux-next all right.

Yours,
Linus Walleij
