From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: syscon: fix a possible NULL dereference
Date: Mon, 9 Nov 2015 09:23:12 +0900
Message-ID: <CAAVeFuK6aypN7E6b6n_gFn0EwK7RKnTyzvxZZ=YWD3TtwNu-Mw@mail.gmail.com>
References: <1446739355-25849-1-git-send-email-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:36700 "EHLO
	mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751417AbbKIAXd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Nov 2015 19:23:33 -0500
In-Reply-To: <1446739355-25849-1-git-send-email-clabbe.montjoie@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Nov 6, 2015 at 1:02 AM, LABBE Corentin
<clabbe.montjoie@gmail.com> wrote:
> of_match_device could return NULL, and so cause a NULL pointer
> dereference later at line 199:
> priv->flags = of_id->data;
>
> Reported-by: coverity (CID 1324140)
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>

Same (optional) suggestion as the 74xx-mmio patch.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
