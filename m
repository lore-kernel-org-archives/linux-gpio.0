From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: drop surplus PCI and USB dependencies
Date: Thu, 10 Dec 2015 18:37:27 +0100
Message-ID: <CACRpkdZmm92jiiF10Tn0+G_G5vvJ_g1kv7j1LLTVj2RC3zLePw@mail.gmail.com>
References: <1449435165-14020-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:35357 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752316AbbLJRh1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 12:37:27 -0500
Received: by obc18 with SMTP id 18so63349147obc.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 09:37:27 -0800 (PST)
In-Reply-To: <1449435165-14020-1-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Dec 6, 2015 at 9:52 PM, Andrew F. Davis <afd@ti.com> wrote:

> The PCI/USB expander menus already depend on PCI/USB, drop subdependecies
> on individual drivers.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>

Patch applied.

Yours,
Linus Walleij
