From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mark expected switch fall-throughs
Date: Mon, 16 Oct 2017 13:58:47 +0200
Message-ID: <CACRpkdY_WPpw7br9Dd2__QnJ_Dgev6bfVesR4Sc3=aWEz9qHTw@mail.gmail.com>
References: <20171013204353.GA27362@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:47025 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752088AbdJPL6s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2017 07:58:48 -0400
Received: by mail-io0-f180.google.com with SMTP id 101so15755612ioj.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2017 04:58:48 -0700 (PDT)
In-Reply-To: <20171013204353.GA27362@embeddedor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: Joel Stanley <joel@jms.id.au>, Alban Bedel <albeu@free.fr>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Oct 13, 2017 at 10:43 PM, Gustavo A. R. Silva
<garsilva@embeddedor.com> wrote:

> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
> where we are expecting to fall through.
>
> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>

Seems helpful. Patch applied.

Yours,
Linus Walleij
