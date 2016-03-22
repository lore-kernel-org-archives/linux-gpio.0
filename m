From: Martin Langhoff <martin.langhoff@gmail.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Tue, 22 Mar 2016 12:59:15 -0400
Message-ID: <CACPiFCKD_Nwut=GL-xOU5gN2k8Na7pFWdhsms85QsDTvvREJLw@mail.gmail.com>
References: <CACPiFCKv=QJ0t5e=9Wm4cC4Spynx-tVCiabL7AcbcOkp_w47fQ@mail.gmail.com>
 <20160322152218.GA2099@lahna.fi.intel.com> <CACPiFC+hDF0+9vPCrhvo079E6RCVVmZXTS1ziS-jHAAZJQ+wNg@mail.gmail.com>
 <20160322154950.GB2099@lahna.fi.intel.com> <CACPiFCKS-8re6g1Zbhs8N9D_tDMENqXPeNGRS_0dU6tzz50T8A@mail.gmail.com>
 <20160322162222.GF2099@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:36683 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751242AbcCVQ7g (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 12:59:36 -0400
Received: by mail-oi0-f44.google.com with SMTP id r187so183586550oih.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2016 09:59:35 -0700 (PDT)
In-Reply-To: <20160322162222.GF2099@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Tue, Mar 22, 2016 at 12:22 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Can you also disable sdhci:
>
> CONFIG_MMC_SDHCI=n
> CONFIG_MMC_SDHCI_PCI=n
> CONFIG_MMC_SDHCI_ACPI=n
>
> and see if that changes anything.

I blacklisted those, and the call trace changed and shortened, but
we're still panicking.

setup_IO_APIC
clear_IO_APIC
apic_bsp_setup
native_mp_prepare_cpus

> If not, please blacklist pinctrl-cherryview.c and send me full dmesg of
> the boot and acpidump if possible.

Working on that...

>> This is an Acer Aspire One 11 Cloudbook Series AO1-131-C1G9 Model N15V1 .
>
> Thanks, I'll try if I can purchase similar machine here and debug it
> further.

it's an alright device for a nephew who wants to start coding in
python. If you get it to boot, that is :-)

cheers,



martin
-- 
 martin.langhoff@gmail.com
 -  ask interesting questions
 - don't get distracted with shiny stuff  - working code first
 ~ http://docs.moodle.org/en/User:Martin_Langhoff
