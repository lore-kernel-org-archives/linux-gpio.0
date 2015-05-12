From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/23] gpio: sysfs: reduce gpiochip-export locking scope
Date: Tue, 12 May 2015 10:05:32 +0200
Message-ID: <CACRpkdYxd79woHfxzjtKw6=16sUwBQuc7q6Phf47tEoxd0DCfQ@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-6-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:33681 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932076AbbELIFd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 04:05:33 -0400
Received: by oica37 with SMTP id a37so124290604oic.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 01:05:32 -0700 (PDT)
In-Reply-To: <1430752248-15401-6-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> Reduce scope of sysfs_lock protection during chip export and unexport,
> which is only needed to prevent gpiod (re-)exports during chip removal.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied with some manual interventions.
Pls check result!

Yours,
Linus Walleij
