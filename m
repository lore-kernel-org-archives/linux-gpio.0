From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pch_gpio: set value before enabling output direction
Date: Thu, 27 Mar 2014 10:22:40 +0100
Message-ID: <CACRpkdZVwKtXVhrT2f-t8Y4VwoOkVCfuJJCVbbE0A4f0Nv3frA@mail.gmail.com>
References: <1395739967-8465-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:38992 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752049AbaC0JWl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Mar 2014 05:22:41 -0400
Received: by mail-ob0-f177.google.com with SMTP id wo20so3830631obc.22
        for <linux-gpio@vger.kernel.org>; Thu, 27 Mar 2014 02:22:40 -0700 (PDT)
In-Reply-To: <1395739967-8465-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Daniel Krueger <daniel.krueger@systec-electronic.com>

On Tue, Mar 25, 2014 at 10:32 AM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> From: Daniel Krueger <daniel.krueger@systec-electronic.com>
>
> This ensures that the output signal does not toggle if set to high.
>
> Signed-off-by: Daniel Krueger <daniel.krueger@systec-electronic.com>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>

Patch applied,

Alexander, would you consider doing a patch adding yourself
as maintainer of this driver in the MAINTAINERS file?

Yours,
Linus Walleij
