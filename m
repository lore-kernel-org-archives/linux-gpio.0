From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFT] gpio: amdpt: Convert to use gpio-generic
Date: Tue, 15 Mar 2016 09:47:42 +0100
Message-ID: <CACRpkdYM7MJqi4EKnY774cqJiUZn370tqQ-1Abth3ifsJWa=Yg@mail.gmail.com>
References: <1456754401.25756.2.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36751 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932247AbcCOIro (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2016 04:47:44 -0400
Received: by mail-oi0-f52.google.com with SMTP id r187so7642528oih.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2016 01:47:43 -0700 (PDT)
In-Reply-To: <1456754401.25756.2.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, YD Tseng <ltyu101@gmail.com>, Varka Bhadram <varkab@cdac.in>, Pramod Gurav <pramod.gurav@smartplayin.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Ken Xue <Ken.Xue@amd.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 29, 2016 at 3:00 PM, Axel Lin <axel.lin@ingics.com> wrote:

> Use gpio-generic to simplify this driver.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
> Hi YD,
> I don't have this h/w for test.
> I'd appreciate if you can help to review and test this patch.

Adding some random people working with AMD hardware to the
To: line.

If noone provides a test tag I will anyway merge this patch, they can
find out any problems the hard way if they are not reading their
mails.

Yours,
Linus Walleij
