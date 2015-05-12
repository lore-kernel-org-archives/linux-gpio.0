From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 10/23] gpio: sysfs: release irq after class-device deregistration
Date: Tue, 12 May 2015 10:29:17 +0200
Message-ID: <CACRpkdYymmxNxY+D+s2DBda91FgRTSO-nq9_pTTRa8s7yav2+g@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-11-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:33005 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932114AbbELI3R (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 04:29:17 -0400
Received: by obblk2 with SMTP id lk2so25917obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 01:29:17 -0700 (PDT)
In-Reply-To: <1430752248-15401-11-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> Make sure to release any irq only after the class device has been
> deregistered.
>
> This avoids a race between gpiod_unexport and edge_store, where an irq
> could be allocated just before the gpio class device is deregistered
> without relying on FLAG_EXPORT and the global sysfs lock.
>
> Note that there is no need to hold the sysfs lock when releasing the irq
> after the class device is gone as kernfs will prevent further attribute
> operations.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
