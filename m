From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 14/23] gpio: sysfs: clean up interrupt-interface implementation
Date: Tue, 12 May 2015 10:34:47 +0200
Message-ID: <CACRpkdbJ=HewrYxJrn=jBq7ugUEceS1vVi+ie9g8Jg2TBsi+hQ@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-15-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36227 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752731AbbELIes (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 04:34:48 -0400
Received: by obbkp3 with SMTP id kp3so21080obb.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 01:34:47 -0700 (PDT)
In-Reply-To: <1430752248-15401-15-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> Store the value sysfs entry in the gpiod data rather than in a global
> table accessed through an index stored in the overloaded gpio-descriptor
> flag field.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
