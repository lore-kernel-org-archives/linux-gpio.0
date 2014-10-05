From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: Switch to using managed resources with devm_
Date: Sun, 5 Oct 2014 19:28:55 +0900
Message-ID: <CAAVeFuJsWJ5Yu8+cSS4VSpQyqFzxO57QCXdP-ZjoY_-RcuPC-A@mail.gmail.com>
References: <1412160393-5848-1-git-send-email-pramod.gurav@smartplayin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:49127 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751010AbaJEK3Q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Oct 2014 06:29:16 -0400
In-Reply-To: <1412160393-5848-1-git-send-email-pramod.gurav@smartplayin.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pramod Gurav <pramod.gurav@smartplayin.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Oct 1, 2014 at 7:46 PM, Pramod Gurav
<pramod.gurav@smartplayin.com> wrote:
> This change switches to devm_request_region to request region
> and hence simplifies the module unload and does away with
> release_region in remove function.

Your subject line should probably start with "gpio: cs5535:"

Otherwise,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
