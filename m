From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [RFC PATCH 1/1] gpio: pca953x: Allow interrupt support when
 compiled as module
Date: Thu, 27 Nov 2014 16:36:38 +0900
Message-ID: <CAAVeFu+Xdgt87YO=vftqGLQY=0Ta5ie9Q1baZzYe9GO5ScdFCQ@mail.gmail.com>
References: <1416492379-28433-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:33461 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752756AbaK0Hg7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Nov 2014 02:36:59 -0500
Received: by mail-ie0-f177.google.com with SMTP id rd18so4080797iec.36
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2014 23:36:58 -0800 (PST)
In-Reply-To: <1416492379-28433-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Nov 20, 2014 at 11:06 PM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:
> With commit 2fd36c55264926e268deb50f6de5f43fa5e490f7
> ("i2c: core: Map OF IRQ at probe time") it seems that there is no need
> to force this driver to be compiled into the kernel.
>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> ---
> This is completely untested, as I lack a board capable of running a v3.18-rcX
> kernel. But I noticed on an older kernel that this driver failed requesting
> irq 0 during kernel boot. 0 because it's irq parent was not yet probed (also
> a compiled in driver). With the mentioned commit this should work now.
> It is currently only in
> http://git.kernel.org/cgit/linux/kernel/git/wsa/linux.git/log/?h=i2c/for-next

Looks harmless to me, but could we have a Tested-by from someone who
can try this?
