From: Markus Mayer <markus.mayer@linaro.org>
Subject: Re: [PATCH] gpio: bcm281xx: Update MODULE_AUTHOR
Date: Wed, 5 Feb 2014 10:56:42 -0800
Message-ID: <CAPdLdqmb7_e04w-Mw8NiqjyYVaaPyd79Hn8HsWWQx0mEFKS8AQ@mail.gmail.com>
References: <1391463780-19840-1-git-send-email-markus.mayer@linaro.org>
	<CACRpkda=h=0bpMfHeq-zJs5nZ+740rz9jZChCk0OAHm=Jmw5AQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:47932 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751175AbaBES4o (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2014 13:56:44 -0500
Received: by mail-wi0-f180.google.com with SMTP id hm4so877387wib.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2014 10:56:43 -0800 (PST)
In-Reply-To: <CACRpkda=h=0bpMfHeq-zJs5nZ+740rz9jZChCk0OAHm=Jmw5AQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 5 February 2014 02:03, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Feb 3, 2014 at 10:43 PM, Markus Mayer <markus.mayer@linaro.org> wrote:
>
>> Add Broadcom's upstreaming mailing list address to MODULE_AUTHOR.
>>
>> Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
>
> Hm OK not that this is used very much, and nothing to argue about
> so patch applied.

Thanks. I am hopefully done the trivial changes to this driver now.

> However we do not really recognize corporate bodies as maintainers,
> only physical people whose GPG keys we can sign ... but I
> guess you wanted to convey that the driver is the work of several
> individuals inside BRCM and thus authors, while you take care
> of the maintenance.

That's exactly right.

> A patch to MAINTAINERS adding this to Christians entry for
> the SoCs or as a standalone entry with Markus as maintainer
> would be more important and usefule than this though, so I'm
> throwing out that challenge!

I'll talk to Christian about this and see what we can come up with.

Regards,
-Markus

-- 
Markus Mayer
Broadcom Landing Team
