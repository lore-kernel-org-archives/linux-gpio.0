From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: 104-idio-16: Use lowercase symbol names for
 const variables
Date: Wed, 18 Nov 2015 14:56:38 +0100
Message-ID: <CACRpkdbaiNZxFJ_HKx7cCL9yrsumWH3tdb1ua2OA315x0k_Yyg@mail.gmail.com>
References: <20151117235815.GA9477@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:33747 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754415AbbKRN4j (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Nov 2015 08:56:39 -0500
Received: by obbww6 with SMTP id ww6so33556976obb.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2015 05:56:39 -0800 (PST)
In-Reply-To: <20151117235815.GA9477@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Nov 18, 2015 at 12:58 AM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> To prevent confusion, and to match the existing coding style used in
> other GPIO drivers, symbol names within the 104-idio-16 GPIO driver
> should be lowercase.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Changes in v2:
>   - Rebase to resolve conflict with commit 68d33ef.
>   - Lowercase const variables introduced in commit 68d33ef.
>   - Utilize BIT macro to match coding style of commit 68d33ef.

Patch applied.

Yours,
Linus Walleij
