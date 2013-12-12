From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Thu, 12 Dec 2013 20:50:41 +0100
Message-ID: <CACRpkdYU_AV=E67cGcqqwiq4byOeJx+J+XDST3Mo_s5xmfDTnQ@mail.gmail.com>
References: <CACRpkdZxjKamJvOMqdgN5zG5DrZvDNTCaVSiyaHSawkLxvUrFA@mail.gmail.com>
	<1395016599.620093.1386734749325.JavaMail.root@mail>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:48076 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750989Ab3LLTum (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2013 14:50:42 -0500
Received: by mail-ob0-f171.google.com with SMTP id wp18so958906obc.30
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2013 11:50:42 -0800 (PST)
In-Reply-To: <1395016599.620093.1386734749325.JavaMail.root@mail>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>, Bruno Randolf <br1@einfach.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Seth Heasley <seth.heasley@intel.com>, Darren Hart <dvhart@linux.intel.com>, kernel <kernel@savoirfairelinux.com>

On Wed, Dec 11, 2013 at 5:05 AM, Vivien Didelot
<vivien.didelot@savoirfairelinux.com> wrote:
>[Me]
>> drivers/gpio/gpio-ts5500.c - aha, created from
>>   arch/x86/platform/ts5500/ts5500.c, a "board file".
>
> Because of the lack of mechanism such as DMI, there's no safe way to verify the
> machine at the GPIO driver level. However, the board code (which registers the
> platform device) does a safe check by looking for some magic in the RAM.
>
> Would it be safer if we make GPIO_TS5500 depends on TS5500?

I don't know actually. How does it work with these x86 things?
Is it so that the system comes up and then you modprobe this driver?

In that case, do you bring up a fully generic kernel or do you have
to have it compiled with CONFIG_TS5500 set to 'y' and is that
done of a say, typical distro kernel?

If we don't know if it will be modprobed or not on a certain system
we should keep it as is, but of the distro kernels all set
CONFIG_TS5500 to 'n' then we should add a dependency
like that.

Yours,
Linus Walleij
