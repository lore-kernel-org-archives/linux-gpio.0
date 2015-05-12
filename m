From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 23/23] gpio: sysfs: move irq trigger flags to
 class-device data
Date: Tue, 12 May 2015 10:45:34 +0200
Message-ID: <CACRpkdb4OJhHBsCXmBUYPJvcRH3vQj4EnJ9JV999O1kLEahS2Q@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-24-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:32814 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932291AbbELIpe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 04:45:34 -0400
Received: by obblk2 with SMTP id lk2so287053obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 01:45:34 -0700 (PDT)
In-Reply-To: <1430752248-15401-24-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> Move irq trigger flags, which as sysfs-interface specific, to the class
> device data.
>
> This avoids accessing the gpio-descriptor flags field using non-atomic
> operations without any locking, and allows for a more clear separation
> of the sysfs interface from gpiolib core.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
