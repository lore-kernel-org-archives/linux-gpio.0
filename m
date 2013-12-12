From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio / ACPI: return -ENOENT when no mapping exists
Date: Thu, 12 Dec 2013 21:57:22 +0100
Message-ID: <CACRpkdYNm8DQzP2yCO7xCEdegRc4ymx_vznq8GTXGEO2uMX8YA@mail.gmail.com>
References: <1386669627-31365-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:46884 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751654Ab3LLU5X (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2013 15:57:23 -0500
Received: by mail-oa0-f46.google.com with SMTP id o6so1099997oag.33
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2013 12:57:22 -0800 (PST)
In-Reply-To: <1386669627-31365-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alex Courbot <acourbot@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>

On Tue, Dec 10, 2013 at 11:00 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> Doing this allows drivers to distinguish between a real error case (if
> there was an error when we tried to resolve the GPIO) and when the optional
> GPIO line was not available.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied with Alex's and Rafael's ACKs.

Yours,
Linus Walleij
