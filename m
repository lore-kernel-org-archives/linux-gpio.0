From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] pinctrl: sirf: wrap all gpio banks into one gpio_chip
Date: Wed, 23 Apr 2014 22:03:39 +0200
Message-ID: <CACRpkdZOcdgiHxZW_+Do9kd7A_jOpTjEpwfL8Lj7wWjQ_V+o2g@mail.gmail.com>
References: <1397544229-20545-1-git-send-email-21cnbao@gmail.com>
	<1397544229-20545-2-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:41159 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753566AbaDWUDj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 16:03:39 -0400
Received: by mail-ob0-f175.google.com with SMTP id wp4so1586651obc.20
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 13:03:39 -0700 (PDT)
In-Reply-To: <1397544229-20545-2-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Barry Song <Baohua.Song@csr.com>

On Tue, Apr 15, 2014 at 8:43 AM, Barry Song <21cnbao@gmail.com> wrote:

> From: Barry Song <Baohua.Song@csr.com>
>
> all gpio banks are in one chip, that makes software clean in mapping
> irq and gpio.
>
> Signed-off-by: Barry Song <Baohua.Song@csr.com>

Patch applied!

Yours,
Linus Walleij
