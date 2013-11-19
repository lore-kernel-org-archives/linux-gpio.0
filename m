From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: fix memory leak in error path
Date: Tue, 19 Nov 2013 09:24:18 +0100
Message-ID: <CACRpkda=a0=vpjg5_ZL0_jq--sArSG34iPjeb+jHS5WAs4HA8A@mail.gmail.com>
References: <1384374039-18795-1-git-send-email-mpn@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:38018 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751290Ab3KSIYS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 03:24:18 -0500
Received: by mail-ob0-f171.google.com with SMTP id wp18so3605849obc.30
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2013 00:24:18 -0800 (PST)
In-Reply-To: <1384374039-18795-1-git-send-email-mpn@google.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michal Nazarewicz <mpn@google.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christian Ruppert <christian.ruppert@abilis.com>

On Wed, Nov 13, 2013 at 9:20 PM, Michal Nazarewicz <mpn@google.com> wrote:

> From: Michal Nazarewicz <mina86@mina86.com>
>
> Signed-off-by: Michal Nazarewicz <mina86@mina86.com>

Good catch!

Patch applied.

Yours,
Linus Walleij
