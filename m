From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] Documentation: gpio: correct platform data section
Date: Mon, 13 Jul 2015 23:38:17 +0900
Message-ID: <CAAVeFuKxsyp4keKRFE3kKoYjmXPqznLhChaTPNHEg+TndAAweg@mail.gmail.com>
References: <1435694872-23860-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:34716 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751140AbbGMOih (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2015 10:38:37 -0400
In-Reply-To: <1435694872-23860-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel@savoirfairelinux.com

On Wed, Jul 1, 2015 at 5:07 AM, Vivien Didelot
<vivien.didelot@savoirfairelinux.com> wrote:
> The GPIO_LOOKUP_IDX macro has no dev_id parameter. Remove it from the
> examples and move the dev_id description under the gpiod_lookup_table
> example, where it belongs.
>
> The gpio_lookup_flags are prefixed GPIO_, not GPIOF_. So correct the
> flag list, and also add GPIO_ACTIVE_HIGH.
>
> Finally rename the board.txt documentation file to machine.txt, to be
> consistent with the related include/linux/gpio/machine.h file, similar
> to the regulator files.

Ok, consistency never hurts.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
