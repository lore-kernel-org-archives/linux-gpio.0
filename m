From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio-lynxpoint: Allow building as a module
Date: Fri, 29 Nov 2013 11:27:23 +0100
Message-ID: <CACRpkdZYxsEn=YHG9jLnggEXKoskfvijHYe2-=i2fxf23Q2N3w@mail.gmail.com>
References: <20131127154606.5b6d6742@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:57216 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751235Ab3K2K1Y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 05:27:24 -0500
Received: by mail-ob0-f180.google.com with SMTP id wo20so9903937obc.11
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 02:27:23 -0800 (PST)
In-Reply-To: <20131127154606.5b6d6742@endymion.delvare>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Nov 27, 2013 at 3:46 PM, Jean Delvare <jdelvare@suse.de> wrote:

> Change CONFIG_GPIO_LYNXPOINT from bool to tristate so that the
> gpio-lynxpoint driver can be built as a module.
>
> Add the required glue: an exit function to unregister the driver, and
> module information.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Hm I think Mika is working on this driver now, Mika can you have
a look at this patch?

Yours,
Linus Walleij
