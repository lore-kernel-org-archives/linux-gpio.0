From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: ath79: Check valid gpio count for both DT and
 non-DT cases
Date: Thu, 25 Feb 2016 10:10:30 +0100
Message-ID: <CACRpkdZeMTfLK6NGt8cCsfTrWmCZdrHHuNdJPsoHMHwN493G5A@mail.gmail.com>
References: <1455932887.31674.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:34133 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758808AbcBYJKb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 04:10:31 -0500
Received: by mail-ob0-f181.google.com with SMTP id ts10so43360110obc.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 01:10:30 -0800 (PST)
In-Reply-To: <1455932887.31674.0.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alban Bedel <albeu@free.fr>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Feb 20, 2016 at 2:48 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Move the code checking valid gpio count to cover both DT and non-DT cases.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with Alban's ACK.

Yours,
Linus Walleij
