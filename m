From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: davinci: use irq_data_get_chip_type
Date: Thu, 28 Jan 2016 15:29:53 +0100
Message-ID: <CACRpkdZQEG2GU+OtMECpZ9JcckdJjoKfHu+UyHHGd9GFntRBoA@mail.gmail.com>
References: <4cc3a3a7a74c7a1894892a85aa7eabbd1534fe96.1451484758.git.geliangtang@163.com>
	<ca4c79f0383786097cf59da27432eb619325002b.1451484758.git.geliangtang@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:34973 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965436AbcA1O3y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2016 09:29:54 -0500
Received: by mail-ob0-f181.google.com with SMTP id ny8so14972689obc.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2016 06:29:53 -0800 (PST)
In-Reply-To: <ca4c79f0383786097cf59da27432eb619325002b.1451484758.git.geliangtang@163.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geliang Tang <geliangtang@163.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Dec 30, 2015 at 3:16 PM, Geliang Tang <geliangtang@163.com> wrote:

> Use irq_data_get_chip_type() instead of container_of().
>
> Signed-off-by: Geliang Tang <geliangtang@163.com>

Patch applied with Grygorii's and Santosh's tags.

Yours,
Linus Walleij
