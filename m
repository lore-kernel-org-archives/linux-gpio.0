From: Martin Langhoff <martin.langhoff@gmail.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Tue, 22 Mar 2016 16:32:30 -0400
Message-ID: <CACPiFCL2rc-yMht2_CyPgLg35xamDobhzQVJjDed4FgpbX9gTA@mail.gmail.com>
References: <CACPiFCKv=QJ0t5e=9Wm4cC4Spynx-tVCiabL7AcbcOkp_w47fQ@mail.gmail.com>
 <20160322152218.GA2099@lahna.fi.intel.com> <CACPiFC+hDF0+9vPCrhvo079E6RCVVmZXTS1ziS-jHAAZJQ+wNg@mail.gmail.com>
 <20160322154950.GB2099@lahna.fi.intel.com> <CACPiFCKS-8re6g1Zbhs8N9D_tDMENqXPeNGRS_0dU6tzz50T8A@mail.gmail.com>
 <20160322162222.GF2099@lahna.fi.intel.com> <CACPiFCKD_Nwut=GL-xOU5gN2k8Na7pFWdhsms85QsDTvvREJLw@mail.gmail.com>
 <1458668165.5907.28.camel@linux.intel.com> <CACPiFC+_TpiFFm+hYJd1tX4AnadxSj_KKOtDALjSj0_c8Qa2pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33946 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751359AbcCVUcv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 16:32:51 -0400
Received: by mail-oi0-f42.google.com with SMTP id i17so23415696oib.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2016 13:32:50 -0700 (PDT)
In-Reply-To: <CACPiFC+_TpiFFm+hYJd1tX4AnadxSj_KKOtDALjSj0_c8Qa2pA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

ok so I've tried blacklisting all the modules suggested here, but they
do not make a difference. What does make a difference is to have
pinctrl_cherryview (as a module and ) blacklisted, _and_ noapic.

dmesg
http://fpaste.org/343894/78237145/

acpidump
http://fpaste.org/343898/14586785/


big thanks for all the help so far,



martin

On Tue, Mar 22, 2016 at 1:53 PM, Martin Langhoff
<martin.langhoff@gmail.com> wrote:
> On Tue, Mar 22, 2016 at 1:36 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>> # CONFIG_X86_INTEL_LPSS is not set
>
> adding intel_lpss,intel_lpss_acpi,intel_lpss_pci to blacklisted
> modules in kernel command line did not change things for the better.
>
> Compiles are slow and awkward on the limited setup I have (visiting
> relatives, etc)... I'm trying to get a 4.6.6 kernel built with
> pinctrl_cherryview as module so I can test that case...
>
> All tests so far on Fedora's kernel-4.6.6-300-fc23 rpm, frobbing kernel params.
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
