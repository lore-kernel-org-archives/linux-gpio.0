From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 0/7] Use devm_request_region
Date: Wed, 3 Feb 2016 09:26:13 +0900
Message-ID: <CAAVeFu+3u7aDfDHSkQ84JE_Av9hHGR0y4RRmEOi6s9XVtqMUhA@mail.gmail.com>
References: <cover.1454342087.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:37039 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752339AbcBCA0e (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Feb 2016 19:26:34 -0500
In-Reply-To: <cover.1454342087.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Feb 2, 2016 at 8:54 AM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:
> By the time request_region is called in several GPIO drivers, a
> corresponding device structure has already been allocated. The
> devm_request_region function should be used to help simplify the cleanup
> code and reduce the possible points of failure.
>
> William Breathitt Gray (7):
>   gpio: 104-dio-48e: Use devm_request_region
>   gpio: 104-idi-48: Use devm_request_region
>   gpio: 104-idio-16: Use devm_request_region
>   gpio: amd8111: Use devm_request_region
>   gpio: ich: Use devm_request_region
>   gpio: sch311x: Use devm_request_region
>   gpio: ws16c48: Use devm_request_region
>
>  drivers/gpio/gpio-104-dio-48e.c | 22 +++++++-----------
>  drivers/gpio/gpio-104-idi-48.c  | 22 +++++++-----------
>  drivers/gpio/gpio-104-idio-16.c | 22 +++++++-----------
>  drivers/gpio/gpio-amd8111.c     |  7 +++---
>  drivers/gpio/gpio-ich.c         | 51 ++++++++---------------------------------
>  drivers/gpio/gpio-sch311x.c     |  7 +++---
>  drivers/gpio/gpio-ws16c48.c     | 22 +++++++-----------
>  7 files changed, 47 insertions(+), 106 deletions(-)

Did a quick review and this looks all good, modulo the compile warning
on patch 6.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
