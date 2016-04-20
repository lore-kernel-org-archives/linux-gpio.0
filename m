From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] pinctrl: core: Fix build error due to devm_pinctrl_dev_match()
Date: Thu, 21 Apr 2016 00:00:52 +0200
Message-ID: <CACRpkdZ6=DDy4NeVPJy52S_YaMmqb2abiG6O1Yc66_dfkyJytw@mail.gmail.com>
References: <1461172673-29500-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:34334 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751237AbcDTWAy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 18:00:54 -0400
Received: by mail-oi0-f53.google.com with SMTP id k142so57328370oib.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 15:00:53 -0700 (PDT)
In-Reply-To: <1461172673-29500-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Apr 20, 2016 at 7:17 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> The closing bracket missing from final patch which causes the
> build break. Correcting the function.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Squashed this into the patch and pushed to build again.

Yours,
Linus Walleij
