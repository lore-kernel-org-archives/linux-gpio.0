From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: 104-idio-16: Use lowercase symbol names for const variables
Date: Mon, 9 Nov 2015 08:53:04 +0900
Message-ID: <CAAVeFuJT7uxbQ_rf2o=6w4Ub3aW4Lhn_ED_JQZ+TNpORAVom8A@mail.gmail.com>
References: <20151104123008.GA15302@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:36650 "EHLO
	mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751348AbbKHXxY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Nov 2015 18:53:24 -0500
In-Reply-To: <20151104123008.GA15302@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Nov 4, 2015 at 9:30 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:
> To prevent confusion and to match existing coding style used in other
> gpio drivers symbol names within the 104-idio-16 gpio driver should be
> lowercase.

... and for the same styling reasons "GPIO" should be spelled in
uppercase in your commit message. ;)

Apart from that this patch seems harmless and the repositioning of
some constant declarations is also welcome.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
