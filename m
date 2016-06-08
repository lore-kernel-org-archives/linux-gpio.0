From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: tegra: Make lockdep class file-scoped
Date: Wed, 8 Jun 2016 13:41:05 +0200
Message-ID: <CACRpkdadWc68-vqZejwBwTA2agFCSxAzxA1V5s4KcwSZFwarCg@mail.gmail.com>
References: <20160606165627.32676-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:34197 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932604AbcFHLlH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2016 07:41:07 -0400
Received: by mail-oi0-f50.google.com with SMTP id e72so7953991oib.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jun 2016 04:41:07 -0700 (PDT)
In-Reply-To: <20160606165627.32676-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>

On Mon, Jun 6, 2016 at 6:56 PM, Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Commit b546be0db955 ("gpio: tegra: Get rid of all file scoped global
> variables") moved all file scoped variables into the driver-private
> structure to allow potentially multiple instances of the driver. The
> change also included turning the lockdep class into a driver-private
> field, which doesn't work and produces error messages such as this:
>
>         [    0.142310] BUG: key ffff8000fb3f7ab0 not in .data!
>
> Make the lockdep class file-scoped again to fix this issue.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied for fixes.

Yours,
Linus Walleij
