From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Fri, 20 Dec 2013 10:07:28 +0100
Message-ID: <CACRpkdbenc1+xaMiRbRcFokBscFdKdLB1UCfW-buQToKup2-zg@mail.gmail.com>
References: <CACRpkdYU_AV=E67cGcqqwiq4byOeJx+J+XDST3Mo_s5xmfDTnQ@mail.gmail.com>
	<1962407133.2003.1387161964453.JavaMail.root@mail>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:40234 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754720Ab3LTJH3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Dec 2013 04:07:29 -0500
Received: by mail-oa0-f44.google.com with SMTP id m1so2552413oag.31
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2013 01:07:28 -0800 (PST)
In-Reply-To: <1962407133.2003.1387161964453.JavaMail.root@mail>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>, Bruno Randolf <br1@einfach.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Seth Heasley <seth.heasley@intel.com>, Darren Hart <dvhart@linux.intel.com>, kernel <kernel@savoirfairelinux.com>

On Mon, Dec 16, 2013 at 3:46 AM, Vivien Didelot
<vivien.didelot@savoirfairelinux.com> wrote:
> [Me]
>> If we don't know if it will be modprobed or not on a certain system
>> we should keep it as is, but of the distro kernels all set
>> CONFIG_TS5500 to 'n' then we should add a dependency
>> like that.
>
> As it is an embedded platform, I don't think CONFIG_TS5500 is enabled
> on distro kernels.
>
> I hope it's a bit clearer. Let me know what is your advice on this.

Hm I think right now we should not fix what ain't broken and leave
it as it is. The module is not on any distros I've seen so they're
already avoiding to shit it it seems.

Yours,
Linus Walleij
