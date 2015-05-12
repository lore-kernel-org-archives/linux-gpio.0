From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 17/23] gpio: sysfs: clean up edge_store
Date: Tue, 12 May 2015 10:37:51 +0200
Message-ID: <CACRpkdaVES2ZumZ=KU21qm+gGVD8pbaYEFeK-Psd-Jw=UuP4zQ@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-18-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33927 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932304AbbELIhv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 04:37:51 -0400
Received: by oiko83 with SMTP id o83so147145oik.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 01:37:51 -0700 (PDT)
In-Reply-To: <1430752248-15401-18-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> Remove goto from success path.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
