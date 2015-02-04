From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 10/15] gpio: kconfig: replace PPC_OF with PPC
Date: Wed, 4 Feb 2015 11:07:12 +0100
Message-ID: <CACRpkdZWTmacX_H+ji3K4zm0z3WwyKJrBsbEMcnkbT1DntjS6Q@mail.gmail.com>
References: <1422712065-9403-1-git-send-email-haokexin@gmail.com>
	<1422712065-9403-11-git-send-email-haokexin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:42750 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752060AbbBDKHN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Feb 2015 05:07:13 -0500
Received: by mail-oi0-f48.google.com with SMTP id v63so510126oia.7
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2015 02:07:12 -0800 (PST)
In-Reply-To: <1422712065-9403-11-git-send-email-haokexin@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kevin Hao <haokexin@gmail.com>
Cc: "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>

On Sat, Jan 31, 2015 at 2:47 PM, Kevin Hao <haokexin@gmail.com> wrote:

> The PPC_OF is a ppc specific option which is used to mean that the
> firmware device tree access functions are available. Since all the
> ppc platforms have a device tree, it is aways set to 'y' for ppc.
> So it makes no sense to keep a such option in the current kernel.
> Replace it with PPC.
>
> Signed-off-by: Kevin Hao <haokexin@gmail.com>

Patch applied.

Yours,
Linus Walleij
