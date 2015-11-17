From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: 74xx: fix a possible NULL dereference
Date: Tue, 17 Nov 2015 14:37:51 +0100
Message-ID: <CACRpkdZF6527SU8qhSnLraO3UVxpRuuovNXE4-DUq3ia5T0JPg@mail.gmail.com>
References: <1447273657-1668-1-git-send-email-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:35250 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752535AbbKQNhw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 08:37:52 -0500
Received: by obbnk6 with SMTP id nk6so6349197obb.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2015 05:37:51 -0800 (PST)
In-Reply-To: <1447273657-1668-1-git-send-email-clabbe.montjoie@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Nov 11, 2015 at 9:27 PM, LABBE Corentin
<clabbe.montjoie@gmail.com> wrote:

> of_match_device could return NULL, and so cause a NULL pointer
> dereference later at line 132:
> priv->flags = (uintptr_t) of_id->data;
>
> Reported-by: coverity (CID 1324141)
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>

Patch applied.

Yours,
Linus Walleij
