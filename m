From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio/sysfs: Add ID parameter for GPIO lines
Date: Mon, 15 Feb 2016 20:11:36 +0100
Message-ID: <CACRpkdZCrr+7zEEMtVwZHPywhtu2LUG+LCN9GY-JYCui4Uh1DQ@mail.gmail.com>
References: <1450370892-2517-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36173 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752848AbcBOTLh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2016 14:11:37 -0500
Received: by mail-ob0-f180.google.com with SMTP id gc3so124270403obb.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2016 11:11:37 -0800 (PST)
In-Reply-To: <1450370892-2517-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Dec 17, 2015 at 5:48 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> On named GPIOs there is currently no find out their numerical id.
>
> Because of this, a GPIO pin named like:
> /sys/class/gpio/PROG_B
>
> cannot be unexported by an application different than the one that
> exported it.
>
> This patch adds a new parameter to the GPIO line called id, that
> shows the numerical id of a given GPIO. E.g.:
>
> $ cat /sys/class/gpio/PROG_B/id
> 496
> $ echo 496 > unexport
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

NACK. I have just merged commits marking the entire sysfs
ABI deprecated. It will *NOT* be developed. Please help out in
evolving the character device instead.

c.f.
http://marc.info/?l=linux-gpio&m=145494198509404&w=2
http://marc.info/?l=linux-gpio&m=145554244502862&w=2

Yours,
Linus Walleij
