From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: rcar: Include linux/of.h header
Date: Wed, 16 Oct 2013 13:10:26 +0200
Message-ID: <CACRpkdZScC1+Bsk6M0NnW1eop6z+baJs-8L0FgGCs3M5_ddwyQ@mail.gmail.com>
References: <1381917902-6829-1-git-send-email-sachin.kamat@linaro.org>
	<1381917902-6829-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:50702 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760543Ab3JPLK1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2013 07:10:27 -0400
Received: by mail-ie0-f170.google.com with SMTP id at1so972167iec.15
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2013 04:10:27 -0700 (PDT)
In-Reply-To: <1381917902-6829-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Oct 16, 2013 at 12:05 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:

> 'of_match_ptr' is defined in linux/of.h. Include it explicitly to
> avoid build breakage in the future.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Patch applied.

Yours,
Linus Walleij
