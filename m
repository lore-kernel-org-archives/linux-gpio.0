From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xtensa: fix build when XCHAL_HAVE_CP is 0
Date: Thu, 23 Jan 2014 09:46:42 +0100
Message-ID: <CACRpkdaGjr2CdHkQcv+L1HoGL16Eef0r7T2ru=1giw31_Bu4bA@mail.gmail.com>
References: <4fa4f5ee7ded179ab42bb1b028955252e4e307c2.1390459838.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:59784 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750734AbaAWIqn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2014 03:46:43 -0500
Received: by mail-ob0-f173.google.com with SMTP id vb8so1726593obc.18
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2014 00:46:43 -0800 (PST)
In-Reply-To: <4fa4f5ee7ded179ab42bb1b028955252e4e307c2.1390459838.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-xtensa@linux-xtensa.org

On Thu, Jan 23, 2014 at 7:50 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> In xtensa coprocessors may exist without coprocessor context, i.e. they cannot
> be disabled/enabled. In this case the RSR_CPENABLE/WSR_CPENABLE are undefined,
> thus breaking the build. Fix the build by adding dummy versions of
> enable_cp/disable_cp in this case.
>
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Patch applied for fixes, but I really don't like this compile-time
thing. It'd be better if your Xtensa code would adjust to different
hardware at runtime rather than compile time. This is the overall
kernel design pattern these days AFICT.

Yours,
Linus Walleij
