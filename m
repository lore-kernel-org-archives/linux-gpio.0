From: Martin Langhoff <martin.langhoff@gmail.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Tue, 22 Mar 2016 11:59:46 -0400
Message-ID: <CACPiFCKS-8re6g1Zbhs8N9D_tDMENqXPeNGRS_0dU6tzz50T8A@mail.gmail.com>
References: <CACPiFCKv=QJ0t5e=9Wm4cC4Spynx-tVCiabL7AcbcOkp_w47fQ@mail.gmail.com>
 <20160322152218.GA2099@lahna.fi.intel.com> <CACPiFC+hDF0+9vPCrhvo079E6RCVVmZXTS1ziS-jHAAZJQ+wNg@mail.gmail.com>
 <20160322154950.GB2099@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:34115 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752245AbcCVQAG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 12:00:06 -0400
Received: by mail-ob0-f180.google.com with SMTP id ts10so204600525obc.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2016 09:00:06 -0700 (PDT)
In-Reply-To: <20160322154950.GB2099@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is a cheap consumer laptop I thought I'd get Fedora on in half an
hour -- grand plans ;-) -- I don't have it rigged to capture dmsg of
the crash, no serial adapter with me.

On the kernel command line... lvm, root settings 'single`.

This is an Acer Aspire One 11 Cloudbook Series AO1-131-C1G9 Model N15V1 .



m

On Tue, Mar 22, 2016 at 11:49 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Tue, Mar 22, 2016 at 11:41:38AM -0400, Martin Langhoff wrote:
>> On Tue, Mar 22, 2016 at 11:22 AM, Mika Westerberg
>> <mika.westerberg@linux.intel.com> wrote:
>> > I think this is a known issue.
>> >
>> > Please disable dw_dmac from your .config (or blacklist the module):
>> >
>> >   CONFIG_DW_DMAC_CORE=n
>> >   CONFIG_DW_DMAC=n
>> >
>> > You can also enable pinctrl-cherryview.c.
>>
>> Thanks for the suggestion. Did not complete boot however, got a
>> slightly different call trace, but still no go. As that trace crossed
>> _prepare_cpus I tried adding nosmp, but we still crash in
>> acpi_init->acpi_scan_init->acpi_bus_scan->acpi_bus_attach
>>
>> Any other suggestion? lspci normal and verbose follow...
>
> Do you have anything special on the kernel command line? You should not
> do anything else than disable DW_DMAC. That is enough to prevent the
> DMA hang if that's the issue.
>
> Are you able to get dmesg of the crash?



-- 
 martin.langhoff@gmail.com
 -  ask interesting questions
 - don't get distracted with shiny stuff  - working code first
 ~ http://docs.moodle.org/en/User:Martin_Langhoff
