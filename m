From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] gpiolib: improvements in linehandle_create()
Date: Mon, 16 Oct 2017 13:47:07 +0200
Message-ID: <CACRpkdbhzoC86pJOjkVXMK4_XKSDdn63n=J2HoFCXHs0hrWOvQ@mail.gmail.com>
References: <20171016093230.5329-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:52004 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752364AbdJPLrI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2017 07:47:08 -0400
Received: by mail-io0-f172.google.com with SMTP id b186so15789552iof.8
        for <linux-gpio@vger.kernel.org>; Mon, 16 Oct 2017 04:47:08 -0700 (PDT)
In-Reply-To: <20171016093230.5329-1-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Oct 16, 2017 at 11:32 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Two minor fixes for creating user space line handles. The first patch
> simplifies checking the request flags. The second adds an additional
> sanitizing check.

Patches makes all kind of sense, so applied.

Yours,
Linus Walleij
