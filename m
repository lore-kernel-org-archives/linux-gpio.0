From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: Remove unneeded header includes
Date: Fri, 12 Feb 2016 13:57:30 +0100
Message-ID: <CACRpkdZPi=cATzOmgTawa=pYhBVsTF49KYTYg6L==K4kt_+-fQ@mail.gmail.com>
References: <20160212111313.514dc4ee@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:34449 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752460AbcBLM5a (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2016 07:57:30 -0500
Received: by mail-ob0-f180.google.com with SMTP id wb13so120180973obb.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2016 04:57:30 -0800 (PST)
In-Reply-To: <20160212111313.514dc4ee@endymion>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>

On Fri, Feb 12, 2016 at 11:13 AM, Jean Delvare <jdelvare@suse.de> wrote:

> pinctrl-intel doesn't use anything from <linux/init.h>,
> <linux/acpi.h>, <linux/gpio.h> or <linux/pm.h>, so it should not
> include these header files.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
