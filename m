From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 02/23] gpio: clean up gpiochip_remove
Date: Tue, 12 May 2015 09:58:24 +0200
Message-ID: <CACRpkdZK4fQPap3mrK6rwuR5WW4FHVofbWLmPMFDgwWhYqjMWw@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-3-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:34736 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932129AbbELH6Y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 03:58:24 -0400
Received: by obfe9 with SMTP id e9so118564748obf.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 00:58:24 -0700 (PDT)
In-Reply-To: <1430752248-15401-3-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> Clean up gpiochip_remove somewhat and only output warning about removing
> chip with GPIOs requested once.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
