From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xgene: Prevent NULL pointer dereference
Date: Tue, 22 Mar 2016 15:02:06 +0100
Message-ID: <CACRpkdatxK5pZHgb3soO2qxr7H7OvZdrjR6+q8=UN2n-se9JbA@mail.gmail.com>
References: <1458561830.3490.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:34186 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758623AbcCVOCI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 10:02:08 -0400
Received: by mail-ob0-f182.google.com with SMTP id ts10so201720930obc.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2016 07:02:07 -0700 (PDT)
In-Reply-To: <1458561830.3490.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Feng Kan <fkan@apm.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 21, 2016 at 1:03 PM, Axel Lin <axel.lin@ingics.com> wrote:

> platform_get_resource() can return NULL, thus add NULL test to prevent NULL
> pointer dereference.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied for fixes.

Yours,
Linus Walleij
