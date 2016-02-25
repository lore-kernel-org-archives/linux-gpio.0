From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: brcmstb: Use list_for_each_entry at appropriate places
Date: Thu, 25 Feb 2016 10:29:32 +0100
Message-ID: <CACRpkdZoYbCAGTNTXdhFqA3dD1ivjOdyKTPiM2fvX=w9-EMjYw@mail.gmail.com>
References: <1455933037.31674.2.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:33867 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760422AbcBYJ3d (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 04:29:33 -0500
Received: by mail-oi0-f53.google.com with SMTP id m82so35835287oif.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 01:29:32 -0800 (PST)
In-Reply-To: <1455933037.31674.2.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Feb 20, 2016 at 2:50 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Use list_for_each_entry to simplify the code a bit.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with Gregory's ACK.

Yours,
Linus Walleij
