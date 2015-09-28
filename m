From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: max730x: eliminate double free
Date: Mon, 28 Sep 2015 10:44:56 +0900
Message-ID: <CAAVeFu+rSS-C7560RZCqkRP-jCFYbAoG9sm_THSjipkaAS2aiA@mail.gmail.com>
References: <1443298700-28079-1-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:35516 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752864AbbI1BpR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2015 21:45:17 -0400
In-Reply-To: <1443298700-28079-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Sep 27, 2015 at 5:18 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> The function __max730x_remove is called from the remove functions of
> drivers/gpio/gpio-max7300.c and drivers/gpio/gpio-max7301.c.  In both
> cases, the probe function allocates ts using devm_kzalloc.  Explicitly
> freeing such a value with kfree will cause a double free.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
