From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: tps65218: Make tps65218_gpio_output set proper
 output level
Date: Tue, 16 Feb 2016 15:58:56 +0100
Message-ID: <CACRpkdaExYQXrFD5nJ8fSeDVx8-EULKibqN5w+f1ydLKBB+PKQ@mail.gmail.com>
References: <1455538154.9793.2.camel@ingics.com>
	<1455538240.9793.4.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:34299 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932142AbcBPO70 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2016 09:59:26 -0500
Received: by mail-ob0-f178.google.com with SMTP id wb13so262616781obb.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2016 06:59:26 -0800 (PST)
In-Reply-To: <1455538240.9793.4.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Nicolas Saenz Julienne <nicolassaenzj@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 15, 2016 at 1:10 PM, Axel Lin <axel.lin@ingics.com> wrote:

> The .direction_output callback should set proper output level.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Obviously correct, patch applied.

Yours,
Linus Walleij
