From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: 104-idi-48: Allow IRQ sharing
Date: Thu, 28 Jan 2016 09:43:50 +0100
Message-ID: <CACRpkdan5BbY5LNoJsyFAwQpvMYrEGW4WsG2Tk_KMngb-Rm29Q@mail.gmail.com>
References: <20160120185731.GA10340@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:33529 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934860AbcA1Inu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2016 03:43:50 -0500
Received: by mail-ob0-f178.google.com with SMTP id is5so29926967obc.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2016 00:43:50 -0800 (PST)
In-Reply-To: <20160120185731.GA10340@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jan 20, 2016 at 7:57 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES 104-IDI-48 can differentiate between its own and other
> devices' interrupt requests. Therefore, IRQ sharing is possible and
> should be permitted.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
