From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 0/2] gpiolib, sfi: introduce SFI GPIO helpers
Date: Tue, 7 Jan 2014 17:42:49 +0100
Message-ID: <CACRpkdYcx8HXjDL1EyjkmE82bf4XfW2BEeoMMFCn=oC9-GPFYw@mail.gmail.com>
References: <1386681680-18324-1-git-send-email-andriy.shevchenko@linux.intel.com>
	<CACRpkdZjWg6DU75NuAW9QTFBcfXW8e9EuksL1cRCG-v-LHh78w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:58523 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751868AbaAGQmt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2014 11:42:49 -0500
Received: by mail-oa0-f43.google.com with SMTP id m1so436219oag.16
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2014 08:42:49 -0800 (PST)
In-Reply-To: <CACRpkdZjWg6DU75NuAW9QTFBcfXW8e9EuksL1cRCG-v-LHh78w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Len Brown <lenb@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>

On Fri, Dec 20, 2013 at 10:02 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Tue, Dec 10, 2013 at 2:21 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>
>> Here is a sixth [1] version of the SFI GPIO helpers. This series contains SFI
>> GPIO helpers along with the update of GPIO library to lookup for SFI resources.
>>
>> It has been tested on Medfield device on top of recent linux-next-20131210 +
>> Mika's ACPI gpio patches [2].
>
> This is still stalled due to no response from the SFI maintainer, Len
> can you please look at this series, if you ACK them I'm happy to take
> the whole series through the GPIO tree.

Ping on this.

Yours,
Linus Walleij
