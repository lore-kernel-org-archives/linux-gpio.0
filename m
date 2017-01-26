From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] pinctrl: baytrail: Fix debugfs offset output
Date: Thu, 26 Jan 2017 16:44:41 +0100
Message-ID: <CACRpkdZQNfyfSDHm4srA46ThUzzO6LSrM+mcGU+vi0rR7-KTqA@mail.gmail.com>
References: <20170126131754.29630-1-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:36504 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752764AbdAZPon (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2017 10:44:43 -0500
Received: by mail-io0-f180.google.com with SMTP id j13so39349765iod.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2017 07:44:43 -0800 (PST)
In-Reply-To: <20170126131754.29630-1-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jan 26, 2017 at 2:17 PM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> Apparently each GPIO pad's register are 16 bytes, so multiply the pad_map
> by that. The same is done in byt_gpio_reg the only other place where
> pad_map is used.
>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>

Patch applied.

Yours,
Linus Walleij
