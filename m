From: Martin Langhoff <martin.langhoff@gmail.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Mon, 28 Mar 2016 16:57:04 -0400
Message-ID: <CACPiFC+7m_ePr59M=upxsjXF1f0Z8uLcOiy58DDCcOpOA-rhyA@mail.gmail.com>
References: <CACPiFCKv=QJ0t5e=9Wm4cC4Spynx-tVCiabL7AcbcOkp_w47fQ@mail.gmail.com>
 <20160322152218.GA2099@lahna.fi.intel.com> <CACPiFC+hDF0+9vPCrhvo079E6RCVVmZXTS1ziS-jHAAZJQ+wNg@mail.gmail.com>
 <20160322154950.GB2099@lahna.fi.intel.com> <CACPiFCKS-8re6g1Zbhs8N9D_tDMENqXPeNGRS_0dU6tzz50T8A@mail.gmail.com>
 <20160322162222.GF2099@lahna.fi.intel.com> <CACPiFCKD_Nwut=GL-xOU5gN2k8Na7pFWdhsms85QsDTvvREJLw@mail.gmail.com>
 <1458668165.5907.28.camel@linux.intel.com> <CACPiFC+_TpiFFm+hYJd1tX4AnadxSj_KKOtDALjSj0_c8Qa2pA@mail.gmail.com>
 <20160323112532.GK2099@lahna.fi.intel.com> <CACPiFCJg0dx+zFnybtMBKH3jKrMQgwpfiD9Q8YhvpvC6YW68Yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33358 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752562AbcC1U5Y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Mar 2016 16:57:24 -0400
Received: by mail-oi0-f46.google.com with SMTP id d205so186951262oia.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2016 13:57:24 -0700 (PDT)
In-Reply-To: <CACPiFCJg0dx+zFnybtMBKH3jKrMQgwpfiD9Q8YhvpvC6YW68Yg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Took a few days but managed to get my hands on the laptop again.

A kernel built with CONFIG_X86_INTEL_LPSS=n boots with noapic in the
cmdline. Somehow during the build all the PINCTRL options in the
kernel got switched off, perhaps they depend on X86_INTEL_LPSS?

If I don't add noapic, we crash during boot.

I'm about to lose access to this laptop as I am traveling back home,
leaving it with its new owner...

cheers,


martin

On Wed, Mar 23, 2016 at 9:26 AM, Martin Langhoff
<martin.langhoff@gmail.com> wrote:
> On Wed, Mar 23, 2016 at 7:25 AM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
>> intel_lpss_* is actually different thing than setting
>>
>> CONFIG_X86_INTEL_LPSS=n
>>
>> which I suggest you try as well (you can't blacklist that).
>
> Good catch, ok will give it a shot. Will be tomorrow.
>
> cheers,
>
>
> m
> --
>  martin.langhoff@gmail.com
>  -  ask interesting questions
>  - don't get distracted with shiny stuff  - working code first
>  ~ http://docs.moodle.org/en/User:Martin_Langhoff



-- 
 martin.langhoff@gmail.com
 -  ask interesting questions
 - don't get distracted with shiny stuff  - working code first
 ~ http://docs.moodle.org/en/User:Martin_Langhoff
