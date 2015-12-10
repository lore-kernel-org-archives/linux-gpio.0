From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3 2/2] pinctrl: intel: fix bug of register offset calculation
Date: Thu, 10 Dec 2015 22:58:44 +0100
Message-ID: <CACRpkdZjYn78f9+Q8GO0tb8kHDZNk=bz+_SDBfgQ7GCvRcmsMg@mail.gmail.com>
References: <1448471391-1115-1-git-send-email-qipeng.zha@intel.com>
	<1448471391-1115-2-git-send-email-qipeng.zha@intel.com>
	<CACRpkdY5Jp25FRpE6hDYeVaS2W2Jp9jkV1amFpFCJkmQi4Nw3w@mail.gmail.com>
	<20151210090432.GC1766@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:33207 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750834AbbLJV6p (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 16:58:45 -0500
Received: by obbsd4 with SMTP id sd4so19677826obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 13:58:45 -0800 (PST)
In-Reply-To: <20151210090432.GC1766@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Westerberg, Mika" <mika.westerberg@intel.com>
Cc: Qipeng Zha <qipeng.zha@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Qi Zheng <qi.zheng@intel.com>

On Thu, Dec 10, 2015 at 10:04 AM, Westerberg, Mika
<mika.westerberg@intel.com> wrote:
> On Tue, Dec 01, 2015 at 11:16:45AM +0100, Linus Walleij wrote:
>> On Wed, Nov 25, 2015 at 6:09 PM, Qipeng Zha <qipeng.zha@intel.com> wrote:
>>
>> > The group size for registers PADCFGLOCK, HOSTSW_OWN, GPI_IS,
>> > GPI_IE, are not 24 for Broxton, Add a parameter to allow
>> > different platform to set correct value.
>> >
>> > ---
>> > change in v3:
>> >  use community->gpp_size directly, not macro.
>> >
>> > change in v2:
>> >  define gpp_size for sunrisepoint in its private structure.
>> >
>> > Signed-off-by: Qi Zheng <qi.zheng@intel.com>
>> > Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
>>
>> Patch applied. For 4.5 since I can't figure out if this is
>> a regression or not.
>
> Broxton support was added in v4.4 so it would be nice if these patches
> could get still into v4.4.

Yeah I queued it for fixes, but missed to apply 1/2, fixing it up now.

Yours,
Linus Walleij
