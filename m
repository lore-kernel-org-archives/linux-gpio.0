From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH gpio] gpio-amd8111: add release_region on ioport_map failure
Date: Mon, 19 Jan 2015 09:49:16 +0100
Message-ID: <CACRpkdazJfiZSakpbPyRC9nbasF4s_PQp7hvWyUTbfM3BjVfVw@mail.gmail.com>
References: <1421654748-32141-1-git-send-email-varkabhadram@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:45309 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751223AbbASItR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jan 2015 03:49:17 -0500
Received: by mail-ie0-f172.google.com with SMTP id rd18so2737872iec.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2015 00:49:16 -0800 (PST)
In-Reply-To: <1421654748-32141-1-git-send-email-varkabhadram@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Varka Bhadram <varkabhadram@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Varka Bhadram <varkab@cdac.in>

On Mon, Jan 19, 2015 at 9:05 AM,  <varkabhadram@gmail.com> wrote:

> From: Varka Bhadram <varkab@cdac.in>
>
> Commit ffe4770b9b3483f74 ("gpio-amd8111: check ioport_map return value")
> adds the error check on ioport_map(). It doesnt release the requested region.
>
> On failure this patch release the region that has requested before.
>
> Signed-off-by: Varka Bhadram <varkab@cdac.in>
> Reported-by: Alexandre Courbot <gnurou@gmail.com>

Patch applied.

Yours,
Linus Walleij
