From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: dln2: fix build breakage
Date: Wed, 13 May 2015 16:05:13 +0900
Message-ID: <CAAVeFuKzQOBZ4COcUuP4wOFhTB3J_XxTe3kVjKHJ6bbTpxGk4Q@mail.gmail.com>
References: <1431436825-31612-1-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:33708 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752925AbbEMHFe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2015 03:05:34 -0400
In-Reply-To: <1431436825-31612-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, kbuild test robot <fengguang.wu@intel.com>, kbuild-all@01.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, May 12, 2015 at 10:20 PM, Johan Hovold <johan@kernel.org> wrote:
> The dln2 driver was initialising a gpiolib private field, which is now
> gone.
>
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
