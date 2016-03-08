From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Switch to devm_ioremap_resource()
Date: Tue, 8 Mar 2016 15:57:21 +0700
Message-ID: <CACRpkdbH7VSx7ix3FjB1_y1LVfJV805hSWVfUoE5_v+1NTLGwg@mail.gmail.com>
References: <20160228123056.GA12584@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:36293 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753938AbcCHI5W (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 03:57:22 -0500
Received: by mail-oi0-f48.google.com with SMTP id r187so6012072oih.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 00:57:22 -0800 (PST)
In-Reply-To: <20160228123056.GA12584@amitoj-Inspiron-3542>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On Sun, Feb 28, 2016 at 7:30 PM, Amitoj Kaur Chawla
<amitoj1606@gmail.com> wrote:

> Replace calls to devm_request_mem_region and devm_ioremap with a
> direct call to devm_ioremap_resource instead and modify error
> handling.

Patch applied, adding the timberdale: prefix.

Yours,
Linus Walleij
