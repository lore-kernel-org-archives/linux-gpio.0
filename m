From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2 v3] Documentation: gpio: board: describe the con_id parameter
Date: Tue, 8 Sep 2015 15:46:51 +0200
Message-ID: <CACRpkdZgAt1dBUKkT6-TPf5Oh-R2WoFqyFyLmF54xT9zqn=fwQ@mail.gmail.com>
References: <1441217230-4530-1-git-send-email-dirk.behme@gmail.com>
	<1441217230-4530-2-git-send-email-dirk.behme@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:32809 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754356AbbIHNqw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2015 09:46:52 -0400
Received: by obbbh8 with SMTP id bh8so83473738obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2015 06:46:51 -0700 (PDT)
In-Reply-To: <1441217230-4530-2-git-send-email-dirk.behme@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Sep 2, 2015 at 8:07 PM, Dirk Behme <dirk.behme@gmail.com> wrote:

> The con_id parameter has to match the GPIO description and is automatically
> extended by the GPIO suffix if not NULL. I had to look into the code to
> understand this and properly find the GPIO I've been looking for, so document
> this.
>
> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Yours,
Linus Walleij
