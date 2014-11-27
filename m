From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-tz1090: fix error handling of irq_of_parse_and_map
Date: Thu, 27 Nov 2014 14:35:27 +0100
Message-ID: <CACRpkdZsPKMCm1wv09xTPb3j1MbRRiJaeG9A7OjX+e4PreKSwA@mail.gmail.com>
References: <20141114213256.GA24709@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:45437 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750927AbaK0Nf2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Nov 2014 08:35:28 -0500
Received: by mail-ig0-f170.google.com with SMTP id r2so10121855igi.5
        for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2014 05:35:27 -0800 (PST)
In-Reply-To: <20141114213256.GA24709@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dtor@chromium.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, James Hogan <james.hogan@imgtec.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Nov 14, 2014 at 10:32 PM, Dmitry Torokhov <dtor@chromium.org> wrote:

> irq_of_parse_and_map() returns 0 on error, so testing for negative
> result never works.
>
> Signed-off-by: Dmitry Torokhov <dtor@chromium.org>

Patch applied with James' ACK.

Yours,
Linus Walleij
