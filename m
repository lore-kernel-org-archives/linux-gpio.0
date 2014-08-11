From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 10/14] gpio: delete unneeded test before of_node_put
Date: Mon, 11 Aug 2014 10:17:22 +0200
Message-ID: <CACRpkdb8+o0BA_3v9acBX0xybbZSK9zBPFCnjUnpbj=QHjmUyA@mail.gmail.com>
References: <1407492475-26283-10-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:57409 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751672AbaHKIRX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Aug 2014 04:17:23 -0400
Received: by mail-oa0-f52.google.com with SMTP id o6so5777744oag.25
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2014 01:17:22 -0700 (PDT)
In-Reply-To: <1407492475-26283-10-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>

On Fri, Aug 8, 2014 at 12:07 PM, Julia Lawall <Julia.Lawall@lip6.fr> wr=
ote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Of_node_put supports NULL as its argument, so the initial test is not
> necessary.
>
> Suggested by Uwe Kleine-K=C3=B6nig.

Patch applied.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
