From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio-lynxpoint: Allow building as a module
Date: Fri, 29 Nov 2013 13:40:06 +0100
Message-ID: <CACRpkdYWqA7vBYcTFQKNxiE7fr3Q-pr2Mux9ki5xabs-NcK8jA@mail.gmail.com>
References: <20131127154606.5b6d6742@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:58406 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753528Ab3K2MkH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 07:40:07 -0500
Received: by mail-ob0-f181.google.com with SMTP id uy5so9901938obc.40
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 04:40:07 -0800 (PST)
In-Reply-To: <20131127154606.5b6d6742@endymion.delvare>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
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

Patch applied with Mika's ACK.

Yours,
Linus Walleij
