From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] Documentation: gpio: Update ACPI part of the document
 to mention _DSD
Date: Wed, 8 Apr 2015 16:47:17 +0200
Message-ID: <CACRpkdYHtW1=0ZObW+WngJ=ONAVXRyRLRFpyveLg93R=4fQ2Hg@mail.gmail.com>
References: <1427875996-216926-1-git-send-email-mika.westerberg@linux.intel.com>
	<20150404112757.04d9f5fd@lwn.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:37346 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753562AbbDHOrS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Apr 2015 10:47:18 -0400
Received: by igblo3 with SMTP id lo3so40181630igb.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2015 07:47:17 -0700 (PDT)
In-Reply-To: <20150404112757.04d9f5fd@lwn.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, Darren Hart <dvhart@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>

On Sat, Apr 4, 2015 at 11:27 AM, Jonathan Corbet <corbet@lwn.net> wrote:
> On Wed,  1 Apr 2015 11:13:16 +0300
> Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
>
>> With ACPI 5.1 _DSD (Device Specific Data) it is now possible to name
>> functions just like Device Tree is doing. Make sure that the documentation
>> mentions _DSD as the recommended way to describe GPIOs in ACPI systems.
>
> OK, I've applied this to the docs tree, thanks.

Aha Jon takes it, thx, Acked-by.

Yours,
Linus Walleij
