From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio-cs5535: Simplify dependencies
Date: Wed, 12 Mar 2014 15:42:16 +0100
Message-ID: <CACRpkdZee-2AG-2J+jvoQXYuF8s8PT_ViXE+TJwprxxo-SU5WQ@mail.gmail.com>
References: <20140307221137.248b47ad@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:58516 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754464AbaCLOmS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Mar 2014 10:42:18 -0400
Received: by mail-oa0-f43.google.com with SMTP id g12so10305219oah.30
        for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2014 07:42:16 -0700 (PDT)
In-Reply-To: <20140307221137.248b47ad@endymion.delvare>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, Mar 7, 2014 at 10:11 PM, Jean Delvare <jdelvare@suse.de> wrote:

> The bus and architecture dependencies are already on MFD_CS5535, so
> there is no need to repeat them here.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> ---
> Changes since v1:
>  * Drop dependency on PCI too.

OK patch applied, let's see if something explodes ;-)

Yours,
Linus Walleij
